Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18725532E3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:05:29 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dZO-0002NK-3p
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTs-0007fH-VW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:44 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:33219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTr-0005GT-Ck
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:44 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id BA5EF9671C2
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655816381;
 bh=XVWQIrqLfbq44o7nhRpky02WJ56xIVfQPbtuiuuMCOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XZnNB6jif7O/XT0d3MpSdi1tYfAG4yltW/UIH1aFcgwRw5AkmMLMHHZG7F/9Q0X+f
 obSzfb1yN2ouOoh0D4eGg7G3ey19fdJHeRn/UuTcyIYlV8O7t0vgiLLUOa7qIgU2wx
 xL9Yf7Xhz6oMGPdWijvX8KAaFd6OJsBWbeFG5D2M=
Received: from fx403 (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 567B59670D9;
 Tue, 21 Jun 2022 14:59:35 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <400c.62b1c0b4.7ef03.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx403.security-mail.net (Postfix) with ESMTPS id 80522967042;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 6048A27E04DA;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 3EDD627E04F3;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 3EDD627E04F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655816372;
 bh=noDv+i8A3nUMntl+CKPUJTHI8Qi4mLZXGmf4EwFwLlc=;
 h=From:To:Date:Message-Id;
 b=rGriRCxXG3ZC4w/7NtbqxCTMzcmsmut6bsLOzgw5+XaO6JnOF8dUQOGvoBhxxC4cV
 r0UB/NWpA3J0yoLJeOPsTWfrGU6CVoWVOlktjmvNNBY6HOZVM5R+pDeDtLBv/V6OQq
 Vd1FAzpkjP83A3GBD9/RZjH5Yt/1KjhOOTYwJZTc=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CLUe1MjpELFi; Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 1A73127E04EE;
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
Subject: [PATCH v2 5/7] target/mips: use semihosting_exit_request on
 semihosted exit syscall
Date: Tue, 21 Jun 2022 14:59:14 +0200
Message-Id: <20220621125916.25257-6-lmichel@kalray.eu>
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
 target/mips/tcg/sysemu/mips-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index b4a383ae90..94be486925 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -245,11 +245,11 @@ void helper_do_semihosting(CPUMIPSState *env)
     char *p, *p2;
 
     switch (op) {
     case UHI_exit:
         qemu_log("UHI(%d): exit(%d)\n", op, (int)gpr[4]);
-        exit(gpr[4]);
+        semihosting_exit_request(gpr[4]);
     case UHI_open:
         GET_TARGET_STRING(p, gpr[4]);
         if (!strcmp("/dev/stdin", p)) {
             gpr[2] = 0;
         } else if (!strcmp("/dev/stdout", p)) {
-- 
2.17.1


