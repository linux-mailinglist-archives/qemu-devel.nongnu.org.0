Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF632F1B7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:50:41 +0100 (CET)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEb2-00063J-KL
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp2-0003bl-UF
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:05 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:43386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDoz-00013i-RV
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6KX/np2kYBi2FRrqUgXjCrmDCyo03sXCWalXTRZD9rE=; b=Z8Q3OKXrbp2jsZlxIunJWmei4z
 i6kP+Gv8oIt0/t/CGL5WFVkKIJkBrzO3PAw4F1YnU1XldjKxS6/6MoDUoehRBDChtM3vd5cg99BDq
 QA3NsQY08EeOFaIGxUh1b8ZwdFkjtx51to1rEOu6DhdrJP9D5zAZfUgxWzMbrMZlFnwM=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/15] tests/tcg: Run timeout cmds using --foreground
Date: Fri,  5 Mar 2021 18:00:32 +0100
Message-Id: <20210305170045.869437-3-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601041, da=102572722,
 mc=531, sc=4, hc=527, sp=0, fso=30601041, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kbastian@mail.uni-paderborn.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

when trying to run successful short tests from the Makefile timeout would not
terminate. Rather it would wait until the time runs out. Excerpt from the
manpage:

--foreground
    when not running timeout directly from a shell prompt,
    allow COMMAND to read from the TTY and get TTY signals; in this mode, chil‐
    dren of COMMAND will not be timed out

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/Makefile.target | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 24d75a5801..34fd0e9f85 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -40,9 +40,10 @@ quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifdef CONFIG_USER_ONLY
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2 > $1.out,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+	"TEST",$3)
 else
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2,"TEST",$3)
 endif
 
 # $1 = test name, $2 = reference
-- 
2.30.1


