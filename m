Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E743697BAD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGph-0000dz-Ln; Wed, 15 Feb 2023 07:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSGpZ-0000df-SH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:24:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSGpY-00049u-3o
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:24:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so2533745wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VwK3Iz47PmgFCssFAj6V1ejeTg6AMENSDX0XISjOmgs=;
 b=nE+nby4y2gJRlwwnc5cqxydqphEWe+akTyf0V7oUNQMb2iPXplBn7Il/lj2pO5r3m7
 W+ZJhSwpxuJXFsL68yLEhomVVvET8hc+tl3G4LZI/B64omWMPoSDIitGwa0/F3+HDRCB
 R1g+ovSGET+JiKBGFhWVX++y+X7RnuwHHdQjIfmSxiceNwPlOMB/xIAFksRkZeV4SDJe
 63MYGUuFUBQxc+/a/ee+tVmQp/s17dpPoKmCKWjtjIE3Sefsh8Zgs3qG6jDposlvE72/
 mWCFlMUR05GfNzZ+DGNZFH3/7GBRlX8vHx+83Y1PMgu1uIzTGULUEnTH6lT9Ms0iyw82
 94TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwK3Iz47PmgFCssFAj6V1ejeTg6AMENSDX0XISjOmgs=;
 b=RFjf4u81ySYTrzjENmk4F0kQsmqFejSFVvDC9ELXdtTI/ZraHIe+B6Rs7AfhPmfAnu
 by5XX/am1/1Yhc4Px7l3RVcTSx2yQC8Psdx3PwqX2lzOBZx2yPo0cR18Av87iI2fftq3
 gErcctIoafGp0roRay7/MWZ7lRJxp+67QIR2EoDVau/aOlFpnlQdf7FO7DXoZ3Wkcevq
 q6r4H3syWscI7Huq4bS/tfo/qHAww/fom7MA6stDp8FvLf8UYZAAHqcST+2quxSn6uG2
 0s6481hYvYOIJjt2kuHZXR61nYRf/6kkG3dt8r6ihoyqKO7WCSFmfkJE5WHlujvFC8Zn
 KP5w==
X-Gm-Message-State: AO0yUKWrtWJfX1uydtykXIXgik3xWyFsNpCelcGSAXTFO4FyK7Iqxf7a
 czOUeLHcFE+YXYslaSo6uJabGg==
X-Google-Smtp-Source: AK7set8gwmPvpW8MGGhNpG6+pf9/S1SqlHr0OIsxfK1/3/HPF/O/noJgcJ1UmcJjLzkuAaELPtoi0Q==
X-Received: by 2002:a05:600c:1695:b0:3e0:99:b5ac with SMTP id
 k21-20020a05600c169500b003e00099b5acmr1903317wmn.3.1676463850209; 
 Wed, 15 Feb 2023 04:24:10 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003e204158ac7sm1812379wms.47.2023.02.15.04.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 04:24:09 -0800 (PST)
Date: Wed, 15 Feb 2023 13:24:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V2 02/10] hw/riscv/virt: Add a switch to enable/disable
 ACPI
Message-ID: <20230215122408.osrdxdclshmikvec@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-3-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 08:10:30PM +0530, Sunil V L wrote:
> ACPI is enabled by default. Add a switch to turn off
> for testing and debug purposes.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c         | 35 +++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fb68cf81e9..58d3765b6d 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -50,6 +50,7 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/acpi/aml-build.h"
> +#include "qapi/qapi-visit-common.h"
>  
>  /*
>   * The virt machine physical address space used by some of the devices
> @@ -1517,6 +1518,9 @@ static void virt_machine_init(MachineState *machine)
>  
>  static void virt_machine_instance_init(Object *obj)
>  {
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> +
> +    s->acpi = ON_OFF_AUTO_AUTO;

Might as well put the oem stuff here too now like the other architectures.

>  }
>  
>  static char *virt_get_aia_guests(Object *obj, Error **errp)
> @@ -1591,6 +1595,32 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
>      s->have_aclint = value;
>  }
>  
> +bool virt_is_acpi_enabled(RISCVVirtState *s)
> +{
> +    if (s->acpi == ON_OFF_AUTO_OFF) {
> +        return false;
> +    }
> +    return true;

  return s->acpi != ON_OFF_AUTO_OFF;

> +}
> +
> +static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> +

extra blank line here

> +    OnOffAuto acpi = s->acpi;
> +
> +    visit_type_OnOffAuto(v, name, &acpi, errp);
> +}
> +
> +static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> +
> +    visit_type_OnOffAuto(v, name, &s->acpi, errp);
> +}
> +
>  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>                                                          DeviceState *dev)
>  {
> @@ -1662,6 +1692,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
>                   "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
>      object_class_property_set_description(oc, "aia-guests", str);
> +    object_class_property_add(oc, "acpi", "OnOffAuto",
> +                              virt_get_acpi, virt_set_acpi,
> +                              NULL, NULL);
> +    object_class_property_set_description(oc, "acpi",
> +                                          "Enable ACPI");
>  }
>  
>  static const TypeInfo virt_machine_typeinfo = {
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 6c7885bf89..62efebaa32 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -58,6 +58,7 @@ struct RISCVVirtState {
>      int aia_guests;
>      char *oem_id;
>      char *oem_table_id;
> +    OnOffAuto acpi;
>  };
>  
>  enum {
> @@ -123,4 +124,5 @@ enum {
>  #define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
>                                   1 + FDT_APLIC_INT_CELLS)
>  
> +bool virt_is_acpi_enabled(RISCVVirtState *s);
>  #endif
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

