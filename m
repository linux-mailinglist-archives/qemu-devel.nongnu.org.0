Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA174CE97F
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 07:33:33 +0100 (CET)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQkSR-0007Fw-Qv
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 01:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQkRH-0006ZK-HR
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 01:32:19 -0500
Received: from [2607:f8b0:4864:20::62c] (port=36734
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQkRE-00073J-KS
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 01:32:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id e13so11216317plh.3
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 22:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31q8B8kvRw6PWvGXdX2YBi3/L+AL09y3mh1VgXRMWDA=;
 b=RtJaOalswIKilwwuT6vgupkukQahH/E3lzqYsl1fV1dUwSMZ1g3oorZeukO4bVIyfz
 MIe831jQ9gWZx6gPPD9jbUy9fD4sHTNsj9Mg97fA0xTnTP7Qs/0eb0uHa2XEe65RNBpZ
 Sg5roYV2keEz8OoZrwoqBrBuALGMcpkS65VCeSSJMubgtWcw9oyI4v9ryVPppUC7x307
 u7iNiXVXeWkZXgp/EV/YA1n+AS6s0ZlZeJLV5T0tl8LGXC53CKvcY7WZ8veQabNaT+1L
 GJf7+PCtZUuy6Cf0ndjgyRCl/oCqvPM+bAFyma3eyYKFoEdlXOBsAcyfiSzFtaDSfxNh
 vnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31q8B8kvRw6PWvGXdX2YBi3/L+AL09y3mh1VgXRMWDA=;
 b=yhvmbZHWTwCqdCkYXV1iWYms2tsFVat2jb2qO2u+wCvDl8IFi9ysZh+z/QSRoqOcnk
 4jYdAzwyCbygH8BknK9uCGAY4TCcDBpl95VyEtB+UBdrItRRzVLVLsVk1pLlirwPnuAK
 NC1Fh+Lx7WBCw0z2f6o7tjqZ7a7j8refGF3zn7AMGSSWSmOn+z9QWmknYg49vItQ5Ngl
 PnGEuc4Y43scFxGihC+tjlAgHEF8qFvwjaweH8QdRspFe7mVBPzUtFbeI72s+swQB7x3
 SN8pADXVdfP0Z7gWiaRZBa0+N3WC811+Z78Wk0CU5OsPtWSdd6ZAtGBZWw1UrrVgDvV9
 2u6A==
X-Gm-Message-State: AOAM532JKewrsNg9HM2DFlV5q9kqvqmRyaiSzHEWYT86P50i2GeAskNQ
 krB2aoc6EaI+VazQ9MyXDY6R+J30290=
X-Google-Smtp-Source: ABdhPJzQufh1cC17MZZvPEYKU6+rycHYvYy6dFhyrS6u79DipDHLB12DadEZKk6HGtfXMpxsjpb+ZQ==
X-Received: by 2002:a17:90a:9f90:b0:1bc:7e7c:2ea7 with SMTP id
 o16-20020a17090a9f9000b001bc7e7c2ea7mr18729698pjp.64.1646548334471; 
 Sat, 05 Mar 2022 22:32:14 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:f82b:4f21:14ee:1481])
 by smtp.gmail.com with ESMTPSA id
 63-20020a630942000000b00372a99c1821sm8449035pgj.21.2022.03.05.22.32.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 05 Mar 2022 22:32:13 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] audio: Log context for audio bug
Date: Sun,  6 Mar 2022 15:32:02 +0900
Message-Id: <20220306063202.27331-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this change audio_bug aborts when the bug condition is met,
which discards following useful logs. Call abort after such logs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/audio.c          | 25 ++++++++++++-------------
 audio/audio_template.h | 27 ++++++++++++---------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index a88572e7138..6bc313d9f53 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -117,7 +117,6 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
-        abort();
     }
 
     return cond;
@@ -138,7 +137,7 @@ static inline int audio_bits_to_index (int bits)
     default:
         audio_bug ("bits_to_index", 1);
         AUD_log (NULL, "invalid bits %d\n", bits);
-        return 0;
+        abort();
     }
 }
 
@@ -156,7 +155,7 @@ void *audio_calloc (const char *funcname, int nmemb, size_t size)
         AUD_log (NULL, "%s passed invalid arguments to audio_calloc\n",
                  funcname);
         AUD_log (NULL, "nmemb=%d size=%zu (len=%zu)\n", nmemb, size, len);
-        return NULL;
+        abort();
     }
 
     return g_malloc0 (len);
@@ -543,7 +542,7 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     size_t live = hw->total_samples_captured - audio_pcm_hw_find_min_in (hw);
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        return 0;
+        abort();
     }
     return live;
 }
@@ -581,7 +580,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
     }
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        return 0;
+        abort();
     }
 
     rpos = audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
@@ -656,7 +655,7 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            return 0;
+            abort();
         }
         return live;
     }
@@ -706,7 +705,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     live = sw->total_hw_samples_mixed;
     if (audio_bug(__func__, live > hwsamples)) {
         dolog("live=%zu hw->mix_buf->size=%zu\n", live, hwsamples);
-        return 0;
+        abort();
     }
 
     if (live == hwsamples) {
@@ -998,7 +997,7 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     if (audio_bug(__func__, live > sw->hw->conv_buf->size)) {
         dolog("live=%zu sw->hw->conv_buf->size=%zu\n", live,
               sw->hw->conv_buf->size);
-        return 0;
+        abort();
     }
 
     ldebug (
@@ -1028,7 +1027,7 @@ static size_t audio_get_free(SWVoiceOut *sw)
     if (audio_bug(__func__, live > sw->hw->mix_buf->size)) {
         dolog("live=%zu sw->hw->mix_buf->size=%zu\n", live,
               sw->hw->mix_buf->size);
-        return 0;
+        abort();
     }
 
     dead = sw->hw->mix_buf->size - live;
@@ -1170,7 +1169,7 @@ static void audio_run_out (AudioState *s)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            continue;
+            abort();
         }
 
         if (hw->pending_disable && !nb_live) {
@@ -1203,7 +1202,7 @@ static void audio_run_out (AudioState *s)
         if (audio_bug(__func__, hw->mix_buf->pos >= hw->mix_buf->size)) {
             dolog("hw->mix_buf->pos=%zu hw->mix_buf->size=%zu played=%zu\n",
                   hw->mix_buf->pos, hw->mix_buf->size, played);
-            hw->mix_buf->pos = 0;
+            abort();
         }
 
 #ifdef DEBUG_OUT
@@ -1223,7 +1222,7 @@ static void audio_run_out (AudioState *s)
             if (audio_bug(__func__, played > sw->total_hw_samples_mixed)) {
                 dolog("played=%zu sw->total_hw_samples_mixed=%zu\n",
                       played, sw->total_hw_samples_mixed);
-                played = sw->total_hw_samples_mixed;
+                abort();
             }
 
             sw->total_hw_samples_mixed -= played;
@@ -1346,7 +1345,7 @@ static void audio_run_capture (AudioState *s)
             if (audio_bug(__func__, captured > sw->total_hw_samples_mixed)) {
                 dolog("captured=%zu sw->total_hw_samples_mixed=%zu\n",
                       captured, sw->total_hw_samples_mixed);
-                captured = sw->total_hw_samples_mixed;
+                abort();
             }
 
             sw->total_hw_samples_mixed -= captured;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index d2d348638b8..7192b19e739 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -59,12 +59,13 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
     if (audio_bug(__func__, !voice_size && max_voices)) {
         dolog ("drv=`%s' voice_size=0 max_voices=%d\n",
                drv->name, max_voices);
-        glue (s->nb_hw_voices_, TYPE) = 0;
+        abort();
     }
 
     if (audio_bug(__func__, voice_size && !max_voices)) {
         dolog ("drv=`%s' voice_size=%d max_voices=0\n",
                drv->name, voice_size);
+        abort();
     }
 }
 
@@ -81,6 +82,7 @@ static void glue(audio_pcm_hw_alloc_resources_, TYPE)(HW *hw)
         size_t samples = hw->samples;
         if (audio_bug(__func__, samples == 0)) {
             dolog("Attempted to allocate empty buffer\n");
+            abort();
         }
 
         HWBUF = g_malloc0(sizeof(STSampleBuffer) + sizeof(st_sample) * samples);
@@ -252,12 +254,12 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
 
     if (audio_bug(__func__, !drv)) {
         dolog ("No host audio driver\n");
-        return NULL;
+        abort();
     }
 
     if (audio_bug(__func__, !drv->pcm_ops)) {
         dolog ("Host audio driver without pcm_ops\n");
-        return NULL;
+        abort();
     }
 
     hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
@@ -275,12 +277,13 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
     QLIST_INIT (&hw->cap_head);
 #endif
     if (glue (hw->pcm_ops->init_, TYPE) (hw, as, s->drv_opaque)) {
-        goto err0;
+        g_free(hw);
+        return NULL;
     }
 
     if (audio_bug(__func__, hw->samples <= 0)) {
         dolog("hw->samples=%zd\n", hw->samples);
-        goto err1;
+        abort();
     }
 
     if (hw->info.is_float) {
@@ -309,12 +312,6 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
     audio_attach_capture (hw);
 #endif
     return hw;
-
- err1:
-    glue (hw->pcm_ops->fini_, TYPE) (hw);
- err0:
-    g_free (hw);
-    return NULL;
 }
 
 AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
@@ -435,7 +432,7 @@ void glue (AUD_close_, TYPE) (QEMUSoundCard *card, SW *sw)
     if (sw) {
         if (audio_bug(__func__, !card)) {
             dolog ("card=%p\n", card);
-            return;
+            abort();
         }
 
         glue (audio_close_, TYPE) (sw);
@@ -457,7 +454,7 @@ SW *glue (AUD_open_, TYPE) (
     if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
         dolog ("card=%p name=%p callback_fn=%p as=%p\n",
                card, name, callback_fn, as);
-        goto fail;
+        abort();
     }
 
     s = card->state;
@@ -468,12 +465,12 @@ SW *glue (AUD_open_, TYPE) (
 
     if (audio_bug(__func__, audio_validate_settings(as))) {
         audio_print_settings (as);
-        goto fail;
+        abort();
     }
 
     if (audio_bug(__func__, !s->drv)) {
         dolog ("Can not open `%s' (no host audio driver)\n", name);
-        goto fail;
+        abort();
     }
 
     if (sw && audio_pcm_info_eq (&sw->info, as)) {
-- 
2.32.0 (Apple Git-132)


