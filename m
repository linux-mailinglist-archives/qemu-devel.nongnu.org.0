Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B62E27CA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 15:43:37 +0100 (CET)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksRq3-0005hF-Ua
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 09:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ksRov-0005AP-HQ
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 09:42:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ksRor-0000C8-L3
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 09:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608820940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6aZcxb6ouQ9KytG2GBB/sm4sfw0E+v0Cd80lFPVEGmA=;
 b=Y/DC5b3h3aJyGFRgc5dPHHHA6fJEfL/GMywkCZdqjXS6tXblQK/ttAgBjFXWIVgOBQPDp5
 n8+cIWiZO3+VjfuT16p6pFWaHZbn8ZQGD7IdIhOY0kZr33EjTFN63lGoHaM8hSSszFFQ8N
 ivEug0GqdvbxPa6htigW3MWBAzlruM8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-qTOUfV56PG6dvZsmeU2dmQ-1; Thu, 24 Dec 2020 09:42:16 -0500
X-MC-Unique: qTOUfV56PG6dvZsmeU2dmQ-1
Received: by mail-pf1-f197.google.com with SMTP id v138so1296991pfc.10
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 06:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6aZcxb6ouQ9KytG2GBB/sm4sfw0E+v0Cd80lFPVEGmA=;
 b=gUco7cL5LOAfBHUA0+CyS/Hr7rvz8nOamdwODeIh72KzMSjsBaJMwsWO6Gz/M8HICe
 Qj/jC7w+HkhoPMg61ikaT52i7F9TPoY+xCCgr//kllJfEDUEsxJpSWHX7eZxkRtYGvTs
 NBjvoLmBjAB532K8fbD76XnwgeGPY1Kcz0ijIF+Ql6bwpex8p0lpBtOJplFUuBZu7QpO
 6eJcFPi98vDt/tv7/C3SpTaE4jZJrMAItDVuMRYxQ8sdZjhFoLtOPahjn71Qm/2UU68h
 idfTdbBGSYUXGJsY8/prgYOPls68EotInI2E7Pn8z7VOnZ7dpY4qparIO36HGClWRSo1
 AHlA==
X-Gm-Message-State: AOAM532h+8gFgnVVoAAfcE1n18PYTLhhe1tyB9NFxhkx4fTaSJd5wQQs
 KD9JYVtK+fsEne37EzQJdnRApzrLB3nxjyklZJYo6A52OzzdkvUjj4G7s9P0BxsLp2SXlblzLX5
 nizFM9cUkbq7Pc+KA7M+vkp5YjTi+wMI=
X-Received: by 2002:a63:c205:: with SMTP id b5mr6446149pgd.281.1608820935677; 
 Thu, 24 Dec 2020 06:42:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJWAxJUuQAsCpFSy2nFUl0bM0zZkjrTu1rjHMxDL912RpjJ/3anzNuWj3T1oYASSd6I12sztH0qutr6B+Bu1k=
X-Received: by 2002:a63:c205:: with SMTP id b5mr6446135pgd.281.1608820935345; 
 Thu, 24 Dec 2020 06:42:15 -0800 (PST)
MIME-Version: 1.0
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
 <aae93661-1e66-f659-2351-270ee483ce6e@amsat.org>
In-Reply-To: <aae93661-1e66-f659-2351-270ee483ce6e@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 24 Dec 2020 15:42:02 +0100
Message-ID: <CABgObfZjrwps4F5ksG=KXj3Di6DqApHU23cTBMhQtzeEA2j6_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ppc: Fix build with --without-default-devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005beac505b736d0d9"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005beac505b736d0d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why? It's all KVM.

Paolo

Il gio 24 dic 2020, 11:58 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> On 12/23/20 8:26 PM, Greg Kurz wrote:
> > Linking of the qemu-system-ppc64 fails on a POWER9 host when
> > --without-default-devices is passed to configure:
> >
> > $ ./configure --without-default-devices \
> >               --target-list=3Dppc64-softmmu && make
> >
> > ...
> >
> > libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function
> `ppce500_init_mpic_kvm':
> > /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined
> reference to `kvm_openpic_connect_vcpu'
> > libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function
> `spapr_irq_check':
> > /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefine=
d
> reference to `xics_kvm_has_broken_disconnect'
> > libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function
> `spapr_xive_post_load':
> > /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530:
> undefined reference to `kvmppc_xive_post_load'
> >
> > ... and tons of other symbols belonging to the KVM backend of the
> > openpic, XICS and XIVE interrupt controllers.
> >
> > It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
> > to depend on KVM but this has no effect when minikconf runs in
> > allnoconfig mode. Such reverse dependencies should rather be
> > handled with a 'select' statement, eg.
> >
> > config OPENPIC
> >     select OPENPIC_KVM if KVM
> >
> > or even better by getting rid of the intermediate _KVM config
> > and directly checking CONFIG_KVM in the meson.build file:
> >
> > specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> >               if_true: files('openpic_kvm.c'))
> >
> > Go for the latter with OPENPIC, XICS and XIVE. While here also move
> > XIVE_SPAPR to hw/intc/Kconfig where it belongs.
> >
> > This went unnoticed so far because CI doesn't test the build with
> > --without-default-devices and KVM enabled on a POWER host.
> >
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> > v2: - check CONFIG_KVM in the meson.build as suggested by Paolo
> > ---
> >  hw/intc/Kconfig     |   14 +++++---------
> >  hw/intc/meson.build |    9 ++++++---
> >  hw/ppc/Kconfig      |   15 ---------------
> >  3 files changed, 11 insertions(+), 27 deletions(-)
> >
> > diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> > index 468d548ca771..ee60d4bf7857 100644
> > --- a/hw/intc/Kconfig
> > +++ b/hw/intc/Kconfig
> > @@ -30,23 +30,19 @@ config ARM_GIC_KVM
> >      default y
> >      depends on ARM_GIC && KVM
> >
> > -config OPENPIC_KVM
> > -    bool
> > -    default y
> > -    depends on OPENPIC && KVM
> > -
> >  config XICS
> >      bool
> > -    depends on POWERNV || PSERIES
> >
> >  config XICS_SPAPR
> >      bool
> >      select XICS
> >
> > -config XICS_KVM
> > +config XIVE
> >      bool
> > -    default y
> > -    depends on XICS && KVM
> > +
> > +config XIVE_SPAPR
> > +    bool
> > +    select XIVE
> >
> >  config ALLWINNER_A10_PIC
> >      bool
> > diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> > index 68da782ad2c5..b6c9218908e3 100644
> > --- a/hw/intc/meson.build
> > +++ b/hw/intc/meson.build
> > @@ -39,7 +39,8 @@ specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC',
> if_true: files('loongson_lioint
> >  specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
> >  specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
> >  specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
> > -specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true:
> files('openpic_kvm.c'))
> > +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> > +             if_true: files('openpic_kvm.c'))
> >  specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c',
> 'pnv_xive.c'))
> >  specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
> >  specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c',
> 'bcm2836_control.c'))
> > @@ -50,8 +51,10 @@ specific_ss.add(when: 'CONFIG_SH4', if_true:
> files('sh_intc.c'))
> >  specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true:
> files('sifive_clint.c'))
> >  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true:
> files('sifive_plic.c'))
> >  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> > -specific_ss.add(when: 'CONFIG_XICS_KVM', if_true: files('xics_kvm.c'))
> > +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> > +             if_true: files('xics_kvm.c'))
> >  specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true:
> files('xics_spapr.c'))
> >  specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
> > -specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true:
> files('spapr_xive_kvm.c'))
> > +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
> > +             if_true: files('spapr_xive_kvm.c'))
> >  specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true:
> files('spapr_xive.c'))
> > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > index 982d55f5875c..064bd6edd83d 100644
> > --- a/hw/ppc/Kconfig
> > +++ b/hw/ppc/Kconfig
> > @@ -129,21 +129,6 @@ config VIRTEX
> >      select XILINX_ETHLITE
> >      select FDT_PPC
> >
> > -config XIVE
> > -    bool
> > -    depends on POWERNV || PSERIES
> > -
> > -config XIVE_SPAPR
> > -    bool
> > -    default y
> > -    depends on PSERIES
> > -    select XIVE
> > -
> > -config XIVE_KVM
> > -    bool
> > -    default y
> > -    depends on XIVE_SPAPR && KVM
> > -
>
> Is it possible to split this patch in 2: XICS, XIVE (or 3: same + OPENPIC=
)?
>
>

--0000000000005beac505b736d0d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why? It&#39;s all KVM.<div dir=3D"auto"><br></div><div di=
r=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Il gio 24 dic 2020, 11:58 Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; ha scritto:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On 12/23/20 8:26 PM, Greg Kurz wro=
te:<br>
&gt; Linking of the qemu-system-ppc64 fails on a POWER9 host when<br>
&gt; --without-default-devices is passed to configure:<br>
&gt; <br>
&gt; $ ./configure --without-default-devices \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--target-list=3D=
ppc64-softmmu &amp;&amp; make<br>
&gt; <br>
&gt; ...<br>
&gt; <br>
&gt; libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_=
mpic_kvm&#39;:<br>
&gt; /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined re=
ference to `kvm_openpic_connect_vcpu&#39;<br>
&gt; libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_ir=
q_check&#39;:<br>
&gt; /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefin=
ed reference to `xics_kvm_has_broken_disconnect&#39;<br>
&gt; libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_=
xive_post_load&#39;:<br>
&gt; /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undef=
ined reference to `kvmppc_xive_post_load&#39;<br>
&gt; <br>
&gt; ... and tons of other symbols belonging to the KVM backend of the<br>
&gt; openpic, XICS and XIVE interrupt controllers.<br>
&gt; <br>
&gt; It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked<br>
&gt; to depend on KVM but this has no effect when minikconf runs in<br>
&gt; allnoconfig mode. Such reverse dependencies should rather be<br>
&gt; handled with a &#39;select&#39; statement, eg.<br>
&gt; <br>
&gt; config OPENPIC<br>
&gt;=C2=A0 =C2=A0 =C2=A0select OPENPIC_KVM if KVM<br>
&gt; <br>
&gt; or even better by getting rid of the intermediate _KVM config<br>
&gt; and directly checking CONFIG_KVM in the meson.build file:<br>
&gt; <br>
&gt; specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;CONFIG_OPENPIC&#39;]=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: files(&=
#39;openpic_kvm.c&#39;))<br>
&gt; <br>
&gt; Go for the latter with OPENPIC, XICS and XIVE. While here also move<br=
>
&gt; XIVE_SPAPR to hw/intc/Kconfig where it belongs.<br>
&gt; <br>
&gt; This went unnoticed so far because CI doesn&#39;t test the build with<=
br>
&gt; --without-default-devices and KVM enabled on a POWER host.<br>
&gt; <br>
&gt; Signed-off-by: Greg Kurz &lt;<a href=3D"mailto:groug@kaod.org" target=
=3D"_blank" rel=3D"noreferrer">groug@kaod.org</a>&gt;<br>
&gt; ---<br>
&gt; v2: - check CONFIG_KVM in the meson.build as suggested by Paolo<br>
&gt; ---<br>
&gt;=C2=A0 hw/intc/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +++++-------=
--<br>
&gt;=C2=A0 hw/intc/meson.build |=C2=A0 =C2=A0 9 ++++++---<br>
&gt;=C2=A0 hw/ppc/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A015 ------------=
---<br>
&gt;=C2=A0 3 files changed, 11 insertions(+), 27 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig<br>
&gt; index 468d548ca771..ee60d4bf7857 100644<br>
&gt; --- a/hw/intc/Kconfig<br>
&gt; +++ b/hw/intc/Kconfig<br>
&gt; @@ -30,23 +30,19 @@ config ARM_GIC_KVM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default y<br>
&gt;=C2=A0 =C2=A0 =C2=A0 depends on ARM_GIC &amp;&amp; KVM<br>
&gt;=C2=A0 <br>
&gt; -config OPENPIC_KVM<br>
&gt; -=C2=A0 =C2=A0 bool<br>
&gt; -=C2=A0 =C2=A0 default y<br>
&gt; -=C2=A0 =C2=A0 depends on OPENPIC &amp;&amp; KVM<br>
&gt; -<br>
&gt;=C2=A0 config XICS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; -=C2=A0 =C2=A0 depends on POWERNV || PSERIES<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config XICS_SPAPR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select XICS<br>
&gt;=C2=A0 <br>
&gt; -config XICS_KVM<br>
&gt; +config XIVE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; -=C2=A0 =C2=A0 default y<br>
&gt; -=C2=A0 =C2=A0 depends on XICS &amp;&amp; KVM<br>
&gt; +<br>
&gt; +config XIVE_SPAPR<br>
&gt; +=C2=A0 =C2=A0 bool<br>
&gt; +=C2=A0 =C2=A0 select XIVE<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config ALLWINNER_A10_PIC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; diff --git a/hw/intc/meson.build b/hw/intc/meson.build<br>
&gt; index 68da782ad2c5..b6c9218908e3 100644<br>
&gt; --- a/hw/intc/meson.build<br>
&gt; +++ b/hw/intc/meson.build<br>
&gt; @@ -39,7 +39,8 @@ specific_ss.add(when: &#39;CONFIG_LOONGSON_LIOINTC&#=
39;, if_true: files(&#39;loongson_lioint<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_MIPS_CPS&#39;, if_true: files(=
&#39;mips_gic.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_OMAP&#39;, if_true: files(&#39=
;omap_intc.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_OMPIC&#39;, if_true: files(&#3=
9;ompic.c&#39;))<br>
&gt; -specific_ss.add(when: &#39;CONFIG_OPENPIC_KVM&#39;, if_true: files(&#=
39;openpic_kvm.c&#39;))<br>
&gt; +specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;CONFIG_OPENPIC&#39;=
],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: files(&#39;o=
penpic_kvm.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_POWERNV&#39;, if_true: files(&=
#39;xics_pnv.c&#39;, &#39;pnv_xive.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_PPC_UIC&#39;, if_true: files(&=
#39;ppc-uic.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_RASPI&#39;, if_true: files(&#3=
9;bcm2835_ic.c&#39;, &#39;bcm2836_control.c&#39;))<br>
&gt; @@ -50,8 +51,10 @@ specific_ss.add(when: &#39;CONFIG_SH4&#39;, if_true=
: files(&#39;sh_intc.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_SIFIVE_CLINT&#39;, if_true: fi=
les(&#39;sifive_clint.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_SIFIVE_PLIC&#39;, if_true: fil=
es(&#39;sifive_plic.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_XICS&#39;, if_true: files(&#39=
;xics.c&#39;))<br>
&gt; -specific_ss.add(when: &#39;CONFIG_XICS_KVM&#39;, if_true: files(&#39;=
xics_kvm.c&#39;))<br>
&gt; +specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;CONFIG_XICS&#39;],<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: files(&#39;x=
ics_kvm.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_XICS_SPAPR&#39;, if_true: file=
s(&#39;xics_spapr.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_XIVE&#39;, if_true: files(&#39=
;xive.c&#39;))<br>
&gt; -specific_ss.add(when: &#39;CONFIG_XIVE_KVM&#39;, if_true: files(&#39;=
spapr_xive_kvm.c&#39;))<br>
&gt; +specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;CONFIG_XIVE&#39;],<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: files(&#39;s=
papr_xive_kvm.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_XIVE_SPAPR&#39;, if_true: file=
s(&#39;spapr_xive.c&#39;))<br>
&gt; diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig<br>
&gt; index 982d55f5875c..064bd6edd83d 100644<br>
&gt; --- a/hw/ppc/Kconfig<br>
&gt; +++ b/hw/ppc/Kconfig<br>
&gt; @@ -129,21 +129,6 @@ config VIRTEX<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select XILINX_ETHLITE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select FDT_PPC<br>
&gt;=C2=A0 <br>
&gt; -config XIVE<br>
&gt; -=C2=A0 =C2=A0 bool<br>
&gt; -=C2=A0 =C2=A0 depends on POWERNV || PSERIES<br>
&gt; -<br>
&gt; -config XIVE_SPAPR<br>
&gt; -=C2=A0 =C2=A0 bool<br>
&gt; -=C2=A0 =C2=A0 default y<br>
&gt; -=C2=A0 =C2=A0 depends on PSERIES<br>
&gt; -=C2=A0 =C2=A0 select XIVE<br>
&gt; -<br>
&gt; -config XIVE_KVM<br>
&gt; -=C2=A0 =C2=A0 bool<br>
&gt; -=C2=A0 =C2=A0 default y<br>
&gt; -=C2=A0 =C2=A0 depends on XIVE_SPAPR &amp;&amp; KVM<br>
&gt; -<br>
<br>
Is it possible to split this patch in 2: XICS, XIVE (or 3: same + OPENPIC)?=
<br>
<br>
</blockquote></div>

--0000000000005beac505b736d0d9--


