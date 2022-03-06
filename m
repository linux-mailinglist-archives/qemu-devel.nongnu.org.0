Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266124CEE79
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:27:50 +0100 (CET)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0I1-0002cN-8b
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09M-0007pV-55; Sun, 06 Mar 2022 18:18:52 -0500
Received: from [2a00:1450:4864:20::42f] (port=45919
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09K-0007QI-A1; Sun, 06 Mar 2022 18:18:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id p9so20648625wra.12;
 Sun, 06 Mar 2022 15:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46NBNvVoysH9eJqR3eLDXH7RhT1oumyXXssv7c0pDs4=;
 b=EuVul0FiVgxxO0SMtN1aleSrFSR5fQ6OC/jIirSGVyDO2GxsKPR8KCho202pLkUSRj
 APsOA/RdsViUtfDlA3MKhtuzTUv7DMelrMmmUBb2cO8ipE4Et9r2/jkTVX9xp+HX/u3z
 1O4cSrGBTq08Xy3w5MIMR8XVq4VTgcERi5n56lYw9Zf8wbFe84VDUkZMd1FRd068meyY
 3QndukVGeQ0TL6bbhzt8A5Q+Adcb1pNLryEOMRjfE79EUMi3pTuI3G5xdboc8Na7lIsc
 CdPT8l9LaIRTCaJgKzQg5Ajf/ZElNMW2ZauEnSYIMu0+i2OFpMCUDkSHmnuTmg5RDJmG
 jQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46NBNvVoysH9eJqR3eLDXH7RhT1oumyXXssv7c0pDs4=;
 b=dbVDIzKpbP5vFky510PQKONSDhLias3nUFzDjBFZnYFKjPt7qMV663gDYoBr3c8sN7
 Dwxffmj1rW+4bToQcFb7tpPAPVvHRZHmos16is+gm109nAQO4FEIIt7FCvMiQiv75Jc/
 0iyqcPc4fN5squ5sJP36ayJmjcRuQiWfU8b59Yo675HQcW3vkHSFxyf34TqjsXXYW0Gg
 OA/yZLcWuE82PB6nlOaox+deKxMTksjO+3sMsNrVlFTDtuUDyIFjIM9pnCazbdF7BpFj
 NWhsPchffydsVJ0oRf4NVmZHiv6jg1iy6D4ErYHmymGrJjXWF7w7LvJ2+MkRC7vQ6yCd
 lGkg==
X-Gm-Message-State: AOAM531XDY9vuXPw/hcqj9AHGudiuz54CU2pcpA1lG8c3c+5EJN050J3
 rrj+fNu/rDM9or0nQD2wdzDTZGaVbW0=
X-Google-Smtp-Source: ABdhPJygEy1oAaDpNEut47oj2XoNGyAjL54W5qLvJl7kEM2dLX7Hq1rbIO1e+TS6iRR+xO0C+lSlVA==
X-Received: by 2002:a5d:53cb:0:b0:1f1:e947:1933 with SMTP id
 a11-20020a5d53cb000000b001f1e9471933mr3247310wrw.478.1646608728349; 
 Sun, 06 Mar 2022 15:18:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm13424506wmb.3.2022.03.06.15.18.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/22] audio: Log context for audio bug
Date: Mon,  7 Mar 2022 00:17:41 +0100
Message-Id: <20220306231753.50277-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Without this change audio_bug aborts when the bug condition is met,
which discards following useful logs. Call abort after such logs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220306063202.27331-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/audio.c          | 25 ++++++++++++-------------
 audio/audio_template.h | 27 ++++++++++++---------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index a88572e713..6bc313d9f5 100644
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
index d2d348638b..7192b19e73 100644
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
2.34.1


