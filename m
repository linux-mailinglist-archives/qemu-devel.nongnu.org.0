Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111A15ED447
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 07:34:18 +0200 (CEST)
Received: from localhost ([::1]:52888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odPi4-0008U2-QU
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 01:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odPeb-0006b8-Km
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odPeZ-0000xP-5f
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664343037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fmBj1lduOn8F85drGDxJrHTnkEcvt2YEawUXsVwPYWo=;
 b=TKp05VUitnl1EHigaR2q/XZeVOwX11D11Y8cuIqe3oiXZWKZz0T4/xw7jRNcuoEr6gE9Jq
 dA54Bf88dD4Zz03jlg0+d/VDlmr7Q96pZx9qeS3xaihKpg1rK7BThY/15v0r4Zq/yTZkEx
 GJbxAGusd6EM/JyE9yHA9CG1HFxfLeQ=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-PzMIC6AJNfm33B05_ImEhw-1; Wed, 28 Sep 2022 01:30:32 -0400
X-MC-Unique: PzMIC6AJNfm33B05_ImEhw-1
Received: by mail-vk1-f197.google.com with SMTP id
 b198-20020a1fb2cf000000b003a344f1be22so4051558vkf.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 22:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fmBj1lduOn8F85drGDxJrHTnkEcvt2YEawUXsVwPYWo=;
 b=vsyzTTWSL/bXmQu3yX+X5PKHg2R/pdqW7FZbzM2i/N3HNHD9xrgbAHcJQEkky12ima
 P3bYRHLiLNL2daEnKAT30GWrIwwGhX+7ps3UMx29MupySYxw/pAPCaUw6KOb4fIIMQ1t
 sXIbwAjxC6OmcV2zZ+AHgQmwPK3rrCVNBEqkyrig1HUGRixmxwmClsa4j+yhzsCR7mPP
 4AlxPiSYcbSAVIK2NzcLkFHfpjhb9AFpmC3ufM05QodFdfHxaF9AlIbzu1kKw8qmdXbO
 1roJ7tPZsrpD2ZS4hgkH3aVA9GmQfeBimzGunIctvc/r9JkHowOXzB9N1u7unOMPnywX
 2iYg==
X-Gm-Message-State: ACrzQf3kLPY9z2iD49bsww7LwPtI1DUY7UyRftOlW0lV/+jBb3mJ4vZp
 NZWxRxnFTrxE04RmlWnB34vemRrg6gZ+l5My81oO1bS8lQyD4z48FQVK0mnsQHrKIgqxx1NlSl6
 D/wQ2RHaowXpZToh5DvHExHpJ15G+eO8=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr13531796vks.33.1664343032358; 
 Tue, 27 Sep 2022 22:30:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NfaFCIHN/Y8U+KFTPUgfQmTzaJNxd6cyooS1TqT2VVm/w6UyR8rkY21+yKhRxgm0ksnk+7M8PM97BYPwaYx8=
X-Received: by 2002:a1f:2c93:0:b0:3a3:4904:aa91 with SMTP id
 s141-20020a1f2c93000000b003a34904aa91mr13531787vks.33.1664343032155; Tue, 27
 Sep 2022 22:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220923073333.23381-1-chenyi.qiang@intel.com>
 <20220923073333.23381-3-chenyi.qiang@intel.com>
 <dc8d4a33-7246-222b-66b5-6ba784fac56e@redhat.com>
 <f6caeb4e-82a8-9245-2cb6-22580af559ae@intel.com>
In-Reply-To: <f6caeb4e-82a8-9245-2cb6-22580af559ae@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Sep 2022 07:29:59 +0200
Message-ID: <CABgObfZ4OkQJ3+Ffir2eFESLQ=dgzZCe_JUFVX8p4+o=eSE5=A@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] i386: Add notify VM exit support
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
 Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>, 
 qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000003769af05e9b60f89"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000003769af05e9b60f89
Content-Type: text/plain; charset="UTF-8"

Il mer 28 set 2022, 04:21 Chenyi Qiang <chenyi.qiang@intel.com> ha scritto:

> >> +        warn_report_once("KVM: encounter a notify exit with %svalid
> >> context in"
> >> +                         " guest. It means there can be possible
> >> misbehaves in"
> >> +                         " guest, please have a look.",
> >> +                         ctx_invalid ? "in" : "");
> >
> > The warning should be unconditional if the context is invalid.
> >
>
> In valid context case, the warning can also notify the admin that the
> guest misbehaves. Is it necessary to remove it?
>

You can keep it, but it should be separated so that that invalid context
case uses warn_report instead of warn_report_once.

Paolo


> >> +    object_class_property_add(oc, X86_MACHINE_NOTIFY_WINDOW,
> "uint32_t",
> >
> > uint32 (not uint32_t)
> >
>
> ...
>
> >> +                              x86_machine_get_notify_window,
> >> +                              x86_machine_set_notify_window, NULL,
> >> NULL);
> >> +    object_class_property_set_description(oc,
> X86_MACHINE_NOTIFY_WINDOW,
> >> +            "Set the notify window required by notify VM exit");
> >
> > "Clock cycles without an event window after which a notification VM exit
> > occurs"
> >
>
> Will Fix it. Thanks a lot!
>
> > Thanks,
> >
> > Paolo
> >
> >  From a5cb704991cfcda19a33c622833b69a8f6928530 Mon Sep 17 00:00:00 2001
> > From: Paolo Bonzini <pbonzini@redhat.com>
> > Date: Tue, 27 Sep 2022 15:20:16 +0200
> > Subject: [PATCH] kvm: allow target-specific accelerator properties
> >
> > Several hypervisor capabilities in KVM are target-specific.  When exposed
> > to QEMU users as accelerator properties (i.e. -accel kvm,prop=value),
> they
> > should not be available for all targets.
> >
> > Add a hook for targets to add their own properties to -accel kvm; for
> > now no such property is defined.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index 5acab1767f..f90c5cb285 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -3737,6 +3737,8 @@ static void kvm_accel_class_init(ObjectClass *oc,
> > void *data)
> >           NULL, NULL);
> >       object_class_property_set_description(oc, "dirty-ring-size",
> >           "Size of KVM dirty page ring buffer (default: 0, i.e. use
> > bitmap)");
> > +
> > +    kvm_arch_accel_class_init(oc);
> >   }
> >
> >   static const TypeInfo kvm_accel_type = {
> > diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> > index efd6dee818..50868ebf60 100644
> > --- a/include/sysemu/kvm.h
> > +++ b/include/sysemu/kvm.h
> > @@ -353,6 +353,8 @@ bool kvm_device_supported(int vmfd, uint64_t type);
> >
> >   extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
> >
> > +void kvm_arch_accel_class_init(ObjectClass *oc);
> > +
> >   void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run);
> >   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);
> >
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index e5c1bd50d2..d21603cf28 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -1056,3 +1056,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
> >   {
> >       return true;
> >   }
> > +
> > +void kvm_arch_accel_class_init(ObjectClass *oc)
> > +{
> > +}
> > diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> > index 21880836a6..22b3b37193 100644
> > --- a/target/i386/kvm/kvm.c
> > +++ b/target/i386/kvm/kvm.c
> > @@ -5472,3 +5472,7 @@ void kvm_request_xsave_components(X86CPU *cpu,
> > uint64_t mask)
> >           mask &= ~BIT_ULL(bit);
> >       }
> >   }
> > +
> > +void kvm_arch_accel_class_init(ObjectClass *oc)
> > +{
> > +}
> > diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> > index caf70decd2..bcb8e06b2c 100644
> > --- a/target/mips/kvm.c
> > +++ b/target/mips/kvm.c
> > @@ -1294,3 +1294,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
> >   {
> >       return true;
> >   }
> > +
> > +void kvm_arch_accel_class_init(ObjectClass *oc)
> > +{
> > +}
> > diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> > index 466d0d2f4c..7c25348b7b 100644
> > --- a/target/ppc/kvm.c
> > +++ b/target/ppc/kvm.c
> > @@ -2966,3 +2966,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
> >   {
> >       return true;
> >   }
> > +
> > +void kvm_arch_accel_class_init(ObjectClass *oc)
> > +{
> > +}
> > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> > index 70b4cff06f..30f21453d6 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -532,3 +532,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
> >   {
> >       return true;
> >   }
> > +
> > +void kvm_arch_accel_class_init(ObjectClass *oc)
> > +{
> > +}
> > diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> > index 7bd8db0e7b..840af34576 100644
> > --- a/target/s390x/kvm/kvm.c
> > +++ b/target/s390x/kvm/kvm.c
> > @@ -2574,3 +2574,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
> >   {
> >       return true;
> >   }
> > +
> > +void kvm_arch_accel_class_init(ObjectClass *oc)
> > +{
> > +}
> >
>
>

--0000000000003769af05e9b60f89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 28 set 2022, 04:21 Chenyi Qiang &lt;<a href=3D"=
mailto:chenyi.qiang@intel.com">chenyi.qiang@intel.com</a>&gt; ha scritto:</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 warn_report_once(&quot=
;KVM: encounter a notify exit with %svalid <br>
&gt;&gt; context in&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot; guest. It means there can be possible <br>
&gt;&gt; misbehaves in&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot; guest, please have a look.&quot;,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ctx_invalid ? &quot;in&quot; : &quot;&quot;);<br>
&gt; <br>
&gt; The warning should be unconditional if the context is invalid.<br>
&gt; <br>
<br>
In valid context case, the warning can also notify the admin that the <br>
guest misbehaves. Is it necessary to remove it?<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">You can keep it, but it shou=
ld be separated so that that invalid context case uses warn_report instead =
of warn_report_once.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 object_class_property_add(oc, X86_MACHINE_NOTI=
FY_WINDOW, &quot;uint32_t&quot;,<br>
&gt; <br>
&gt; uint32 (not uint32_t)<br>
&gt; <br>
<br>
...<br>
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_machine_get_notify_window,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x86_machine_set_notify_window, NULL, <=
br>
&gt;&gt; NULL);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 object_class_property_set_description(oc, X86_=
MACHINE_NOTIFY_WINDOW,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;Set the notify window required by notify VM exit&quot;);<br>
&gt; <br>
&gt; &quot;Clock cycles without an event window after which a notification =
VM exit <br>
&gt; occurs&quot;<br>
&gt; <br>
<br>
Will Fix it. Thanks a lot!<br>
<br>
&gt; Thanks,<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt;=C2=A0 From a5cb704991cfcda19a33c622833b69a8f6928530 Mon Sep 17 00:00:0=
0 2001<br>
&gt; From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; Date: Tue, 27 Sep 2022 15:20:16 +0200<br>
&gt; Subject: [PATCH] kvm: allow target-specific accelerator properties<br>
&gt; <br>
&gt; Several hypervisor capabilities in KVM are target-specific.=C2=A0 When=
 exposed<br>
&gt; to QEMU users as accelerator properties (i.e. -accel kvm,prop=3Dvalue)=
, they<br>
&gt; should not be available for all targets.<br>
&gt; <br>
&gt; Add a hook for targets to add their own properties to -accel kvm; for<=
br>
&gt; now no such property is defined.<br>
&gt; <br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; <br>
&gt; diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
&gt; index 5acab1767f..f90c5cb285 100644<br>
&gt; --- a/accel/kvm/kvm-all.c<br>
&gt; +++ b/accel/kvm/kvm-all.c<br>
&gt; @@ -3737,6 +3737,8 @@ static void kvm_accel_class_init(ObjectClass *oc=
, <br>
&gt; void *data)<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL);<br=
>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 object_class_property_set_description(o=
c, &quot;dirty-ring-size&quot;,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;Size of K=
VM dirty page ring buffer (default: 0, i.e. use <br>
&gt; bitmap)&quot;);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0 kvm_arch_accel_class_init(oc);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0static const TypeInfo kvm_accel_type =3D {<br>
&gt; diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h<br>
&gt; index efd6dee818..50868ebf60 100644<br>
&gt; --- a/include/sysemu/kvm.h<br>
&gt; +++ b/include/sysemu/kvm.h<br>
&gt; @@ -353,6 +353,8 @@ bool kvm_device_supported(int vmfd, uint64_t type)=
;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0extern const KVMCapabilityInfo kvm_arch_required_capabilit=
ies[];<br>
&gt; <br>
&gt; +void kvm_arch_accel_class_init(ObjectClass *oc);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run);=
<br>
&gt;=C2=A0 =C2=A0MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run=
 *run);<br>
&gt; <br>
&gt; diff --git a/target/arm/kvm.c b/target/arm/kvm.c<br>
&gt; index e5c1bd50d2..d21603cf28 100644<br>
&gt; --- a/target/arm/kvm.c<br>
&gt; +++ b/target/arm/kvm.c<br>
&gt; @@ -1056,3 +1056,7 @@ bool kvm_arch_cpu_check_are_resettable(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +void kvm_arch_accel_class_init(ObjectClass *oc)<br>
&gt; +{<br>
&gt; +}<br>
&gt; diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c<br>
&gt; index 21880836a6..22b3b37193 100644<br>
&gt; --- a/target/i386/kvm/kvm.c<br>
&gt; +++ b/target/i386/kvm/kvm.c<br>
&gt; @@ -5472,3 +5472,7 @@ void kvm_request_xsave_components(X86CPU *cpu, <=
br>
&gt; uint64_t mask)<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask &amp;=3D ~=
BIT_ULL(bit);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +void kvm_arch_accel_class_init(ObjectClass *oc)<br>
&gt; +{<br>
&gt; +}<br>
&gt; diff --git a/target/mips/kvm.c b/target/mips/kvm.c<br>
&gt; index caf70decd2..bcb8e06b2c 100644<br>
&gt; --- a/target/mips/kvm.c<br>
&gt; +++ b/target/mips/kvm.c<br>
&gt; @@ -1294,3 +1294,7 @@ bool kvm_arch_cpu_check_are_resettable(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +void kvm_arch_accel_class_init(ObjectClass *oc)<br>
&gt; +{<br>
&gt; +}<br>
&gt; diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c<br>
&gt; index 466d0d2f4c..7c25348b7b 100644<br>
&gt; --- a/target/ppc/kvm.c<br>
&gt; +++ b/target/ppc/kvm.c<br>
&gt; @@ -2966,3 +2966,7 @@ bool kvm_arch_cpu_check_are_resettable(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +void kvm_arch_accel_class_init(ObjectClass *oc)<br>
&gt; +{<br>
&gt; +}<br>
&gt; diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c<br>
&gt; index 70b4cff06f..30f21453d6 100644<br>
&gt; --- a/target/riscv/kvm.c<br>
&gt; +++ b/target/riscv/kvm.c<br>
&gt; @@ -532,3 +532,7 @@ bool kvm_arch_cpu_check_are_resettable(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +void kvm_arch_accel_class_init(ObjectClass *oc)<br>
&gt; +{<br>
&gt; +}<br>
&gt; diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c<br>
&gt; index 7bd8db0e7b..840af34576 100644<br>
&gt; --- a/target/s390x/kvm/kvm.c<br>
&gt; +++ b/target/s390x/kvm/kvm.c<br>
&gt; @@ -2574,3 +2574,7 @@ bool kvm_arch_cpu_check_are_resettable(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +void kvm_arch_accel_class_init(ObjectClass *oc)<br>
&gt; +{<br>
&gt; +}<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000003769af05e9b60f89--


