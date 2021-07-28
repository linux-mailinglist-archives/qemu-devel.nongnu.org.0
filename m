Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472FD3D96F3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:42:57 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8qOG-0005TH-Be
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qME-0002bs-HQ
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8qMC-0001Cc-Kc
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627504847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=di0pPppwHXqyxO26gW9wr8snEfLNJ2VzoZBI0H3D/vg=;
 b=NPJQo+dDzCg452zzY+RUWuZ7WT+3FJlJZ9uSwQNTT6DJHe1yMi61A6ay1fUH0KzPYw5Fi9
 QrL5TJbdLlUoDFzfC3Jl7GZTOYwnAT1KqSGP+X/VRqPO44O9vyyFrhm6wCTwzfYIbJx5qH
 m5fKhwBor5K3d4k1BmVAyUb6XMXVJTM=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-bL5MM5kJOT-kkyE2ZSqRaA-1; Wed, 28 Jul 2021 16:40:46 -0400
X-MC-Unique: bL5MM5kJOT-kkyE2ZSqRaA-1
Received: by mail-il1-f198.google.com with SMTP id
 6-20020a9219060000b029020c886c9370so2095107ilz.10
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=di0pPppwHXqyxO26gW9wr8snEfLNJ2VzoZBI0H3D/vg=;
 b=ZTPqSZvwKrCiAHTD10Opj9Lqn9Z1+YKK0rvoCoxIuizWiiG7+e4Qpkcu8Ko/w/C/kV
 PWc5mLB3qBZuJLQzy5/RhT9suRIFyIGY670mNoUHHXkoYU8Kb07VXTaRi0jHLabNXr8A
 2fqrE9f8RIkGach7LwTNw7HqQ6NOeXmyFZ8OFvA3dlWA8KqjTXXjt/3oBmjKiZzQtEh7
 32AsJalFA8ZzEKsJ7ONDyrzlOvPu1CmeFwmvN8F/JU24jyNJ7mb31CAxBavwuGENLRO+
 jSik/b365uFsYjXNlOPVwUtPjVLaAz4ZJEAI1Z7nXGGNDAiHUMTmx15/HHDCjp3JIBGn
 vYyQ==
X-Gm-Message-State: AOAM533Du5YaHWbJnaaBnNDlAZb9sQwhBjEakuI0Jg2jMKypoZwj3eb9
 m8IpjlEGJpt6zTO0qmxa1OEy7xns2LhuNLLzoxhmXB35OvmzBI8PVTNo+BeViBL9GOCmDM4fsxz
 oBe10RL+lYdQLALE=
X-Received: by 2002:a02:a80f:: with SMTP id f15mr1404823jaj.142.1627504846214; 
 Wed, 28 Jul 2021 13:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQYnR5T9H20bJAfHqSr3fVn+81/K6n8dy6jzYr3XVsNJPg1/dGx07A7OBpn8wjACOgYXwrEA==
X-Received: by 2002:a02:a80f:: with SMTP id f15mr1404803jaj.142.1627504846016; 
 Wed, 28 Jul 2021 13:40:46 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id x4sm647988ilj.52.2021.07.28.13.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:40:45 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:40:43 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 11/11] machine: Move smp_prefer_sockets to
 struct SMPCompatProps
Message-ID: <20210728204043.vne3tmdp4qhontvw@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-12-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210728034848.75228-12-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 11:48:48AM +0800, Yanan Wang wrote:
> Now we have a common structure SMPCompatProps used to store information
> about SMP compatibility stuff, so we can also move smp_prefer_sockets
> there for cleaner code.
> 
> No functional change intended.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c              | 2 +-
>  hw/core/machine.c          | 2 +-
>  hw/i386/pc_piix.c          | 2 +-
>  hw/i386/pc_q35.c           | 2 +-
>  hw/ppc/spapr.c             | 2 +-
>  hw/s390x/s390-virtio-ccw.c | 2 +-
>  include/hw/boards.h        | 3 ++-
>  7 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7babea40dc..ae029680da 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2797,7 +2797,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
>  {
>      virt_machine_6_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> -    mc->smp_prefer_sockets = true;
> +    mc->smp_props.prefer_sockets = true;
>  }
>  DEFINE_VIRT_MACHINE(6, 1)
>  
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8f84e38e2e..61d1f643f4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -834,7 +834,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      } else {
>          maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -        if (mc->smp_prefer_sockets) {
> +        if (mc->smp_props.prefer_sockets) {
>              /* prefer sockets over cores over threads before 6.2 */
>              if (sockets == 0) {
>                  cores = cores > 0 ? cores : 1;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 9b811fc6ca..a60ebfc2c1 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -432,7 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
>      m->is_default = false;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> -    m->smp_prefer_sockets = true;
> +    m->smp_props.prefer_sockets = true;
>  }
>  
>  DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 88efb7fde4..4b622ffb82 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -372,7 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
>      m->alias = NULL;
>      compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>      compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
> -    m->smp_prefer_sockets = true;
> +    m->smp_props.prefer_sockets = true;
>  }
>  
>  DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a481fade51..efdea43c0d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4702,7 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
>  {
>      spapr_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> -    mc->smp_prefer_sockets = true;
> +    mc->smp_props.prefer_sockets = true;
>  }
>  
>  DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index b40e647883..5bdef9b4d7 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -809,7 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
>  {
>      ccw_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> -    mc->smp_prefer_sockets = true;
> +    mc->smp_props.prefer_sockets = true;
>  }
>  DEFINE_CCW_MACHINE(6_1, "6.1", false);
>  
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 72123f594d..23671a0f8f 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -110,9 +110,11 @@ typedef struct {
>  
>  /**
>   * SMPCompatProps:
> + * @prefer_sockets - whether sockets is preferred over cores in smp parsing
>   * @dies_supported - whether dies is supported by the machine
>   */
>  typedef struct {
> +    bool prefer_sockets;
>      bool dies_supported;
>  } SMPCompatProps;
>  
> @@ -250,7 +252,6 @@ struct MachineClass {
>      bool nvdimm_supported;
>      bool numa_mem_supported;
>      bool auto_enable_numa;
> -    bool smp_prefer_sockets;
>      SMPCompatProps smp_props;
>      const char *default_ram_id;
>  
> -- 
> 2.19.1
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


