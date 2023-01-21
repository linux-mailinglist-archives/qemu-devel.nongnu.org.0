Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CE467657B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 10:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJATt-0006hF-0f; Sat, 21 Jan 2023 04:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATf-0006eN-Hd
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:59 -0500
Received: from mailout10.t-online.de ([194.25.134.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATd-00039D-8F
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:59 -0500
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout10.t-online.de (Postfix) with SMTP id 4C95419A01;
 Sat, 21 Jan 2023 10:47:52 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd85.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pJATW-1YMoev0; Sat, 21 Jan 2023 10:47:50 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 4AB7D2006E4; Sat, 21 Jan 2023 10:47:35 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Date: Sat, 21 Jan 2023 10:47:31 +0100
Message-Id: <20230121094735.11644-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1674294470-ABFF3DFF-AE0859C9/0/0 CLEAN NORMAL
X-TOI-MSGID: d8250eb3-a9d1-40a5-8b1b-c1026ce751b0
Received-SPF: none client-ip=194.25.134.21;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout10.t-online.de
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use g_malloc0() as a direct replacement for audio_calloc().

Since the type of the parameter n_bytes of the function g_malloc0()
is unsigned, the type of the variables voice_size_out and
voice_size_in has been changed to size_t. This means that the
function argument no longer has to be checked for negative values.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_int.h      |  4 ++--
 audio/audio_template.h | 18 ++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 4632cdf9cc..ce2d6bf92c 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -151,8 +151,8 @@ struct audio_driver {
     int can_be_default;
     int max_voices_out;
     int max_voices_in;
-    int voice_size_out;
-    int voice_size_in;
+    size_t voice_size_out;
+    size_t voice_size_in;
     QLIST_ENTRY(audio_driver) next;
 };
 
diff --git a/audio/audio_template.h b/audio/audio_template.h
index d343a1dcb3..6b7d1fea83 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -40,7 +40,7 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
                                               struct audio_driver *drv)
 {
     int max_voices = glue (drv->max_voices_, TYPE);
-    int voice_size = glue (drv->voice_size_, TYPE);
+    size_t voice_size = glue(drv->voice_size_, TYPE);
 
     if (glue (s->nb_hw_voices_, TYPE) > max_voices) {
         if (!max_voices) {
@@ -63,8 +63,8 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
     }
 
     if (audio_bug(__func__, voice_size && !max_voices)) {
-        dolog ("drv=`%s' voice_size=%d max_voices=0\n",
-               drv->name, voice_size);
+        dolog("drv=`%s' voice_size=%zu max_voices=0\n",
+              drv->name, voice_size);
     }
 }
 
@@ -273,13 +273,11 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
         return NULL;
     }
 
-    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
-    if (!hw) {
-        dolog ("Can not allocate voice `%s' size %d\n",
-               drv->name, glue (drv->voice_size_, TYPE));
-        return NULL;
-    }
-
+    /*
+     * Since glue(s->nb_hw_voices_, TYPE) is != 0, glue(drv->voice_size_, TYPE)
+     * is guaranteed to be != 0. See the audio_init_nb_voices_* functions.
+     */
+    hw = g_malloc0(glue(drv->voice_size_, TYPE));
     hw->s = s;
     hw->pcm_ops = drv->pcm_ops;
 
-- 
2.35.3


