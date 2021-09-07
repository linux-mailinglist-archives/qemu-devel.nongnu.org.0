Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D164029E1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:40:14 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbKf-0004xE-D5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawx-0003Nz-4r
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawt-0002c7-Tj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+i2SUVw5T/UjbuJURGFHkx/Lk7LedjKvi+jlxOA1RQ=;
 b=I3kvdzC8li7os4qDlfb7nfID+UIakV1uFDmBCw840q6Vl6AHR+HTSVBmrj3yPunZPI+dyX
 uMJH5TDx9rtyAhunG5bBJnLIq0dBBjTMiVkGXyHfb6OvVOJ9hp2Ek4x7Sz7QI0c5RbSVgH
 02zgjHVV2NYtfbEzbMkKys6Vi5G2cro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-cxHDIRYFOVGBufJlS2uBPg-1; Tue, 07 Sep 2021 09:15:37 -0400
X-MC-Unique: cxHDIRYFOVGBufJlS2uBPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E418A8145E7;
 Tue,  7 Sep 2021 13:15:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD28E5C1B4;
 Tue,  7 Sep 2021 13:15:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/20] s390x/mmu_helper: move address validation into
 mmu_translate*()
Date: Tue,  7 Sep 2021 15:14:41 +0200
Message-Id: <20210907131449.493875-13-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's move address validation into mmu_translate() and
mmu_translate_real(). This allows for checking whether an absolute
address is valid before looking up the storage key. We can now get rid of
the ram_size check.

Interestingly, we're already handling LOAD REAL ADDRESS wrong, because
a) We're not supposed to touch storage keys
b) We're not supposed to convert to an absolute address

Let's use a fake, negative MMUAccessType to teach mmu_translate() to
fix that handling and to not perform address validation.

Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903155514.44772-8-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/mmu_helper.c      | 36 ++++++++++++++++++++--------------
 target/s390x/s390x-internal.h  |  2 ++
 target/s390x/tcg/excp_helper.c | 13 ------------
 target/s390x/tcg/mem_helper.c  |  2 +-
 4 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index ca25dadb5b..de6df928d2 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -301,14 +301,13 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
 {
     static S390SKeysClass *skeyclass;
     static S390SKeysState *ss;
-    MachineState *ms = MACHINE(qdev_get_machine());
     uint8_t key;
     int rc;
 
-    if (unlikely(addr >= ms->ram_size)) {
-        return;
-    }
-
+    /*
+     * We expect to be called with an absolute address that has already been
+     * validated, such that we can reliably use it to lookup the storage key.
+     */
     if (unlikely(!ss)) {
         ss = s390_get_skeys_device();
         skeyclass = S390_SKEYS_GET_CLASS(ss);
@@ -370,7 +369,7 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
 /**
  * Translate a virtual (logical) address into a physical (absolute) address.
  * @param vaddr  the virtual address
- * @param rw     0 = read, 1 = write, 2 = code fetch
+ * @param rw     0 = read, 1 = write, 2 = code fetch, < 0 = load real address
  * @param asc    address space control (one of the PSW_ASC_* modes)
  * @param raddr  the translated address is stored to this pointer
  * @param flags  the PAGE_READ/WRITE/EXEC flags are stored to this pointer
@@ -449,10 +448,17 @@ int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
     }
 
 nodat:
-    /* Convert real address -> absolute address */
-    *raddr = mmu_real2abs(env, *raddr);
+    if (rw >= 0) {
+        /* Convert real address -> absolute address */
+        *raddr = mmu_real2abs(env, *raddr);
 
-    mmu_handle_skey(*raddr, rw, flags);
+        if (!mmu_absolute_addr_valid(*raddr, rw == MMU_DATA_STORE)) {
+            *tec = 0; /* unused */
+            return PGM_ADDRESSING;
+        }
+
+        mmu_handle_skey(*raddr, rw, flags);
+    }
     return 0;
 }
 
@@ -473,12 +479,6 @@ static int translate_pages(S390CPU *cpu, vaddr addr, int nr_pages,
         if (ret) {
             return ret;
         }
-        if (!address_space_access_valid(&address_space_memory, pages[i],
-                                        TARGET_PAGE_SIZE, is_write,
-                                        MEMTXATTRS_UNSPECIFIED)) {
-            *tec = 0; /* unused */
-            return PGM_ADDRESSING;
-        }
         addr += TARGET_PAGE_SIZE;
     }
 
@@ -588,6 +588,12 @@ int mmu_translate_real(CPUS390XState *env, target_ulong raddr, int rw,
 
     *addr = mmu_real2abs(env, raddr & TARGET_PAGE_MASK);
 
+    if (!mmu_absolute_addr_valid(*addr, rw == MMU_DATA_STORE)) {
+        /* unused */
+        *tec = 0;
+        return PGM_ADDRESSING;
+    }
+
     mmu_handle_skey(*addr, rw, flags);
     return 0;
 }
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index d246d26b04..7a6aa4dacc 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -374,6 +374,8 @@ void probe_write_access(CPUS390XState *env, uint64_t addr, uint64_t len,
 
 /* mmu_helper.c */
 bool mmu_absolute_addr_valid(target_ulong addr, bool is_write);
+/* Special access mode only valid for mmu_translate() */
+#define MMU_S390_LRA        -1
 int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
                   target_ulong *raddr, int *flags, uint64_t *tec);
 int mmu_translate_real(CPUS390XState *env, target_ulong raddr, int rw,
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index a61917d04f..3d6662a53c 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -150,19 +150,6 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         g_assert_not_reached();
     }
 
-    /* check out of RAM access */
-    if (!excp &&
-        !address_space_access_valid(&address_space_memory, raddr,
-                                    TARGET_PAGE_SIZE, access_type,
-                                    MEMTXATTRS_UNSPECIFIED)) {
-        MachineState *ms = MACHINE(qdev_get_machine());
-        qemu_log_mask(CPU_LOG_MMU,
-                      "%s: raddr %" PRIx64 " > ram_size %" PRIx64 "\n",
-                      __func__, (uint64_t)raddr, (uint64_t)ms->ram_size);
-        excp = PGM_ADDRESSING;
-        tec = 0; /* unused */
-    }
-
     env->tlb_fill_exc = excp;
     env->tlb_fill_tec = tec;
 
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index a44a107374..4f9f3e1f63 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2455,7 +2455,7 @@ uint64_t HELPER(lra)(CPUS390XState *env, uint64_t addr)
         tcg_s390_program_interrupt(env, PGM_SPECIAL_OP, GETPC());
     }
 
-    exc = mmu_translate(env, addr, 0, asc, &ret, &flags, &tec);
+    exc = mmu_translate(env, addr, MMU_S390_LRA, asc, &ret, &flags, &tec);
     if (exc) {
         cc = 3;
         ret = exc | 0x80000000;
-- 
2.27.0


