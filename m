Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9145BB872
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 15:23:02 +0200 (CEST)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZXmf-0002nS-MM
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 09:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oZXgQ-0006zC-C9
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 09:16:37 -0400
Received: from mailout11.t-online.de ([194.25.134.85]:46044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oZXgO-0008Mr-8i
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 09:16:34 -0400
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout11.t-online.de (Postfix) with SMTP id CFCD6C287;
 Sat, 17 Sep 2022 15:16:28 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oZXgJ-0z7o2b0; Sat, 17 Sep 2022 15:16:27 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id CC59A200613; Sat, 17 Sep 2022 15:16:26 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/2] Revert "audio: Log context for audio bug"
Date: Sat, 17 Sep 2022 15:16:25 +0200
Message-Id: <20220917131626.7521-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <988e1e66-6f03-5843-d686-666132cf8ef9@t-online.de>
References: <988e1e66-6f03-5843-d686-666132cf8ef9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663420587-896BD81F-0D76923E/0/0 CLEAN NORMAL
X-TOI-MSGID: 820ccf2b-c3f8-4752-b42f-750c0970b93d
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This reverts commit 8e30d39bade3010387177ca23dbc2244352ed4a3.

Revert commit 8e30d39bad "audio: Log context for audio bug"
to make error propagation work again.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          | 25 +++++++++++++------------
 audio/audio_template.h | 27 +++++++++++++++------------
 2 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 76b8735b44..545ded6674 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -117,6 +117,7 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
+        abort();
     }
 
     return cond;
@@ -137,7 +138,7 @@ static inline int audio_bits_to_index (int bits)
     default:
         audio_bug ("bits_to_index", 1);
         AUD_log (NULL, "invalid bits %d\n", bits);
-        abort();
+        return 0;
     }
 }
 
@@ -155,7 +156,7 @@ void *audio_calloc (const char *funcname, int nmemb, size_t size)
         AUD_log (NULL, "%s passed invalid arguments to audio_calloc\n",
                  funcname);
         AUD_log (NULL, "nmemb=%d size=%zu (len=%zu)\n", nmemb, size, len);
-        abort();
+        return NULL;
     }
 
     return g_malloc0 (len);
@@ -542,7 +543,7 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     size_t live = hw->total_samples_captured - audio_pcm_hw_find_min_in (hw);
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        abort();
+        return 0;
     }
     return live;
 }
@@ -580,7 +581,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
     }
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        abort();
+        return 0;
     }
 
     rpos = audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
@@ -655,7 +656,7 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            abort();
+            return 0;
         }
         return live;
     }
@@ -705,7 +706,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     live = sw->total_hw_samples_mixed;
     if (audio_bug(__func__, live > hwsamples)) {
         dolog("live=%zu hw->mix_buf->size=%zu\n", live, hwsamples);
-        abort();
+        return 0;
     }
 
     if (live == hwsamples) {
@@ -997,7 +998,7 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     if (audio_bug(__func__, live > sw->hw->conv_buf->size)) {
         dolog("live=%zu sw->hw->conv_buf->size=%zu\n", live,
               sw->hw->conv_buf->size);
-        abort();
+        return 0;
     }
 
     ldebug (
@@ -1027,7 +1028,7 @@ static size_t audio_get_free(SWVoiceOut *sw)
     if (audio_bug(__func__, live > sw->hw->mix_buf->size)) {
         dolog("live=%zu sw->hw->mix_buf->size=%zu\n", live,
               sw->hw->mix_buf->size);
-        abort();
+        return 0;
     }
 
     dead = sw->hw->mix_buf->size - live;
@@ -1169,7 +1170,7 @@ static void audio_run_out (AudioState *s)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            abort();
+            continue;
         }
 
         if (hw->pending_disable && !nb_live) {
@@ -1202,7 +1203,7 @@ static void audio_run_out (AudioState *s)
         if (audio_bug(__func__, hw->mix_buf->pos >= hw->mix_buf->size)) {
             dolog("hw->mix_buf->pos=%zu hw->mix_buf->size=%zu played=%zu\n",
                   hw->mix_buf->pos, hw->mix_buf->size, played);
-            abort();
+            hw->mix_buf->pos = 0;
         }
 
 #ifdef DEBUG_OUT
@@ -1222,7 +1223,7 @@ static void audio_run_out (AudioState *s)
             if (audio_bug(__func__, played > sw->total_hw_samples_mixed)) {
                 dolog("played=%zu sw->total_hw_samples_mixed=%zu\n",
                       played, sw->total_hw_samples_mixed);
-                abort();
+                played = sw->total_hw_samples_mixed;
             }
 
             sw->total_hw_samples_mixed -= played;
@@ -1345,7 +1346,7 @@ static void audio_run_capture (AudioState *s)
             if (audio_bug(__func__, captured > sw->total_hw_samples_mixed)) {
                 dolog("captured=%zu sw->total_hw_samples_mixed=%zu\n",
                       captured, sw->total_hw_samples_mixed);
-                abort();
+                captured = sw->total_hw_samples_mixed;
             }
 
             sw->total_hw_samples_mixed -= captured;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 7192b19e73..d2d348638b 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -59,13 +59,12 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
     if (audio_bug(__func__, !voice_size && max_voices)) {
         dolog ("drv=`%s' voice_size=0 max_voices=%d\n",
                drv->name, max_voices);
-        abort();
+        glue (s->nb_hw_voices_, TYPE) = 0;
     }
 
     if (audio_bug(__func__, voice_size && !max_voices)) {
         dolog ("drv=`%s' voice_size=%d max_voices=0\n",
                drv->name, voice_size);
-        abort();
     }
 }
 
@@ -82,7 +81,6 @@ static void glue(audio_pcm_hw_alloc_resources_, TYPE)(HW *hw)
         size_t samples = hw->samples;
         if (audio_bug(__func__, samples == 0)) {
             dolog("Attempted to allocate empty buffer\n");
-            abort();
         }
 
         HWBUF = g_malloc0(sizeof(STSampleBuffer) + sizeof(st_sample) * samples);
@@ -254,12 +252,12 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
 
     if (audio_bug(__func__, !drv)) {
         dolog ("No host audio driver\n");
-        abort();
+        return NULL;
     }
 
     if (audio_bug(__func__, !drv->pcm_ops)) {
         dolog ("Host audio driver without pcm_ops\n");
-        abort();
+        return NULL;
     }
 
     hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
@@ -277,13 +275,12 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
     QLIST_INIT (&hw->cap_head);
 #endif
     if (glue (hw->pcm_ops->init_, TYPE) (hw, as, s->drv_opaque)) {
-        g_free(hw);
-        return NULL;
+        goto err0;
     }
 
     if (audio_bug(__func__, hw->samples <= 0)) {
         dolog("hw->samples=%zd\n", hw->samples);
-        abort();
+        goto err1;
     }
 
     if (hw->info.is_float) {
@@ -312,6 +309,12 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
     audio_attach_capture (hw);
 #endif
     return hw;
+
+ err1:
+    glue (hw->pcm_ops->fini_, TYPE) (hw);
+ err0:
+    g_free (hw);
+    return NULL;
 }
 
 AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
@@ -432,7 +435,7 @@ void glue (AUD_close_, TYPE) (QEMUSoundCard *card, SW *sw)
     if (sw) {
         if (audio_bug(__func__, !card)) {
             dolog ("card=%p\n", card);
-            abort();
+            return;
         }
 
         glue (audio_close_, TYPE) (sw);
@@ -454,7 +457,7 @@ SW *glue (AUD_open_, TYPE) (
     if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
         dolog ("card=%p name=%p callback_fn=%p as=%p\n",
                card, name, callback_fn, as);
-        abort();
+        goto fail;
     }
 
     s = card->state;
@@ -465,12 +468,12 @@ SW *glue (AUD_open_, TYPE) (
 
     if (audio_bug(__func__, audio_validate_settings(as))) {
         audio_print_settings (as);
-        abort();
+        goto fail;
     }
 
     if (audio_bug(__func__, !s->drv)) {
         dolog ("Can not open `%s' (no host audio driver)\n", name);
-        abort();
+        goto fail;
     }
 
     if (sw && audio_pcm_info_eq (&sw->info, as)) {
-- 
2.35.3


