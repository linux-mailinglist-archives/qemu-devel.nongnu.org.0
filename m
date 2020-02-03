Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D5E1500BF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 04:32:10 +0100 (CET)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyST3-0004A9-Gs
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 22:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1iySRM-0002hS-76
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 22:30:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1iySRJ-0006kL-F1
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 22:30:22 -0500
Received: from [107.174.27.60] (port=38972 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1iySRJ-0006jf-9a; Sun, 02 Feb 2020 22:30:21 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id D59B3AE80046;
 Sun,  2 Feb 2020 22:28:23 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu v6 1/6] ppc: Start CPU in the default mode which is
 big-endian 32bit
Date: Mon,  3 Feb 2020 14:29:38 +1100
Message-Id: <20200203032943.121178-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203032943.121178-1-aik@ozlabs.ru>
References: <20200203032943.121178-1-aik@ozlabs.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment we enforce 64bit mode on a CPU when reset. This does not
make difference as SLOF or Linux set the desired mode straight away.
However if we ever boot something other than these two,
this might not work as, for example, GRUB expects the default MSR state
and does not work properly.

This removes setting MSR_SF from the PPC CPU reset.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 target/ppc/translate_init.inc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index 53995f62eab2..f6a676cf55e8 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10710,12 +10710,6 @@ static void ppc_cpu_reset(CPUState *s)
 #endif
 #endif
 
-#if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
-        msr |= (1ULL << MSR_SF);
-    }
-#endif
-
     hreg_store_msr(env, msr, 1);
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.17.1


