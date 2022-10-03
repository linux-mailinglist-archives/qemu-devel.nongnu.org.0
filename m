Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B35F31D8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:18:26 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMH3-0005Zm-5a
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofMBe-0000yZ-NF; Mon, 03 Oct 2022 10:12:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13782
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofMBZ-0006Ox-8p; Mon, 03 Oct 2022 10:12:46 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293DYvM7002134;
 Mon, 3 Oct 2022 14:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+GOB8TOc5Sq77juFNb/Av7gnZ0dyWRyb92T59LtPdgk=;
 b=DYxyt7O+W3MPqapY+USIVLGDpTWbkl98hnkaeziAXWA2R5Dc4EA4FgoWw7H/5izGxHrl
 ecKlDJ0y30t1ovBymGjVxLwW9SG/TTgIaZuWy+hA+kF9rHeOMb3gW05QhVLVEf8NjilD
 4QZIdXl9zrCZKCsItavUFk2s1CyyLTBSChtc3uQ1AoP5WUXsPf7jvrHxhkTgsCjMmEAw
 ZAyR9v+54Mh//eYN6QMCYDqvyYLFIGspBm5KIjwI1E0X40gZFh6MsLWrC66BDcjsGgIT
 001k/o3hgRRxaP5HdBJHkz1Q33uOhAcURkXKNjfNx6P4OWA6/gAzNqt8fclOR2efVDDj 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jywex76t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:12:30 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293CTwp2027028;
 Mon, 3 Oct 2022 14:12:29 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jywex76rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:12:29 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 293E50hZ001770;
 Mon, 3 Oct 2022 14:12:28 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3jxd69dmnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:12:28 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 293ECQWZ36045286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Oct 2022 14:12:26 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7175258065;
 Mon,  3 Oct 2022 14:12:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDD6758056;
 Mon,  3 Oct 2022 14:12:26 +0000 (GMT)
Received: from localhost (unknown [9.160.178.216])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  3 Oct 2022 14:12:26 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 28/29] target/ppc: unify cpu->has_work based on
 cs->interrupt_request
In-Reply-To: <20220927201544.4088567-29-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-29-matheus.ferst@eldorado.org.br>
Date: Mon, 03 Oct 2022 11:12:25 -0300
Message-ID: <87ill1573q.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zWFPUCGvcq-lDrbYnmr5-3WZCunk10an
X-Proofpoint-GUID: ZuqMtL8t9xJu51MzAwh0if6QAF4Z0psd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Now that cs->interrupt_request indicates if there is any unmasked
> interrupt, checking if the CPU has work to do can be simplified to a
> single check that works for all CPU models.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu_init.c | 94 +------------------------------------------
>  1 file changed, 1 insertion(+), 93 deletions(-)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 26686d1557..4d0064c7a5 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5984,27 +5984,10 @@ int p7_interrupt_powersave(CPUPPCState *env)
>      return 0;
>  }
>  
> -static bool cpu_has_work_POWER7(CPUState *cs)
> -{
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -
> -    if (cs->halted) {
> -        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
> -            return false;
> -        }
> -        return p7_interrupt_powersave(env) != 0;
> -    } else {
> -        return FIELD_EX64(env->msr, MSR, EE) &&
> -               (cs->interrupt_request & CPU_INTERRUPT_HARD);
> -    }
> -}
> -
>  POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc = CPU_CLASS(oc);
>  
>      dc->fw_name = "PowerPC,POWER7";
>      dc->desc = "POWER7";
> @@ -6013,7 +5996,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>      pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
>      pcc->init_proc = init_proc_POWER7;
>      pcc->check_pow = check_pow_nocheck;
> -    cc->has_work = cpu_has_work_POWER7;
>      pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -6170,27 +6152,10 @@ int p8_interrupt_powersave(CPUPPCState *env)
>      return 0;
>  }
>  
> -static bool cpu_has_work_POWER8(CPUState *cs)
> -{
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -
> -    if (cs->halted) {
> -        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
> -            return false;
> -        }
> -        return p8_interrupt_powersave(env) != 0;
> -    } else {
> -        return FIELD_EX64(env->msr, MSR, EE) &&
> -               (cs->interrupt_request & CPU_INTERRUPT_HARD);
> -    }
> -}
> -
>  POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc = CPU_CLASS(oc);
>  
>      dc->fw_name = "PowerPC,POWER8";
>      dc->desc = "POWER8";
> @@ -6199,7 +6164,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>      pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
>      pcc->init_proc = init_proc_POWER8;
>      pcc->check_pow = check_pow_nocheck;
> -    cc->has_work = cpu_has_work_POWER8;
>      pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -6407,35 +6371,10 @@ int p9_interrupt_powersave(CPUPPCState *env)
>      return 0;
>  }
>  
> -static bool cpu_has_work_POWER9(CPUState *cs)
> -{
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -
> -    if (cs->halted) {
> -        uint64_t psscr = env->spr[SPR_PSSCR];
> -
> -        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
> -            return false;
> -        }
> -
> -        /* If EC is clear, just return true on any pending interrupt */
> -        if (!(psscr & PSSCR_EC)) {
> -            return true;
> -        }
> -
> -        return p9_interrupt_powersave(env) != 0;
> -    } else {
> -        return FIELD_EX64(env->msr, MSR, EE) &&
> -               (cs->interrupt_request & CPU_INTERRUPT_HARD);
> -    }
> -}
> -
>  POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc = CPU_CLASS(oc);
>  
>      dc->fw_name = "PowerPC,POWER9";
>      dc->desc = "POWER9";
> @@ -6445,7 +6384,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>                           PCR_COMPAT_2_05;
>      pcc->init_proc = init_proc_POWER9;
>      pcc->check_pow = check_pow_nocheck;
> -    cc->has_work = cpu_has_work_POWER9;
>      pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -6604,35 +6542,10 @@ static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>      return false;
>  }
>  
> -static bool cpu_has_work_POWER10(CPUState *cs)
> -{
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -
> -    if (cs->halted) {
> -        uint64_t psscr = env->spr[SPR_PSSCR];
> -
> -        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
> -            return false;
> -        }
> -
> -        /* If EC is clear, just return true on any pending interrupt */
> -        if (!(psscr & PSSCR_EC)) {
> -            return true;
> -        }
> -
> -        return p9_interrupt_powersave(env) != 0;
> -    } else {
> -        return FIELD_EX64(env->msr, MSR, EE) &&
> -               (cs->interrupt_request & CPU_INTERRUPT_HARD);
> -    }
> -}
> -
>  POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc = CPU_CLASS(oc);
>  
>      dc->fw_name = "PowerPC,POWER10";
>      dc->desc = "POWER10";
> @@ -6643,7 +6556,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>                           PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
>      pcc->init_proc = init_proc_POWER10;
>      pcc->check_pow = check_pow_nocheck;
> -    cc->has_work = cpu_has_work_POWER10;
>      pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -7200,11 +7112,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
>  
>  static bool ppc_cpu_has_work(CPUState *cs)
>  {
> -    PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
> -
> -    return FIELD_EX64(env->msr, MSR, EE) &&
> -           (cs->interrupt_request & CPU_INTERRUPT_HARD);
> +    return cs->interrupt_request & CPU_INTERRUPT_HARD;
>  }
>  
>  static void ppc_cpu_reset(DeviceState *dev)

