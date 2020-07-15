Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C3922017A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 02:43:53 +0200 (CEST)
Received: from localhost ([::1]:45964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvVWa-0001sf-6N
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 20:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton@ozlabs.org>)
 id 1jvVVY-0001NI-1a; Tue, 14 Jul 2020 20:42:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53129 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton@ozlabs.org>)
 id 1jvVVV-0000rq-Ne; Tue, 14 Jul 2020 20:42:47 -0400
Received: by ozlabs.org (Postfix, from userid 1010)
 id 4B5zB25fnXz9sSJ; Wed, 15 Jul 2020 10:42:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594773754; bh=/TyJzMbOJQa9CTD0cHsHyVEACrfeVc4/HM858imVirU=;
 h=From:To:Cc:Subject:Date:From;
 b=AlkYxLnZ0mDwWTVrPwdGCiThbGFOaVaSsIzxCox/5sdlN6FexE33E5s8IDdryyKWm
 36YA2GlgA/gYqg/hPY7wZpozE+XKxgVzfbuYjrcyhMn+Gf9P8064Gb4FSs6z9rPqPi
 M5vVtSfwNL57rzcn8lNHsvFNVz3p0YXfVQsphsm+QXNlFWyxnIhl8H/IPPGluUP4cU
 pPui8XSworvJ9Y3Sy/vx/+dmqboJd/kjr6tAAvTLD+75HxJ9lf5fS/fQWopwtFUuRS
 x91wBXISFkhAdc5Za3sTzslrrArfxz2vkfGcNprHgXOz6M9PH03ZYr+/RvrkEP27Ee
 mYXfDdHfdl+eQ==
From: Anton Blanchard <anton@ozlabs.org>
To: david@gibson.dropbear.id.au, groug@kaod.org, aik@ozlabs.ru,
 nathanl@linux.ibm.com
Subject: [PATCH] ppc/spapr: Fix 32 bit logical memory block size assumptions
Date: Wed, 15 Jul 2020 10:42:28 +1000
Message-Id: <20200715004228.1262681-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=anton@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 20:42:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When testing large LMB sizes (eg 4GB), I found a couple of places
that assume they are 32bit in size.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 hw/ppc/spapr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a1b06defe6..0ba2526215 100644
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
@@ -899,7 +900,8 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
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


