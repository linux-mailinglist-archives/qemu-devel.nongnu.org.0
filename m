Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E291B702BBE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:44:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWch-00069J-5Q; Mon, 15 May 2023 07:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyWcJ-00061J-Sm; Mon, 15 May 2023 07:43:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pyWcD-00074L-84; Mon, 15 May 2023 07:43:48 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FBbnuh020131; Mon, 15 May 2023 11:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Fj1ed70QGdgXjsJEPllBIqCLTiw37oj0g4JpxuS/6P8=;
 b=gO+4XlHjfjlu3LetbD3+JpH0frRrfhRVjNObPbPcR6bBKoetv9e2/UJY8yw8oBUqR21D
 hDE44mi0gvjL17TVPaWBMi2tq4SmDNyarcNR3h2qlZSS/fX6PBRvchvkbqBGZwImSa+h
 e1/bATYAHfVhoVTE3QExHdUHstIRGohV/duaT+MGDxRDEEcb/MFZ2cHg0R6EDI0ukGYi
 KG1FX/hFKnZbF3xH/4aBM9Icd2mT27uOmkRxfFycDfzD8E4cV7gWcqmMJ3/QPMu4TuuX
 Fx8WfSIoiT8Q6jhBIzacPB74NX26ElEBEfv5w+AZczPyuEXrUwBJtZwhgTYvPcHtvvJg 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkk9r1r26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 11:43:42 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FBcKvi024148;
 Mon, 15 May 2023 11:43:41 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkk9r1r1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 11:43:41 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34FA21lX025392;
 Mon, 15 May 2023 11:43:40 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3qj265nk28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 11:43:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34FBhdr032899588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 May 2023 11:43:39 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F25758059;
 Mon, 15 May 2023 11:43:39 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17E1B5805E;
 Mon, 15 May 2023 11:43:37 +0000 (GMT)
Received: from [9.43.90.211] (unknown [9.43.90.211])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 15 May 2023 11:43:36 +0000 (GMT)
Message-ID: <72171286-c875-3ca2-5866-68d10e08f72f@linux.ibm.com>
Date: Mon, 15 May 2023 17:13:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/9] target/ppc: Fix width of some 32-bit SPRs
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
 <20230515092655.171206-2-npiggin@gmail.com>
 <c345f589-7fac-8624-06d4-ead03a2ba005@linux.ibm.com>
 <CSMT3E487TJC.ZC33PI8GH2DK@wheely>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSMT3E487TJC.ZC33PI8GH2DK@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z1-po7ucLbqOXWc7s2Dk5MRfNQ6JR1gz
X-Proofpoint-ORIG-GUID: _dPKFer7G4ZJmS4tVh4mi52hG7xMNTjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=879 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150100
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
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



On 5/15/23 16:44, Nicholas Piggin wrote:
> On Mon May 15, 2023 at 8:14 PM AEST, Harsh Prateek Bora wrote:
>>
>>
>> On 5/15/23 14:56, Nicholas Piggin wrote:
>>> Some 32-bit SPRs are incorrectly implemented as 64-bits on 64-bit
>>> targets.
>>>
>>> This changes VRSAVE, DSISR, HDSISR, DAWRX0, PIDR, LPIDR, DEXCR,
>>> HDEXCR, CTRL, TSCR, MMCRH, and PMC[1-6] from to be 32-bit registers.
>>>
>>> This only goes by the 32/64 classification in the architecture, it
>>> does not try to implement finer details of SPR implementation (e.g.,
>>> not all bits implemented as simple read/write storage).
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>> Since v2: no change.
>>>
>>>    target/ppc/cpu_init.c    | 18 +++++++++---------
>>>    target/ppc/helper_regs.c |  2 +-
>>>    target/ppc/misc_helper.c |  4 ++--
>>>    target/ppc/power8-pmu.c  |  2 +-
>>>    target/ppc/translate.c   |  2 +-
>>>    5 files changed, 14 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index 0ce2e3c91d..5aa0b3f0f1 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -5085,8 +5085,8 @@ static void register_book3s_altivec_sprs(CPUPPCState *env)
>>>        }
>>>    
>>>        spr_register_kvm(env, SPR_VRSAVE, "VRSAVE",
>>> -                     &spr_read_generic, &spr_write_generic,
>>> -                     &spr_read_generic, &spr_write_generic,
>>> +                     &spr_read_generic, &spr_write_generic32,
>>> +                     &spr_read_generic, &spr_write_generic32,
>>>                         KVM_REG_PPC_VRSAVE, 0x00000000);
>>>    
>>>    }
>>
>> This change broke linux-user build, could you please check once?
> 
> Sorry I did notice you reported that already, must have lost it
> along the way somewhere. This incremental patch should work?
> 
> Thanks,
> Nick
> 
> ---
> diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
> index 8437eb0340..4c0f2bed77 100644
> --- a/target/ppc/spr_common.h
> +++ b/target/ppc/spr_common.h
> @@ -81,6 +81,7 @@ void _spr_register(CPUPPCState *env, int num, const char *name,
>   void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
>   void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
>   void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
> @@ -109,7 +110,6 @@ void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn);
>   
>   #ifndef CONFIG_USER_ONLY
> -void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_clear(DisasContext *ctx, int sprn, int gprn);
>   void spr_access_nop(DisasContext *ctx, int sprn, int gprn);
>   void spr_read_decr(DisasContext *ctx, int gprn, int sprn);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index c03a6bdc9a..f5cf1457db 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -411,6 +411,18 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>       spr_store_dump_spr(sprn);
>   }
>   
> +void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
> +{
> +#ifdef TARGET_PPC64
> +    TCGv t0 = tcg_temp_new();
> +    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
> +    gen_store_spr(sprn, t0);
> +    spr_store_dump_spr(sprn);
> +#else
> +    spr_write_generic(ctx, sprn, gprn);
> +#endif
> +}
> +
>   void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
>   {
>       spr_write_generic32(ctx, sprn, gprn);
> @@ -424,18 +436,6 @@ void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
>   }
>   
>   #if !defined(CONFIG_USER_ONLY)
> -void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
> -{
> -#ifdef TARGET_PPC64
> -    TCGv t0 = tcg_temp_new();
> -    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
> -    gen_store_spr(sprn, t0);
> -    spr_store_dump_spr(sprn);
> -#else
> -    spr_write_generic(ctx, sprn, gprn);
> -#endif
> -}
> -
>   void spr_write_clear(DisasContext *ctx, int sprn, int gprn)
>   {
>       TCGv t0 = tcg_temp_new();

thanks, this resolves the build break, please squash it in.

Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>

