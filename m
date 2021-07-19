Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38A3CE5B8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 18:43:27 +0200 (CEST)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5WMY-0005ZG-93
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 12:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WLM-0004kw-Db
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m5WLK-00072T-5e
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 12:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626712928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUaGcCOqtausW+bLFucJSEBo0WuZmix2Y1zBuMFklKU=;
 b=SED2xEAXez7fxDregbXbFtwChqaMMc18sjbyZCL77mFzp9BZ4DAqpr45v8EK4zjvnflmx1
 iFRn8pafZrLnlpHWluwlWpxVd8c4hsF2WsX0ucymGLhQL+CEV9dtavCq8l9Z4UsuALv8Iy
 DUBmgkjNeCfvlE96ZGR/pQzhTS0Ayno=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-d960ozKfOwC215QK34Tfkg-1; Mon, 19 Jul 2021 12:42:07 -0400
X-MC-Unique: d960ozKfOwC215QK34Tfkg-1
Received: by mail-io1-f72.google.com with SMTP id
 k2-20020a5d8b020000b029050b6f9cfe31so13061663ion.11
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 09:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oUaGcCOqtausW+bLFucJSEBo0WuZmix2Y1zBuMFklKU=;
 b=aQ+57usqXY4D+nz52jWVz8QrWMUjxH3OC/mxZWZ0IrXmfJ1m3wD/otbjr4iB9qtFhb
 CoIcPX3Kk/hGroc7A7kSzSBNh7klXsZiSblfbAkT47V39j05/XYuKxyXv65b55v06ZOd
 4Us4JspPu1W7LbX5zCZS2ydDUOdr14Tqm0uzzMkI4heDvb/H+/FacLZy5M+XzX/hxxlt
 rTVAo+4ASu4nS01qTBiJKcXeDiRSft+dDOqkXGlpmkV773whe8/Mv+CLG2SYXv3DSK/C
 2jN//jdFF2XmgFCMk12KXJvgUt7IFISwoCaPJ8sE+a1wHOi9Q3Ue1T+RHdjUK4xA2+oi
 OcVA==
X-Gm-Message-State: AOAM532yQPvifdRbgF3BD5jl7qLc6ho7NVGLtv20aLqUZ65pUWZJnZ86
 ZgUZUJziHBBzE63++cYbkG5UmdUA03qjNayNZrREHpfLWVq95Xmf55wjhwaUsgC47+M8K6j2lsx
 wvhVM5cpF0Hztupc=
X-Received: by 2002:a05:6638:6a6:: with SMTP id
 d6mr22299432jad.118.1626712926680; 
 Mon, 19 Jul 2021 09:42:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHvGIiu4MvtZW8aPAoDvN1nXfl7scTIa5DmOixoPEcfqlkfNGtHgJz/A12/Y3sBFhwmQf8zw==
X-Received: by 2002:a05:6638:6a6:: with SMTP id
 d6mr22299405jad.118.1626712926465; 
 Mon, 19 Jul 2021 09:42:06 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id x1sm10530426ioa.54.2021.07.19.09.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 09:42:06 -0700 (PDT)
Date: Mon, 19 Jul 2021 18:42:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 04/11] machine: Use the computed parameters to
 calculate omitted cpus
Message-ID: <20210719164203.r3f4qdbw3y3ieghb@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210719032043.25416-5-wangyanan55@huawei.com>
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

On Mon, Jul 19, 2021 at 11:20:36AM +0800, Yanan Wang wrote:
> Currently we directly calculate the omitted cpus based on the already
> provided parameters. This makes some cmdlines like:
>   -smp maxcpus=16
>   -smp sockets=2,maxcpus=16
>   -smp sockets=2,dies=2,maxcpus=16
>   -smp sockets=2,cores=4,maxcpus=16
> not work. We should probably use the computed paramters to calculate
> cpus when maxcpus is provided while cpus is omitted, which will make
> above configs start to work.
> 
> Note: change in this patch won't affect any existing working cmdlines
> but allows more incomplete configs to be valid.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c9f15b15a5..668f0a1553 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -767,26 +767,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>          return;
>      }
>  
> -    /* compute missing values, prefer sockets over cores over threads */
>      maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    if (cpus == 0) {
> -        sockets = sockets > 0 ? sockets : 1;
> -        cores = cores > 0 ? cores : 1;
> -        threads = threads > 0 ? threads : 1;
> -        cpus = sockets * dies * cores * threads;
> -        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -    } else if (sockets == 0) {
> +    /* compute missing values, prefer sockets over cores over threads */
> +    if (sockets == 0) {
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
>          sockets = maxcpus / (dies * cores * threads);
> +        sockets = sockets > 0 ? sockets : 1;
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
>          cores = maxcpus / (sockets * dies * threads);
> +        cores = cores > 0 ? cores : 1;
>      } else if (threads == 0) {
>          threads = maxcpus / (sockets * dies * cores);
> +        threads = threads > 0 ? threads : 1;
>      }

I didn't think we wanted this rounding which this patch adds back into
cores and threads and now also sockets.

>  
> +    /* use the computed parameters to calculate the omitted cpus */
> +    cpus = cpus > 0 ? cpus : sockets * dies * cores * threads;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;

It doesn't really matter, but I think I'd rather write this like

 maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
 cpus = cpus > 0 ? cpus : maxcpus;

> +
>      if (sockets * dies * cores * threads < cpus) {
>          g_autofree char *dies_msg = g_strdup_printf(
>              mc->smp_dies_supported ? " * dies (%u)" : "", dies);
> -- 
> 2.19.1
> 

Thanks,
drew


