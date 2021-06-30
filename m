Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9913B7B35
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:18:32 +0200 (CEST)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOs3-0006ju-Oj
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lyOql-0005RA-Mr
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:17:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1lyOqj-0006LB-5G
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:17:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="187954897"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="187954897"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 18:16:57 -0700
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="447268874"
Received: from chenyi-pc.sh.intel.com ([10.239.159.88])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 18:16:56 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/i386: Remove split lock detect in Snowridge CPU model
Date: Wed, 30 Jun 2021 09:20:53 +0800
Message-Id: <20210630012053.10098-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present, there's no mechanism intelligent enough to virtualize split
lock detection correctly. Remove it in Snowridge CPU model to avoid the
feature exposure.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d3..c3b527b7b0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3698,6 +3698,14 @@ static const X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ },
                 },
             },
+            {
+                .version = 4,
+                .note = "no split lock detect",
+                .props = (PropValue[]) {
+                    { "split-lock-detect", "off" },
+                    { /* end of list */ },
+                },
+            },
             { /* end of list */ },
         },
     },
-- 
2.17.1


