Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3112B802D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:13:24 +0100 (CET)
Received: from localhost ([::1]:60598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfP99-0006Qx-PJ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kfP0g-0008AB-PA; Wed, 18 Nov 2020 10:04:38 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49734
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kfP0Q-00077n-AC; Wed, 18 Nov 2020 10:04:38 -0500
Received: from philogene.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 494025FA5F;
 Wed, 18 Nov 2020 16:04:15 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: fix stage 2 page-walks in 32-bit emulation
Date: Wed, 18 Nov 2020 17:04:14 +0200
Message-Id: <20201118150414.18360-1-remi@remlab.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 10:04:16
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Using a target unsigned long would limit the Input Address to a LPAE
page-walk to 32 bits on AArch32 and 64 bits on AArch64. This is okay
for stage 1 or on AArch64, but it is insufficient for stage 2 on
AArch32. In that later case, the Input Address can have up to 40 bits.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11b0803df7..38cd35c049 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -40,7 +40,7 @@
 
 #ifndef CONFIG_USER_ONLY
 
-static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
@@ -10988,7 +10988,7 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
  * @fi: set to fault info if the translation fails
  * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
-static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-- 
2.20.1


