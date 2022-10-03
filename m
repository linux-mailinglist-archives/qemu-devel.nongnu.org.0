Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08D5F31E8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:23:58 +0200 (CEST)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofMMP-0002An-1G
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofMCW-0001RY-UF; Mon, 03 Oct 2022 10:13:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ofMCQ-0006ST-Hv; Mon, 03 Oct 2022 10:13:40 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293DM0s5003613;
 Mon, 3 Oct 2022 14:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=uMyOAmiRtlrurRie55GAVZ2k099txYBQhB16t1ealfk=;
 b=NFquJywIR2qvOd4e8/1LCW0xhEpJgTHr+O8bxX4fN9Lx/3L1A4ygvVETfkf1Xv2Nway5
 jpEuZP+5IDtSPUgdFhWP0m7Lhf/ZzVPNnOAuJNFypt27hzYsSOmKLHwo5DkG0u87wKwc
 K3ePp3kNhSnIk5h7UOyqqI9r7VII89y2XMfMAUag9y1Am57+m5DqJlz+Hbgc4whtpS2G
 R/5pLdqRoo8r20TlDungNJoDzcf1hIJGwpJLKWToEw42QXSa9X0Mu8GBVsNASPmFxbDl
 qp0ZqUoXUtYp607gMp7Bb3fG2RZ/7aRvN1klGT1/9Jjmy6LG/BvH+bE5hHf9RoiOfH7Q +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k00jd1m7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:13:22 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 293DMR8S005034;
 Mon, 3 Oct 2022 14:13:22 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k00jd1m75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:13:21 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 293E6jxR026754;
 Mon, 3 Oct 2022 14:13:20 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3jxd69dkwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 14:13:20 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 293EDJ4765798526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Oct 2022 14:13:20 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63BB058053;
 Mon,  3 Oct 2022 14:13:19 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BA9658043;
 Mon,  3 Oct 2022 14:13:18 +0000 (GMT)
Received: from localhost (unknown [9.160.178.216])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  3 Oct 2022 14:13:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 29/29] target/ppc: move the
 p*_interrupt_powersave methods to excp_helper.c
In-Reply-To: <20220927201544.4088567-30-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-30-matheus.ferst@eldorado.org.br>
Date: Mon, 03 Oct 2022 11:13:16 -0300
Message-ID: <87fsg5572b.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N_7YFMIhMkwOSsR_-7We_l6NhCzO0fOc
X-Proofpoint-ORIG-GUID: hSkLKPMT_wjM5uQHlAmIOcuyR9zmXjdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=950 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210030085
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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

> Move the methods to excp_helper.c and make them static.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu_init.c    | 102 ---------------------------------------
>  target/ppc/excp_helper.c | 102 +++++++++++++++++++++++++++++++++++++++
>  target/ppc/internal.h    |   6 ---
>  3 files changed, 102 insertions(+), 108 deletions(-)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 4d0064c7a5..a9c2726d51 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5960,30 +5960,6 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>      return true;
>  }
>  
> -int p7_interrupt_powersave(CPUPPCState *env)
> -{
> -    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> -        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
> -        return PPC_INTERRUPT_EXT;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
> -        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
> -        return PPC_INTERRUPT_DECR;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
> -        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
> -        return PPC_INTERRUPT_MCK;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
> -        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
> -        return PPC_INTERRUPT_HMI;
> -    }
> -    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> -        return PPC_INTERRUPT_RESET;
> -    }
> -    return 0;
> -}
> -
>  POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -6120,38 +6096,6 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>      return true;
>  }
>  
> -int p8_interrupt_powersave(CPUPPCState *env)
> -{
> -    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> -        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
> -        return PPC_INTERRUPT_EXT;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
> -        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
> -        return PPC_INTERRUPT_DECR;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
> -        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
> -        return PPC_INTERRUPT_MCK;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
> -        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
> -        return PPC_INTERRUPT_HMI;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
> -        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
> -        return PPC_INTERRUPT_DOORBELL;
> -    }
> -    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
> -        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
> -        return PPC_INTERRUPT_HDOORBELL;
> -    }
> -    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> -        return PPC_INTERRUPT_RESET;
> -    }
> -    return 0;
> -}
> -
>  POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -6325,52 +6269,6 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
>      return false;
>  }
>  
> -int p9_interrupt_powersave(CPUPPCState *env)
> -{
> -    /* External Exception */
> -    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> -        (env->spr[SPR_LPCR] & LPCR_EEE)) {
> -        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
> -        if (!heic || !FIELD_EX64_HV(env->msr) ||
> -            FIELD_EX64(env->msr, MSR, PR)) {
> -            return PPC_INTERRUPT_EXT;
> -        }
> -    }
> -    /* Decrementer Exception */
> -    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
> -        (env->spr[SPR_LPCR] & LPCR_DEE)) {
> -        return PPC_INTERRUPT_DECR;
> -    }
> -    /* Machine Check or Hypervisor Maintenance Exception */
> -    if (env->spr[SPR_LPCR] & LPCR_OEE) {
> -        if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
> -            return PPC_INTERRUPT_MCK;
> -        }
> -        if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
> -            return PPC_INTERRUPT_HMI;
> -        }
> -    }
> -    /* Privileged Doorbell Exception */
> -    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
> -        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
> -        return PPC_INTERRUPT_DOORBELL;
> -    }
> -    /* Hypervisor Doorbell Exception */
> -    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
> -        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
> -        return PPC_INTERRUPT_HDOORBELL;
> -    }
> -    /* Hypervisor virtualization exception */
> -    if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
> -        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
> -        return PPC_INTERRUPT_HVIRT;
> -    }
> -    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> -        return PPC_INTERRUPT_RESET;
> -    }
> -    return 0;
> -}
> -
>  POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 9708f82b30..57937956e4 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1686,6 +1686,30 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>       PPC_INTERRUPT_PIT | PPC_INTERRUPT_DOORBELL | PPC_INTERRUPT_HDOORBELL | \
>       PPC_INTERRUPT_THERM | PPC_INTERRUPT_EBB)
>  
> +static int p7_interrupt_powersave(CPUPPCState *env)
> +{
> +    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> +        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
> +        return PPC_INTERRUPT_EXT;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
> +        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
> +        return PPC_INTERRUPT_DECR;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
> +        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
> +        return PPC_INTERRUPT_MCK;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
> +        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
> +        return PPC_INTERRUPT_HMI;
> +    }
> +    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> +        return PPC_INTERRUPT_RESET;
> +    }
> +    return 0;
> +}
> +
>  static int p7_next_unmasked_interrupt(CPUPPCState *env)
>  {
>      PowerPCCPU *cpu = env_archcpu(env);
> @@ -1751,6 +1775,38 @@ static int p7_next_unmasked_interrupt(CPUPPCState *env)
>      PPC_INTERRUPT_FIT | PPC_INTERRUPT_PIT | PPC_INTERRUPT_DOORBELL |    \
>      PPC_INTERRUPT_HDOORBELL | PPC_INTERRUPT_THERM)
>  
> +static int p8_interrupt_powersave(CPUPPCState *env)
> +{
> +    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> +        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
> +        return PPC_INTERRUPT_EXT;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
> +        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
> +        return PPC_INTERRUPT_DECR;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
> +        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
> +        return PPC_INTERRUPT_MCK;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
> +        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
> +        return PPC_INTERRUPT_HMI;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
> +        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
> +        return PPC_INTERRUPT_DOORBELL;
> +    }
> +    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
> +        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
> +        return PPC_INTERRUPT_HDOORBELL;
> +    }
> +    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> +        return PPC_INTERRUPT_RESET;
> +    }
> +    return 0;
> +}
> +
>  static int p8_next_unmasked_interrupt(CPUPPCState *env)
>  {
>      PowerPCCPU *cpu = env_archcpu(env);
> @@ -1820,6 +1876,52 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
>       PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL | PPC_INTERRUPT_FIT |  \
>       PPC_INTERRUPT_PIT | PPC_INTERRUPT_THERM)
>  
> +static int p9_interrupt_powersave(CPUPPCState *env)
> +{
> +    /* External Exception */
> +    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
> +        (env->spr[SPR_LPCR] & LPCR_EEE)) {
> +        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
> +        if (!heic || !FIELD_EX64_HV(env->msr) ||
> +            FIELD_EX64(env->msr, MSR, PR)) {
> +            return PPC_INTERRUPT_EXT;
> +        }
> +    }
> +    /* Decrementer Exception */
> +    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
> +        (env->spr[SPR_LPCR] & LPCR_DEE)) {
> +        return PPC_INTERRUPT_DECR;
> +    }
> +    /* Machine Check or Hypervisor Maintenance Exception */
> +    if (env->spr[SPR_LPCR] & LPCR_OEE) {
> +        if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
> +            return PPC_INTERRUPT_MCK;
> +        }
> +        if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
> +            return PPC_INTERRUPT_HMI;
> +        }
> +    }
> +    /* Privileged Doorbell Exception */
> +    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
> +        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
> +        return PPC_INTERRUPT_DOORBELL;
> +    }
> +    /* Hypervisor Doorbell Exception */
> +    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
> +        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
> +        return PPC_INTERRUPT_HDOORBELL;
> +    }
> +    /* Hypervisor virtualization exception */
> +    if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
> +        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
> +        return PPC_INTERRUPT_HVIRT;
> +    }
> +    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
> +        return PPC_INTERRUPT_RESET;
> +    }
> +    return 0;
> +}
> +
>  static int p9_next_unmasked_interrupt(CPUPPCState *env)
>  {
>      PowerPCCPU *cpu = env_archcpu(env);
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 25827ebf6f..337a362205 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -306,10 +306,4 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
>      return msk;
>  }
>  
> -#if defined(TARGET_PPC64)
> -int p9_interrupt_powersave(CPUPPCState *env);
> -int p8_interrupt_powersave(CPUPPCState *env);
> -int p7_interrupt_powersave(CPUPPCState *env);
> -#endif
> -
>  #endif /* PPC_INTERNAL_H */

