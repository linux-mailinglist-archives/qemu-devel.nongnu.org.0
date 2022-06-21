Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CEA5532E1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:05:03 +0200 (CEST)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dZ0-00022Y-6l
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTn-0007SI-9A
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:39 -0400
Received: from smtpout30.security-mail.net ([85.31.212.36]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTl-0005FR-14
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx301.security-mail.net (Postfix) with ESMTP id 7993424BD0EE
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655816374;
 bh=Vi1A8wBnLovlrTEdXogPrB/Mx/jPqmMzAtBqZuqPZn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=4yTZDrWhGlDt6VJFJZA+ZGI5qm7lQX9Ng4CdMvJaZ6rY2SfFkkVMdalmUd4uuYjSL
 KRjbz/fxj80EY381pCRIIu9aB4AV1DRHh5WaaC3N3v3YWOU8CfP2qPy4oaME3aIXgl
 A6W00Gt8gtGTIxtz3gyr9LUaqD5djYt6qeUYc+7k=
Received: from fx301 (localhost [127.0.0.1])
 by fx301.security-mail.net (Postfix) with ESMTP id E58CB24BD02F;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <bc1c.62b1c0b4.62b73.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx301.security-mail.net (Postfix) with ESMTPS id 6348724BD034;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 402AC27E04DD;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 1A0FC27E04D9;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1A0FC27E04D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655816372;
 bh=lXnnbnuAZ1izT8Grm0O8SSDegE9ud6CZeXY6J795CTc=;
 h=From:To:Date:Message-Id;
 b=GGGRn102NB/6MSMbhncDqQl9hqKp6IhKYKvjl/wKa+TwfloP01dzs4DtwUxuESpVy
 umxHF5i6oLg0oBKbcnoMBiIjL2uN59/22pg2C4Bt77HHiJJJCPtWYN644TmwRjaLyW
 v8cFFXPc/6p0uPJoVRzdBZ0zTYypwlfCBNLrYwOo=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ndm2hQNEER2W; Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id EE8EC27E04DD;
 Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
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
Subject: [PATCH v2 3/7] semihosting/arm-compat-semi: use
 semihosting_exit_request
Date: Tue, 21 Jun 2022 14:59:12 +0200
Message-Id: <20220621125916.25257-4-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220621125916.25257-1-lmichel@kalray.eu>
References: <20220621125916.25257-1-lmichel@kalray.eu>
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.36; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
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
 semihosting/arm-compat-semi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index b6ddaf863a..fad5116f3c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1253,12 +1253,11 @@ target_ulong do_common_semihosting(CPUState *cs)
              * allow the guest to specify the exit status code.
              * Everything else is considered an error.
              */
             ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
         }
-        gdb_exit(ret);
-        exit(ret);
+        semihosting_exit_request(ret);
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
         if (sizeof(target_ulong) == 8) {
             SET_ARG(0, elapsed);
         } else {
-- 
2.17.1


