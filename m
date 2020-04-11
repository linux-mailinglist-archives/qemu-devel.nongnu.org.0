Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D61A4DD4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Apr 2020 06:22:33 +0200 (CEST)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jN7f6-0001hv-QO
	for lists+qemu-devel@lfdr.de; Sat, 11 Apr 2020 00:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiangyifei@huawei.com>) id 1jN7Ze-0000N2-Od
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 00:16:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiangyifei@huawei.com>) id 1jN7ZT-0006M7-VL
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 00:16:53 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3739 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiangyifei@huawei.com>)
 id 1jN7ZT-0006L7-L6; Sat, 11 Apr 2020 00:16:43 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 74309DF672F0D1670750;
 Sat, 11 Apr 2020 12:16:40 +0800 (CST)
Received: from huawei.com (10.173.222.107) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sat, 11 Apr 2020
 12:16:33 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: [PATCH RFC v2 1/9] linux-header: Update linux/kvm.h
Date: Sat, 11 Apr 2020 12:14:19 +0800
Message-ID: <20200411041427.14828-2-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200411041427.14828-1-jiangyifei@huawei.com>
References: <20200411041427.14828-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.222.107]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: victor.zhangxiaofeng@huawei.com, zhang.zhanghailiang@huawei.com,
 sagark@eecs.berkeley.edu, yinyipeng1@huawei.com,
 kbastian@mail.uni-paderborn.de, anup.patel@wdc.com, Alistair.Francis@wdc.com,
 kvm-riscv@lists.infradead.org, palmer@dabbelt.com,
 Yifei Jiang <jiangyifei@huawei.com>, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update linux/kvm.h to commit b9a6e4cd9 on https://github.com/kvm-riscv/linux.
Only use this header file, so do not update all linux headers.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 linux-headers/linux/kvm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 265099100e..7cfc111af5 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -236,6 +236,7 @@ struct kvm_hyperv_exit {
 #define KVM_EXIT_IOAPIC_EOI       26
 #define KVM_EXIT_HYPERV           27
 #define KVM_EXIT_ARM_NISV         28
+#define KVM_EXIT_RISCV_SBI        28
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -400,6 +401,13 @@ struct kvm_run {
 			__u64 esr_iss;
 			__u64 fault_ipa;
 		} arm_nisv;
+		/* KVM_EXIT_RISCV_SBI */
+		struct {
+			unsigned long extension_id;
+			unsigned long function_id;
+			unsigned long args[6];
+			unsigned long ret[2];
+		} riscv_sbi;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.19.1



