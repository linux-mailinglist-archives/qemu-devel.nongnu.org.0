Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2D42BEF0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:33:01 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macVI-0008Vy-T4
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1macSw-0007VR-Nu
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1macSu-0001b8-6L
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634124617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Bz0ZINQZd+m3Ah89n6N3Fem/hA/kkA9jwROmqhKYa0=;
 b=F4AzH9j51PmFhDP0Ly94ai0tBvAN2csCMlKB01dffYXjs9nPqSFKktnFtvNsCi60FPS8Lu
 l0Y8UM8NsThFI/TzzVhsErR09c5rOe8QeSaod54U5WRjf4wdjXgw2W8LwbCGXmmsro4z3/
 DfbBUwRdWacFKPobuz3dCLBHC671TnY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-KA3NNXaEOnKa18mcjk1jqA-1; Wed, 13 Oct 2021 07:30:16 -0400
X-MC-Unique: KA3NNXaEOnKa18mcjk1jqA-1
Received: by mail-ed1-f70.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so1948197edb.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Bz0ZINQZd+m3Ah89n6N3Fem/hA/kkA9jwROmqhKYa0=;
 b=VERFtr/4DZta4Cf4xjOVGIP5mhGfcRIUbrhJZbQnfFL3o2SCeqexcS28XitZv/tCaa
 aFytpIT/DnClSgeBet9oMxnVlubJDLmOaTwfdRt9VTgnf91aeHaVmmVpZXPDG96zpwtq
 l9wM7/ytbRrlFeDCLmPuSDZ5Z+zV4B7Eg/QkRE7iVaUxIO54WwatlgHD9NiLxQMngrgT
 LjrSnmxITrsTuOPgu2NhAxtP7kbf8HeDK5Ni0tWjaI9MPKU2djY6fKmcDcVqWLjrL2zd
 MGHwnpQNSzbWx+jQmhFpPqNlT0SMzaRyOXKITAjPgjhbSmL+x0HqgL+Bm3TXs2AipGpB
 UDMA==
X-Gm-Message-State: AOAM533xOQ08Y9ylf7/RPXmarPbF8qSrZ+CGSjMAEbB2s31MDH2hkRu5
 GgPu/EBRDAlSuK0/j5ibIBPqGYOIvJ7apkPFw0sEhtbsvD+GmXEKdKhCYUVcy3jFLFHA8L/0QK8
 niXSMWUtW26maVZA=
X-Received: by 2002:a17:906:ca12:: with SMTP id
 jt18mr39654121ejb.451.1634124615247; 
 Wed, 13 Oct 2021 04:30:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPSUVnzcXU1Oyuijit2YV7gzvXwFYtEDOJwke73pmOFSis+eTZyKrRky6eTj4SxWtxK4Aw9Q==
X-Received: by 2002:a17:906:ca12:: with SMTP id
 jt18mr39654091ejb.451.1634124614998; 
 Wed, 13 Oct 2021 04:30:14 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q23sm6692049ejr.0.2021.10.13.04.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 04:30:14 -0700 (PDT)
Date: Wed, 13 Oct 2021 13:30:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211013133011.62b8812d@redhat.com>
In-Reply-To: <20211013045805.192165-2-gshan@redhat.com>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 robh@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Oct 2021 12:58:04 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The following option is used to specify the distance map. It's
> possible the option isn't provided by user. In this case, the
> distance map isn't populated and exposed to platform. On the
> other hand, the empty NUMA node, where no memory resides, is
> allowed on platforms like ARM64 virt. For these empty NUMA
> nodes, their corresponding device-tree nodes aren't populated,
> but their NUMA IDs should be included in the "/distance-map"
> device-tree node, so that kernel can probe them properly if
> device-tree is used.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> This adds extra check after the machine is initialized, to
> ask for the distance map from user when empty nodes exist in
> device-tree.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/machine.c     |  4 ++++
>  hw/core/numa.c        | 24 ++++++++++++++++++++++++
>  include/sysemu/numa.h |  1 +
>  3 files changed, 29 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32..c0765ad973 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1355,6 +1355,10 @@ void machine_run_board_init(MachineState *machine)
>      accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
>      machine_class->init(machine);
>      phase_advance(PHASE_MACHINE_INITIALIZED);
> +
> +    if (machine->numa_state) {
> +        numa_complete_validation(machine);
> +    }
>  }
>  
>  static NotifierList machine_init_done_notifiers =
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 510d096a88..7404b7dd38 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -727,6 +727,30 @@ void numa_complete_configuration(MachineState *ms)
>      }
>  }
>  
> +/*
> + * When device-tree is used by the machine, the empty node IDs should
> + * be included in the distance map. So we need provide pairs of distances
> + * in this case.
> + */
> +void numa_complete_validation(MachineState *ms)
> +{
> +    NodeInfo *numa_info = ms->numa_state->nodes;
> +    int nb_numa_nodes = ms->numa_state->num_nodes;
> +    int i;
> +
> +    if (!ms->fdt || ms->numa_state->have_numa_distance) {

also skip check/limitation when VM is launched with ACPI enabled?

> +        return;
> +    }
> +
> +    for (i = 0; i < nb_numa_nodes; i++) {
> +        if (numa_info[i].present && !numa_info[i].node_mem) {
> +            error_report("Empty node %d found, please provide "
> +                         "distance map.", i);
> +            exit(EXIT_FAILURE);
> +        }
> +    }
> +}
> +
>  void parse_numa_opts(MachineState *ms)
>  {
>      qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 4173ef2afa..80f25ab830 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -104,6 +104,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
>  void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
>                             Error **errp);
>  void numa_complete_configuration(MachineState *ms);
> +void numa_complete_validation(MachineState *ms);
>  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
>  extern QemuOptsList qemu_numa_opts;
>  void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,


