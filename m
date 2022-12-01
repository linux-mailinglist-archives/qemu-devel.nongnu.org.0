Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BF63F259
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:11:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0kFP-0008KD-RT; Thu, 01 Dec 2022 09:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFJ-0008I0-HQ; Thu, 01 Dec 2022 09:09:01 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFH-0008Gl-91; Thu, 01 Dec 2022 09:09:00 -0500
X-QQ-mid: bizesmtp72t1669903727tpb30y9k
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:46 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: mRz6/7wsmIjz7iBzXQ6T7TDKpVMVHAzVJ8SJBrdUUc55FHvDTKpt5XWyU7RDw
 RWw00QoPbOIrww5rYzbhiW1FB3pysh2NdPtVojVxEvECrNFG10717i7P8lhrY1rpLhw/FkF
 HWCJtJPQMTZ0PGDvB+LuhQlpaTF5HnWJKWBc11DpRT5K3AxYuEvTByq4w+xoj2J8+NMwYlb
 ZIeSGJgWwUB6C49N0YzRBiCKqYukfKl65GVyxshpuiUOgYQ9apsSvux72StgHJ1PbgtfHaE
 wI7bC5+efqoqXECH99QRiQUuvLMR9beQfcAIbbMS1hjCKRpRqYtSrxBTFTAEKd9B87AVD+T
 3fI9ruHGeBu6oKGIceNs1kw18cZXD5taoPD6nhEK458biS7YeY=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 15/15] hw/intc: sifive_plic: Fix the pending register range
 check
Date: Thu,  1 Dec 2022 22:08:11 +0800
Message-Id: <20221201140811.142123-15-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
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

The pending register upper limit is currently set to
plic->num_sources >> 3, which is wrong, e.g.: considering
plic->num_sources is 7, the upper limit becomes 0 which fails
the range check if reading the pending register at pending_base.

Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
Signed-off-by: Bin Meng <bmeng@tinylab.org>

---

 hw/intc/sifive_plic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 7a6a358c57..a3fc8222c7 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -143,7 +143,8 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
         uint32_t irq = (addr - plic->priority_base) >> 2;
 
         return plic->source_priority[irq];
-    } else if (addr_between(addr, plic->pending_base, plic->num_sources >> 3)) {
+    } else if (addr_between(addr, plic->pending_base,
+                            (plic->num_sources + 31) >> 3)) {
         uint32_t word = (addr - plic->pending_base) >> 2;
 
         return plic->pending[word];
@@ -202,7 +203,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
             sifive_plic_update(plic);
         }
     } else if (addr_between(addr, plic->pending_base,
-                            plic->num_sources >> 3)) {
+                            (plic->num_sources + 31) >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
                       __func__, addr);
-- 
2.34.1


