Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC058701F93
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 22:45:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyIZr-0001g2-I1; Sun, 14 May 2023 16:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pyIZp-0001fc-IA
 for qemu-devel@nongnu.org; Sun, 14 May 2023 16:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pyIZn-0002ei-5f
 for qemu-devel@nongnu.org; Sun, 14 May 2023 16:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684097056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qyXkIJckAAIz7MN7jURTh6XtgL8yA7rxTa0VXDrvP2w=;
 b=LXvpxHku3A/+EhMk2+WkyID0cG94JgChss+PJSOKQq/GmlkBvCEo2XI7QVnBCdcDXUFwsH
 nkDYtq5lXloOuoK3cZi7b4J3iFkX3sghW7LrnSh/DnhYnvknr6le4aKT8nAVMDIQGDrsSh
 0NQxXsYgz9JmRhfzApVdW8N+HaFFPYw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-vdjf2TR4NxaAMNFf2_3tXQ-1; Sun, 14 May 2023 16:44:14 -0400
X-MC-Unique: vdjf2TR4NxaAMNFf2_3tXQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f4fa463282so11843415e9.0
 for <qemu-devel@nongnu.org>; Sun, 14 May 2023 13:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684097053; x=1686689053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyXkIJckAAIz7MN7jURTh6XtgL8yA7rxTa0VXDrvP2w=;
 b=Zky4SNVNQGgoZ/LdISqinrZCCU4fbq4bhF4rB1p6lVdYx6WazcGL9TbeJP7Zex9LNf
 Ua1wV3ukL5VhaEIL0oU8bgkfty8h28tz/yI70xR0+C3+ROsenOT+0P2L6+m70u2Nk669
 +jIZFp4jmmR+MbPIV1vmaokSYWxg8+ixe8exYPzP+GCGIJij5EW0VxCWsE61puO4+A/n
 ia53j6bXtNY9NGpVJfLs1fz91haRVqkmP+wvmG36OvyVtKfvQdoLOeWN+hzSZLZvzBhS
 xf8aY5A4Weu8y2Ceo4Aum0wgb4Xj4KOq/ykbdJjS7uKbcRLUnPKs7ynY3gXvWin0+3iu
 jYQQ==
X-Gm-Message-State: AC+VfDyYwWLtqcPN4uF6QjEVS2JK8Ghd2qgbrDc4KWoohL2D5vidjt2F
 y7pvQLOsdoKsShPLOcR59TdkALJ7vTlmaWF0kzmDNs9uf9nm6vbSPVIrGVAMIEcRzmHzy4obJmd
 Y0cMvHEjKVPde0R4=
X-Received: by 2002:a1c:7c06:0:b0:3f5:b4e:944b with SMTP id
 x6-20020a1c7c06000000b003f50b4e944bmr297343wmc.18.1684097052834; 
 Sun, 14 May 2023 13:44:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ780ikkfLPu8YETGNlRi/4gaY6ClCB+YJpgrc/AGV8fRucCt9VIFhPtyDB7q1+GdvYpmRtcwQ==
X-Received: by 2002:a1c:7c06:0:b0:3f5:b4e:944b with SMTP id
 x6-20020a1c7c06000000b003f50b4e944bmr297334wmc.18.1684097052412; 
 Sun, 14 May 2023 13:44:12 -0700 (PDT)
Received: from redhat.com ([2.52.146.3]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b003f1957ace1fsm34790336wml.13.2023.05.14.13.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 13:44:11 -0700 (PDT)
Date: Sun, 14 May 2023 16:44:08 -0400
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
Message-ID: <20230514164040-mutt-send-email-mst@kernel.org>
References: <20230411142440.8018-1-minhquangbui99@gmail.com>
 <20230411142440.8018-6-minhquangbui99@gmail.com>
 <20230512102159-mutt-send-email-mst@kernel.org>
 <252a0071-2ffa-87c6-a72e-d27975ddecd5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <252a0071-2ffa-87c6-a72e-d27975ddecd5@gmail.com>
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

On Sun, May 14, 2023 at 03:55:11PM +0700, Bui Quang Minh wrote:
> On 5/12/23 21:39, Michael S. Tsirkin wrote:
> > On Tue, Apr 11, 2023 at 09:24:40PM +0700, Bui Quang Minh wrote:
> > > This commit adds XTSup configuration to let user choose to whether enable
> > > this feature or not. When XTSup is enabled, additional bytes in IRTE with
> > > enabled guest virtual VAPIC are used to support 32-bit destination id.
> > > 
> > > Additionally, this commit changes to use IVHD type 0x11 in ACPI table for
> > > feature report to operating system. This is because Linux does not use
> > > XTSup in IOMMU Feature Reporting field of IVHD type 0x10 but only use XTSup
> > > bit in EFR Register Image of IVHD 0x11 to indicate x2APIC support (see
> > > init_iommu_one in linux/drivers/iommu/amd/init.c)
> > > 
> > > Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
> > 
> > I'm concerned that switching to type 11 will break some older guests.
> > It would be better if we could export both type 10 and type 11
> > ivhd. A question however would be how does this interact
> > with older guests. For example:
> > https://lists.linuxfoundation.org/pipermail/iommu/2016-January/015310.html
> > it looks like linux before 2016 only expected one ivhd entry?
> 
> Export both type 0x10 and 0x11 looks reasonable to me. Before the above
> commit, I see that Linux still loops through multiple ivhd but only handles
> one with type 0x10. On newer kernel, it will choose to handle the type that
> appears last corresponding the first devid, which is weird in my opinion.
> +static u8 get_highest_supported_ivhd_type(struct acpi_table_header *ivrs)
> +{
> +	u8 *base = (u8 *)ivrs;
> +	struct ivhd_header *ivhd = (struct ivhd_header *)
> +					(base + IVRS_HEADER_LENGTH);
> +	u8 last_type = ivhd->type;
> +	u16 devid = ivhd->devid;
> +
> +	while (((u8 *)ivhd - base < ivrs->length) &&
> +	       (ivhd->type <= ACPI_IVHD_TYPE_MAX_SUPPORTED)) {
> +		u8 *p = (u8 *) ivhd;
> +
> +		if (ivhd->devid == devid)
> +			last_type = ivhd->type;
> +		ivhd = (struct ivhd_header *)(p + ivhd->length);
> +	}
> +
> +	return last_type;
> +}

Yes I don't get the logic here either.
Talk to kernel devs who wrote this?

commit 8c7142f56fedfc6824b5bca56fee1f443e01746b
Author: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Date:   Fri Apr 1 09:05:59 2016 -0400

    iommu/amd: Use the most comprehensive IVHD type that the driver can support
    
    The IVRS in more recent AMD system usually contains multiple
    IVHD block types (e.g. 0x10, 0x11, and 0x40) for each IOMMU.
    The newer IVHD types provide more information (e.g. new features
    specified in the IOMMU spec), while maintain compatibility with
    the older IVHD type.
    
    Having multiple IVHD type allows older IOMMU drivers to still function
    (e.g. using the older IVHD type 0x10) while the newer IOMMU driver can use
    the newer IVHD types (e.g. 0x11 and 0x40). Therefore, the IOMMU driver
    should only make use of the newest IVHD type that it can support.
    
    This patch adds new logic to determine the highest level of IVHD type
    it can support, and use it throughout the to initialize the driver.
    This requires adding another pass to the IVRS parsing to determine
    appropriate IVHD type (see function get_highest_supported_ivhd_type())
    before parsing the contents.
    
    [Vincent: fix the build error of IVHD_DEV_ACPI_HID flag not found]
    
    Signed-off-by: Wan Zongshun <vincent.wan@amd.com>
    Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
    Signed-off-by: Joerg Roedel <jroedel@suse.de>



> 
> So when exposing type 0x10 following by 0x11, old kernel only parses 0x10
> and does not support x2APIC while new kernel parse 0x11 and support x2APIC.
> I will expose both types in the next version.
> 
> > Some research and testing here would be benefitial.
> > Similarly for windows guests.
> > 
> > Thanks!
> > 
> > 
> > 
> > > ---
> > >   hw/i386/acpi-build.c | 28 ++++++++++++++--------------
> > >   hw/i386/amd_iommu.c  | 21 +++++++++++++++++++--
> > >   hw/i386/amd_iommu.h  | 16 +++++++++++-----
> > >   3 files changed, 44 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index ec857a117e..72d6bb2892 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -2339,7 +2339,7 @@ static void
> > >   build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> > >                   const char *oem_table_id)
> > >   {
> > > -    int ivhd_table_len = 24;
> > > +    int ivhd_table_len = 40;
> > >       AMDVIState *s = AMD_IOMMU_DEVICE(x86_iommu_get_default());
> > >       GArray *ivhd_blob = g_array_new(false, true, 1);
> > >       AcpiTable table = { .sig = "IVRS", .rev = 1, .oem_id = oem_id,
> > > @@ -2349,18 +2349,19 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> > >       /* IVinfo - IO virtualization information common to all
> > >        * IOMMU units in a system
> > >        */
> > > -    build_append_int_noprefix(table_data, 40UL << 8/* PASize */, 4);
> > > +    build_append_int_noprefix(table_data,
> > > +                             (1UL << 0) | /* EFRSup */
> > > +                             (40UL << 8), /* PASize */
> > > +                             4);
> > >       /* reserved */
> > >       build_append_int_noprefix(table_data, 0, 8);
> > > -    /* IVHD definition - type 10h */
> > > -    build_append_int_noprefix(table_data, 0x10, 1);
> > > +    /* IVHD definition - type 11h */
> > > +    build_append_int_noprefix(table_data, 0x11, 1);
> > >       /* virtualization flags */
> > >       build_append_int_noprefix(table_data,
> > >                                (1UL << 0) | /* HtTunEn      */
> > > -                             (1UL << 4) | /* iotblSup     */
> > 
> > btw this should have been iotlbsup?
> > 
> > > -                             (1UL << 6) | /* PrefSup      */
> > > -                             (1UL << 7),  /* PPRSup       */
> > > +                             (1UL << 4),  /* iotblSup     */
> > >                                1);
> > >       /*
> > 
> > hmm why are you removing these other flags?
> 
> According to the AMD IOMMU specification, the bit 6, 7 are reserved in type
> 0x11 which are PerfSup, PPRSup respectively in type 0x10 so I remove those
> flags when changing to type 0x11. In type 0x11, these feature are reported
> via the below EFR Register Image I believe.
> 
> > 
> > > @@ -2404,13 +2405,12 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> > >       build_append_int_noprefix(table_data, 0, 2);
> > >       /* IOMMU info */
> > >       build_append_int_noprefix(table_data, 0, 2);
> > > -    /* IOMMU Feature Reporting */
> > > -    build_append_int_noprefix(table_data,
> > > -                             (48UL << 30) | /* HATS   */
> > > -                             (48UL << 28) | /* GATS   */
> > > -                             (1UL << 2)   | /* GTSup  */
> > > -                             (1UL << 6),    /* GASup  */
> > > -                             4);
> > > +    /* IOMMU Attributes */
> > > +    build_append_int_noprefix(table_data, 0, 4);
> > > +    /* EFR Register Image */
> > > +    build_append_int_noprefix(table_data, s->efr_reg, 8);
> > > +    /* EFR Register Image 2 */
> > > +    build_append_int_noprefix(table_data, 0, 8);
> > 
> > 
> > here too. what's going on?
> 
> Same as the above, the structure of type 0x11 is different from 0x10. At
> offset 20 it is not IOMMU feature reporting but IOMMU attributes. And there
> are 2 more fields: EFR Register Image, EFR Register Image 2 before IVHD
> device entries.
> 
> > >       /* IVHD entries as found above */
> > >       g_array_append_vals(table_data, ivhd_blob->data, ivhd_blob->len);
> > > diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> > > index bcd016f5c5..5dfa93d945 100644
> > > --- a/hw/i386/amd_iommu.c
> > > +++ b/hw/i386/amd_iommu.c
> > > @@ -31,6 +31,7 @@
> > >   #include "hw/i386/apic_internal.h"
> > >   #include "trace.h"
> > >   #include "hw/i386/apic-msidef.h"
> > > +#include "hw/qdev-properties.h"
> > >   /* used AMD-Vi MMIO registers */
> > >   const char *amdvi_mmio_low[] = {
> > > @@ -1155,7 +1156,12 @@ static int amdvi_int_remap_ga(AMDVIState *iommu,
> > >       irq->vector = irte.hi.fields.vector;
> > >       irq->dest_mode = irte.lo.fields_remap.dm;
> > >       irq->redir_hint = irte.lo.fields_remap.rq_eoi;
> > > -    irq->dest = irte.lo.fields_remap.destination;
> > > +    if (!iommu->xtsup) {
> > > +        irq->dest = irte.lo.fields_remap.destination & 0xff;
> > > +    } else {
> > > +        irq->dest = irte.lo.fields_remap.destination |
> > > +                    (irte.hi.fields.destination_hi << 24);
> > > +    }
> > 
> > Weird way to put it. Why not if (iommu->xtsup) ... ?
> 
> Okay, I'll fix this in next version.
> 
> > >       return 0;
> > >   }
> > > @@ -1503,10 +1509,15 @@ static void amdvi_init(AMDVIState *s)
> > >       s->enabled = false;
> > >       s->ats_enabled = false;
> > >       s->cmdbuf_enabled = false;
> > > +    s->efr_reg = AMDVI_DEFAULT_EXT_FEATURES;
> > > +
> > > +    if (s->xtsup) {
> > > +        s->efr_reg |= AMDVI_FEATURE_XT;
> > > +    }
> > >       /* reset MMIO */
> > >       memset(s->mmior, 0, AMDVI_MMIO_SIZE);
> > > -    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, AMDVI_EXT_FEATURES,
> > > +    amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, s->efr_reg,
> > >               0xffffffffffffffef, 0);
> > >       amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
> > > @@ -1586,6 +1597,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
> > >       amdvi_init(s);
> > >   }
> > > +static Property amdvi_properties[] = {
> > > +    DEFINE_PROP_BOOL("xtsup", AMDVIState, xtsup, false),
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > >   static const VMStateDescription vmstate_amdvi_sysbus = {
> > >       .name = "amd-iommu",
> > >       .unmigratable = 1
> > > @@ -1612,6 +1628,7 @@ static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
> > >       dc->user_creatable = true;
> > >       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> > >       dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
> > > +    device_class_set_props(dc, amdvi_properties);
> > >   }
> > >   static const TypeInfo amdvi_sysbus = {
> > > diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
> > > index 79d38a3e41..96df7b0400 100644
> > > --- a/hw/i386/amd_iommu.h
> > > +++ b/hw/i386/amd_iommu.h
> > > @@ -154,6 +154,7 @@
> > >   #define AMDVI_FEATURE_PREFETCH            (1ULL << 0) /* page prefetch       */
> > >   #define AMDVI_FEATURE_PPR                 (1ULL << 1) /* PPR Support         */
> > > +#define AMDVI_FEATURE_XT                  (1ULL << 2) /* x2APIC Support      */
> > >   #define AMDVI_FEATURE_GT                  (1ULL << 4) /* Guest Translation   */
> > >   #define AMDVI_FEATURE_IA                  (1ULL << 6) /* inval all support   */
> > >   #define AMDVI_FEATURE_GA                  (1ULL << 7) /* guest VAPIC support */
> > > @@ -173,8 +174,9 @@
> > >   #define AMDVI_IOTLB_MAX_SIZE 1024
> > >   #define AMDVI_DEVID_SHIFT    36
> > > -/* extended feature support */
> > > -#define AMDVI_EXT_FEATURES (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
> > > +/* default extended feature */
> > > +#define AMDVI_DEFAULT_EXT_FEATURES \
> > > +        (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
> > >           AMDVI_FEATURE_IA | AMDVI_FEATURE_GT | AMDVI_FEATURE_HE | \
> > >           AMDVI_GATS_MODE | AMDVI_HATS_MODE | AMDVI_FEATURE_GA)
> > > @@ -278,8 +280,8 @@ union irte_ga_lo {
> > >                   dm:1,
> > >                   /* ------ */
> > >                   guest_mode:1,
> > > -                destination:8,
> > > -                rsvd_1:48;
> > > +                destination:24,
> > > +                rsvd_1:32;
> > >     } fields_remap;
> > >   };
> > > @@ -287,7 +289,8 @@ union irte_ga_hi {
> > >     uint64_t val;
> > >     struct {
> > >         uint64_t  vector:8,
> > > -                rsvd_2:56;
> > > +                rsvd_2:48,
> > > +                destination_hi:8;
> > >     } fields;
> > >   };
> > > @@ -367,6 +370,9 @@ struct AMDVIState {
> > >       /* Interrupt remapping */
> > >       bool ga_enabled;
> > > +    bool xtsup;
> > > +
> > > +    uint64_t efr_reg;            /* extended feature register */
> > >   };
> > >   #endif
> > > -- 
> > > 2.25.1
> > 
> 
> Thanks,
> Quang Minh.


