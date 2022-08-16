Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40035965E9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 01:14:47 +0200 (CEST)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO5lm-00023B-Da
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 19:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oO5k5-0000hb-Mp
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:13:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oO5k3-00058R-LE
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:13:01 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GLKxGu033741;
 Tue, 16 Aug 2022 23:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=7CFfUJ4VXlr/6b0bA9HQRXubvKw9vZvWHrzpdvVeGFc=;
 b=XzNuvgfysHMmFfEfbYRw2+IPl+0fF7PUZLpRwD2dmdR0rHqJxdGzvDSmpqlYBIIY831r
 OkiYpKyYugzsrzXKcQ6hfPnxym/9RMbrwH6wu2FEB/TsHQMEd403cEssRTE8ocb3Fz7f
 gXwuOfiAlCVWr28RLqFIiSxlY4zfUOcBiM+Hfir0t5vkllOpEbcH0BAt9My96ubgMO7V
 2jkYqNFm+3oKC1umG9yD9QPY/tKJfysox5GsCXgfcHMHjZZir7Mrj8RB+fKQiVAMus+J
 ZwjCj8VpcaN/EojVQkZBOwOGY0FkFreLGWsldKV9h05j7yH1LOaF8Zj/z64PQcGRRGnR ug== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0k2xabbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 23:12:55 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27GN5OF5006461;
 Tue, 16 Aug 2022 23:12:53 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3hx37j2tvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 23:12:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27GNCpQI26935560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Aug 2022 23:12:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D97A4C044;
 Tue, 16 Aug 2022 23:12:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCAD34C046;
 Tue, 16 Aug 2022 23:12:50 +0000 (GMT)
Received: from [9.171.44.82] (unknown [9.171.44.82])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Aug 2022 23:12:50 +0000 (GMT)
Message-ID: <b22b98073daa0d41e579c98b4bfe72d666812318.camel@linux.ibm.com>
Subject: Re: [PATCH for-7.2 00/21] accel/tcg: minimize tlb lookups during
 translate + user-only PROT_EXEC fixes
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
Date: Wed, 17 Aug 2022 01:12:50 +0200
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xpG42QrqOU87hvrY-8wjMAwb7Dcy8hbl
X-Proofpoint-ORIG-GUID: xpG42QrqOU87hvrY-8wjMAwb7Dcy8hbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Fri, 2022-08-12 at 11:07 -0700, Richard Henderson wrote:
> This is part of a larger body of work, but in the process of
> reorganizing I was reminded that PROT_EXEC wasn't being enforced
> properly for user-only.  As this has come up in the context of
> some of Ilya's patches, I thought I'd go ahead and post this part.
> 
> 
> r~
> 
> 
> Ilya Leoshkevich (1):
>   accel/tcg: Introduce is_same_page()
> 
> Richard Henderson (20):
>   linux-user/arm: Mark the commpage executable
>   linux-user/hppa: Allocate page zero as a commpage
>   linux-user/x86_64: Allocate vsyscall page as a commpage
>   linux-user: Honor PT_GNU_STACK
>   tests/tcg/i386: Move smc_code2 to an executable section
>   accel/tcg: Remove PageDesc code_bitmap
>   accel/tcg: Use bool for page_find_alloc
>   accel/tcg: Merge tb_htable_lookup into caller
>   accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
>   accel/tcg: Properly implement get_page_addr_code for user-only
>   accel/tcg: Use probe_access_internal for softmmu
>     get_page_addr_code_hostp
>   accel/tcg: Add nofault parameter to get_page_addr_code_hostp
>   accel/tcg: Unlock mmap_lock after longjmp
>   accel/tcg: Hoist get_page_addr_code out of tb_lookup
>   accel/tcg: Hoist get_page_addr_code out of tb_gen_code
>   accel/tcg: Raise PROT_EXEC exception early
>   accel/tcg: Remove translator_ldsw
>   accel/tcg: Add pc and host_pc params to gen_intermediate_code
>   accel/tcg: Add fast path for translator_ld*
>   accel/tcg: Use DisasContextBase in plugin_gen_tb_start
> 
>  accel/tcg/internal.h          |   7 +-
>  include/elf.h                 |   1 +
>  include/exec/cpu-common.h     |   1 +
>  include/exec/exec-all.h       |  87 +++++-----------
>  include/exec/plugin-gen.h     |   7 +-
>  include/exec/translator.h     |  85 ++++++++++++----
>  linux-user/arm/target_cpu.h   |   4 +-
>  linux-user/qemu.h             |   1 +
>  accel/tcg/cpu-exec.c          | 184 ++++++++++++++++++--------------
> --
>  accel/tcg/cputlb.c            |  93 +++++------------
>  accel/tcg/plugin-gen.c        |  23 +++--
>  accel/tcg/translate-all.c     | 120 ++++------------------
>  accel/tcg/translator.c        | 122 +++++++++++++++++-----
>  accel/tcg/user-exec.c         |  15 +++
>  linux-user/elfload.c          |  80 ++++++++++++++-
>  softmmu/physmem.c             |  12 +++
>  target/alpha/translate.c      |   5 +-
>  target/arm/translate.c        |   5 +-
>  target/avr/translate.c        |   5 +-
>  target/cris/translate.c       |   5 +-
>  target/hexagon/translate.c    |   6 +-
>  target/hppa/translate.c       |   5 +-
>  target/i386/tcg/translate.c   |   7 +-
>  target/loongarch/translate.c  |   6 +-
>  target/m68k/translate.c       |   5 +-
>  target/microblaze/translate.c |   5 +-
>  target/mips/tcg/translate.c   |   5 +-
>  target/nios2/translate.c      |   5 +-
>  target/openrisc/translate.c   |   6 +-
>  target/ppc/translate.c        |   5 +-
>  target/riscv/translate.c      |   5 +-
>  target/rx/translate.c         |   5 +-
>  target/s390x/tcg/translate.c  |   5 +-
>  target/sh4/translate.c        |   5 +-
>  target/sparc/translate.c      |   5 +-
>  target/tricore/translate.c    |   6 +-
>  target/xtensa/translate.c     |   6 +-
>  tests/tcg/i386/test-i386.c    |   2 +-
>  38 files changed, 532 insertions(+), 424 deletions(-)
> 

Hi,

I need the following fixup to make my noexec tests pass with v1:

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6a3ca8224f..cc6a43a3bc 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -386,6 +386,10 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState
*env)
         return tcg_code_gen_epilogue;
     }
 
+    if (tb->page_addr[1] != -1) {
+        get_page_addr_code_hostp(env, tb->page_addr[1], false, NULL);
+    }
+
     log_cpu_exec(pc, cpu, tb);
 
     return tb->tc.ptr;
@@ -997,6 +1001,9 @@ int cpu_exec(CPUState *cpu)
                  * for the fast lookup
                  */
                 qatomic_set(&cpu-
>tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+            } else if (tb->page_addr[1] != -1) {
+                get_page_addr_code_hostp(cpu->env_ptr, tb-
>page_addr[1], false,
+                                         NULL);
             }
             mmap_unlock();

With v2, the exception after mprotect(PROT_NONE) is not happening
again. I have not figured out what the problem is yet.

Also, wasmtime tests trigger this assertion:

static void pgb_dynamic(const char *image_name, long align)
{
    /*
     * The executable is dynamic and does not require a fixed address.
     * All we need is a commpage that satisfies align.
     * If we do not need a commpage, leave guest_base == 0.
     */
    if (HI_COMMPAGE) {
        uintptr_t addr, commpage;

        /* 64-bit hosts should have used reserved_va. */
        assert(sizeof(uintptr_t) == 4);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Likewise, I also have not figured out why this is happening.

Best regards,
Ilya

