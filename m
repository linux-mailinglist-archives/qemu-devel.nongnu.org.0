Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4253E15F7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 15:46:12 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdhL-0001XI-97
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 09:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1mBdfs-0000iR-35; Thu, 05 Aug 2021 09:44:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1mBdfq-0007Ww-6u; Thu, 05 Aug 2021 09:44:39 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175DXCKQ063118; Thu, 5 Aug 2021 09:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=nyf1g0HzvoDiHy2VdIVwKC9TH9WpM/5vJXu5Afx+Ghw=;
 b=R0n+C+oslZAPLvtSq4vByHLNXq5ncP9Fw2A0fYthWqvJIMJOjnkmpX835m/+aNBUhTdH
 DiTS/ekw7X3REu1jI7NR0kr7weQwRte2QVMEEemevlCXf0t6H+l2+8AeVYJvSnuGaGcG
 AkS9tel9uzeOifTmfEWNFYVrNMehOPajt4NdjeXld2hywA+X1MZmKcmmJy5j17OaqreI
 WWZh14ZRcU9LK5SSDfW0DOSttfOy6Ge9KFaYnftFalXQR/HQFBDWGQgERvPthepxB/lZ
 CyPo9NbiPqmZKTcCX4XlJ8sk6WUHp+iszD3lf6Mnuz9+rnfyQTmoPotH6/LJZ3h1sXYM Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a85xx9655-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:44:33 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175DXDxp063222;
 Thu, 5 Aug 2021 09:44:33 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a85xx9649-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:44:33 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175Di1e1026288;
 Thu, 5 Aug 2021 13:44:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3a8dcqg9wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 13:44:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175DiRfZ47055310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 13:44:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B88B42049;
 Thu,  5 Aug 2021 13:44:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0678742052;
 Thu,  5 Aug 2021 13:44:27 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.14.253])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 13:44:26 +0000 (GMT)
Date: Thu, 5 Aug 2021 15:44:24 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] s390x/tcg: fix and optimize SPX (SET PREFIX)
Message-ID: <20210805154424.73586009@p-imbrenda>
In-Reply-To: <20210805125938.74034-1-david@redhat.com>
References: <20210805125938.74034-1-david@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n0AsL5D3KYnLmFj0QtxT8Zy95sx5CbTx
X-Proofpoint-ORIG-GUID: nISygaQCr5HUWctQ6dZr8WugbT4cVPaq
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_04:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050082
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 14:59:38 +0200
David Hildenbrand <david@redhat.com> wrote:

> We not only invalidate the translation of the range 0x0-0x2000, we
> also invalidate the translation of the new prefix range and the
> translation of the old prefix range -- because real2abs would return
> different results for all of these ranges when changing the prefix
> location.

looks like a good idea

> This fixes the kvm-unit-tests "edat" test that just hangs before this
> patch because we end up clearing the new prefix area instead of the
> old prefix area.
> 
> While at it, let's not do anything in case the prefix doesn't change.

also looks like a good idea

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/tcg/misc_helper.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/misc_helper.c
> b/target/s390x/tcg/misc_helper.c index 33e6999e15..aab9c47747 100644
> --- a/target/s390x/tcg/misc_helper.c
> +++ b/target/s390x/tcg/misc_helper.c
> @@ -151,13 +151,26 @@ void HELPER(diag)(CPUS390XState *env, uint32_t
> r1, uint32_t r3, uint32_t num) /* Set Prefix */
>  void HELPER(spx)(CPUS390XState *env, uint64_t a1)
>  {
> +    const uint32_t prefix = a1 & 0x7fffe000;
> +    const uint32_t old_prefix = env->psa;
>      CPUState *cs = env_cpu(env);
> -    uint32_t prefix = a1 & 0x7fffe000;
> +
> +    if (prefix == old_prefix) {
> +        return;
> +    }
>  
>      env->psa = prefix;
>      HELPER_LOG("prefix: %#x\n", prefix);
>      tlb_flush_page(cs, 0);
>      tlb_flush_page(cs, TARGET_PAGE_SIZE);
> +    if (prefix != 0) {
> +        tlb_flush_page(cs, prefix);
> +        tlb_flush_page(cs, prefix + TARGET_PAGE_SIZE);
> +    }
> +    if (old_prefix != 0) {
> +        tlb_flush_page(cs, old_prefix);
> +        tlb_flush_page(cs, old_prefix + TARGET_PAGE_SIZE);
> +    }
>  }
>  
>  static void update_ckc_timer(CPUS390XState *env)


