Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D24A6929
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:21:36 +0100 (CET)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3Ox-0000Sh-1X
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:21:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEyei-0002Fx-Dx
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:17:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nEyef-0000WL-Fb
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643743048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ELQopYjxOryW17JzrHmT81IC7n3SF8/2zpxrfO1VqQ=;
 b=YB7mJzXOpeSotW/IDH0lLq6nCt4gvAdr1dONi0He78X6B3vygUhAwbES4BL7GVV6+HRKhC
 oyeXh6eDGyNibhkPLL5ZCjPe/INTcHjIlHkvJe4pSl2vlUHJXautNUHmBHEIKer9bgc8Ph
 jrGv2NHjhy2Cskyb3c8uYNsAW/XEXSY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-OUzr0vu2PFOlaH0pfgMaFg-1; Tue, 01 Feb 2022 14:17:25 -0500
X-MC-Unique: OUzr0vu2PFOlaH0pfgMaFg-1
Received: by mail-vk1-f199.google.com with SMTP id
 m194-20020a1fa3cb000000b0031fdcfe55e7so2961926vke.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7ELQopYjxOryW17JzrHmT81IC7n3SF8/2zpxrfO1VqQ=;
 b=VrRmx7h/wT3UT01lFw5BDOQF1CbhV+IW/Vi8WPQvz8wezaTkZcJwuBlrnZCkFQ8kE4
 vcou8Vfu+T1jV5QtJUk+0LkJHi1outhfxWi7yO/MSZRBfxgiQPAM2pfXaYLSV/NNn5eZ
 qKdc81/PrKKqCvupB6K2MiggqPSFE0eKYH5lgH96x9qyaqTPVaOMsFkkwXgPqkdCDHTN
 B3p9u3IlAWqaioohZ4nzo7SkFkuMVTMZfu4XUZ1pm6NypV9B0WBFy8r0riAEdCJB5H0b
 Xx+W2mChxYN6Yrulm6jIpmhejtPkWWlc0vnU9DCuY7xZGSKHrM7ElNM1F5DGqqqoAT/6
 /F3w==
X-Gm-Message-State: AOAM530Z+xKfktJu2/npfPcJhcJ8TH0uvxVJRmJymMjSKcBXptnSEn7r
 dWbU06uAllFDlnKci5wcKMj5w26dL8uf+XGY+ZC7WuNjEDuqIaGwQVaLpAtYLYc4VfuRHR+8hfG
 G0xUd4hdQY0OiF4s=
X-Received: by 2002:ab0:390a:: with SMTP id b10mr10830551uaw.51.1643743045321; 
 Tue, 01 Feb 2022 11:17:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIUpyFqiWYDkRp885/2dTrLqAXtVwmI69vff+1mP3jqF4oCQzBSECEseG1UvbT6ieE03/HPg==
X-Received: by 2002:ab0:390a:: with SMTP id b10mr10830539uaw.51.1643743045080; 
 Tue, 01 Feb 2022 11:17:25 -0800 (PST)
Received: from ?IPv6:2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e?
 ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id 73sm4278504uas.16.2022.02.01.11.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:17:24 -0800 (PST)
Message-ID: <1d29453460c1bbcbf1f131c05a3c290e565b4ec9.camel@redhat.com>
Subject: Re: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu
 enabled features
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, David Edmondson
 <david.edmondson@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, Leonardo
 Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Date: Tue, 01 Feb 2022 16:17:21 -0300
In-Reply-To: <20220201092912.51016cec@redhat.com>
References: <20220129094644.385841-1-leobras@redhat.com>
 <cun8ruwrrqs.fsf@oracle.com> <20220201092912.51016cec@redhat.com>
User-Agent: Evolution 3.42.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Igor,

On Tue, 2022-02-01 at 09:29 +0100, Igor Mammedov wrote:
> On Mon, 31 Jan 2022 12:53:31 +0000
> David Edmondson <david.edmondson@oracle.com> wrote:
> 
> > On Saturday, 2022-01-29 at 06:46:45 -03, Leonardo Bras wrote:
> > 
> > > The following steps describe a migration bug:
> > > 1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
> > > 2 - Migrate to a host with EPYC-Naples cpu
> > > 
> > > The guest kernel crashes shortly after the migration.
> > > 
> > > The crash happens due to a fault caused by XRSTOR:
> > > A set bit in XSTATE_BV is not set in XCR0.
> > > The faulting bit is FEATURE_PKRU (enabled in Milan, but not in
> > > Naples)  
> > 
> > I'm trying to understand how this happens.
> > 
> > If we boot on EPYC-Milan with "-cpu EPYC", the PKRU feature should
> > not
> > be exposed to the VM (it is not available in the EPYC CPU).
> > 
> > Given this, how would bit 0x200 (representing PKRU) end up set in
> > xstate_bv?
> > 
> > > To avoid this kind of bug:
> > > In kvm_get_xsave, mask-out from xstate_bv any bits that are not
> > > set in
> > > current vcpu's features.
> 
> In addition to above:
> 
> it's not good idea to silently mask something out.
> If we can't ensure the same feature-set for a CPU model
> and can't verify it by asking QEMU on source and
> target host, the next best thing would be to explicitly
> fail migration (i.e. adding check to.post_load hook or
> doing some other migration magic, CCing David)

Maybe there is something to do with the host kernel (kvm) doing some
strange stuff.

IIRC qemu ended up getting some masked version for using on migration,
since it was not failing as expected.

I will try to investigate further.
Please let me know if you have any information on that.

Best regards,
Leo

> 
> > > 
> > > This keeps cpu->env->xstate_bv with feature bits compatible with
> > > any
> > > host machine capable of running the vcpu model.
> > > 
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  target/i386/xsave_helper.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/target/i386/xsave_helper.c
> > > b/target/i386/xsave_helper.c
> > > index ac61a96344..0628226234 100644
> > > --- a/target/i386/xsave_helper.c
> > > +++ b/target/i386/xsave_helper.c
> > > @@ -167,7 +167,7 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu,
> > > const void *buf, uint32_t buflen)
> > >          env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm + 8);
> > >      }
> > > 
> > > -    env->xstate_bv = header->xstate_bv;
> > > +    env->xstate_bv = header->xstate_bv & env-
> > > >features[FEAT_XSAVE_COMP_LO];
> > > 
> > >      e = &x86_ext_save_areas[XSTATE_YMM_BIT];
> > >      if (e->size && e->offset) {  
> > 
> > dme.
> 
> 


