Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD975E9F51
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:24:00 +0200 (CEST)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclHH-0006rX-T6
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpv-0005hl-Hb
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpt-0003ox-Jd
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJpHQZVHvsstAM7uMbP+gvvt8yEVZkMarUyInSA1C80=;
 b=DCloWoyI1zgl9xiU6Obu5plDiQdZMItafKnXc/xDtvQUzrZenMFLguV0f18YmEhDat2Cwx
 kt/x6i6gddJQD9emXNON3iHSi3+Hp2zmuYXd6LmzQzPGjO/63HRpkaqg610ZQyJFkGdfbc
 lKxv2ozHrc34WzSFWlq75CFH4Bakd0g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-xF9RULUxMt2T2KJK5VpJ7w-1; Mon, 26 Sep 2022 05:55:32 -0400
X-MC-Unique: xF9RULUxMt2T2KJK5VpJ7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ABCD29AB44C;
 Mon, 26 Sep 2022 09:55:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3516C15BA4;
 Mon, 26 Sep 2022 09:55:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4E646180A404; Mon, 26 Sep 2022 11:55:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 22/25] Revert "audio: Log context for audio bug"
Date: Mon, 26 Sep 2022 11:55:06 +0200
Message-Id: <20220926095509.3759409-23-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Volker Rümelin <vr_qemu@t-online.de>

This reverts commit 8e30d39bade3010387177ca23dbc2244352ed4a3.

Revert commit 8e30d39bad "audio: Log context for audio bug"
to make error propagation work again.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220917131626.7521-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_template.h | 27 +++++++++++++++------------
 audio/audio.c          | 25 +++++++++++++------------
 2 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 81860cea6202..98ab557684d8 100644
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
@@ -434,7 +437,7 @@ void glue (AUD_close_, TYPE) (QEMUSoundCard *card, SW *sw)
     if (sw) {
         if (audio_bug(__func__, !card)) {
             dolog ("card=%p\n", card);
-            abort();
+            return;
         }
 
         glue (audio_close_, TYPE) (sw);
@@ -456,7 +459,7 @@ SW *glue (AUD_open_, TYPE) (
     if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
         dolog ("card=%p name=%p callback_fn=%p as=%p\n",
                card, name, callback_fn, as);
-        abort();
+        goto fail;
     }
 
     s = card->state;
@@ -467,12 +470,12 @@ SW *glue (AUD_open_, TYPE) (
 
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
diff --git a/audio/audio.c b/audio/audio.c
index 5600593da043..d96a13055940 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -118,6 +118,7 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
+        abort();
     }
 
     return cond;
@@ -138,7 +139,7 @@ static inline int audio_bits_to_index (int bits)
     default:
         audio_bug ("bits_to_index", 1);
         AUD_log (NULL, "invalid bits %d\n", bits);
-        abort();
+        return 0;
     }
 }
 
@@ -156,7 +157,7 @@ void *audio_calloc (const char *funcname, int nmemb, size_t size)
         AUD_log (NULL, "%s passed invalid arguments to audio_calloc\n",
                  funcname);
         AUD_log (NULL, "nmemb=%d size=%zu (len=%zu)\n", nmemb, size, len);
-        abort();
+        return NULL;
     }
 
     return g_malloc0 (len);
@@ -543,7 +544,7 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     size_t live = hw->total_samples_captured - audio_pcm_hw_find_min_in (hw);
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        abort();
+        return 0;
     }
     return live;
 }
@@ -581,7 +582,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
     }
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        abort();
+        return 0;
     }
 
     rpos = audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
@@ -656,7 +657,7 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            abort();
+            return 0;
         }
         return live;
     }
@@ -706,7 +707,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     live = sw->total_hw_samples_mixed;
     if (audio_bug(__func__, live > hwsamples)) {
         dolog("live=%zu hw->mix_buf->size=%zu\n", live, hwsamples);
-        abort();
+        return 0;
     }
 
     if (live == hwsamples) {
@@ -998,7 +999,7 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     if (audio_bug(__func__, live > sw->hw->conv_buf->size)) {
         dolog("live=%zu sw->hw->conv_buf->size=%zu\n", live,
               sw->hw->conv_buf->size);
-        abort();
+        return 0;
     }
 
     ldebug (
@@ -1028,7 +1029,7 @@ static size_t audio_get_free(SWVoiceOut *sw)
     if (audio_bug(__func__, live > sw->hw->mix_buf->size)) {
         dolog("live=%zu sw->hw->mix_buf->size=%zu\n", live,
               sw->hw->mix_buf->size);
-        abort();
+        return 0;
     }
 
     dead = sw->hw->mix_buf->size - live;
@@ -1170,7 +1171,7 @@ static void audio_run_out (AudioState *s)
 
         if (audio_bug(__func__, live > hw->mix_buf->size)) {
             dolog("live=%zu hw->mix_buf->size=%zu\n", live, hw->mix_buf->size);
-            abort();
+            continue;
         }
 
         if (hw->pending_disable && !nb_live) {
@@ -1203,7 +1204,7 @@ static void audio_run_out (AudioState *s)
         if (audio_bug(__func__, hw->mix_buf->pos >= hw->mix_buf->size)) {
             dolog("hw->mix_buf->pos=%zu hw->mix_buf->size=%zu played=%zu\n",
                   hw->mix_buf->pos, hw->mix_buf->size, played);
-            abort();
+            hw->mix_buf->pos = 0;
         }
 
 #ifdef DEBUG_OUT
@@ -1223,7 +1224,7 @@ static void audio_run_out (AudioState *s)
             if (audio_bug(__func__, played > sw->total_hw_samples_mixed)) {
                 dolog("played=%zu sw->total_hw_samples_mixed=%zu\n",
                       played, sw->total_hw_samples_mixed);
-                abort();
+                played = sw->total_hw_samples_mixed;
             }
 
             sw->total_hw_samples_mixed -= played;
@@ -1346,7 +1347,7 @@ static void audio_run_capture (AudioState *s)
             if (audio_bug(__func__, captured > sw->total_hw_samples_mixed)) {
                 dolog("captured=%zu sw->total_hw_samples_mixed=%zu\n",
                       captured, sw->total_hw_samples_mixed);
-                abort();
+                captured = sw->total_hw_samples_mixed;
             }
 
             sw->total_hw_samples_mixed -= captured;
-- 
2.37.3


