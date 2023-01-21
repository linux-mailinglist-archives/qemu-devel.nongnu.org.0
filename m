Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD36F676570
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 10:49:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJATq-0006fn-J2; Sat, 21 Jan 2023 04:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATW-0006d2-5C
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:58 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATT-00038D-5N
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:48 -0500
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout08.t-online.de (Postfix) with SMTP id A2BDE24B64;
 Sat, 21 Jan 2023 10:47:45 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pJATR-1KL2xt0; Sat, 21 Jan 2023 10:47:45 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 45671200638; Sat, 21 Jan 2023 10:47:35 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] audio/mixeng: use g_new0() instead of audio_calloc()
Date: Sat, 21 Jan 2023 10:47:29 +0100
Message-Id: <20230121094735.11644-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1674294465-812ECD99-4F6A3A14/0/0 CLEAN NORMAL
X-TOI-MSGID: 04682b54-739a-48ca-97f8-4d49b838e5a9
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


