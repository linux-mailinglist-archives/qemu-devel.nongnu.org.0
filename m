Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4D5E7A06
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 13:53:52 +0200 (CEST)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhFf-00087M-Mm
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 07:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Y8ci=Z2=zx2c4.com=Jason@kernel.org>)
 id 1obh8X-0004eQ-74; Fri, 23 Sep 2022 07:46:29 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:46444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Y8ci=Z2=zx2c4.com=Jason@kernel.org>)
 id 1obh8V-0003jv-2j; Fri, 23 Sep 2022 07:46:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF30FB82289;
 Fri, 23 Sep 2022 11:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CB2C433B5;
 Fri, 23 Sep 2022 11:46:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="J5WmTpgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663933579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQBYSTnaTRQpfoddjM/RGCi1UslqeID/xYDVULx+hKo=;
 b=J5WmTpgcwLmMRH/EQlj3FMBnNXigBSxcR7hRGwpTIRi2LrgG+I1CxCW0tFWGFFfZ9HJJa+
 9WyVH2jmrn2hsmZDynvSV/3DLGTA8U1Z5Yr64WQUhnnqvYs2GANRmrhqJ9YXxdRz7d1OuW
 BHfa0OLtEiCbs5TtFEJVWCy8csIrwmU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1b8364ab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 23 Sep 2022 11:46:19 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id e1so4801750uaa.1;
 Fri, 23 Sep 2022 04:46:19 -0700 (PDT)
X-Gm-Message-State: ACrzQf0VwF37AT8qWpgpDlVJskF5bUT255NV4tanLfBWBnhmR1sgt1q/
 xmnNIe5wtiEPe6W11GRhpUXS8uL85Ks0R/Sjmfg=
X-Google-Smtp-Source: AMsMyM7VB/AeqA/wznYugpNZc10tgmhhutokLp2MRdq5T+l/KTWClwHRnRC+BzgmQBP024aaWE2yIAd5XooDGxVplRY=
X-Received: by 2002:ab0:758a:0:b0:3af:2b2d:dae7 with SMTP id
 q10-20020ab0758a000000b003af2b2ddae7mr3455174uap.24.1663933577923; Fri, 23
 Sep 2022 04:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
 <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
 <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
 <Yy16Mz7+yLCV5jH8@zx2c4.com> <e6fad3bc-66e9-faea-194c-30277c0aa90f@redhat.com>
 <CAHmME9r+s_kBb2vyWe5xqtMd6NCbe=O8sH2=T2r15ZFU=bcKvA@mail.gmail.com>
 <bcd4e3c8-268d-139b-a1a6-0a2e11bd1986@redhat.com>
In-Reply-To: <bcd4e3c8-268d-139b-a1a6-0a2e11bd1986@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Sep 2022 13:46:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9rRa1qXV4tE=vhE0CTryfqYpp_2xgUCKB5bRzmjMhNqZA@mail.gmail.com>
Message-ID: <CAHmME9rRa1qXV4tE=vhE0CTryfqYpp_2xgUCKB5bRzmjMhNqZA@mail.gmail.com>
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
To: David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=Y8ci=Z2=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi David,

On Fri, Sep 23, 2022 at 1:35 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 23.09.22 13:19, Jason A. Donenfeld wrote:
> > On Fri, Sep 23, 2022 at 12:47 PM David Hildenbrand <david@redhat.com> wrote:
> >> You must be fortunate if "one afternoon" is not a significant time
> >> investment. For me it is a significant investment.
> >
> > For me too, to say the least of the multiple afternoons I've spent on
> > this patch set. Getting back to technical content:
> >
> >> and sort out the remaining issues. I thought we (Thomas included) had an
> >> agreement that that's the way we are going to do it. Apparently I was wrong.
> >> Most probably I lived in the kernel space too long such that we don't
> >> rush something upstream. For that reason *I* sent out a patch with
> >> Here I am, getting told by Thomas that we now do it differently now.
> >> What I really tried to express here is: if Thomas wants to commit things
> >> differently now, maybe he can just separate the cleanup parts. I really
> >> *don't want* to send out a multi-patch series to cleanup individual
> >> parts -- that takes significantly more time. Especially not if something
> >> is not committed yet.
> >
> > To recap what's been fixed in your v8.1, versus what's been refactored
> > out of style preference:
> >
> > 1) It handles the machine versioning.
> > 2) It throws an exception on length alignment in KIMD mode:
> > +    /* KIMD: length has to be properly aligned. */
> > +    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
> > +        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> > +    }
> > 3) It asserts if type is neither KIMD vs KLMD, with:
> > +    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);
> >
>
> One important part is
>
> 4) No memory modifications before all inputs were read

Ahhh, which v8's klmd doesn't do, since it updates the parameter block
before doing the last block. Is this a requirement of the spec? If
not, then it doesn't matter. But if so, v8's approach is truly
hopeless, and we'd be remiss to not go with your refactoring that
accomplishes this.

Jason

