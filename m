Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B64DDAC0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:42:59 +0100 (CET)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCsc-00054t-7C
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:42:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVCdl-00063O-0p
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:27:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVCdg-0002v6-NB
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647610049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zIpS5fV8hR/B2l/McxrDw7J4k/h/ng1DXHbqJvwLx4=;
 b=aln6/K34DqErwsYBSf/KtiwtT0QILsZhhe3+7ke1A0aavYJBgg8QiaUJllHim3M8pTSaSV
 nIdRt4wBiyFhKwq8PqU9JKvkwOkLaHGrmZarhA/Th2RerkCS977s7rUkSaCsjFVC2GYf3q
 CsTFMapEa89K9aDggcEapPUxw6KQ2+M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-2CFgFfhiNQeeMzJKcFg-Rw-1; Fri, 18 Mar 2022 09:27:27 -0400
X-MC-Unique: 2CFgFfhiNQeeMzJKcFg-Rw-1
Received: by mail-ed1-f71.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so4904746edb.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zIpS5fV8hR/B2l/McxrDw7J4k/h/ng1DXHbqJvwLx4=;
 b=3LFnsu5YUkzjDVM++9I48m5vUW0W2OMYquxxpzDIUu/Mg/P02sjfsR4Iywh+m9Yf4q
 +ZEJcXxVngQvxY3yCt0PTli/Kz0Gwkc+3veJW3ilNAj4+qybm6IcQRl0sdItx0C1cLjV
 7Q4Ruh9YmCLGCxPa2MSxMJ4tCJFF3czpKZDQAakV+pIgGKbaMer3mi8AZDHeMKjNUx/C
 ZVhEvLpGPhrslwIPiJfoX8F4GwNCS1IhiOcJUSieQDHT6sI2YT4eXljhVQEsQDC2v7Gx
 pUWUWrJWMi/mN5a3crN8oOCHhxF23mS7HqJUBrtpFm2UD7xNpcWrcg3be55uAyhbf8JW
 kWyw==
X-Gm-Message-State: AOAM532uOEV6QBVrErTSQbHq+M/G3hdxNTOixEsKzPS49MMqyaSgIEDk
 TUWFBrQvj5Ofar3vZ+Ffd9u13mkua08Y7Y81YzsMjMquKertLsBh5x+jJjdFiY53uS6LCM/mif3
 GCH1dG4zjzbmNmrs=
X-Received: by 2002:a17:907:b590:b0:6cf:48a4:9a4c with SMTP id
 qx16-20020a170907b59000b006cf48a49a4cmr8779181ejc.6.1647610046520; 
 Fri, 18 Mar 2022 06:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK0fwndVh0doZrYBszhzTRVwJSpgWuTtL0My42LzhUZ2OG2h1NdPXIrHlTZ+eRCqlIHlH+pw==
X-Received: by 2002:a17:907:b590:b0:6cf:48a4:9a4c with SMTP id
 qx16-20020a170907b59000b006cf48a49a4cmr8779160ejc.6.1647610046216; 
 Fri, 18 Mar 2022 06:27:26 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm3740513ejc.99.2022.03.18.06.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:27:25 -0700 (PDT)
Date: Fri, 18 Mar 2022 14:27:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 1/3] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220318142723.142157c3@redhat.com>
In-Reply-To: <5aea5611-0987-68cd-58d3-8ae53ec641e8@huawei.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-2-gshan@redhat.com>
 <e894fe3a-a50e-f47f-773d-d859bc240923@huawei.com>
 <20220318105656.67696eb8@redhat.com>
 <5aea5611-0987-68cd-58d3-8ae53ec641e8@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, zhenyzha@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 21:00:35 +0800
"wangyanan (Y)" <wangyanan55@huawei.com> wrote:

> On 2022/3/18 17:56, Igor Mammedov wrote:
> > On Fri, 18 Mar 2022 14:23:34 +0800
> > "wangyanan (Y)" <wangyanan55@huawei.com> wrote:
> > =20
> >> Hi Gavin,
> >>
> >> On 2022/3/3 11:11, Gavin Shan wrote: =20
> >>> The default CPU-to-NUMA association is given by mc->get_default_cpu_n=
ode_id()
> >>> when it isn't provided explicitly. However, the CPU topology isn't fu=
lly
> >>> considered in the default association and it causes CPU topology brok=
en
> >>> warnings on booting Linux guest.
> >>>
> >>> For example, the following warning messages are observed when the Lin=
ux guest
> >>> is booted with the following command lines.
> >>>
> >>>     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
> >>>     -accel kvm -machine virt,gic-version=3Dhost               \
> >>>     -cpu host                                               \
> >>>     -smp 6,sockets=3D2,cores=3D3,threads=3D1                      \
> >>>     -m 1024M,slots=3D16,maxmem=3D64G                            \
> >>>     -object memory-backend-ram,id=3Dmem0,size=3D128M            \
> >>>     -object memory-backend-ram,id=3Dmem1,size=3D128M            \
> >>>     -object memory-backend-ram,id=3Dmem2,size=3D128M            \
> >>>     -object memory-backend-ram,id=3Dmem3,size=3D128M            \
> >>>     -object memory-backend-ram,id=3Dmem4,size=3D128M            \
> >>>     -object memory-backend-ram,id=3Dmem4,size=3D384M            \
> >>>     -numa node,nodeid=3D0,memdev=3Dmem0                         \
> >>>     -numa node,nodeid=3D1,memdev=3Dmem1                         \
> >>>     -numa node,nodeid=3D2,memdev=3Dmem2                         \
> >>>     -numa node,nodeid=3D3,memdev=3Dmem3                         \
> >>>     -numa node,nodeid=3D4,memdev=3Dmem4                         \
> >>>     -numa node,nodeid=3D5,memdev=3Dmem5
> >>>            :
> >>>     alternatives: patching kernel code
> >>>     BUG: arch topology borken
> >>>     the CLS domain not a subset of the MC domain
> >>>     <the above error log repeats>
> >>>     BUG: arch topology borken
> >>>     the DIE domain not a subset of the NODE domain
> >>>
> >>> With current implementation of mc->get_default_cpu_node_id(), CPU#0 t=
o CPU#5
> >>> are associated with NODE#0 to NODE#5 separately. That's incorrect bec=
ause
> >>> CPU#0/1/2 should be associated with same NUMA node because they're se=
ated
> >>> in same socket.
> >>>
> >>> This fixes the issue by populating the CPU topology in virt_possible_=
cpu_arch_ids()
> >>> and considering the socket index when default CPU-to-NUMA association=
 is given
> >>> in virt_possible_cpu_arch_ids(). With this applied, no more CPU topol=
ogy broken
> >>> warnings are seen from the Linux guest. The 6 CPUs are associated wit=
h NODE#0/1,
> >>> but there are no CPUs associated with NODE#2/3/4/5. =20
> >> It may be better to split this patch into two. One extends
> >> virt_possible_cpu_arch_ids,
> >> and the other fixes the numa node ID issue. =20
> >>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>> ---
> >>>    hw/arm/virt.c | 17 ++++++++++++++++-
> >>>    1 file changed, 16 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>> index 46bf7ceddf..dee02b60fc 100644
> >>> --- a/hw/arm/virt.c
> >>> +++ b/hw/arm/virt.c
> >>> @@ -2488,7 +2488,9 @@ virt_cpu_index_to_props(MachineState *ms, unsig=
ned cpu_index)
> >>>   =20
> >>>    static int64_t virt_get_default_cpu_node_id(const MachineState *ms=
, int idx)
> >>>    {
> >>> -    return idx % ms->numa_state->num_nodes;
> >>> +    int64_t socket_id =3D ms->possible_cpus->cpus[idx].props.socket_=
id;
> >>> +
> >>> +    return socket_id % ms->numa_state->num_nodes;
> >>>    }
> >>>   =20
> >>>    static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineStat=
e *ms)
> >>> @@ -2496,6 +2498,7 @@ static const CPUArchIdList *virt_possible_cpu_a=
rch_ids(MachineState *ms)
> >>>        int n;
> >>>        unsigned int max_cpus =3D ms->smp.max_cpus;
> >>>        VirtMachineState *vms =3D VIRT_MACHINE(ms);
> >>> +    MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >>>   =20
> >>>        if (ms->possible_cpus) {
> >>>            assert(ms->possible_cpus->len =3D=3D max_cpus);
> >>> @@ -2509,6 +2512,18 @@ static const CPUArchIdList *virt_possible_cpu_=
arch_ids(MachineState *ms)
> >>>            ms->possible_cpus->cpus[n].type =3D ms->cpu_type;
> >>>            ms->possible_cpus->cpus[n].arch_id =3D
> >>>                virt_cpu_mp_affinity(vms, n);
> >>> +
> >>> +        ms->possible_cpus->cpus[n].props.has_socket_id =3D true;
> >>> +        ms->possible_cpus->cpus[n].props.socket_id =3D
> >>> +            n / (ms->smp.dies * ms->smp.clusters *
> >>> +                ms->smp.cores * ms->smp.threads);
> >>> +        if (mc->smp_props.dies_supported) {
> >>> +            ms->possible_cpus->cpus[n].props.has_die_id =3D true;
> >>> +            ms->possible_cpus->cpus[n].props.die_id =3D
> >>> +                n / (ms->smp.clusters * ms->smp.cores * ms->smp.thre=
ads);
> >>> +        } =20
> >> I still don't think we need to consider dies if it's certainly not
> >> supported yet, IOW, we will never come into the if-branch.
> >> We are populating arm-specific topo info instead of the generic,
> >> we can probably uniformly update this part together with other
> >> necessary places when we decide to support dies for arm virt
> >> machine in the future. :) =20
> > it seems we do support dies and they are supposed to be numa boundary t=
oo,
> > so perhaps we should account for it when generating node-id. =20
> Sorry, I actually meant that we currently don't support dies for arm, so=
=20
> that
> we will always have "mc->smp_props.dies_supported =3D=3D False" here, whi=
ch
> makes the code a bit unnecessary.=C2=A0 dies are only supported for x86 f=
or=20
> now. :)
>=20

then perhaps add an assert() here, so that we would notice and fix this
place when dies_supported becomes true.

> Thanks,
> Yanan
> >>> +        ms->possible_cpus->cpus[n].props.has_core_id =3D true;
> >>> +        ms->possible_cpus->cpus[n].props.core_id =3D n / ms->smp.thr=
eads;
> >>>            ms->possible_cpus->cpus[n].props.has_thread_id =3D true;
> >>>            ms->possible_cpus->cpus[n].props.thread_id =3D n;
> >>>        } =20
> >> Maybe we should use the same algorithm in x86_topo_ids_from_idx
> >> to populate the IDs, so that scope of socket-id will be [0, total_sock=
ets),
> >> scope of thread-id is [0, threads_per_core), and so on. Then with a
> >> group of socket/cluster/core/thread-id, we determine a CPU.
> >>
> >> Suggestion: For the long term, is it necessary now to add similar topo
> >> info infrastructure for ARM, such as X86CPUTopoInfo, X86CPUTopoIDs,
> >> x86_topo_ids_from_idx?
> >>
> >> Thanks,
> >> Yanan
> >> =20
> > . =20
>=20


