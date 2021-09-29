Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067C41C155
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:09:58 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVbB-0006Xh-DM
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mVVX3-0003or-Bj
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mVVX0-0002yS-IO
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWpIqOHdtmXLgudD3fUXdGhLXEWAnDYOxkyUmK2dH/o=;
 b=eQ05Lv04fJ5Pbg6unW4esErvs+R7md1bxYCh5yi5BzG04/Kc9rcHbz7HRRAHB3YupBxg2n
 VOQ6f0MI7gGVddnOodej8H51SB7Of+CP714XaEdc/+DzIyzv9r59e6A5EJGpBvIBu2QakT
 Iks5hTg99ALb4FRvkcPa6s6S7Ls7yeQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-GIgOKPCrP1a2hKdA2DLE-A-1; Wed, 29 Sep 2021 05:05:35 -0400
X-MC-Unique: GIgOKPCrP1a2hKdA2DLE-A-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso1655173edj.20
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 02:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nu7eweULHSagHSId0LWqG5awQwbbqpMDS/1ms6BRtHQ=;
 b=mR9Di2RJOm0o9VqdE426+UC6XacQpk1Kg3dGIb5J8n0yFWOE5QpcGJ3o7Iy5hWLhZw
 AYqVc4/QQXuL+1KC9yLBAG4wzdMh7UkCGKAiho7xyY/oFne27RJog/M1VcyK98Gf1KOI
 CzVHsei/Ln62aSZ6ozwlfKG+l+hb9z9ECta+vu/d8Lg0bb11HTT6sfafeyCzeR8/y+DB
 6WeWaukicrmW3p/Di2Cl46phjI60QHoKzAdWcPjNStgwFufbQ2CsOjVz8kaSq88h0tj/
 A5Mu2P7UoYJIg9HnkU592YTsUsNxOpEisqzzz06Tpkku4l0w8jrLcZrmm41vkibgUQcI
 Tpng==
X-Gm-Message-State: AOAM533GnZqiJb85b5aLH5cUQ+m+KEsyk9QaLwkKestDvQoFtYCcKS8N
 XzKsMEZh6pugD9mFX+QloaVT7PCLuKnVouy0ulF2bZ/o40SozaE+BYxcPaBVgA+7/90BKYZq7lp
 7z8W13kQ9cUAf/r4=
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr12268191ejk.411.1632906333768; 
 Wed, 29 Sep 2021 02:05:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfSqxMoXERenZ0LSjPz4GX96z2lKAoCTss2JxFLfrpBQcY8duARYcl4ViO0XmHkrl3B4d1ow==
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr12268165ejk.411.1632906333520; 
 Wed, 29 Sep 2021 02:05:33 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u4sm974211ejc.19.2021.09.29.02.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 02:05:33 -0700 (PDT)
Date: Wed, 29 Sep 2021 11:05:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Nan Wang <wangnan.light@bytedance.com>
Subject: Re: [External] Re: [PATCH] hostmem: change default prealloc threads
 number
Message-ID: <20210929110531.0724f911@redhat.com>
In-Reply-To: <e1a98460-ad0a-9b9c-5958-bb39635886ec@bytedance.com>
References: <20210927131951.1810823-1-user@n248-145-203>
 <b14aebb1-489b-b15b-f9eb-047073920175@redhat.com>
 <e1a98460-ad0a-9b9c-5958-bb39635886ec@bytedance.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mikughoull@gmail.com, qemu-devel@nongnu.org, ehabkost@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Sep 2021 00:47:01 +0800
Nan Wang <wangnan.light@bytedance.com> wrote:

> On 2021/9/27 11:16, David Hildenbrand wrote:
> > On 27.09.21 15:19, Nan Wang wrote: =20
> >> From: "wangnan.light" <wangnan.light@bytedance.com>
> >>
> >> the default number of prealloc threads is 1, for huge memory backend
> >> file, single thread touch page is really slow.
> >> We can adjust thread number by prealloc-threads property, but if the
> >> default value updated to MachineState::smp::cpus may be better.
> >> For example, old version of qemu(prealloc-threads have not been
> >> introduced yet), the value of threads num is MachineState::smp::cpus,
> >> so if someone use the same commandline to start current verion of qemu
> >> and old version of qemu which will lead to different behaviors. =20
> >=20
> > The introducing patch mentions:
> >=20
> > commit ffac16fab33bb42f17e47624985220c1fd864e9d
> > Author: Igor Mammedov <imammedo@redhat.com>
> > Date:=C2=A0=C2=A0 Wed Feb 19 11:09:50 2020 -0500
> >=20
> >  =C2=A0=C2=A0=C2=A0 hostmem: introduce "prealloc-threads" property
> >=20
> >  =C2=A0=C2=A0=C2=A0 the property will allow user to specify number of t=
hreads to use
> >  =C2=A0=C2=A0=C2=A0 in pre-allocation stage. It also will allow to redu=
ce implicit
> >  =C2=A0=C2=A0=C2=A0 hostmem dependency on current_machine.
> >  =C2=A0=C2=A0=C2=A0 On object creation it will default to 1, but via ma=
chine
> >  =C2=A0=C2=A0=C2=A0 compat property it will be updated to MachineState:=
:smp::cpus
> >  =C2=A0=C2=A0=C2=A0 to keep current behavior for hostmem and main RAM (=
which is
> >  =C2=A0=C2=A0=C2=A0 now also hostmem based).
> >=20
> > So it looks like we want to do the latter via compat properties eventua=
lly.
> >=20
> > However, I'd like to note that more prealloc threads might be good for=
=20
> > large backends, and might be bad for small backends. To me, it feels=20
> > like a workload that relies on this should really do this manually. So =
I=20
> > am still not sure if this is the right thing to do. =20
> Yes, I agree with you "more prealloc threas are good for large backends,=
=20
> and bad for small backends". But I think most situation large backends=20
> always with large vcpu numbers and small backens always with small vcpu=
=20
> numbers, because most users will not create a vm with large vcpu numbers=
=20
> with small memory.
>=20
>=20
> >=20
> > Note that qapi/qom.json:
> >=20
> > "@prealloc-threads: number of CPU threads to use for prealloc (default:=
=20
> > 1", so that doc would be wrong now.
> >=20
> > Why exactly can't workload that cares not simply set this manually?=20
> > Performance tuning smells like something to be done manually for a=20
> > specific workload.
> > =20
> It is a simply way that let workload set the prealloc threads manually.=
=20
> For example, for large backends it set many prealloc threads, and set 1=
=20
> prealloc threads manually for small backends. Yes, workload can=20
> `maunally` set prealloc thread to 1, rather than use `default` value 1.
> So when workload want to(or maybe just forget specify the=20
> prealloc-threads property) use the default value, I think the=20
> MachineState::smp::cpus maybe better than 1.

as commit mentioned by David states, it creates implicit dependency
on Machine and we were working getting rid of such dependencies
where it's possible.

So if you have to change prealloc-threads to a larger number,
you can try to use specific machine compat properties to do it,
instead of pushing machine to generic backend code. But 'good'
default for your workload doesn't guaranties it's a good one
another.

My preference is that user (mgmt layer) should set property
explicitly if it cares. It's leads to more stable VM config,
as opposed to using defaults which could change over time and
unexpectedly 'regress' such VMs, and can factor in host/workload
specific nuances without need to change QEMU.


> >> Signed-off-by: wangnan.light <wangnan.light@bytedance.com>
> >> ---
> >> =C2=A0 backends/hostmem.c | 2 +-
> >> =C2=A0 hw/core/machine.c=C2=A0 | 5 +++++
> >> =C2=A0 2 files changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/backends/hostmem.c b/backends/hostmem.c
> >> index 4c05862ed5..c4a249b7e6 100644
> >> --- a/backends/hostmem.c
> >> +++ b/backends/hostmem.c
> >> @@ -273,7 +273,7 @@ static void host_memory_backend_init(Object *obj)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backend->merge =3D machine_mem_merge(ma=
chine);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backend->dump =3D machine_dump_guest_co=
re(machine);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backend->reserve =3D true;
> >> -=C2=A0=C2=A0=C2=A0 backend->prealloc_threads =3D 1;
> >> +=C2=A0=C2=A0=C2=A0 backend->prealloc_threads =3D machine_smp_cpus(mac=
hine);
> >> =C2=A0 }
> >> =C2=A0 static void host_memory_backend_post_init(Object *obj)
> >> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >> index 067f42b528..95ba5b1477 100644
> >> --- a/hw/core/machine.c
> >> +++ b/hw/core/machine.c
> >> @@ -1065,6 +1065,11 @@ bool machine_dump_guest_core(MachineState=20
> >> *machine)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return machine->dump_guest_core;
> >> =C2=A0 }
> >> +bool machine_smp_cpus(MachineState *machine)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 return machine->smp.cpus;
> >> +}
> >> +
> >> =C2=A0 bool machine_mem_merge(MachineState *machine)
> >> =C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return machine->mem_merge;
> >> =20
> >=20
> >  =20
>=20


