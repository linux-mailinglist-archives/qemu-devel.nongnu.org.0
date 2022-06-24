Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E575A55A0F1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 20:51:33 +0200 (CEST)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4oOy-0000Dx-PR
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 14:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4oM3-0007Dg-5N; Fri, 24 Jun 2022 14:48:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4oLm-0004jT-CP; Fri, 24 Jun 2022 14:48:29 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OIiOrt012396;
 Fri, 24 Jun 2022 18:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dqTGwKULmcUSv9KD7G9UftZaTX7o2cm++1q2O2jpFCg=;
 b=nKzv2ILBV6gdrkGa4MWC9LrbbhZN+edMZWG0rIQAZ+d6b/i571J/V8eZfZb+DghYzN2W
 EYM7mx1rIZPlRklMTaD59dPDM/3M5x7FJBnNXcXPIiQfCjpWwbGm1OwKy7vwKO8M/u/G
 4riI+2yWcKLQVpmcHkD5HkydaBtRG3Gs3W3uVnFv1RYs/2iKzKHVpF+zyyf5x6t0loP9
 V61ms+fFcdEOKssgJ20LJ3kWMdqB3XELjXxsJNgRwzpZ/P9icQZQgu1TqBNkQ6pAygqG
 3/q7mhh+v/DPAglZ8ZKmSbDOOeJuBcgU0jFPXY+KdGRF/2xWELb3CJy6Zvm3DbVPU9E6 Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwjs70604-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:48:03 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25OIj00g015389;
 Fri, 24 Jun 2022 18:48:03 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwjs705ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:48:03 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OIZlaK027684;
 Fri, 24 Jun 2022 18:48:02 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3gs6bamk3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 18:48:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25OIm1kd8127328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jun 2022 18:48:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7565DAC062;
 Fri, 24 Jun 2022 18:48:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2125AC065;
 Fri, 24 Jun 2022 18:48:00 +0000 (GMT)
Received: from localhost (unknown [9.160.103.235])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jun 2022 18:48:00 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v2 3/3] target/ppc: Check page dir/table base alignment
In-Reply-To: <20220624171653.143740-4-leandro.lupori@eldorado.org.br>
References: <20220624171653.143740-1-leandro.lupori@eldorado.org.br>
 <20220624171653.143740-4-leandro.lupori@eldorado.org.br>
Date: Fri, 24 Jun 2022 15:47:59 -0300
Message-ID: <877d55c2zk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HuOqnVkbO-j_npQnbf2TSpk3bWW5Ljft
X-Proofpoint-ORIG-GUID: l4wMUQNC_l8SA5MNWh65VMJg8FA1h9W3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_08,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240072
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

I think the commit message could be clearer, something like:

According to PowerISA 3.1B, Book III 6.7.6 programming note, the page
directory base addresses are expected to be aligned to their size. Real
hardware seems to rely on that and will access the wrong address if they
are misaligned. This results in a translation failure even if the page
tables seem to be properly populated.

Let's make sure we capture this assumption in the code to help anyone
implementing page tables.

>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>  target/ppc/mmu-radix64.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 339cf5b4d8..1e7d932893 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -280,6 +280,14 @@ static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
>      *psize -= *nls;
>      if (!(pde & R_PTE_LEAF)) { /* Prepare for next iteration */
>          *nls = pde & R_PDE_NLS;
> +
> +        if ((pde & R_PDE_NLB) & MAKE_64BIT_MASK(0, *nls + 3)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: misaligned page dir/table base: 0x%"VADDR_PRIx
> +                " page dir size: 0x"TARGET_FMT_lx"\n",
> +                __func__, (pde & R_PDE_NLB), BIT(*nls + 3));
> +        }
> +
>          index = eaddr >> (*psize - *nls);       /* Shift */
>          index &= ((1UL << *nls) - 1);           /* Mask */
>          *pte_addr = (pde & R_PDE_NLB) + (index * sizeof(pde));
> @@ -295,6 +303,13 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
>      uint64_t index, pde, rpn, mask;
>      int level = 0;
>  
> +    if (base_addr & MAKE_64BIT_MASK(0, nls + 3)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: misaligned page dir base: 0x%"VADDR_PRIx
> +            " page dir size: 0x"TARGET_FMT_lx"\n",
> +            __func__, base_addr, BIT(nls + 3));
> +    }
> +
>      index = eaddr >> (*psize - nls);    /* Shift */
>      index &= ((1UL << nls) - 1);       /* Mask */
>      *pte_addr = base_addr + (index * sizeof(pde));

