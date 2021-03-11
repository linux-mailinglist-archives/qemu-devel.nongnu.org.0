Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72533753F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:17:02 +0100 (CET)
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKM7Z-0003Pw-RJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKLuy-0002rr-4z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:04:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKLuu-0007o6-4t
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615471435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkSStzGvpSITJdtiiT/Oqssg1mtLn/M5OVJfjWvZXzI=;
 b=FhgVBoSdRQbcmC9txNu1G9QgkTk8IVTKh9ks70kXZ/gWHyoAMbWJ3n4LWZ4yCNAd+8YG0T
 PDOXKuKVOSzVbJXK2SZInsEH20RLK8jfIPUCOkW0aq30Lyv8o2Cf7vqUA9GpAUYZvmq+vB
 P6HZ9qaSgLWuy6W0zGxVVXnsLB0rEAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-Ct2MuoFaMgGFjZCrInfDeg-1; Thu, 11 Mar 2021 09:03:53 -0500
X-MC-Unique: Ct2MuoFaMgGFjZCrInfDeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12119107ACCA;
 Thu, 11 Mar 2021 14:03:52 +0000 (UTC)
Received: from [10.36.115.26] (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6915D5C1CF;
 Thu, 11 Mar 2021 14:03:50 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210303132850.459687-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v4] target/s390x: Implement the MVPG condition-code-option
 bit
Message-ID: <a6cb6d81-8cf3-4e3a-29f4-1593e1fffec5@redhat.com>
Date: Thu, 11 Mar 2021 15:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303132850.459687-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.21 14:28, Thomas Huth wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> If the CCO bit is set, MVPG should not generate an exception but
> report page translation faults via a CC code.
> 
> Create a new helper, access_prepare_nf, which can use probe_access_flags
> in non-faulting mode, and then handle watchpoints.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [thuth: Added logic to still inject protection exceptions]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v4: Add logic to inject protection exceptions if necessary
> 
>   target/s390x/cpu.h         |  3 ++
>   target/s390x/excp_helper.c |  3 ++
>   target/s390x/mem_helper.c  | 93 ++++++++++++++++++++++++++++----------
>   3 files changed, 76 insertions(+), 23 deletions(-)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 60d434d5ed..825503c6c0 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -114,6 +114,9 @@ struct CPUS390XState {
>   
>       uint64_t diag318_info;
>   
> +    uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
> +    int tlb_fill_exc;        /* exception number seen during tlb_fill */
> +
>       /* Fields up to this point are cleared by a CPU reset */
>       struct {} end_reset_fields;
>   
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index ce16af394b..c48cd6b46f 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -164,6 +164,9 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           tec = 0; /* unused */
>       }
>   
> +    env->tlb_fill_exc = excp;
> +    env->tlb_fill_tec = tec;
> +
>       if (!excp) {
>           qemu_log_mask(CPU_LOG_MMU,
>                         "%s: set tlb %" PRIx64 " -> %" PRIx64 " (%x)\n",
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 25cfede806..cf741541d3 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c
> @@ -130,28 +130,62 @@ typedef struct S390Access {
>       int mmu_idx;
>   } S390Access;
>   
> +static bool access_prepare_nf(S390Access *access, CPUS390XState *env,
> +                              bool nofault, vaddr vaddr1, int size,
> +                              MMUAccessType access_type,
> +                              int mmu_idx, uintptr_t ra)
> +{
> +    void *haddr1, *haddr2 = NULL;
> +    int size1, size2;
> +    vaddr vaddr2 = 0;
> +    int flags;
> +
> +    assert(size > 0 && size <= 4096);
> +
> +    size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
> +    size2 = size - size1;
> +
> +    flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
> +                               nofault, &haddr1, ra);
> +    if (unlikely(size2)) {
> +        /* The access crosses page boundaries. */
> +        vaddr2 = wrap_address(env, vaddr1 + size1);
> +        flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
> +                                    nofault, &haddr2, ra);
> +    }
> +
> +    if (unlikely(flags & TLB_INVALID_MASK)) {
> +        return false;
> +    }
> +    if (unlikely(flags & TLB_WATCHPOINT)) {
> +        /* S390 does not presently use transaction attributes. */
> +        cpu_check_watchpoint(env_cpu(env), vaddr1, size,
> +                             MEMTXATTRS_UNSPECIFIED,
> +                             (access_type == MMU_DATA_STORE
> +                              ? BP_MEM_WRITE : BP_MEM_READ), ra);
> +    }
> +
> +    *access = (S390Access) {
> +        .vaddr1 = vaddr1,
> +        .vaddr2 = vaddr2,
> +        .haddr1 = haddr1,
> +        .haddr2 = haddr2,
> +        .size1 = size1,
> +        .size2 = size2,
> +        .mmu_idx = mmu_idx
> +    };
> +    return true;
> +}
> +
>   static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int size,
>                                    MMUAccessType access_type, int mmu_idx,
>                                    uintptr_t ra)
>   {
> -    S390Access access = {
> -        .vaddr1 = vaddr,
> -        .size1 = MIN(size, -(vaddr | TARGET_PAGE_MASK)),
> -        .mmu_idx = mmu_idx,
> -    };
> -
> -    g_assert(size > 0 && size <= 4096);
> -    access.haddr1 = probe_access(env, access.vaddr1, access.size1, access_type,
> -                                 mmu_idx, ra);
> -
> -    if (unlikely(access.size1 != size)) {
> -        /* The access crosses page boundaries. */
> -        access.vaddr2 = wrap_address(env, vaddr + access.size1);
> -        access.size2 = size - access.size1;
> -        access.haddr2 = probe_access(env, access.vaddr2, access.size2,
> -                                     access_type, mmu_idx, ra);
> -    }
> -    return access;
> +    S390Access ret;
> +    bool ok = access_prepare_nf(&ret, env, false, vaddr, size,
> +                                access_type, mmu_idx, ra);
> +    assert(ok);
> +    return ret;
>   }
>   
>   /* Helper to handle memset on a single page. */
> @@ -845,8 +879,10 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
>       const int mmu_idx = cpu_mmu_index(env, false);
>       const bool f = extract64(r0, 11, 1);
>       const bool s = extract64(r0, 10, 1);
> +    const bool cco = extract64(r0, 8, 1);
>       uintptr_t ra = GETPC();
>       S390Access srca, desta;
> +    bool ok;
>   
>       if ((f && s) || extract64(r0, 12, 4)) {
>           tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
> @@ -858,13 +894,24 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
>       /*
>        * TODO:
>        * - Access key handling
> -     * - CC-option with surpression of page-translation exceptions
>        * - Store r1/r2 register identifiers at real location 162
>        */
> -    srca = access_prepare(env, r2, TARGET_PAGE_SIZE, MMU_DATA_LOAD, mmu_idx,
> -                          ra);
> -    desta = access_prepare(env, r1, TARGET_PAGE_SIZE, MMU_DATA_STORE, mmu_idx,
> -                           ra);
> +    ok = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
> +                           MMU_DATA_LOAD, mmu_idx, ra);
> +    if (!ok) {
> +        return 2;
> +    }
> +    ok = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
> +                           MMU_DATA_STORE, mmu_idx, ra);
> +    if (!ok) {
> +        if (env->tlb_fill_exc == PGM_PROTECTION) {
> +            stq_phys(env_cpu(env)->as,
> +                     env->psa + offsetof(LowCore, trans_exc_code),
> +                     env->tlb_fill_tec);
> +            tcg_s390_program_interrupt(env, PGM_PROTECTION, ra);
> +        }
> +        return 1;
> +    }
>       access_memmove(env, &desta, &srca, ra);
>       return 0; /* data moved */
>   }
> 

As talked with Thomas off-list, there is no trusting on host==NULL
as well (see comment in struct S390Access). host==NULL simply
means we have to do individual ld/st.

The following on top should work. Not perfect, but seems to get
the job done.


 From 056b3c9f2ffd43b10d8293e7143cf7af5d1d5022 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Thu, 11 Mar 2021 14:44:45 +0100
Subject: [PATCH] fixup

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  target/s390x/mem_helper.c | 48 ++++++++++++++++++++++++---------------
  1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index cf741541d3..0a9b15ea90 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -130,10 +130,15 @@ typedef struct S390Access {
      int mmu_idx;
  } S390Access;
  
-static bool access_prepare_nf(S390Access *access, CPUS390XState *env,
-                              bool nofault, vaddr vaddr1, int size,
-                              MMUAccessType access_type,
-                              int mmu_idx, uintptr_t ra)
+/*
+ * With nofault=1, return the generated PGM_ exception that would have
+ * been injected into the guest (tec stored in env->tlb_fill_tec);
+ * return 0 if no exception was detected.
+ */
+static int access_prepare_nf(S390Access *access, CPUS390XState *env,
+                             bool nofault, vaddr vaddr1, int size,
+                             MMUAccessType access_type,
+                             int mmu_idx, uintptr_t ra)
  {
      void *haddr1, *haddr2 = NULL;
      int size1, size2;
@@ -145,18 +150,24 @@ static bool access_prepare_nf(S390Access *access, CPUS390XState *env,
      size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
      size2 = size - size1;
  
+    env->tlb_fill_exc = 0;
      flags = probe_access_flags(env, vaddr1, access_type, mmu_idx,
                                 nofault, &haddr1, ra);
+    if (env->tlb_fill_exc) {
+        /* We cannot rely on TLB_INVALID_MASK or haddr being NULL. */
+        return env->tlb_fill_exc;
+    }
      if (unlikely(size2)) {
          /* The access crosses page boundaries. */
          vaddr2 = wrap_address(env, vaddr1 + size1);
          flags |= probe_access_flags(env, vaddr2, access_type, mmu_idx,
                                      nofault, &haddr2, ra);
+        if (env->tlb_fill_exc) {
+            /* We cannot rely on TLB_INVALID_MASK or haddr being NULL. */
+            return env->tlb_fill_exc;
+        }
      }
  
-    if (unlikely(flags & TLB_INVALID_MASK)) {
-        return false;
-    }
      if (unlikely(flags & TLB_WATCHPOINT)) {
          /* S390 does not presently use transaction attributes. */
          cpu_check_watchpoint(env_cpu(env), vaddr1, size,
@@ -174,7 +185,7 @@ static bool access_prepare_nf(S390Access *access, CPUS390XState *env,
          .size2 = size2,
          .mmu_idx = mmu_idx
      };
-    return true;
+    return 0;
  }
  
  static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int size,
@@ -182,9 +193,9 @@ static S390Access access_prepare(CPUS390XState *env, vaddr vaddr, int size,
                                   uintptr_t ra)
  {
      S390Access ret;
-    bool ok = access_prepare_nf(&ret, env, false, vaddr, size,
+    int exc = access_prepare_nf(&ret, env, false, vaddr, size,
                                  access_type, mmu_idx, ra);
-    assert(ok);
+    assert(!exc);
      return ret;
  }
  
@@ -882,7 +893,7 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
      const bool cco = extract64(r0, 8, 1);
      uintptr_t ra = GETPC();
      S390Access srca, desta;
-    bool ok;
+    int exc;
  
      if ((f && s) || extract64(r0, 12, 4)) {
          tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
@@ -896,15 +907,16 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_t r0, uint64_t r1, uint64_t r2)
       * - Access key handling
       * - Store r1/r2 register identifiers at real location 162
       */
-    ok = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
-                           MMU_DATA_LOAD, mmu_idx, ra);
-    if (!ok) {
+    exc = access_prepare_nf(&srca, env, cco, r2, TARGET_PAGE_SIZE,
+                            MMU_DATA_LOAD, mmu_idx, ra);
+    if (exc) {
          return 2;
      }
-    ok = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
-                           MMU_DATA_STORE, mmu_idx, ra);
-    if (!ok) {
-        if (env->tlb_fill_exc == PGM_PROTECTION) {
+    exc = access_prepare_nf(&desta, env, cco, r1, TARGET_PAGE_SIZE,
+                            MMU_DATA_STORE, mmu_idx, ra);
+    if (exc) {
+        fprintf(stderr, "Exception: %d\n", exc);
+        if (exc == PGM_PROTECTION) {
              stq_phys(env_cpu(env)->as,
                       env->psa + offsetof(LowCore, trans_exc_code),
                       env->tlb_fill_tec);
-- 
2.29.2



-- 
Thanks,

David / dhildenb


