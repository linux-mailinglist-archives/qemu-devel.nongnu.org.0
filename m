Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EAE553DC7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 23:28:17 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3lQ0-0005hl-0U
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 17:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o3lOW-0004rS-KD; Tue, 21 Jun 2022 17:26:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o3lOU-0006xy-AG; Tue, 21 Jun 2022 17:26:44 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LLJW9p032219;
 Tue, 21 Jun 2022 21:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ZhQ7P8JUKrwzn9gfdS7pGkFthVQuDbskkuELyCfgrQI=;
 b=kmuB26BT3ca6qdO/S0J+g0xnjikTMwdcakrcFIm5skdbOpkq/868ue7NYt2MDoaIvhsv
 u4nuiwLGEqLAArbPTH1fdJQJE+Zo+QnurXiTRNZ8IVQ86/CpN2EoJTtNyL59w67/A0jy
 vmpTD43qSFDHmvww9ePkWk1bDm4M87JHXDzRVOv6uvewZFKJDo5OyCC2thrcva5uBu9n
 8aRm4gz7TkJhKnnJcuEhvSivqZHkNu4RjYqKkgZvj45VWXimM0WDAxoKDGz6Am3h0vwt
 aZsNYgVEVYV+ArvBpaC+aN9zxxuQCfqKsF72S36eexDieGNEPOF/16lE0hvJ8WKAiTwn yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gunt8g3qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 21:26:34 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25LLKWt3007145;
 Tue, 21 Jun 2022 21:26:34 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gunt8g3q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 21:26:33 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LLKPRU026624;
 Tue, 21 Jun 2022 21:26:33 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3guk92ga45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 21:26:32 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25LLQWxj41353604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jun 2022 21:26:32 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 074FFAC05B;
 Tue, 21 Jun 2022 21:26:32 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69F77AC05F;
 Tue, 21 Jun 2022 21:26:31 +0000 (GMT)
Received: from localhost (unknown [9.160.71.76])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 21 Jun 2022 21:26:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH 3/3] target/ppc: Check page dir/table base alignment
In-Reply-To: <20220620202704.78978-4-leandro.lupori@eldorado.org.br>
References: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
 <20220620202704.78978-4-leandro.lupori@eldorado.org.br>
Date: Tue, 21 Jun 2022 18:26:29 -0300
Message-ID: <87edzhaet6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YA_FEyefTLFDDQo_sLldS0wJFFKor7LQ
X-Proofpoint-GUID: 6IjBFHf5y8thB5opnKK-SQ7YjuLDyhE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_09,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210089
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leandro Lupori <leandro.lupori@eldorado.org.br> writes:

> Check if each page dir/table base address is properly aligned and
> log a guest error if not, as real hardware behave incorrectly in
> this case.
>
> These checks are only performed when DEBUG_MMU is defined, to avoid
> hurting the performance.
>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>  target/ppc/mmu-radix64.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 2f0bcbfe2e..80d945a7c3 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -28,6 +28,8 @@
>  #include "mmu-radix64.h"
>  #include "mmu-book3s-v3.h"
>  
> +/* #define DEBUG_MMU */
> +
>  static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
>                                                   vaddr eaddr,
>                                                   uint64_t *lpid, uint64_t *pid)
> @@ -277,6 +279,16 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>      if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
>          ++*level;
>          *nls = pde & R_PDE_NLS;
> +
> +#ifdef DEBUG_MMU
> +        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
> +                " page dir size: 0x%"PRIx64" level: %d\n",
> +                __func__, (pde & R_PDE_NLB), BIT(*nls + 3), *level);
> +        }
> +#endif

Maybe use qemu_log_enabled() instead of the define? I think it is a
little more useful and has less chance to rot.

> +
>          index = eaddr >> (*psize - *nls);       /* Shift */
>          index &= ((1UL << *nls) - 1);           /* Mask */
>          *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
> @@ -297,6 +309,15 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
>          return 1;
>      }
>  
> +#ifdef DEBUG_MMU
> +    if (base_addr & MAKE_64BIT_MASK(0, nls + 3)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: misaligned page dir base: 0x%"VADDR_PRIx
> +            " page dir size: 0x%"PRIx64"\n",
> +            __func__, base_addr, BIT(nls + 3));
> +    }
> +#endif
> +
>      index = eaddr >> (*psize - nls);    /* Shift */
>      index &= ((1UL << nls) - 1);       /* Mask */
>      *pte_addr = base_addr + (index * sizeof(pde));

