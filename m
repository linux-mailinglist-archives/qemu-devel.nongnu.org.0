Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07692513729
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:43:39 +0200 (CEST)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Mo-0002vc-3J
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.zuepke@tum.de>)
 id 1nk4D9-0000Jk-PG; Thu, 28 Apr 2022 09:29:36 -0400
Received: from postout2.mail.lrz.de ([129.187.255.138]:33823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.zuepke@tum.de>)
 id 1nk4D6-0008Ao-3l; Thu, 28 Apr 2022 09:29:35 -0400
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4KpxKK3psTzyXv;
 Thu, 28 Apr 2022 15:28:53 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
 reason="pass (just generated,
 assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tum.de; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received; s=
 tu-postout21; t=1651152533; bh=acyHZWQVK9LY1r702M5mrtiQhNjLFkGHn
 GKfGrCVdqU=; b=itWrc0Z1ftzRafyWtt6jhHAXoUXXeM6bER0D0xKMR09R/2oNZ
 NjKJpBSXunMLJvIT8kkuRYamzx6lQuIoLYviisSyB1AZT0Yiwc77yROe/LdLeJ1B
 En99aSX1B6bbToS/vr4VuHYIez4em37vzhCE8L/HXm3vPtxHleemgdMXTdDhkCRL
 0TtD4QBa+trQk2yNyAzWd6SQOEYI36WIT6VBvTjSq+jC6MlNvrQAWML4UA5jz3+J
 9QtU1vZlJSk/+dceqTY6JaVWgZdf37QSuOeODA9cV3vYI2IQunXz3VhTYEXhBqP5
 ifjB+gppuQEgvLjeSLTViIVhLa/2cz1NO63ww==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Score: -2.876
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new,
 port 20024)
 with LMTP id 5pNew0vEJQyk; Thu, 28 Apr 2022 15:28:53 +0200 (CEST)
Received: from hallertau.eduroam.mwn.de (unknown
 [IPv6:2001:4ca0:0:f293:6e92:3b1a:2684:1bf8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4KpxKJ4YnNzySR;
 Thu, 28 Apr 2022 15:28:52 +0200 (CEST)
From: Alex Zuepke <alex.zuepke@tum.de>
To: 
Subject: [PATCH] target/arm: read access to performance counters from EL0
Date: Thu, 28 Apr 2022 15:27:17 +0200
Message-Id: <20220428132717.84190-1-alex.zuepke@tum.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=129.187.255.138; envelope-from=alex.zuepke@tum.de;
 helo=postout2.mail.lrz.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Apr 2022 10:40:51 -0400
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
Cc: Alex Zuepke <alex.zuepke@tum.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ARMv8 manual defines that PMUSERENR_EL0.ER enables read-access
to both PMXEVCNTR_EL0 and PMEVCNTR<n>_EL0 registers, however,
we only use it for PMXEVCNTR_EL0. Extend to PMEVCNTR<n>_EL0 as well.

Signed-off-by: Alex Zuepke <alex.zuepke@tum.de>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63397bbac1..eb42b22766 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6679,10 +6679,10 @@ static void define_pmu_regs(ARMCPU *cpu)
               .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
               .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
               .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
-              .accessfn = pmreg_access },
+              .accessfn = pmreg_access_xevcntr },
             { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 8 | (3 & (i >> 3)),
-              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access_xevcntr,
               .type = ARM_CP_IO,
               .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
               .raw_readfn = pmevcntr_rawread,
-- 
2.25.1


