Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13CC3FB2A7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 10:43:14 +0200 (CEST)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKcsr-0000sm-Nn
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 04:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpv-0006G1-El
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpq-0002Bx-QI
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630312806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IbGQ/0E+rwcz2d9e4UMrUxbrBCbSpVycHY+HYpA6hW0=;
 b=cgU2OtFjNPs8LeFOlNTDQOSqJJIBJFJjOnj8/IixixkNCqZWZCoorIRppBxqztps7mA69M
 8kfi7qojG9/zhYrI4SMTANDqWwfB7o05eeAqrLyWKKGNUtREo/rEUS0BQBE23hrFqYXI+/
 NdX/AZ1aLh0E6FLxwj9Wy48FSuibjF0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-d9I_YcT7MXOCpPP8TucxTA-1; Mon, 30 Aug 2021 04:40:04 -0400
X-MC-Unique: d9I_YcT7MXOCpPP8TucxTA-1
Received: by mail-ed1-f69.google.com with SMTP id
 e6-20020a056402088600b003c73100e376so6127858edy.17
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 01:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IbGQ/0E+rwcz2d9e4UMrUxbrBCbSpVycHY+HYpA6hW0=;
 b=GaOGDq6xbbRZZ3NC9vlqIM2RTAI+v2vM5j5tYoGFW48VBvG4Pi8cRk3iw/4uBZPDvV
 eIDHO/tBO+I+b+3Xrkg2c4ZtFh6F2R2unArEI8tHJR8f5EdO1KtTAqX2vdOHLOyIFe7T
 5vEc0Q/vf7MeSkpR4zYnOWQio1LKfx0qWvBMVde9UktmYiFnRDHRRfQP0li9Tp7b72m1
 aclL1r05KD/rliwhz9EIpjv5WSuVyQTNbXa94U4+n9s1Pnxc78Gw1mkEhLCG8EZ0DMXx
 OGFop9LsDaV8cUDY7xT/dwMc/dAJtx+Q/pbgCIJ052SohnQHbwGKruLqUJiYW9q0MQJt
 YMSw==
X-Gm-Message-State: AOAM532DBQGM7JWS8HS05YUqulI1PvG09EvX/WNiUrrK3BQ/PXfEf+uP
 +2nwBXUdrsMaSmF3Nw+zz3hK3OkYAor5/0yPlFUdKOQSRs9nnhnaEox6ieuHCZd+gGojTuNkr44
 WaK/jrRNpOPpr8qg=
X-Received: by 2002:a17:906:3e1b:: with SMTP id
 k27mr23991395eji.284.1630312803370; 
 Mon, 30 Aug 2021 01:40:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAO9m7bd/iNlkrS+5IpXvktCpE2atNelQZMpJH/LPsF2oftc0vqe12jJm21xdVpt+noqYXOA==
X-Received: by 2002:a17:906:3e1b:: with SMTP id
 k27mr23991370eji.284.1630312803037; 
 Mon, 30 Aug 2021 01:40:03 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id dy7sm2448829edb.38.2021.08.30.01.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:40:02 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:40:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v5 2/3] hw/arm/virt: target-arm: Add A64FX processor
 support to virt machine
Message-ID: <20210830084001.pvsds2ycv6acriit@gator.home>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
 <20210830082820.2690275-3-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210830082820.2690275-3-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 05:28:19PM +0900, Shuuichirou Ishii wrote:
> Add -cpu a64fx to use A64FX processor when -machine virt option is specified.
> In addition, add a64fx to the Supported guest CPU types in the virt.rst document.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  hw/arm/virt.c            | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 59acf0eeaf..850787495b 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -55,6 +55,7 @@ Supported guest CPU types:
>  - ``cortex-a53`` (64-bit)
>  - ``cortex-a57`` (64-bit)
>  - ``cortex-a72`` (64-bit)
> +- ``a64fx`` (64-bit)
>  - ``host`` (with KVM only)
>  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 86c8a4ca3d..3fa4295a78 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("a64fx"),
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


