Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E12F7D32
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:52:58 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PX7-0007Ez-Fh
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3I-0006tU-By
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003In-3b
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S5rSsMuMAe5Af//GBkj7gzRXALvTh+gUhOFh/bH7bk=;
 b=F8zjzdsZX72SPBgdHaaPs0W1eI27beQMXad+BekL5GaIEKN0CRLsWRgOqODLME8jMigB8L
 /YLtkwJyBUKX9cL2hkJuauJvS2jcsQcz16LJaYTZCKGdlwwTxGnlgQr+hulAvbsv1Ym1zC
 HZEtsgw5sT+tjYQWHd0cE3fdtlc6xbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-sV_VM0boNCG4-lf4n_HDbA-1; Fri, 15 Jan 2021 08:21:53 -0500
X-MC-Unique: sV_VM0boNCG4-lf4n_HDbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 011DA180A0A1;
 Fri, 15 Jan 2021 13:21:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FBD46F991;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80814180063E; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] audio: split pcm_ops function get_buffer_in
Date: Fri, 15 Jan 2021 14:21:24 +0100
Message-Id: <20210115132146.1443592-9-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Split off pcm_ops function run_buffer_in from get_buffer_in and
call run_buffer_in before get_buffer_in.

The next patch only needs the generic buffer management part
from audio_generic_get_buffer_in().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-8-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h  |  2 ++
 audio/alsaaudio.c  |  1 +
 audio/audio.c      | 18 ++++++++++++++----
 audio/jackaudio.c  |  1 +
 audio/noaudio.c    |  1 +
 audio/ossaudio.c   |  1 +
 audio/spiceaudio.c |  1 +
 7 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 4775857bf245..06f0913835b0 100644
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
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 6787e91bc198..5a871aaf6b48 100644
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
index d048d262835e..480b3cce1ffb 100644
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
diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 3b7c18443dbe..f8afb5cc318c 100644
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
index 05798ea21032..aac87dbc93fb 100644
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
index a7dcaa31adeb..c1db89f23300 100644
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
index 8967cca12925..999bfbde47c5 100644
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
2.29.2


