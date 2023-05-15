Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFCF702A3B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:15:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVE8-00088W-EG; Mon, 15 May 2023 06:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyVDy-00085m-9m; Mon, 15 May 2023 06:14:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyVDv-0003Ei-RC; Mon, 15 May 2023 06:14:38 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FA7eAs015162; Mon, 15 May 2023 10:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=78kJBLsjDfRgE965JpgvAIlXQbgJAyXNV8KTTVWLXM8=;
 b=kxUtVyaZfyTIgQ74By51Yby3ndFbxe0zUW9UrtkF7+JhjAiEkMnKnZz4ksHmxFnqSaKp
 POwEQznyL0i9wVcIIKh9V6XoWW1Kc76ol4KnehCShgt49kIdnWXVh1HYPCHLVnrAzA3s
 vHfJzIO3jLcNMuCwEgjuGxwH2sk2XU9Hef4orL0CwAZyHmlZFokIySlmWKQHTWi7k92p
 oQRP7OIQNmvPQAaMRW2KOlGiGpctE9ZUASyZZMeIbOxM2bhfVZ8Vq1TiYWX+Vzu5+07N
 7HgWmmRYoiapCUsA0R4CMOrw8ydLKu9xWS+galUhuW1oAiYfBx3OMPrVGuC+EdlfsqKd HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkjfk8rbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:14:32 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FA7jSH016232;
 Mon, 15 May 2023 10:14:32 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkjfk8rba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:14:32 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F6U1f3009219;
 Mon, 15 May 2023 10:14:31 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3qj265aj3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 10:14:31 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34FAEUUN1835614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 10:14:30 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F11058059;
 Mon, 15 May 2023 10:14:30 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7144058043;
 Mon, 15 May 2023 10:14:26 +0000 (GMT)
Received: from [9.43.90.211] (unknown [9.43.90.211])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 15 May 2023 10:14:26 +0000 (GMT)
Message-ID: <c345f589-7fac-8624-06d4-ead03a2ba005@linux.ibm.com>
Date: Mon, 15 May 2023 15:44:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/9] target/ppc: Fix width of some 32-bit SPRs
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
 <20230515092655.171206-2-npiggin@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230515092655.171206-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NuUxA422lwn-WGOduxdec0vyqvHNg7UJ
X-Proofpoint-ORIG-GUID: N4Gy9dy3IQFE2F0GHlW4lJrc_4Jzdr0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=827 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305150087
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/15/23 14:56, Nicholas Piggin wrote:
> Some 32-bit SPRs are incorrectly implemented as 64-bits on 64-bit
> targets.
> 
> This changes VRSAVE, DSISR, HDSISR, DAWRX0, PIDR, LPIDR, DEXCR,
> HDEXCR, CTRL, TSCR, MMCRH, and PMC[1-6] from to be 32-bit registers.
> 
> This only goes by the 32/64 classification in the architecture, it
> does not try to implement finer details of SPR implementation (e.g.,
> not all bits implemented as simple read/write storage).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v2: no change.
> 
>   target/ppc/cpu_init.c    | 18 +++++++++---------
>   target/ppc/helper_regs.c |  2 +-
>   target/ppc/misc_helper.c |  4 ++--
>   target/ppc/power8-pmu.c  |  2 +-
>   target/ppc/translate.c   |  2 +-
>   5 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 0ce2e3c91d..5aa0b3f0f1 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5085,8 +5085,8 @@ static void register_book3s_altivec_sprs(CPUPPCState *env)
>       }
>   
>       spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
> -                     &spr_read_generic, &spr_write_generic,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_generic, &spr_write_generic32,
> +                     &spr_read_generic, &spr_write_generic32,
>                        KVM_REG_PPC_VRSAVE, 0x00000000);
>   
>   }

This change broke linux-user build, could you please check once?

[1776/2718] Compiling C object 
libqemu-ppc64le-linux-user.fa.p/target_ppc_cpu_init.c.o
FAILED: libqemu-ppc64le-linux-user.fa.p/target_ppc_cpu_init.c.o
gcc -m64 -mcx16 -Ilibqemu-ppc64le-linux-user.fa.p -I. -I.. -Itarget/ppc 
-I../target/ppc -I../common-user/host/x86_64 
-I../linux-user/include/host/x86_64 -I../linux-user/include -Ilinux-user 
-I../linux-user -Ilinux-user/ppc -I../linux-user/ppc -Iqapi -Itrace -Iui 
-Iui/shader -I/usr/include/glib-2.0 
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto 
-Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem 
/home/travis/build/Harsh-Prateek-Bora/qemu/linux-headers -isystem 
linux-headers -iquote . -iquote 
/home/travis/build/Harsh-Prateek-Bora/qemu -iquote 
/home/travis/build/Harsh-Prateek-Bora/qemu/include -iquote 
/home/travis/build/Harsh-Prateek-Bora/qemu/tcg/i386 -pthread 
-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing 
-fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-prototypes 
-Wstrict-prototypes -Wredundant-decls -Wold-style-declaration 
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k 
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs 
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
-Wmissing-format-attribute -Wno-missing-include-dirs 
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE 
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H 
'-DCONFIG_TARGET="ppc64le-linux-user-config-target.h"' 
'-DCONFIG_DEVICES="ppc64le-linux-user-config-devices.h"' -MD -MQ 
libqemu-ppc64le-linux-user.fa.p/target_ppc_cpu_init.c.o -MF 
libqemu-ppc64le-linux-user.fa.p/target_ppc_cpu_init.c.o.d -o 
libqemu-ppc64le-linux-user.fa.p/target_ppc_cpu_init.c.o -c 
../target/ppc/cpu_init.c
In file included from ../target/ppc/cpu_init.c:46:
../target/ppc/cpu_init.c: In function ‘register_book3s_altivec_sprs’:
../target/ppc/cpu_init.c:5089:42: error: ‘spr_write_generic32’ 
undeclared (first use in this function); did you mean ‘spr_write_generic’?
  5089 |                      &spr_read_generic, &spr_write_generic32,
       |                                          ^~~~~~~~~~~~~~~~~~~
../target/ppc/spr_common.h:25:24: note: in definition of macro ‘USR_ARG’
    25 | # define USR_ARG(X)    X,
       |                        ^
../target/ppc/spr_common.h:66:5: note: in expansion of macro 
‘spr_register_kvm_hv’
    66 |     spr_register_kvm_hv(env, num, name, uea_read, uea_write, 
oea_read,       \
       |     ^~~~~~~~~~~~~~~~~~~
../target/ppc/cpu_init.c:5088:5: note: in expansion of macro 
‘spr_register_kvm’
  5088 |     spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
       |     ^~~~~~~~~~~~~~~~
../target/ppc/cpu_init.c:5089:42: note: each undeclared identifier is 
reported only once for each function it appears in
  5089 |                      &spr_read_generic, &spr_write_generic32,
       |                                          ^~~~~~~~~~~~~~~~~~~
../target/ppc/spr_common.h:25:24: note: in definition of macro ‘USR_ARG’
    25 | # define USR_ARG(X)    X,
       |                        ^
../target/ppc/spr_common.h:66:5: note: in expansion of macro 
‘spr_register_kvm_hv’
    66 |     spr_register_kvm_hv(env, num, name, uea_read, uea_write, 
oea_read,       \
       |     ^~~~~~~~~~~~~~~~~~~
../target/ppc/cpu_init.c:5088:5: note: in expansion of macro 
‘spr_register_kvm’
  5088 |     spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
       |     ^~~~~~~~~~~~~~~~
[1777/2718] Compiling C object 
libqemu-ppc64le-linux-user.fa.p/target_ppc_cpu-models.c.o
[1778/2718] Compiling C object 
libqemu-ppc64le-linux-user.fa.p/target_ppc_fpu_helper.c.o
ninja: build stopped: subcommand failed.
make: *** [Makefile:165: run-ninja] Error 1

regards,
Harsh

> @@ -5120,7 +5120,7 @@ static void register_book3s_207_dbg_sprs(CPUPPCState *env)
>       spr_register_kvm_hv(env, SPR_DAWRX0, "DAWRX0",
>                           SPR_NOACCESS, SPR_NOACCESS,
>                           SPR_NOACCESS, SPR_NOACCESS,
> -                        &spr_read_generic, &spr_write_generic,
> +                        &spr_read_generic, &spr_write_generic32,
>                           KVM_REG_PPC_DAWRX, 0x00000000);
>       spr_register_kvm_hv(env, SPR_CIABR, "CIABR",
>                           SPR_NOACCESS, SPR_NOACCESS,
> @@ -5376,7 +5376,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_TSCR, "TSCR",
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic32,
>                    0x00000000);
>       spr_register_hv(env, SPR_HMER, "HMER",
>                    SPR_NOACCESS, SPR_NOACCESS,
> @@ -5406,7 +5406,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_MMCRC, "MMCRC",
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic32,
>                    0x00000000);
>       spr_register_hv(env, SPR_MMCRH, "MMCRH",
>                    SPR_NOACCESS, SPR_NOACCESS,
> @@ -5441,7 +5441,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_HDSISR, "HDSISR",
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> +                 &spr_read_generic, &spr_write_generic32,
>                    0x00000000);
>       spr_register_hv(env, SPR_HRMOR, "HRMOR",
>                    SPR_NOACCESS, SPR_NOACCESS,
> @@ -5665,7 +5665,7 @@ static void register_power7_book4_sprs(CPUPPCState *env)
>                        KVM_REG_PPC_ACOP, 0);
>       spr_register_kvm(env, SPR_BOOKS_PID, "PID",
>                        SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_generic, &spr_write_generic32,
>                        KVM_REG_PPC_PID, 0);
>   #endif
>   }
> @@ -5730,7 +5730,7 @@ static void register_power10_dexcr_sprs(CPUPPCState *env)
>   {
>       spr_register(env, SPR_DEXCR, "DEXCR",
>               SPR_NOACCESS, SPR_NOACCESS,
> -            &spr_read_generic, &spr_write_generic,
> +            &spr_read_generic, &spr_write_generic32,
>               0);
>   
>       spr_register(env, SPR_UDEXCR, "DEXCR",
> @@ -5741,7 +5741,7 @@ static void register_power10_dexcr_sprs(CPUPPCState *env)
>       spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
>               SPR_NOACCESS, SPR_NOACCESS,
>               SPR_NOACCESS, SPR_NOACCESS,
> -            &spr_read_generic, &spr_write_generic,
> +            &spr_read_generic, &spr_write_generic32,
>               0);
>   
>       spr_register(env, SPR_UHDEXCR, "HDEXCR",
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 779e7db513..fb351c303f 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -448,7 +448,7 @@ void register_non_embedded_sprs(CPUPPCState *env)
>       /* Exception processing */
>       spr_register_kvm(env, SPR_DSISR, "DSISR",
>                        SPR_NOACCESS, SPR_NOACCESS,
> -                     &spr_read_generic, &spr_write_generic,
> +                     &spr_read_generic, &spr_write_generic32,
>                        KVM_REG_PPC_DSISR, 0x00000000);
>       spr_register_kvm(env, SPR_DAR, "DAR",
>                        SPR_NOACCESS, SPR_NOACCESS,
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index a9bc1522e2..40ddc5c08c 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -190,13 +190,13 @@ void helper_store_dpdes(CPUPPCState *env, target_ulong val)
>   
>   void helper_store_pidr(CPUPPCState *env, target_ulong val)
>   {
> -    env->spr[SPR_BOOKS_PID] = val;
> +    env->spr[SPR_BOOKS_PID] = (uint32_t)val;
>       tlb_flush(env_cpu(env));
>   }
>   
>   void helper_store_lpidr(CPUPPCState *env, target_ulong val)
>   {
> -    env->spr[SPR_LPIDR] = val;
> +    env->spr[SPR_LPIDR] = (uint32_t)val;
>   
>       /*
>        * We need to flush the TLB on LPID changes as we only tag HV vs
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 1381072b9e..64a64865d7 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -272,7 +272,7 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
>   {
>       pmu_update_cycles(env);
>   
> -    env->spr[sprn] = value;
> +    env->spr[sprn] = (uint32_t)value;
>   
>       pmc_update_overflow_timer(env, sprn);
>   }
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index f603f1a939..c03a6bdc9a 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -413,7 +413,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>   
>   void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
>   {
> -    spr_write_generic(ctx, sprn, gprn);
> +    spr_write_generic32(ctx, sprn, gprn);
>   
>       /*
>        * SPR_CTRL writes must force a new translation block,

