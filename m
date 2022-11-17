Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C6862DE04
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:25:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfoc-0007VU-97; Thu, 17 Nov 2022 09:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kowsjois@linux.vnet.ibm.com>)
 id 1ovZQG-0008DT-JB; Thu, 17 Nov 2022 02:34:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kowsjois@linux.vnet.ibm.com>)
 id 1ovZQE-00079q-NX; Thu, 17 Nov 2022 02:34:56 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AH7RZBF008886; Thu, 17 Nov 2022 07:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A2lLtzHUXYq/3UhrHLLI7Tol54hG8Mv+3jy93CXxVJ4=;
 b=nzU2g1r8Op5tqxPghsPopy2qlW9wxo/MI8s4R7LoI8l1pKl8yJJD6/UD+6YRIXNkc0G6
 LRpbpIfrLq2/pwiVNw86AG7mHJSE3NmiiBbOgaTP+/93gtFrWngHotWUXYkpPZj/jPEc
 Qx4y2ssMIxueUeVAM7h6Vxn4YZPiIT+MEr782sgMFygnOnz/hkwd5ijDoUPfzuZA5/fn
 CJqGse5D/ZiWPBYzzAZ/F4lh4M50cqljrJ7TLVSUGJkelL1TAtRPYPpRohBqWwt1ZrP7
 e+GvQhpSRkI5OSk2gpH8tfGOwGhXLeMAtAInHXDotUgqD/QsLwC27MlvFIliiC9vsg+S nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwgk188jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 07:34:44 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AH7SBGX011062;
 Thu, 17 Nov 2022 07:34:44 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwgk188gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 07:34:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AH7K0WR014594;
 Thu, 17 Nov 2022 07:34:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3kt3495cct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 07:34:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AH7Ydrm5898752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Nov 2022 07:34:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72C35A4054;
 Thu, 17 Nov 2022 07:34:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1781FA405B;
 Thu, 17 Nov 2022 07:34:37 +0000 (GMT)
Received: from [9.43.10.198] (unknown [9.43.10.198])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Nov 2022 07:34:36 +0000 (GMT)
Message-ID: <10a0ee1c-cf89-1fb1-24c2-622f51e6dfe3@linux.vnet.ibm.com>
Date: Thu, 17 Nov 2022 13:04:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: david@gibson.dropbear.id.au, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
From: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
In-Reply-To: <20221116131743.658708-1-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8t3pktZq1nIiztDINr5CqkAWR6i7YK4S
X-Proofpoint-ORIG-GUID: eealgyq4_3YHGRNY_EOocLAaMpVztnqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170056
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=kowsjois@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Nov 2022 09:24:27 -0500
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

Hello Vaibhav,

Thanks for the quick resolution. I have applied and tested the patch. 
Everything is smooth. Thank you.

Regards,
Kowshik Jois

On 16/11/22 18:47, Vaibhav Jain wrote:
> Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
> target is failing due to following build warnings:
>
> <snip>
>   ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
>   7018 | static void ppc_restore_state_to_opc(CPUState *cs,
> <snip>
>
> Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
> they are only defined if qemu is compiled with '--enable-tcg'
>
> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   target/ppc/cpu_init.c    | 2 ++
>   target/ppc/excp_helper.c | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 32e94153d1..cbf0081374 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
>       return cpu->env.nip;
>   }
>   
> +#ifdef CONFIG_TCG
>   static void ppc_restore_state_to_opc(CPUState *cs,
>                                        const TranslationBlock *tb,
>                                        const uint64_t *data)
> @@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
>   
>       cpu->env.nip = data[0];
>   }
> +#endif /* CONFIG_TCG */
>   
>   static bool ppc_cpu_has_work(CPUState *cs)
>   {
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a05a2ed595..94adcb766b 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
>   #endif
>   #endif
>   
> +#ifdef CONFIG_TCG
>   static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
>   {
>       const uint16_t c = 0xfffc;
> @@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
>   HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
>   HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>   HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> +#endif /* CONFIG_TCG */
>   
>   #if !defined(CONFIG_USER_ONLY)
>   



