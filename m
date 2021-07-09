Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF73C1EE6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:27:53 +0200 (CEST)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j3I-0002F2-7V
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iti-00019C-Ne; Fri, 09 Jul 2021 01:17:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itg-0001zW-N1; Fri, 09 Jul 2021 01:17:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd60mRz9sxS; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=LfqnIK50XMbUbpPBuaN2qzQ6g1BvDI+U6oJFJ+G6lyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AzbRKln7U3K/lJcWIsg+VDR2fvXL6ofrqZSFqra0go+YIbW6XD+I9GcIYj8IQjQ4S
 xPI+NDLp40ekt3ba0xERru1bgldrvGq0U42ETQiTw5eLmgLqJOVpjtbWFlOohGEiPG
 s/Cdgpowz3ma/iWzvXoJUBZ1MLEuFfFhmfhp1W/s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 15/33] target/ppc: Fix compilation with DEBUG_BATS debug option
Date: Fri,  9 Jul 2021 15:17:10 +1000
Message-Id: <20210709051728.170203-16-david@gibson.dropbear.id.au>
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

../target/ppc/mmu-hash32.c: In function 'ppc_hash32_bat_lookup':
../target/ppc/mmu-hash32.c:204:13: error: 'BATu' undeclared (first use in this function);
  204 |             BATu = &BATut[i];
      |             ^~~~
      |             BATut
../target/ppc/mmu-hash32.c:205:13: error: 'BATl' undeclared (first use in this function);
  205 |             BATl = &BATlt[i];
      |             ^~~~
      |             BATlt
../target/ppc/mmu-hash32.c:206:13: error: 'BEPIu' undeclared (first use in this function)
  206 |             BEPIu = *BATu & BATU32_BEPIU;
      |             ^~~~~
../target/ppc/mmu-hash32.c:206:29: error: 'BATU32_BEPIU' undeclared (first use in this function);
  206 |             BEPIu = *BATu & BATU32_BEPIU;
      |                             ^~~~~~~~~~~~
      |                             BATU32_BEPI
../target/ppc/mmu-hash32.c:207:13: error: 'BEPIl' undeclared (first use in this function)
  207 |             BEPIl = *BATu & BATU32_BEPIL;
      |             ^~~~~
../target/ppc/mmu-hash32.c:207:29: error: 'BATU32_BEPIL' undeclared (first use in this function);
  207 |             BEPIl = *BATu & BATU32_BEPIL;
      |                             ^~~~~~~~~~~~
      |                             BATU32_BEPI
../target/ppc/mmu-hash32.c:208:13: error: 'bl' undeclared (first use in this function)
  208 |             bl = (*BATu & 0x00001FFC) << 15;
      |             ^~

Fixes: 9813279664 ("target-ppc: Disentangle BAT code for 32-bit hash MMUs")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210702215235.1941771-4-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash32.c | 5 ++++-
 target/ppc/mmu-hash32.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 6a07c345e4..4edd5ffe14 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -27,7 +27,7 @@
 #include "mmu-hash32.h"
 #include "exec/log.h"
 
-/* #define DEBUG_BAT */
+/* #define DEBUG_BATS */
 
 #ifdef DEBUG_BATS
 #  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
@@ -199,6 +199,9 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
     /* No hit */
 #if defined(DEBUG_BATS)
     if (qemu_log_enabled()) {
+        target_ulong *BATu, *BATl;
+        target_ulong BEPIl, BEPIu, bl;
+
         LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", ea);
         for (i = 0; i < 4; i++) {
             BATu = &BATut[i];
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 8694eccabd..c9f584b8ee 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -22,6 +22,8 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
  * Block Address Translation (BAT) definitions
  */
 
+#define BATU32_BEPIU            0xf0000000
+#define BATU32_BEPIL            0x0ffe0000
 #define BATU32_BEPI             0xfffe0000
 #define BATU32_BL               0x00001ffc
 #define BATU32_VS               0x00000002
-- 
2.31.1


