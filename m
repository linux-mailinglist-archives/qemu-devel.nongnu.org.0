Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B157650428
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xGs-0007y8-Rn; Sun, 18 Dec 2022 12:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGp-0007r5-12
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:16 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGn-0002Yp-Fq
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:14 -0500
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout11.t-online.de (Postfix) with SMTP id 72713FBE8;
 Sun, 18 Dec 2022 18:16:01 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd73.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGW-3Xics50; Sun, 18 Dec 2022 18:15:56 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 23E222006CE; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 08/11] audio/audio_template: use g_new0() to replace
 audio_calloc()
Date: Sun, 18 Dec 2022 18:15:36 +0100
Message-Id: <20221218171539.11193-8-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383756-2508E98D-2AAB9185/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e00ca6c-556a-4a26-8ae3-a7f038c24679
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace audio_calloc() with the equivalent g_new0().

With a n_structs argument >= 1, g_new0() never returns NULL.
Also remove the unnecessary NULL checks.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_template.h | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 5f51ef26b2..9c600448fb 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -129,12 +129,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return -1;
     }
 
-    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
-    if (!sw->buf) {
-        dolog ("Could not allocate buffer for `%s' (%d samples)\n",
-               SW_NAME (sw), samples);
-        return -1;
-    }
+    sw->buf = g_new0(st_sample, samples);
 
 #ifdef DAC
     sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
@@ -407,34 +402,28 @@ static SW *glue(audio_pcm_create_voice_pair_, TYPE)(
         hw_as = *as;
     }
 
-    sw = audio_calloc(__func__, 1, sizeof(*sw));
-    if (!sw) {
-        dolog ("Could not allocate soft voice `%s' (%zu bytes)\n",
-               sw_name ? sw_name : "unknown", sizeof (*sw));
-        goto err1;
-    }
+    sw = g_new0(SW, 1);
     sw->s = s;
 
     hw = glue(audio_pcm_hw_add_, TYPE)(s, &hw_as);
     if (!hw) {
         dolog("Could not create a backend for voice `%s'\n", sw_name);
-        goto err2;
+        goto err1;
     }
 
     glue (audio_pcm_hw_add_sw_, TYPE) (hw, sw);
 
     if (glue (audio_pcm_sw_init_, TYPE) (sw, hw, sw_name, as)) {
-        goto err3;
+        goto err2;
     }
 
     return sw;
 
-err3:
+err2:
     glue (audio_pcm_hw_del_sw_, TYPE) (sw);
     glue (audio_pcm_hw_gc_, TYPE) (&hw);
-err2:
-    g_free (sw);
 err1:
+    g_free(sw);
     return NULL;
 }
 
-- 
2.35.3


