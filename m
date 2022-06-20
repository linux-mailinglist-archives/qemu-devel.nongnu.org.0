Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164D551ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:29:02 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IOj-0001py-08
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3ILA-0005mm-2y
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:20 -0400
Received: from smtpout140.security-mail.net ([85.31.212.148]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IL8-0001TA-DD
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:19 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx408.security-mail.net (Postfix) with ESMTP id 28C041B7B1EC
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655735117;
 bh=XVWQIrqLfbq44o7nhRpky02WJ56xIVfQPbtuiuuMCOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=3tr+0L5YqyNpWLGw5gwpz6I/Ep5raljrQFXIi2VAC7GR1Hu/5e/FA5/JclfqysZEM
 LR6mSAVHfMtfkSqZdryH5EXuN7ZJE6bB+Ipa7bhD0Dn8ZSyhxtv+a5hvUfoK24ek0Z
 9kNFFWZkfvv/QmRg8UoCzRf7CwtnATOBHWx/Uga0=
Received: from fx408 (localhost [127.0.0.1])
 by fx408.security-mail.net (Postfix) with ESMTP id 843A11B7AC88;
 Mon, 20 Jun 2022 16:25:10 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <6381.62b08345.c81a6.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx408.security-mail.net (Postfix) with ESMTPS id 0B0751B7B1FA;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id A895027E04DA;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 89F8F27E04B5;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 89F8F27E04B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655735109;
 bh=noDv+i8A3nUMntl+CKPUJTHI8Qi4mLZXGmf4EwFwLlc=;
 h=From:To:Date:Message-Id;
 b=EPLXpF+2Cr5+sh8NW1WoYT+4hyJgJtd31f+gySyT9Iwa/aIYhoNw5a1jKfL4OB6td
 +6AoE6Jsh+uSbUTusF1QqssE5zsUD7FBEp78w8dK+6kFqNJ1Pd3wqnyqTFQsLpJxqP
 M8v0t7K7/DptRCnjbTDI5m4SXF1+AfnR8z9C9pbE=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3xdtOcjnUa1w; Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 698F527E04ED;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
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
Subject: [PATCH 5/7] target/mips: use semihosting_exit_request on semihosted
 exit syscall
Date: Mon, 20 Jun 2022 16:24:24 +0200
Message-Id: <20220620142426.15040-7-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220620142426.15040-1-lmichel@kalray.eu>
References: <20220620142426.15040-1-lmichel@kalray.eu>
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.148; envelope-from=lmichel@kalray.eu;
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


