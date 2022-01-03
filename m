Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A528E483088
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:30:41 +0100 (CET)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4LXz-0003B4-Kt
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:30:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LSv-0005Jy-Ac
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:25:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LSc-0001nI-QT
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rhbKdI2L+n64FvniTwVs30EHeKvUt3sJZ/iH19/8KUs=;
 b=PVq9ibc+5qAyf/khDPgG7pDTBA1RIwp1nr1EGcdnOoklBicoM5HQiWewmAyf35f68BZeMV
 xZHBSqGeowA/mA6Ur0Jk1dVerziXf5FR7Uz5tNZ97rsW4N7t0JKO3Jm2lTae5WsQNyBUZJ
 LWFb9qhwK08RG85H4+zQctcUpCQKjqA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-zrh4_-XGNX6G7fdp-sc6UQ-1; Mon, 03 Jan 2022 06:25:00 -0500
X-MC-Unique: zrh4_-XGNX6G7fdp-sc6UQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so22591229edd.15
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 03:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rhbKdI2L+n64FvniTwVs30EHeKvUt3sJZ/iH19/8KUs=;
 b=F+PGcCdVYVQpRRWGGTfTAKMGp8DXXnZ7YjRxk9TAgNzE0nmSUulMkt/qrAZeNSUQS9
 /MfIyNCj111BfMBOUvAfb5ea6Zq7i6zB3cbxXNZSIfl/Puvp+noxldmTXrrE+5namQe0
 EEexY25BqQeZZWqjTVIEw0txnahvOTE5symKYHY+4CMWZd99f9mop/y5MThQ5VwV6AfG
 rYjHFJnY0paRit2Kg1oD7DP/2Rbysrjvwc0c3xXdy1WOLtrD9bbbpRtqDV205hvhKhaL
 yuZnWAXQkG0Zk1XsXhfzet2VE0NR2Ka+ZpiWPTjIo86X3mV+yb6Z1UK5y71wCv9YSUSU
 NJCQ==
X-Gm-Message-State: AOAM532HgwVrkL7yL5yQKEgj70V9Lv5JGnw3/IGQtyUgFDEnb9b/I6Eh
 O41AxUCulWQhhtWY0Gath/v0HkfHCmm5cCZb5mv8F0GRkCOome436mjhgwmutZHDp1BhHT+khfx
 8mxgRsQwmc6kNplE=
X-Received: by 2002:aa7:d6d6:: with SMTP id x22mr44544471edr.132.1641209099647; 
 Mon, 03 Jan 2022 03:24:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8CC3uHJ0mBCdXFmGo+ZBfzsH8dulCEQC6Kt5gW8h8AxciRwrutf9WvzqJfJH4Jqi4PsnePQ==
X-Received: by 2002:aa7:d6d6:: with SMTP id x22mr44544454edr.132.1641209099415; 
 Mon, 03 Jan 2022 03:24:59 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id e4sm10832046ejs.13.2022.01.03.03.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:24:59 -0800 (PST)
Date: Mon, 3 Jan 2022 12:24:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 1/7] hw/arm/virt: Support CPU cluster on ARM virt
 machine
Message-ID: <20220103112457.56iglr2wbcrbws2y@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 03, 2022 at 04:46:30PM +0800, Yanan Wang wrote:
> ARM64 machines like Kunpeng Family Server Chips have a level
> of hardware topology in which a group of CPU cores share L3
> cache tag or L2 cache. For example, Kunpeng 920 typically
> has 6 or 8 clusters in each NUMA node (also represent range
> of CPU die), and each cluster has 4 CPU cores. All clusters
> share L3 cache data, but CPU cores in each cluster share a
> local L3 tag.
> 
> Running a guest kernel with Cluster-Aware Scheduling on the
> Hosts which have physical clusters, if we can design a vCPU
> topology with cluster level for guest kernel and then have
> a dedicated vCPU pinning, the guest will gain scheduling
> performance improvement from cache affinity of CPU cluster.
> 
> So let's enable the support for this new parameter on ARM
> virt machines. After this patch, we can define a 4-level
> CPU hierarchy like: cpus=*,maxcpus=*,sockets=*,clusters=*,
> cores=*,threads=*.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c   |  1 +
>  qemu-options.hx | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba..f413e146d9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2700,6 +2700,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->unplug_request = virt_machine_device_unplug_request_cb;
>      hc->unplug = virt_machine_device_unplug_cb;
>      mc->nvdimm_supported = true;
> +    mc->smp_props.clusters_supported = true;
>      mc->auto_enable_numa_with_memhp = true;
>      mc->auto_enable_numa_with_memdev = true;
>      mc->default_ram_id = "mach-virt.ram";
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd1f8135fb..69ef1cdb85 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -277,6 +277,16 @@ SRST
>  
>          -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
>  
> +    The following sub-option defines a CPU topology hierarchy (2 sockets
> +    totally on the machine, 2 clusters per socket, 2 cores per cluster,
> +    2 threads per core) for ARM virt machines which support sockets/clusters
> +    /cores/threads. Some members of the option can be omitted but their values
> +    will be automatically computed:
> +
> +    ::
> +
> +        -smp 16,sockets=2,clusters=2,cores=2,threads=2,maxcpus=16
> +
>      Historically preference was given to the coarsest topology parameters
>      when computing missing values (ie sockets preferred over cores, which
>      were preferred over threads), however, this behaviour is considered
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


