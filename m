Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF41401CFE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:30:06 +0200 (CEST)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFdL-0004JQ-1v
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFcC-0003Mh-5s
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFc9-0006Td-Hz
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630938528;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Z2/TSBIUtkgXicm/ZE+0GRpJXyfdu80ww3Pzt9dXIg=;
 b=c1M22pKrGxk8a43r8RudjjSpWQ4TKiP/VT3VUKs++4aQQlYxPVsGvArYLEvzbG1SGnGwLg
 I3D/4iesW/Gm0p9kleDEcRZQR21ZqX8cW40i34tkBke7s3rnPpP3ma8nNSCmax/wgYb78X
 ej6qdb9EfofJJoVybjm2pE4sI/IQP5s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-rGgFAdOCOrqLsJ1ZNnMmCg-1; Mon, 06 Sep 2021 10:28:47 -0400
X-MC-Unique: rGgFAdOCOrqLsJ1ZNnMmCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso26845wmi.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 07:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=1Z2/TSBIUtkgXicm/ZE+0GRpJXyfdu80ww3Pzt9dXIg=;
 b=K2Xh4Blly+jr6cFSNl3IpXU/Js5qH4YO/qh+07DshR3sA+g0a9bTyms5wC5gjXgBbV
 ndX7bbMUL1Zx7VTZ1OAV3tCiPTJJ9o/j8tKMmZoiROpu2bz/GwOT5zH0LJ4yUdt3vhMK
 l1euIl6OU+Zt7aPDcuhoYfZ0pJlzszRLLNj78517Ja+WlK6Ii5y4fZlFJY9LkoaKG8pm
 MQPLxQ0siPldEQDHV6U5RqdtjPkWOu+FNpN5cucz5dN9jkLhJ+R/65IGBpaVHaYJk4mg
 UDaeLl4hTBunnkPBcs09L8TmnG7vCgHylDSEJDhwc6sdOXwpjBEWIut4eCS2eGy4PT5s
 tBUQ==
X-Gm-Message-State: AOAM530deRty1g/BkCIX0VPWoiqki6yCHrMShQhO7vYn9LJWrWX9HzBF
 Zwf/IlYVN66nCWG1KRE+T6uVyS4S5sWWqG7rABKwPEXbCNX+yktfhM45VMTtbbk2eZf3QRXVAHh
 ga340lpH20xqh0fc=
X-Received: by 2002:a1c:f206:: with SMTP id s6mr12119174wmc.102.1630938526011; 
 Mon, 06 Sep 2021 07:28:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJx8EgAeZJTf/gwE8Jjq95kFsXqFHuGvkGKWKQOxIOkaNUFFc3tDL1AV4pSqCzxTVNoyWXpw==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr12119153wmc.102.1630938525818; 
 Mon, 06 Sep 2021 07:28:45 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q4sm8157483wra.43.2021.09.06.07.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:28:45 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1b4f177e-a02a-6644-f180-e850a6273fba@redhat.com>
Date: Mon, 6 Sep 2021 16:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-4-jean-philippe@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> When a virtio-iommu is instantiated, describe it using the ACPI VIOT
> table.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  hw/arm/Kconfig           | 1 +
>  hw/arm/virt-acpi-build.c | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4ba0aca067..7da0422446 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -29,6 +29,7 @@ config ARM_VIRT
>      select ACPI_HW_REDUCED
>      select ACPI_NVDIMM
>      select ACPI_APEI
> +    select ACPI_VIOT
>  
>  config CHEETAH
>      bool
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82..e2fa677d80 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -55,6 +55,7 @@
>  #include "kvm_arm.h"
>  #include "migration/vmstate.h"
>  #include "hw/acpi/ghes.h"
> +#include "hw/acpi/viot.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -849,6 +850,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      }
>  #endif
>  
> +    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(tables_blob, tables->linker, vms->virtio_iommu_bdf,
> +                   vms->oem_id, vms->oem_table_id);
> +    }
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,


