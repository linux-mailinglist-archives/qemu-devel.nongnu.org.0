Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B180A64AC8B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 01:40:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4tLG-0006HX-7F; Mon, 12 Dec 2022 19:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4tLD-0006Fb-KC
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:40:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4tLB-0007zi-Q8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670892012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QoPPuTRwWFZutAOquMbo3T1uihUBzBljFkwE0nc28t4=;
 b=EQD0O0nW7ReZGS2awys5CJ8hWD/0lWoIuADTueeD9lSTmn6seeJjGEWNbB2iprCaoLjCAO
 gxszA+91GnAOZZwQ36FTXQ0rWAKCQ3APsTu9orF9S74BFItxdzZ1+Wy5iDZoUWuzoOIbl1
 E+gMhQgsMKoGwtry23gtKoLZzHIUVq4=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-7aQ8E3NUNASiPFat4NB9VA-1; Mon, 12 Dec 2022 19:40:10 -0500
X-MC-Unique: 7aQ8E3NUNASiPFat4NB9VA-1
Received: by mail-vk1-f198.google.com with SMTP id
 f190-20020a1f1fc7000000b003b88bc02472so604871vkf.13
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QoPPuTRwWFZutAOquMbo3T1uihUBzBljFkwE0nc28t4=;
 b=CPiY/G9ZGEab4Hdn183zmFmG73gRLqD9xih0BWDIOkwhyGqGXv4R5Ph9yabz1RhlcU
 05+zslxI4V8BBNH6cGw8NjscoUvT0TORMU0muU2a4BdopqB/jwxAlirRZ3Iczkm2AhqU
 6xZkAs+dG4seIonBc2QrR7Yh+xAQ92kFpRw/poKE9IAiOcktydsvgx4qqTdyCY0pmd37
 jAOITvNdHJIBJreJM4me1uzYM/dgcRkwKkoh8RoHeUK3aKn2JEUMwahbGCZWof2KNvCK
 2dwt/ZDjUvSLzgpLpRbH9M6O97pjZdYkWkStpJ1QKd3SA/0IdZzSC+xp5DQ0089JAox/
 cOpA==
X-Gm-Message-State: ANoB5pmhZQPZP+soYwS+UINJ6OfP6Tp8Jn919va9ZVbaznzhndpsSPTe
 s+98QlYd7hix958UP7JLSyVPfa5v/RptUs+OGrHjpMaxmguzDVhpLfaM5J4qyoevzCAgerEI6Y4
 a6Mo9+3654ZN0NxSZdtHMcVXFvnrqj1M=
X-Received: by 2002:ab0:7286:0:b0:418:455f:2e94 with SMTP id
 w6-20020ab07286000000b00418455f2e94mr44716130uao.75.1670892010018; 
 Mon, 12 Dec 2022 16:40:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6euTcoRwyaavidyf/WTK9p8s0gWbu05bs9YZ8ZnqYqnIorUxz3v08NasaNLj9LzwMcOPcGTaGNUJVA/RakUWU=
X-Received: by 2002:ab0:7286:0:b0:418:455f:2e94 with SMTP id
 w6-20020ab07286000000b00418455f2e94mr44716126uao.75.1670892009750; Mon, 12
 Dec 2022 16:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-3-dwmw2@infradead.org>
 <77357500-5fa0-b8c0-9367-2355db6f6bfb@redhat.com>
 <cae88f5e0390ab01b21b513da81256b1ce770fbf.camel@infradead.org>
In-Reply-To: <cae88f5e0390ab01b21b513da81256b1ce770fbf.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Dec 2022 01:39:57 +0100
Message-ID: <CABgObfbYh6Fb4nrsmXp5uTmrzPNVy5LHwN-TfjHE2oeZbb+h2Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/22] xen: add CONFIG_XENFV_MACHINE and
 CONFIG_XEN_EMU options for Xen emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paul Durrant <paul@xen.org>, 
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Claudio Fontana <cfontana@suse.de>
Content-Type: multipart/alternative; boundary="000000000000b31b6505efaadceb"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

--000000000000b31b6505efaadceb
Content-Type: text/plain; charset="UTF-8"

Il lun 12 dic 2022, 23:23 David Woodhouse <dwmw2@infradead.org> ha scritto:

> On Mon, 2022-12-12 at 18:07 +0100, Paolo Bonzini wrote:
> > On 12/9/22 10:55, David Woodhouse wrote:
> > >   config KVM
> > >       bool
> > > +    imply XEN_EMU if (I386 || X86_64)
> >
> > No need for the "imply", just make it "default y" below and it will have
> > the same effect.
> >
> > >
> > > diff --git a/target/Kconfig b/target/Kconfig
> > > index 83da0bd293..e19c9d77b5 100644
> > > --- a/target/Kconfig
> > > +++ b/target/Kconfig
> > > @@ -18,3 +18,7 @@ source sh4/Kconfig
> > >  source sparc/Kconfig
> > >  source tricore/Kconfig
> > >  source xtensa/Kconfig
> > > +
> > > +config XEN_EMU
> > > +    bool
> > > +    depends on KVM && (I386 || X86_64)
> >
> > Please place it in hw/xen/Kconfig.
>
> Perhaps I misunderstand, but I'm not sure that is consistent with what
> Philippe was asking for in
>
> https://lore.kernel.org/qemu-devel/d203e13d-e2f9-5816-030d-c1449bde364d@linaro.org/
> specifically:
>
> >> I rather have hw/ and target/ features disentangled, so I'd use
> >> CONFIG_XEN_EMU under target/ and CONFIG_XENFV_MACHINE under hw/,
> >> eventually having CONFIG_XEN_EMU depending on CONFIG_XENFV_MACHINE
> >> and -- for now -- CONFIG_KVM.
>

However the dependency of the xenfv machine is misguided. In principle
there is no reason to depend on KVM as opposed to TCG, too, which is why I
didn't suggest hw/i386/kvm for either the devices or the Kconfig file.

The idea there seems to be that XEN_EMU is a *target* feature since it
> covers the support in target/i386/kvm.
>
> But yes, it *also* covers the devices I'm adding to hw/i386/kvm. Do I
> want a *separate* config symbol for that? Or just make those depend on
> XENFV_MACHINE && XEN_EMU ?
>
> I'll move XEN_EMU to hw/i386/Kconfig for now, thereby doing what
> *neither* of you said (I don't think hw/xen/Kconfig is the best choice
> when the *code* it enables is under hw/i386/kvm?)
>

Yeah there is no especially better match. I guess hw/i386 is fine, since
there will be code in mc->kvm_type. It would be either there or in
target/i386/Kconfig, but not target/Kconfig.

Paolo

>

--000000000000b31b6505efaadceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 12 dic 2022, 23:23 David Woodhouse &lt;<a href=
=3D"mailto:dwmw2@infradead.org">dwmw2@infradead.org</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Mon, 2022-12-12 at 18:07 +0100, Pao=
lo Bonzini wrote:<br>
&gt; On 12/9/22 10:55, David Woodhouse wrote:<br>
&gt; &gt;=C2=A0 =C2=A0config KVM<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt; &gt; +=C2=A0 =C2=A0 imply XEN_EMU if (I386 || X86_64)<br>
&gt; <br>
&gt; No need for the &quot;imply&quot;, just make it &quot;default y&quot; =
below and it will have <br>
&gt; the same effect.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; diff --git a/target/Kconfig b/target/Kconfig<br>
&gt; &gt; index 83da0bd293..e19c9d77b5 100644<br>
&gt; &gt; --- a/target/Kconfig<br>
&gt; &gt; +++ b/target/Kconfig<br>
&gt; &gt; @@ -18,3 +18,7 @@ source sh4/Kconfig<br>
&gt; &gt;=C2=A0 source sparc/Kconfig<br>
&gt; &gt;=C2=A0 source tricore/Kconfig<br>
&gt; &gt;=C2=A0 source xtensa/Kconfig<br>
&gt; &gt; +<br>
&gt; &gt; +config XEN_EMU<br>
&gt; &gt; +=C2=A0 =C2=A0 bool<br>
&gt; &gt; +=C2=A0 =C2=A0 depends on KVM &amp;&amp; (I386 || X86_64)<br>
&gt; <br>
&gt; Please place it in hw/xen/Kconfig.<br>
<br>
Perhaps I misunderstand, but I&#39;m not sure that is consistent with what<=
br>
Philippe was asking for in=C2=A0 <br>
<a href=3D"https://lore.kernel.org/qemu-devel/d203e13d-e2f9-5816-030d-c1449=
bde364d@linaro.org/" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//lore.kernel.org/qemu-devel/d203e13d-e2f9-5816-030d-c1449bde364d@linaro.or=
g/</a><br>
specifically:<br>
<br>
&gt;&gt; I rather have hw/ and target/ features disentangled, so I&#39;d us=
e<br>
&gt;&gt; CONFIG_XEN_EMU under target/ and CONFIG_XENFV_MACHINE under hw/,<b=
r>
&gt;&gt; eventually having CONFIG_XEN_EMU depending on CONFIG_XENFV_MACHINE=
<br>
&gt;&gt; and -- for now -- CONFIG_KVM.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">However the dependency of the xenfv m=
achine is misguided. In principle there is no reason to depend on KVM as op=
posed to TCG, too, which is why I didn&#39;t suggest hw/i386/kvm for either=
 the devices or the Kconfig file.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The ide=
a there seems to be that XEN_EMU is a *target* feature since it<br>
covers the support in target/i386/kvm.<br>
<br>
But yes, it *also* covers the devices I&#39;m adding to hw/i386/kvm. Do I<b=
r>
want a *separate* config symbol for that? Or just make those depend on<br>
XENFV_MACHINE &amp;&amp; XEN_EMU ? <br>
<br>
I&#39;ll move XEN_EMU to hw/i386/Kconfig for now, thereby doing what<br>
*neither* of you said (I don&#39;t think hw/xen/Kconfig is the best choice<=
br>
when the *code* it enables is under hw/i386/kvm?)<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah there is no especiall=
y better match. I guess hw/i386 is fine, since there will be code in mc-&gt=
;kvm_type. It would be either there or in target/i386/Kconfig, but not targ=
et/Kconfig.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo=C2=A0<=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
</blockquote></div></div></div>

--000000000000b31b6505efaadceb--


