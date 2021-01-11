Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DF82F0BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 05:31:58 +0100 (CET)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyos1-0002fv-T3
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 23:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyoqw-0002FM-AR
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:30:50 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:47298 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyoqu-0005dx-DU
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 23:30:49 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C4BC9412E5;
 Mon, 11 Jan 2021 04:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610339443;
 x=1612153844; bh=Onc4VN+LHYw9JdoXzcE4UMf/ivWwwQUeN2jN13QmIJ8=; b=
 EQ/m0289SIDPOzxiKnUOHxRBuOF38pvlvXBqG6edolSQv7IFs985JD6JaPylUtLd
 FvgjUf8yiiykNZkacs4YowdyuCqs96CRrD5yigEBptFIahCOgPSNIRg2qIqw4YGe
 8rd3kTMea9/zd5cqYMfHL1B+Q3xivL2dcbDG8wJ4eb4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgIrYV4V_Tat; Mon, 11 Jan 2021 07:30:43 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1C5004127E;
 Mon, 11 Jan 2021 07:30:43 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 11
 Jan 2021 07:30:42 +0300
Date: Mon, 11 Jan 2021 07:31:08 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] hvf: guard xgetbv call.
Message-ID: <X/vUjHCd81PvEflw@SPB-NB-133.local>
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
 <X/lDozXFWfR4AZAU@SPB-NB-133.local>
 <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
 <X/pccrqIQ9/N57j6@SPB-NB-133.local>
 <8da22f7f-7379-cffe-5fdd-94fd5ddece32@linaro.org>
 <4a24ae1a-8114-a840-b6bf-ae3a301f6232@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4a24ae1a-8114-a840-b6bf-ae3a301f6232@linaro.org>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 John Arbuckle <programmingkidx@gmail.com>, Hill Ma <maahiuzeon@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 10, 2021 at 08:38:36AM -1000, Richard Henderson wrote:
> On 1/10/21 8:34 AM, Richard Henderson wrote:
> > On 1/9/21 3:46 PM, Roman Bolshakov wrote:
> >> +static int xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
> >>  {
> >> -    uint32_t eax, edx;
> >> +    uint32_t xcrl, xcrh;
> >>
> >> -    __asm__ volatile ("xgetbv"
> >> -                      : "=a" (eax), "=d" (edx)
> >> -                      : "c" (xcr));
> >> +    if (cpuid_ecx && CPUID_EXT_OSXSAVE) {
> >> +        /* The xgetbv instruction is not available to older versions of
> >> +         * the assembler, so we encode the instruction manually.
> >> +         */
> >> +        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));
> >>
> >> -    return (((uint64_t)edx) << 32) | eax;
> >> +        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
> >> +        return 0;
> >> +    }
> >> +
> >> +    return 1;
> >>  }
> > 
> > Not to bikeshed too much, but this looks like it should return bool, and true
> > on success, not the other way around.
> 

I agree, it'd better to comprehend (and Hill has already sent v2 with
this).

> Also, if we're going to put this some place common, forcing the caller to do
> the cpuid that feeds this, then we should probably make all of the startup
> cpuid stuff common as well.
> 

I proposed the version because all callers of xgetbv instruction already
call cpuid before invoking inline xgetbv.

> Note that we'd probably have to use constructor priorities to get that right
> for util/bufferiszero.c.
> 

Please correct me if I read this wrong. What you're saying is we should
initialize cpuid in constructors and then use cached cpuid ecx in
xgetbv() (and drop one argument, respectively)?

Thanks,
Roman

