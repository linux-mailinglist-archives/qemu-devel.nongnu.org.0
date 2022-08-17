Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B3596D70
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 13:23:31 +0200 (CEST)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOH8y-0001L8-2u
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 07:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oOGv4-0008CQ-8w
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:09:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oOGuy-0006Zt-Mm
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:09:04 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HApYv9004416;
 Wed, 17 Aug 2022 11:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=FDiKuRod76Wwy9j9dKgaDBPyhiE6UVK70J6E66wc9Co=;
 b=QgVysyrDAmMtwF59aoSNFeGf0U5lv9GfXniNl1rKZQ70LQavJR649oipY/GszfzWzvK9
 4Yl2RiKePQl8Xpabxh0QE93InSia4uet4A2SlK0ogTGhl6bbtJMTx9Mzcmt3sutQFV5b
 nysO2e28vsQZItCr/5Zdo2453hBxNnXtx1ST+Af8Ctx9yVWwZCXj5qg4IkROHBeirn+q
 8CNIxBFEyDZofE9Iz/PEnL5G1Ws5j+SPYWtK1dIFTzyKdffJuIoVcStZ9k0MHB/0GB8s
 wfp91Z7LnZ/AonqY8+QlH2ep7kORCYAVUijsMfglEZnnUqfyCOeFdYxNSFqguqkZHHcc vA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0xxvrgkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 11:08:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HB6XWj001993;
 Wed, 17 Aug 2022 11:08:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3hx3k939jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 11:08:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27HB8rCr24838606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Aug 2022 11:08:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E3252063;
 Wed, 17 Aug 2022 11:08:52 +0000 (GMT)
Received: from [9.171.21.185] (unknown [9.171.21.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9D08652059;
 Wed, 17 Aug 2022 11:08:52 +0000 (GMT)
Message-ID: <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out
 of tb_lookup
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
Date: Wed, 17 Aug 2022 13:08:52 +0200
In-Reply-To: <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
 <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
 <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jg88tXLUfa_PapJs-zTYiGjvpB11FsS2
X-Proofpoint-ORIG-GUID: Jg88tXLUfa_PapJs-zTYiGjvpB11FsS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_05,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170042
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2022-08-16 at 20:42 -0500, Richard Henderson wrote:
> On 8/16/22 18:43, Ilya Leoshkevich wrote:
> > On Fri, 2022-08-12 at 11:07 -0700, Richard Henderson wrote:
> > > We will want to re-use the result of get_page_addr_code
> > > beyond the scope of tb_lookup.
> > > 
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >   accel/tcg/cpu-exec.c | 34 ++++++++++++++++++++++++----------
> > >   1 file changed, 24 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> > > index a9b7053274..889355b341 100644
> > > --- a/accel/tcg/cpu-exec.c
> > > +++ b/accel/tcg/cpu-exec.c
> > > @@ -209,13 +209,12 @@ static bool tb_lookup_cmp(const void *p,
> > > const
> > > void *d)
> > >   }
> > >   
> > >   /* Might cause an exception, so have a longjmp destination
> > > ready */
> > > -static TranslationBlock *tb_lookup(CPUState *cpu, target_ulong
> > > pc,
> > > -                                   target_ulong cs_base,
> > > +static TranslationBlock *tb_lookup(CPUState *cpu, tb_page_addr_t
> > > phys_pc,
> > > +                                   target_ulong pc, target_ulong
> > > cs_base,
> > >                                      uint32_t flags, uint32_t
> > > cflags)
> > >   {
> > >       CPUArchState *env = cpu->env_ptr;
> > >       TranslationBlock *tb;
> > > -    tb_page_addr_t phys_pc;
> > >       struct tb_desc desc;
> > >       uint32_t jmp_hash, tb_hash;
> > >   
> > > @@ -240,11 +239,8 @@ static TranslationBlock *tb_lookup(CPUState
> > > *cpu, target_ulong pc,
> > >       desc.cflags = cflags;
> > >       desc.trace_vcpu_dstate = *cpu->trace_dstate;
> > >       desc.pc = pc;
> > > -    phys_pc = get_page_addr_code(desc.env, pc);
> > > -    if (phys_pc == -1) {
> > > -        return NULL;
> > > -    }
> > >       desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> > > +
> > >       tb_hash = tb_hash_func(phys_pc, pc, flags, cflags, *cpu-
> > > > trace_dstate);
> > >       tb = qht_lookup_custom(&tb_ctx.htable, &desc, tb_hash,
> > > tb_lookup_cmp);
> > >       if (tb == NULL) {
> > > @@ -371,6 +367,7 @@ const void
> > > *HELPER(lookup_tb_ptr)(CPUArchState
> > > *env)
> > >       TranslationBlock *tb;
> > >       target_ulong cs_base, pc;
> > >       uint32_t flags, cflags;
> > > +    tb_page_addr_t phys_pc;
> > >   
> > >       cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> > >   
> > > @@ -379,7 +376,12 @@ const void
> > > *HELPER(lookup_tb_ptr)(CPUArchState
> > > *env)
> > >           cpu_loop_exit(cpu);
> > >       }
> > >   
> > > -    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
> > > +    phys_pc = get_page_addr_code(env, pc);
> > > +    if (phys_pc == -1) {
> > > +        return tcg_code_gen_epilogue;
> > > +    }
> > > +
> > > +    tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
> > >       if (tb == NULL) {
> > >           return tcg_code_gen_epilogue;
> > >       }
> > > @@ -482,6 +484,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
> > >       TranslationBlock *tb;
> > >       target_ulong cs_base, pc;
> > >       uint32_t flags, cflags;
> > > +    tb_page_addr_t phys_pc;
> > >       int tb_exit;
> > >   
> > >       if (sigsetjmp(cpu->jmp_env, 0) == 0) {
> > > @@ -504,7 +507,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
> > >            * Any breakpoint for this insn will have been
> > > recognized
> > > earlier.
> > >            */
> > >   
> > > -        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
> > > +        phys_pc = get_page_addr_code(env, pc);
> > > +        if (phys_pc == -1) {
> > > +            tb = NULL;
> > > +        } else {
> > > +            tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags,
> > > cflags);
> > > +        }
> > >           if (tb == NULL) {
> > >               mmap_lock();
> > >               tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
> > > @@ -949,6 +957,7 @@ int cpu_exec(CPUState *cpu)
> > >               TranslationBlock *tb;
> > >               target_ulong cs_base, pc;
> > >               uint32_t flags, cflags;
> > > +            tb_page_addr_t phys_pc;
> > >   
> > >               cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base,
> > > &flags);
> > >   
> > > @@ -970,7 +979,12 @@ int cpu_exec(CPUState *cpu)
> > >                   break;
> > >               }
> > >   
> > > -            tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
> > > +            phys_pc = get_page_addr_code(cpu->env_ptr, pc);
> > > +            if (phys_pc == -1) {
> > > +                tb = NULL;
> > > +            } else {
> > > +                tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags,
> > > cflags);
> > > +            }
> > >               if (tb == NULL) {
> > >                   mmap_lock();
> > >                   tb = tb_gen_code(cpu, pc, cs_base, flags,
> > > cflags);
> > 
> > This patch did not make it into v2, but having get_page_addr_code()
> > before tb_lookup() in helper_lookup_tb_ptr() helped raise the
> > exception
> > when trying to execute a no-longer-executable TB.
> > 
> > Was it dropped for performance reasons?
> 
> Ah, yes.  I dropped it because I ran into some regression, and
> started minimizing the 
> tree.  Because of the extra lock that needed to be held (next patch,
> also dropped), I 
> couldn't prove this actually helped.
> 
> I think the bit that's causing your user-only failure at the moment
> is the jump cache. 
> This patch hoisted the page table check before the jmp_cache.  For
> system, cputlb.c takes 
> care of flushing the jump cache with page table changes; we still
> don't have anything in 
> user-only that takes care of that.
> 
> 
> r~
> 

Would something like this be okay?

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 27435b97dbd..9421c84d991 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1152,6 +1152,27 @@ static inline void
tb_jmp_unlink(TranslationBlock *dest)
     qemu_spin_unlock(&dest->jmp_lock);
 }
 
+static void cpu_tb_jmp_cache_remove(TranslationBlock *tb)
+{
+    CPUState *cpu;
+    uint32_t h;
+
+    /* remove the TB from the hash list */
+    if (TARGET_TB_PCREL) {
+        /* Any TB may be at any virtual address */
+        CPU_FOREACH(cpu) {
+            cpu_tb_jmp_cache_clear(cpu);
+        }
+    } else {
+        h = tb_jmp_cache_hash_func(tb_pc(tb));
+        CPU_FOREACH(cpu) {
+            if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
+                qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
+            }
+        }
+    }
+}
+
 /*
  * In user-mode, call with mmap_lock held.
  * In !user-mode, if @rm_from_page_list is set, call with the TB's
pages'
@@ -1159,7 +1180,6 @@ static inline void tb_jmp_unlink(TranslationBlock
*dest)
  */
 static void do_tb_phys_invalidate(TranslationBlock *tb, bool
rm_from_page_list)
 {
-    CPUState *cpu;
     PageDesc *p;
     uint32_t h;
     tb_page_addr_t phys_pc;
@@ -1190,20 +1210,7 @@ static void
do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
         }
     }
 
-    /* remove the TB from the hash list */
-    if (TARGET_TB_PCREL) {
-        /* Any TB may be at any virtual address */
-        CPU_FOREACH(cpu) {
-            cpu_tb_jmp_cache_clear(cpu);
-        }
-    } else {
-        h = tb_jmp_cache_hash_func(tb_pc(tb));
-        CPU_FOREACH(cpu) {
-            if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
-                qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
-            }
-        }
-    }
+    cpu_tb_jmp_cache_remove(tb);
 
     /* suppress this TB from the two jump lists */
     tb_remove_from_jmp_list(tb, 0);
@@ -2243,6 +2250,13 @@ void page_set_flags(target_ulong start,
target_ulong end, int flags)
             (flags & PAGE_WRITE) &&
             p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
+        } else {
+            TranslationBlock *tb;
+            int n;
+
+            PAGE_FOR_EACH_TB(p, tb, n) {
+                cpu_tb_jmp_cache_remove(tb);
+            }
         }
         if (reset_target_data) {
             g_free(p->target_data);


