Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18CB557FA0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:22:03 +0200 (CEST)
Received: from localhost ([::1]:43776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Pak-0000dG-UV
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o4PXi-0007MC-Dn
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o4PXe-0000a8-Qr
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656001128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fDieFVI61BTDSQwQjm9za3gh4Y+omsowLanTrY2QUCM=;
 b=ge9k68D2I/CibC2Chik4bNVUO7j2EUUJOyBGQk3wvEikZxX+bBVz5HvAkK44CcQXs9EwFn
 HzIBMFi65427MjdzL0rM+jUzqEiCbXvKPiOREMXIq1Re7YEmUM/e/l8UOaqrzHp3M/4wMS
 miy31OctcO1EUXgMSl3gMnW+pPUlW1A=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-BDh-16zzMO6ci6_-oDzSHQ-1; Thu, 23 Jun 2022 12:18:47 -0400
X-MC-Unique: BDh-16zzMO6ci6_-oDzSHQ-1
Received: by mail-io1-f69.google.com with SMTP id
 k5-20020a6bba05000000b00668eb755190so11147483iof.13
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 09:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fDieFVI61BTDSQwQjm9za3gh4Y+omsowLanTrY2QUCM=;
 b=oCuoZtO1VNz98NMnwxXiBaD+jwL7xsYKf05KHj4yOkLXZV4SEMochXAd5rS6QKoa7S
 12MwiUIKUV8rcrx/kJSt4ATuPYEZ+7UO13t2+V5n8Xn3zg0z3lSGT81w/x210Ds45GfJ
 aCqL+p+7nBMbq1GIGSsQm5w3CTgIicW9aBPwxo9bdeSeGzSdMKPcIthGmsBKUF5S75wq
 UrSQj3YceCQJMkzC7jfGtRe2TLmbH6uqeyplrpiYRUMCZe9uSZHWlpMgvUzzu3j68lVK
 pf9SyTXrp3BRrtDdxB0RD8oboQScLBSxhtJJsVRs1n5wZynOfrtLJ0s+vs+J8NTveHfl
 OeAw==
X-Gm-Message-State: AJIora8JSpaqEVQHxRZyBMeuKOzC2d+wLpq/Cw7/iSdC6iM7r+ETL6X8
 WGxl/E5OA1e4uOIUI+mMTCn+3N2FkI6iG48cyVFwmYH0+CdRb7lZcIa33ZuO2iQy1/FJqT+f+1H
 AfVKmHBoL4SpEp0I=
X-Received: by 2002:a05:6e02:20ed:b0:2d9:3846:f3df with SMTP id
 q13-20020a056e0220ed00b002d93846f3dfmr5810159ilv.220.1656001127030; 
 Thu, 23 Jun 2022 09:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHu0WDYGUdadNb5jHSuh8mC6cTYZgWVDOtEqyFOZ/YnUSDY1uajkHx3/QZgNOVX6kKX83t1w==
X-Received: by 2002:a05:6e02:20ed:b0:2d9:3846:f3df with SMTP id
 q13-20020a056e0220ed00b002d93846f3dfmr5810145ilv.220.1656001126804; 
 Thu, 23 Jun 2022 09:18:46 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a02230f000000b00339e669df91sm1299052jau.153.2022.06.23.09.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 09:18:46 -0700 (PDT)
Date: Thu, 23 Jun 2022 12:18:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/5] cpus-common: Add run_on_cpu2()
Message-ID: <YrSSZOjUu8+xOHAk@xz-m1.local>
References: <20220617144857.34189-1-peterx@redhat.com>
 <20220617144857.34189-3-peterx@redhat.com>
 <CAFEAcA8+zLF5o6ofy5z4tCKY0NyAoy=PmmGnjLEjZp0YoFB4ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8+zLF5o6ofy5z4tCKY0NyAoy=PmmGnjLEjZp0YoFB4ig@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 23, 2022 at 02:04:03PM +0100, Peter Maydell wrote:
> On Fri, 17 Jun 2022 at 15:57, Peter Xu <peterx@redhat.com> wrote:
> >
> > This version of run_on_cpu() allows to take an Error** to detect errors.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  cpus-common.c         | 27 +++++++++++++++++++++++++++
> >  include/hw/core/cpu.h | 26 ++++++++++++++++++++++++++
> >  softmmu/cpus.c        |  6 ++++++
> >  3 files changed, 59 insertions(+)
> 
> > +/**
> > + * run_on_cpu2:
> > + * @cpu: The vCPU to run on.
> > + * @func: The function to be executed.
> > + * @data: Data to pass to the function.
> > + * @errp: The Error** pointer to be passed into @func2.
> > + *
> > + * Schedules the function @func2 for execution on the vCPU @cpu, capture
> > + * any error and put it into *@errp when provided.
> > + */
> > +void run_on_cpu2(CPUState *cpu, run_on_cpu_func2 func2, run_on_cpu_data data,
> > +                 Error **errp);
> 
> Can you give this a more descriptive name, please,

Ack on the rename, though do you have a suggestion?  I did thought about
things like run_on_cpu_with_error_captured but that's awfully long..

The use of "suffix 2" seem to be an option in this case and there're users
of it even on published KVM interfaces (to name some, KVM_[SET|GET]_PIT2,
KVM_[SET|GET]_CPUID2, KVM_[SET|GET]_SREGS2, KVM_GET_XSAVE2..), while this
is qemu helper so we can even rename when we want.

> unless the plan is to convert all the users of the existing run_on_cpu()
> and then rename this function to that ?

No plan for that, since I don't see a strong need and maybe many callers do
not care about retval.

What I plan to do is to fix the immediate migration issue only so we at
least don't hit hard-to-debug bugs even when migration completed succeeded
(it seems) on QEMU level.  That's also why I used a separate helper just to
keep the rest untouched.  We could move to the new one in other codes when
proper, but that's not part of the goal of this series.

Thanks,

-- 
Peter Xu


