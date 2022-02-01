Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CC4A5892
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:35:43 +0100 (CET)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEoda-0007Rd-3d
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:35:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEoXQ-0005rR-GZ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEoXN-0004c8-Ta
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643704156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsByLwkEBnnixp5aQt+4TqducD8586eApTxJSU/dUuY=;
 b=BBOLWrd+SRGmb8xP7g9MEkpNYnx0uGTiLq82uzvftcBCdXilmGmCcfE4Tx9N2fyCj6aVcr
 rgULykMrB8JZnz5LBMDLe56QQSoBTOvKpSYn4rEI7osAytrAlHFB0fFh2CNt0sxQcjFaPy
 H6kFnHxasbWPvb38IWn6tqjqHTJeRTI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-eNGaLnQZMt2BsOt42wik6Q-1; Tue, 01 Feb 2022 03:29:15 -0500
X-MC-Unique: eNGaLnQZMt2BsOt42wik6Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 q10-20020a5085ca000000b0040e3ecf0ec2so447658edh.14
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 00:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsByLwkEBnnixp5aQt+4TqducD8586eApTxJSU/dUuY=;
 b=GLeQ9yC6syRs/XS49/ZfQqY0tn4EfZxHosBWxIZgaPSWB5HHnz8X5pAWEQgdU63aT0
 tnnBefaK5xE828timSZe0jmVMCNfZUtZeVMfd+9DZmqIBSONHsqyIRgqOGFRSQWGJlDH
 fW+wYm0Aa9GIESfzGm3BMH3xEQmlEowoHMbvAXe8wosh3BWbO8tibuMnUIsnyNjI5tQX
 RxPLOhtFSOW9n0yD0jdzaae+6KaYSOPQRrdkorsX5MJGXPpebcewI+uNJb3rkvsIOuCI
 j7e6/nyUeW50zoizoq7rDH3LrwVqk7asOJkiB3MJjs6fvqLW27BVH2XiRGgyJeMpe1t4
 dAWw==
X-Gm-Message-State: AOAM533gmrt+hijHMig4lANl0ThN8Xja/R82yfGaf5F7pgXk8hxMH5r/
 hA8xv26QLQhrPqlebvbl5h4tK+Hp4V4Vyf4qzaKXAVOi0Z4saQbIIwtzJrgQTcVDXbXYQM6inSO
 d2Zjg3YwDsCyuwIc=
X-Received: by 2002:a50:fd0e:: with SMTP id i14mr2706173eds.456.1643704154268; 
 Tue, 01 Feb 2022 00:29:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj08ZVSZIb/UTzP8Al5U4f47BjkRTh2NVt+jgkEZehcHfuWuGkr9seelHrZHwPYqd+siL3lg==
X-Received: by 2002:a50:fd0e:: with SMTP id i14mr2706154eds.456.1643704154038; 
 Tue, 01 Feb 2022 00:29:14 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id op27sm14305728ejb.103.2022.02.01.00.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:29:13 -0800 (PST)
Date: Tue, 1 Feb 2022 09:29:12 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu
 enabled features
Message-ID: <20220201092912.51016cec@redhat.com>
In-Reply-To: <cun8ruwrrqs.fsf@oracle.com>
References: <20220129094644.385841-1-leobras@redhat.com>
 <cun8ruwrrqs.fsf@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 12:53:31 +0000
David Edmondson <david.edmondson@oracle.com> wrote:

> On Saturday, 2022-01-29 at 06:46:45 -03, Leonardo Bras wrote:
> 
> > The following steps describe a migration bug:
> > 1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
> > 2 - Migrate to a host with EPYC-Naples cpu
> >
> > The guest kernel crashes shortly after the migration.
> >
> > The crash happens due to a fault caused by XRSTOR:
> > A set bit in XSTATE_BV is not set in XCR0.
> > The faulting bit is FEATURE_PKRU (enabled in Milan, but not in Naples)  
> 
> I'm trying to understand how this happens.
> 
> If we boot on EPYC-Milan with "-cpu EPYC", the PKRU feature should not
> be exposed to the VM (it is not available in the EPYC CPU).
> 
> Given this, how would bit 0x200 (representing PKRU) end up set in
> xstate_bv?
> 
> > To avoid this kind of bug:
> > In kvm_get_xsave, mask-out from xstate_bv any bits that are not set in
> > current vcpu's features.

In addition to above:

it's not good idea to silently mask something out.
If we can't ensure the same feature-set for a CPU model
and can't verify it by asking QEMU on source and
target host, the next best thing would be to explicitly
fail migration (i.e. adding check to.post_load hook or
doing some other migration magic, CCing David)

> >
> > This keeps cpu->env->xstate_bv with feature bits compatible with any
> > host machine capable of running the vcpu model.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  target/i386/xsave_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
> > index ac61a96344..0628226234 100644
> > --- a/target/i386/xsave_helper.c
> > +++ b/target/i386/xsave_helper.c
> > @@ -167,7 +167,7 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
> >          env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm + 8);
> >      }
> >
> > -    env->xstate_bv = header->xstate_bv;
> > +    env->xstate_bv = header->xstate_bv & env->features[FEAT_XSAVE_COMP_LO];
> >
> >      e = &x86_ext_save_areas[XSTATE_YMM_BIT];
> >      if (e->size && e->offset) {  
> 
> dme.


