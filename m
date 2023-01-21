Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F2676582
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 10:52:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJATq-0006fj-Bx; Sat, 21 Jan 2023 04:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATR-0006cp-T3
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:58 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATP-00037K-VW
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:45 -0500
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout08.t-online.de (Postfix) with SMTP id C7E9624B5C;
 Sat, 21 Jan 2023 10:47:38 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd83.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pJATJ-1CXczB0; Sat, 21 Jan 2023 10:47:38 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 3D909200625; Sat, 21 Jan 2023 10:47:35 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] audio: don't show unnecessary error messages
Date: Sat, 21 Jan 2023 10:47:26 +0100
Message-Id: <20230121094735.11644-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1674294458-422C1378-19DE3AF6/0/0 CLEAN NORMAL
X-TOI-MSGID: aba94bb6-ca4e-4615-9bd1-db7656018a60
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

Let the audio_pcm_create_voice_pair_* functions handle error
reporting. This avoids an additional error message in case
the guest selected an unimplemented sample rate.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


