Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FA4C68EC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 11:55:45 +0100 (CET)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOdgs-0004Go-LW
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 05:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOdfR-0003KM-Qg
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:54:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOdfO-0004KP-7X
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646045648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pF2ylNuzDNRNv55jFhB/lT+va8EFYs47M1RgrwLYWEY=;
 b=fKzSFmwmaziY5kRjXbywAD4EmOuXmcrlLGNvhIhO7puSYzouHySph8uJxMSXWn+v6raVer
 edGqxFpsynfSaOxZ3756koOr4V0vdMkyI9nibwY57xAGUoUJV7KWSdZ202qoOBr9TneSc2
 ZxxBoK671Nm2Lmr7LaO4UO4GZtKt7GU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-cX0Rx0yTNfmJQNq-qTBX2A-1; Mon, 28 Feb 2022 05:54:07 -0500
X-MC-Unique: cX0Rx0yTNfmJQNq-qTBX2A-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso5644004edh.6
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 02:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pF2ylNuzDNRNv55jFhB/lT+va8EFYs47M1RgrwLYWEY=;
 b=eyXvyc2sPlLa0lLTNUYFFebC1IDFmB+GyDFprR5HQIZSwyEEO6Uzg28F/71L1pbjEY
 SqWmNSU52O6yxwHby3i2r4UD8rd9jmkAiMHa4usGXTFR422R7a0Ob6C0N+aGfF22/ZCH
 wuKI3C7v6c/86bzfrl1vFLdCHd0PcRb8ENgYfeAnq1uip9ocK+dZPBQw8SLyWFhwtnCV
 euaHLbPJuUjvwx5bzDhcyiuxL7CPc4l+Z6A9241DuMywL++XTTGmlwzr8UAYhqehK3an
 hFc0nWnSIHXxnppoFn7saw9VRBit5RkWjZaGZP592C+OG1/JxZ8nV9unjjRM8ZPhIDhE
 +vHg==
X-Gm-Message-State: AOAM530PW1mICa4b89PsrrEEHwNkML3eGKIg6igQRz1UFgT6t9SWIZaU
 ukxPoI6T2qw0IJUJLz9rS5g7df4o54M14lTHvmMbbPcoQPKM0u1hAHuK41w9/eLjF2awcOh5aLj
 gF2mCG2XV7y1ypug=
X-Received: by 2002:a05:6402:424b:b0:410:92aa:30b1 with SMTP id
 g11-20020a056402424b00b0041092aa30b1mr18483264edb.297.1646045645735; 
 Mon, 28 Feb 2022 02:54:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhf4vZ7ZTGFUFA72Yr5vJqWdN8imw6GTKjIxcNz318tYUfzWC6lM8j8r6beLW+ULgCd9HgSA==
X-Received: by 2002:a05:6402:424b:b0:410:92aa:30b1 with SMTP id
 g11-20020a056402424b00b0041092aa30b1mr18483246edb.297.1646045645455; 
 Mon, 28 Feb 2022 02:54:05 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a056402028100b0040f682ee13dsm5862436edv.26.2022.02.28.02.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 02:54:04 -0800 (PST)
Date: Mon, 28 Feb 2022 11:54:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220228115403.03e14446@redhat.com>
In-Reply-To: <6a520e47-e3ad-13a1-89f1-8d4213fb944a@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
 <aa22b9ba-6b5a-a728-870d-e5efbea67c5d@redhat.com>
 <211c23f8-b5bd-219d-e584-20a0b700919d@redhat.com>
 <20220225110306.6c3e97a1@redhat.com>
 <6a520e47-e3ad-13a1-89f1-8d4213fb944a@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 12:26:53 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
>=20
> On 2/25/22 6:03 PM, Igor Mammedov wrote:
> > On Fri, 25 Feb 2022 16:41:43 +0800
> > Gavin Shan <gshan@redhat.com> wrote: =20
> >> On 2/17/22 10:14 AM, Gavin Shan wrote: =20
> >>> On 1/26/22 5:14 PM, Igor Mammedov wrote: =20
> >>>> On Wed, 26 Jan 2022 13:24:10 +0800
> >>>> Gavin Shan <gshan@redhat.com> wrote:
> >>>>    =20
> >>>>> The default CPU-to-NUMA association is given by mc->get_default_cpu=
_node_id()
> >>>>> when it isn't provided explicitly. However, the CPU topology isn't =
fully
> >>>>> considered in the default association and it causes CPU topology br=
oken
> >>>>> warnings on booting Linux guest.
> >>>>>
> >>>>> For example, the following warning messages are observed when the L=
inux guest
> >>>>> is booted with the following command lines.
> >>>>>
> >>>>>  =C2=A0=C2=A0 /home/gavin/sandbox/qemu.main/build/qemu-system-aarch=
64 \
> >>>>>  =C2=A0=C2=A0 -accel kvm -machine virt,gic-version=3Dhost=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> >>>>>  =C2=A0=C2=A0 -cpu host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -smp 6,sockets=3D2,cores=3D3,threads=3D1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -m 1024M,slots=3D16,maxmem=3D64G=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem0,size=3D128M=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem1,size=3D128M=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem2,size=3D128M=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem3,size=3D128M=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem4,size=3D128M=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -object memory-backend-ram,id=3Dmem4,size=3D384M=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -numa node,nodeid=3D0,memdev=3Dmem0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -numa node,nodeid=3D1,memdev=3Dmem1=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -numa node,nodeid=3D2,memdev=3Dmem2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -numa node,nodeid=3D3,memdev=3Dmem3=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -numa node,nodeid=3D4,memdev=3Dmem4=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> >>>>>  =C2=A0=C2=A0 -numa node,nodeid=3D5,memdev=3Dmem5
> >>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
> >>>>>  =C2=A0=C2=A0 alternatives: patching kernel code
> >>>>>  =C2=A0=C2=A0 BUG: arch topology borken
> >>>>>  =C2=A0=C2=A0 the CLS domain not a subset of the MC domain
> >>>>>  =C2=A0=C2=A0 <the above error log repeats>
> >>>>>  =C2=A0=C2=A0 BUG: arch topology borken
> >>>>>  =C2=A0=C2=A0 the DIE domain not a subset of the NODE domain
> >>>>>
> >>>>> With current implementation of mc->get_default_cpu_node_id(), CPU#0=
 to CPU#5
> >>>>> are associated with NODE#0 to NODE#5 separately. That's incorrect b=
ecause
> >>>>> CPU#0/1/2 should be associated with same NUMA node because they're =
seated
> >>>>> in same socket.
> >>>>>
> >>>>> This fixes the issue by considering the socket when default CPU-to-=
NUMA
> >>>>> is given. With this applied, no more CPU topology broken warnings a=
re seen
> >>>>> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but =
there are
> >>>>> no CPUs associated with NODE#2/3/4/5. =20
> >>>>    =20
> >>>>>  From migration point of view it looks fine to me, and doesn't need=
 a compat knob =20
> >>>> since NUMA data (on virt-arm) only used to construct ACPI tables (an=
d we don't
> >>>> version those unless something is broken by it).
> >>>>
> >>>>    =20
> >>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>>> ---
> >>>>>  =C2=A0 hw/arm/virt.c | 2 +-
> >>>>>  =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>>> index 141350bf21..b4a95522d3 100644
> >>>>> --- a/hw/arm/virt.c
> >>>>> +++ b/hw/arm/virt.c
> >>>>> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, uns=
igned cpu_index)
> >>>>>  =C2=A0 static int64_t virt_get_default_cpu_node_id(const MachineSt=
ate *ms, int idx)
> >>>>>  =C2=A0 {
> >>>>> -=C2=A0=C2=A0=C2=A0 return idx % ms->numa_state->num_nodes;
> >>>>> +=C2=A0=C2=A0=C2=A0 return idx / (ms->smp.dies * ms->smp.clusters *=
 ms->smp.cores * ms->smp.threads); =20
> >>>>
> >>>> I'd like for ARM folks to confirm whether above is correct
> >>>> (i.e. socket is NUMA node boundary and also if above topo vars
> >>>> could have odd values. Don't look at horribly complicated x86
> >>>> as example, but it showed that vendors could stash pretty much
> >>>> anything there, so we should consider it here as well and maybe
> >>>> forbid that in smp virt-arm parser)
> >>>>    =20
> >>>
> >>> After doing some investigation, I don't think the socket is NUMA node=
 boundary.
> >>> Unfortunately, I didn't find it's documented like this in any documen=
ts after
> >>> checking device-tree specification, Linux CPU topology and NUMA bindi=
ng documents.
> >>>
> >>> However, there are two options here according to Linux (guest) kernel=
 code:
> >>> (A) socket is NUMA node boundary=C2=A0 (B) CPU die is NUMA node bound=
ary. They are
> >>> equivalent as CPU die isn't supported on arm/virt machine. Besides, t=
he topology
> >>> of one-to-one association between socket and NUMA node sounds natural=
 and simplified.
> >>> So I think (A) is the best way to go.
> >>>
> >>> Another thing I want to explain here is how the changes affect the me=
mory
> >>> allocation in Linux guest. Taking the command lines included in the c=
ommit
> >>> log as an example, the first two NUMA nodes are bound to CPUs while t=
he other
> >>> 4 NUMA nodes are regarded as remote NUMA nodes to CPUs. The remote NU=
MA node
> >>> won't accommodate the memory allocation until the memory in the near =
(local)
> >>> NUMA node becomes exhausted. However, it's uncertain how the memory i=
s hosted
> >>> if memory binding isn't applied.
> >>>
> >>> Besides, I think the code should be improved like below to avoid over=
flow on
> >>> ms->numa_state->num_nodes.
> >>>
> >>>   =C2=A0static int64_t virt_get_default_cpu_node_id(const MachineStat=
e *ms, int idx)
> >>>   =C2=A0{
> >>> -=C2=A0=C2=A0=C2=A0 return idx % ms->numa_state->num_nodes;
> >>> +=C2=A0=C2=A0=C2=A0 int node_idx;
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0 node_idx =3D idx / (ms->smp.dies * ms->smp.cluste=
rs * ms->smp.cores * ms->smp.threads);
> >>> +=C2=A0=C2=A0=C2=A0 return node_idx % ms->numa_state->num_nodes; =20
> >=20
> > using idx directly to deduce node looks a bit iffy
> > take x86_get_default_cpu_node_id() as an example,
> > it translates it uses idx to pick arch_id (APIC ID)
> > which has topology encoded into it and than translates
> > that to node boundary (pkg_id -> socket)
> >=20
> > Probably the same should happen here.
> >=20
> > PS:
> > may be a little on tangent to the topic but chunk above
> > mentions dies/clusters/cores/threads as possible attributes
> > for CPUs but virt_possible_cpu_arch_ids() says that only
> > has_thread_id =3D true
> > are supported, which looks broken to me.
> >  =20
>=20
> The x86's APIC ID, where the CPU topology is encoded, is something
> ideal for arm/virt to follow here. With CPU topology embedded to
> struct CPUArchId::arch_id, lots of ACPI tables like MADT, SRAT, PPTT
> needs the corresponding update to expose it through "ACPI Processor UID"
> field in those ACPI tables. It's much more than what we want to fix
> the issue here because I don't see additional benefits to do it.
>
> Besides, the package or socket index is exactly determined by 'idx'
> on arm/virt. The CPU topology is exposed through ACPI PPTT, depending on
> ms->smp. The threads/cores/clusters/dies in the struct determines
> the indexes of threads ('idx') who belongs to the same socket.
>=20
> Yes, the information maintained in ms->possible_cpus->cpu[i].props
> is inconsistent to ms->smp. It means ms->possible_cpus->cpu[i].props.thre=
ad_id
> is "CPU index" or "vcpu index", not "thread ID". Other fields like
> sockets/dies/clusters/cores in ms->possible_cpus->cpu[i].props are
> never used on arm/virt. However, the code changes included in this
> patch to fix the broken CPU topology issue is still correct, or we
> can enhance it like below in case 'has_socket_id' contains the correct
> information in the future.
>=20
> static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int i=
dx)
> {
> -    return idx % ms->numa_state->num_nodes;
> +    int socket_id;
> +
> +    if (ms->possible_cpus->cpus[idx].props.has_socket_id) {
> +        socket_id =3D ms->possible_cpus->cpus[idx].props.socket_id;
> +    } else {
> +        socket_id =3D idx / (ms->smp.dies * ms->smp.clusters * ms->smp.c=
ores * ms->smp.threads);
> +    }
> +
> +    return socket_id % ms->numa_state->num_nodes;
> }

All of above points out, that we already have a bunch of scattered code
that calculates topology in its own way every time.
Piling more code duplication on top of that while generic way to do it
exists, doesn't improve things at all. It just put burden of cleaning
up after you on someone else.
If it were the last day security/regression fix, it might be fine but
as it is, the issue could be fixed in systematic way without adding
more duplication.

So if you are reluctant to fix all already existing code, as minimum
one could fix virt_possible_cpu_arch_ids() to initialize all current
supported topology metadata once and then use it in
virt_get_default_cpu_node_id() instead of old/new mix above.
Cleanup of other places can be done incrementally by follow up patches.


> >>>   =C2=A0}
> >>>
> >>>     =20
> >>>>>  =C2=A0 }
> >>>>>  =C2=A0 static const CPUArchIdList *virt_possible_cpu_arch_ids(Mach=
ineState *ms) =20
> >>>>    =20
>=20
> Thanks,
> Gavin
>=20


