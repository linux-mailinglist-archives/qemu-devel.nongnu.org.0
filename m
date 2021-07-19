Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1743CE50B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:37:56 +0200 (CEST)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WHD-0007W0-2P
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WGF-0006Po-Kt
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WGD-0003Qd-8Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626712612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kLmp/KI0ixsGKZAaIswptx+HYl+8rG0Fa0IkAbWKWaU=;
 b=dEnGbdEI9le5c2KJetiZFf9r0WVfL7y8Fv6QBEgXrtmQ6nbX00MOcbyhQNP6O/A7ZzXod7
 9bBp8dcM+/tDLEdVmVKKgRKAEvsyYPQ6OTIHIEK8sxPC4Fwdzu4whgjH8Ooa38tSKWe3lq
 Bkg00yqbef0a2xM2fh2ZV2ZAWQDupRQ=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-LfBEuc89PAmAQmFuJPlehQ-1; Mon, 19 Jul 2021 12:36:50 -0400
X-MC-Unique: LfBEuc89PAmAQmFuJPlehQ-1
Received: by mail-il1-f199.google.com with SMTP id
 w8-20020a056e021c88b02902095727d18dso11018014ill.17
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 09:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kLmp/KI0ixsGKZAaIswptx+HYl+8rG0Fa0IkAbWKWaU=;
 b=YgyIsx4huu05l63ClweFqjUFMXeenSnpGF8GdyillHRpFu1BDpTS3Lh1V1F//s73pq
 pFPB2wnN+vvn2OhtlVN09Ss+pXY3ElfXxvnfo+HVa2ZVnnAtyNkTgUuSYDD6h9OZ0oml
 VhqWPJbl66iHXcnsxnjgrhL0auSzE7lFjkZmjuXDsL7F3qms6t4ildSwoNswpaEi3tfi
 4QjrIg6baujz+uR8YmcA4HvQ+1pMu+rfWqYI9UmwcorBaWZ3BY5lPpOBZ/2mSajMIE+k
 9Em5s41yM7yI+EnAJ0TwqS/FtqTcBSBhdWDWN2fa9r5zsCZS9sZpWlerRoMamERDbVas
 xo7g==
X-Gm-Message-State: AOAM531YWy3R4ONOC5myWDxGOcKg2wjFRxbCv4/JLqvKG+9slRBRUotI
 Dl6RRkm4UYIRTRKQS9YXupu40S2+1mSNAnoLPvcg/3tsheFnb6/t2eVxSdH42QlS/VfbwcH2iLv
 oFIwscVEG8ct9cqI=
X-Received: by 2002:a6b:6209:: with SMTP id f9mr20012342iog.147.1626712610354; 
 Mon, 19 Jul 2021 09:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0dGbvrsvINIZzj0WCjGvXSIbxLsOg+/RSHeMMF+/opN82yaE1ES36nC6vGdH9anHiUdaZJA==
X-Received: by 2002:a6b:6209:: with SMTP id f9mr20012326iog.147.1626712610118; 
 Mon, 19 Jul 2021 09:36:50 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id x2sm3639158iob.45.2021.07.19.09.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 09:36:49 -0700 (PDT)
Date: Mon, 19 Jul 2021 18:36:47 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 03/11] machine: Uniformly use maxcpus to
 calculate the omitted parameters
Message-ID: <20210719163647.or6tvr3rmgirctj4@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 11:20:35AM +0800, Yanan Wang wrote:
> We are currently using maxcpus to calculate the omitted sockets
> but using cpus to calculate the omitted cores/threads. This makes
> cmdlines like:
>   -smp cpus=8,maxcpus=16
>   -smp cpus=8,cores=4,maxcpus=16
>   -smp cpus=8,threads=2,maxcpus=16
> work fine but the ones like:
>   -smp cpus=8,sockets=2,maxcpus=16
>   -smp cpus=8,sockets=2,cores=4,maxcpus=16
>   -smp cpus=8,sockets=2,threads=2,maxcpus=16
> break the invalid cpu topology check.
> 
> Since we require for the valid config that the sum of "sockets * cores
> * dies * threads" should equal to the maxcpus, we should uniformly use
> maxcpus to calculate their omitted values.
> 
> Also the if-branch of "cpus == 0 || sockets == 0" was splited into two
> branches of "cpus == 0" and "sockets == 0" so that we can clearly read
> that we are parsing -smp cmdlines with a preference of cpus over sockets
> over cores over threads.
> 
> Note: change in this patch won't affect any existing working cmdlines
> but improves consistency and allow more incomplete configs to be valid.

We also remove rounding of cores and threads when the math doesn't come
out right, which could possible start reporting a bad config as invalid
which worked before. Or were you able to prove that that can't happen with
your testing?

> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index ed6712e964..c9f15b15a5 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -768,24 +768,26 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      }
>  
>      /* compute missing values, prefer sockets over cores over threads */
> -    if (cpus == 0 || sockets == 0) {
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +
> +    if (cpus == 0) {
> +        sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
> -        if (cpus == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            cpus = sockets * dies * cores * threads;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (dies * cores * threads);
> -        }
> +        cpus = sockets * dies * cores * threads;
> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +    } else if (sockets == 0) {
> +        cores = cores > 0 ? cores : 1;
> +        threads = threads > 0 ? threads : 1;
> +        sockets = maxcpus / (dies * cores * threads);
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * dies * threads);
> -        cores = cores > 0 ? cores : 1;
> +        cores = maxcpus / (sockets * dies * threads);
>      } else if (threads == 0) {
> -        threads = cpus / (sockets * dies * cores);
> -        threads = threads > 0 ? threads : 1;
> -    } else if (sockets * dies * cores * threads < cpus) {
> +        threads = maxcpus / (sockets * dies * cores);
> +    }
> +
> +    if (sockets * dies * cores * threads < cpus) {
>          g_autofree char *dies_msg = g_strdup_printf(
>              mc->smp_dies_supported ? " * dies (%u)" : "", dies);
>          error_setg(errp, "cpu topology: "
> @@ -795,8 +797,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
>      if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


