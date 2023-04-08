Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A06DB7E4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 02:53:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkwoq-0003pb-A9; Fri, 07 Apr 2023 20:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=45500efaa=pbartell@amazon.com>)
 id 1pkw1c-0001lG-GI; Fri, 07 Apr 2023 20:01:48 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=45500efaa=pbartell@amazon.com>)
 id 1pkw1a-0002NR-Tq; Fri, 07 Apr 2023 20:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1680912107; x=1712448107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VTuZJ2V+jdEhbYwqKGb3MGF43M2vOvVB+j7SrKwFTRY=;
 b=PW6rfS36Q22sCR3x8/c0KTKriRoPFs4y2P6yFSf/qVIgKLUmx/cPc2Qi
 SC+dThK0wbPP95rMALNCToNJQI3CoBhsifoiIxttkzNcQQAB5hu/eXky/
 fpY9G8tx92b7RWRX4uBHwwhZX52oBWA6GuZQ3vZrST3qF0xHdwceQDJt/ o=;
X-IronPort-AV: E=Sophos;i="5.98,328,1673913600"; d="scan'208";a="316083244"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 00:01:41 +0000
Received: from EX19D012EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com (Postfix)
 with ESMTPS id 52D92448A1; Sat,  8 Apr 2023 00:01:40 +0000 (UTC)
Received: from EX19D031EUB004.ant.amazon.com (10.252.61.75) by
 EX19D012EUA002.ant.amazon.com (10.252.50.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Apr 2023 00:01:39 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D031EUB004.ant.amazon.com (10.252.61.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Apr 2023 00:01:39 +0000
Received: from 147dda7342a9.ant.amazon.com (10.63.8.32) by
 mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 8 Apr 2023 00:01:38 +0000
From: <pbartell@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Richard
 Henderson" <richard.henderson@linaro.org>,
 Paul Bartell <pbartell@amazon.com>
Subject: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Date: Fri, 7 Apr 2023 17:01:18 -0700
Message-ID: <20230408000118.50854-1-pbartell@amazon.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=45500efaa=pbartell@amazon.com; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Apr 2023 20:52:38 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Paul Bartell <pbartell@amazon.com>

Revert changes to arm_cpu_get_phys_page_attrs_debug made in commit
4a35855682cebb89f9630b07aa9fd37c4e8c733b.

Commit 4a35855682 modifies the arm_cpu_get_phys_page_attrs_debug function
so that it calls get_phys_addr_with_struct rather than get_phys_addr, which
leads to a variety of memory access errors when debugging secure state
code on qemu ARMv8M targets with gdb.

This commit fixes a variety of gdb memory access errors including:
"error reading variable" and "Cannot access memory at address" when
attempting to read any memory address via gdb.

Signed-off-by: Paul Bartell <pbartell@amazon.com>
---
 target/arm/ptw.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec3f51782a..5a1339d38f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2999,16 +2999,12 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    S1Translate ptw = {
-        .in_mmu_idx = arm_mmu_idx(env),
-        .in_secure = arm_is_secure(env),
-        .in_debug = true,
-    };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     bool ret;
 
-    ret = get_phys_addr_with_struct(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.37.3


