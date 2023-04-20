Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE966E98CB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:54:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWaP-0002Nw-VV; Thu, 20 Apr 2023 11:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ppWaN-0002NK-9Z; Thu, 20 Apr 2023 11:52:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1ppWaK-0006Rr-Nx; Thu, 20 Apr 2023 11:52:39 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KFcx65010267; Thu, 20 Apr 2023 15:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QLA3OcMa4VKAYsgjg5iJ1WPEo2bnqb722Ar+tw+funY=;
 b=kM24uKlHm2sTPjexFGQfpi5wpu3+JSCpeSvQSLeKJat4UQ+qIRbmYMd89kFiaMbOb+wx
 0XOiv6XBJ499u9xH0Aslo7cR2Hk+YXH6IALsqnIAfCRad61TmDcqaQh5a/LijAqB6KcB
 8ljTpXlq1Edcy9+wWOrcn5uylYTdre6DppMKqD6mcs1MFN2zZTrWc1LFZ1NTgqLkIxCy
 Vzj1+HOAul+YzdWRcheHFwksK0MwhN0lOUSxOrzlCDOhGssIg4vnbhsChab1uHOxXRxy
 MbcEX9FTcR9g/5bxoMarTeIFzxgAcjxWhPH/oxwjWvEAosT+J3wJ5a2jajn5aEN8s554 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q37x1h4b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 15:52:23 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33KFdI3f012214;
 Thu, 20 Apr 2023 15:52:22 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q37x1h4aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 15:52:22 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33KDbKA9029086;
 Thu, 20 Apr 2023 15:52:21 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pykj7v2u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 15:52:21 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33KFqK8H3605242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 15:52:20 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 108E958055;
 Thu, 20 Apr 2023 15:52:20 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B65805803F;
 Thu, 20 Apr 2023 15:52:14 +0000 (GMT)
Received: from [9.43.106.147] (unknown [9.43.106.147])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 20 Apr 2023 15:52:14 +0000 (GMT)
Message-ID: <8b68fb2e-3ff9-8e8d-88e0-9fe8af547036@linux.ibm.com>
Date: Thu, 20 Apr 2023 21:22:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target: ppc: Correctly initialize HILE in HID-0 for
 book3s processors
Content-Language: en-US
To: Narayana Murty N <nnmlinux@linux.ibm.com>, danielhb413@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, npiggin@linux.ibm.com,
 vajain21@linux.ibm.com, sbhat@linux.ibm.com
References: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20230420145055.10196-1-nnmlinux@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9ukLA-lkZvbRP-rhZ3oHQklZTyLqed2S
X-Proofpoint-ORIG-GUID: 1tOtWCxJFOQD64m-p56KhuHOfONDj-84
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_11,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=968
 priorityscore=1501 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

Hi Narayana,

Minor comments inline below.

On 4/20/23 20:20, Narayana Murty N wrote:
> On PPC64 the HILE(Hypervisor Interrupt Little Endian) bit in HID-0
> register needs to be initialized as per isa 3.0b[1] section
> 2.10. This bit gets copied to the MSR_LE when handling interrupts that
> are handled in HV mode to establish the Endianess mode of the interrupt
> handler.
> 
> Qemu's ppc_interrupts_little_endian() depends on HILE to determine Host
> endianness which is then used to determine the endianess of the guest dump.
> 
> Currently the HILE bit is never set in the HID0 register even if the
> qemu is running in Little-Endian mode. This causes the guest dumps to be
> always taken in Big-Endian byte ordering. A guest memory dump of a
> Little-Endian guest running on Little-Endian qemu guest fails with the
> crash tool as illustrated below:
> 
> Log :
> $ virsh dump DOMAIN --memory-only dump.file
> 
> Domain 'DOMAIN' dumped to dump.file
> 
> $ crash vmlinux dump.file
> 
> <snip>
> crash 8.0.2-1.el9
> 
> WARNING: endian mismatch:
>           crash utility: little-endian
>           dump.file: big-endian
> 
> WARNING: machine type mismatch:
>           crash utility: PPC64
>           dump.file: (unknown)
> 
> crash: dump.file: not a supported file format
> <snip>
> 
> The patch fixes the issue by Setting HILE on little-endian host. HILE bit values
> are documented at [1] for POWER7, POWER8 and [2] for POWER9 onwards.
> 
> For power9 and power10:
> 	The new helper function "set_spr_default_value" added to change the default value
> 	as per host endianness in init_proc_POWER9, init_proc_POWER10
> 
> For power7 and power8 :
> 	correcting "spr_register_hv" function parameter for initial value to
> 	HID0_ISA206_INIT_VAL in register_book3s_ids_sprs()
> 
> References:
> 1. ISA 2.06, section 2.9 for POWER7,POWER8
> 2. ISA 3.0b, section 2.10 for POWER9 onwards - https://openpowerfoundation.org/specifications/isa/
> 

ISA ver and section information can be included in code comments below 
where respective macros are being introduced.

> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>   target/ppc/cpu.h         |  9 +++++++++
>   target/ppc/cpu_init.c    | 18 +++++++++++++++++-
>   target/ppc/helper_regs.c | 18 ++++++++++++++++++
>   target/ppc/spr_common.h  |  3 +++
>   4 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 557d736dab..8c15e9cde7 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2113,6 +2113,15 @@ void ppc_compat_add_property(Object *obj, const char *name,
>   #define HID0_HILE           PPC_BIT(19) /* POWER8 */
>   #define HID0_POWER9_HILE    PPC_BIT(4)
>   
> +/* HID0 register initial value for POWER9 */
> +#if HOST_BIG_ENDIAN
> +#define HID0_ISA206_INIT_VAL    0x00000000        /* POWER7 Onwards */
> +#define HID0_ISA300_INIT_VAL    0x00000000        /* POWER9 Onwards */
> +#else
> +#define HID0_ISA206_INIT_VAL    HID0_HILE         /* POWER7 Onwards */
> +#define HID0_ISA300_INIT_VAL    HID0_POWER9_HILE  /* POWER9 Onwards */
> +#endif
> +
>   /*****************************************************************************/
>   /* PowerPC Instructions types definitions                                    */
>   enum {
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 0ce2e3c91d..5b481dc5c3 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5372,7 +5372,7 @@ static void register_book3s_ids_sprs(CPUPPCState *env)
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> +                 HID0_ISA206_INIT_VAL);
>       spr_register_hv(env, SPR_TSCR, "TSCR",
>                    SPR_NOACCESS, SPR_NOACCESS,
>                    SPR_NOACCESS, SPR_NOACCESS,
> @@ -5699,6 +5699,15 @@ static void register_power9_mmu_sprs(CPUPPCState *env)
>   #endif
>   }
>   
> +static void set_power9_default_value_sprs(CPUPPCState *env)
> +{

Naming it as set_power9_sprs_default_value (like the internal helper) 
may be more appropriate.

> +    /*
> +     * ISA 3.00, book3s ids HID0 register, HILE bit position
> +     * changed to bit HID0_POWER9_HILE
> +     */
> +    set_spr_default_value(env, SPR_HID0, HID0_ISA300_INIT_VAL);
> +}
> +
>   static void register_power10_hash_sprs(CPUPPCState *env)
>   {
>       /*
> @@ -6250,6 +6259,9 @@ static void init_proc_POWER9(CPUPPCState *env)
>       register_power8_rpr_sprs(env);
>       register_power9_mmu_sprs(env);
>   
> +    /* POWER9 Host Specific register initialization */
> +    set_power9_default_value_sprs(env);
> +
>       /* POWER9 Specific registers */
>       spr_register_kvm(env, SPR_TIDR, "TIDR", NULL, NULL,
>                        spr_read_generic, spr_write_generic,
> @@ -6424,6 +6436,10 @@ static void init_proc_POWER10(CPUPPCState *env)
>       register_power8_book4_sprs(env);
>       register_power8_rpr_sprs(env);
>       register_power9_mmu_sprs(env);
> +
> +    /* POWER10 Host Specific register initialization */
> +    set_power9_default_value_sprs(env);
> +
>       register_power10_hash_sprs(env);
>       register_power10_dexcr_sprs(env);
>   
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 779e7db513..f17e9e78c2 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -351,6 +351,24 @@ void _spr_register(CPUPPCState *env, int num, const char *name,
>   #endif
>   }
>   
> +/**
> + * set_spr_default_value
> + *
> + * sets the spr register with default value overide.
> + */
> +void set_spr_default_value(CPUPPCState *env, int num,
> +                   target_ulong default_value)

Indentation should match the starting of first arg type above.

> +{
> +    assert(num < ARRAY_SIZE(env->spr_cb));
> +    ppc_spr_t *spr = &env->spr_cb[num];
> +
> +    /* Verify the spr registered already. */
> +    assert(spr->name != NULL);
> +
> +    spr->default_value = default_value;
> +    env->spr[num] = default_value;
> +}
> +
>   /* Generic PowerPC SPRs */
>   void register_generic_sprs(PowerPCCPU *cpu)
>   {
> diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
> index 8437eb0340..b1d27f0138 100644
> --- a/target/ppc/spr_common.h
> +++ b/target/ppc/spr_common.h
> @@ -77,6 +77,9 @@ void _spr_register(CPUPPCState *env, int num, const char *name,
>       spr_register_kvm(env, num, name, uea_read, uea_write,                    \
>                        oea_read, oea_write, 0, ival)
>   
> +void set_spr_default_value(CPUPPCState *env, int num,
> +                   target_ulong default_value);

Ditto.

Otherwise, looks good to me.

Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>

> +
>   /* prototypes for readers and writers for SPRs */
>   void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>   void spr_read_generic(DisasContext *ctx, int gprn, int sprn);

