Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D064570B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rHf-0004M1-5d; Wed, 07 Dec 2022 05:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1p2rHX-0004DB-1t
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:04:03 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1p2rHS-0004vn-Df
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 05:04:02 -0500
X-QQ-mid: bizesmtp63t1670407420tm26z279
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Dec 2022 18:03:39 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: 7jw2iSiCazoEMnyN6KP7IZRKO515HocxQyF6s598kRJ6G2Z5BZ//fSfsfxWue
 kX11qbvYZw5urRspd+ro+LOGkjU/5Y9n4AvYhcVpHsAZJD4SKhwlDnDhlrRw7FHFbkQ82B0
 oeJLmua1z8+Tu2Eo+F+pQYHmZXqeOjb/XGe1HgKIHJFN8R39C0Q5K/UDz8b5jzLzCLFfszX
 +H95rvg1mkKfwKQePc8BUegF6xJfdkI1yhh8yMxDKhMPnbabML96/Q1AsJLk4VsBhzRKfgi
 j89afMObRMivuoxRdNrRcOAmJ/jx4T7qK2y+ptXfX/ypWa79+ftjlgngdYOZfsl6Pnz9EdQ
 O+xolAFFnybT4GVcKtqsylGmQdeWKrbW774BDRRw++NV1ZQS+U=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v2 02/16] hw/intc: Select MSI_NONBROKEN in RISC-V AIA
 interrupt controllers
Date: Wed,  7 Dec 2022 18:03:21 +0800
Message-Id: <20221207100335.290481-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207100335.290481-1-bmeng@tinylab.org>
References: <20221207100335.290481-1-bmeng@tinylab.org>
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

hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
controllers regardless of how MSI is implemented. msi_nonbroken is
initialized to true in both riscv_aplic_realize() and
riscv_imsic_realize().

Select MSI_NONBROKEN in RISCV_APLIC and RISCV_IMSIC.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/intc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 1d4573e803..21441d0a0c 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -72,9 +72,11 @@ config RISCV_ACLINT
 
 config RISCV_APLIC
     bool
+    select MSI_NONBROKEN
 
 config RISCV_IMSIC
     bool
+    select MSI_NONBROKEN
 
 config SIFIVE_PLIC
     bool
-- 
2.34.1


