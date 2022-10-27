Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA360FAC1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:47:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo47q-0004r7-7W; Thu, 27 Oct 2022 10:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oo47f-0004bv-48
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:44:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oo47P-0005TD-AH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:44:42 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RE4afe001938;
 Thu, 27 Oct 2022 14:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=WM8ZaS8UrgDa2ACAVEXZj8oHKou5M/q6jBcRgw9fapU=;
 b=lyiPoXYP5n8l6BvQsPGl0tPD9pYpqYImLs8MvN9If7xbXZXcp56QVBUO3cnZPvJwlzmT
 Qmthz4Q1CmAqX3iQGnEhzc01pXM0ZI3u52GiWR0t7ZLfEHKwe2wCRBLMzBh5xfXtjKvR
 AgHogDhdSty+wL6mSi8+aX5ntqqrOyigPPN1eudBAoI5fehFJcBynJtBoRVhZVi0aBdC
 JTRMl9+WU7ThXRC7vo3rKbZwysrEsT0PKRo7jlMSWpcJjv+T3FzqH3Li71sxXgEuv5/S
 V/SNRhE+5rlB4wgibQFZdPiqNaZH7NXMmkAFP/q74CcAeSw4q1GeEwR5wgUyVJbjYp7f dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfts3u882-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 14:44:21 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29REb9hP026643;
 Thu, 27 Oct 2022 14:44:20 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfts3u869-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 14:44:20 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29REbJMr005423;
 Thu, 27 Oct 2022 14:44:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3kfaht1fqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 14:44:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29REcwd548759244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 14:38:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C08F9A4055;
 Thu, 27 Oct 2022 14:44:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7503CA4051;
 Thu, 27 Oct 2022 14:44:15 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Oct 2022 14:44:15 +0000 (GMT)
Date: Thu, 27 Oct 2022 16:44:14 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 15/20] include/hw/core: Create struct CPUJumpCache
Message-ID: <20221027144414.bwc5lklt7dx2wc3j@heavy>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
 <20221004195241.46491-16-richard.henderson@linaro.org>
 <20221027141856.w5umjgklawgu7pqv@heavy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221027141856.w5umjgklawgu7pqv@heavy>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ySnKtdJQiHixCihYl3f52Ob_n5bcnYn1
X-Proofpoint-ORIG-GUID: qWOvuCRXsr-8jkJnTH9X8lOf2rvDM67i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270079
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 04:18:56PM +0200, Ilya Leoshkevich wrote:
> On Tue, Oct 04, 2022 at 12:52:36PM -0700, Richard Henderson wrote:
> > Wrap the bare TranslationBlock pointer into a structure.
> > 
> > Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  accel/tcg/tb-hash.h       |  1 +
> >  accel/tcg/tb-jmp-cache.h  | 24 ++++++++++++++++++++++++
> >  include/exec/cpu-common.h |  1 +
> >  include/hw/core/cpu.h     | 15 +--------------
> >  include/qemu/typedefs.h   |  1 +
> >  accel/stubs/tcg-stub.c    |  4 ++++
> >  accel/tcg/cpu-exec.c      | 10 +++++++---
> >  accel/tcg/cputlb.c        |  9 +++++----
> >  accel/tcg/translate-all.c | 28 +++++++++++++++++++++++++---
> >  hw/core/cpu-common.c      |  3 +--
> >  plugins/core.c            |  2 +-
> >  trace/control-target.c    |  2 +-
> >  12 files changed, 72 insertions(+), 28 deletions(-)
> >  create mode 100644 accel/tcg/tb-jmp-cache.h
> 
> Hi,
> 
> After this patch, I get:
> 
>     qemu-s390x: qemu/include/qemu/rcu.h:102: rcu_read_unlock: Assertion `p_rcu_reader->depth != 0' failed.
> 
> in one of the wasmtime tests (host=x86_64, guest=s390x).
> GDB shows that the root cause is actually this:
> 
>     Thread 181 "wasi_tokio::pat" received signal SIGSEGV, Segmentation fault.
>     [Switching to Thread 0x7ffff6c54640 (LWP 168352)]
>     0x0000555555626736 in do_tb_phys_invalidate (tb=tb@entry=0x7fffea4b8500 <code_gen_buffer+38503635>, rm_from_page_list=rm_from_page_list@entry=true) at qemu/accel/tcg/translate-all.c:1192
>     1192	        if (qatomic_read(&jc->array[h].tb) == tb) {
>     (gdb) bt
>     #0  0x0000555555626736 in do_tb_phys_invalidate (tb=tb@entry=0x7fffea4b8500 <code_gen_buffer+38503635>, rm_from_page_list=rm_from_page_list@entry=true) at qemu/accel/tcg/translate-all.c:1192
>     #1  0x0000555555626b98 in tb_phys_invalidate__locked (tb=0x7fffea4b8500 <code_gen_buffer+38503635>) at qemu/accel/tcg/translate-all.c:1211
>     #2  tb_invalidate_phys_page_range__locked (p=<optimized out>, start=start@entry=836716683264, end=end@entry=836716687360, retaddr=0, pages=0x0) at qemu/accel/tcg/translate-all.c:1678
>     #3  0x0000555555626dfb in tb_invalidate_phys_range (start=836716683264, start@entry=836716584960, end=end@entry=836716982272) at qemu/accel/tcg/translate-all.c:1753
>     #4  0x0000555555639e43 in target_munmap (start=start@entry=836716584960, len=len@entry=397312) at qemu/linux-user/mmap.c:769
> 
> Let me know if you need more information, I can try to extract a
> minimal reproducer.
> 
> Best regards,
> Ilya

Putting CPUJumpCache inside CPUState made problem go away:

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 18ca701b443..3ea528566c3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -32,6 +32,7 @@
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
 #include "qom/object.h"
+#include "accel/tcg/tb-jmp-cache.h"
 
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
                                      void *opaque);
@@ -366,7 +367,7 @@ struct CPUState {
     CPUArchState *env_ptr;
     IcountDecr *icount_decr_ptr;
 
-    CPUJumpCache *tb_jmp_cache;
+    CPUJumpCache tb_jmp_cache;
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2d7e610ee24..47165fc03e3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -253,7 +253,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache->array[hash].tb);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache.array[hash].tb);
 
     if (likely(tb &&
                tb->pc == pc &&
@@ -267,7 +267,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache->array[hash].tb, tb);
+    qatomic_set(&cpu->tb_jmp_cache.array[hash].tb, tb);
     return tb;
 }
 
@@ -998,7 +998,7 @@ int cpu_exec(CPUState *cpu)
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
-                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
+                qatomic_set(&cpu->tb_jmp_cache.array[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 63ecc152366..fffd9cb15f8 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1188,7 +1188,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* remove the TB from the hash list */
     h = tb_jmp_cache_hash_func(tb->pc);
     CPU_FOREACH(cpu) {
-        CPUJumpCache *jc = cpu->tb_jmp_cache;
+        CPUJumpCache *jc = &cpu->tb_jmp_cache;
         if (qatomic_read(&jc->array[h].tb) == tb) {
             qatomic_set(&jc->array[h].tb, NULL);
         }
@@ -2445,23 +2445,12 @@ int page_unprotect(target_ulong address, uintptr_t pc)
 }
 #endif /* CONFIG_USER_ONLY */
 
-/*
- * Called by generic code at e.g. cpu reset after cpu creation,
- * therefore we must be prepared to allocate the jump cache.
- */
 void tcg_flush_jmp_cache(CPUState *cpu)
 {
-    CPUJumpCache *jc = cpu->tb_jmp_cache;
+    CPUJumpCache *jc = &cpu->tb_jmp_cache;
 
-    if (likely(jc)) {
-        for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
-            qatomic_set(&jc->array[i].tb, NULL);
-        }
-    } else {
-        /* This should happen once during realize, and thus never race. */
-        jc = g_new0(CPUJumpCache, 1);
-        jc = qatomic_xchg(&cpu->tb_jmp_cache, jc);
-        assert(jc == NULL);
+    for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
+        qatomic_set(&jc->array[i].tb, NULL);
     }
 }
 
So there must be a race in tcg_flush_jmp_cache() after all?

Best regards,
Ilya

