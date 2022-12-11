Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D706495F1
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 20:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4RXA-0008Q9-Pj; Sun, 11 Dec 2022 13:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p4R3v-0003LF-QV; Sun, 11 Dec 2022 13:28:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p4R3s-0000wS-4X; Sun, 11 Dec 2022 13:28:31 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BBDgFNq017647; Sun, 11 Dec 2022 18:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/tpup7HYGd2qlJeRGnG9Nn1AxxHXNO5rtuwu7oWqIgU=;
 b=EqdZAA/81mq9snucu7W6eJXsEMR5dYu7TnNDCf49cWKpyfOKMeWVr31Ppeyz33znVNB1
 ekmR0X0nimoClwsqEtjoTRXDHwEF8pxI5t9GRoj/eiddSSa3LEJ79sX1BEUnmH3NYvTE
 WgnSYm1azwB7c2JOnVNS9gvsAKCeFtBl4/doRnnO4TO4CbvPU1MvYn+sg92hAOs2rjGy
 TT90Fm7Ldf329ONjXnk964wBTftVkNL+GqqRhYEhSQrcrMDecUfFZheE444ofci0pb1V
 SkZf1kOQ209YD4ObCxfu8IeRmmhFSuX48qTM+sAdaR/1AVc7j6Gf9WSwTj2e8urP2GY3 xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3md491dgk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 18:28:16 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BBISFtW031953;
 Sun, 11 Dec 2022 18:28:15 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3md491dgjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 18:28:15 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BBGtTBj011441;
 Sun, 11 Dec 2022 18:28:14 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr68j17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 18:28:14 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BBISDeL36635258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Dec 2022 18:28:13 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDD2D5804B;
 Sun, 11 Dec 2022 18:28:13 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6CFE58068;
 Sun, 11 Dec 2022 18:28:09 +0000 (GMT)
Received: from [9.43.104.144] (unknown [9.43.104.144])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 11 Dec 2022 18:28:09 +0000 (GMT)
Message-ID: <93d6b1dd-54a9-ec82-10c5-6261ffcda91a@linux.ibm.com>
Date: Sun, 11 Dec 2022 23:58:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] target/ppc: Implement the DEXCR and HDEXCR
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br, mikey@neuling.org
References: <20221209061308.1735802-1-nicholas@linux.ibm.com>
 <20221209061308.1735802-2-nicholas@linux.ibm.com>
Content-Language: en-US
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20221209061308.1735802-2-nicholas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _6oSvWNKJ4NORVajzaqJoR4V-QbMF9ip
X-Proofpoint-GUID: kDrholIaCDiWIk56wwffnnn_wloLKe8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_10,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 malwarescore=0
 bulkscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212110169
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Dec 2022 13:58:41 -0500
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



On 12/9/22 11:43, Nicholas Miehlbradt wrote:
> Define the DEXCR and HDEXCR as special purpose registers.
> 
> Each register occupies two SPR indicies, one which can be read in an
> unprivileged state and one which can be modified in the appropriate
> priviliged state, however both indicies refer to the same underlying
> value.
> 
> Note that the ISA uses the abbreviation UDEXCR in two different
> contexts: the userspace DEXCR, the SPR index which can be read from
> userspace (implemented in this patch), and the ultravisor DEXCR, the
> equivalent register for the ultravisor state (not implemented).
> 
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> ---
> v2: Clearing of upper 32 bits of DEXCR is now performed on read from
> problem state rather than on write in privileged state.
> ---
>   target/ppc/cpu.h        | 19 +++++++++++++++++++
>   target/ppc/cpu_init.c   | 25 +++++++++++++++++++++++++
>   target/ppc/spr_common.h |  1 +
>   target/ppc/translate.c  | 19 +++++++++++++++++++
>   4 files changed, 64 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 81d4263a07..0ed9f2ae35 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1068,6 +1068,21 @@ struct ppc_radix_page_info {
>       uint32_t entries[PPC_PAGE_SIZES_MAX_SZ];
>   };
>   
> +/*****************************************************************************/
> +/* Dynamic Execution Control Register */
> +
> +#define DEXCR_ASPECT(name, num)                    \
> +FIELD(DEXCR, PNH_##name, PPC_BIT_NR(num), 1)       \
> +FIELD(DEXCR, PRO_##name, PPC_BIT_NR(num + 32), 1)  \
> +FIELD(HDEXCR, HNU_##name, PPC_BIT_NR(num), 1)      \
> +FIELD(HDEXCR, ENF_##name, PPC_BIT_NR(num + 32), 1) \
> +
> +DEXCR_ASPECT(SBHE, 0)
> +DEXCR_ASPECT(IDRTPB, 1)
                 ^^^^^^ IBRTPD ?
> +DEXCR_ASPECT(SRAPD, 4)
> +DEXCR_ASPECT(NPHIE, 5)
> +DEXCR_ASPECT(PHIE, 6)
> +
>   /*****************************************************************************/
>   /* The whole PowerPC CPU context */
>   
> @@ -1674,9 +1689,11 @@ void ppc_compat_add_property(Object *obj, const char *name,
>   #define SPR_BOOKE_GIVOR13     (0x1BC)
>   #define SPR_BOOKE_GIVOR14     (0x1BD)
>   #define SPR_TIR               (0x1BE)
> +#define SPR_UHDEXCR           (0x1C7)
>   #define SPR_PTCR              (0x1D0)
>   #define SPR_HASHKEYR          (0x1D4)
>   #define SPR_HASHPKEYR         (0x1D5)
> +#define SPR_HDEXCR            (0x1D7)
>   #define SPR_BOOKE_SPEFSCR     (0x200)
>   #define SPR_Exxx_BBEAR        (0x201)
>   #define SPR_Exxx_BBTAR        (0x202)
> @@ -1865,8 +1882,10 @@ void ppc_compat_add_property(Object *obj, const char *name,
>   #define SPR_RCPU_L2U_RA2      (0x32A)
>   #define SPR_MPC_MD_DBRAM1     (0x32A)
>   #define SPR_RCPU_L2U_RA3      (0x32B)
> +#define SPR_UDEXCR            (0x32C)
>   #define SPR_TAR               (0x32F)
>   #define SPR_ASDR              (0x330)
> +#define SPR_DEXCR             (0x33C)
>   #define SPR_IC                (0x350)
>   #define SPR_VTB               (0x351)
>   #define SPR_MMCRC             (0x353)
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index cbf0081374..6433f4fdfd 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5727,6 +5727,30 @@ static void register_power10_hash_sprs(CPUPPCState *env)
>               hashpkeyr_initial_value);
>   }
>   
> +static void register_power10_dexcr_sprs(CPUPPCState *env)
> +{
> +    spr_register(env, SPR_DEXCR, "DEXCR",
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            &spr_read_generic, &spr_write_generic,
> +            0);
> +
> +    spr_register(env, SPR_UDEXCR, "DEXCR",
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
> +            0);
> +
> +    spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            &spr_read_generic, &spr_write_generic,
> +            0);
> +
> +    spr_register(env, SPR_UHDEXCR, "HDEXCR",
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
> +            0);
> +}
> +
>   /*
>    * Initialize PMU counter overflow timers for Power8 and
>    * newer Power chips when using TCG.
> @@ -6402,6 +6426,7 @@ static void init_proc_POWER10(CPUPPCState *env)
>       register_power8_rpr_sprs(env);
>       register_power9_mmu_sprs(env);
>       register_power10_hash_sprs(env);
> +    register_power10_dexcr_sprs(env);
>   
>       /* FIXME: Filter fields properly based on privilege level */
>       spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
> diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
> index b5a5bc6895..91a74cec0f 100644
> --- a/target/ppc/spr_common.h
> +++ b/target/ppc/spr_common.h
> @@ -195,6 +195,7 @@ void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
>   void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_dexcr_ureg(DisasContext *ctx, int sprn, int gprn);

Order of sprn, gprn appears different in funcn defn below, need to 
correct at either place.

>   #endif
>   
>   void register_low_BATs(CPUPPCState *env);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 19c1d17cb0..fcb1180712 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1249,6 +1249,25 @@ void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
>       gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
>       spr_write_prev_upper32(ctx, sprn, gprn);
>   }
> +
> +void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    /*
> +     * Access to the (H)DEXCR in problem state is done using seperate
> +     * SPR indexes which are 16 below the SPR indexes which have full
> +     * access to the (H)DEXCR in privileged state. Problem state may
s/may/can ?
> +     * only read bits 32:63, bits 0:31 return 0.
> +     *
> +     * See section 9.3.1-9.3.2 of PowerISA v3.1B
> +     */
> +
> +    gen_load_spr(t0, sprn + 16);
> +    tcg_gen_ext32u_tl(cpu_gpr[gprn], t0);
> +
> +    tcg_temp_free(t0);
> +}
>   #endif
>   
>   #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \

Otherwise, looks good to me!

