Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5FC65041F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xGi-0007h7-M5; Sun, 18 Dec 2022 12:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGZ-0007fF-Lc
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:15:59 -0500
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGX-0002Tw-QP
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:15:59 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout02.t-online.de (Postfix) with SMTP id 76CBB1E5B8;
 Sun, 18 Dec 2022 18:15:49 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGO-12xwOX0; Sun, 18 Dec 2022 18:15:49 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1BC8A200637; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 05/11] audio/mixeng: use g_new0() instead of audio_calloc()
Date: Sun, 18 Dec 2022 18:15:33 +0100
Message-Id: <20221218171539.11193-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383749-09691417-2C016715/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c0dacc7-fb90-49e1-9f85-250426c6333c
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace audio_calloc() with the equivalent g_new0().

With a n_structs argument of 1, g_new0() never returns NULL.
Also remove the unnecessary NULL checks.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          | 5 -----
 audio/audio_template.h | 6 +-----
 audio/mixeng.c         | 7 +------
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index f6b420688d..ac5434a13c 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -507,11 +507,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
         sw->ratio = ((int64_t) hw_cap->info.freq << 32) / sw->info.freq;
         sw->vol = nominal_volume;
         sw->rate = st_rate_start (sw->info.freq, hw_cap->info.freq);
-        if (!sw->rate) {
-            dolog ("Could not start rate conversion for `%s'\n", SW_NAME (sw));
-            g_free (sw);
-            return -1;
-        }
         QLIST_INSERT_HEAD (&hw_cap->sw_head, sw, entries);
         QLIST_INSERT_HEAD (&hw->cap_head, sc, entries);
 #ifdef DEBUG_CAPTURE
diff --git a/audio/audio_template.h b/audio/audio_template.h
index ac744d3484..d343a1dcb3 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -141,11 +141,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 #else
     sw->rate = st_rate_start (sw->hw->info.freq, sw->info.freq);
 #endif
-    if (!sw->rate) {
-        g_free (sw->buf);
-        sw->buf = NULL;
-        return -1;
-    }
+
     return 0;
 }
 
diff --git a/audio/mixeng.c b/audio/mixeng.c
index 100a306d6f..fe454e0725 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -414,12 +414,7 @@ struct rate {
  */
 void *st_rate_start (int inrate, int outrate)
 {
-    struct rate *rate = audio_calloc(__func__, 1, sizeof(*rate));
-
-    if (!rate) {
-        dolog ("Could not allocate resampler (%zu bytes)\n", sizeof (*rate));
-        return NULL;
-    }
+    struct rate *rate = g_new0(struct rate, 1);
 
     rate->opos = 0;
 
-- 
2.35.3


