Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF84E216C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:34:58 +0100 (CET)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCZ7-0003pS-H0
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:34:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1nWCKW-00015N-Mm; Mon, 21 Mar 2022 03:19:52 -0400
Received: from ozlabs.ru ([107.174.27.60]:38682)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1nWCKU-0002xx-2t; Mon, 21 Mar 2022 03:19:52 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 910D280534;
 Mon, 21 Mar 2022 03:19:46 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Subject: [PATCH qemu] ppc/spapr/ddw: Add 2M pagesize
Date: Mon, 21 Mar 2022 18:19:45 +1100
Message-Id: <20220321071945.918669-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently the LoPAPR spec got a new 2MB pagesize to support in Dynamic DMA
Windows API (DDW), this adds the new flag.

Linux supports it since
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=38727311871

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
PHYP added support for it in development builds as well.
---
 include/hw/ppc/spapr.h  | 1 +
 hw/ppc/spapr_rtas_ddw.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index f5c33dcc8616..14b01c3f5963 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -745,6 +745,7 @@ void push_sregs_to_kvm_pr(SpaprMachineState *spapr);
 #define RTAS_DDW_PGSIZE_128M     0x20
 #define RTAS_DDW_PGSIZE_256M     0x40
 #define RTAS_DDW_PGSIZE_16G      0x80
+#define RTAS_DDW_PGSIZE_2M       0x100
 
 /* RTAS tokens */
 #define RTAS_TOKEN_BASE      0x2000
diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index 3e826e1308c4..13d339c807c1 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
@@ -72,6 +72,7 @@ static uint32_t spapr_page_mask_to_query_mask(uint64_t page_mask)
     const struct { int shift; uint32_t mask; } masks[] = {
         { 12, RTAS_DDW_PGSIZE_4K },
         { 16, RTAS_DDW_PGSIZE_64K },
+        { 21, RTAS_DDW_PGSIZE_2M },
         { 24, RTAS_DDW_PGSIZE_16M },
         { 25, RTAS_DDW_PGSIZE_32M },
         { 26, RTAS_DDW_PGSIZE_64M },
-- 
2.30.2


