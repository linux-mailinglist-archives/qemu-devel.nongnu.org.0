Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EE03BA991
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:47:13 +0200 (CEST)
Received: from localhost ([::1]:59550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzinQ-0000z8-IN
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzimE-0000HW-Cu
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzimA-0002by-3i
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625330753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wb8CKudEnAzbYcq2rEY1bFW45gkO0i6EJKrrdNs0rT8=;
 b=NCGZdQfV5VO97Bhy+Iuh7+1W2G/iOUcKkBTlSlfsU7sN92zHVZGiGSnHDH+7Atdlpt9Bni
 txChtWV9y++f4bhZyVxoaJCgySS06vR6Z879dZJ2BJszgIKrReNZUVMa7T2cyHdbtc1jZf
 8TUGnRkJfp3GhM3mMNiB3XX8FiKwSQk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-22Z_cgbFPnOE3VuuQGNb3w-1; Sat, 03 Jul 2021 12:45:51 -0400
X-MC-Unique: 22Z_cgbFPnOE3VuuQGNb3w-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020adfa1d20000b029012c379fbc45so4148226wrv.22
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wb8CKudEnAzbYcq2rEY1bFW45gkO0i6EJKrrdNs0rT8=;
 b=SbadkYAaEDle0NxyF6nLFPFkkMKCx5Zz8K51o4s5Q/dYdET2CBiQteKttPb5EFv7YC
 NhpVGFmBMfd9R0uUZNWkSR8JePmmX0dtKNyajw0ZShdnbBkkGObHDFL/rpvVGQkzaQ3L
 S5Lr9dREB+94oHZEWbpGglXBdOfBwezMRHAQO/wPPfjTnaR9DFt9MXZ/JtmdpfuC49uV
 kY6+8r7P9H63ax/DcudPrROj+Lga+ybyKSRj+BbFrQh82b9D565hlQpqrEuJtA6P7IA4
 r8k8sejNwmRSUIpQd3eM7x9s2mtlJ3i2bVSKCwDRJleQp9XM0nx3J3PNVwNYvGJmFP8s
 n3Pg==
X-Gm-Message-State: AOAM5307lR96R2/f7J71g9lNUi//ZW8gx2i90Fz3pO5eCxXR0aq48Wuh
 rq7mLQcyVMSXFV3UsqfsgbMTkmFB27qeUJyc2/c8N6kJg5vcL4LLQZziX2yITS2ib0+N+rzonir
 dQCPViuswyij2jGE=
X-Received: by 2002:adf:f507:: with SMTP id q7mr6027505wro.243.1625330750698; 
 Sat, 03 Jul 2021 09:45:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz+QlAPGf/1C9ydcL9y1tGPWwBBNhfhXolTjVJng6Mwlq3MepMeAI03IKRNjLOl6Ly1tnwFg==
X-Received: by 2002:adf:f507:: with SMTP id q7mr6027491wro.243.1625330750516; 
 Sat, 03 Jul 2021 09:45:50 -0700 (PDT)
Received: from redhat.com ([77.126.110.253])
 by smtp.gmail.com with ESMTPSA id 31sm7722974wrs.79.2021.07.03.09.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 09:45:49 -0700 (PDT)
Date: Sat, 3 Jul 2021 12:45:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 0/7] Use ACPI PCI hot-plug for Q35
Message-ID: <20210703124342-mutt-send-email-mst@kernel.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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

OK I had to drop this because of issues on mips and friends.
Note it's not just a build failure: the API acpi_get_i386_pci_host
can not be stubbed out cleanly - we need to return a pci bus.

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
> 
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


