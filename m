Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0854460C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 10:39:07 +0200 (CEST)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzDh3-0003kx-Rm
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 04:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1nzDdU-00029u-B1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:35:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:24712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1nzDdR-0000w4-94
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654763721; x=1686299721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mb9drMdZUb6Nhf/Yxj9XDL9XwQjSMyCXPhW6oSwgMTY=;
 b=ONm9/GjB6U4Mv36L0zqs/8Tjn1jBYv3LrYVWrUkznE3ATqAxwMj74+5r
 Uae643bBa6Pkj/atefUWcQXYzlO2d+wyaRX49kHrdnPFo9tNGNJhqJnqH
 BuctysSuDVg1Tar3MMBrsI4VvTlvI2hEd8NfUjZnOq2eZFZwOzM+vrPdF
 VAExSFo2BVqLPUDrIAK0hIMG15fND2LIT7K9N5ebrDz0LTGrW7pvHarlU
 YGh8wwSAb8hjXo7HhbDDdDhhJlqgvFvL645e858r6VGCfqjwP+qoH8hd9
 ywy0N+37eYGVOpCiAqUjU8jaJc+KoViHKLaDN+adOFfJtHDycJIl3xAib g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341283588"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341283588"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 01:35:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="649105914"
Received: from sqa-gate.sh.intel.com (HELO embargo.tsp.org) ([10.239.48.212])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 01:35:08 -0700
From: Yuan Yao <yuan.yao@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, Connor Kuehl <ckuehl@redhat.com>
Cc: qemu-devel@nongnu.org, Yuan Yao <yuan.yao@intel.com>,
 Yamahata Isaku <isaku.yamahata@intel.com>
Subject: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Date: Thu,  9 Jun 2022 16:34:56 +0800
Message-Id: <20220609083456.77946-1-yuan.yao@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100; envelope-from=yuan.yao@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't skip next leve page table for pdpe/pde when the
PG_PRESENT_MASK is set.

This fixs the issue that no mapping information was
collected from "info mem" for guest with LA57 enabled.

Signed-off-by: Yuan Yao <yuan.yao@intel.com>
---
 target/i386/monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 8e4b4d600c..3339550bbe 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -489,7 +489,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
                 cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
                 pdpe = le64_to_cpu(pdpe);
                 end = (l0 << 48) + (l1 << 39) + (l2 << 30);
-                if (pdpe & PG_PRESENT_MASK) {
+                if (!(pdpe & PG_PRESENT_MASK)) {
                     prot = 0;
                     mem_print(mon, env, &start, &last_prot, end, prot);
                     continue;
@@ -508,7 +508,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env)
                     cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
                     pde = le64_to_cpu(pde);
                     end = (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 << 21);
-                    if (pde & PG_PRESENT_MASK) {
+                    if (!(pde & PG_PRESENT_MASK)) {
                         prot = 0;
                         mem_print(mon, env, &start, &last_prot, end, prot);
                         continue;

base-commit: 6d940eff4734bcb40b1a25f62d7cec5a396f994a
-- 
2.27.0


