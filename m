Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F4B2D8D29
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 14:08:37 +0100 (CET)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koR76-0007fl-Ew
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 08:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4J-0006bq-7g
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:43 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:60556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4E-0000jw-SG
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:42 -0500
Received: from fwd00.aul.t-online.de (fwd00.aul.t-online.de [172.20.26.147])
 by mailout02.t-online.de (Postfix) with SMTP id 3E17B41ACBBC;
 Sun, 13 Dec 2020 14:05:37 +0100 (CET)
Received: from linpower.localnet
 (EqMuuyZfghrtOWu3ZDfGA0-nDjpg+7knaACgtqJ7Zl387cYtbBuX-t2TUo4OXxTQuS@[79.208.17.59])
 by fwd00.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koR49-0tR0IC0; Sun, 13 Dec 2020 14:05:33 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1FFCD200621; Sun, 13 Dec 2020 14:05:28 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/4] coreaudio: always stop audio playback on shut down
Date: Sun, 13 Dec 2020 14:05:27 +0100
Message-Id: <20201213130528.5863-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
References: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: EqMuuyZfghrtOWu3ZDfGA0-nDjpg+7knaACgtqJ7Zl387cYtbBuX-t2TUo4OXxTQuS
X-TOI-EXPURGATEID: 150726::1607864733-00010A86-B33264B6/0/0 CLEAN NORMAL
X-TOI-MSGID: d9ecac1a-d898-4006-bc84-a637a36737aa
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always stop audio playback and remove the playback callback when
QEMU exits.

On shut down the function coreaudio_fini_out() destroys the
coreaudio mutex but fails to stop audio playback and to remove the
audio playback callback, because function audio_is_cleaning_up()
always returns true when called from coreaudio_fini_out(). Now
there is a time window from pthread_mutex_destroy() to program
exit where Core Audio may call the audio playback callback which
tries to lock the destroyed coreaudio mutex. This leads to the
following error.

coreaudio: Could not lock voice for audioDeviceIOProc
Reason: Invalid argument

This bug was reported on the qemu-discuss mailing list.
https://lists.nongnu.org/archive/html/qemu-discuss/2020-10/msg00018.html

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/coreaudio.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index a5df950514..79a9d40bf8 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -593,22 +593,20 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
     int err;
     coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
 
-    if (!audio_is_cleaning_up()) {
-        /* stop playback */
-        if (isPlaying(core->outputDeviceID)) {
-            status = AudioDeviceStop(core->outputDeviceID, core->ioprocid);
-            if (status != kAudioHardwareNoError) {
-                coreaudio_logerr (status, "Could not stop playback\n");
-            }
-        }
-
-        /* remove callback */
-        status = AudioDeviceDestroyIOProcID(core->outputDeviceID,
-                                            core->ioprocid);
+    /* stop playback */
+    if (isPlaying(core->outputDeviceID)) {
+        status = AudioDeviceStop(core->outputDeviceID, core->ioprocid);
         if (status != kAudioHardwareNoError) {
-            coreaudio_logerr (status, "Could not remove IOProc\n");
+            coreaudio_logerr(status, "Could not stop playback\n");
         }
     }
+
+    /* remove callback */
+    status = AudioDeviceDestroyIOProcID(core->outputDeviceID,
+                                        core->ioprocid);
+    if (status != kAudioHardwareNoError) {
+        coreaudio_logerr(status, "Could not remove IOProc\n");
+    }
     core->outputDeviceID = kAudioDeviceUnknown;
 
     /* destroy mutex */
@@ -633,13 +631,11 @@ static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
         }
     } else {
         /* stop playback */
-        if (!audio_is_cleaning_up()) {
-            if (isPlaying(core->outputDeviceID)) {
-                status = AudioDeviceStop(core->outputDeviceID,
-                                         core->ioprocid);
-                if (status != kAudioHardwareNoError) {
-                    coreaudio_logerr (status, "Could not pause playback\n");
-                }
+        if (isPlaying(core->outputDeviceID)) {
+            status = AudioDeviceStop(core->outputDeviceID,
+                                     core->ioprocid);
+            if (status != kAudioHardwareNoError) {
+                coreaudio_logerr(status, "Could not pause playback\n");
             }
         }
     }
-- 
2.26.2


