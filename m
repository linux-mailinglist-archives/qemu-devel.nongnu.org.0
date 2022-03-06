Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439014CEA8B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 11:38:23 +0100 (CET)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQoHN-0000PD-Jw
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 05:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQoFr-00087R-7v
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQoFo-00020U-3a
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646563002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vpWSkEfD+PEOaVHmQEgFYIq2hHkxBF7vNmWFagkqtuA=;
 b=SPi8P7fz2IhkQsBiTIvUAgPFSw9qaPO35DCcitpAV1226iQU4Jwp+vuAb7UzfpekVjzkPT
 Lgw9ZjmLYDe0VcW591HsjwO2LKZJMeCGe5fJN3Q3HedEw7QluMyc/Ml8U2sjwyOa+svhX5
 3RzmfHQCpI1gqJUzaVhzDVOnIxXPJe8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-8WcocVV6Mr-j-qxZBmNoUw-1; Sun, 06 Mar 2022 05:36:41 -0500
X-MC-Unique: 8WcocVV6Mr-j-qxZBmNoUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 187-20020a1c19c4000000b0037cc0d56524so6281545wmz.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 02:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vpWSkEfD+PEOaVHmQEgFYIq2hHkxBF7vNmWFagkqtuA=;
 b=tNNN4gfGqDgkO5CUOTrXX0+Dw82JnMGHcK7Ws5+PUggy58GV3ETVqBaQpzXFL9VaIY
 3XcpXfcEWGK9oHxJDlorwoXQobqD/Mj0NZVQSKVfeP8kFFdIsEyQW8OglQ2Gnzmk+XPr
 9AkwpFzKhBLNNo3RtLNrCNdg7NQiB3pbj/Ze/lnQlPmwtitdb+edA/1gW6zVPsY+bO+N
 heEnI9SMmnNGrhPo9IhiUz/nEDUv2x8M6p352W1ML2Wb3o5pGH21aVeRkmOLRSVw+4Ku
 9duQNXWfRIB0xhzDXocLH2dfw2XesMoywWNGxvhBLOTfzQPbDY6kD1YnggQUk/h0Vp+c
 cCnA==
X-Gm-Message-State: AOAM530OYymzjutgp/tc9ORBw8zlGCYmi2DthtB8VWcqeXEntWqoP2NO
 yv9jJbB53HajMy+DR0act13NzjTAVHT74SbYcQv5W4Yax+568Sl31t/gcPPDfkNzeTj9Q2FVKsr
 hA8EPdhh78Awyi9I=
X-Received: by 2002:a5d:49c9:0:b0:1f0:16b2:584f with SMTP id
 t9-20020a5d49c9000000b001f016b2584fmr4896434wrs.710.1646563000271; 
 Sun, 06 Mar 2022 02:36:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgU6Wgqttd4o6B/nFZLyIagw0wcW/pDKGTFaqmo6OizkpbdvnTNr6Cfp0PlshymBos6tILuQ==
X-Received: by 2002:a5d:49c9:0:b0:1f0:16b2:584f with SMTP id
 t9-20020a5d49c9000000b001f016b2584fmr4896420wrs.710.1646563000040; 
 Sun, 06 Mar 2022 02:36:40 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 f13-20020adff8cd000000b001f03439743fsm8728818wrq.75.2022.03.06.02.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 02:36:39 -0800 (PST)
Date: Sun, 6 Mar 2022 05:36:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v7 2/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220306053131-mutt-send-email-mst@kernel.org>
References: <20220304154032.2071585-1-ani@anisinha.ca>
 <20220304154032.2071585-3-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20220304154032.2071585-3-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 liavalb@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 09:10:30PM +0530, Ani Sinha wrote:
> From: Liav Albani <liavalb@gmail.com>
> 
> This can allow the guest OS to determine more easily if i8042 controller
> is present in the system or not, so it doesn't need to do probing of the
> controller, but just initialize it immediately, before enumerating the
> ACPI AML namespace.
> 
> The 8042 bit in IAPC_BOOT_ARCH was introduced from ACPI spec v2 (FADT
> revision 2 and above). Therefore, in this change, we only enable this bit for
> x86/q35 machine types since x86/i440fx machines use FADT ACPI table with
> revision 1.
> 
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/aml-build.c         |  8 +++++++-
>  hw/i386/acpi-build.c        |  8 ++++++++
>  include/hw/acpi/acpi-defs.h |  1 +
>  include/hw/input/i8042.h    | 15 +++++++++++++++
>  4 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 8966e16320..1773cf55f1 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2152,7 +2152,13 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> +    /* IAPC_BOOT_ARCH */
> +    if (f->rev == 1) {
> +        build_append_int_noprefix(tbl, 0, 2);
> +    } else {
> +        /* since ACPI v2.0 */
> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> +    }
>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>  
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ebd47aa26f..4ad4d7286c 100644
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
> @@ -192,6 +193,13 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>          },
>      };
> +
> +    /*
> +     * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
> +     * Flags, bit offset 1 - 8042.
> +     */

I think we should drop this comment (and one for microvm).
If you like, add

/*
Table 5-8 Fixed ACPI Description Table (FADT) Format
IAPC_BOOT_ARCH
*/

instead.


Let's do that with a patch on top, we have a soft freeze to consider.

> +    fadt.iapc_boot_arch = iapc_boot_arch_8042();
> +
>      *data = fadt;
>  }
>  
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
> diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
> index 1d90432dae..e070f546e4 100644
> --- a/include/hw/input/i8042.h
> +++ b/include/hw/input/i8042.h
> @@ -23,4 +23,19 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>  void i8042_isa_mouse_fake_event(ISAKBDState *isa);
>  void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
>  
> +static inline bool i8042_present(void)
> +{
> +    bool amb = false;
> +    return object_resolve_path_type("", TYPE_I8042, &amb) || amb;
> +}
> +
> +/*
> + * ACPI v2, Table 5-10 - Fixed ACPI Description Table Boot Architecture
> + * Flags, bit offset 1 - 8042.
> + */
> +static inline uint16_t iapc_boot_arch_8042(void)
> +{
> +    return i8042_present() ? 0x1 << 1 : 0x0 ;
> +}
> +
>  #endif /* HW_INPUT_I8042_H */
> -- 
> 2.25.1


