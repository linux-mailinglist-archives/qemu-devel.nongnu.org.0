Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41368613703
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUI4-0008QY-6N; Mon, 31 Oct 2022 08:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUHS-0004WY-3z
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opUHP-0002p1-7Q
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9D/I++u1aic6WS/dHHfJSVcu58NrP1m9K35CCl7L8oY=;
 b=LR+dDoKtBq+IgYh2s+eBYZCT+G2UsVErD6TzVibgBVlg5xS8ncknsuVg83AjpBuMe+YxFP
 QX/h88pT3YEU0bjoYQ+Lq6nmra64b9S/GCq/QthPG4Ssr35ygwza/EmQPexukCBiHuk/Dj
 n7s/2DRnmbZRlpRHI0xlVCy9YX5Ooo8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-mpvQyR_jNnWzN3ZO6f1x7w-1; Mon, 31 Oct 2022 08:52:37 -0400
X-MC-Unique: mpvQyR_jNnWzN3ZO6f1x7w-1
Received: by mail-qk1-f198.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso9450502qkp.20
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9D/I++u1aic6WS/dHHfJSVcu58NrP1m9K35CCl7L8oY=;
 b=d6nwxXwcMTdKaleU0wRgFOPoVH3dEk8CZ81300Ih1ZcAbih8PDzvFwxy5jlQrxQYW1
 dlY1WfUirMQ4hh0o5IJLwUrBRffSUk+XBeJ6Or7ZXnum7Y/Fu4+dzTl3sQVEPRIN8yGf
 I9xbs2hGPv5q2nIFar1OHGklkyd0MPm6ewC8i6Zr/on+nZz6LdxCTIesCtbbcdXezPrD
 jrnWjEwosYXXYWp/34Lpc4gfZxJbn+iDY32kEHLhIbc7PpYHLYpQrEnqB6X5tgc5K/1T
 7IXYPfVLW3YKNLhW3JTN5LmDVq+s1sfU+oOkRVj8nwWpYuWKiOTocI01iW9fR/wAvUw2
 LzkA==
X-Gm-Message-State: ACrzQf1GoFGR8FVKmwBSTXKA4PAd+5LSUv7PrZ+Lv/9Fp1sZTSDYdLZx
 k7TN4Kq4tpIVGa9Yeb07ldWOnyG524Y4ZryyOB6JL0BC6uif6EIJ3K+J2g1n2uvGDzwY0w/5IG8
 830ZpeoSh5kmhhog=
X-Received: by 2002:a37:97c4:0:b0:6fa:3139:1825 with SMTP id
 z187-20020a3797c4000000b006fa31391825mr2165956qkd.341.1667220756676; 
 Mon, 31 Oct 2022 05:52:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Kp6ISfO1TeYuOpfO2+945iJe8t2Z/89DjhzNiRCW9U9UNcEWm9Ptv34FUE+KGhu0y2Kms9A==
X-Received: by 2002:a37:97c4:0:b0:6fa:3139:1825 with SMTP id
 z187-20020a3797c4000000b006fa31391825mr2165944qkd.341.1667220756460; 
 Mon, 31 Oct 2022 05:52:36 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac8520f000000b003972790deb9sm3551881qtn.84.2022.10.31.05.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:35 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:52:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
Message-ID: <20221031135232.118ae0ea@fedora>
In-Reply-To: <20221028103419.93398-4-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 12:34:19 +0200
Bernhard Beschow <shentey@gmail.com> wrote:

> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> AML generation has been moved into the south bridges and since the
> machines define themselves primarily through their north bridges, let's
> switch to resolving the north bridges for AML generation instead. This
> also allows for easier experimentation with different south bridges in
> the "pc" machine, e.g. with PIIX4 and VT82xx.

Patch looks fine to me in a sense that either would work.

But the commit message lacks clear answer to 'why'
and what issues it resolves or would resolve/make
our easier life down to road.

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/i386/acpi-build.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 73d8a59737..d9eaa5fc4d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -60,6 +60,7 @@
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/ich9.h"
>  #include "hw/pci/pci_bus.h"
> +#include "hw/pci-host/i440fx.h"
>  #include "hw/pci-host/q35.h"
>  #include "hw/i386/x86-iommu.h"
>  
> @@ -1322,8 +1323,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>             AcpiPmInfo *pm, AcpiMiscInfo *misc,
>             Range *pci_hole, Range *pci_hole64, MachineState *machine)
>  {
> -    Object *piix = object_resolve_type_unambiguous(TYPE_PIIX4_PM);
> -    Object *lpc = object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEVICE);
> +    Object *i440fx = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE);
> +    Object *q35 = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE);
>      CrsRangeEntry *entry;
>      Aml *dsdt, *sb_scope, *scope, *dev, *method, *field, *pkg, *crs;
>      CrsRangeSet crs_range_set;
> @@ -1344,13 +1345,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = x86ms->oem_id,
>                          .oem_table_id = x86ms->oem_table_id };
>  
> -    assert(!!piix != !!lpc);
> +    assert(!!i440fx != !!q35);
>  
>      acpi_table_begin(&table, table_data);
>      dsdt = init_aml_allocator();
>  
>      build_dbg_aml(dsdt);
> -    if (piix) {
> +    if (i440fx) {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> @@ -1363,7 +1364,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
>          }
>          build_piix4_pci0_int(dsdt);
> -    } else if (lpc) {
> +    } else if (q35) {
>          sb_scope = aml_scope("_SB");
>          dev = aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));


