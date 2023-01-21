Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FE9676571
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 10:49:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJATt-0006hG-2t; Sat, 21 Jan 2023 04:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATg-0006en-N2
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:48:01 -0500
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATe-00039u-Or
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:48:00 -0500
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout06.t-online.de (Postfix) with SMTP id 7A2D91E649;
 Sat, 21 Jan 2023 10:47:57 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pJATa-0lI8Uz0; Sat, 21 Jan 2023 10:47:54 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5043C2006E6; Sat, 21 Jan 2023 10:47:35 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] audio: remove audio_calloc() function
Date: Sat, 21 Jan 2023 10:47:33 +0100
Message-Id: <20230121094735.11644-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1674294474-16FFC778-9EAF997E/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f3ab365-bfb9-4c7f-ab5d-53c525beb429
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
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

Now that the last call site of audio_calloc() was removed, remove
the unused audio_calloc() function.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c     | 20 --------------------
 audio/audio_int.h |  1 -
 2 files changed, 21 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index ac5434a13c..fb0d4a2cac 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -147,26 +147,6 @@ static inline int audio_bits_to_index (int bits)
     }
 }
 
-void *audio_calloc (const char *funcname, int nmemb, size_t size)
-{
-    int cond;
-    size_t len;
-
-    len = nmemb * size;
-    cond = !nmemb || !size;
-    cond |= nmemb < 0;
-    cond |= len < size;
-
-    if (audio_bug ("audio_calloc", cond)) {
-        AUD_log (NULL, "%s passed invalid arguments to audio_calloc\n",
-                 funcname);
-        AUD_log (NULL, "nmemb=%d size=%zu (len=%zu)\n", nmemb, size, len);
-        return NULL;
-    }
-
-    return g_malloc0 (len);
-}
-
 void AUD_vlog (const char *cap, const char *fmt, va_list ap)
 {
     if (cap) {
diff --git a/audio/audio_int.h b/audio/audio_int.h
index ce2d6bf92c..5028f2354a 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -251,7 +251,6 @@ void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as);
 void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, int len);
 
 int audio_bug (const char *funcname, int cond);
-void *audio_calloc (const char *funcname, int nmemb, size_t size);
 
 void audio_run(AudioState *s, const char *msg);
 
-- 
2.35.3


