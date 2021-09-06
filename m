Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F30401D5F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:03:54 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGA5-0006KM-GA
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG8Z-0004Ze-QF
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNG8S-0001YE-Ds
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630940531;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7WPX0OmfOgwoG7AZPG9biEWXCby193AXR4gFCNchv0=;
 b=iJ9U4ai+T9RFkgk+0LamSuzZDr58c3Q6y4AX3/Jc4cwUA2PgSjNcbhLvWitjU+54rjPGpU
 mUw9BYkc/UH6+WyMjFQbS4DhGhXgri2E8C/n3uQgHO5ITtp7IFcu8PDsJyBEUkubkk+p8A
 AfyCeiKLakYjpPelsPRxqUYTrPhsq10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-4knuMmLXM5aS-ox3KIv5ig-1; Mon, 06 Sep 2021 11:02:08 -0400
X-MC-Unique: 4knuMmLXM5aS-ox3KIv5ig-1
Received: by mail-wr1-f70.google.com with SMTP id
 j1-20020adff541000000b001593715d384so1267615wrp.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=R7WPX0OmfOgwoG7AZPG9biEWXCby193AXR4gFCNchv0=;
 b=Al5mVEvdziznw46E1j+x1LKp7kxMjZQEcOyCT1aUCI1YePv6wRIzQbPxKYRsed9t9T
 HOR9mzu+y1+af8hF1SiUOmLqq5RJCN+aImHNA1sTq2HaRMdpxKCf0FveID8TFwMN7h/Y
 dnCk1fut55Kh9RejDTjDRuSoo90+/scRu2PNR0Q4cvt4L6jv+wsCBxb+ZEZRwpyGeWIK
 x5BYuXY4Tg4ZjEFVX5xagAJNffipHtBwCQNMwNSEfwdT948JV1j8zw7EAiWcpS/5kXBD
 YrIYlMbauHBBVEa0uzvDkEvf9iPMQjEcyy15x0gIQymIqMDjWztha3/pdd1kXEpIUeD+
 NOxA==
X-Gm-Message-State: AOAM533AF85lsuZWpW09UbYPEJc2tr9rGcwKwWx2Y9mBY3C/xPPzuVyq
 6g+WpFGXA6OQB1y2qR+P6cqKqG6CjOcVZG+C1phO43Nqlx/AvsQktLOgDIZX8OLAn7CafowJMml
 nyjb7Kf1rHowdD/g=
X-Received: by 2002:adf:f645:: with SMTP id x5mr13663898wrp.353.1630940527659; 
 Mon, 06 Sep 2021 08:02:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzalnUyP9Z9IVGUUnDsNo3bv3S3uShRP8SD9C+KYdt2nKue1flSbsTGmM976fI4ledk6UR6Dw==
X-Received: by 2002:adf:f645:: with SMTP id x5mr13663861wrp.353.1630940527379; 
 Mon, 06 Sep 2021 08:02:07 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f17sm7453043wmf.4.2021.09.06.08.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 08:02:06 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] pc: Add VIOT table for virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-7-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6b142f58-fa70-2ec9-0df5-9217fa275922@redhat.com>
Date: Mon, 6 Sep 2021 17:02:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-7-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> The ACPI Virtual I/O Translation table (VIOT) describes the relation
> between a virtio-iommu and the endpoints it manages. When a virtio-iommu
> device is instantiated, add a VIOT table.

As there is no used of pcms->virtio_iommu and virtio_iommu_bdf yet, maybe squash this into next patch?

Thanks

Eric

>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/i386/Kconfig      | 1 +
>  include/hw/i386/pc.h | 2 ++
>  hw/i386/acpi-build.c | 5 +++++
>  hw/i386/pc.c         | 7 +++++++
>  4 files changed, 15 insertions(+)
>
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index ddedcef0b2..13db05d557 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -54,6 +54,7 @@ config PC_ACPI
>      select ACPI_X86
>      select ACPI_CPU_HOTPLUG
>      select ACPI_MEMORY_HOTPLUG
> +    select ACPI_VIOT
>      select SMBUS_EEPROM
>      select PFLASH_CFI01
>      depends on ACPI_SMBUS
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 88dffe7517..979b8d0b7c 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,6 +45,8 @@ typedef struct PCMachineState {
>      bool pit_enabled;
>      bool hpet_enabled;
>      bool default_bus_bypass_iommu;
> +    bool virtio_iommu;
> +    uint16_t virtio_iommu_bdf;
>      uint64_t max_fw_size;
>  
>      /* NUMA information: */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a33ac8b91e..078b7f5c6f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -71,6 +71,7 @@
>  
>  #include "hw/acpi/ipmi.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/acpi/viot.h"
>  
>  /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
>   * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
> @@ -2559,6 +2560,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>              build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
>                             x86ms->oem_table_id);
>          }
> +    } else if (pcms->virtio_iommu) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(tables_blob, tables->linker, pcms->virtio_iommu_bdf,
> +                   x86ms->oem_id, x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2b9d62a35..694fc9ce07 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -84,6 +84,7 @@
>  #include "hw/i386/intel_iommu.h"
>  #include "hw/net/ne2000-isa.h"
>  #include "standard-headers/asm-x86/bootparam.h"
> +#include "hw/virtio/virtio-iommu.h"
>  #include "hw/virtio/virtio-pmem-pci.h"
>  #include "hw/virtio/virtio-mem-pci.h"
>  #include "hw/mem/memory-device.h"
> @@ -1388,6 +1389,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +        PCIDevice *pdev = PCI_DEVICE(dev);
> +
> +        pcms->virtio_iommu = true;
> +        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
>      }
>  }
>  


