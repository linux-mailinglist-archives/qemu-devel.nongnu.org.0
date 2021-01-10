Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399832F064C
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:12:15 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXhl-0001kv-QH
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYy-0001eF-Fi
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:09 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:42452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYv-0005Nx-Jn
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:08 -0500
Received: from fwd02.aul.t-online.de (fwd02.aul.t-online.de [172.20.26.148])
 by mailout05.t-online.de (Postfix) with SMTP id C1C8F42030A9;
 Sun, 10 Jan 2021 11:03:03 +0100 (CET)
Received: from linpower.localnet
 (S+XvpwZJQhn0wpPsj8C6QVk4zdB7+SGXuP+JxvfgEkHo0Y2apZkzGQeOAslIsJ6g5D@[93.236.152.29])
 by fwd02.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYo-0oGNGa0; Sun, 10 Jan 2021 11:02:58 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id EC5FE200632; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 08/23] audio: split pcm_ops function get_buffer_in
Date: Sun, 10 Jan 2021 11:02:24 +0100
Message-Id: <20210110100239.27588-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: S+XvpwZJQhn0wpPsj8C6QVk4zdB7+SGXuP+JxvfgEkHo0Y2apZkzGQeOAslIsJ6g5D
X-TOI-EXPURGATEID: 150726::1610272978-0000F958-3D93CCA5/0/0 CLEAN NORMAL
X-TOI-MSGID: dcba654d-95cf-469e-bb85-3dbe2e9c8345
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
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

Split off pcm_ops function run_buffer_in from get_buffer_in and
call run_buffer_in before get_buffer_in.

The next patch only needs the generic buffer management part
from audio_generic_get_buffer_in().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c  |  1 +
 audio/audio.c      | 18 ++++++++++++++----
 audio/audio_int.h  |  2 ++
 audio/jackaudio.c  |  1 +
 audio/noaudio.c    |  1 +
 audio/ossaudio.c   |  1 +
 audio/spiceaudio.c |  1 +
 7 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 6787e91bc1..5a871aaf6b 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -929,6 +929,7 @@ static struct audio_pcm_ops alsa_pcm_ops = {
     .init_in  = alsa_init_in,
     .fini_in  = alsa_fini_in,
     .read     = alsa_read,
+    .run_buffer_in = audio_generic_run_buffer_in,
     .enable_in = alsa_enable_in,
 };
 
diff --git a/audio/audio.c b/audio/audio.c
index d048d26283..480b3cce1f 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1241,6 +1241,10 @@ static size_t audio_pcm_hw_run_in(HWVoiceIn *hw, size_t samples)
     size_t conv = 0;
     STSampleBuffer *conv_buf = hw->conv_buf;
 
+    if (hw->pcm_ops->run_buffer_in) {
+        hw->pcm_ops->run_buffer_in(hw);
+    }
+
     while (samples) {
         size_t proc;
         size_t size = samples * hw->info.bytes_per_frame;
@@ -1381,10 +1385,8 @@ void audio_run(AudioState *s, const char *msg)
 #endif
 }
 
-void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
+void audio_generic_run_buffer_in(HWVoiceIn *hw)
 {
-    ssize_t start;
-
     if (unlikely(!hw->buf_emul)) {
         size_t calc_size = hw->conv_buf->size * hw->info.bytes_per_frame;
         hw->buf_emul = g_malloc(calc_size);
@@ -1403,8 +1405,12 @@ void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
             break;
         }
     }
+}
+
+void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
+{
+    ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
 
-    start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
     if (start < 0) {
         start += hw->size_emul;
     }
@@ -1505,6 +1511,10 @@ size_t audio_generic_read(HWVoiceIn *hw, void *buf, size_t size)
 {
     size_t total = 0;
 
+    if (hw->pcm_ops->run_buffer_in) {
+        hw->pcm_ops->run_buffer_in(hw);
+    }
+
     while (total < size) {
         size_t src_size = size - total;
         void *src = hw->pcm_ops->get_buffer_in(hw, &src_size);
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 4775857bf2..06f0913835 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -172,12 +172,14 @@ struct audio_pcm_ops {
     int    (*init_in) (HWVoiceIn *hw, audsettings *as, void *drv_opaque);
     void   (*fini_in) (HWVoiceIn *hw);
     size_t (*read)    (HWVoiceIn *hw, void *buf, size_t size);
+    void   (*run_buffer_in)(HWVoiceIn *hw);
     void  *(*get_buffer_in)(HWVoiceIn *hw, size_t *size);
     void   (*put_buffer_in)(HWVoiceIn *hw, void *buf, size_t size);
     void   (*enable_in)(HWVoiceIn *hw, bool enable);
     void   (*volume_in)(HWVoiceIn *hw, Volume *vol);
 };
 
+void audio_generic_run_buffer_in(HWVoiceIn *hw);
 void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size);
 void audio_generic_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size);
 void audio_generic_run_buffer_out(HWVoiceOut *hw);
diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 3b7c18443d..f8afb5cc31 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -657,6 +657,7 @@ static struct audio_pcm_ops jack_pcm_ops = {
     .init_in        = qjack_init_in,
     .fini_in        = qjack_fini_in,
     .read           = qjack_read,
+    .run_buffer_in  = audio_generic_run_buffer_in,
     .enable_in      = qjack_enable_in
 };
 
diff --git a/audio/noaudio.c b/audio/noaudio.c
index 05798ea210..aac87dbc93 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -124,6 +124,7 @@ static struct audio_pcm_ops no_pcm_ops = {
     .init_in  = no_init_in,
     .fini_in  = no_fini_in,
     .read     = no_read,
+    .run_buffer_in = audio_generic_run_buffer_in,
     .enable_in = no_enable_in
 };
 
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index a7dcaa31ad..c1db89f233 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -762,6 +762,7 @@ static struct audio_pcm_ops oss_pcm_ops = {
     .init_in  = oss_init_in,
     .fini_in  = oss_fini_in,
     .read     = oss_read,
+    .run_buffer_in = audio_generic_run_buffer_in,
     .enable_in = oss_enable_in
 };
 
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index 8967cca129..999bfbde47 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -293,6 +293,7 @@ static struct audio_pcm_ops audio_callbacks = {
     .init_in  = line_in_init,
     .fini_in  = line_in_fini,
     .read     = line_in_read,
+    .run_buffer_in = audio_generic_run_buffer_in,
     .enable_in = line_in_enable,
 #if ((SPICE_INTERFACE_RECORD_MAJOR >= 2) && (SPICE_INTERFACE_RECORD_MINOR >= 2))
     .volume_in = line_in_volume,
-- 
2.26.2


