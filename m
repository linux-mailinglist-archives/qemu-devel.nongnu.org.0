Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FF4264AC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 08:34:10 +0200 (CEST)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYjSL-0000gL-AU
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 02:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1mYjQE-0006oa-7E
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 02:31:59 -0400
Received: from mga04.intel.com ([192.55.52.120]:33254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1mYjQB-0001r3-Ia
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 02:31:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225221395"
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="225221395"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 23:31:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="590443113"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.22])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 23:31:46 -0700
From: Yuan Yao <yuan.yao@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/1] i386/monitor: Fix inverse PG_PRESENT_MASK checking in
 mem_info_la57()
Date: Fri,  8 Oct 2021 14:31:40 +0800
Message-Id: <20211008063140.9778-1-yuan.yao@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yuan.yao@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Yuan Yao <yuan.yao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The inverse pdpe/pde PG_PRESENT_MASK checking causes no
mapping information was collected from "info mem" for guest
with LA57 enabled.

Fixes: 6c7c3c21f9 ("x86: implement la57 paging mode")
Signed-off-by: Yuan Yao <yuan.yao@intel.com>
---
 target/i386/monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 196c1c9e77..8c6b91a313 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -491,7 +491,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
                 cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
                 pdpe = le64_to_cpu(pdpe);
                 end = (l0 << 48) + (l1 << 39) + (l2 << 30);
-                if (pdpe & PG_PRESENT_MASK) {
+                if (!(pdpe & PG_PRESENT_MASK)) {
                     prot = 0;
                     mem_print(mon, env, &start, &last_prot, end, prot);
                     continue;
@@ -510,7 +510,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
                     cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
                     pde = le64_to_cpu(pde);
                     end = (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 << 21);
-                    if (pde & PG_PRESENT_MASK) {
+                    if (!(pde & PG_PRESENT_MASK)) {
                         prot = 0;
                         mem_print(mon, env, &start, &last_prot, end, prot);
                         continue;
-- 
2.17.1


