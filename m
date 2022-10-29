Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E961217B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:40:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oohMo-0002km-RD; Sat, 29 Oct 2022 04:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oohMc-0002iE-7R
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oohMY-0004rX-R6
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667032721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ckmLE3kxnFMLn5rEZm8wyFY/mcrLm0M+yzigAPZbKzk=;
 b=WxfEvDOC0JKmTODqFCN6h3ifaEVu5KuPzMJFLO+jRjQSE5XzlTwSR3eLBZWGvk72OlX24F
 MtfBKKMuhD5znoK6ZwwTIvdg/GBT23d95Nb9ajWy00NGGDX9ug9f51Irl9Te3ZTZfregC2
 xnHqZzHJ8uEojnJ+T1bUUNGPbnu0eIo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-Z4b5kZIFMoCuBkdR3to2Ww-1; Sat, 29 Oct 2022 04:38:38 -0400
X-MC-Unique: Z4b5kZIFMoCuBkdR3to2Ww-1
Received: by mail-wm1-f71.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso3436431wme.3
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 01:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ckmLE3kxnFMLn5rEZm8wyFY/mcrLm0M+yzigAPZbKzk=;
 b=0FL9EY6kOcEGb3q2nBGZpXCKHIR2/g1dK3fDG2/S6tdGeR1uGfwtt0y8dR0smMWk5J
 ul5b/GFjhaJcfHPqQZwsCWaa0pPaxjjX02Q5wB/gFcbjsMq0DNe/HX1zbYLxUoPJesbB
 iLuz7EES4AJI8363uPFdXW4DwVZSLqa9gJfQ1+f1lqRoF0h5vyaGgO9SQA/EZ7YDy07W
 8aAkkdZSjrCSXH0gckTsdf/Dt0I0iq5P9Qe/PCENF80njoA8UEEU/st/RhqMrzf+zwwm
 JpcavYWz4WOo59g5PK/kim7RXUhIvkhzySvTCHv+xtOS0d8Pufnml0Sd85y+KMx1hgAr
 XfvQ==
X-Gm-Message-State: ACrzQf1SIrrMELbRl/r8Znwmwxj5QGnLzkPX/biPuHq6bSCt+woJ4FjS
 oxC+C6LDj/DVlNmIEaUur/yyKexGhVAHft+j7UYTPazctfKyHT4aqNgwAbOcPIh0VeK8eaaxZhf
 bVpDsLJjEk3pzYck=
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr1841895wrn.696.1667032717143; 
 Sat, 29 Oct 2022 01:38:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5CgNuWqFG0Dnhy+itJ4YZf2hJu7Zus+Xe12RerUQeZ1dAj6prrgbHt3tvX7mMfMLUQDllj9A==
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr1841882wrn.696.1667032716912; 
 Sat, 29 Oct 2022 01:38:36 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c410d00b003c6bd12ac27sm944862wmi.37.2022.10.29.01.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:38:36 -0700 (PDT)
Date: Sat, 29 Oct 2022 04:38:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: B <shentey@gmail.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
Message-ID: <20221029043803-mutt-send-email-mst@kernel.org>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
 <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
 <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 10:18:43PM +0530, Ani Sinha wrote:
> On Fri, Oct 28, 2022 at 9:45 PM B <shentey@gmail.com> wrote:
> >
> >
> >
> > Am 28. Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha.ca>:
> > >On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
> > >>
> > >> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> > >> AML generation has been moved into the south bridges and since the
> > >> machines define themselves primarily through their north bridges, let's
> > >> switch to resolving the north bridges for AML generation instead. This
> > >> also allows for easier experimentation with different south bridges in
> > >> the "pc" machine, e.g. with PIIX4 and VT82xx.
> > >
> > >Unfortunately this patch does not apply on the latest master. Also the
> > >code seems to be off. Can you rebase and rework the patch?
> >
> > I've rebased onto Igor's series to avoid merge conflicts,
> 
> Ok I will let Igor deal with this then since I have not followed his patchset.

should you want to review this, it's all in my tree right now.

> > that's why it doesn't apply onto master. It applies fine there [1].
> >
> > The first two patches of this series apply fine on both branches, so could possibly be pulled already if Igor's series doesn't make it for 7.2.
> >
> > Best regards,
> > Bernhard
> >
> > [1] https://github.com/patchew-project/qemu/commits/patchew/20221028103419.93398-1-shentey%40gmail.com
> > >
> > >>
> > >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > >> ---
> > >>  hw/i386/acpi-build.c | 11 ++++++-----
> > >>  1 file changed, 6 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > >> index 73d8a59737..d9eaa5fc4d 100644
> > >> --- a/hw/i386/acpi-build.c
> > >> +++ b/hw/i386/acpi-build.c
> > >> @@ -60,6 +60,7 @@
> > >>  #include "hw/i386/fw_cfg.h"
> > >>  #include "hw/i386/ich9.h"
> > >>  #include "hw/pci/pci_bus.h"
> > >> +#include "hw/pci-host/i440fx.h"
> > >>  #include "hw/pci-host/q35.h"
> > >>  #include "hw/i386/x86-iommu.h"
> > >>
> > >> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
> > >>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
> > >>  {
> > >> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> > >> -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> > >> +    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
> > >> +    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
> > >>      CrsRangeEntry *entry;
> > >>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> > >>      CrsRangeSet crs_range_set;
> > >> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >>      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
> > >>                          .oem_table_id = x86ms->oem_table_id };
> > >>
> > >> -    assert(!!piix != !!lpc);
> > >> +    assert(!!i440fx != !!q35);
> > >>
> > >>      acpi_table_begin(&table, table_data);
> > >>      dsdt = init_aml_allocator();
> > >>
> > >>      build_dbg_aml(dsdt);
> > >> -    if (piix) {
> > >> +    if (i440fx) {
> > >>          sb_scope = aml_scope("_SB");
> > >>          dev = aml_device("PCI0");
> > >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > >> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> > >>          }
> > >>          build_piix4_pci0_int(dsdt);
> > >> -    } else if (lpc) {
> > >> +    } else if (q35) {
> > >>          sb_scope = aml_scope("_SB");
> > >>          dev = aml_device("PCI0");
> > >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > >> --
> > >> 2.38.1
> > >>


