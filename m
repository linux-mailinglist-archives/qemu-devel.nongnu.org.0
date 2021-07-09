Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3213C1EEF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:32:06 +0200 (CEST)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j7O-0005Fy-0h
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itg-00014O-7w; Fri, 09 Jul 2021 01:17:56 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52645 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1ite-0001yC-3q; Fri, 09 Jul 2021 01:17:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd4whpz9srX; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=VUe7ZSHiWg41MtgkPuVTCh1/VfI/d8Vldeew52mc0ok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c1ZmfHKGx3iVbjswwbl+5GBxH7cvRxmOEoz80L9L9DeBBfc8+Djux4TmFMFYeFDW1
 eZ/vRRk8Saj0tKr3P3jZ7vJPqxGxpjIeyowxGXI6O9wIGoC5GmlV/PVg7E1n57XTPq
 ujR5W3i5w4ihB+qKTxWUtqf0hwjjUDo8MGYhAm9k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 12/33] target/ppc: Restrict ppc_cpu_tlb_fill to TCG
Date: Fri,  9 Jul 2021 15:17:07 +1000
Message-Id: <20210709051728.170203-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This function is used by TCGCPUOps, and is thus TCG specific.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210621125115.67717-10-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index a0e4e027d3..ba1952c77d 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2948,6 +2948,7 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     return -1;
 }
 
+#ifdef CONFIG_TCG
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
@@ -2968,3 +2969,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
     raise_exception_err_ra(&cpu->env, cs->exception_index,
                            cpu->env.error_code, retaddr);
 }
+#endif
-- 
2.31.1


