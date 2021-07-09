Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660883C1EEC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:30:33 +0200 (CEST)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j5s-0000Qx-DH
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itj-0001BG-RP; Fri, 09 Jul 2021 01:17:59 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36297 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1ith-00020W-Nu; Fri, 09 Jul 2021 01:17:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd6tm7z9t0T; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=wWfJI//czSxg62ocsBCXtYJdbIEfRt97bicAmBKhoto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZZjrQRKsMNAy4I5Vzb3skpZ3WHaeXpoBJ9sGXrFWtkACQHtj1pgwypusF1u12N/w1
 l1IsZoxwj63boUuXHc7xZsCyNiNGND69eEtBACMMH4M5x1SNnmd+i/kxqjOCO169ME
 7Qpcc9UekWD8u9J8sC9z6j608KENE/GEnhWTOXu8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/33] target/ppc: introduce mmu-books.h
Date: Fri,  9 Jul 2021 15:17:13 +1000
Message-Id: <20210709051728.170203-19-david@gibson.dropbear.id.au>
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Intrudoce a header common to all BookS MMUs, that can hold code that is
common to hash32 and book3s-v3 MMUs.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210706150316.21005-2-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-book3s-v3.h | 14 +-------------
 target/ppc/mmu-books.h     | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 13 deletions(-)
 create mode 100644 target/ppc/mmu-books.h

diff --git a/target/ppc/mmu-book3s-v3.h b/target/ppc/mmu-book3s-v3.h
index c89d0bccfd..d6d5ed8f8e 100644
--- a/target/ppc/mmu-book3s-v3.h
+++ b/target/ppc/mmu-book3s-v3.h
@@ -21,6 +21,7 @@
 #define PPC_MMU_BOOK3S_V3_H
 
 #include "mmu-hash64.h"
+#include "mmu-books.h"
 
 #ifndef CONFIG_USER_ONLY
 
@@ -47,19 +48,6 @@ struct prtb_entry {
     uint64_t prtbe0, prtbe1;
 };
 
-/*
- * These correspond to the mmu_idx values computed in
- * hreg_compute_hflags_value. See the tables therein
- *
- * They are here because some bits are inverted for BookE MMUs
- * not necessarily because they only work for BookS. However,
- * we only needed to change BookS MMUs, we left the functions
- * here to avoid other possible bugs for untested MMUs
- */
-static inline bool mmuidx_pr(int idx) { return !(idx & 1); }
-static inline bool mmuidx_real(int idx) { return idx & 2; }
-static inline bool mmuidx_hv(int idx) { return idx & 4; }
-
 #ifdef TARGET_PPC64
 
 static inline bool ppc64_use_proc_tbl(PowerPCCPU *cpu)
diff --git a/target/ppc/mmu-books.h b/target/ppc/mmu-books.h
new file mode 100644
index 0000000000..0d12551867
--- /dev/null
+++ b/target/ppc/mmu-books.h
@@ -0,0 +1,30 @@
+/*
+ *  PowerPC BookS emulation generic mmu definitions for qemu.
+ *
+ *  Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef PPC_MMU_BOOKS_H
+#define PPC_MMU_BOOKS_H
+
+/*
+ * These correspond to the mmu_idx values computed in
+ * hreg_compute_hflags_value. See the tables therein
+ */
+static inline bool mmuidx_pr(int idx) { return !(idx & 1); }
+static inline bool mmuidx_real(int idx) { return idx & 2; }
+static inline bool mmuidx_hv(int idx) { return idx & 4; }
+#endif /* PPC_MMU_BOOKS_H */
-- 
2.31.1


