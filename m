Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E05164A960
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:18:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qAA-0006pb-9e; Mon, 12 Dec 2022 16:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4qA7-0006pI-0k
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:16:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4qA5-0001Qi-6l
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:16:34 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCKhoer023425; Mon, 12 Dec 2022 21:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=JaqszjDrcsulFNpTFzlQtoF7GB6wKVGfAQfwPY4AgcM=;
 b=MzHtcLMwQ+AesE4jTEePJwiuXFdrRqWgSDKxYdXIFel8OwbC1H2HSCCDUiaiF985dy4t
 wpfcIDtLVU4pOVtHmNfdA0iQij7m3kghKGs8+g2X7gDzLGFlZRPKLaG1Pm281TbuZXm+
 qpq5gqJIF+aAv1mniDe+EXKRaEtuFjiQbyP3y4fJqbN6Rl5tZeT0AIM1Wm/4W5nTEMFK
 VfQX1rWxaolpMYDzjIttaQmDaLKxliwHb5L+3it6OXS7ZaseyhilBdcjELwKdeK6B60U
 mOvknBNZj5fGyztKgkOG+5xM7faxCX9vOQBciVtI+cCzSy/F3ALX6mRXUwty4zQ1VVNp Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mebk70nm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:16:29 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCKi6Ml024417;
 Mon, 12 Dec 2022 21:16:29 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mebk70nkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:16:29 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCDevYs007832;
 Mon, 12 Dec 2022 21:16:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mchcf37rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 21:16:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCLGPLq41091508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 21:16:25 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 315E320043;
 Mon, 12 Dec 2022 21:16:25 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE47420040;
 Mon, 12 Dec 2022 21:16:24 +0000 (GMT)
Received: from heavy (unknown [9.179.26.201])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Dec 2022 21:16:24 +0000 (GMT)
Date: Mon, 12 Dec 2022 22:16:23 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Message-ID: <20221212211623.73367qpodubiunnp@heavy>
References: <Y5bRnRaiSOUKRjdW@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5bRnRaiSOUKRjdW@p100>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x0mmkHJ8h3GS3_X0UlgczvaAAbfegtdN
X-Proofpoint-ORIG-GUID: OKuDs4si59Bl2ZrcphM9zZbzdhe-CDM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120183
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Dec 12, 2022 at 08:00:45AM +0100, Helge Deller wrote:
> Both parameters have a different value on the parisc platform, so first
> translate the target value into a host value for usage in the native
> madvise() syscall.
> 
> Those parameters are often used by security sensitive applications (e.g.
> tor browser, boringssl, ...) which expect the call to return a proper
> return code on failure, so return -EINVAL if qemu fails to forward the
> syscall to the host OS.
> 
> Tested with testcase of tor browser when running hppa-linux guest on
> x86-64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 10f5079331..c75342108c 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -901,11 +901,25 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>          return -TARGET_EINVAL;
>      }
> 
> +    /* Translate for some architectures which have different MADV_xxx values */
> +    switch (advice) {
> +    case TARGET_MADV_DONTNEED:      /* alpha */
> +        advice = MADV_DONTNEED;
> +        break;
> +    case TARGET_MADV_WIPEONFORK:    /* parisc */
> +        advice = MADV_WIPEONFORK;
> +        break;
> +    case TARGET_MADV_KEEPONFORK:    /* parisc */
> +        advice = MADV_KEEPONFORK;
> +        break;
> +    /* we do not care about the other MADV_xxx values yet */
> +    }
> +
>      /*
>       * A straight passthrough may not be safe because qemu sometimes turns
>       * private file-backed mappings into anonymous mappings.
>       *
> -     * This is a hint, so ignoring and returning success is ok.
> +     * For MADV_DONTNEED, which is a hint, ignoring and returning success is ok.

Actually, MADV_DONTNEED is one of the few values, which is not always a
hint - it can be used to e.g. zero out pages.

As the next paragraph states, strictly speaking, MADV_DONTNEED is
currently broken, because it can indeed be ignored without indication
in some cases, but it's still arguably better than not honoring it at
all.

>       *
>       * This breaks MADV_DONTNEED, completely implementing which is quite
>       * complicated. However, there is one low-hanging fruit: mappings that are
> @@ -913,11 +927,17 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>       * passthrough is safe, so do it.
>       */
>      mmap_lock();
> -    if (advice == TARGET_MADV_DONTNEED &&
> -        can_passthrough_madv_dontneed(start, end)) {
> -        ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
> -        if (ret == 0) {
> -            page_reset_target_data(start, start + len);
> +    switch (advice) {
> +    case MADV_WIPEONFORK:
> +    case MADV_KEEPONFORK:
> +        ret = -EINVAL;
> +        /* fall through */
> +    case MADV_DONTNEED:
> +        if (can_passthrough_madv_dontneed(start, end)) {
> +            ret = get_errno(madvise(g2h_untagged(start), len, advice));
> +            if ((advice == MADV_DONTNEED) && (ret == 0)) {
> +                page_reset_target_data(start, start + len);
> +            }
>          }
>      }
>      mmap_unlock();
> 

Nit: maybe rename can_passthrough_madv_dontneed() to can_passthrough(),
since now it's used not only for MADV_DONTNEED?



With the MADV_DONTNEED comment change:

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

