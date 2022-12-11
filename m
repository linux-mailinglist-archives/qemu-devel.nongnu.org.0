Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C04C64961A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Scz-0003Gq-LM; Sun, 11 Dec 2022 15:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p4RBy-0004sg-Py; Sun, 11 Dec 2022 13:36:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p4RBx-0007wI-14; Sun, 11 Dec 2022 13:36:50 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BBCruPL016499; Sun, 11 Dec 2022 18:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4trpM/9COp5yBhbRywKHfJBj6FCwuDLs38G3KXf5Ff4=;
 b=Vdp9a/Yw83AgeRosCcFDi6kWhNrhtxfsK0aAWyv1eK5lKZ88NO4tPpJh1qm10W1Sb+dS
 xLaNRzWtobs6a1eaP41zOjG6si7fr6N2luwc0j478HI98OEPkpFddLyiILVvmQUlEX6Z
 PELG9MXtGGP0KJEJjrJ2AxMVWa6lOeRz4aMhgLVRhOCBgMK10RIexdnBBZP8d/Z8MXbH
 IOnOkaF8wlWTGNdJv2lHCYzwD7HZipqf2MY/vQtariGJXlSEz94vOM+jvrdAYAt2IWG/
 782ZTgA51aUX1LWt2nCvDuMsuKcjl3zmtn23y5ejj3wmZEjESOSr2MZecaY538FF0Jjp 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3jh6gn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 18:36:31 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BBIUdCN002037;
 Sun, 11 Dec 2022 18:36:30 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3jh6gn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 18:36:30 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BBGtTCn011429;
 Sun, 11 Dec 2022 18:36:29 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr68jx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 18:36:29 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BBIaScS6291984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Dec 2022 18:36:28 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE71E5804B;
 Sun, 11 Dec 2022 18:36:27 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 998C258055;
 Sun, 11 Dec 2022 18:36:21 +0000 (GMT)
Received: from [9.43.104.144] (unknown [9.43.104.144])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 11 Dec 2022 18:36:21 +0000 (GMT)
Message-ID: <1f5179fd-9bee-c62c-e15c-8633a5b021aa@linux.ibm.com>
Date: Mon, 12 Dec 2022 00:06:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] target/ppc: Check DEXCR on hash{st, chk}
 instructions
Content-Language: en-US
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br, mikey@neuling.org
References: <20221209061308.1735802-1-nicholas@linux.ibm.com>
 <20221209061308.1735802-3-nicholas@linux.ibm.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20221209061308.1735802-3-nicholas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: md8Vm8FGyZdPydheLNdhlkjCf5IoVx9k
X-Proofpoint-GUID: bMDvpJGrRenjbI5J2o6pb2x22mORGHrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_10,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=972 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212110174
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Dec 2022 15:08:46 -0500
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
> Adds checks to the hashst and hashchk instructions to only execute if
> enabled by the relevant aspect in the DEXCR and HDEXCR.
> 
> This behaviour is guarded behind TARGET_PPC64 since Power10 is
> currently the only implementation which has the DEXCR.
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> ---
>   target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
>   1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 94adcb766b..add4d54ae7 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2902,29 +2902,57 @@ static uint64_t hash_digest(uint64_t ra, uint64_t rb, uint64_t key)
>       return stage1_h ^ stage1_l;
>   }
>   
> +static void do_hash(CPUPPCState *env, target_ulong ea, target_ulong ra,
> +                    target_ulong rb, uint64_t key, bool store)
> +{
> +    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;
> +
> +    if (store) {
> +        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());
> +    } else {
> +        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());
> +        if (loaded_hash != calculated_hash) {
> +            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                POWERPC_EXCP_TRAP, GETPC());
> +        }
> +    }
> +}
> +
>   #include "qemu/guest-random.h"
>   
> -#define HELPER_HASH(op, key, store)                                           \
> +#ifdef TARGET_PPC64
> +#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
>   void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
>                    target_ulong rb)                                             \
>   {  

Conditional compilation could be contained within function, so that 
duplicate lines of code in each macro block could be avoided and would 
look simpler.
 
    \
> -    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;         \
> -                                                                              \
> -    if (store) {                                                              \
> -        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());                   \
> -    } else {                                                                  \
> -        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());                      \
> -        if (loaded_hash != calculated_hash) {                                 \
> -            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,                 \
> -                POWERPC_EXCP_TRAP, GETPC());                                  \
> -        }                                                                     \
> +    if (env->msr & R_MSR_PR_MASK) {                                           \
> +        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PRO_##dexcr_aspect##_MASK ||      \
> +            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
> +            return;                                                           \
> +    } else if (!(env->msr & R_MSR_HV_MASK)) {                                 \
> +        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PNH_##dexcr_aspect##_MASK ||      \
> +            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
> +            return;                                                           \
> +    } else if (!(env->msr & R_MSR_S_MASK)) {                                  \
> +        if (!(env->spr[SPR_HDEXCR] & R_HDEXCR_HNU_##dexcr_aspect##_MASK))     \
> +            return;                                                           \
>       }                                                                         \
> +                                                                              \
> +    do_hash(env, ea, ra, rb, key, store);                                     \
> +}
> +#else
> +#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
> +void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
> +                 target_ulong rb)                                             \
> +{                                                                             \
> +    do_hash(env, ea, ra, rb, key, store);                                     \
>   }
> +#endif /* TARGET_PPC64 */
>   
> -HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
> -HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
> -HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
> -HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> +HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true, NPHIE)
> +HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false, NPHIE)
> +HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true, PHIE)
> +HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false, PHIE)
>   #endif /* CONFIG_TCG */
>   
>   #if !defined(CONFIG_USER_ONLY)

Otherwise, looks good to me!

regards,
Harsh Prateek Bora

