Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DBD60FA4F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3iq-0007cD-OJ; Thu, 27 Oct 2022 10:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oo3im-0007JG-C1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oo3iV-0007u6-Bx
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666880322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G33OFMIR8UVWx112leGMlcFJ1Poq+r4qHQb9VCBxjOw=;
 b=ISWjbr3KU3PakGM5Q/hd4eoUbi6YqJKIGfUM/Jz8aYIob8dLMHv2WRatRsjx9d9sf2JATa
 wlejIDj6/v7LG46YkF0F0oe1VoGFmB87mbSIfSWZi5NFUiwin+uGN8jErWNkGNlM7SifUp
 BUlV4P5eIPWRJ90k8Leai/a65SKBszg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-73aMd-oaOPiBcjmQ24IrMA-1; Thu, 27 Oct 2022 10:18:40 -0400
X-MC-Unique: 73aMd-oaOPiBcjmQ24IrMA-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a05600c420a00b003cf4dbff2e4so335726wmh.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G33OFMIR8UVWx112leGMlcFJ1Poq+r4qHQb9VCBxjOw=;
 b=Hy9SST/7Od26Oq4AxrZMyWtvJSAc4TFg4YyFxmrxZjhmpv5MUFbdqesnSQL4PPuonS
 Z1T2+pOTtHf1Vo88LZuawRrEfvODErPABlC4Lbf2OZM1K0qXFCMZGu1h9zy51v297sAO
 J4EW2JBmfEV8fc1npJYX15nItM+8oGNSZpTNLHTfxQWqAMMT4UEtCF1krn3ImXi0Xndr
 NeOqg/mGn0A3TGX7+mKIictHVRQmhvpdwONauaAUqkLJ8fE2879lWDnrvt2x61r3ujli
 ti61PxcglsNxOeUZhSoOzHn/tKPfrQtr7r6gCU1WpJgCaEy3DneJHmUR4egOyOtKvLKh
 34xA==
X-Gm-Message-State: ACrzQf1Wenl8nJDGcNbgsZokvFjWRalXgnJ1480/NvPQOgP6IPVMbASU
 mQqiyPfiGfhWgNcjP3fhwOpKTXxJjRJrBXQuu8tq5FqSeJN6yGokIRA8kWpTP5wdIfIg1nK94do
 7CPqv9ALI2uGZh/w=
X-Received: by 2002:a05:600c:5023:b0:3c7:1526:fdb8 with SMTP id
 n35-20020a05600c502300b003c71526fdb8mr6209820wmr.28.1666880319436; 
 Thu, 27 Oct 2022 07:18:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6y0zTErd1TcBKWQMme7ZkRmfqvrn+oyq3UCSI+DPu8pNEn5dyNSYNb5q8eV6NyKV77k8rIbA==
X-Received: by 2002:a05:600c:5023:b0:3c7:1526:fdb8 with SMTP id
 n35-20020a05600c502300b003c71526fdb8mr6209808wmr.28.1666880319178; 
 Thu, 27 Oct 2022 07:18:39 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m5-20020adfe945000000b0022e36c1113fsm1283762wrn.13.2022.10.27.07.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:18:38 -0700 (PDT)
Date: Thu, 27 Oct 2022 10:18:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/11] x86: clean up ACPI PCI code part 2
Message-ID: <20221027101722-mutt-send-email-mst@kernel.org>
References: <20221017102146.2254096-1-imammedo@redhat.com>
 <20221027140640.2da44a4b@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027140640.2da44a4b@fedora>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 27, 2022 at 02:06:40PM +0200, Igor Mammedov wrote:
> On Mon, 17 Oct 2022 12:21:35 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > Series continues refactoring started at recently merged [1].
> > It replaces special cases/quirks for ISA/SMB bridges and PCI
> > attached VGA devices with generic AcpiDevAmlIf interface,
> > which allows device to provide its own AML description
> > without need for adhoc plumbing in generic DSDT or PCI
> > enumeration code.
> > 
> > PS:
> > at the end, \_GPE clean up patches which are not part of
> > AcpiDevAmlIf refactoring but iti's still related to PCI,
> > so I've included them there as well.
> 
> 
> ping

it's in my tree, testing found some issues (looks like they are
unrelated to this patchset), debugging.

> > 
> >  1)
> >   https://patchwork.ozlabs.org/project/qemu-devel/list/?series=303856
> > 
> > Igor Mammedov (11):
> >   acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device
> >     descriptors
> >   tests: acpi: whitelist DSDT before generating PCI-ISA bridge AML
> >     automatically
> >   acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML routines and let bus
> >     ennumeration generate AML
> >   tests: acpi: update expected DSDT after ISA bridge is moved directly
> >     under PCI host bridge
> >   tests: acpi: whitelist DSDT before generating ICH9_SMB AML
> >     automatically
> >   acpi: add get_dev_aml_func() helper
> >   acpi: enumerate SMB bridge automatically along with other PCI devices
> >   tests: acpi: update expected blobs
> >   tests: acpi: pc/q35 whitelist DSDT before \_GPE cleanup
> >   acpi: pc/35: sanitize _GPE declaration order
> >   tests: acpi: update expected blobs
> > 
> >  hw/display/vga_int.h                  |   2 +
> >  include/hw/acpi/acpi_aml_interface.h  |  13 +-
> >  hw/display/acpi-vga-stub.c            |   7 ++
> >  hw/display/acpi-vga.c                 |  26 ++++
> >  hw/display/meson.build                |  17 +++
> >  hw/display/vga-pci.c                  |   4 +
> >  hw/i386/acpi-build.c                  | 175 +++++---------------------
> >  hw/isa/lpc_ich9.c                     |  23 ++++
> >  hw/isa/piix3.c                        |  17 ++-
> >  tests/data/acpi/pc/DSDT               | Bin 6422 -> 6501 bytes
> >  tests/data/acpi/pc/DSDT.acpierst      | Bin 6382 -> 6461 bytes
> >  tests/data/acpi/pc/DSDT.acpihmat      | Bin 7747 -> 7826 bytes
> >  tests/data/acpi/pc/DSDT.bridge        | Bin 9496 -> 9575 bytes
> >  tests/data/acpi/pc/DSDT.cphp          | Bin 6886 -> 6965 bytes
> >  tests/data/acpi/pc/DSDT.dimmpxm       | Bin 8076 -> 8155 bytes
> >  tests/data/acpi/pc/DSDT.hpbridge      | Bin 6382 -> 6461 bytes
> >  tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3107 bytes
> >  tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6494 -> 6573 bytes
> >  tests/data/acpi/pc/DSDT.memhp         | Bin 7781 -> 7860 bytes
> >  tests/data/acpi/pc/DSDT.nohpet        | Bin 6280 -> 6359 bytes
> >  tests/data/acpi/pc/DSDT.numamem       | Bin 6428 -> 6507 bytes
> >  tests/data/acpi/pc/DSDT.roothp        | Bin 6656 -> 6699 bytes
> >  tests/data/acpi/q35/DSDT              | Bin 8320 -> 8412 bytes
> >  tests/data/acpi/q35/DSDT.acpierst     | Bin 8337 -> 8429 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat     | Bin 9645 -> 9737 bytes
> >  tests/data/acpi/q35/DSDT.applesmc     | Bin 8366 -> 8458 bytes
> >  tests/data/acpi/q35/DSDT.bridge       | Bin 11449 -> 11541 bytes
> >  tests/data/acpi/q35/DSDT.cphp         | Bin 8784 -> 8876 bytes
> >  tests/data/acpi/q35/DSDT.cxl          | Bin 9646 -> 9738 bytes
> >  tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9974 -> 10066 bytes
> >  tests/data/acpi/q35/DSDT.ipmibt       | Bin 8395 -> 8487 bytes
> >  tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8409 -> 8500 bytes
> >  tests/data/acpi/q35/DSDT.ivrs         | Bin 8337 -> 8429 bytes
> >  tests/data/acpi/q35/DSDT.memhp        | Bin 9679 -> 9771 bytes
> >  tests/data/acpi/q35/DSDT.mmio64       | Bin 9450 -> 9542 bytes
> >  tests/data/acpi/q35/DSDT.multi-bridge | Bin 8640 -> 8732 bytes
> >  tests/data/acpi/q35/DSDT.nohpet       | Bin 8178 -> 8270 bytes
> >  tests/data/acpi/q35/DSDT.numamem      | Bin 8326 -> 8418 bytes
> >  tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8421 -> 8513 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8926 -> 9018 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8952 -> 9044 bytes
> >  tests/data/acpi/q35/DSDT.viot         | Bin 9429 -> 9521 bytes
> >  tests/data/acpi/q35/DSDT.xapic        | Bin 35683 -> 35775 bytes
> >  43 files changed, 135 insertions(+), 149 deletions(-)
> >  create mode 100644 hw/display/acpi-vga-stub.c
> >  create mode 100644 hw/display/acpi-vga.c
> > 


