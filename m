Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559BE2F0652
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:14:16 +0100 (CET)
Received: from localhost ([::1]:54418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXjj-0005hd-B1
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZ5-0001os-V0
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:15 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZ3-0005S3-6B
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:15 -0500
Received: from fwd37.aul.t-online.de (fwd37.aul.t-online.de [172.20.27.137])
 by mailout09.t-online.de (Postfix) with SMTP id B00EA42C88CD;
 Sun, 10 Jan 2021 11:03:11 +0100 (CET)
Received: from linpower.localnet
 (bjcJ-iZYrhLnw4oQl9gXdXdEpFAQv7YsR2kzbqFSJNupXXu59HsCWCnXbJLCFf5gqX@[93.236.152.29])
 by fwd37.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZ1-3tUVxQ0; Sun, 10 Jan 2021 11:03:11 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 032FC20063B; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 13/23] paaudio: avoid to clip samples multiple times
Date: Sun, 10 Jan 2021 11:02:29 +0100
Message-Id: <20210110100239.27588-13-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bjcJ-iZYrhLnw4oQl9gXdXdEpFAQv7YsR2kzbqFSJNupXXu59HsCWCnXbJLCFf5gqX
X-TOI-EXPURGATEID: 150726::1610272991-0000D445-CF5BC4D1/0/0 CLEAN NORMAL
X-TOI-MSGID: 8be1d8f8-6c48-47c0-adf6-ed953f4b3fd7
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pulseaudio backend currently converts, clips and copies audio
playback samples in the mixing-engine sample buffer multiple
times.

In qpa_get_buffer_out() the function pa_stream_begin_write()
returns a rather large buffer and this allows audio_pcm_hw_run_out()
in audio/audio.c to copy all samples in the mixing-engine buffer
to the pulse audio buffer. Immediately after copying, qpa_write()
notices with a call to pa_stream_writable_size() that pulse audio
only needs a smaller part of the copied samples and ignores the
rest. This copy and ignore process happens several times for each
audio sample.

To fix this behaviour, call pa_stream_writable_size() in
qpa_get_buffer_out() to limit the number of samples
audio_pcm_hw_run_out() will convert. With this change the
pulseaudio pcm_ops functions put_buffer_out and write are no
longer identical and a separate qpa_put_buffer_out is needed.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index b052084698..229bcfcae8 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -207,6 +207,7 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     PAVoiceOut *p = (PAVoiceOut *) hw;
     PAConnection *c = p->g->conn;
     void *ret;
+    size_t l;
     int r;
 
     pa_threaded_mainloop_lock(c->mainloop);
@@ -214,12 +215,19 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
                     "pa_threaded_mainloop_lock failed\n");
 
+    l = pa_stream_writable_size(p->stream);
+    CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
+                       "pa_stream_writable_size failed\n");
+
     *size = -1;
     r = pa_stream_begin_write(p->stream, &ret, size);
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail,
                        "pa_stream_begin_write failed\n");
 
     pa_threaded_mainloop_unlock(c->mainloop);
+    if (*size > l) {
+        *size = l;
+    }
     return ret;
 
 unlock_and_fail:
@@ -228,6 +236,28 @@ unlock_and_fail:
     return NULL;
 }
 
+static size_t qpa_put_buffer_out(HWVoiceOut *hw, void *data, size_t length)
+{
+    PAVoiceOut *p = (PAVoiceOut *)hw;
+    PAConnection *c = p->g->conn;
+    int r;
+
+    pa_threaded_mainloop_lock(c->mainloop);
+
+    CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
+                    "pa_threaded_mainloop_lock failed\n");
+
+    r = pa_stream_write(p->stream, data, length, NULL, 0LL, PA_SEEK_RELATIVE);
+    CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail, "pa_stream_write failed\n");
+
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return length;
+
+unlock_and_fail:
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return 0;
+}
+
 static size_t qpa_write(HWVoiceOut *hw, void *data, size_t length)
 {
     PAVoiceOut *p = (PAVoiceOut *) hw;
@@ -861,7 +891,7 @@ static struct audio_pcm_ops qpa_pcm_ops = {
     .fini_out = qpa_fini_out,
     .write    = qpa_write,
     .get_buffer_out = qpa_get_buffer_out,
-    .put_buffer_out = qpa_write, /* pa handles it */
+    .put_buffer_out = qpa_put_buffer_out,
     .volume_out = qpa_volume_out,
 
     .init_in  = qpa_init_in,
-- 
2.26.2


