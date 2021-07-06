Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1253BD9F1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:18:10 +0200 (CEST)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mpe-00088p-8d
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1m0mbt-0005CD-2r; Tue, 06 Jul 2021 11:03:41 -0400
Received: from [201.28.113.2] (port=38598 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1m0mbo-0004qm-3K; Tue, 06 Jul 2021 11:03:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 6 Jul 2021 12:03:20 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 3BC398013FC;
 Tue,  6 Jul 2021 12:03:20 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] target/ppc: introduce mmu-books.h
Date: Tue,  6 Jul 2021 12:03:15 -0300
Message-Id: <20210706150316.21005-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210706150316.21005-1-bruno.larsen@eldorado.org.br>
References: <20210706150316.21005-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 06 Jul 2021 15:03:20.0448 (UTC)
 FILETIME=[0F070800:01D77278]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Intrudoce a header common to all BookS MMUs, that can hold code that is
common to hash32 and book3s-v3 MMUs.

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
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
2.17.1


