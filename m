Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9294DD78B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 10:58:43 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV9Na-0007H1-9p
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 05:58:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nV9M1-00060M-W9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nV9Lz-00005p-0v
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647597421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBwNtyMHlgxwVhh0Yi/Hsn6xvOHMXxnaBmeudqkztrM=;
 b=ExU1kGJuw2agwSBMs3kgXYtKuDvhwNXlwigdreViRF5NunBfNUFVQABMLfbltxo55AMAvj
 60yz/8Q/QfXnuhj2tghU5PSxcO6Y2VRcGQ+xApaovgyh1Ov4xbItYzHnYlrk0pVgExq6c/
 fWoJKSYz5LWhJ4OUlK00ZpbvMRqw1IA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-9zc_6iQHNAGDcNYZv6SRaQ-1; Fri, 18 Mar 2022 05:57:00 -0400
X-MC-Unique: 9zc_6iQHNAGDcNYZv6SRaQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c31-20020a509fa2000000b004190d43d28fso746333edf.9
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 02:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aBwNtyMHlgxwVhh0Yi/Hsn6xvOHMXxnaBmeudqkztrM=;
 b=MjC38qTvmGYF4Krd+rqPj8WLaoBjWroixASfZQcEOxeTG0exz3LsvHTSQnx6bKowIN
 qQmtzFGNAT8HY8hmYc/+HIJ9gcv2bjTvir81s6DIfAZDNf9UV6GZebi6uqoXTJQsDeds
 wgEIBZ1rxCY3XgNntN2aNkhz2esxUPahmmQUaJ9lW6/SF9CefGjZmEMuZB3XNCsX1PYK
 k9b4fI82U/5UarmE9/FgIOYzoPZZiFkkVsWf8m7HXxijBkr1Mx6VXfUxRjvKfc+0atGN
 t696lq+jw+rcJpEr/qKAeLVXJFIONzTvyPzHmxAO7eohvNOWuOtRyaeOqMAURCivZbao
 nGuw==
X-Gm-Message-State: AOAM531Y4OhZaRxsEn2i7Q24z3rm6q93Ury5WQ3GaEcDc8rlKvbUoySa
 sk1Rk+snaTc1+mA2wutcu7n/Hmug/WjedDU684PDA8NvZk8S2bbqQZvI8aB221hmXm0LABozzZs
 9CXZphLVd+IdUs3o=
X-Received: by 2002:a05:6402:5208:b0:416:ce01:f9b5 with SMTP id
 s8-20020a056402520800b00416ce01f9b5mr8500444edd.275.1647597418834; 
 Fri, 18 Mar 2022 02:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMjSmt7oAaXL0fpyUoQbQBixkj7sR8UYb1/MM9FJilaAaH9vPEFjye8udxJjUoUjHCjLVjXA==
X-Received: by 2002:a05:6402:5208:b0:416:ce01:f9b5 with SMTP id
 s8-20020a056402520800b00416ce01f9b5mr8500431edd.275.1647597418545; 
 Fri, 18 Mar 2022 02:56:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 og49-20020a1709071df100b006db0dcf673esm3540548ejc.27.2022.03.18.02.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 02:56:57 -0700 (PDT)
Date: Fri, 18 Mar 2022 10:56:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 1/3] hw/arm/virt: Fix CPU's default NUMA node ID
Message-ID: <20220318105656.67696eb8@redhat.com>
In-Reply-To: <e894fe3a-a50e-f47f-773d-d859bc240923@huawei.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-2-gshan@redhat.com>
 <e894fe3a-a50e-f47f-773d-d859bc240923@huawei.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 18 Mar 2022 14:23:34 +0800
"wangyanan (Y)" <wangyanan55@huawei.com> wrote:

> Hi Gavin,
> 
> On 2022/3/3 11:11, Gavin Shan wrote:
> > The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
> > when it isn't provided explicitly. However, the CPU topology isn't fully
> > considered in the default association and it causes CPU topology broken
> > warnings on booting Linux guest.
> >
> > For example, the following warning messages are observed when the Linux guest
> > is booted with the following command lines.
> >
> >    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
> >    -accel kvm -machine virt,gic-version=host               \
> >    -cpu host                                               \
> >    -smp 6,sockets=2,cores=3,threads=1                      \
> >    -m 1024M,slots=16,maxmem=64G                            \
> >    -object memory-backend-ram,id=mem0,size=128M            \
> >    -object memory-backend-ram,id=mem1,size=128M            \
> >    -object memory-backend-ram,id=mem2,size=128M            \
> >    -object memory-backend-ram,id=mem3,size=128M            \
> >    -object memory-backend-ram,id=mem4,size=128M            \
> >    -object memory-backend-ram,id=mem4,size=384M            \
> >    -numa node,nodeid=0,memdev=mem0                         \
> >    -numa node,nodeid=1,memdev=mem1                         \
> >    -numa node,nodeid=2,memdev=mem2                         \
> >    -numa node,nodeid=3,memdev=mem3                         \
> >    -numa node,nodeid=4,memdev=mem4                         \
> >    -numa node,nodeid=5,memdev=mem5
> >           :
> >    alternatives: patching kernel code
> >    BUG: arch topology borken
> >    the CLS domain not a subset of the MC domain
> >    <the above error log repeats>
> >    BUG: arch topology borken
> >    the DIE domain not a subset of the NODE domain
> >
> > With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
> > are associated with NODE#0 to NODE#5 separately. That's incorrect because
> > CPU#0/1/2 should be associated with same NUMA node because they're seated
> > in same socket.
> >
> > This fixes the issue by populating the CPU topology in virt_possible_cpu_arch_ids()
> > and considering the socket index when default CPU-to-NUMA association is given
> > in virt_possible_cpu_arch_ids(). With this applied, no more CPU topology broken
> > warnings are seen from the Linux guest. The 6 CPUs are associated with NODE#0/1,
> > but there are no CPUs associated with NODE#2/3/4/5.  
> It may be better to split this patch into two. One extends 
> virt_possible_cpu_arch_ids,
> and the other fixes the numa node ID issue.
> >
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > ---
> >   hw/arm/virt.c | 17 ++++++++++++++++-
> >   1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 46bf7ceddf..dee02b60fc 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2488,7 +2488,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> >   
> >   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
> >   {
> > -    return idx % ms->numa_state->num_nodes;
> > +    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
> > +
> > +    return socket_id % ms->numa_state->num_nodes;
> >   }
> >   
> >   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> > @@ -2496,6 +2498,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >       int n;
> >       unsigned int max_cpus = ms->smp.max_cpus;
> >       VirtMachineState *vms = VIRT_MACHINE(ms);
> > +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> >   
> >       if (ms->possible_cpus) {
> >           assert(ms->possible_cpus->len == max_cpus);
> > @@ -2509,6 +2512,18 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> >           ms->possible_cpus->cpus[n].type = ms->cpu_type;
> >           ms->possible_cpus->cpus[n].arch_id =
> >               virt_cpu_mp_affinity(vms, n);
> > +
> > +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> > +        ms->possible_cpus->cpus[n].props.socket_id =
> > +            n / (ms->smp.dies * ms->smp.clusters *
> > +                ms->smp.cores * ms->smp.threads);
> > +        if (mc->smp_props.dies_supported) {
> > +            ms->possible_cpus->cpus[n].props.has_die_id = true;
> > +            ms->possible_cpus->cpus[n].props.die_id =
> > +                n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> > +        }  
> I still don't think we need to consider dies if it's certainly not
> supported yet, IOW, we will never come into the if-branch.
> We are populating arm-specific topo info instead of the generic,
> we can probably uniformly update this part together with other
> necessary places when we decide to support dies for arm virt
> machine in the future. :)

it seems we do support dies and they are supposed to be numa boundary too,
so perhaps we should account for it when generating node-id.

> > +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> > +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
> >           ms->possible_cpus->cpus[n].props.has_thread_id = true;
> >           ms->possible_cpus->cpus[n].props.thread_id = n;
> >       }  
> Maybe we should use the same algorithm in x86_topo_ids_from_idx
> to populate the IDs, so that scope of socket-id will be [0, total_sockets),
> scope of thread-id is [0, threads_per_core), and so on. Then with a
> group of socket/cluster/core/thread-id, we determine a CPU.
> 
> Suggestion: For the long term, is it necessary now to add similar topo
> info infrastructure for ARM, such as X86CPUTopoInfo, X86CPUTopoIDs,
> x86_topo_ids_from_idx?
> 
> Thanks,
> Yanan
> 


