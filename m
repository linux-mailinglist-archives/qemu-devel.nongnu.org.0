Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F5650421
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xGk-0007jo-1p; Sun, 18 Dec 2022 12:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGZ-0007fD-H9
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:15:59 -0500
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGX-0002Vd-U4
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:15:59 -0500
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout02.t-online.de (Postfix) with SMTP id E013913CF0;
 Sun, 18 Dec 2022 18:15:53 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd78.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGT-2SdF690; Sun, 18 Dec 2022 18:15:53 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 210B720063B; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Date: Sun, 18 Dec 2022 18:15:35 +0100
Message-Id: <20221218171539.11193-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383753-793AD9DD-D542E205/0/0 CLEAN NORMAL
X-TOI-MSGID: c2a017f4-8f42-4098-b3d3-602be6f7368e
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

Use g_malloc0() as a direct replacement for audio_calloc().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index d343a1dcb3..5f51ef26b2 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -273,7 +273,7 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
         return NULL;
     }
 
-    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
+    hw = g_malloc0(glue(drv->voice_size_, TYPE));
     if (!hw) {
         dolog ("Can not allocate voice `%s' size %d\n",
                drv->name, glue (drv->voice_size_, TYPE));
-- 
2.35.3


