Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B064AA03
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:13:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4r2W-0006jE-KT; Mon, 12 Dec 2022 17:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4r2Q-0006hs-20
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:12:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p4r2N-00033P-TR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:12:41 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCLfjKO011572; Mon, 12 Dec 2022 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=uWqphpVyQS5mOvrFY4AVac8tow7EY6VqFXenNr/mXcM=;
 b=Ti+jtu2fry6rp9ME7plUo9OXPU7krNW4dqOOyuu4AA30Ddqkcp25FACTrecWsoOvy5/m
 YNZuIo6827/rk5whxcW9T8RO2ZHoz4YyVRhdtCxkAFYsfwMagiK5X0i0HXgxW54tTdpM
 uhS7vhQRuR4xF8n183agrY4+ExD/LJPkMAzzsqPcpfUFKzOY+N/hQFg3k+/LZtX+vq1A
 XVhe5OOutxmXKQnhsgxqZvc10kMmdqYmTDPFHZt+SlB0a80zamI4/L903psAWzGD9eJ1
 A2YD1dvUK5Spue3SM8GylKuzGBKJ8RO84hLC0YbigQQwBWDvuTMB1l/yqQjL+N/w9c6+ Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecem8rdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:12:37 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCLx4oI011844;
 Mon, 12 Dec 2022 22:12:36 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecem8rce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:12:36 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCAWUU3018163;
 Mon, 12 Dec 2022 22:12:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3mchr62bge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:12:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCMCVvZ34931024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 22:12:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A556B2006E;
 Mon, 12 Dec 2022 22:12:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FA4C2005A;
 Mon, 12 Dec 2022 22:12:31 +0000 (GMT)
Received: from heavy (unknown [9.179.26.201])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Dec 2022 22:12:31 +0000 (GMT)
Date: Mon, 12 Dec 2022 23:12:29 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Message-ID: <20221212221229.pj5ax45mjkjng5bu@heavy>
References: <Y5bRnRaiSOUKRjdW@p100> <20221212211623.73367qpodubiunnp@heavy>
 <ab950366-4248-f0ee-c61d-2785d7df4ebd@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab950366-4248-f0ee-c61d-2785d7df4ebd@gmx.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x0h_nfl0truYQtcJYC-w6xxSN5spSvQv
X-Proofpoint-GUID: -USwWZ-aN-ELt9XNJ2tQWGNZTu8MjrCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120189
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Mon, Dec 12, 2022 at 10:49:24PM +0100, Helge Deller wrote:
> On 12/12/22 22:16, Ilya Leoshkevich wrote:
> > On Mon, Dec 12, 2022 at 08:00:45AM +0100, Helge Deller wrote:
> > > Both parameters have a different value on the parisc platform, so first
> > > translate the target value into a host value for usage in the native
> > > madvise() syscall.
> > > 
> > > Those parameters are often used by security sensitive applications (e.g.
> > > tor browser, boringssl, ...) which expect the call to return a proper
> > > return code on failure, so return -EINVAL if qemu fails to forward the
> > > syscall to the host OS.
> > > 
> > > Tested with testcase of tor browser when running hppa-linux guest on
> > > x86-64 host.
> > > 
> > > Signed-off-by: Helge Deller <deller@gmx.de>
> > > 
> > > diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> > > index 10f5079331..c75342108c 100644
> > > --- a/linux-user/mmap.c
> > > +++ b/linux-user/mmap.c
> > > @@ -901,11 +901,25 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
> > >           return -TARGET_EINVAL;
> > >       }
> > > 
> > > +    /* Translate for some architectures which have different MADV_xxx values */
> > > +    switch (advice) {
> > > +    case TARGET_MADV_DONTNEED:      /* alpha */
> > > +        advice = MADV_DONTNEED;
> > > +        break;
> > > +    case TARGET_MADV_WIPEONFORK:    /* parisc */
> > > +        advice = MADV_WIPEONFORK;
> > > +        break;
> > > +    case TARGET_MADV_KEEPONFORK:    /* parisc */
> > > +        advice = MADV_KEEPONFORK;
> > > +        break;
> > > +    /* we do not care about the other MADV_xxx values yet */
> > > +    }
> > > +
> > >       /*
> > >        * A straight passthrough may not be safe because qemu sometimes turns
> > >        * private file-backed mappings into anonymous mappings.
> > >        *
> > > -     * This is a hint, so ignoring and returning success is ok.
> > > +     * For MADV_DONTNEED, which is a hint, ignoring and returning success is ok.
> > 
> > Actually, MADV_DONTNEED is one of the few values, which is not always a
> > hint - it can be used to e.g. zero out pages.
> 
> Right, it _should_ zero out pages and return 0, or otherwise return failure.
> I think the problem is that some userspace apps will then sadly break if we
> change the current behaviour....
> 
> Anyway, in this patch I didn't wanted to touch MAD_DONTNEED.
> 
> > As the next paragraph states, strictly speaking, MADV_DONTNEED is
> > currently broken, because it can indeed be ignored without indication
> > in some cases, but it's still arguably better than not honoring it at
> > all.
> 
> Yep.
> 
> > >        *
> > >        * This breaks MADV_DONTNEED, completely implementing which is quite
> > >        * complicated. However, there is one low-hanging fruit: mappings that are
> > > @@ -913,11 +927,17 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
> > >        * passthrough is safe, so do it.
> > >        */
> > >       mmap_lock();
> > > -    if (advice == TARGET_MADV_DONTNEED &&
> > > -        can_passthrough_madv_dontneed(start, end)) {
> > > -        ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
> > > -        if (ret == 0) {
> > > -            page_reset_target_data(start, start + len);
> > > +    switch (advice) {
> > > +    case MADV_WIPEONFORK:
> > > +    case MADV_KEEPONFORK:
> > > +        ret = -EINVAL;
> > > +        /* fall through */
> > > +    case MADV_DONTNEED:
> > > +        if (can_passthrough_madv_dontneed(start, end)) {
> > > +            ret = get_errno(madvise(g2h_untagged(start), len, advice));
> > > +            if ((advice == MADV_DONTNEED) && (ret == 0)) {
> > > +                page_reset_target_data(start, start + len);
> > > +            }
> > >           }
> > >       }
> > >       mmap_unlock();
> > > 
> > 
> > Nit: maybe rename can_passthrough_madv_dontneed() to can_passthrough(),
> > since now it's used not only for MADV_DONTNEED?
> 
> Maybe can_passthrough_madvise() is better?

Sounds good to me as well. The idea with PAGE_PASSTHROUGH was that we
should be able to passthrough anything; but with this patch we still
use it only for madvise(), and indicating it in the name makes sense.

> > > With the MADV_DONTNEED comment change:
> 
> Just for me to understand correctly:
> You propose that I shouldn't touch that comment in my followup-patch, right?
> That's ok.

Either that, or maybe make it more precise - strictly speaking, it's
not correct at the moment anyway. Maybe something like this?

    Most advice values are hints, so ignoring and returning success is
    ok.

    However, this would break MADV_DONTNEED, MADV_WIPEONFORK and
    MADV_KEEPONFORK ...

> > Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> Thanks!
> Helge

