Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B755B7E9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:21:52 +0200 (CEST)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5i87-0002IQ-EU
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1o5i5T-0001PW-Es
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:19:07 -0400
Received: from mga17.intel.com ([192.55.52.151]:55381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1o5i5O-00013v-3C
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656310742; x=1687846742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yl3W5cbd8JhLFYmtQSivPF+jTkKrZmBsYGHNvoCbMmk=;
 b=J1Ck0hxSIfyAAxpLDcgLPYSpLWcokB61VRUmz3Lt598xPKBwH5ctwd1e
 NIxfm6EzZ3iAfq69viSs/+nSMg7amFy4xOdKoxeUz4hGwUF35wuhQ0l+2
 6rg1BtChVLonooz+deR3PGFuP3NbjKkq3QGun0gA+uaHcnCFo2DzsHDox
 nu/0Qyj5SAmkftPUJmHzOduHasxk3DabWOnixrwIClcDBAo5fp0gBcI5Q
 cpvk2qTuh30cdaajlbi7HT3nVxPAfL3saoTbrEVjFBlVRf8RlxlaZ+fbf
 DtJYhVm/o7uT7FWR+SHF9BRXpQ5qR6r2YnLa9QzM3LMEVmLO0p/z+7Bq1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="261783221"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="261783221"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 23:18:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="539999432"
Received: from sqa-gate.sh.intel.com (HELO localhost.tsp.org) ([10.239.48.212])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 23:18:55 -0700
From: Yuan Yao <yuan.yao@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Yuan Yao <yuan.yao@intel.com>,
 Yamahata Isaku <isaku.yamahata@intel.com>
Subject: [PATCH v2 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Date: Mon, 27 Jun 2022 14:18:46 +0800
Message-Id: <20220627061846.18294-1-yuan.yao@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yuan.yao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Inverse the condition checking to PG_PRESENT_MASK when walk LA57
guest's pdpe/pde for "info mem" command.

The current condition checking:
if (PG_PRESENT_MASK is set)
    Skip low level page table.
else
    Try to walk low level page table.

This is wrong because PG_PRESENT_MASK is set means the pdpe/pde is
present so we should continue walking the low level page table it
points to. This issue leads to no mapping information is collected for
LA57 guest when run the command.

v2:
1. Fix Typo (Zhang Chen <chen.zhang@intel.com> and Markus Armbruster
<armbru@redhat.com>).
2. Rewrite commit message (Markus Armbruster <armbru@redhat.com>).
3. Add Fixes tag (Markus Armbruster <armbru@redhat.com>).

Fixes: 6c7c3c21f9 ("x86: implement la57 paging mode")
Signed-off-by: Yuan Yao <yuan.yao@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
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
-- 
2.27.0


