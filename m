Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E836042BF92
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:13:46 +0200 (CEST)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mad8j-0002QM-Km
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mad6k-0008Tx-71
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mad6f-0004uF-Mb
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634127096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LGBooBiqsuYNIVZk11aTiZsz9nEbFDMkAIpgLwYhQp0=;
 b=UZ7A791CbaZfre6xbziUwakwAXpDhWfLW0r5ppeV4Nt3sbHHt6xYvRtuou2jYSSO77+Rdz
 ncmGRWzKkG1WjjNWKU1B00DBOYtitKixkq/KbvWIexaJ+EtDciHa52EtjwefvipMnTh+FG
 e/jBg/Aw9deQKjKHnyESSNmPaRteaBw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-8lLUb0p6NjCVgJGir6djhA-1; Wed, 13 Oct 2021 08:11:34 -0400
X-MC-Unique: 8lLUb0p6NjCVgJGir6djhA-1
Received: by mail-ed1-f72.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so2037092edl.5
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LGBooBiqsuYNIVZk11aTiZsz9nEbFDMkAIpgLwYhQp0=;
 b=QO6qYOnECi3SEVvrWaEeY1n5HyajGEiCY0xNDLJKSuN4v07wiGrIU6wrViL0O7coUK
 iSv/PYsFu7mfmrt6E36pI29f6tCGkBMv7t0Sj9JbKBpsrWi+KqfmPi3IOotiU3khZlqS
 QGIgKUr7bYB7la7Z/s1Irta+lO06ze5XzYf+F8rnodk6GrxH4VI4bDWyliwaRH5CrQjU
 XTT2NNvWEg7iY5cfxqmo5hUVSEWs6R0N6OvgJBEfPJoKaLtoAY71FzAgxl2IFu0SSFmF
 yJzvKMzDCCOsKJaEaeKIP2BDqQyo8PErKPBYBaI5F1idAIiHHlG37mAvl7WJPN9cWyhH
 m06Q==
X-Gm-Message-State: AOAM532FPQIa3hJ4OOcswtT9kVEjOvkEd4yaC27P9Ef/xEGY+lCpFlFY
 DcTyLTEExhbD58tWMGJT8VaCmC+db6psfGrdKBoZJL2LKPKgW71L3XIvKqpZpDHeTkJZlDRO9sG
 SbQV+zLF8VUjB7ac=
X-Received: by 2002:a17:907:98f9:: with SMTP id
 ke25mr40797041ejc.381.1634127093676; 
 Wed, 13 Oct 2021 05:11:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoLjMxdvdqUVcwIMqUgkEUIs+1tuHTr7fSzMRTGxmumOFFrfhDxZSW+rw30O9S085WRsQp8A==
X-Received: by 2002:a17:907:98f9:: with SMTP id
 ke25mr40796998ejc.381.1634127093393; 
 Wed, 13 Oct 2021 05:11:33 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id q14sm6501211eji.63.2021.10.13.05.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:11:32 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:11:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013121125.sdewyrxcipsi3o22@gator.home>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211013135346.3a8f6c9a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 01:53:46PM +0200, Igor Mammedov wrote:
> On Wed, 13 Oct 2021 13:35:44 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:
> > > On Wed, 13 Oct 2021 12:58:04 +0800
> > > Gavin Shan <gshan@redhat.com> wrote:
> > >   
> > > > The following option is used to specify the distance map. It's
> > > > possible the option isn't provided by user. In this case, the
> > > > distance map isn't populated and exposed to platform. On the
> > > > other hand, the empty NUMA node, where no memory resides, is
> > > > allowed on platforms like ARM64 virt. For these empty NUMA
> > > > nodes, their corresponding device-tree nodes aren't populated,
> > > > but their NUMA IDs should be included in the "/distance-map"
> > > > device-tree node, so that kernel can probe them properly if
> > > > device-tree is used.
> > > > 
> > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > 
> > > > This adds extra check after the machine is initialized, to
> > > > ask for the distance map from user when empty nodes exist in
> > > > device-tree.
> > > > 
> > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > ---
> > > >  hw/core/machine.c     |  4 ++++
> > > >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> > > >  include/sysemu/numa.h |  1 +
> > > >  3 files changed, 29 insertions(+)
> > > > 
> > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > index b8d95eec32..c0765ad973 100644
> > > > --- a/hw/core/machine.c
> > > > +++ b/hw/core/machine.c
> > > > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> > > >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> > > >      machine_class->init(machine);
> > > >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > > > +
> > > > +    if (machine->numa_state) {
> > > > +        numa_complete_validation(machine);
> > > > +    }
> > > >  }
> > > >  
> > > >  static NotifierList machine_init_done_notifiers =
> > > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > > index 510d096a88..7404b7dd38 100644
> > > > --- a/hw/core/numa.c
> > > > +++ b/hw/core/numa.c
> > > > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> > > >      }
> > > >  }
> > > >  
> > > > +/*
> > > > + * When device-tree is used by the machine, the empty node IDs should
> > > > + * be included in the distance map. So we need provide pairs of distances
> > > > + * in this case.
> > > > + */
> > > > +void numa_complete_validation(MachineState *ms)
> > > > +{
> > > > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > > > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > > > +    int i;
> > > > +
> > > > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {  
> > > 
> > > also skip check/limitation when VM is launched with ACPI enabled?  
> > 
> > Even with ACPI enabled we generate a DT and would like that DT to be as
> > complete as possible. Of course we should generate a SLIT table with
> 
> Guest will work just fine without distance map as SRAT describes
> all numa nodes.
> You are forcing VM to have SLIT just for the sake of 'completeness'
> that's practically unused.
> 
> I'm still unsure about pushing all of this in generic numa code,
> as this will be used only by ARM for now. It's better to keep it
> ARM specific, and when RISCV machine will start using this, it
> could be moved to generic code.

I don't see a problem in providing this DT node / ACPI table to guests
with empty NUMA nodes. I don't even see a problem with providing the
distance information unconditionally. Can you explain why we should
prefer not to provide optional HW descriptions?

Thanks,
drew 

> 
> > the distance information the user provides on the command line in order
> > to satisfy the check, and we will, since we already have that code in
> > place.
> 
> 
> > 
> > Thanks,
> > drew
> > 
> > >   
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    for (i = 0; i < nb_numa_nodes; i++) {
> > > > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > > > +            error_report("Empty node %d found, please provide "
> > > > +                         "distance map.", i);
> > > > +            exit(EXIT_FAILURE);
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > >  void parse_numa_opts(MachineState *ms)
> > > >  {
> > > >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > > index 4173ef2afa..80f25ab830 100644
> > > > --- a/include/sysemu/numa.h
> > > > +++ b/include/sysemu/numa.h
> > > > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> > > >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> > > >                             Error **errp);
> > > >  void numa_complete_configuration(MachineState *ms);
> > > > +void numa_complete_validation(MachineState *ms);
> > > >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> > > >  extern QemuOptsList qemu_numa_opts;
> > > >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,  
> > >   
> > 
> 


