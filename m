Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC94612B8C
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 17:14:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opAvu-0006IC-Jn; Sun, 30 Oct 2022 12:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opAvs-0006Hq-KL
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 12:13:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opAvq-0006zx-QJ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 12:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667146385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SuLgGOWuO15qqQxk7gT0509c/HiB2pbEv5Okf3cbPxA=;
 b=AAEBT6ZoFZZpEubViT7CTJcWKWnv9tQYRoctyzvyegBvtbtSqMegJUcpQcVgmosFbkMXp2
 G6W+dyd2qgtzxa85see07PRJ/M5XPORfzKS6ug0EdyqZDDkr4P/kI+fX1iC1nZJOQT/xIJ
 7KMnQwlE/77ybfFvCmBHbfUq4Ci9bYk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-SH40la_wO7OO37-12kZUbA-1; Sun, 30 Oct 2022 12:13:02 -0400
X-MC-Unique: SH40la_wO7OO37-12kZUbA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfa287000000b00236c367fcddso590596wra.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 09:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SuLgGOWuO15qqQxk7gT0509c/HiB2pbEv5Okf3cbPxA=;
 b=0atMXyNZC3FjbkGj2ZhzwJqI7I+cuHQG8a/acMZgzbwHIvp22XNDMPTZYCGDBZ63Qi
 4Dv4LhNfOZZNlroEHvY2+1E0JNiKG1c6Pw3DRTnw3px+30xYZqNvyAMJUBhHiP7OISag
 n+QFJBOmHKHY2QFD5ifOtGJl1/j20aLiolgHaVbBa5lM73hwIlVQndA6C3d1+rrvArER
 iWXNoMhxeVhdbizPfqAO/naKBIeh6hdxzQLxgCDShDCSaEL0gt6o9D9lypYK6h32E9Um
 1Xayke8yBPoqD5vGphiEhmcbN360ZzrDrLz/SkI812YI7NTwU/B7GWdRHB/HxDqYzYpv
 nZWQ==
X-Gm-Message-State: ACrzQf3ji31R90WF1F4FAlVJHKLCmhKLzgB+8mRu6mXSjcbeimpFj6j0
 g+7gv+YNaBIo3qLutw2fMBoik6GRyvt3Bl87ofJmLLG0Hwt9U/hF/u7SE34qZtzxan17CYQa+xE
 j5F7KJ5/Ol9aiJEw=
X-Received: by 2002:a05:600c:348f:b0:3c6:fff4:3a6a with SMTP id
 a15-20020a05600c348f00b003c6fff43a6amr5307402wmq.47.1667146381620; 
 Sun, 30 Oct 2022 09:13:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/V6icVWSz6UbTUBvHm1K/BqOCxSuNR7bvNsURCaLMsWij77uP/t85p1oAfCpV8H+HaSzkow==
X-Received: by 2002:a05:600c:348f:b0:3c6:fff4:3a6a with SMTP id
 a15-20020a05600c348f00b003c6fff43a6amr5307389wmq.47.1667146381386; 
 Sun, 30 Oct 2022 09:13:01 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k3-20020adfd223000000b00228dbf15072sm4575508wrh.62.2022.10.30.09.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 09:13:00 -0700 (PDT)
Date: Sun, 30 Oct 2022 12:12:56 -0400
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
Message-ID: <20221030121158-mutt-send-email-mst@kernel.org>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
 <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
 <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
 <20221029043803-mutt-send-email-mst@kernel.org>
 <fe7a1bbb-9993-4eee-6543-5e7e8391b6c@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe7a1bbb-9993-4eee-6543-5e7e8391b6c@anisinha.ca>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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

On Sun, Oct 30, 2022 at 09:15:44PM +0530, Ani Sinha wrote:
> 
> 
> On Sat, 29 Oct 2022, Michael S. Tsirkin wrote:
> 
> > On Fri, Oct 28, 2022 at 10:18:43PM +0530, Ani Sinha wrote:
> > > On Fri, Oct 28, 2022 at 9:45 PM B <shentey@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > Am 28. Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha.ca>:
> > > > >On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
> > > > >>
> > > > >> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> > > > >> AML generation has been moved into the south bridges and since the
> > > > >> machines define themselves primarily through their north bridges, let's
> > > > >> switch to resolving the north bridges for AML generation instead. This
> > > > >> also allows for easier experimentation with different south bridges in
> > > > >> the "pc" machine, e.g. with PIIX4 and VT82xx.
> > > > >
> > > > >Unfortunately this patch does not apply on the latest master. Also the
> > > > >code seems to be off. Can you rebase and rework the patch?
> > > >
> > > > I've rebased onto Igor's series to avoid merge conflicts,
> > >
> > > Ok I will let Igor deal with this then since I have not followed his patchset.
> >
> > should you want to review this, it's all in my tree right now.
> 
> I tried your "next" branch from
> git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
> 
> and it does not apply there either.


commit 87bbbe87c259414864a02e8385a0c8becd269ea5
It is already applied there.


> On another note, seems you have picked up all the bits patches except
> the one that adds the documentation. I wonder why.

Not sure, I tried to pick them all up. Will check.

> >
> > > > that's why it doesn't apply onto master. It applies fine there [1].
> > > >
> > > > The first two patches of this series apply fine on both branches, so could possibly be pulled already if Igor's series doesn't make it for 7.2.
> > > >
> > > > Best regards,
> > > > Bernhard
> > > >
> > > > [1] https://github.com/patchew-project/qemu/commits/patchew/20221028103419.93398-1-shentey%40gmail.com
> > > > >
> > > > >>
> > > > >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > > > >> ---
> > > > >>  hw/i386/acpi-build.c | 11 ++++++-----
> > > > >>  1 file changed, 6 insertions(+), 5 deletions(-)
> > > > >>
> > > > >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > >> index 73d8a59737..d9eaa5fc4d 100644
> > > > >> --- a/hw/i386/acpi-build.c
> > > > >> +++ b/hw/i386/acpi-build.c
> > > > >> @@ -60,6 +60,7 @@
> > > > >>  #include "hw/i386/fw_cfg.h"
> > > > >>  #include "hw/i386/ich9.h"
> > > > >>  #include "hw/pci/pci_bus.h"
> > > > >> +#include "hw/pci-host/i440fx.h"
> > > > >>  #include "hw/pci-host/q35.h"
> > > > >>  #include "hw/i386/x86-iommu.h"
> > > > >>
> > > > >> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > >>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
> > > > >>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
> > > > >>  {
> > > > >> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> > > > >> -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> > > > >> +    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
> > > > >> +    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
> > > > >>      CrsRangeEntry *entry;
> > > > >>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
> > > > >>      CrsRangeSet crs_range_set;
> > > > >> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > >>      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
> > > > >>                          .oem_table_id = x86ms->oem_table_id };
> > > > >>
> > > > >> -    assert(!!piix != !!lpc);
> > > > >> +    assert(!!i440fx != !!q35);
> > > > >>
> > > > >>      acpi_table_begin(&table, table_data);
> > > > >>      dsdt = init_aml_allocator();
> > > > >>
> > > > >>      build_dbg_aml(dsdt);
> > > > >> -    if (piix) {
> > > > >> +    if (i440fx) {
> > > > >>          sb_scope = aml_scope("_SB");
> > > > >>          dev = aml_device("PCI0");
> > > > >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > > > >> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > >>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
> > > > >>          }
> > > > >>          build_piix4_pci0_int(dsdt);
> > > > >> -    } else if (lpc) {
> > > > >> +    } else if (q35) {
> > > > >>          sb_scope = aml_scope("_SB");
> > > > >>          dev = aml_device("PCI0");
> > > > >>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > > > >> --
> > > > >> 2.38.1
> > > > >>
> >
> >


