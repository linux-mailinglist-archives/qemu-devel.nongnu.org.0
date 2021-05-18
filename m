Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC65387380
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:47:47 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liuS9-0002Pc-NQ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuRH-0001X9-0d
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuRE-0004jO-Cq
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621324007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8SNBnIFxsBSmm7jNokMO6sEfQKHN0xu94C0x8dCYGjM=;
 b=OoKRqi0yL9xR8BB619+QwI+IwZpt4eHCwDgwsY7Z8OEj3tEn1GNo0PTKf+DRnti46o4oRS
 i9xSqrQps1XJXOCVlKY8TOkdgv8lulSkKMmkGsYjkasCO77nntDO/FvTdJCvekcPqSOpag
 FzDF0+gjUzBnSCeYzVO/mb6izn9dea4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-7MWB3qOeOXy-zCYSJr5FEw-1; Tue, 18 May 2021 03:46:45 -0400
X-MC-Unique: 7MWB3qOeOXy-zCYSJr5FEw-1
Received: by mail-ej1-f69.google.com with SMTP id
 p25-20020a1709061419b0290378364a6464so2023511ejc.15
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 00:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8SNBnIFxsBSmm7jNokMO6sEfQKHN0xu94C0x8dCYGjM=;
 b=NZucUfzPE3HFe7u5Oy4PRJcvdKbee3CV/sn1z45A9mGD4DI591rmqbGda4JW+txLka
 fLgtcrOlhTAKlMJUlNpWoG40ulaTKxANg5WmEWS9wGtjMYJpEnn0LbqGWz3zVvEXCaTr
 5JFVEgcC4zULOPcnxpRT9AsIsloc6o/FNXUHoPW9aRCdmnR5hvk0y9H6E4I7RWi2A0Ha
 zr/qp/tUT5Rtum8fbFrU0opkFPYOh6fR9s30wGx7U8fc4+XAH14NbGz2gKWiV7d8Av7q
 1ezxWOA3E9VhUQk6M8oZe8fv7DtNZPuNlz+WfLOhPo4MK8SSde1AqwHpCJ2ccynRVWX/
 n3aQ==
X-Gm-Message-State: AOAM5338AGTQOcdVXjzbDmx21xIe3TuVLP838iGSdMzO2JsXdbU7f0U7
 voQUEL1kVmw6cC0odoWdVibHCeH3NwC5Z9eeD3pBsvY18GGStYivoXD6JXVSGg74JicfMx69xMf
 AicXYyKdTdwVfuUI=
X-Received: by 2002:a17:906:84d:: with SMTP id
 f13mr4805537ejd.451.1621324003708; 
 Tue, 18 May 2021 00:46:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl/EF+pLziswR/hBcL1tgQ+zzMKhwWDXr2rxfQ81aDyjIYIt0OMcMXmqSW0z+SaQK5JsOQ3g==
X-Received: by 2002:a17:906:84d:: with SMTP id
 f13mr4805518ejd.451.1621324003525; 
 Tue, 18 May 2021 00:46:43 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id n15sm10062712eje.118.2021.05.18.00.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:46:43 -0700 (PDT)
Date: Tue, 18 May 2021 09:46:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 3/9] hw/arm/virt: Add cpu-map to device tree
Message-ID: <20210518074641.q6zsjso55akie4o6@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-4-wangyanan55@huawei.com>
 <20210517064140.4cvurykbsofb7y3n@gator.home>
 <5eb2dc87-1c0a-11ae-0a4c-f26c4a90a18d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5eb2dc87-1c0a-11ae-0a4c-f26c4a90a18d@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 11:00:07PM +0800, wangyanan (Y) wrote:
> Hi Drew,
> 
> On 2021/5/17 14:41, Andrew Jones wrote:
> > On Sun, May 16, 2021 at 06:28:54PM +0800, Yanan Wang wrote:
> > > From: Andrew Jones <drjones@redhat.com>
> > > 
> > > Support device tree CPU topology descriptions.
> > > 
> > > In accordance with the Devicetree Specification, the Linux Doc
> > > "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
> > > present. And we meet the requirement by creating /cpus/cpu@*
> > > nodes for members within ms->smp.cpus.
> > > 
> > > Correspondingly, we should also create subnodes in cpu-map for
> > > the present cpus, each of which relates to an unique cpu node.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/arm/virt.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> > >   1 file changed, 40 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index c07841e3a4..e5dcdebdbc 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -349,10 +349,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >       int cpu;
> > >       int addr_cells = 1;
> > >       const MachineState *ms = MACHINE(vms);
> > > +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> > >       int smp_cpus = ms->smp.cpus;
> > >       /*
> > > -     * From Documentation/devicetree/bindings/arm/cpus.txt
> > > +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
> > Rather than aligning the top line with the lower lines, we could remove
> > the extra space from the lower lines. Or, leave the formatting as it was,
> > by putting 'See' where 'From' was, like I did in my original patch.
> I think I prefer removing the extra space from the lower lines, which is
> the right thing to do.

OK

> > >        *  On ARM v8 64-bit systems value should be set to 2,
> > >        *  that corresponds to the MPIDR_EL1 register size.
> > >        *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> > > @@ -405,8 +406,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
> > >           }
> > > +        if (!vmc->no_cpu_topology) {
> > > +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> > > +                                  qemu_fdt_alloc_phandle(ms->fdt));
> > > +        }
> > > +
> > >           g_free(nodename);
> > >       }
> > > +
> > > +    if (!vmc->no_cpu_topology) {
> > > +        /*
> > > +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > > +         * In a SMP system, the hierarchy of CPUs is defined through four
> > > +         * entities that are used to describe the layout of physical CPUs
> > s/entities/levels/
> Above comment was completely from Linux Doc cpu-topology.txt. See [1].
> I think entities may be more reasonable than levels here, since there can be
> multiple levels of clusters in cpu-map which makes the total not four.

OK

> 
> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > > +         * in the system: socket/cluster/core/thread.
> > The comment says there are four levels including 'cluster', but there's no
> > 'cluster' below.
> According to Doc [1] (line 114), a socket node's child nodes must be
> *one or more* cluster nodes which means cluster is mandatory to be
> socket's child in DT.
> 
> So I think maybe we should just keep the comment as-is, and change
> the map-path from /cpus/cpu-map/socket*/cores*/threads* to
> /cpus/cpu-map/socket*/cluster0/cores*/threads* in this patch?

I agree. In fact, that's how I implemented it myself[1]

[1] https://github.com/rhdrjones/qemu/commit/35feecdd43475608c8f55973a0c159eac4aafefd

Thanks,
drew


