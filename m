Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13342C00A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:31:15 +0200 (CEST)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madPe-0005lW-SV
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1madNU-0003qQ-9y
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1madNF-0002Hv-TW
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634128125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NFgz1IAqlGo7rz6MUri7AbBAjWEGAFzPXQfCQbPxTj8=;
 b=NuRjCWnoP9YbenL6uX7nSE2T2mgnx0/y0SZ1fUvLpgbzUSXBt2OvMJCwFaw3kvOOoPJF2L
 wDL0ahVwpb9+VedgTS1pmyzQMHErovH4axkJNxI+ulvo5TNufldgwKupH+dKvc+jYZGDN4
 FyO8vGEtxnt7yVeUws+QVu8BaYjtJD4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-reYquC-RPtiFGIddTnxrOw-1; Wed, 13 Oct 2021 08:28:44 -0400
X-MC-Unique: reYquC-RPtiFGIddTnxrOw-1
Received: by mail-ed1-f69.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so2075572edb.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NFgz1IAqlGo7rz6MUri7AbBAjWEGAFzPXQfCQbPxTj8=;
 b=1+T18Fejya7qlGDhajJAuqZHEc9F98AA1vXBFNMU1OzJDho/O1mUhI78zMbG3NxFf+
 sG+S3PSDDXS/0mp6Geu/t7BXZe4y04keRPWkGmPR3ETiW/eNf3JAHLSMXzntBW68DpIB
 E6vBTnDLL8ptCW5z2fF620O+sXn5+MVaR19fwBFrefPsIj4uODTx0CJx2TslCJsGc4Nc
 bTwqKgl4cDVSpx1eO1waa+0meF1zQMrUEnusBqM/+nTPf8KcuWV8d86KAma78u9+5khs
 S7fZDaA2rQRVmiC9XwrSZR+VSlUb1tPN9MRtYR8x6jPsUl77iPDeEznep6Bf1yisFehO
 IO9Q==
X-Gm-Message-State: AOAM5335Ywt3RYu66cK6xNQhqs4i2IoDynn1h6DK++L0lCM2fsbHhFPe
 kYjIbB/XTRe4sT/u8ky1FuCHgf7SPmXZAAKSCbBSKf2W8h1pGZFB5FDDUsL6wOuCizcwQaW69lm
 af8c0tWL0a0S7JyA=
X-Received: by 2002:a17:906:d937:: with SMTP id
 rn23mr40944164ejb.101.1634128122737; 
 Wed, 13 Oct 2021 05:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9GD7B8K2D0VtLudeqTjI3WU9mAg3SzoDbizLtZjabzoPBydLmQOEUzfVULy5J8fka5BFn5g==
X-Received: by 2002:a17:906:d937:: with SMTP id
 rn23mr40944120ejb.101.1634128122361; 
 Wed, 13 Oct 2021 05:28:42 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id h10sm7870522edf.85.2021.10.13.05.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:28:41 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:28:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013122840.fi4ufle4czyzegtb@gator.home>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
MIME-Version: 1.0
In-Reply-To: <20211013121125.sdewyrxcipsi3o22@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Oct 13, 2021 at 02:11:25PM +0200, Andrew Jones wrote:
> On Wed, Oct 13, 2021 at 01:53:46PM +0200, Igor Mammedov wrote:
> > On Wed, 13 Oct 2021 13:35:44 +0200
> > Andrew Jones <drjones@redhat.com> wrote:
> > 
> > > On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:
> > > > On Wed, 13 Oct 2021 12:58:04 +0800
> > > > Gavin Shan <gshan@redhat.com> wrote:
> > > >   
> > > > > The following option is used to specify the distance map. It's
> > > > > possible the option isn't provided by user. In this case, the
> > > > > distance map isn't populated and exposed to platform. On the
> > > > > other hand, the empty NUMA node, where no memory resides, is
> > > > > allowed on platforms like ARM64 virt. For these empty NUMA
> > > > > nodes, their corresponding device-tree nodes aren't populated,
> > > > > but their NUMA IDs should be included in the "/distance-map"
> > > > > device-tree node, so that kernel can probe them properly if
> > > > > device-tree is used.
> > > > > 
> > > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > > 
> > > > > This adds extra check after the machine is initialized, to
> > > > > ask for the distance map from user when empty nodes exist in
> > > > > device-tree.
> > > > > 
> > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > > > ---
> > > > >  hw/core/machine.c     |  4 ++++
> > > > >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> > > > >  include/sysemu/numa.h |  1 +
> > > > >  3 files changed, 29 insertions(+)
> > > > > 
> > > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > > index b8d95eec32..c0765ad973 100644
> > > > > --- a/hw/core/machine.c
> > > > > +++ b/hw/core/machine.c
> > > > > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> > > > >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> > > > >      machine_class->init(machine);
> > > > >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > > > > +
> > > > > +    if (machine->numa_state) {
> > > > > +        numa_complete_validation(machine);
> > > > > +    }
> > > > >  }
> > > > >  
> > > > >  static NotifierList machine_init_done_notifiers =
> > > > > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > > > > index 510d096a88..7404b7dd38 100644
> > > > > --- a/hw/core/numa.c
> > > > > +++ b/hw/core/numa.c
> > > > > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> > > > >      }
> > > > >  }
> > > > >  
> > > > > +/*
> > > > > + * When device-tree is used by the machine, the empty node IDs should
> > > > > + * be included in the distance map. So we need provide pairs of distances
> > > > > + * in this case.
> > > > > + */
> > > > > +void numa_complete_validation(MachineState *ms)
> > > > > +{
> > > > > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > > > > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > > > > +    int i;
> > > > > +
> > > > > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {  
> > > > 
> > > > also skip check/limitation when VM is launched with ACPI enabled?  

On second thought, I guess it's a good idea to not error out when ACPI is
enabled. There's no point in burdening the ACPI user.

> > > 
> > > Even with ACPI enabled we generate a DT and would like that DT to be as
> > > complete as possible. Of course we should generate a SLIT table with
> > 
> > Guest will work just fine without distance map as SRAT describes
> > all numa nodes.
> > You are forcing VM to have SLIT just for the sake of 'completeness'
> > that's practically unused.
> > 
> > I'm still unsure about pushing all of this in generic numa code,
> > as this will be used only by ARM for now. It's better to keep it
> > ARM specific, and when RISCV machine will start using this, it
> > could be moved to generic code.

I think RISCV could start using it now. Linux shares the mem/numa DT
parsing code between Arm and RISCV. If RISCV QEMU wanted to start
exposing NUMA nodes, then they might as well support empty ones from
the start.

> 
> I don't see a problem in providing this DT node / ACPI table to guests
> with empty NUMA nodes. I don't even see a problem with providing the
> distance information unconditionally. Can you explain why we should
> prefer not to provide optional HW descriptions?

I'm still curious why we should be so reluctant to add HW descriptions.
I agree we should be reluctant to error out, though. So, when ACPI is
enabled, let's skip the enforcement of the SLIT table generation, even
if there are empty nodes, as you suggest.

Thanks,
drew

> 
> Thanks,
> drew 
> 
> > 
> > > the distance information the user provides on the command line in order
> > > to satisfy the check, and we will, since we already have that code in
> > > place.
> > 
> > 
> > > 
> > > Thanks,
> > > drew
> > > 
> > > >   
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    for (i = 0; i < nb_numa_nodes; i++) {
> > > > > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > > > > +            error_report("Empty node %d found, please provide "
> > > > > +                         "distance map.", i);
> > > > > +            exit(EXIT_FAILURE);
> > > > > +        }
> > > > > +    }
> > > > > +}
> > > > > +
> > > > >  void parse_numa_opts(MachineState *ms)
> > > > >  {
> > > > >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > > > > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > > > > index 4173ef2afa..80f25ab830 100644
> > > > > --- a/include/sysemu/numa.h
> > > > > +++ b/include/sysemu/numa.h
> > > > > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> > > > >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> > > > >                             Error **errp);
> > > > >  void numa_complete_configuration(MachineState *ms);
> > > > > +void numa_complete_validation(MachineState *ms);
> > > > >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> > > > >  extern QemuOptsList qemu_numa_opts;
> > > > >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,  
> > > >   
> > > 
> > 


