Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB9561B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:40:31 +0200 (CEST)
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6uPF-0003Wi-Jb
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o6uNC-0001ZZ-ON; Thu, 30 Jun 2022 09:38:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o6uNA-0003z9-HV; Thu, 30 Jun 2022 09:38:22 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UCfu10027063;
 Thu, 30 Jun 2022 13:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=bsTV37Xb8ncH4lctJL5R/KU7BHVBFmU3ibqP4GWqW/8=;
 b=P8bP3YJGQmXT5cpDoSH5cevZ4nca0C8u3n/9uHRgVgzaQZlsiOccHjMRuzHNv5IeOSiK
 J2jbA+5FcqulO7Q3E3zR/mLyMNiGmW3fGlhZ/GF05r7EXdDCjnjZmbjmYh52JeE30IQW
 hyqKaMAVcZ4KxE+fBFvrYoAuFx8zbZdaeV2g0SqvbiwkHW6JpO3pmFhXdzbsNJW3VXO0
 M/8e0ztZITFC6m/GS4WmmUBGrxveRFDj4uJCO/CzAL3oKhJBlnPBP54tqF6N8mrUZ01z
 V7wOtokk5Slc8T9BdlNKKvonJiGTkZ7j812AO8gmxzDLjSBiBuGyWGjtgi7YdvFNAz3C WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1c2chrbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 13:38:01 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25UDKkLh026562;
 Thu, 30 Jun 2022 13:38:01 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1c2chrb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 13:38:01 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25UDaKTd029980;
 Thu, 30 Jun 2022 13:38:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3gwt0b1u89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 13:38:00 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25UDbxIC31195612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jun 2022 13:37:59 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39333AE060;
 Thu, 30 Jun 2022 13:37:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABD37AE05C;
 Thu, 30 Jun 2022 13:37:58 +0000 (GMT)
Received: from localhost (unknown [9.65.204.192])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Jun 2022 13:37:58 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v3 2/3] target/ppc: Improve Radix xlate level validation
In-Reply-To: <20220628133959.15131-3-leandro.lupori@eldorado.org.br>
References: <20220628133959.15131-1-leandro.lupori@eldorado.org.br>
 <20220628133959.15131-3-leandro.lupori@eldorado.org.br>
Date: Thu, 30 Jun 2022 10:37:57 -0300
Message-ID: <871qv6b7be.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: svAN3Ea5gY9beVvpT38YXfAgj0CnTZf9
X-Proofpoint-GUID: S6l8oRQLLXepbWiSQe8yz_qQTc5Ar8-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_09,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300054
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

> Check if the number and size of Radix levels are valid on
> POWER9/POWER10 CPUs, according to the supported Radix Tree
> Configurations described in their User Manuals.
>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/mmu-radix64.c | 49 +++++++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 11 deletions(-)
>
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 9a8a2e2875..705bff76be 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -236,17 +236,37 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
>      }
>  }
>  
> +static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
> +{
> +    /*
> +     * Check if this is a valid level, according to POWER9 and POWER10
> +     * Processor User's Manuals, sections 4.10.4.1 and 5.10.6.1, respectively:
> +     * Supported Radix Tree Configurations and Resulting Page Sizes.
> +     *
> +     * Note: these checks are specific to POWER9 and POWER10 CPUs. Any future
> +     * CPUs that supports a different Radix MMU configuration will need their
> +     * own implementation.
> +     */
> +    switch (level) {
> +    case 0:     /* Root Page Dir */
> +        return psize == 52 && nls == 13;
> +    case 1:
> +    case 2:
> +        return nls == 9;
> +    case 3:
> +        return nls == 9 || nls == 5;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix level: %d\n", level);
> +        return false;
> +    }
> +}
> +
>  static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>                                    uint64_t *pte_addr, uint64_t *nls,
>                                    int *psize, uint64_t *pte, int *fault_cause)
>  {
>      uint64_t index, pde;
>  
> -    if (*nls < 5) { /* Directory maps less than 2**5 entries */
> -        *fault_cause |= DSISR_R_BADCONFIG;
> -        return 1;
> -    }
> -
>      /* Read page <directory/table> entry from guest address space */
>      pde = ldq_phys(as, *pte_addr);
>      if (!(pde & R_PTE_VALID)) {         /* Invalid Entry */
> @@ -270,12 +290,8 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
>                                   hwaddr *raddr, int *psize, uint64_t *pte,
>                                   int *fault_cause, hwaddr *pte_addr)
>  {
> -    uint64_t index, pde, rpn , mask;
> -
> -    if (nls < 5) { /* Directory maps less than 2**5 entries */
> -        *fault_cause |= DSISR_R_BADCONFIG;
> -        return 1;
> -    }
> +    uint64_t index, pde, rpn, mask;
> +    int level = 0;
>  
>      index = eaddr >> (*psize - nls);    /* Shift */
>      index &= ((1UL << nls) - 1);       /* Mask */
> @@ -283,6 +299,11 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
>      do {
>          int ret;
>  
> +        if (!ppc_radix64_is_valid_level(level++, *psize, nls)) {
> +            *fault_cause |= DSISR_R_BADCONFIG;
> +            return 1;
> +        }
> +
>          ret = ppc_radix64_next_level(as, eaddr, pte_addr, &nls, psize, &pde,
>                                       fault_cause);
>          if (ret) {
> @@ -456,6 +477,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>          }
>      } else {
>          uint64_t rpn, mask;
> +        int level = 0;
>  
>          index = (eaddr & R_EADDR_MASK) >> (*g_page_size - nls); /* Shift */
>          index &= ((1UL << nls) - 1);                            /* Mask */
> @@ -475,6 +497,11 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>                  return ret;
>              }
>  
> +            if (!ppc_radix64_is_valid_level(level++, *g_page_size, nls)) {
> +                fault_cause |= DSISR_R_BADCONFIG;
> +                return 1;
> +            }
> +
>              ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK, &h_raddr,
>                                           &nls, g_page_size, &pte, &fault_cause);
>              if (ret) {

