Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE242BF07
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:37:03 +0200 (CEST)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macZC-0002cb-7G
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1macY8-0001jJ-Kt
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1macY4-0005on-S6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634124951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kt/PaKgDb1G0nXZ0Zdzu9psYQIxOzZJ4zTXTgI1P+cE=;
 b=CekmCiJM8oukhUn5eVlqRn7n0SXuFqlhftDdkq4cHr5A8ns/noXsGoxq51JF+a8lrgdWyY
 T37GSMMyZrY0Y/riNEz8MUN1+qz5/laIoHMq5Aqaayl+MOsMoCmWvvc0RJ1dOImI7Bwpri
 YTxTBnbGjyH74pVP2/ylomKY5u61/mw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-lE690hO-PTKnrMjeVeXJfg-1; Wed, 13 Oct 2021 07:35:48 -0400
X-MC-Unique: lE690hO-PTKnrMjeVeXJfg-1
Received: by mail-ed1-f70.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so1939859edi.12
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kt/PaKgDb1G0nXZ0Zdzu9psYQIxOzZJ4zTXTgI1P+cE=;
 b=eOAK/WSuOstLgrksGhXskDmaPcc5m6WQ5L3Ghl4dRIOYQDzcRlO28EjzgYociIG+2p
 TqjXpl2eaF5KNW62e+caoxk0gFMc58Gk9F4SRw40b9vdSjCCNKzdU1TvV5gdWdu8dIRF
 cxnuc69jEbm2X2tf0JXJ/NEh91suWzPJiFuflmaTDff+oH72dtfktZZ6zxukqUafV5Pj
 xi2vfICe8NidwmYh50ki8jf/Qv8oSHdYeWHY/zg2SWTj6L6CzBpGOv06f6ZGrEWoxV2J
 iBKThBgp8tx4moiKZPMkeE41N9oBk95Jjde/PNsJwP1TmsJ4McuddR6JABlj0F8YRoyk
 ge7Q==
X-Gm-Message-State: AOAM532p8trJPwEFyorTq+agUlrWpA2toYoS6S0x140WkoYysihpp5Bu
 MCKWQyjsd5l0FDL/8fsAm+EvoTOT+qMdmkx3b6jSo6/2Hkai7D8nzUUk2krSbQ4gRoyrXYjGufk
 VUBb19Kj7jw+HA1c=
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr9002237ede.80.1634124947370; 
 Wed, 13 Oct 2021 04:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuFyxGQ7lQZrA/lD2Sy4hlpolfdnr5hjHLePj/zLmVQvT499IwgP7iE6TrdpXeaYYnCargtw==
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr9002213ede.80.1634124947137; 
 Wed, 13 Oct 2021 04:35:47 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id nd22sm7085769ejc.98.2021.10.13.04.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 04:35:46 -0700 (PDT)
Date: Wed, 13 Oct 2021 13:35:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013113544.4xrfagduw4nlbvou@gator.home>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211013133011.62b8812d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 01:30:11PM +0200, Igor Mammedov wrote:
> On Wed, 13 Oct 2021 12:58:04 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
> > The following option is used to specify the distance map. It's
> > possible the option isn't provided by user. In this case, the
> > distance map isn't populated and exposed to platform. On the
> > other hand, the empty NUMA node, where no memory resides, is
> > allowed on platforms like ARM64 virt. For these empty NUMA
> > nodes, their corresponding device-tree nodes aren't populated,
> > but their NUMA IDs should be included in the "/distance-map"
> > device-tree node, so that kernel can probe them properly if
> > device-tree is used.
> > 
> >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > 
> > This adds extra check after the machine is initialized, to
> > ask for the distance map from user when empty nodes exist in
> > device-tree.
> > 
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > ---
> >  hw/core/machine.c     |  4 ++++
> >  hw/core/numa.c        | 24 ++++++++++++++++++++++++
> >  include/sysemu/numa.h |  1 +
> >  3 files changed, 29 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index b8d95eec32..c0765ad973 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
> >      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
> >      machine_class->init(machine);
> >      phase_advance(PHASE_MACHINE_INITIALIZED);
> > +
> > +    if (machine->numa_state) {
> > +        numa_complete_validation(machine);
> > +    }
> >  }
> >  
> >  static NotifierList machine_init_done_notifiers =
> > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > index 510d096a88..7404b7dd38 100644
> > --- a/hw/core/numa.c
> > +++ b/hw/core/numa.c
> > @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
> >      }
> >  }
> >  
> > +/*
> > + * When device-tree is used by the machine, the empty node IDs should
> > + * be included in the distance map. So we need provide pairs of distances
> > + * in this case.
> > + */
> > +void numa_complete_validation(MachineState *ms)
> > +{
> > +    NodeInfo *numa_info = ms->numa_state->nodes;
> > +    int nb_numa_nodes = ms->numa_state->num_nodes;
> > +    int i;
> > +
> > +    if (!ms->fdt || ms->numa_state->have_numa_distance) {
> 
> also skip check/limitation when VM is launched with ACPI enabled?

Even with ACPI enabled we generate a DT and would like that DT to be as
complete as possible. Of course we should generate a SLIT table with
the distance information the user provides on the command line in order
to satisfy the check, and we will, since we already have that code in
place.

Thanks,
drew

> 
> > +        return;
> > +    }
> > +
> > +    for (i = 0; i < nb_numa_nodes; i++) {
> > +        if (numa_info[i].present && !numa_info[i].node_mem) {
> > +            error_report("Empty node %d found, please provide "
> > +                         "distance map.", i);
> > +            exit(EXIT_FAILURE);
> > +        }
> > +    }
> > +}
> > +
> >  void parse_numa_opts(MachineState *ms)
> >  {
> >      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > index 4173ef2afa..80f25ab830 100644
> > --- a/include/sysemu/numa.h
> > +++ b/include/sysemu/numa.h
> > @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> >  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> >                             Error **errp);
> >  void numa_complete_configuration(MachineState *ms);
> > +void numa_complete_validation(MachineState *ms);
> >  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
> >  extern QemuOptsList qemu_numa_opts;
> >  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,
> 


