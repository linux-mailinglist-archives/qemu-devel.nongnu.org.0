Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3648669C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:17:54 +0100 (CET)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UWX-0006cL-DG
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P2Q-00063j-Bw
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:26:26 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:49390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P2L-00074o-8f
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:26:26 -0500
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout07.t-online.de (Postfix) with SMTP id 919AF120CE;
 Thu,  6 Jan 2022 10:23:59 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5P03-0uANMX0; Thu, 6 Jan 2022 10:23:59 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E570E20062C; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 11/15] paaudio: reduce effective playback buffer size
Date: Thu,  6 Jan 2022 10:23:28 +0100
Message-Id: <20220106092332.7223-11-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461039-0000C4DD-34E3DC02/0/0 CLEAN NORMAL
X-TOI-MSGID: 0a245fd0-ebbc-49f8-96b9-c3632ef565ca
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 10:05:02 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Add the buffer_get_free pcm_ops function to reduce the effective
playback buffer size. All intermediate audio playback buffers
become temporary buffers.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 9df1e69c08..d94f858ec7 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -201,13 +201,11 @@ unlock_and_fail:
     return 0;
 }
 
-static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
+static size_t qpa_buffer_get_free(HWVoiceOut *hw)
 {
-    PAVoiceOut *p = (PAVoiceOut *) hw;
+    PAVoiceOut *p = (PAVoiceOut *)hw;
     PAConnection *c = p->g->conn;
-    void *ret;
     size_t l;
-    int r;
 
     pa_threaded_mainloop_lock(c->mainloop);
 
@@ -216,7 +214,6 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     if (pa_stream_get_state(p->stream) != PA_STREAM_READY) {
         /* wait for stream to become ready */
         l = 0;
-        ret = NULL;
         goto unlock;
     }
 
@@ -224,16 +221,33 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
                        "pa_stream_writable_size failed\n");
 
+unlock:
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return l;
+
+unlock_and_fail:
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return 0;
+}
+
+static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
+{
+    PAVoiceOut *p = (PAVoiceOut *)hw;
+    PAConnection *c = p->g->conn;
+    void *ret;
+    int r;
+
+    pa_threaded_mainloop_lock(c->mainloop);
+
+    CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
+                    "pa_threaded_mainloop_lock failed\n");
+
     *size = -1;
     r = pa_stream_begin_write(p->stream, &ret, size);
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail,
                        "pa_stream_begin_write failed\n");
 
-unlock:
     pa_threaded_mainloop_unlock(c->mainloop);
-    if (*size > l) {
-        *size = l;
-    }
     return ret;
 
 unlock_and_fail:
@@ -901,6 +915,7 @@ static struct audio_pcm_ops qpa_pcm_ops = {
     .init_out = qpa_init_out,
     .fini_out = qpa_fini_out,
     .write    = qpa_write,
+    .buffer_get_free = qpa_buffer_get_free,
     .get_buffer_out = qpa_get_buffer_out,
     .put_buffer_out = qpa_put_buffer_out,
     .volume_out = qpa_volume_out,
-- 
2.31.1


