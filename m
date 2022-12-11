Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA4864923D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 04:22:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Cp7-0003OO-Eo; Sat, 10 Dec 2022 22:16:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1p4Cp4-0003NG-7j
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 22:16:14 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1p4Coz-0007Nn-Ss
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 22:16:13 -0500
X-QQ-mid: bizesmtp68t1670728113tw1prms0
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:08:33 +0800 (CST)
X-QQ-SSF: 00200000000000B0C000000A0000000
X-QQ-FEAT: FwowAM4HOqD0MX4fr09g1gU+O9pSWhElRWSrQMTZQAvohQVhkR2TtjhHVWaki
 xrL9WLw/+9C4mxo1/TyLonie/pkgtQ7TcLYcEbFPOOB7E8M9utjpyL7OOaNWVEdpQ/Gn6Nk
 LxqW8KropxFeiZwoKLxXb8qw8sZ/cNffqTsc/dOIQH1PUIe+Coy7Ndfm1LWlTqj9/Ww/q/y
 wQ18aeNO4CGXiWht//PIv/8muMUQg+uDSFHCPVISW6Yp8uOkaKMMmD0GgaGzSoRnDTIjELe
 v+ywrI1OCFSQwyGF4mR1USHcOClYiPHpfcB3u/AzLzdSCbCHS47mfQoHXqW5q4M4irR7kPu
 w/wTYj+xld/7ID+/2Xd3FlcEkzfq50RPXt//Zv/
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v3 02/16] hw/intc: Select MSI_NONBROKEN in RISC-V AIA
 interrupt controllers
Date: Sun, 11 Dec 2022 11:08:15 +0800
Message-Id: <20221211030829.802437-2-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


