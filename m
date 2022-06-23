Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654E5582C3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 19:19:10 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4QU1-0004zj-2X
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 13:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o4Q7N-0000VM-0p
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o4Q7K-0006Ga-Tv
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656003342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuznqCYFVAzY0lrT4yJMKDW8GPjDkpegRAKiqBdOMhE=;
 b=TNhx/bdueDIHkv4afhai8rfaIeCB8FiBkcNA+UPuoIk3ddy5nJX+fl5BXTP5FAvUwc/rnc
 fjEHuQA7Q1vG1iYKn1F5DdesBSgVCO8f5MVenfPrM0SR8IVnetLu6jsMDEuTinTq9m315J
 6DgHg4gdYnObHK6kH69ZsnIQA3ZbjX4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-99ALCmW1PWax9ERpodIjtw-1; Thu, 23 Jun 2022 12:55:41 -0400
X-MC-Unique: 99ALCmW1PWax9ERpodIjtw-1
Received: by mail-io1-f72.google.com with SMTP id
 l7-20020a6b7007000000b00669b2a0d497so29119ioc.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 09:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iuznqCYFVAzY0lrT4yJMKDW8GPjDkpegRAKiqBdOMhE=;
 b=rx3CxPGAafNhQFlk5K4w2WVMqufPuESP3ooiEladPClrQJlnLoVxM2yn9JvnT6sHux
 WHE/zF7GXywdZpo4IjM9QhLyvUwNDndqhbh7ocOP74kjBhqj6wF0rgOHrRZtH1fAosqq
 9US5ClhE7zxpco/VEYF0qHYnKnBbFYnhpSzPC4AAhU5D4rVSmx5lziVdzPhO18+rPca2
 ouGULC2w5TQMFmMjThUovF5CTnpR2vEIVi/G2+lYRTl081zElFSB2SDCdZB15XkXjINt
 M1so3imYigBSo6Niihhl+Vec4RZtdQLGdhwHfVxq5brM9S0Yx5q0+mdCk4BE2d7LlTJ0
 /tDg==
X-Gm-Message-State: AJIora+9rQJ8wy5ByLKunlcm+LxswobSON0XA5CrbcWmJ30mwcIm7awm
 A/llzLvXesOTCZqu/LI2cpB4uPpULOYxqoNBUS7raheS5GdJsIwcunLGfzSVVDogi1KTwRdzkjU
 hqvYCcPI+0SjSO3k=
X-Received: by 2002:a05:6638:10c:b0:339:e949:b332 with SMTP id
 x12-20020a056638010c00b00339e949b332mr2600145jao.22.1656003340458; 
 Thu, 23 Jun 2022 09:55:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v2pb8UCPQLnwPUTH3v6pK+XYmw3BeRMMWwR78arc/heZH1sNQviSJeBVgUUTHhZkolY/45Bw==
X-Received: by 2002:a05:6638:10c:b0:339:e949:b332 with SMTP id
 x12-20020a056638010c00b00339e949b332mr2600132jao.22.1656003340218; 
 Thu, 23 Jun 2022 09:55:40 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 x68-20020a6bc747000000b006692192baf7sm10656424iof.25.2022.06.23.09.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 09:55:39 -0700 (PDT)
Date: Thu, 23 Jun 2022 12:55:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] KVM: Hook kvm_arch_put_registers() errors to the
 caller
Message-ID: <YrSbCXjDx/fIzJW1@xz-m1.local>
References: <20220617144857.34189-1-peterx@redhat.com>
 <20220617144857.34189-6-peterx@redhat.com>
 <CAFEAcA_ithXxxxBQpw3sF0XN1qz8Hgdqc4J_S8jDUgiJAL0-Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_ithXxxxBQpw3sF0XN1qz8Hgdqc4J_S8jDUgiJAL0-Yg@mail.gmail.com>
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

On Thu, Jun 23, 2022 at 02:09:43PM +0100, Peter Maydell wrote:
> On Fri, 17 Jun 2022 at 15:53, Peter Xu <peterx@redhat.com> wrote:
> >
> > Leverage the new mechanism to pass over errors to upper stack for
> > kvm_arch_put_registers() when called for the post_init() accel hook.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  accel/kvm/kvm-all.c  | 13 ++++++++++---
> >  accel/kvm/kvm-cpus.h |  2 +-
> >  softmmu/cpus.c       |  5 ++++-
> >  3 files changed, 15 insertions(+), 5 deletions(-)
> 
> Checking for errors definitely does seem like the right thing to do.
> That said:
> 
> (1) Why do we want to check for errors only on the call
> for post_init synchronize, and not any of the other places
> where we call kvm_arch_put_registers()?

Because I only know that's what we need to keep live migration honest on
being successful, and I didn't want to spread the fire elsewhere, neither
from knowledge nor time..  So I wanted to keep the series simple but
useful.

If we have reasons to cover some of the rest, I can still try.

> 
> (2) I suspect this will uncover some situations where we've
> been happening-to-work because we ignore an error, and now
> will start to actively fail. But I guess there's not much
> we can do about that except say "we'll fix them as we encounter
> bug reports about them". (I know of at least one: on the
> Mac M1 running Linux, if the host doesn't have this kernel fix:
> https://lore.kernel.org/all/YnHz6Cw5ONR2e+KA@google.com/T/
> then the first put_registers will fail (mostly harmlessly).
> I think that's the post_init sync but it might be the post_reset
> one.)

.. from what I read from the commit message in the link, hopefully that was
only about the reset process since that sounds like a mismatched regs
before/after gic created.  When migration completes, I guess we're always
fetching from the after-gic-created case?  But it'll be great if we double
check.  Luckily it seems only for m1.

What my series wanted to achieve is not affect anything else but migration
(so if they fail elsewhere they keep the benign failing).  What I worried
is exactly when we have benign failures on put regs on live migration use
cases, but hopefully not.

Thanks,

-- 
Peter Xu


