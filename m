Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953CD55A0E4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 20:42:46 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4oGT-0003Oe-5M
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 14:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4o9J-0008Mk-Jw; Fri, 24 Jun 2022 14:35:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60644
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4o9A-0002cA-Cl; Fri, 24 Jun 2022 14:35:20 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OIDZuD002000;
 Fri, 24 Jun 2022 18:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dfeXxhx4YMJsYSMb50P1HBVLNelLNFDEQbaBUX27W+w=;
 b=ZUXjxQdkT91xt1rjixJ4TkFvy9L87+hgc9FfWeBSZd/Y3nLhCrAKPqC/Av19H6yYPfiX
 //6HGu5vv5huzmpc29PFGYWcbk9GI7o33CBB9NHcvCct64WK4E4TwZ393N1RmdzOynXn
 +Aixszc5Z2412f0g2jXiho7OzE/Pt3SJ7nVFTv+K7q9xVB2QxHCIsha53/6XZIyPN8Oy
 zAUph1a/Ee6urGfw7IM5zFSRTfj9g9LENDjZz8fcWpSN+0mSoOK5cejTR0QJy7ztZT5m
 PI7fDinSBLj24akP8JdjEg+qTruR33u6win+ViPFIRxm2n20E4nw4q7YXxumXGxOP1hA Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwjbvrg1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:34:48 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25OIUd0u010615;
 Fri, 24 Jun 2022 18:34:47 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwjbvrg1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:34:47 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OIKedA025605;
 Fri, 24 Jun 2022 18:34:47 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 3gvxpkxe3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:34:47 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25OIYk8b31719860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jun 2022 18:34:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52D5DBE051;
 Fri, 24 Jun 2022 18:34:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB73EBE04F;
 Fri, 24 Jun 2022 18:34:45 +0000 (GMT)
Received: from localhost (unknown [9.160.103.235])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jun 2022 18:34:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v2 2/3] target/ppc: Improve Radix xlate level validation
In-Reply-To: <20220624171653.143740-3-leandro.lupori@eldorado.org.br>
References: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
 <20220624171653.143740-3-leandro.lupori@eldorado.org.br>
Date: Fri, 24 Jun 2022 15:34:43 -0300
Message-ID: <87czexc3lo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 87hD8VgFRKHdoIgJS38BeFdoabdmZKCH
X-Proofpoint-GUID: -r80ApQ32qdUkHFpSg_WkfVzYBYztaZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_08,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
> ---
>  target/ppc/mmu-radix64.c | 51 +++++++++++++++++++++++++++++++---------
>  1 file changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 9a8a2e2875..339cf5b4d8 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -236,17 +236,39 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
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
> +     * NOTE: these checks are valid for POWER9 and POWER10 CPUs only. If
> +     *       new CPUs that support other Radix configurations are added
> +     *       (e.g., Microwatt), then a new method should be added to
> +     *       PowerPCCPUClass, with this function being the POWER9/POWER10
> +     *       implementation.
> +     */

Sorry, this got too specific now. I could not respond in time before you
sent the v2. Let's cut the mentions to the code:

  Note: these checks are specific to POWER9 and POWER10 CPUs. Any future
  CPUs that supports a different Radix MMU configuration will need their
  own implementation.

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
> @@ -270,12 +292,8 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
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
> @@ -283,6 +301,11 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
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
> @@ -456,6 +479,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
>          }
>      } else {
>          uint64_t rpn, mask;
> +        int level = 0;
>  
>          index = (eaddr & R_EADDR_MASK) >> (*g_page_size - nls); /* Shift */
>          index &= ((1UL << nls) - 1);                            /* Mask */
> @@ -475,6 +499,11 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
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

