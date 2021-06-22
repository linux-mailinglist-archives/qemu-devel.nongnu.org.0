Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66A93B0D3D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 20:54:22 +0200 (CEST)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvlXR-0006Ub-Uj
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 14:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lvlVV-00052s-Ii; Tue, 22 Jun 2021 14:52:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lvlVS-0006gL-1c; Tue, 22 Jun 2021 14:52:21 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MIiMpE087366; Tue, 22 Jun 2021 14:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UrZIJx2oR/EZpxCLXtO8J+Bp0thBZTs6oZVz6eVr9WU=;
 b=nL1lxcE7HuvUfUEt3ZTgCxBXHDddBtfbm2hs/mxIqVLd6GVGJfHsRG4Sdm9jCvQy1lGU
 A/2q/3bYa3qY88/9tF3kWOuA7B3t4/tzrNiVSMwXfATgjRxaNxXTqQVial6qzJRfzIGX
 lxbr2XVhN02QVr31UbvOg0hVrlQaFOQcN644TbWuJqggoI8fP6rjmX9O923msprAHLAb
 tylBYpH/oS1MscCk3NAGw4AdpPgPxCa9Zc20gVsFXyX1gqU+s9Q73XfS7zGJzzrCG/Wu
 VCZs7XZ34fPnxjIsXmC//fyNkreu1jHw4sJBYSHr9P+krfuT/SA45+RWydg0YtEinIxa VA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bk9ymdbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 14:52:08 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MIq7dc009440;
 Tue, 22 Jun 2021 18:52:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 399wjg91ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 18:52:07 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MIq6mu21299560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 18:52:06 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C75C7805E;
 Tue, 22 Jun 2021 18:52:06 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A37F27805F;
 Tue, 22 Jun 2021 18:52:05 +0000 (GMT)
Received: from localhost (unknown [9.211.80.241])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 22 Jun 2021 18:52:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] target/ppc: Introduce ppc_interrupts_little_endian()
In-Reply-To: <20210622140926.677618-2-groug@kaod.org>
References: <20210622140926.677618-1-groug@kaod.org>
 <20210622140926.677618-2-groug@kaod.org>
Date: Tue, 22 Jun 2021 15:52:03 -0300
Message-ID: <87tulpohpo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OfC49Ys3Og6115W1tDC0XRzDY3EO77ZJ
X-Proofpoint-GUID: OfC49Ys3Og6115W1tDC0XRzDY3EO77ZJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_12:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> PowerPC CPUs use big endian by default but starting with POWER7,
> server grade CPUs use the ILE bit of the LPCR special purpose
> register to decide on the endianness to use when handling
> interrupts. This gives a clue to QEMU on the endianness the
> guest kernel is running, which is needed when generating an
> ELF dump of the guest or when delivering an FWNMI machine
> check interrupt.
>
> Commit 382d2db62bcb ("target-ppc: Introduce callback for interrupt
> endianness") added a class method to PowerPCCPUClass to modelize
> this : default implementation returns a fixed "big endian" value,
> while POWER7 and newer do the LPCR_ILE check. This is suboptimal
> as it forces to implement the method for every new CPU family, and
> it is very unlikely that this will ever be different than what we
> have today.
>
> We basically only have three cases to consider:
> a) CPU doesn't have an LPCR => big endian
> b) CPU has an LPCR but doesn't support the ILE bit => big endian
> c) CPU has an LPCR and supports the ILE bit => little or big endian
>
> Instead of class methods, introduce an inline helper that checks the
> ILE bit in the LPCR_MASK to decide on the outcome. The new helper
> words little endian instead of big endian. This allows to drop a !
> operator in ppc_cpu_do_fwnmi_machine_check().
>
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu.h         | 15 +++++++++++++++
>  target/ppc/arch_dump.c   |  8 +++-----
>  target/ppc/excp_helper.c |  3 +--
>  3 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index b4de0db7ff5c..93d308ac8f2d 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2643,6 +2643,21 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
>      return cpu->env.spr_cb[spr].name != NULL;
>  }
>  
> +static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
> +{
> +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> +
> +    /*
> +     * Only models that have an LPCR and know about LPCR_ILE can do little
> +     * endian.
> +     */
> +    if (pcc->lpcr_mask & LPCR_ILE) {
> +        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
> +    }
> +
> +    return false;
> +}
> +
>  void dump_mmu(CPUPPCState *env);
>  
>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 9210e61ef463..bb392f6d8885 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -227,22 +227,20 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>                        const struct GuestPhysBlockList *guest_phys_blocks)
>  {
>      PowerPCCPU *cpu;
> -    PowerPCCPUClass *pcc;
>  
>      if (first_cpu == NULL) {
>          return -1;
>      }
>  
>      cpu = POWERPC_CPU(first_cpu);
> -    pcc = POWERPC_CPU_GET_CLASS(cpu);
>  
>      info->d_machine = PPC_ELF_MACHINE;
>      info->d_class = ELFCLASS;
>  
> -    if ((*pcc->interrupts_big_endian)(cpu)) {
> -        info->d_endian = ELFDATA2MSB;
> -    } else {
> +    if (ppc_interrupts_little_endian(cpu)) {
>          info->d_endian = ELFDATA2LSB;
> +    } else {
> +        info->d_endian = ELFDATA2MSB;
>      }
>      /* 64KB is the max page size for pseries kernel */
>      if (strncmp(object_get_typename(qdev_get_machine()),
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index fd147e2a3766..a79a0ed465e5 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1099,7 +1099,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
>  {
>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>      CPUPPCState *env = &cpu->env;
> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>      target_ulong msr = 0;
>  
>      /*
> @@ -1108,7 +1107,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
>       */
>      msr = (1ULL << MSR_ME);
>      msr |= env->msr & (1ULL << MSR_SF);
> -    if (!(*pcc->interrupts_big_endian)(cpu)) {
> +    if (ppc_interrupts_little_endian(cpu)) {
>          msr |= (1ULL << MSR_LE);
>      }

