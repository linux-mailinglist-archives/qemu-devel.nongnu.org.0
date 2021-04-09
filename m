Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686DA35A80F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:43:02 +0200 (CEST)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxxw-0002jV-W9
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lUxw8-0002EM-5X; Fri, 09 Apr 2021 16:41:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1318
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lUxw1-0006NB-Jp; Fri, 09 Apr 2021 16:41:03 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139KXLP1149159; Fri, 9 Apr 2021 16:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=w8mS35Vusr8zI4hS05ZiJCF9+3/J471+h9c3TAY9mPc=;
 b=C10ABF7NQDfdj3g94YSrOR4rJpngwGlOXp+GXCdF8ZKTTlkyy9vasLS/BcswPa7KjEOf
 o/kukll8YQlXVKwZzxAbUxfSAoUSDw2Cxk2TPDEV9gvY1fNfwcyIBBCm8rJhOmrhhEhc
 RE87SZFUcdgBujG7xU5PUgbHjTiG+9+p7l1tPSwTqyak4mrStnmHvGh2L+M7XxhHudJv
 uXFclAkdDCBI9XJ+fwMiUTO9VrkEgjyNtlEZvUPHudBGab5IJBkFa3w7npYUYw6POV38
 /uNA3VWxrai/SZIFDSJBfsg8kXQI4lDOPSttV2kgcKiUqXi4rjdDeWOTtQuDq0kZxeeK NQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37tqpjbd7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 16:40:52 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139KWAbM005267;
 Fri, 9 Apr 2021 20:40:51 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 37rvyvxmj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 20:40:51 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 139Kep9Y31457644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 20:40:51 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51ED2AC05B;
 Fri,  9 Apr 2021 20:40:51 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61406AC059;
 Fri,  9 Apr 2021 20:40:50 +0000 (GMT)
Received: from localhost (unknown [9.211.99.145])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  9 Apr 2021 20:40:50 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/4] target/ppc: added solutions for building with
 disable-tcg
In-Reply-To: <20210409151916.97326-3-bruno.larsen@eldorado.org.br>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <20210409151916.97326-3-bruno.larsen@eldorado.org.br>
Date: Fri, 09 Apr 2021 17:40:47 -0300
Message-ID: <87eefj5gz4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q-kUzCFb9JH9EzgxrfzuLdW12x5Hn2Gz
X-Proofpoint-ORIG-GUID: q-kUzCFb9JH9EzgxrfzuLdW12x5Hn2Gz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_08:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090150
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: luis.pires@eldorado.org.br, andre.silva@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, lagarcia@br.ibm.com, "Bruno Larsen
 \(billionai\)" <bruno.larsen@eldorado.org.br>, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

> this commit presents 2 possible solutions for substituting TCG emulation
> with KVM calls. One - used in machine.c and arch_dump.c - explicitly

As I mentioned in my reply to your introductory email I don't think we
should be replacing TCG routines with calls into KVM. Because that would
mean we have been up until now running KVM-supporting code but relying
on TCG routines which would (aside the most simple functions) be
wrong. The whole KVM runs natively, TCG is translated deal.

I don't see what in the vscr helpers makes them TCG-only. They seem like
they would work just fine with KVM code. The kvm_arch_get/put_registers
functions should already take care of synchronizing the CPUPPCState with
KVM.

Does that make sense? Tell me if I'm missing something. =)

> adds the KVM function and has the possibility of adding the TCG one
> for more generic compilation, prioritizing te KVM option. The second
> option, implemented in kvm_ppc.h, transparently changes the helper
> into the KVM call, if TCG is not enabled. I believe the first solution
> is better, but it is less readable, so I wanted to have some feedback
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/arch_dump.c | 17 +++++++++++++++++
>  target/ppc/kvm.c       | 30 ++++++++++++++++++++++++++++++
>  target/ppc/kvm_ppc.h   | 11 +++++++++++
>  target/ppc/machine.c   | 33 ++++++++++++++++++++++++++++++++-
>  4 files changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 9ab04b2c38..c53e01011a 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -17,7 +17,10 @@
>  #include "elf.h"
>  #include "sysemu/dump.h"
>  #include "sysemu/kvm.h"
> +#include "kvm_ppc.h"
> +#if defined(CONFIG_TCG)
>  #include "exec/helper-proto.h"
> +#endif /* CONFIG_TCG */
>  
>  #ifdef TARGET_PPC64
>  #define ELFCLASS ELFCLASS64
> @@ -176,7 +179,21 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>              vmxregset->avr[i].u64[1] = avr->u64[1];
>          }
>      }
> +    /* This is the first solution implemented. My personal favorite as it
> +     * allows for explicit error handling, however it is much less readable */
> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        vmxregset->vscr.u32[3] = cpu_to_dump32(s, kvmppc_mfvscr(cpu));
> +    }else
> +#endif
> +
> +#if defined(CONFIG_TCG)
>      vmxregset->vscr.u32[3] = cpu_to_dump32(s, helper_mfvscr(&cpu->env));
> +#else
> +    {
> +        /* TODO: add proper error handling, even tough this should never be reached */
> +    }
> +#endif
>  }
>  
>  static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb..8ed54d12d8 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -51,6 +51,7 @@
>  #include "elf.h"
>  #include "sysemu/kvm_int.h"
>  
> +
>  #define PROC_DEVTREE_CPU      "/proc/device-tree/cpus/"
>  
>  #define DEBUG_RETURN_GUEST 0
> @@ -2947,3 +2948,32 @@ bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;
>  }
> +
> +/* Functions added to replace helper_m(t|f)vscr from int_helper.c */
> +int kvmppc_mtvscr(PowerPCCPU *cpu, uint32_t val){
> +    CPUState *cs = CPU(cpu);
> +    CPUPPCState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +    reg.id = KVM_REG_PPC_VSCR;
> +    reg.addr = (uintptr_t) &env->vscr;
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if(ret < 0){
> +        fprintf(stderr, "Unable to set VSCR to KVM: %s", strerror(errno));
> +    }
> +    return ret;
> +}
> +
> +int kvmppc_mfvscr(PowerPCCPU *cpu){
> +    CPUState *cs = CPU(cpu);
> +    CPUPPCState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +    reg.id = KVM_REG_PPC_VSCR;
> +    reg.addr = (uintptr_t) &env->vscr;
> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    if(ret < 0){
> +        fprintf(stderr, "Unable to get VSCR to KVM: %s", strerror(errno));
> +    }
> +    return ret;
> +}
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index 989f61ace0..f618cb28b1 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -86,6 +86,17 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset);
>  
>  int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
>  
> +int kvmppc_mtvscr(PowerPCCPU*, uint32_t);
> +int kvmppc_mfvscr(PowerPCCPU*);
> +
> +/* This is the second (quick and dirty) solution. Not my personal favorite
> + * as it hides what is actually happening from the user and doesn't allow
> + * for error checking. but it requires less change in other files */
> +#ifndef CONFIG_TCG
> +#define helper_mtvscr(env, val) kvmppc_mtvscr(env_archcpu(env),val)
> +#define helper_mfvscr(env) kvmppc_mfvscr(env_archcpu(env))
> +#endif
> +
>  #else
>  
>  static inline uint32_t kvmppc_get_tbfreq(void)
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 283db1d28a..d92bc18859 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -8,7 +8,9 @@
>  #include "qapi/error.h"
>  #include "qemu/main-loop.h"
>  #include "kvm_ppc.h"
> +#ifdef CONFIG_TCG
>  #include "exec/helper-proto.h"
> +#endif /*CONFIG_TCG*/
>  
>  static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>  {
> @@ -95,7 +97,18 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>          ppc_store_sdr1(env, sdr1);
>      }
>      qemu_get_be32s(f, &vscr);
> -    helper_mtvscr(env, vscr);
> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        kvmppc_mtvscr(cpu, vscr);
> +    }else
> +#endif
> +#if defined(CONFIG_TCG)
> +        helper_mtvscr(env, vscr);
> +#else
> +    {
> +        /* TODO: Add correct error handling, even though this should never be reached */
> +    }
> +#endif
>      qemu_get_be64s(f, &env->spe_acc);
>      qemu_get_be32s(f, &env->spe_fscr);
>      qemu_get_betls(f, &env->msr_mask);
> @@ -450,7 +463,16 @@ static int get_vscr(QEMUFile *f, void *opaque, size_t size,
>                      const VMStateField *field)
>  {
>      PowerPCCPU *cpu = opaque;
> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        kvmppc_mtvscr(cpu, qemu_get_be32(f));
> +        return 0;
> +    }
> +#endif /*CONFIG_KVM*/
> +
> +#if defined(CONFIG_TCG)
>      helper_mtvscr(&cpu->env, qemu_get_be32(f));
> +#endif /*CONFIG_TCG*/
>      return 0;
>  }
>  
> @@ -458,7 +480,16 @@ static int put_vscr(QEMUFile *f, void *opaque, size_t size,
>                      const VMStateField *field, JSONWriter *vmdesc)
>  {
>      PowerPCCPU *cpu = opaque;
> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        qemu_put_be32(f, kvmppc_mfvscr(cpu));
> +        return 0;
> +    }
> +#endif /*CONFIG_KVM*/
> +
> +#if defined(CONFIG_TCG)
>      qemu_put_be32(f, helper_mfvscr(&cpu->env));
> +#endif /*CONFIG_TCG*/
>      return 0;
>  }

