Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9A483094
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:33:25 +0100 (CET)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Lae-0005rW-Cr
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:33:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LT2-0005Qx-Pd
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LSt-0002A7-5k
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pC9O6tJM+BPo6eDubYV03H6gARf8SbN10d8Rk6tr5ig=;
 b=SdJc3VcIUBLGbI4/BDi6XjRrJStKMwIjVXV8n3IZP+ujHToB7IpK9LdQ3KAn8GWRDGmJVS
 tcpUic5lMUr6WU1XsCQnKHR8hB98cuS9WKiTYJ9fiy6PA/SUi46laCIhBCDVVCZnfyQ7y+
 1kN5iKsQ3EJym9yCmd5KFVW1fZJlbuA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-06konbY5MKOhX-hiXsTDDg-1; Mon, 03 Jan 2022 06:25:20 -0500
X-MC-Unique: 06konbY5MKOhX-hiXsTDDg-1
Received: by mail-ed1-f70.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so22651510edc.6
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 03:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pC9O6tJM+BPo6eDubYV03H6gARf8SbN10d8Rk6tr5ig=;
 b=I625GwIrCT92jY2i0oxs5/eSD2H3iMgGqCO0NRlnnT4eN01o1xd6yG/BvtScF89F6q
 xZTOrWE/oHOs4kR89HmmuCr91QlGjkKgEGAfjxUevbFKvzIcpO4+JtkcWHni2GuSZ2Zk
 Vzz49glWwWFPNq6aPbkEVRbsxQL/eX8Ix3LbSlKsV9lzlPZ89es7wza4onxPWIv2okpX
 5SZsVge/eCOm0VeJjsglSzIde2sOhQ55GuXFpwJqUjVmAMJ4Tl2ZN/1OezCZEK0g5Rat
 cHgS1XbvBpFK7rGDXRsehwqc041kzTXR13yOVh/c0e+qaLO99UzgsRXTfSZ+Cs6OWE9x
 YzxQ==
X-Gm-Message-State: AOAM5334qyVrkNfltxfBce1B8Hl67ilSPQxjdu24cgoRVikIAoSdfPnz
 eDSRtgmAOAcmEswhyKFnTiWTQktH3xGhPS+wIqAANWVNGPmvmfHcWsKxa9ueOuO3NUAL50Ao/4t
 xYgLmil+UjSJG8tY=
X-Received: by 2002:a17:907:96a4:: with SMTP id
 hd36mr35406079ejc.574.1641209118937; 
 Mon, 03 Jan 2022 03:25:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylli0gBOPOBftYOughZLyRXCKGTrkl2Y+4inhUmdcgJNrGBa4IKlIGDF2+7IY+Sp57RP4+Uw==
X-Received: by 2002:a17:907:96a4:: with SMTP id
 hd36mr35406062ejc.574.1641209118715; 
 Mon, 03 Jan 2022 03:25:18 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id dd6sm10579108ejc.212.2022.01.03.03.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:25:18 -0800 (PST)
Date: Mon, 3 Jan 2022 12:25:16 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 2/7] hw/arm/virt: Support cluster level in DT cpu-map
Message-ID: <20220103112516.xgc7jhzb6d734jmy@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-3-wangyanan55@huawei.com>
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

On Mon, Jan 03, 2022 at 04:46:31PM +0800, Yanan Wang wrote:
> Support one cluster level between core and physical package in the
> cpu-map of Arm/virt devicetree. This is also consistent with Linux
> Doc "Documentation/devicetree/bindings/cpu/cpu-topology.txt".
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f413e146d9..fc5eea8c8c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -430,9 +430,8 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>           * can contain several layers of clustering within a single physical
>           * package and cluster nodes can be contained in parent cluster nodes.
>           *
> -         * Given that cluster is not yet supported in the vCPU topology,
> -         * we currently generate one cluster node within each socket node
> -         * by default.
> +         * Note: currently we only support one layer of clustering within
> +         * each physical package.
>           */
>          qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>  
> @@ -442,14 +441,16 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>  
>              if (ms->smp.threads > 1) {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
> -                    cpu / (ms->smp.cores * ms->smp.threads),
> +                    "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
> +                    cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
> +                    (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
>                      (cpu / ms->smp.threads) % ms->smp.cores,
>                      cpu % ms->smp.threads);
>              } else {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/socket%d/cluster0/core%d",
> -                    cpu / ms->smp.cores,
> +                    "/cpus/cpu-map/socket%d/cluster%d/core%d",
> +                    cpu / (ms->smp.clusters * ms->smp.cores),
> +                    (cpu / ms->smp.cores) % ms->smp.clusters,
>                      cpu % ms->smp.cores);
>              }
>              qemu_fdt_add_path(ms->fdt, map_path);
> -- 
> 2.27.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


