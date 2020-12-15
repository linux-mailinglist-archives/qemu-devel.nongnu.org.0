Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26A2DAE55
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 14:54:53 +0100 (CET)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpAmy-0006T3-6J
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 08:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgx-0008IJ-R0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kpAgr-0007G4-4w
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 08:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608040112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ey0Ay5MzC8zOj8mP1Wnup07FxCr1+p8UEYJnMwWIqTU=;
 b=WYBHA8WF/RA/RFy8rLKvPqSPT5xdL01J/xdbAwrJKFUKAunvUaSALeS0IbK6T8lu20oye7
 fW0tsUjGU25pVcev7SnZyRjKZg0h3mjShJDav+I9mrui/QdHFTfmQ83GjtUKKxINsvSTvG
 vt0OV3wJhg6S6ubHqlthAv76IosuDD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-mX8Kn3BwMoC5qcsHT6hzzg-1; Tue, 15 Dec 2020 08:48:29 -0500
X-MC-Unique: mX8Kn3BwMoC5qcsHT6hzzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01AE3107ACE4;
 Tue, 15 Dec 2020 13:48:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78B5819C47;
 Tue, 15 Dec 2020 13:48:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C78D9D92; Tue, 15 Dec 2020 14:48:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] coreaudio: always stop audio playback on shut down
Date: Tue, 15 Dec 2020 14:48:22 +0100
Message-Id: <20201215134826.5504-4-kraxel@redhat.com>
In-Reply-To: <20201215134826.5504-1-kraxel@redhat.com>
References: <20201215134826.5504-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

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
Message-id: 20201213130528.5863-3-vr_qemu@t-online.de
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/coreaudio.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index a5df95051461..79a9d40bf8ef 100644
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
2.27.0


