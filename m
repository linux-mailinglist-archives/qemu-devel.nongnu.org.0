Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382495532E2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:05:25 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dZM-0002FI-AX
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTo-0007Us-Md
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:40 -0400
Received: from smtpout140.security-mail.net ([85.31.212.145]:55642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTm-0005Fk-VV
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:40 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 7844D3237EE
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655816377;
 bh=T95sWA5zxe4fWS53roiVVcEs3JYFnRvZjn+m8zQR/+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KiwOSynB/9pD5NKSeZbVf5fGdfa8j2CY0KNKBkJkyEzI5w8NBnUoxusbTUh3spK6L
 fg9EmMDPMvuBc9mcJ4OmfSlN314lmsbhiGU9x4Qq0JTFwwOkzBWkasshXck8Q7lxBu
 oT41XdFuDMMQoNxf0a7LVGbGe4YOdyIsGfTEwvHE=
Received: from fx405 (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 20B763237FE;
 Tue, 21 Jun 2022 14:59:33 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <f1b7.62b1c0b4.6f864.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx405.security-mail.net (Postfix) with ESMTPS id 70F923237DE;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 4A40627E04ED;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 2AA1227E04DA;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2AA1227E04DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655816372;
 bh=pqO+2rhibMGYfEqFI+8R0ermok68nZKn3dLnJ/SKXcM=;
 h=From:To:Date:Message-Id;
 b=UfhRlLhajskIWvo78FlDaQA2qTw00tnYUifN/YidOIhzmpMsrPLgUXFTkSMWQqnK+
 bMAG3ddGi6KtgzxEqmhqC1GtlJ7yrOO9ySB+Fe5C/PINb1Px95bz5xvKPUUEz/udYf
 r8/9iME8ndFRgo2gSKw8DE5ZALMCfgcEM+ebYfxU=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JC5pIfsblZHt; Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 0DAD227E04ED;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 4/7] target/m68k: use semihosting_exit_request on
 semihosted exit syscall
Date: Tue, 21 Jun 2022 14:59:13 +0200
Message-Id: <20220621125916.25257-5-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220621125916.25257-1-lmichel@kalray.eu>
References: <20220621125916.25257-1-lmichel@kalray.eu>
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.145; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use the new semihosting_exit_request instead of a call to exit when
handling a semihosted exit syscall.

Signed-off-by: Luc Michel <lmichel@kalray.eu>
---
 target/m68k/m68k-semi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 37343d47e2..b3de3c6874 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -27,10 +27,11 @@
 #else
 #include "exec/softmmu-semi.h"
 #include "hw/boards.h"
 #endif
 #include "qemu/log.h"
+#include "semihosting/semihost.h"
 
 #define HOSTED_EXIT  0
 #define HOSTED_INIT_SIM 1
 #define HOSTED_OPEN 2
 #define HOSTED_CLOSE 3
@@ -193,12 +194,11 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
     uint32_t result;
 
     args = env->dregs[1];
     switch (nr) {
     case HOSTED_EXIT:
-        gdb_exit(env->dregs[0]);
-        exit(env->dregs[0]);
+        semihosting_exit_request(env->dregs[0]);
     case HOSTED_OPEN:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-- 
2.17.1


