Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25AA3C5F3E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:26:45 +0200 (CEST)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xpU-0003Yk-Vq
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xoU-0002Vz-Od
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xoR-0006eG-HE
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gYUHoLqKEb5I51Mcw7+KdMIRSyPgLB5SzSXub2sDc2M=;
 b=WYs5Q3sYNKZyV2Uj0APnEWyDhTcjl9yjjO6LAgVC4jb2M2JQMovXPG6Bp0wlTM5PfShFFg
 sBSQPtCbFbg9OzlR9P1mD8TGUNSusob425GZG1I6mBvdNrQnCVGHZ2S3ccZ3g21TPvv4tX
 IcckyEFg8k3IleWBkN7rYWapK3+Cjvg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-i001Gki_NpmWqXNBm590_Q-1; Mon, 12 Jul 2021 11:25:36 -0400
X-MC-Unique: i001Gki_NpmWqXNBm590_Q-1
Received: by mail-io1-f71.google.com with SMTP id
 n13-20020a5ed90d0000b02904f43c8bffc4so12053276iop.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gYUHoLqKEb5I51Mcw7+KdMIRSyPgLB5SzSXub2sDc2M=;
 b=lbX0NQFxxztlZFiHub60KaMq5Vww0GLnBf+26P2O9Oob8BRCBcvdcT6s1FKO1JlGe3
 W2qSP+X82z3V8RQ8eppak47Qa1o6YTFaRz6izxZZJyNKhk2ynjvLVuYspxr33Srpbtli
 TrntABtQNfM1pONYejTggLZUGre5RAWHpY8UgfxS0F3XlIcJQ8lCaDWAcbRtMPkKxWoD
 2Ah2b+2bSG3Jus+x4gxbTN/LyUJzoWumgPrhI8angCXsCsF0dahhVEI/kx6KkbfRcBpR
 r7IR4bdWeb4UFdmCe5bxxE5wUYwWz6rGFel07aEXlz46KoWS6+hREwLUnYinGXnzhA2G
 qsOg==
X-Gm-Message-State: AOAM531enefkxD0n4LbPwLjYuB4Yc6wJu5j+HyQ3kG3MlN/qSh/6txrH
 rctp71xBhhOYR29vUcld0aM+3bBjhdmYoI8mG1rkiT2uy1hajEGNJQy1VwqVmkNJVlJxZqcyJW7
 gloqDaKmhQGmYbMs=
X-Received: by 2002:a92:d10:: with SMTP id 16mr37958255iln.189.1626103535771; 
 Mon, 12 Jul 2021 08:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfkS3P/0NLulpbP3vqSA2lPI1hDXrGYMijxEL6tfHu/qt+v1ETZFa4iufNet5jR93kkuQPLQ==
X-Received: by 2002:a92:d10:: with SMTP id 16mr37958235iln.189.1626103535522; 
 Mon, 12 Jul 2021 08:25:35 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id y22sm1280262ioy.50.2021.07.12.08.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:25:35 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:25:32 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 4/6] machine: Uniformly use maxcpus to calculate the
 missing values
Message-ID: <20210712152532.n36xvjbbjpxjzhrn@gator>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210702100739.13672-5-wangyanan55@huawei.com>
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

On Fri, Jul 02, 2021 at 06:07:37PM +0800, Yanan Wang wrote:
> We are currently using maxcpus to calculate value of sockets but using
> cpus to calculate value of cores/threads. This makes cmdlines like
> "-smp 8,maxcpus=12,cores=4" work while "-smp 8,maxcpus=12,sockets=3"
> break the invalid cpu topology check.
> 
> This patch allows us to uniformly use maxcpus to calculate the missing
> values. Also the if branch of "cpus == 0 || sockets == 0" was splited
> into branches of "cpus == 0" and "sockets == 0" so that we can clearly
> figure out that we are parsing -smp cmdlines with a preference of cpus
> over sockets over cores over threads.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 36 +++++++++++++++++++-----------------
>  hw/i386/pc.c      | 37 +++++++++++++++++++------------------
>  2 files changed, 38 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1e194677cd..58882835be 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -752,34 +752,36 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
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
> -            cpus = cores * threads * sockets;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (cores * threads);
> -            sockets = sockets > 0 ? sockets : 1;
> -        }
> +        cpus = sockets * cores * threads;
> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +    } else if (sockets == 0) {
> +        cores = cores > 0 ? cores : 1;
> +        threads = threads > 0 ? threads : 1;
> +        sockets = maxcpus / (cores * threads);
> +        sockets = sockets > 0 ? sockets : 1;

As stated in the other patch, this rounding up of a fractional sockets
shouldn't be here. maxcpus or (cpus==maxcpus) should always be selected by
the user to be a product of whole number sockets, cores, threads.

>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * threads);
> +        cores = maxcpus / (sockets * threads);
>          cores = cores > 0 ? cores : 1;

Now that we're using maxcpus for the calculation, then no rounding for
cores either...

>      } else if (threads == 0) {
> -        threads = cpus / (cores * sockets);
> +        threads = maxcpus / (sockets * cores);
>          threads = threads > 0 ? threads : 1;

...or threads.

> -    } else if (sockets * cores * threads < cpus) {
> +    }
> +
> +    if (sockets * cores * threads < cpus) {
>          error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> +                   "sockets (%u) * cores (%u) * threads (%u) "
> +                   "< smp_cpus (%u)",

Why make this change?

>                     sockets, cores, threads, cpus);
>          return;
>      }
>  
> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
>      if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
> @@ -795,9 +797,9 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      }
>  
>      ms->smp.cpus = cpus;
> +    ms->smp.sockets = sockets;
>      ms->smp.cores = cores;
>      ms->smp.threads = threads;
> -    ms->smp.sockets = sockets;
>      ms->smp.max_cpus = maxcpus;
>  }
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 93d1f12a49..1812f33ab1 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -721,35 +721,36 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>  
>      /* compute missing values, prefer sockets over cores over threads */
>      dies = dies > 0 ? dies : 1;
> +    maxcpus = maxcpus > 0 ? maxcpus : cpus;
>  
> -    if (cpus == 0 || sockets == 0) {
> +    if (cpus == 0) {
> +        sockets = sockets > 0 ? sockets : 1;
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
> -        if (cpus == 0) {
> -            sockets = sockets > 0 ? sockets : 1;
> -            cpus = cores * threads * dies * sockets;
> -        } else {
> -            maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -            sockets = maxcpus / (dies * cores * threads);
> -            sockets = sockets > 0 ? sockets : 1;
> -        }
> +        cpus = sockets * dies * cores * threads;
> +        maxcpus = maxcpus > 0 ? maxcpus : cpus;
> +    } else if (sockets == 0) {
> +        cores = cores > 0 ? cores : 1;
> +        threads = threads > 0 ? threads : 1;
> +        sockets = maxcpus / (dies * cores * threads);
> +        sockets = sockets > 0 ? sockets : 1;
>      } else if (cores == 0) {
>          threads = threads > 0 ? threads : 1;
> -        cores = cpus / (sockets * dies * threads);
> +        cores = maxcpus / (sockets * dies * threads);
>          cores = cores > 0 ? cores : 1;
>      } else if (threads == 0) {
> -        threads = cpus / (cores * dies * sockets);
> +        threads = maxcpus / (sockets * dies * cores);
>          threads = threads > 0 ? threads : 1;
> -    } else if (sockets * dies * cores * threads < cpus) {
> +    }
> +
> +    if (sockets * dies * cores * threads < cpus) {
>          error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> +                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
> +                   "< smp_cpus (%u)",
>                     sockets, dies, cores, threads, cpus);
>          return;
>      }
>  

Same comments as for the general function.

Thanks,
drew

> -    maxcpus = maxcpus > 0 ? maxcpus : cpus;
> -
>      if (maxcpus < cpus) {
>          error_setg(errp, "maxcpus must be equal to or greater than smp");
>          return;
> @@ -765,10 +766,10 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>      }
>  
>      ms->smp.cpus = cpus;
> -    ms->smp.cores = cores;
> -    ms->smp.threads = threads;
>      ms->smp.sockets = sockets;
>      ms->smp.dies = dies;
> +    ms->smp.cores = cores;
> +    ms->smp.threads = threads;
>      ms->smp.max_cpus = maxcpus;
>  }
>  
> -- 
> 2.19.1
> 


