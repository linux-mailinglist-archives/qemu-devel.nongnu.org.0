Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2A553307
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:12:38 +0200 (CEST)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dgK-00051b-7h
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dU1-0007wQ-4n
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:53 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTw-0005Gy-4t
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:52 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id D73D19672BA
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:59:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655816386;
 bh=nsKkUaK2EK93OxjIqiHJcl/VbHmAJCurFQv5cCOIbOo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kWyz6nqlOWEhieovYagc0eIt7er25ZOotocgZz14qzuihEloyxpZmj40oiC66z0rK
 46YpGh56fds9rficsGzGdzMUZhP5EQOjmgqd6xbWUdYikL4dAErhS8VgptP0h2zBdW
 gvYjTFXkOj/n81OEQP16T8cim9mqvmnt3QTlIZSo=
Received: from fx403 (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 4D4C296712A;
 Tue, 21 Jun 2022 14:59:36 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <9423.62b1c0b4.8c481.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx403.security-mail.net (Postfix) with ESMTPS id 8F8E1967044;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 6CE0E27E04EC;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 4A1B127E04D9;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 4A1B127E04D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655816372;
 bh=Wjr9hLCi68aBpSzJANk0E0vII78adVAOp9ndS9oOkGM=;
 h=From:To:Date:Message-Id;
 b=Aad0SbCVaeJyg1Ja154NqIDM0ED6k8Em+FQn/32bgsz+YiWdUTKadzUpIh4/P0c/M
 GdBSQdGjfu/WcsZr5IB7Oe8zXn2gYen+Vt45S7LaJy8WGkbfnl6qCnQV9IOZJsee7E
 u7uYaG6v92tqqM2LhLxZXo9gyGxM0sJ9Cg3888hE=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xPs4WDcr7fSg; Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 301DD27E04D6;
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
Subject: [PATCH v2 6/7] target/nios2: use semihosting_exit_request on
 semihosted exit syscall
Date: Tue, 21 Jun 2022 14:59:15 +0200
Message-Id: <20220621125916.25257-7-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220621125916.25257-1-lmichel@kalray.eu>
References: <20220621125916.25257-1-lmichel@kalray.eu>
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.143; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 target/nios2/nios2-semi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index ec88474a73..2624ef1539 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -29,10 +29,11 @@
 #include "qemu.h"
 #else
 #include "exec/softmmu-semi.h"
 #endif
 #include "qemu/log.h"
+#include "semihosting/semihost.h"
 
 #define HOSTED_EXIT  0
 #define HOSTED_INIT_SIM 1
 #define HOSTED_OPEN 2
 #define HOSTED_CLOSE 3
@@ -212,12 +213,11 @@ void do_nios2_semihosting(CPUNios2State *env)
 
     nr = env->regs[R_ARG0];
     args = env->regs[R_ARG1];
     switch (nr) {
     case HOSTED_EXIT:
-        gdb_exit(env->regs[R_ARG0]);
-        exit(env->regs[R_ARG0]);
+        semihosting_exit_request(env->regs[R_ARG0]);
     case HOSTED_OPEN:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-- 
2.17.1


