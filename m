Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6563F25A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0kFD-0008FO-Jp; Thu, 01 Dec 2022 09:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF9-0008By-9z; Thu, 01 Dec 2022 09:08:52 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kF7-0008Dw-A8; Thu, 01 Dec 2022 09:08:51 -0500
X-QQ-mid: bizesmtp72t1669903715tvdb453j
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:34 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: 3M0okmaRx3gHCGFyDb8EnnhBlfDgj9RtMorg6HfkxpUfHsaqvYg5Ucsg4CtfC
 ajB28lhuArEC7kgdG/pYeJWSe508iCeHrI03fu2bB1ewKv8zSlxh+Cr8Fimo60JFRWT6Ov2
 X3nSYU4t6bfTlyYCN7DqFQTH64JlhlzOUD9wUq0DYQWGvWSQMW7XaGTZ16ufnAYxiXtLpwt
 5IJy/VDiE6jxqCoHa8YsRGpXzhzQO8O6wKSUcJx/eawfDgq+Z1YVw2Vi6DYEeePrALXtiaf
 pp7PI5tpgnLZWE7/H79XvU67ZShDanZ5rltT1eUOTQi5YzE0/fLkH1cDdMBCWCbFXY6CPEF
 TLaZUs1RbqfvTV+iIQTw/jNOAZjOiJaPa8YI/gJutc2TVLVPYkAOrjgZHXEbA==
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 10/15] hw/riscv: sifive_e: Fix the number of interrupt sources
 of PLIC
Date: Thu,  1 Dec 2022 22:08:06 +0800
Message-Id: <20221201140811.142123-10-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Per chapter 10 in Freedom E310 manuals [1][2][3], E310 G002 and G003
supports 52 interrupt sources while G000 supports 51 interrupt sources.

We use the value of G002 and G003, so it is 53 (including source 0).

[1] G000 manual:
https://sifive.cdn.prismic.io/sifive/4faf3e34-4a42-4c2f-be9e-c77baa4928c7_fe310-g000-manual-v3p2.pdf

[2] G002 manual:
https://sifive.cdn.prismic.io/sifive/034760b5-ac6a-4b1c-911c-f4148bb2c4a5_fe310-g002-v1p5.pdf

[3] G003 manual:
https://sifive.cdn.prismic.io/sifive/3af39c59-6498-471e-9dab-5355a0d539eb_fe310-g003-manual.pdf

Fixes: eb637edb1241 ("SiFive Freedom E Series RISC-V Machine")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/hw/riscv/sifive_e.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index d738745925..9e58247fd8 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -82,7 +82,12 @@ enum {
 };
 
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
-#define SIFIVE_E_PLIC_NUM_SOURCES 127
+/*
+ * Freedom E310 G002 and G003 supports 52 interrupt sources while
+ * Freedom E310 G000 supports 51 interrupt sources. We use the value
+ * of G002 and G003, so it is 53 (including interrupt source 0).
+ */
+#define SIFIVE_E_PLIC_NUM_SOURCES 53
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
 #define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
-- 
2.34.1


