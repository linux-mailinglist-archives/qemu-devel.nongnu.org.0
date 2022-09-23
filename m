Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7246C5E8237
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:59:29 +0200 (CEST)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obntY-0004E9-HH
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnYg-00034M-CQ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:54 -0400
Received: from mailout12.t-online.de ([194.25.134.22]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnYe-0005MG-IO
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:54 -0400
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout12.t-online.de (Postfix) with SMTP id 56C59C7F5;
 Fri, 23 Sep 2022 20:37:00 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXl-42wVBB0; Fri, 23 Sep 2022 20:36:57 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id A75B820061D; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 08/12] audio: swap audio_rate_get_bytes() function parameters
Date: Fri, 23 Sep 2022 20:36:36 +0200
Message-Id: <20220923183640.8314-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958217-88EA281F-2D3959C2/0/0 CLEAN NORMAL
X-TOI-MSGID: c6eb5db3-27d2-4ab4-bcd6-d65a43370eb9
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Swap the rate and info parameters of the audio_rate_get_bytes()
function to align the parameter order with the rest of the
audio_rate_*() functions.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c      | 2 +-
 audio/audio_int.h  | 2 +-
 audio/dbusaudio.c  | 4 ++--
 audio/noaudio.c    | 4 ++--
 audio/spiceaudio.c | 2 +-
 audio/wavaudio.c   | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 557538a7b7..233a86c440 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2275,7 +2275,7 @@ void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used)
     rate->bytes_sent += bytes_used;
 }
 
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
                             size_t bytes_avail)
 {
     size_t bytes;
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 97e20e8429..e87ce014a0 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -265,7 +265,7 @@ typedef struct RateCtl {
 void audio_rate_start(RateCtl *rate);
 size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info);
 void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
                             size_t bytes_avail);
 
 static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
diff --git a/audio/dbusaudio.c b/audio/dbusaudio.c
index a3d656d3b0..722df0355e 100644
--- a/audio/dbusaudio.c
+++ b/audio/dbusaudio.c
@@ -82,7 +82,7 @@ static void *dbus_get_buffer_out(HWVoiceOut *hw, size_t *size)
     }
 
     *size = MIN(vo->buf_size - vo->buf_pos, *size);
-    *size = audio_rate_get_bytes(&hw->info, &vo->rate, *size);
+    *size = audio_rate_get_bytes(&vo->rate, &hw->info, *size);
 
     return vo->buf + vo->buf_pos;
 
@@ -343,7 +343,7 @@ dbus_read(HWVoiceIn *hw, void *buf, size_t size)
 
     trace_dbus_audio_read(size);
 
-    /* size = audio_rate_get_bytes(&hw->info, &vo->rate, size); */
+    /* size = audio_rate_get_bytes(&vo->rate, &hw->info, size); */
 
     g_hash_table_iter_init(&iter, da->in_listeners);
     while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
diff --git a/audio/noaudio.c b/audio/noaudio.c
index 84a6bfbb1c..4fdee5adec 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -44,7 +44,7 @@ typedef struct NoVoiceIn {
 static size_t no_write(HWVoiceOut *hw, void *buf, size_t len)
 {
     NoVoiceOut *no = (NoVoiceOut *) hw;
-    return audio_rate_get_bytes(&hw->info, &no->rate, len);
+    return audio_rate_get_bytes(&no->rate, &hw->info, len);
 }
 
 static int no_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
@@ -89,7 +89,7 @@ static void no_fini_in (HWVoiceIn *hw)
 static size_t no_read(HWVoiceIn *hw, void *buf, size_t size)
 {
     NoVoiceIn *no = (NoVoiceIn *) hw;
-    int64_t bytes = audio_rate_get_bytes(&hw->info, &no->rate, size);
+    int64_t bytes = audio_rate_get_bytes(&no->rate, &hw->info, size);
 
     audio_pcm_info_clear_buf(&hw->info, buf, bytes / hw->info.bytes_per_frame);
     return bytes;
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index f52f3a8bbb..d17ef1a25e 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -239,7 +239,7 @@ static void line_in_fini (HWVoiceIn *hw)
 static size_t line_in_read(HWVoiceIn *hw, void *buf, size_t len)
 {
     SpiceVoiceIn *in = container_of (hw, SpiceVoiceIn, hw);
-    uint64_t to_read = audio_rate_get_bytes(&hw->info, &in->rate, len) >> 2;
+    uint64_t to_read = audio_rate_get_bytes(&in->rate, &hw->info, len) >> 2;
     size_t ready = spice_server_record_get_samples(&in->sin, buf, to_read);
 
     /*
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index ac666335c7..3e1d84db83 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -42,7 +42,7 @@ typedef struct WAVVoiceOut {
 static size_t wav_write_out(HWVoiceOut *hw, void *buf, size_t len)
 {
     WAVVoiceOut *wav = (WAVVoiceOut *) hw;
-    int64_t bytes = audio_rate_get_bytes(&hw->info, &wav->rate, len);
+    int64_t bytes = audio_rate_get_bytes(&wav->rate, &hw->info, len);
     assert(bytes % hw->info.bytes_per_frame == 0);
 
     if (bytes && fwrite(buf, bytes, 1, wav->f) != 1) {
-- 
2.35.3


