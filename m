Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169104C42C6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:51:55 +0100 (CET)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNYCY-0005HG-0T
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:51:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXNL-00065u-1H
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:58:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXNI-0005om-02
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 04:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645783132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmGbRe0Jv/6pvBkUkh6ys8qMNWJ6IMl/FV+Eml/GckM=;
 b=U7933b0hDJOiJL1Z31eFQue2deJnLlxvivkejpdMW0UnSlbhr6yQDyoe8DFDyTL4bjjEwp
 0XutN8K9ZvFvFSeC2tQT3pmNtp424v6AbA74kk+esncE3q31t91NaZHf78UcJ/M4bRXWOx
 bP0lDpS60gELluMOVF3yRHzrYfb4aIE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-vME_2KdAN5a2cDCamzDaVQ-1; Fri, 25 Feb 2022 04:58:51 -0500
X-MC-Unique: vME_2KdAN5a2cDCamzDaVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b0037bb9f6feeeso1326382wma.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 01:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zmGbRe0Jv/6pvBkUkh6ys8qMNWJ6IMl/FV+Eml/GckM=;
 b=y5BeLMGCAqEG4UZzDQ/NvbtJSwL4/Eqhi4hVU3Ml7I/8r7FowWm1BVVW2BZFeGC+4y
 V4s0ZX26Sqm2m1gTlkmWDQ0fbjPlZyrIzBdyh2f3QaEFjrCLfsSxK0kLt13c5Q8iVcAm
 DnjgNE3Wp9hRNuvnpeSH+xqflQkcYuFUShn7eyLbH4Q0LY+hXU+zo1ryj449/tb/y3iR
 JFfKzFvZm0vptluMpvCNZyxTKipMJnlo5Kx020O6tVgCDT2P5MysQKC09O4zkdCEgQzA
 4PjpjdB7pKWY/7JGirZKz1icVvj/UM3LshY8cuB7iMIlnb7/SrQv4R6nQgWRHYmj2JWX
 wZfQ==
X-Gm-Message-State: AOAM5323XkFL+G48uZUk3YWDVRk0n2tjQ9WUdxjRrUSjJYbL+K/KKpYz
 lbgt8u+iq915WUtlt1+DfUhvtl2A+l+WFtK1BV83BVlTh52fQ6ObiSFfP6HrAHqhsccs/6jwNBk
 i4BmqJYgiZTEXVNs=
X-Received: by 2002:a05:6000:3ce:b0:1e4:b2ba:e3e3 with SMTP id
 b14-20020a05600003ce00b001e4b2bae3e3mr5415057wrg.204.1645783130283; 
 Fri, 25 Feb 2022 01:58:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU8LyjA3ntyF27+VHFAmg8XEFcUIbQ/lMCPtH+c8GrSu4ffewqAOcy2fyy7mcqJ1E1pU08SQ==
X-Received: by 2002:a05:6000:3ce:b0:1e4:b2ba:e3e3 with SMTP id
 b14-20020a05600003ce00b001e4b2bae3e3mr5415038wrg.204.1645783129990; 
 Fri, 25 Feb 2022 01:58:49 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 a9-20020a05600c2d4900b0038100a95903sm5051355wmg.41.2022.02.25.01.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:58:49 -0800 (PST)
Date: Fri, 25 Feb 2022 04:58:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/4] Fix broken PCIe device after migration
Message-ID: <20220225045327-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220224174411.3296848-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 12:44:07PM -0500, Igor Mammedov wrote:
> Currently ACPI PCI hotplug is enabled by default for Q35 machine
> type and overrides native PCIe hotplug. It works as expected when
> a PCIe device is hotplugged into slot, however the device becomes
> in-operational after migration. Which is caused by BARs being
> disabled on target due to powered off status of the slot.
> 
> Proposed fix disables power control on PCIe slot when ACPI pcihp
> takes over hotplug control and makes PCIe slot check if power
> control is enabled before trying to change slot's power. Which
> leaves slot always powered on and that makes PCI core keep BARs
> enabled.


I thought some more about this. One of the reasons we
did not remove the hotplug capability is really so
it's easier to layer acpi on top of pcihp if we
want to do it down the road. And it would be quite annoying
if we had to add more hack to go back to having capability.

How about instead of patch 3 we call pci_set_power(dev, true) for all
devices where ACPI is managing hotplug immediately on plug?  This will
fix the bug avoiding headache with migration.

Patch 2 does seem like a good idea.

> PS:
> it's still hacky approach as all ACPI PCI hotplug is, but it's
> the least intrusive one. Alternative, I've considered, could be
> chaining hotplug callbacks and making pcihp ones call overriden
> native callbacks while inhibiting hotplug event in native callbacks
> somehow. But that were a bit more intrusive and spills over to SHPC
> if implemented systematically, so I ditched that for now. It could
> be resurrected later on if current approach turns out to be
> insufficient.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> CC: mst@redhat.com
> CC: kraxel@redhat.com
> 
> Igor Mammedov (4):
>   pci: expose TYPE_XIO3130_DOWNSTREAM name
>   pcie: update slot power status only is power control is enabled
>   acpi: pcihp: disable power control on PCIe slot
>   q35: compat: keep hotplugged PCIe device broken after migration for
>     6.2-older machine types
> 
>  include/hw/acpi/pcihp.h                    |  4 +++-
>  include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
>  hw/acpi/acpi-pci-hotplug-stub.c            |  3 ++-
>  hw/acpi/ich9.c                             | 21 ++++++++++++++++++++-
>  hw/acpi/pcihp.c                            | 16 +++++++++++++++-
>  hw/acpi/piix4.c                            |  3 ++-
>  hw/core/machine.c                          |  4 +++-
>  hw/pci-bridge/xio3130_downstream.c         |  3 ++-
>  hw/pci/pcie.c                              |  5 ++---
>  9 files changed, 64 insertions(+), 10 deletions(-)
>  create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
> 
> -- 
> 2.31.1


