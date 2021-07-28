Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382683D96A8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:24:11 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8q66-0004rV-0X
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8q4u-00045B-TE
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m8q4t-0005Ln-0P
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627503774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uGkj/LoFjW2hsASbahKiEPUbdjHUYyBfsFkQeXYx7E4=;
 b=giWeVjkXiWLlxiNW45bOuOa6vR1uVvzPISXIu17coMRNOWBUq0XtuWzMWNOJrKIJLg/FoZ
 rBJ6hREaDLXig+hzU/UbL0XgEm40RzSMmQ216c9GMfzsVYt5pvMT+B9hddSnFpN7rhOfMB
 yQIV9Sj6Zmno+In7Mux8kqD4Lmr9rrE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-3wpuq8oiOOmpxQ7B6yofZg-1; Wed, 28 Jul 2021 16:22:53 -0400
X-MC-Unique: 3wpuq8oiOOmpxQ7B6yofZg-1
Received: by mail-io1-f72.google.com with SMTP id
 q137-20020a6b8e8f0000b02904bd1794d00eso2429179iod.7
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uGkj/LoFjW2hsASbahKiEPUbdjHUYyBfsFkQeXYx7E4=;
 b=oXqaQbNAECf5stPRsQv3FJbtBlIWAEmZnn0KOBJ4q6WhqJyOHTS7/aopLjPxwf2gCE
 GJX6TisW+6DU3FCPhuXQ/ROiezxG0vQBvwyvZUBc2De121FFE/DT1LNE7inKZHyFFLte
 WTlrJvQWHLLAf3p1Hpe676m/GWp+3VcyV1gqRK/KyphNdf0jD8ND5kTpleLo8tZ+dvgm
 LcaMKt0KmK1liXcodSZ8A1hMVrmo9dGy5EiTJbfKFf1+47ymWZzz6+6ArcQxWRNCQ4s7
 T7p7WtnMP+ATQmyaY8JqcZi0jcni7OGvu4HAJVP3k48lWP2WgbrPI8g4oW5Jz7DrEIpJ
 DbsQ==
X-Gm-Message-State: AOAM530wKgW1HvS/4YauUEkwhvqWFc93dLA1BGGoTOWhO0XVTkXGPigX
 /Bo+Ti7ZWAVt4QifYmG27pTEPjfIbQY40HbtpU7x6+hJid5ohCtr2CXNy7oPQpUc1M++y09Py0i
 7mxKhOM4SIqnfuuM=
X-Received: by 2002:a92:d388:: with SMTP id o8mr1023668ilo.247.1627503772599; 
 Wed, 28 Jul 2021 13:22:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsHq9AH3P3NLeybb6xRD6piygX4va5hFejWkr1LYn3yXdZ0FfHV81MYGAU6VM4iIcsg0c/Fg==
X-Received: by 2002:a92:d388:: with SMTP id o8mr1023642ilo.247.1627503772384; 
 Wed, 28 Jul 2021 13:22:52 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id m26sm697177ioo.23.2021.07.28.13.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:22:51 -0700 (PDT)
Date: Wed, 28 Jul 2021 22:22:48 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v3 03/11] machine: Set the value of cpus to match
 maxcpus if it's omitted
Message-ID: <20210728202248.ihqn533fvjkc3pmu@gator>
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210728034848.75228-4-wangyanan55@huawei.com>
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

On Wed, Jul 28, 2021 at 11:48:40AM +0800, Yanan Wang wrote:
> Currently we directly calculate the omitted cpus based on the given
> incomplete collection of parameters. This makes some cmdlines like:
>   -smp maxcpus=16
>   -smp sockets=2,maxcpus=16
>   -smp sockets=2,dies=2,maxcpus=16
>   -smp sockets=2,cores=4,maxcpus=16
> not work. We should probably set the value of cpus to match maxcpus
> if it's omitted, which will make above configs start to work.
> 
> So the calculation logic of cpus/maxcpus after this patch will be:
> When both maxcpus and cpus are omitted, maxcpus will be calculated
> from the given parameters and cpus will be set equal to maxcpus.
> When only one of maxcpus and cpus is given then the omitted one
> will be set to its counterpart's value. Both maxcpus and cpus may
> be specified, but maxcpus must be equal to or greater than cpus.
> 
> Note: change in this patch won't affect any existing working cmdlines
> but allows more incomplete configs to be valid.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 29 ++++++++++++++++-------------
>  hw/i386/pc.c      | 29 ++++++++++++++++-------------
>  qemu-options.hx   | 11 ++++++++---
>  3 files changed, 40 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 69979c93dd..958e6e7107 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -755,25 +755,28 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      }
>  
>      /* compute missing values, prefer sockets over cores over threads */
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
> -    if (cpus == 0) {
> +    if (cpus == 0 && maxcpus == 0) {
>          sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
> -        cpus = sockets * cores * threads;
> +    } else {
>          maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -    } else if (sockets == 0) {
> -        cores = cores > 0 ? cores : 1;
> -        threads = threads > 0 ? threads : 1;
> -        sockets = maxcpus / (cores * threads);
> -    } else if (cores == 0) {
> -        threads = threads > 0 ? threads : 1;
> -        cores = maxcpus / (sockets * threads);
> -    } else if (threads == 0) {
> -        threads = maxcpus / (sockets * cores);
> +
> +        if (sockets == 0) {
> +            cores = cores > 0 ? cores : 1;
> +            threads = threads > 0 ? threads : 1;
> +            sockets = maxcpus / (cores * threads);
> +        } else if (cores == 0) {
> +            threads = threads > 0 ? threads : 1;
> +            cores = maxcpus / (sockets * threads);
> +        } else if (threads == 0) {
> +            threads = maxcpus / (sockets * cores);
> +        }
>      }
>  
> +    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
> +    cpus = cpus > 0 ? cpus : maxcpus;
> +
>      if (sockets * cores * threads < cpus) {
>          error_setg(errp, "cpu topology: "
>                     "sockets (%u) * cores (%u) * threads (%u) < "
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a9ff9ef52c..9ad7ae5254 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -725,25 +725,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      dies = dies > 0 ? dies : 1;
>  
>      /* compute missing values, prefer sockets over cores over threads */
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
> -    if (cpus == 0) {
> +    if (cpus == 0 && maxcpus == 0) {
>          sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
> -        cpus = sockets * dies * cores * threads;
> +    } else {
>          maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -    } else if (sockets == 0) {
> -        cores = cores > 0 ? cores : 1;
> -        threads = threads > 0 ? threads : 1;
> -        sockets = maxcpus / (dies * cores * threads);
> -    } else if (cores == 0) {
> -        threads = threads > 0 ? threads : 1;
> -        cores = maxcpus / (sockets * dies * threads);
> -    } else if (threads == 0) {
> -        threads = maxcpus / (sockets * dies * cores);
> +
> +        if (sockets == 0) {
> +            cores = cores > 0 ? cores : 1;
> +            threads = threads > 0 ? threads : 1;
> +            sockets = maxcpus / (dies * cores * threads);
> +        } else if (cores == 0) {
> +            threads = threads > 0 ? threads : 1;
> +            cores = maxcpus / (sockets * dies * threads);
> +        } else if (threads == 0) {
> +            threads = maxcpus / (sockets * dies * cores);
> +        }
>      }
>  
> +    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
> +    cpus = cpus > 0 ? cpus : maxcpus;
> +
>      if (sockets * dies * cores * threads < cpus) {
>          error_setg(errp, "cpu topology: "
>                     "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
> diff --git a/qemu-options.hx b/qemu-options.hx
> index e077aa80bf..0912236b4b 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -210,9 +210,14 @@ SRST
>      Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
>      the machine type board. On boards supporting CPU hotplug, the optional
>      '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
> -    added at runtime. If omitted the maximum number of CPUs will be
> -    set to match the initial CPU count. Both parameters are subject to
> -    an upper limit that is determined by the specific machine type chosen.
> +    added at runtime. When both parameters are omitted, the maximum number
> +    of CPUs will be calculated from the provided topology members and the
> +    initial CPU count will match the maximum number. When only one of them
> +    is given then the omitted one will be set to its counterpart's value.
> +    Both parameters may be specified, but the maximum number of CPUs must
> +    equal to or greater than the initial CPU count. Both parameters are

be equal to

> +    subject to an upper limit that is determined by the specific machine
> +    type chosen.
>  
>      To control reporting of CPU topology information, the number of sockets,
>      dies per socket, cores per die, and threads per core can be specified.
> -- 
> 2.19.1
>

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>


