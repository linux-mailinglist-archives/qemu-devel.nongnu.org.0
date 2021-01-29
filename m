Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BF308EBF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:52:23 +0100 (CET)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5akg-00066E-6z
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5aj8-0005Or-QG
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:50:46 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:48164 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5aj6-0001De-PJ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:50:46 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4924E412E8;
 Fri, 29 Jan 2021 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1611953439;
 x=1613767840; bh=DzGuInXHDLqiaP4Xwy0UI9Q8FrNbUH4oqgubYWP8IMY=; b=
 AH+f9VNAi0hw8IWUzlUmhtKY60vx+ag5Y/g75vVAsQf528ckZbYHbnBZKrfg1nQU
 QkZ52sU8pcoSI80/TMwoAbyZT+Fh7vdDbntN2wL4JALxeHt7/rKUGB47ECWPCNiJ
 V+j3YJ/jbRdES+SAnoCeyj2GIT86VdTsV6N3Y88OevA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3JWB1nEGK_R; Fri, 29 Jan 2021 23:50:39 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0263541254;
 Fri, 29 Jan 2021 23:50:35 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 29
 Jan 2021 23:50:35 +0300
Date: Fri, 29 Jan 2021 23:50:34 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3] tcg: Fix execution on Apple Silicon
Message-ID: <YBR1GgEg+WLIo9/M@SPB-NB-133.local>
References: <20210113032806.18220-1-r.bolshakov@yadro.com>
 <e0b70beb-2905-9520-e825-219278fe4ed7@linaro.org>
 <330c4b1a-6a8a-3625-8c39-7f9c88b20847@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <330c4b1a-6a8a-3625-8c39-7f9c88b20847@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 10:18:58AM -1000, Richard Henderson wrote:
> On 1/21/21 8:34 AM, Richard Henderson wrote:
> > On 1/12/21 5:28 PM, Roman Bolshakov wrote:
> >> @@ -1083,6 +1083,12 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
> >>  {
> >>      void *buf;
> >>  
> >> +#if defined(MAC_OS_VERSION_11_0) && \
> >> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
> >> +    if (__builtin_available(macOS 11.0, *)) {
> >> +        flags |= MAP_JIT;
> >> +    }
> >> +#endif
> > 
> > This hunk should be in alloc_code_gen_buffer, where we do the other flags
> > manipulation.
> > 
> > I'll drop this hunk and apply the rest, which is exclusively related to
> > toggling the jit bit.
> 
> Ping on this?
> 
Hi Richard,

> I would imagine that the patch would look something like
> 
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1296,6 +1296,11 @@ static bool alloc_code_gen_buffer
>  #ifdef CONFIG_TCG_INTERPRETER
>      /* The tcg interpreter does not need execute permission. */
>      prot = PROT_READ | PROT_WRITE;
> +#elif defined(MAC_OS_VERSION_11_0) && \
> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
> +    if (__builtin_available(macOS 11.0, *)) {
> +        flags |= MAP_JIT;
> +    }
>  #elif defined(CONFIG_DARWIN)
>      /* Applicable to both iOS and macOS (Apple Silicon). */
>      if (!splitwx) {
> 
> But I don't know how CONFIG_DARWIN, iOS, and MAC_OS_VERSION interact, and I'm
> not able to even compile-test the patch.
> Certainly the final comment there looks suspicious, given the preceding MAC_OS
> stanza...
> 

I thought you already added MAP_JIT in 6f70ddee19e. It's getting enabled
on my M1 laptop. Was it intended or not?

    /* Applicable to both iOS and macOS (Apple Silicon). */
    if (!splitwx) {
        flags |= MAP_JIT;
    }

TCG from master branch of QEMU works fine on M1. I'm not sure why do we
need to duplicate it.

Thanks,
Roman

