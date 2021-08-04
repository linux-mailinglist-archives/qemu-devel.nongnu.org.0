Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BD3E0A87
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 00:47:55 +0200 (CEST)
Received: from localhost ([::1]:52218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBPg2-0000qV-5k
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 18:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBPf1-0007v0-8H
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 18:46:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBPey-0003lA-Nb
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 18:46:51 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174MYR33013952; Wed, 4 Aug 2021 18:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=db2zunnrvmAxNQYis/9/8ZmeS0bSVCOSi4vAPSDWej0=;
 b=Oyn4v0Zvoug0kLlACHrWi8U9mnw5S88RaLZKNnMVjdyLxKZ/kDnxE5/iiujjGtkd+aIs
 0dt3Lwq6ds8oeqAC6TQ9s8DalgwOmS9qzm+RqpcTqN6lIw4Zi0QGHNkESnQAXyixrU2R
 cATyAwcgNKFoX0XqLCBi8lihmu5wyyd+4xKPAGCbkVEciJ6ioLtPXUlTx7pmDjDm5yos
 GbZxf2ADxVxQ5YcU+puWnmq/mN2AJiiJ+6W2TqFaCFq4GEUmV7ekxiLOu0ZQ68ggbddz
 wD6IF5FuBtOHdx8ILkJbwIp/qw2U/Ol6gpacqG15q8UYEAUoB1tyHkTzWMXzq4ON88K3 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a82k71y7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 18:46:45 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 174MYfPU017421;
 Wed, 4 Aug 2021 18:46:45 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a82k71y6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 18:46:44 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 174Mhb9W009397;
 Wed, 4 Aug 2021 22:46:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3a4x58h4fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 22:46:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 174MkcFi57737554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Aug 2021 22:46:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EF4C11C08D;
 Wed,  4 Aug 2021 22:46:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFE4D11C05B;
 Wed,  4 Aug 2021 22:46:37 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Aug 2021 22:46:37 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH RFC 1/1] accel/tcg: Clear PAGE_WRITE before translation
Date: Thu,  5 Aug 2021 00:46:33 +0200
Message-Id: <20210804224633.154083-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210804224633.154083-1-iii@linux.ibm.com>
References: <20210804224633.154083-1-iii@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IPAP09lyVleY2jA_fxJy930K3lxVUI-I
X-Proofpoint-GUID: c3fsGqYWoKJL37M5oossCGqlqa5mXe1T
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_08:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040136
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

translate_insn() implementations fetch instruction bytes piecemeal,
which can cause qemu-user to generate inconsistent translations if
another thread modifies them concurrently [1].

Fix by marking translation block pages non-writable earlier.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00644.html

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/translate-all.c    | 59 +++++++++++++++++++++---------------
 accel/tcg/translator.c       | 26 ++++++++++++++--
 include/exec/translate-all.h |  1 +
 3 files changed, 59 insertions(+), 27 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bbfcfb698c..fb9ebfad9e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1297,31 +1297,8 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
     invalidate_page_bitmap(p);
 
 #if defined(CONFIG_USER_ONLY)
-    if (p->flags & PAGE_WRITE) {
-        target_ulong addr;
-        PageDesc *p2;
-        int prot;
-
-        /* force the host page as non writable (writes will have a
-           page fault + mprotect overhead) */
-        page_addr &= qemu_host_page_mask;
-        prot = 0;
-        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
-            addr += TARGET_PAGE_SIZE) {
-
-            p2 = page_find(addr >> TARGET_PAGE_BITS);
-            if (!p2) {
-                continue;
-            }
-            prot |= p2->flags;
-            p2->flags &= ~PAGE_WRITE;
-          }
-        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
-                 (prot & PAGE_BITS) & ~PAGE_WRITE);
-        if (DEBUG_TB_INVALIDATE_GATE) {
-            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
-        }
-    }
+    /* translator_loop() must have made all TB pages non-writable */
+    assert(!(p->flags & PAGE_WRITE));
 #else
     /* if some code is already present, then the pages are already
        protected. So we handle the case where only the first TB is
@@ -2394,6 +2371,38 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
     return 0;
 }
 
+void page_protect(tb_page_addr_t page_addr)
+{
+    target_ulong addr;
+    PageDesc *p;
+    int prot;
+
+    p = page_find(page_addr >> TARGET_PAGE_BITS);
+    if (p && (p->flags & PAGE_WRITE)) {
+        /*
+         * Force the host page as non writable (writes will have a page fault +
+         * mprotect overhead).
+         */
+        page_addr &= qemu_host_page_mask;
+        prot = 0;
+        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
+             addr += TARGET_PAGE_SIZE) {
+
+            p = page_find(addr >> TARGET_PAGE_BITS);
+            if (!p) {
+                continue;
+            }
+            prot |= p->flags;
+            p->flags &= ~PAGE_WRITE;
+        }
+        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
+                 (prot & PAGE_BITS) & ~PAGE_WRITE);
+        if (DEBUG_TB_INVALIDATE_GATE) {
+            printf("protecting code page: 0x" TB_PAGE_ADDR_FMT "\n", page_addr);
+        }
+    }
+}
+
 /* called from signal handler: invalidate the code and unprotect the
  * page. Return 0 if the fault was not handled, 1 if it was handled,
  * and 2 if it was handled but the caller must cause the TB to be
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index c53a7f8e44..bfbe7d7ccf 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -14,6 +14,7 @@
 #include "exec/exec-all.h"
 #include "exec/gen-icount.h"
 #include "exec/log.h"
+#include "exec/translate-all.h"
 #include "exec/translator.h"
 #include "exec/plugin-gen.h"
 #include "sysemu/replay.h"
@@ -47,6 +48,10 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 {
     uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
+    bool stop = false;
+#ifdef CONFIG_USER_ONLY
+    target_ulong page_addr = -1;
+#endif
 
     /* Initialize DisasContext */
     db->tb = tb;
@@ -71,6 +76,21 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
 
     while (true) {
+#ifdef CONFIG_USER_ONLY
+        /*
+         * Make the page containing the next instruction non-writable in order
+         * to get a consistent translation if another thread is modifying the
+         * code while translate_insn() fetches the instruction bytes piecemeal.
+         * Writer threads will wait for mmap_lock() in page_unprotect().
+         */
+        if ((db->pc_next & TARGET_PAGE_MASK) != page_addr) {
+            page_addr = db->pc_next & TARGET_PAGE_MASK;
+            page_protect(page_addr);
+        }
+#endif
+        if (stop) {
+            break;
+        }
         db->num_insns++;
         ops->insn_start(db, cpu);
         tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
@@ -95,7 +115,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 
         /* Stop translation if translate_insn so indicated.  */
         if (db->is_jmp != DISAS_NEXT) {
-            break;
+            stop = true;
+            continue;
         }
 
         /*
@@ -110,7 +131,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
            or we have executed all of the allowed instructions.  */
         if (tcg_op_buf_full() || db->num_insns >= db->max_insns) {
             db->is_jmp = DISAS_TOO_MANY;
-            break;
+            stop = true;
+            continue;
         }
     }
 
diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index a557b4e2bb..9f646389af 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -33,6 +33,7 @@ void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
 #ifdef CONFIG_USER_ONLY
+void page_protect(tb_page_addr_t page_addr);
 int page_unprotect(target_ulong address, uintptr_t pc);
 #endif
 
-- 
2.31.1


