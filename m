Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9108436373
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:52:03 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYUE-0000xb-Ui
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYSM-0007Uq-9v
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYSK-0003Oj-6I
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pz3qWhl9OL8SpuRlRZ3gWKEiV1rRdSSNcUt1+su0Sw=;
 b=NHC4GeHwZgbr2UEy39zbM8odByCKGOQUjb7nReqEKXAvSPRUpsFk6wcsGlbkCrpAVSB0wt
 c62ScbENFP00UXgmz6THTeQW4V4lw7EQUSvg9vQWD5kXxD9UcM2rwMN9q2Na+YSLXDUQ9f
 ICUwmDYGQoIgVBV9UJhF9LF+b1MkPLo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-fphRyiyHOG-EmbYzq_5QHg-1; Thu, 21 Oct 2021 09:50:01 -0400
X-MC-Unique: fphRyiyHOG-EmbYzq_5QHg-1
Received: by mail-ed1-f69.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so367131edl.17
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3pz3qWhl9OL8SpuRlRZ3gWKEiV1rRdSSNcUt1+su0Sw=;
 b=PyOCxMlZhJAOj1dLsBLkcDTyICaO8q9FyqAjfw/d53F+es3isNhm11RiJK5LseNKkX
 iroP6XmQDQdU0V3iXBkPTJAyneKtqwrjdGmA7cjAPWW3JcpybrvjV6BxqqTq+dVoIG5s
 m//yDi4SoMP0B7NW1v9VlSlPSShrZE0ghARSfNKnR+CvS8EeeApJktjUY2SIOmdCTx70
 PK3iFDZrVCz4EAOiaq+Lnj02bwVTUJEmq0Kni8hhB4Wo+ZHVNir4XMtQAMRSePPnO3+6
 aEMKFptPHVqf1iOonnkpnGcXmIjbAb/GfkuiQZBeNEfeQe6UMlbHIDK1GZyVQ3drJFqT
 LDFg==
X-Gm-Message-State: AOAM531Mc+W3RSEYGbDMS1iW0B1zEtlgR5PQgQOIeFWPjEQmg961w2gT
 y5op5JxDseYf02+pK5KO8ya5zldkMsXyfQel7v1YGwy/+JlwM5Phff4haUBRCCtc588YbtG8cby
 JEpSi6JXWHwXhgvA=
X-Received: by 2002:a50:950b:: with SMTP id u11mr7902998eda.121.1634824199869; 
 Thu, 21 Oct 2021 06:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHrNIYLyi3WOmV4XRFkOgfR7m0JXlu1mh9X3hfNpsi3HHhzX2TBhD5UGwtMhVxf9psXIYwuw==
X-Received: by 2002:a50:950b:: with SMTP id u11mr7902969eda.121.1634824199683; 
 Thu, 21 Oct 2021 06:49:59 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g17sm2924151edv.72.2021.10.21.06.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:49:59 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:49:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 05/12] hw/arm/virt-acpi-build: Add VIOT table for
 virtio-iommu
Message-ID: <20211021154958.6ca48692@redhat.com>
In-Reply-To: <20211020172745.620101-6-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-6-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 18:27:39 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> When a virtio-iommu is instantiated, describe it using the ACPI VIOT
> table.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 7 +++++++
>  hw/arm/Kconfig           | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6cec97352b..e26639e1e1 100644
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
> @@ -934,6 +935,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      }
>  #endif
>  
> +    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_viot(ms, tables_blob, tables->linker, vms->virtio_iommu_bdf,
> +                   vms->oem_id, vms->oem_table_id);
> +    }
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d37d29f02..e652590943 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -27,6 +27,7 @@ config ARM_VIRT
>      select DIMM
>      select ACPI_HW_REDUCED
>      select ACPI_APEI
> +    select ACPI_VIOT
>  
>  config CHEETAH
>      bool


