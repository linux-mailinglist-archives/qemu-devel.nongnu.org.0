Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579B3ABDC3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 23:04:34 +0200 (CEST)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltzBh-0006Dh-L9
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 17:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltzAK-0004iU-B3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltzAI-0006zw-7h
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623963785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=agYyY3tXKVXMUmz+0Xcim1r8TzucgAc5WWuTolY0GS4=;
 b=W24ETMdZ/Y4CPXrAlPAMZEO+8rXoBQ3Tzcf2Z/IFQ484IhWx6Uv5zKMrPGWEgy+TbjmXM9
 nxktO6T2iChaDzioXMEbMuCbRd+FawPF3TjL5xYBAl5iXnPapLzKW2XjWTf9z6tU+pvUy5
 /6U/4yR1mpcPfG/T/6y65Yj6Y2EejXU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-3xIxAXF-OL65O883-GyA8g-1; Thu, 17 Jun 2021 17:03:04 -0400
X-MC-Unique: 3xIxAXF-OL65O883-GyA8g-1
Received: by mail-wm1-f70.google.com with SMTP id
 v20-20020a05600c2154b029019a6368bfe4so2731620wml.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 14:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=agYyY3tXKVXMUmz+0Xcim1r8TzucgAc5WWuTolY0GS4=;
 b=FkWYZVVgw9546fVC7AwjKk5mGVJnn30S1nBkZ/LVfV71H6ZrgLRs3Xy8cpmbNPIiuL
 5z2p8b33iWa4C6NygZG1sJ0i7B04Rwcfa+WNE6+byvYUdwNxMk7iTBJcKRP18s0zDMFS
 I+Um4FysxnBQ6WMisxiqxj+fTrThqj04EurA6UFIVcn5XTdWY6ffP7Y7q4S/cJYTiaHm
 15BMzL9aRnJGrbQmyvVifcAUOu/sThUUP96MovGw/3ti6lMrtuK+LBW6sseC5Kdife6P
 n0/I3PteppdfUFV18WVSUKeTVewi9FvKi0RPMjiQ4btM08UcugbJ+8n3fFdssPZcii26
 tAqQ==
X-Gm-Message-State: AOAM533rukpoyx8+a9+YEtD8Ic2S1FEC1SEJdBJCfn1h2A61LGIy7cwE
 aueC1lYmbN+QXK305Bo7zx7Tt0UfXP389FHHOZzit9msPHDcs6ahv4J3pBuk8AizyL9rCbqpp0N
 au0z3ILeeYNTD0p0=
X-Received: by 2002:a1c:1d05:: with SMTP id d5mr7508043wmd.132.1623963783120; 
 Thu, 17 Jun 2021 14:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2Txgt/NZ+EywzxigcgLGttDVQFwwdH96Spm7huFlf2nMa3M7t/Dcd4yNFGwexCBdM91NcPA==
X-Received: by 2002:a1c:1d05:: with SMTP id d5mr7508030wmd.132.1623963782936; 
 Thu, 17 Jun 2021 14:03:02 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id w8sm6094916wmi.45.2021.06.17.14.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:03:02 -0700 (PDT)
Date: Thu, 17 Jun 2021 17:02:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 0/7] Use ACPI PCI hot-plug for Q35
Message-ID: <20210617165654-mutt-send-email-mst@kernel.org>
References: <20210617190739.3673064-1-jusual@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210617190739.3673064-1-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 09:07:32PM +0200, Julia Suvorova wrote:
> The patch set consists of two parts:
> patches 1-4: introduce new feature
>              'acpi-pci-hotplug-with-bridge-support' on Q35
> patches 5-7: make the feature default along with changes in ACPI tables
> 
> With the feature disabled Q35 falls back to the native hot-plug.
> 
> Pros
>     * no racy behavior during boot (see 110c477c2ed)
>     * eject is possible - according to PCIe spec, attention button
>       press should lead to power off, and then the adapter should be
>       removed manually. As there is no power down state exists in QEMU,
>       we cannot distinguish between an eject and a power down
>       request.
>     * no delay during deleting - after the actual power off software
>       must wait at least 1 second before indicating about it. This case
>       is quite important for users, it even has its own bug:
>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>     * no timer-based behavior - in addition to the previous example,
>       the attention button has a 5-second waiting period, during which
>       the operation can be canceled with a second press. While this
>       looks fine for manual button control, automation will result in
>       the need to queue or drop events, and the software receiving
>       events in all sort of unspecified combinations of attention/power
>       indicator states, which is racy and uppredictable.
>     * fixes or reduces the likelihood of the bugs:
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1833187
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1657077
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1669931
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1678290
> 
> Cons:
>     * no access to possible features presented in slot capabilities
>       (this is only surprise removal AFAIK)


This all looks quite nice to me.
Let's give people a bit of time for review, then I'll merge.

> v5:
>     * make sugar property on TYPE_PCIE_SLOT
>       instead of old TYPE_MACHINE property [Igor]
>     * minor style changes
> v4:
>     * regain per-port control over hot-plug
>     * rebased over acpi-index changes
>     * set property on machine type to
>       make pci code more generic [Igor, Michael]
> 
> v3:
>     * drop change of _OSC to allow SHPC on hotplugged bridges
>     * use 'acpi-root-pci-hotplug'
>     * add migration states [Igor]
>     * minor style changes
> 
> v2:
>     * new ioport range for acpiphp [Gerd]
>     * drop find_pci_host() [Igor]
>     * explain magic numbers in _OSC [Igor]
>     * drop build_q35_pci_hotplug() wrapper [Igor]
> 
> Julia Suvorova (7):
>   hw/acpi/pcihp: Enhance acpi_pcihp_disable_root_bus() to support Q35
>   hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
>   hw/acpi/ich9: Enable ACPI PCI hot-plug
>   hw/pci/pcie: Do not set HPC flag if acpihp is used
>   bios-tables-test: Allow changes in DSDT ACPI tables
>   hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35
>   bios-tables-test: Update golden binaries
> 
>  hw/i386/acpi-build.h              |   5 +++
>  include/hw/acpi/ich9.h            |   5 +++
>  include/hw/acpi/pcihp.h           |   3 +-
>  include/hw/pci/pcie_port.h        |   5 ++-
>  hw/acpi/ich9.c                    |  67 ++++++++++++++++++++++++++++++
>  hw/acpi/pcihp.c                   |  22 +++++++---
>  hw/acpi/piix4.c                   |   4 +-
>  hw/core/machine.c                 |   1 -
>  hw/i386/acpi-build.c              |  32 ++++++++------
>  hw/i386/pc.c                      |   1 +
>  hw/i386/pc_q35.c                  |  11 +++++
>  hw/pci/pcie.c                     |   8 +++-
>  hw/pci/pcie_port.c                |   1 +
>  tests/data/acpi/q35/DSDT          | Bin 7859 -> 8289 bytes
>  tests/data/acpi/q35/DSDT.acpihmat | Bin 9184 -> 9614 bytes
>  tests/data/acpi/q35/DSDT.bridge   | Bin 7877 -> 11003 bytes
>  tests/data/acpi/q35/DSDT.cphp     | Bin 8323 -> 8753 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9513 -> 9943 bytes
>  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7934 -> 8364 bytes
>  tests/data/acpi/q35/DSDT.memhp    | Bin 9218 -> 9648 bytes
>  tests/data/acpi/q35/DSDT.mmio64   | Bin 8990 -> 9419 bytes
>  tests/data/acpi/q35/DSDT.nohpet   | Bin 7717 -> 8147 bytes
>  tests/data/acpi/q35/DSDT.numamem  | Bin 7865 -> 8295 bytes
>  tests/data/acpi/q35/DSDT.tis      | Bin 8465 -> 8894 bytes
>  24 files changed, 143 insertions(+), 22 deletions(-)
> 
> -- 
> 2.30.2


