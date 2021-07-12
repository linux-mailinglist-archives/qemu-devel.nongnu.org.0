Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5C03C5ED2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:05:32 +0200 (CEST)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xUx-0006BI-E7
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xNT-0002fQ-56
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xNR-0003CN-BQ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626101864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R5ZGQf2dT0rdpf34qlCSJQKJZka1u3BdS5XKv7H0Gm0=;
 b=SSFFQyeq6dg63dRp4g+QLgJAsE9EhwxTlPoVUY0/IR8B5XfEB9t+U2djT/HpsmSKY2gz5d
 pXHLpsVivOd7ZXJEJwe6heugrO7iXOeXl7Fwelela9/PI/uC4Z79uwmha2WauMdukMgEJa
 8LIV7nwha1OX4YILX5QKxAtiac+k00w=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-XiwDpBXAN_KdUkOU8dV7MQ-1; Mon, 12 Jul 2021 10:57:41 -0400
X-MC-Unique: XiwDpBXAN_KdUkOU8dV7MQ-1
Received: by mail-il1-f200.google.com with SMTP id
 d17-20020a9236110000b02901cf25fcfdcdso12187038ila.9
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R5ZGQf2dT0rdpf34qlCSJQKJZka1u3BdS5XKv7H0Gm0=;
 b=qXw+o7AR8j8izHbzOnYYOMPYc68pnW3i+CtCqaHGc223ra5kGFhONdDAYfuKFsDy1z
 05dqd8Nm5iFepY8rF6wpvIBnuTDpv8PyAWcApjH18+tEVzfBNEKcPh/Zabuc6643iwgI
 Nj7kmiYr8HM85RWLRLPbn4ejPwKu3EQgAL90+4SbECLfJIl73mv3cQ3RVAMNvDF5HmyI
 H3/6Pa8fJOuyGWgO/mWBhcjYn89kBtib2l4xiJKHgX1aJ2h49v1rqXqg/ITJeLx6h4JZ
 oFKYO3Nk2tHeFzSgIeQ365sDNzsvXzsqOBsP2fdudVvc5fMrm6eaHDoU0xfUeeRWKqIb
 64CQ==
X-Gm-Message-State: AOAM532XtcKbTdbE7498YL0lSH9fJlcyfI9xaJYjgCboLz/ixAuf9ZQY
 1mW+MTWW7QwFho3FWsdCINE/LUHYVPXWSPXH/d/hLiTFzHpHn5mWKETBrNpFIbEGjLukBhZo96Q
 W2/+1oBeeYKKxiSg=
X-Received: by 2002:a05:6e02:602:: with SMTP id
 t2mr13605484ils.118.1626101860738; 
 Mon, 12 Jul 2021 07:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH+2UamhbPq0mgCxjPzIISNfpsecRVOsnzTTFiRgGV5GgdAs4h0fZFPPNeTXIZIO9vS9Iabg==
X-Received: by 2002:a05:6e02:602:: with SMTP id
 t2mr13605472ils.118.1626101860527; 
 Mon, 12 Jul 2021 07:57:40 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id k7sm3295108ilr.19.2021.07.12.07.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:57:39 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:57:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 1/6] machine: Set the value of maxcpus to match cpus
 if specified as zero
Message-ID: <20210712145737.6gsawrmzbicgdevx@gator>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210702100739.13672-2-wangyanan55@huawei.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 06:07:34PM +0800, Yanan Wang wrote:
> It is currently allowed to explicitly specified the topology parameters
> as 0 in the -smp cmdlines, such as -smp cpus=8,maxcpus=0,sockets=0. And
> for the values of cpus/sockets/cores/threads, we always determine that
> they are ommited if either set to 0 in the cmdline(e.g. sockets=0) or
> just not explicitly specified, then we compute the ommited values.
> 
> We probably should also treat "maxcpus=0" as ommited and then set the
> value to match smp cpus. This makes cmdlines like "-smp 8, maxcpus=0"
> start to work as "-smp 8,maxcpus=8,sockets=8,cores=1,threads=1".
> 
> Note that this patch won't affect any existing working cmdlines, but
> will allow configuration like "-smp cpus=n,maxcpus=0" to be valid.

Personally, I'd rather see -smp cpus=n,sockets=0 become an error than to
"fix" -smp cpus=n,maxcpus=0.

Thanks,
drew
 
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 14 ++++++++------
>  hw/i386/pc.c      | 14 ++++++++------
>  2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index ffc076ae84..f17bbe3275 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -745,6 +745,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
>      if (config->has_dies && config->dies != 0 && config->dies != 1) {
>          error_setg(errp, "dies not supported by this machine's CPU topology");
> @@ -758,8 +759,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>              sockets = sockets > 0 ? sockets : 1;
>              cpus = cores * threads * sockets;
>          } else {
> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> -            sockets = ms->smp.max_cpus / (cores * threads);
> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +            sockets = maxcpus / (cores * threads);
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> @@ -776,19 +777,19 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    if (ms->smp.max_cpus < cpus) {
> +    if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
>      }
>  
> -    if (sockets * cores * threads != ms->smp.max_cpus) {
> +    if (sockets * cores * threads != maxcpus) {
>          error_setg(errp, "Invalid CPU topology: "
>                     "sockets (%u) * cores (%u) * threads (%u) "
>                     "!= maxcpus (%u)",
>                     sockets, cores, threads,
> -                   ms->smp.max_cpus);
> +                   maxcpus);
>          return;
>      }
>  
> @@ -796,6 +797,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      ms->smp.cores = cores;
>      ms->smp.threads = threads;
>      ms->smp.sockets = sockets;
> +    ms->smp.max_cpus = maxcpus;
>  }
>  
>  static void machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8e1220db72..a9b22fdc01 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -717,6 +717,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      unsigned dies    = config->has_dies ? config->dies : 1;
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
> +    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
>      /* compute missing values, prefer sockets over cores over threads */
>      if (cpus == 0 || sockets == 0) {
> @@ -726,8 +727,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>              sockets = sockets > 0 ? sockets : 1;
>              cpus = cores * threads * dies * sockets;
>          } else {
> -            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> -            sockets = ms->smp.max_cpus / (cores * threads * dies);
> +            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +            sockets = maxcpus / (dies * cores * threads);
>          }
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> @@ -744,19 +745,19 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>          return;
>      }
>  
> -    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    if (ms->smp.max_cpus < cpus) {
> +    if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
>      }
>  
> -    if (sockets * dies * cores * threads != ms->smp.max_cpus) {
> +    if (sockets * dies * cores * threads != maxcpus) {
>          error_setg(errp, "Invalid CPU topology deprecated: "
>                     "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
>                     "!= maxcpus (%u)",
>                     sockets, dies, cores, threads,
> -                   ms->smp.max_cpus);
> +                   maxcpus);
>          return;
>      }
>  
> @@ -765,6 +766,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      ms->smp.threads = threads;
>      ms->smp.sockets = sockets;
>      ms->smp.dies = dies;
> +    ms->smp.max_cpus = maxcpus;
>  }
>  
>  static
> -- 
> 2.19.1
> 


