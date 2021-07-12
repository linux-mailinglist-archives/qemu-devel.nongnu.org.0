Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6183C5ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:06:52 +0200 (CEST)
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xWF-0000QK-Hr
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xTc-0005RS-9O
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xTa-00082h-Ow
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626102246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=80z2LaLC6iKOHXIGV9ORt+lXN6Ty287b/aNyAxyhyFc=;
 b=NQFhyFDP3HfMX1uj7bHhcme3zRfNtjizOQhXcM87wXf0L8vZwtmqlmXWb8jRebkZlVum2g
 UCAHUoWELEp9EvSVI8i8aKjJrPKckF+1ywKWnUneI48L7g2fPLywyBdRQ0vgGbSm/y5wOS
 7utAF/2klVdmb1+QlP2/VzFweW2gOJU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-85Fr7ehdMpuUJpjZy0pTkQ-1; Mon, 12 Jul 2021 11:04:05 -0400
X-MC-Unique: 85Fr7ehdMpuUJpjZy0pTkQ-1
Received: by mail-il1-f198.google.com with SMTP id
 c7-20020a92b7470000b0290205c6edd752so8502625ilm.14
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=80z2LaLC6iKOHXIGV9ORt+lXN6Ty287b/aNyAxyhyFc=;
 b=jS5SpJbzNl1aU6WRPCgblaVK9QFZ+8CVb49fcpIdi09FtTiFTPGBFLGX26DM/Kpj3K
 5oeGaHmqtGRdddpa4xIfI8iWh8hvnqHXiGVpXYVshhBkwDNvm+A9ruVdkH+UG9qt05jx
 XkrmI/y96hHbazns6d/t30NPkioGv8S4x2zdQ9SmCb7jjpSFM6Qpf7NhKz9vP9uZy/r2
 IktdepbMq6kklP6zgqDeIF+kw2vzZSAzixLL4mPEbq4FR5tCevyBwJyCh9eSufnPSVsQ
 /l1Xn71rtEO/rbKay/24q5bbtAuRSoHg9Ws5i+xp+uO0ZtCuUw/wKhXg48ZU7DevDoa7
 JhFA==
X-Gm-Message-State: AOAM5313R9tCRNjZF30627eOEa5Hm0jWmsUEt0dGwOtH2cS2+6gaWDOz
 UlTiPU84niE1xzXvDYsstqQ4Oa4mIaQdiQX9dbuaK/QpUOt00YMvSqoBIrkJdwirEfANhlcoXeH
 7O5wgqXtnDRA3mns=
X-Received: by 2002:a05:6e02:78c:: with SMTP id
 q12mr26098787ils.243.1626102244612; 
 Mon, 12 Jul 2021 08:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9x8oCoWXYZ0L8uo2prlretrJOpfrJZYB6vwxSaCe0kWR4bd7CUIDzVF1J9C5uKPdpDkGX1Q==
X-Received: by 2002:a05:6e02:78c:: with SMTP id
 q12mr26098766ils.243.1626102244434; 
 Mon, 12 Jul 2021 08:04:04 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id i7sm7859092ilb.67.2021.07.12.08.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:04:04 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:04:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 3/6] pc/machine: Perform zero-check for the value of
 -smp dies
Message-ID: <20210712150401.is7nxfwewf7taexa@gator>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210702100739.13672-4-wangyanan55@huawei.com>
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

On Fri, Jul 02, 2021 at 06:07:36PM +0800, Yanan Wang wrote:
> It's possible that dies parameter is explicitly specified as "dies=0"
> in the cmdline, if so we will wrongly calculate the other ommited
> parameters such as "sockets = maxcpus / (dies * cores * threads);"
> with a zeroed dies value.
> 
> So perform zero-check (default the value to 1 if zeroed) for -smp dies
> before using it to calculate other parameters.

OK, dies=0 may make some sense for a user that doesn't want to describe
dies.

Reviewed-by: Andrew Jones <drjones@redhat.com>

> 
> Fixes: 1b45842203540 (vl.c: Add -smp, dies=* command line support and update doc)
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/i386/pc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a44511c937..93d1f12a49 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -714,12 +714,14 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
>  {
>      unsigned cpus    = config->has_cpus ? config->cpus : 0;
>      unsigned sockets = config->has_sockets ? config->sockets : 0;
> -    unsigned dies    = config->has_dies ? config->dies : 1;
> +    unsigned dies    = config->has_dies ? config->dies : 0;
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
>      /* compute missing values, prefer sockets over cores over threads */
> +    dies = dies > 0 ? dies : 1;
> +
>      if (cpus == 0 || sockets == 0) {
>          cores = cores > 0 ? cores : 1;
>          threads = threads > 0 ? threads : 1;
> -- 
> 2.19.1
> 


