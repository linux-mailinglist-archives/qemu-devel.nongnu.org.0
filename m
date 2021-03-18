Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65711340864
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:04:04 +0100 (CET)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuBu-0006xa-SS
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu8r-0005eK-Us
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMu8p-0005dP-56
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616079649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbx3h2wgmuMMFM6fNTXWmbXv2R9WG/zi/CgrGegFDfY=;
 b=hWq8lI0vZ524F8AsYibwuruJvgRaftqc4EvGYY0pPBCnmZ3r5iyJAdtqn8d5PG7NgE4qcY
 jRyY6meujCf36na3xPyF0gxeScLpI6uAldhvCsofNPPKfYMg/MqhtI/rkaW5ESS39W1dhO
 1PHR4D5VvujTQw7uSVBtZsIt4DhPsfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-t_xoT7QsNb-c5ahAkOhNPQ-1; Thu, 18 Mar 2021 11:00:47 -0400
X-MC-Unique: t_xoT7QsNb-c5ahAkOhNPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7539318B62B0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BCC371C5A
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 15:00:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/i386: allow modifying TCG phys-addr-bits
Date: Thu, 18 Mar 2021 11:00:20 -0400
Message-Id: <20210318150022.1824646-2-pbonzini@redhat.com>
In-Reply-To: <20210318150022.1824646-1-pbonzini@redhat.com>
References: <20210318150022.1824646-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG can support any number of physical address bits as long as the
core memory API does.  We only need to compute the reserved bits
mask dynamically.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c             | 23 ++++++++---------------
 target/i386/cpu.h             |  1 -
 target/i386/tcg/excp_helper.c |  7 ++++---
 target/i386/tcg/helper-tcg.h  | 12 ++++--------
 4 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae9fd9f31d..6b3e9467f1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6785,21 +6785,14 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
                     cpu->phys_bits = cpu->host_phys_bits_limit;
                 }
             }
-
-            if (cpu->phys_bits &&
-                (cpu->phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
-                cpu->phys_bits < 32)) {
-                error_setg(errp, "phys-bits should be between 32 and %u "
-                                 " (but is %u)",
-                                 TARGET_PHYS_ADDR_SPACE_BITS, cpu->phys_bits);
-                return;
-            }
-        } else {
-            if (cpu->phys_bits && cpu->phys_bits != TCG_PHYS_ADDR_BITS) {
-                error_setg(errp, "TCG only supports phys-bits=%u",
-                                  TCG_PHYS_ADDR_BITS);
-                return;
-            }
+        }
+        if (cpu->phys_bits &&
+            (cpu->phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
+            cpu->phys_bits < 32)) {
+            error_setg(errp, "phys-bits should be between 32 and %u "
+                             " (but is %u)",
+                             TARGET_PHYS_ADDR_SPACE_BITS, cpu->phys_bits);
+            return;
         }
         /* 0 means it was not explicitly set by the user (or by machine
          * compat_props or by the host code above). In this case, the default
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b4b136cd0d..570f916878 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -290,7 +290,6 @@ typedef enum X86Seg {
 #define PG_GLOBAL_MASK   (1 << PG_GLOBAL_BIT)
 #define PG_PSE_PAT_MASK  (1 << PG_PSE_PAT_BIT)
 #define PG_ADDRESS_MASK  0x000ffffffffff000LL
-#define PG_HI_RSVD_MASK  (PG_ADDRESS_MASK & ~PHYS_ADDR_MASK)
 #define PG_HI_USER_MASK  0x7ff0000000000000LL
 #define PG_PKRU_MASK     (15ULL << PG_PKRU_BIT)
 #define PG_NX_MASK       (1ULL << PG_NX_BIT)
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index b7d6259e4a..1e71e44510 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -142,8 +142,9 @@ void raise_exception_ra(CPUX86State *env, int exception_index, uintptr_t retaddr
 static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
                         int *prot)
 {
-    CPUX86State *env = &X86_CPU(cs)->env;
-    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint64_t ptep, pte;
     uint64_t exit_info_1 = 0;
     target_ulong pde_addr, pte_addr;
@@ -358,7 +359,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
     int error_code = 0;
     int is_dirty, prot, page_size, is_write, is_user;
     hwaddr paddr;
-    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
+    uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint32_t page_offset;
     target_ulong vaddr;
     uint32_t pkr;
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index c133c63555..ef60e2e04b 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -25,17 +25,13 @@
 /* Maximum instruction code size */
 #define TARGET_MAX_INSN_SIZE 16
 
-/*
- * XXX: This value should match the one returned by CPUID
- * and in exec.c
- */
-# if defined(TARGET_X86_64)
+#if defined(TARGET_X86_64)
 # define TCG_PHYS_ADDR_BITS 40
-# else
+#else
 # define TCG_PHYS_ADDR_BITS 36
-# endif
+#endif
 
-#define PHYS_ADDR_MASK MAKE_64BIT_MASK(0, TCG_PHYS_ADDR_BITS)
+QEMU_BUILD_BUG_ON(TCG_PHYS_ADDR_BITS > TARGET_PHYS_ADDR_SPACE_BITS);
 
 /**
  * x86_cpu_do_interrupt:
-- 
2.26.2



