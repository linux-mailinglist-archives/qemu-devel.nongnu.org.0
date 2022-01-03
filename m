Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB948309C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:34:59 +0100 (CET)
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4LcA-0000Ke-IJ
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:34:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4La0-0006SF-HJ
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LZy-0003cF-Tk
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7gRreOUXuatvIWZrNHVRFQOcfVSCQk25xee1VF+vJ04=;
 b=hPGnsKhvt26efI7JBxysdLPgqelwQvz1sE67F8DZiGqrOHOTizlCb7kM+oQJdO+NzgX/4m
 adoedOvM8kLkMxNyaoeBiwgOD4gYPt1aqgkV1YHB3RliKhR29vZJUtGR4tjjeTMVe+nQIl
 p4YtH1fm0X3pXPCXN1crzVi0MvZ2B68=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-a4Nclzh1OiyoIm5b-58S2A-1; Mon, 03 Jan 2022 06:32:41 -0500
X-MC-Unique: a4Nclzh1OiyoIm5b-58S2A-1
Received: by mail-ed1-f71.google.com with SMTP id
 t1-20020a056402524100b003f8500f6e35so22710253edd.8
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 03:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gRreOUXuatvIWZrNHVRFQOcfVSCQk25xee1VF+vJ04=;
 b=sd8B7cB92cH916lOlMbCIfeFE7sTKGHXp2p30iHzMWutOHqt0urkgX3jWCiFFfrao7
 pr0XOiXJiVgw231aeCkc5jtM7bv5ZngJZQjQawPhzWFGQ9b96Kq7iZR5QY40zCKNnxNr
 RoTQhStsA3C7lpc3qd1yNiiO73qWl3/emcio+l8ZlJ4rWiD8uSxl0ZBBprdEdevvYpL+
 r/aGgx/P2+LjzGyNLVCsMySI6Vri9tIJfgrKXx3K6Dc0iz9KasYo2tDYMxWpAl7BoQJc
 MeXplZZWNPXmFy3MElO+JAoVm+85jmOVz2R1XoGR3jWZEyolhv2lCpV9Zvt9x0AkHHMG
 WTAQ==
X-Gm-Message-State: AOAM530GJCKGGxt2NGahQdGwDtIAqSVFn9IUqI9I7khQ168feiaCD360
 UyuffL72hM0/wISZcsiB/fY8m/WZmEcbmgL9mmPshNn7BoBtRt10z8vNfDoeBAEwzYt/JHuaQyV
 9HVWxctQLKD2eykc=
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr43492738edd.282.1641209560271; 
 Mon, 03 Jan 2022 03:32:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9yAiHbokbtZjy+S2BMTmHr9sCwesKs3K8WAoPPvbUm87qsiBEvVIO+EB7FpuY4Id86QtTFg==
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr43492727edd.282.1641209560060; 
 Mon, 03 Jan 2022 03:32:40 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id m6sm13608221edc.36.2022.01.03.03.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:32:39 -0800 (PST)
Date: Mon, 3 Jan 2022 12:32:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 6/7] hw/arm/virt-acpi-build: Support cluster level in
 PPTT generation
Message-ID: <20220103113238.g3vk7nxmgefxe2gn@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
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

On Mon, Jan 03, 2022 at 04:46:35PM +0800, Yanan Wang wrote:
> Support cluster level in generation of ACPI Processor Properties
> Topology Table (PPTT) for ARM virt machines.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ce7680393..5f91969688 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -840,6 +840,21 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              0, socket, NULL, 0);
>      }
>  
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int cluster;
> +
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> +            g_queue_push_tail(list,
> +                GUINT_TO_POINTER(table_data->len - pptt_start));
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (0 << 0), /* not a physical package */
> +                father_offset, cluster, NULL, 0);
> +        }
> +    }
> +
>      length = g_queue_get_length(list);
>      for (i = 0; i < length; i++) {
>          int core;
> -- 
> 2.27.0
>

Looks good except please do s/father_offset/parent_offset/ as I mentioned
in an earlier patch.

Reviewed-by: Andrew Jones <drjones@redhat.com>


