Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED8320B69
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:32:00 +0100 (CET)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqiF-00024n-Tq
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDost-0003IT-0t; Sun, 21 Feb 2021 08:34:52 -0500
Received: from atcsqr.andestech.com ([60.248.187.195]:45098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDosk-0001Yk-Oc; Sun, 21 Feb 2021 08:34:50 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 11LDSTmj059349;
 Sun, 21 Feb 2021 21:28:29 +0800 (GMT-8)
 (envelope-from cwshu@andestech.com)
Received: from ubuntu1604.andestech.com (10.0.12.177) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; 
 Sun, 21 Feb 2021 21:33:58 +0800
From: Jim Shu <cwshu@andestech.com>
To: 
Subject: [PATCH 2/3] target/riscv: add log of PMP permission checking
Date: Sun, 21 Feb 2021 21:32:49 +0800
Message-ID: <1613914370-17285-3-git-send-email-cwshu@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613914370-17285-1-git-send-email-cwshu@andestech.com>
References: <1613914370-17285-1-git-send-email-cwshu@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.12.177]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 11LDSTmj059349
Received-SPF: pass client-ip=60.248.187.195; envelope-from=cwshu@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Feb 2021 10:29:58 -0500
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jim Shu <cwshu@andestech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like MMU translation, add qemu log of PMP permission checking for
debugging.

Signed-off-by: Jim Shu <cwshu@andestech.com>
---
 target/riscv/cpu_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f6ac63bf0e..c1ecb8a710 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -794,6 +794,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             if (ret == TRANSLATE_SUCCESS) {
                 ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
                                                size, access_type, mode);
+
+                qemu_log_mask(CPU_LOG_MMU,
+                              "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                              " %d tlb_size " TARGET_FMT_lu "\n",
+                              __func__, pa, ret, prot_pmp, tlb_size);
+
                 prot &= prot_pmp;
             }
 
@@ -821,6 +827,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         if (ret == TRANSLATE_SUCCESS) {
             ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
                                            size, access_type, mode);
+
+            qemu_log_mask(CPU_LOG_MMU,
+                          "%s PMP address=" TARGET_FMT_plx " ret %d prot"
+                          " %d tlb_size " TARGET_FMT_lu "\n",
+                          __func__, pa, ret, prot_pmp, tlb_size);
+
             prot &= prot_pmp;
         }
     }
-- 
2.30.1


