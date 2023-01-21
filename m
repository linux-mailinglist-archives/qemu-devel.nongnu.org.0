Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933A4676583
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 10:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJATq-0006g9-V9; Sat, 21 Jan 2023 04:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATW-0006d1-4C
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:58 -0500
Received: from mailout09.t-online.de ([194.25.134.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pJATS-000387-W0
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:47:48 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout09.t-online.de (Postfix) with SMTP id 783661FDA7;
 Sat, 21 Jan 2023 10:47:44 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pJATM-4fCE0P0; Sat, 21 Jan 2023 10:47:40 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 3FD3020062C; Sat, 21 Jan 2023 10:47:35 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 03/11] audio: rename hardware store to backend
Date: Sat, 21 Jan 2023 10:47:27 +0100
Message-Id: <20230121094735.11644-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1674294460-CF7FE046-A7E163BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 67b8d07f-9b34-4b8f-ad5d-cdbae661f8e5
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
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

Use a consistent friendly name for the HWVoiceOut and HWVoiceIn
structures.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_template.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index ee320a2e3f..ac744d3484 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -509,8 +509,8 @@ SW *glue (AUD_open_, TYPE) (
         HW *hw = sw->hw;
 
         if (!hw) {
-            dolog ("Internal logic error voice `%s' has no hardware store\n",
-                   SW_NAME (sw));
+            dolog("Internal logic error: voice `%s' has no backend\n",
+                  SW_NAME(sw));
             goto fail;
         }
 
-- 
2.35.3


