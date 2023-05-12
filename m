Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBE2700A76
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:40:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTvz-0005mL-Eu; Fri, 12 May 2023 10:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pxTvp-0005lJ-9l
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pxTvn-0004Ba-45
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683902376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tpipHPIE87YgBgu/TWQfJxaMPdlTcPbLQxFhjCQ3wjE=;
 b=EZhlY2bMlF6tnZm5Uw8Bf9qqIBaBnV4vR2jEZLH4iiOpgjrdJOUiziv2J23fWJJ0ux2y8q
 10helJiSdATDbsVqiG3nywk3mKJIRgzh9RJSVZnR1fVDprj/+8eD8c+jkxVa9YQSVIA3cF
 2bZIQrJ3leoQiOXnEaWjetUIyUQOJyw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-IgCAkjBuNrqS49rPM9f0yg-1; Fri, 12 May 2023 10:39:35 -0400
X-MC-Unique: IgCAkjBuNrqS49rPM9f0yg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30641258c9eso3522946f8f.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902374; x=1686494374;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpipHPIE87YgBgu/TWQfJxaMPdlTcPbLQxFhjCQ3wjE=;
 b=UtqIK8mkqjroM9xkhHvnygmOuhBxy3a7SJXMOsWTa13KxJC/ItJwzTo84DF+PREIfb
 DafL77crgUf/51hZ2NN+GlH6QVp6My/hoyaxnKkEUjtJIzZVWDa9bBMYdoV6vAStRlqy
 P9ZHsEFCYN+P4LHDE4XRwykvst90lNv7iPD952GNhiCINYQ4HNNd1uCFuq2BIbnb9W63
 MzQSVWcX3ENiQg6ZrPY5NtovRkAWtrFBdSgd3QTEEEhfMPtG70zRz28z9DmO+homBGDL
 POY4t1XPcvWM/lCJXJXylpIsVfVRZbUApOXLLFszXmp7q2+4Nx8Bwgb3qa32pYsr03OX
 iYlw==
X-Gm-Message-State: AC+VfDyUuuAStNnbXNncYk7JEU2L7OWeUfAdW8N1we9SXSNOeHx1kWQl
 J29p0Zu7iuX6ZyvNxI1LqS/f7MBQ2OSoouSdBReD5oICZfJOo0TtQd5tfg+si9LUa/gRZGzDHOA
 Yeu2w1L39I013Mic=
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id
 k8-20020a056000004800b003077c2ddc79mr18003790wrx.16.1683902373783; 
 Fri, 12 May 2023 07:39:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+dYV1oYC9sxQvkyOC/aI44l21kYZWrkS9geZzx8PD03lYlN7dqp+1qhoNMSLMcApKUaowEw==
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id
 k8-20020a056000004800b003077c2ddc79mr18003761wrx.16.1683902373428; 
 Fri, 12 May 2023 07:39:33 -0700 (PDT)
Received: from redhat.com ([31.187.78.61]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d518f000000b003077a19cf75sm23216172wrv.60.2023.05.12.07.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:39:32 -0700 (PDT)
Date: Fri, 12 May 2023 10:39:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bui Quang Minh <minhquangbui99@gmail.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw2@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [REPOST PATCH v3 5/5] amd_iommu: report x2APIC support to the
 operating system
Message-ID: <20230512102159-mutt-send-email-mst@kernel.org>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
 <20230411142440.8018-6-minhquangbui99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411142440.8018-6-minhquangbui99@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 11, 2023 at 09:24:40PM +0700, Bui Quang Minh wrote:
> This commit adds XTSup configuration to let user choose to whether enable
> this feature or not. When XTSup is enabled, additional bytes in IRTE with
> enabled guest virtual VAPIC are used to support 32-bit destination id.
> 
> Additionally, this commit changes to use IVHD type 0x11 in ACPI table for
> feature report to operating system. This is because Linux does not use
> XTSup in IOMMU Feature Reporting field of IVHD type 0x10 but only use XTSup
> bit in EFR Register Image of IVHD 0x11 to indicate x2APIC support (see
> init_iommu_one in linux/drivers/iommu/amd/init.c)
> 
> Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>

I'm concerned that switching to type 11 will break some older guests.
It would be better if we could export both type 10 and type 11
ivhd. A question however would be how does this interact
with older guests. For example:
https://lists.linuxfoundation.org/pipermail/iommu/2016-January/015310.html
it looks like linux before 2016 only expected one ivhd entry?

Some research and testing here would be benefitial.
Similarly for windows guests.

Thanks!



> ---
>  hw/i386/acpi-build.c | 28 ++++++++++++++--------------
>  hw/i386/amd_iommu.c  | 21 +++++++++++++++++++--
>  hw/i386/amd_iommu.h  | 16 +++++++++++-----
>  3 files changed, 44 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ec857a117e..72d6bb2892 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2339,7 +2339,7 @@ static void
>  build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>                  const char *oem_table_id)
>  {
> -    int ivhd_table_len = 24;
> +    int ivhd_table_len = 40;
>      AMDVIState *s = AMD_IOMMU_DEVICE(x86_iommu_get_default());
>      GArray *ivhd_blob = g_array_new(false, true, 1);
>      AcpiTable table = { .sig = "IVRS", .rev = 1, .oem_id = oem_id,
> @@ -2349,18 +2349,19 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>      /* IVinfo - IO virtualization information common to all
>       * IOMMU units in a system
>       */
> -    build_append_int_noprefix(table_data, 40UL << 8/* PASize */, 4);
> +    build_append_int_noprefix(table_data,
> +                             (1UL << 0) | /* EFRSup */
> +                             (40UL << 8), /* PASize */
> +                             4);
>      /* reserved */
>      build_append_int_noprefix(table_data, 0, 8);
>  
> -    /* IVHD definition - type 10h */
> -    build_append_int_noprefix(table_data, 0x10, 1);
> +    /* IVHD definition - type 11h */
> +    build_append_int_noprefix(table_data, 0x11, 1);
>      /* virtualization flags */
>      build_append_int_noprefix(table_data,
>                               (1UL << 0) | /* HtTunEn      */
> -                             (1UL << 4) | /* iotblSup     */

btw this should have been iotlbsup?

> -                             (1UL << 6) | /* PrefSup      */
> -                             (1UL << 7),  /* PPRSup       */
> +                             (1UL << 4),  /* iotblSup     */
>                               1);
>  
>      /*

hmm why are you removing these other flags?

> @@ -2404,13 +2405,12 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>      build_append_int_noprefix(table_data, 0, 2);
>      /* IOMMU info */
>      build_append_int_noprefix(table_data, 0, 2);
> -    /* IOMMU Feature Reporting */
> -    build_append_int_noprefix(table_data,
> -                             (48UL << 30) | /* HATS   */
> -                             (48UL << 28) | /* GATS   */
> -                             (1UL << 2)   | /* GTSup  */
> -                             (1UL << 6),    /* GASup  */
> -                             4);
> +    /* IOMMU Attributes */
> +    build_append_int_noprefix(table_data, 0, 4);
> +    /* EFR Register Image */
> +    build_append_int_noprefix(table_data, s->efr_reg, 8);
> +    /* EFR Register Image 2 */
> +    build_append_int_noprefix(table_data, 0, 8);


here too. what's going on?

>  
>      /* IVHD entries as found above */
>      g_array_append_vals(table_data, ivhd_blob->data, ivhd_blob->len);
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index bcd016f5c5..5dfa93d945 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -31,6 +31,7 @@
>  #include "hw/i386/apic_internal.h"
>  #include "trace.h"
>  #include "hw/i386/apic-msidef.h"
> +#include "hw/qdev-properties.h"
>  
>  /* used AMD-Vi MMIO registers */
>  const char *amdvi_mmio_low[] = {
> @@ -1155,7 +1156,12 @@ static int amdvi_int_remap_ga(AMDVIState *iommu,
>      irq->vector = irte.hi.fields.vector;
>      irq->dest_mode = irte.lo.fields_remap.dm;
>      irq->redir_hint = irte.lo.fields_remap.rq_eoi;
> -    irq->dest = irte.lo.fields_remap.destination;
> +    if (!iommu->xtsup) {
> +        irq->dest = irte.lo.fields_remap.destination & 0xff;
> +    } else {
> +        irq->dest = irte.lo.fields_remap.destination |
> +                    (irte.hi.fields.destination_hi << 24);
> +    }

Weird way to put it. Why not if (iommu->xtsup) ... ?

>  
>      return 0;
>  }
> @@ -1503,10 +1509,15 @@ static void amdvi_init(AMDVIState *s)
>      s->enabled = false;
>      s->ats_enabled = false;
>      s->cmdbuf_enabled = false;
> +    s->efr_reg = AMDVI_DEFAULT_EXT_FEATURES;
> +
> +    if (s->xtsup) {
> +        s->efr_reg |= AMDVI_FEATURE_XT;
> +    }
>  
>      /* reset MMIO */
>      memset(s->mmior, 0, AMDVI_MMIO_SIZE);
> -    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, AMDVI_EXT_FEATURES,
> +    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, s->efr_reg,
>              0xffffffffffffffef, 0);
>      amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
>  
> @@ -1586,6 +1597,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>      amdvi_init(s);
>  }
>  
> +static Property amdvi_properties[] = {
> +    DEFINE_PROP_BOOL("xtsup", AMDVIState, xtsup, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static const VMStateDescription vmstate_amdvi_sysbus = {
>      .name = "amd-iommu",
>      .unmigratable = 1
> @@ -1612,6 +1628,7 @@ static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
>      dc->user_creatable = true;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
> +    device_class_set_props(dc, amdvi_properties);
>  }
>  
>  static const TypeInfo amdvi_sysbus = {
> diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
> index 79d38a3e41..96df7b0400 100644
> --- a/hw/i386/amd_iommu.h
> +++ b/hw/i386/amd_iommu.h
> @@ -154,6 +154,7 @@
>  
>  #define AMDVI_FEATURE_PREFETCH            (1ULL << 0) /* page prefetch       */
>  #define AMDVI_FEATURE_PPR                 (1ULL << 1) /* PPR Support         */
> +#define AMDVI_FEATURE_XT                  (1ULL << 2) /* x2APIC Support      */
>  #define AMDVI_FEATURE_GT                  (1ULL << 4) /* Guest Translation   */
>  #define AMDVI_FEATURE_IA                  (1ULL << 6) /* inval all support   */
>  #define AMDVI_FEATURE_GA                  (1ULL << 7) /* guest VAPIC support */
> @@ -173,8 +174,9 @@
>  #define AMDVI_IOTLB_MAX_SIZE 1024
>  #define AMDVI_DEVID_SHIFT    36
>  
> -/* extended feature support */
> -#define AMDVI_EXT_FEATURES (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
> +/* default extended feature */
> +#define AMDVI_DEFAULT_EXT_FEATURES \
> +        (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
>          AMDVI_FEATURE_IA | AMDVI_FEATURE_GT | AMDVI_FEATURE_HE | \
>          AMDVI_GATS_MODE | AMDVI_HATS_MODE | AMDVI_FEATURE_GA)
>  
> @@ -278,8 +280,8 @@ union irte_ga_lo {
>                  dm:1,
>                  /* ------ */
>                  guest_mode:1,
> -                destination:8,
> -                rsvd_1:48;
> +                destination:24,
> +                rsvd_1:32;
>    } fields_remap;
>  };
>  
> @@ -287,7 +289,8 @@ union irte_ga_hi {
>    uint64_t val;
>    struct {
>        uint64_t  vector:8,
> -                rsvd_2:56;
> +                rsvd_2:48,
> +                destination_hi:8;
>    } fields;
>  };
>  
> @@ -367,6 +370,9 @@ struct AMDVIState {
>  
>      /* Interrupt remapping */
>      bool ga_enabled;
> +    bool xtsup;
> +
> +    uint64_t efr_reg;            /* extended feature register */
>  };
>  
>  #endif
> -- 
> 2.25.1


