Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F404C8842
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:42:40 +0100 (CET)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOz1j-0003tA-MY
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:42:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOy70-0000v5-7P
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOy6x-0000Kr-CO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyMDVXnq5oMKJyAD7CQZhCUEWuRIxXGuQODoN6Bmlvs=;
 b=BddmOlE2zh/K2zC0Ji0ZE1y68chjHFqI10EWZKbxrHChwubGkoO6Rhmt8OQpGIA+T5IZps
 sGuBYDLhv8g6VruiLsZuvWy4vh5/WlHzo6pAUGcG8Ytol+qN4rl2IA9nle/Uxqpoa+z0dG
 PRGUNaJDRYA7B21SkUTlWPxw3qVtMZ8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-MUaeWa0fO--fnA5zXR-YZw-1; Tue, 01 Mar 2022 03:43:57 -0500
X-MC-Unique: MUaeWa0fO--fnA5zXR-YZw-1
Received: by mail-ej1-f71.google.com with SMTP id
 k21-20020a1709063e1500b006d0777c06d6so6507212eji.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:43:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fyMDVXnq5oMKJyAD7CQZhCUEWuRIxXGuQODoN6Bmlvs=;
 b=jXCoeTOMoyoWJPEygmvp07pGFIgCUnBwBoity+bIhJGuQhBZS63pt6VSVXJBfyHdOi
 K761DGVApIxkBT7uqBDV/0Jkm63b0tYfmWGu5GoXqlkar50n++21RV89RSnZgh40cTMe
 FWu/hN+ugvH16BOUiv14kaTUGfxOZhOtCb2ie+EhF0yeZCy3BIbOsc7HNlPYNS0LGA8G
 AC165QcnMT5Qd+jNifSB9bTNI0LN9Ku6Dhu9PWKyQu6bTe87SI48FhvpWefhegga5XlX
 hW79f8HMOHZlGteaXkStzRtzN1AxTJ7yq9Fw7aQYP/g1UWNKJdPaezfGJfhzsbQbnExl
 QAUw==
X-Gm-Message-State: AOAM530x8Gyd3Rv4R8qk7xB6cFPysj8rAEY0XQtMrAGoEJdzufY4vAXG
 lh7bKdW7oG614PvmUsFFYZHBoE2scyddazpdv89lE4mp3TtUXPZII6haMxawp3cm4Dxrue5FUTH
 F+TvW4K6PSmK8De4=
X-Received: by 2002:aa7:d49a:0:b0:410:875c:e21b with SMTP id
 b26-20020aa7d49a000000b00410875ce21bmr23237029edr.357.1646124236635; 
 Tue, 01 Mar 2022 00:43:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOajKQfOwlwO7XuKvlIb2+wkzESVGOd5DiUAxV6kLV+eb2fvGrE5XKzNvKrUVIQH4+BxLUbg==
X-Received: by 2002:aa7:d49a:0:b0:410:875c:e21b with SMTP id
 b26-20020aa7d49a000000b00410875ce21bmr23237011edr.357.1646124236349; 
 Tue, 01 Mar 2022 00:43:56 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 qh23-20020a170906ecb700b006d6e97b94aesm213402ejb.9.2022.03.01.00.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 00:43:55 -0800 (PST)
Date: Tue, 1 Mar 2022 09:43:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220301094354.1d37f470@redhat.com>
In-Reply-To: <20220228201733.714580-3-liavalb@gmail.com>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca, shentey@gmail.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 22:17:32 +0200
Liav Albani <liavalb@gmail.com> wrote:

> This can allow the guest OS to determine more easily if i8042 controller
> is present in the system or not, so it doesn't need to do probing of the
> controller, but just initialize it immediately, before enumerating the
> ACPI AML namespace.
> 
> This change only applies to the x86/q35 machine type, as it uses FACP
> ACPI table with revision higher than 1, which should implement at least
> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> flags register according to the ACPI 2.0 specification.
> 
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
>  hw/acpi/aml-build.c         | 11 ++++++++++-
>  hw/i386/acpi-build.c        |  9 +++++++++
>  hw/i386/acpi-microvm.c      |  9 +++++++++
commit message says it's q35 specific, so wy it touched microvm anc piix4?

>  include/hw/acpi/acpi-defs.h |  1 +
>  4 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 8966e16320..2085905b83 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2152,7 +2152,16 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> +    /* IAPC_BOOT_ARCH */
> +    /*
> +     * This register is not defined in ACPI spec version 1.0, where the FACP
> +     * revision == 1 also applies. Therefore, just ignore setting this register.
> +     */
> +    if (f->rev == 1) {
> +        build_append_int_noprefix(tbl, 0, 2);
> +    } else {
> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> +    }
>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>  
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ebd47aa26f..c72c7bb9bb 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -38,6 +38,7 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/isa/isa.h"
> +#include "hw/input/i8042.h"
>  #include "hw/block/fdc.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "sysemu/tpm.h"
> @@ -192,6 +193,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>          },
>      };
> +    /*
> +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> +     * (the earliest acpi revision that supports this).

 /* APCI spec version 2.0, Table 5-10 */

is sufficient, the rest could be read from spec/

> +     */
> +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> +                            0x0002 : 0x0000;
> +
>      *data = fadt;
>  }
>  
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 68ca7e7fc2..4bc72b1672 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -31,6 +31,7 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/utils.h"
>  #include "hw/acpi/erst.h"
> +#include "hw/input/i8042.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
>  #include "hw/pci/pci.h"
> @@ -189,6 +190,14 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>          .reset_val = ACPI_GED_RESET_VALUE,
>      };
>  
> +    /*
> +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
> +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
> +     * (the earliest acpi revision that supports this).
> +     */
> +    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
> +                            0x0002 : 0x0000;
> +
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
>      bios_linker_loader_alloc(tables->linker,
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index c97e8633ad..2b42e4192b 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
>      uint16_t plvl2_lat;        /* P_LVL2_LAT */
>      uint16_t plvl3_lat;        /* P_LVL3_LAT */
>      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
>      uint8_t minor_ver;         /* FADT Minor Version */
>  
>      /*


