Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCDC36C24E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:06:35 +0200 (CEST)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKby-0001BT-7Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKaM-0000X8-Jr
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKaK-0007k7-7D
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619517891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6uPOZWdjdYQvzPsl93HT7iKjKxszdRekMbSBZo0ukk=;
 b=dTkpUfw24qUeE0WNchzLKs7nWyUx4itgjeRdD0pMMfo5DN9tzFwwKsaAyifZFQz9UEDjTc
 y1B7XmLEb26j+leRGLdewlY+tvtaQqjo++EfKRUXmbazRqpsvnwtB+0uhmfrX+9YAMEbIN
 XZ1RDJlJFSHCsG3KgYqK3A2rvcwFpq4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-TRD4syC8ObOSmii5tMTmXw-1; Tue, 27 Apr 2021 06:04:47 -0400
X-MC-Unique: TRD4syC8ObOSmii5tMTmXw-1
Received: by mail-ej1-f72.google.com with SMTP id
 f15-20020a170906738fb029037c94426fffso11089794ejl.22
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r6uPOZWdjdYQvzPsl93HT7iKjKxszdRekMbSBZo0ukk=;
 b=AXfr2eHs2siJ+6CHj3IFBZQ18J/gO8vIlhWNePETtAFUQ4HnERGVNQmPn5Qi1TwX57
 zQgsBRLZ71BsO3LAJ98NzWAw5TTmh+WqMcILArRYEfV8HyZTxH8D7e4hej4TOpfMXZGv
 GqyXd+kEVNkyYxDA1DtcY+1ALaDHSa3ZTGXJYeg3cDnp82TyaIc79kOvaAYhmXxavX1l
 OFklww9BQvBQj1sMgYkv3q1/F75hHrCXkArYnMd7HMuHYFQqxRL30A1CGA2/0GRNgG9d
 n9Wbmoa7rYHGZJSH9yES355z0abg9/W8vX4oOH8cDflF7xvnRFZ04Vdvq13Xbf61PPp/
 y7zg==
X-Gm-Message-State: AOAM531DP6HcYPOa93QxGvNqYB/MFTAppiBEV5lZmEeiNaR/LCfbAhf6
 Jmi9qiXFL1paIYdVKpunA18dbTsy6iyDUNKrh2wMzQ3c2CFkryLrSotfkZNFAvAYdJaVC8RJvhW
 93VE6tJWdBySLWMI=
X-Received: by 2002:a17:906:a212:: with SMTP id
 r18mr15383856ejy.438.1619517886383; 
 Tue, 27 Apr 2021 03:04:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7HkKeOCmcU+aHoG8W76Qe7BwTrYbMFuWToLfR6jpHru22mf+rQqu98COm2c7iMatLI9bBFg==
X-Received: by 2002:a17:906:a212:: with SMTP id
 r18mr15383833ejy.438.1619517886177; 
 Tue, 27 Apr 2021 03:04:46 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id g20sm657421edr.45.2021.04.27.03.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 03:04:45 -0700 (PDT)
Date: Tue, 27 Apr 2021 12:04:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
Message-ID: <20210427100442.elz3bjgl6mcntevc@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
 <648ff988-35f6-1857-2194-0d3e11e0d15c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <648ff988-35f6-1857-2194-0d3e11e0d15c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 11:47:17AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Yanan, Drew,
> 
> On 4/13/21 10:07 AM, Yanan Wang wrote:
> > From: Andrew Jones <drjones@redhat.com>
> > 
> > Support device tree CPU topology descriptions.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > ---
> >  hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
> >  include/hw/arm/virt.h |  1 +
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 9f01d9041b..f4ae60ded9 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> >      int cpu;
> >      int addr_cells = 1;
> >      const MachineState *ms = MACHINE(vms);
> > +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> >      int smp_cpus = ms->smp.cpus;
> >  
> >      /*
> > -     * From Documentation/devicetree/bindings/arm/cpus.txt
> > +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
> >       *  On ARM v8 64-bit systems value should be set to 2,
> >       *  that corresponds to the MPIDR_EL1 register size.
> >       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> > @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> >                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
> >          }
> >  
> > +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> > +                                  qemu_fdt_alloc_phandle(ms->fdt));
> > +        }
> > +
> >          g_free(nodename);
> >      }
> > +
> > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > +        /*
> > +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > +         * In a SMP system, the hierarchy of CPUs is defined through four
> > +         * entities that are used to describe the layout of physical CPUs
> > +         * in the system: socket/cluster/core/thread.
> > +         */
> > +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> > +
> > +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
> > +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> > +            char *map_path;
> > +
> > +            if (ms->smp.threads > 1) {
> > +                map_path = g_strdup_printf(
> > +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> > +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
> > +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
> > +                    "thread", cpu % ms->smp.threads);
> > +            } else {
> > +                map_path = g_strdup_printf(
> > +                    "/cpus/cpu-map/%s%d/%s%d",
> > +                    "socket", cpu / ms->smp.cores,
> > +                    "core", cpu % ms->smp.cores);
> > +            }
> > +            qemu_fdt_add_path(ms->fdt, map_path);
> > +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> > +            g_free(map_path);
> > +            g_free(cpu_path);
> > +        }
> > +    }
> >  }
> >  
> >  static void fdt_add_its_gic_node(VirtMachineState *vms)
> > @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
> >      virt_machine_6_0_options(mc);
> >      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> >      vmc->no_secure_gpio = true;
> > +    vmc->no_cpu_topology = true;
> 
> Bare with me because "machine versioning" is something new to me, I was
> expecting it to be only related to migrated fields.
> Why do we need to care about not adding the FDT node in older machines?
> Shouldn't the guest skip unknown FDT nodes?

It probably should, the question is whether it would. Also, the nodes may
not be unknown, so the guest will read the information and set up its
topology as instructed. That topology may not be the same as what was
getting used by default without the topology description. It's possible
that a user's application has a dependency on the topology and if that
topology gets changed under its feat it'll behave differently.

In short, machine versioning isn't just about vmstate, it's also about
keeping a machine type looking the same to the guest.

Now, it's possible that we're being overly cautious here, but this compat
variable doesn't complicate code too much. So I think I'd prefer to use it
than not.

Thanks,
drew


