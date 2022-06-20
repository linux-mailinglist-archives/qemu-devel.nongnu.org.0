Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6310551F06
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:38:00 +0200 (CEST)
Received: from localhost ([::1]:34900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IXP-000700-Ur
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IL8-0005hn-NU
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:18 -0400
Received: from smtpout140.security-mail.net ([85.31.212.148]:38379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IL5-0001SC-Ms
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx408.security-mail.net (Postfix) with ESMTP id 74D1A1B7B1BD
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655735112;
 bh=Vi1A8wBnLovlrTEdXogPrB/Mx/jPqmMzAtBqZuqPZn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lWw7ZzpNUTJjYg7BBnU8Ecumf9lnucAb+vs7iV/fBeiZnqTJX38Cdb7X1ljprnJyn
 OjANauefCHxr0dyGGXj+ZeAwPXm2JVeWGLHOaAnWB0EEMqSygF08NzbSbh5zUK2tSc
 WJZADNStikFD3gM1KW9ab1hAkKY/nXboaC6Jf6hk=
Received: from fx408 (localhost [127.0.0.1])
 by fx408.security-mail.net (Postfix) with ESMTP id 2BD371B7B075;
 Mon, 20 Jun 2022 16:25:10 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <76b9.62b08345.acbad.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx408.security-mail.net (Postfix) with ESMTPS id AD76B1B7B194;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 8362427E04D6;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 6D11927E04D9;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6D11927E04D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655735109;
 bh=lXnnbnuAZ1izT8Grm0O8SSDegE9ud6CZeXY6J795CTc=;
 h=From:To:Date:Message-Id;
 b=NfhTAwoIsCWF+FbsJAoOswBkjqQTaiAnYXw4JDsBLnUrLmfShle8/q//G/iOa7KBc
 TNgw0ISAjxaCWi4B9QexfQAmXb1g1zLbVR8zvE08OpOaYDCDAk1Qn4C11O4CnF/+qH
 92j4q9m4O439DktjbxQWbCokcfnVJ0cgWp4mFlV4=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BGWdhZ2Bgw3e; Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 47E6F27E04B5;
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
Subject: [PATCH 3/7] semihosting/arm-compat-semi: use semihosting_exit_request
Date: Mon, 20 Jun 2022 16:24:22 +0200
Message-Id: <20220620142426.15040-5-lmichel@kalray.eu>
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


