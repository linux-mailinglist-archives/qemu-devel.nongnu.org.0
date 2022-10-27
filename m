Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FF60F6D8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:10:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1fa-0003rf-7G; Thu, 27 Oct 2022 08:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oo1f1-0003C9-6i
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oo1ep-0001Xo-4H
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666872405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCTHn1WlnN2yoHWqVjZ4PAhPqm/fGH6JhO81t/1haYo=;
 b=LjtYQ6ELluyDZS0deCa564WeImFJtG0/00nogZYj6BvzNrEFZoWUqmQunqSKgLNMHRzAUu
 qgZds3VarwTT1SUgfCBrSm+wCCrAXuPgx2rJVR4ho0Ktho/vB3Aw60RvJxKPW0rizxKMbz
 s6OH42fbD5040mULuKrfBfZujXqq0is=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-w53weENyOCWWOv8WYDXpaQ-1; Thu, 27 Oct 2022 08:06:43 -0400
X-MC-Unique: w53weENyOCWWOv8WYDXpaQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r18-20020a05600c35d200b003cb2ba79692so625323wmq.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCTHn1WlnN2yoHWqVjZ4PAhPqm/fGH6JhO81t/1haYo=;
 b=qx1pSAcN4m5zpcy397RzpHXrDT00HHCtlP9cpUWnoADnCDHh0/xIPOLsy/Wd6Z8hSx
 pDXgTzQGby8sNIZJHz9QkhG9hlCcO2fI/ZJfn3OUq6OEmOhYKmVh7h37QKFkIHin019i
 tjx47UOaY/ZwzbaFpK62bwZsbtAhzLFJh6lhOrecbzMpEPf4hKV3i26MxBKJLgEJVZHj
 8v+K35dtEtljn4iKHpMmPromJiMrjhM0fGvqUhCxJM23vq65PhPbU42T6hrjzqARyfNt
 L0BP6qY50wu+0xZ0Cw5mTH3xGrYtrLkEhyF0ylvgzYWj8sXIaHQprhPSZpX140XhsadA
 tVDA==
X-Gm-Message-State: ACrzQf2OvTHgf3b72pmeuPi+yFbHuSuxc/ncj6pudfodhL9dIufkxLCW
 L81mcv9YPCBHy1FtKCB8vPiGWtJl/nesZg/TmHL17wM6gWEuBY/zYIM8WTL/OlCzdfhAh1IZM+l
 A19YCwbunM94IWu+tEBVbvMzSt4uPxOcOdwyOBJgqV/F9yS9DUaf5PkLcDz+5aUf1UPc=
X-Received: by 2002:a5d:510d:0:b0:236:720e:9afb with SMTP id
 s13-20020a5d510d000000b00236720e9afbmr12773789wrt.639.1666872402143; 
 Thu, 27 Oct 2022 05:06:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FtLRU/MIuyAA6OzR98Rf8r1yL+7NQsrnmv6LMaouQ8ubB7wKPq9/wvOS/uZn0V0734x87uA==
X-Received: by 2002:a5d:510d:0:b0:236:720e:9afb with SMTP id
 s13-20020a5d510d000000b00236720e9afbmr12773773wrt.639.1666872401794; 
 Thu, 27 Oct 2022 05:06:41 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c3b1600b003b50428cf66sm1328117wms.33.2022.10.27.05.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 05:06:40 -0700 (PDT)
Date: Thu, 27 Oct 2022 14:06:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com
Subject: Re: [PATCH 00/11] x86: clean up ACPI PCI code part 2
Message-ID: <20221027140640.2da44a4b@fedora>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Mon, 17 Oct 2022 12:21:35 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> Series continues refactoring started at recently merged [1].
> It replaces special cases/quirks for ISA/SMB bridges and PCI
> attached VGA devices with generic AcpiDevAmlIf interface,
> which allows device to provide its own AML description
> without need for adhoc plumbing in generic DSDT or PCI
> enumeration code.
> 
> PS:
> at the end, \_GPE clean up patches which are not part of
> AcpiDevAmlIf refactoring but iti's still related to PCI,
> so I've included them there as well.


ping

> 
>  1)
>   https://patchwork.ozlabs.org/project/qemu-devel/list/?series=303856
> 
> Igor Mammedov (11):
>   acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device
>     descriptors
>   tests: acpi: whitelist DSDT before generating PCI-ISA bridge AML
>     automatically
>   acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML routines and let bus
>     ennumeration generate AML
>   tests: acpi: update expected DSDT after ISA bridge is moved directly
>     under PCI host bridge
>   tests: acpi: whitelist DSDT before generating ICH9_SMB AML
>     automatically
>   acpi: add get_dev_aml_func() helper
>   acpi: enumerate SMB bridge automatically along with other PCI devices
>   tests: acpi: update expected blobs
>   tests: acpi: pc/q35 whitelist DSDT before \_GPE cleanup
>   acpi: pc/35: sanitize _GPE declaration order
>   tests: acpi: update expected blobs
> 
>  hw/display/vga_int.h                  |   2 +
>  include/hw/acpi/acpi_aml_interface.h  |  13 +-
>  hw/display/acpi-vga-stub.c            |   7 ++
>  hw/display/acpi-vga.c                 |  26 ++++
>  hw/display/meson.build                |  17 +++
>  hw/display/vga-pci.c                  |   4 +
>  hw/i386/acpi-build.c                  | 175 +++++---------------------
>  hw/isa/lpc_ich9.c                     |  23 ++++
>  hw/isa/piix3.c                        |  17 ++-
>  tests/data/acpi/pc/DSDT               | Bin 6422 -> 6501 bytes
>  tests/data/acpi/pc/DSDT.acpierst      | Bin 6382 -> 6461 bytes
>  tests/data/acpi/pc/DSDT.acpihmat      | Bin 7747 -> 7826 bytes
>  tests/data/acpi/pc/DSDT.bridge        | Bin 9496 -> 9575 bytes
>  tests/data/acpi/pc/DSDT.cphp          | Bin 6886 -> 6965 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm       | Bin 8076 -> 8155 bytes
>  tests/data/acpi/pc/DSDT.hpbridge      | Bin 6382 -> 6461 bytes
>  tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3107 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6494 -> 6573 bytes
>  tests/data/acpi/pc/DSDT.memhp         | Bin 7781 -> 7860 bytes
>  tests/data/acpi/pc/DSDT.nohpet        | Bin 6280 -> 6359 bytes
>  tests/data/acpi/pc/DSDT.numamem       | Bin 6428 -> 6507 bytes
>  tests/data/acpi/pc/DSDT.roothp        | Bin 6656 -> 6699 bytes
>  tests/data/acpi/q35/DSDT              | Bin 8320 -> 8412 bytes
>  tests/data/acpi/q35/DSDT.acpierst     | Bin 8337 -> 8429 bytes
>  tests/data/acpi/q35/DSDT.acpihmat     | Bin 9645 -> 9737 bytes
>  tests/data/acpi/q35/DSDT.applesmc     | Bin 8366 -> 8458 bytes
>  tests/data/acpi/q35/DSDT.bridge       | Bin 11449 -> 11541 bytes
>  tests/data/acpi/q35/DSDT.cphp         | Bin 8784 -> 8876 bytes
>  tests/data/acpi/q35/DSDT.cxl          | Bin 9646 -> 9738 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9974 -> 10066 bytes
>  tests/data/acpi/q35/DSDT.ipmibt       | Bin 8395 -> 8487 bytes
>  tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8409 -> 8500 bytes
>  tests/data/acpi/q35/DSDT.ivrs         | Bin 8337 -> 8429 bytes
>  tests/data/acpi/q35/DSDT.memhp        | Bin 9679 -> 9771 bytes
>  tests/data/acpi/q35/DSDT.mmio64       | Bin 9450 -> 9542 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge | Bin 8640 -> 8732 bytes
>  tests/data/acpi/q35/DSDT.nohpet       | Bin 8178 -> 8270 bytes
>  tests/data/acpi/q35/DSDT.numamem      | Bin 8326 -> 8418 bytes
>  tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8421 -> 8513 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8926 -> 9018 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8952 -> 9044 bytes
>  tests/data/acpi/q35/DSDT.viot         | Bin 9429 -> 9521 bytes
>  tests/data/acpi/q35/DSDT.xapic        | Bin 35683 -> 35775 bytes
>  43 files changed, 135 insertions(+), 149 deletions(-)
>  create mode 100644 hw/display/acpi-vga-stub.c
>  create mode 100644 hw/display/acpi-vga.c
> 


