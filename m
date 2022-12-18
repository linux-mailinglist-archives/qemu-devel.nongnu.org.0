Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE854650422
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xGk-0007nL-WF; Sun, 18 Dec 2022 12:16:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGg-0007gI-K5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:06 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGf-0002XX-1x
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:06 -0500
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout08.t-online.de (Postfix) with SMTP id 552754D9D;
 Sun, 18 Dec 2022 18:15:44 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd86.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGH-12kBwv0; Sun, 18 Dec 2022 18:15:41 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 143FE20045A; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 02/11] audio: don't show unnecessary error messages
Date: Sun, 18 Dec 2022 18:15:30 +0100
Message-Id: <20221218171539.11193-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383741-D9A4E9D3-8DBE0184/0/0 CLEAN NORMAL
X-TOI-MSGID: 293c7602-e4a2-4123-a5da-c2ae87c1a525
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
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

Let the audio_pcm_create_voice_pair_* functions handle error
reporting. This avoids an additional error message in case
the guest selected an unimplemented sample rate.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index bfa94b4d22..ee320a2e3f 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -421,6 +421,7 @@ static SW *glue(audio_pcm_create_voice_pair_, TYPE)(
 
     hw = glue(audio_pcm_hw_add_, TYPE)(s, &hw_as);
     if (!hw) {
+        dolog("Could not create a backend for voice `%s'\n", sw_name);
         goto err2;
     }
 
@@ -520,7 +521,6 @@ SW *glue (AUD_open_, TYPE) (
     } else {
         sw = glue(audio_pcm_create_voice_pair_, TYPE)(s, name, as);
         if (!sw) {
-            dolog ("Failed to create voice `%s'\n", name);
             return NULL;
         }
     }
-- 
2.35.3


