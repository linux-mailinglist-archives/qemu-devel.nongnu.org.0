Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2D3824AB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:46:26 +0200 (CEST)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX1E-0002yO-Gn
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWyz-0001xT-Ta
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWys-0001Hl-Ac
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621233837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jnz7vgZp8IFR0leJpkXvhmBpMNZia4tjRUIGnAecZgc=;
 b=RRLTEoiuPuNZ/MIgjOymdgZ5Wn7cKEk1gHFhnHhaFk2RVyQ2pMegRWTEV36bmnqU0YhdmE
 DR0MhhUvr9NbYJoVlAw2F5J03MDmJ0yw3w8nUp+JucFVkGZZ4zYZ9zrTgAhs9SwQ49mT7o
 xz7pobzGMZ0bwCGEGkyrWuXRzwdZ5TA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-nSXcXjhVPlurmAi-WTctfA-1; Mon, 17 May 2021 02:43:56 -0400
X-MC-Unique: nSXcXjhVPlurmAi-WTctfA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w22-20020a05640234d6b029038d04376b6aso3321094edc.21
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 23:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jnz7vgZp8IFR0leJpkXvhmBpMNZia4tjRUIGnAecZgc=;
 b=j+k/CLyZGfI0aie81CeykN7i1+0nblVxp4aqeKZSUqY25YsU0kYjmsMtYfe30aO2uW
 ij7DbSCTdVZt8TmThmv3Q+MJ9fLP9/QETT01JX8fn6VkwdmMPy5s55HVW0yIFJ0udHbc
 aE55ugtRiP6rN5NN1m8AIuSR849X5PDoXdQSIp0bw7wbB3LNIjGpM+YVacCUzynVNhu6
 EcY+1AN+ptjnRz9+LERmKA+dT6NmWDiA7NraU0esYEIBSO6xZbv4sAhWHQ6HMWyX9yj7
 MV7vUJ7txVd3+TjIraalZKhfr/JdSKK8lCBqMUflXHLmw/bs/eT/vAND8S3MM0o55MVT
 prow==
X-Gm-Message-State: AOAM532l3hoCUxyJcwORJTzpyOhDmVG0jDRfFE9aSivml/XL3ECzW+0L
 +ERvPiyH9m2dVg/eFyPJt+Xql9UmOJVwWV+2582nMyZAXT7ZYj75YPl/SC096iGha/ziLO88k3/
 OhcgPspPFjy6DOsU=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr24538685edu.273.1621233834960; 
 Sun, 16 May 2021 23:43:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRhrjQJSNaGtSyPQ65hxXcnghr7DP2reIbMOmgIbDjXWag+CZBXcKUH3Nw135Xx30ypcdOpw==
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr24538658edu.273.1621233834849; 
 Sun, 16 May 2021 23:43:54 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id gx23sm72736ejb.125.2021.05.16.23.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:43:54 -0700 (PDT)
Date: Mon, 17 May 2021 08:43:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
Message-ID: <20210517064352.fhif7lomuli3mrzp@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 16, 2021 at 06:28:55PM +0800, Yanan Wang wrote:
> We create and initialize a cpuobj for each present cpu in
> machvirt_init(). Now we also initialize the cpu member of
> structure CPUArchId for each present cpu in the function.
> 
> This will be used to determine whether a cpu is present
> when generating ACPI tables in later patches.
> 
> Co-developed-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e5dcdebdbc..50e324975f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2061,6 +2061,13 @@ static void machvirt_init(MachineState *machine)
>          }
>  
>          qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +
> +        /*
> +         * As ARM cpu hotplug is not supported yet, we initialize
> +         * the present cpu members here.
> +         */
> +        machine->possible_cpus->cpus[n].cpu = cpuobj;
> +
>          object_unref(cpuobj);
>      }
>      fdt_add_timer_nodes(vms);
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


