Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0874247D80
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:28:34 +0200 (CEST)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tEf-0006Ju-UF
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t68-0007Mw-HV; Tue, 18 Aug 2020 00:19:44 -0400
Received: from ozlabs.org ([203.11.71.1]:55169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t65-0006L7-Di; Tue, 18 Aug 2020 00:19:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNZ2Yp6z9sTv; Tue, 18 Aug 2020 14:19:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724366;
 bh=xULFcd8XyrPU5zk1hOCR/43qJSisf+K/JFQrUQ84++E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dirAgSMewWjsvIS6sJw1NAOT8N1OrAPcNHAIJQz0SHdDICqrxCKpd7eKoYntadS+4
 ppAmmmxWmEht/+P/5HREOtaRAPvVAWx7DnZ+1KfDSwiPT7zvkk3PJas6F53NsVPYq3
 Xq+jyX4Eppk6niU0Ydh8l/Op6W1vlKFfDc0Hnc2E=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/40] ppc/spapr: Fix 32 bit logical memory block size
 assumptions
Date: Tue, 18 Aug 2020 14:18:49 +1000
Message-Id: <20200818041922.251708-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 00:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Anton Blanchard <anton@ozlabs.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Blanchard <anton@ozlabs.org>

When testing large LMB sizes (eg 4GB), I found a couple of places
that assume they are 32bit in size.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20200715004228.1262681-1-anton@ozlabs.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0ae293ec94..a5bb0736e2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -558,7 +558,8 @@ static int spapr_dt_dynamic_reconfiguration_memory(SpaprMachineState *spapr,
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int ret, i, offset;
     uint64_t lmb_size = SPAPR_MEMORY_BLOCK_SIZE;
-    uint32_t prop_lmb_size[] = {0, cpu_to_be32(lmb_size)};
+    uint32_t prop_lmb_size[] = {cpu_to_be32(lmb_size >> 32),
+                                cpu_to_be32(lmb_size & 0xffffffff)};
     uint32_t *int_buf, *cur_index, buf_len;
     int nr_nodes = nb_numa_nodes ? nb_numa_nodes : 1;
     MemoryDeviceInfoList *dimms = NULL;
@@ -905,7 +906,8 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
     uint32_t lrdr_capacity[] = {
         cpu_to_be32(max_device_addr >> 32),
         cpu_to_be32(max_device_addr & 0xffffffff),
-        0, cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE),
+        cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE >> 32),
+        cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE & 0xffffffff),
         cpu_to_be32(ms->smp.max_cpus / ms->smp.threads),
     };
     uint32_t maxdomain = cpu_to_be32(spapr->gpu_numa_id > 1 ? 1 : 0);
-- 
2.26.2


