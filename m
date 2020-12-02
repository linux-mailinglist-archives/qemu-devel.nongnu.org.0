Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76712CBB31
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:04:20 +0100 (CET)
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPvn-0002bN-TL
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOpD-0003Yq-TM
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOp9-00036V-MG
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606902801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNOZtdpjZF5frLkDGk8E7WP+ZRSlwMCFHNaY+PC68I0=;
 b=faQoHVB89jb+2k/2/75fTTG7Ufg8jYEgGh3wwzEcQ426kfSsUpznNSaZ66mc2L/2eK58k1
 rE+0/u666eQnula8tOigBR/UeFLEfhE/7q1euF+ej29/s8hoGTNBhWbr5/ACSATgp8zbsP
 RPUWXmL/YyTWj9ZunWSji5ewutylb5o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-h18ISSEGOy-o-BO20sYVjA-1; Wed, 02 Dec 2020 04:53:19 -0500
X-MC-Unique: h18ISSEGOy-o-BO20sYVjA-1
Received: by mail-wm1-f71.google.com with SMTP id q1so2658659wmq.2
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cNOZtdpjZF5frLkDGk8E7WP+ZRSlwMCFHNaY+PC68I0=;
 b=EFmfL56Bg8oWVRSM0iubLh2TDcxpUhYYOBD03fA5/gRqEd0xS+Q3mp+Z2b+tXAFNXU
 mRSuAUxKIsUi/AAy5FHp9NnsDSsx6oYHOcheNYjRgZUy/HlI88HzJehGg6+9wjbxXrB5
 1qaKjCFFVUG4Fo4lJWCn4TK7fF6Dgg86/t5gC7v4L8hxSugFdrVNu2G0x4GM9quyjYTS
 UPVO5aU4+9/Dm3y0d6YL5vKlDQD7ETAowPxzXOOFjRxYVmH3C53Ewn8m44ZeXm11q8r+
 ecZ1wHUq18qTH3wOQZ/qiPO7EDtqeCLifIr4p3o0ctlES1FrInH2/YuEpT6b7QDPiMdF
 O3zg==
X-Gm-Message-State: AOAM530q9JM8qb5LRFO+4DrfT/sr/T38RhVD+kRZ8a5eOqWuTL65bb4i
 HdwcaTjuAHJbYHIr+2jTDaSXm3T9IrHyDggyQ0oO5nGXlIfNc3Fs4PzEahVh9kDTzDRFvOSX0Vz
 WO0f3A7nIP0OVY0k=
X-Received: by 2002:a5d:4c8d:: with SMTP id z13mr2477764wrs.248.1606902797671; 
 Wed, 02 Dec 2020 01:53:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpKk564wJnZpLgoG0RDoFHKtcJI3f7C5Nns89BP3BrSOjXDHDXu+FvP5CyUOppaje8TEVawA==
X-Received: by 2002:a5d:4c8d:: with SMTP id z13mr2477732wrs.248.1606902797469; 
 Wed, 02 Dec 2020 01:53:17 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b74sm1351436wme.27.2020.12.02.01.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 01:53:16 -0800 (PST)
Date: Wed, 2 Dec 2020 04:53:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v10 0/9] pci_expander_brdige:acpi: Support pxb-pcie for ARM
Message-ID: <20201202045244-mutt-send-email-mst@kernel.org>
References: <20201119014841.7298-1-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201119014841.7298-1-cenjiahui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, miaoyubo@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 09:48:32AM +0800, Jiahui Cen wrote:
> Changes with v9
> v9->v10:
> Refactor patch2 to drop useless macros and variables.
> Split patch2 into two patches.

I tagged this for after the release. To help make sure this is
not lost pls ping me after the release.

Thanks!

> Changes with v8
> v8->v9:
> Rebase to master
> 
> Changes with v7
> v7->v8:
> Fix the error:no member named 'fw_cfg' in 'struct PCMachineState'
> 
> Changes with v6
> v6->v7:
> Refactor fw_cfg_write_extra_pci_roots
> Add API PCI_GET_PCIE_HOST_STATE
> Fix typos
> 
> Changes with v5
> v5->v6: stat crs_range_insert in aml_build.h
> 
> Changes with v4
> v4->v5: Not using specific resources for PXB.
> Instead, the resources for pxb are composed of the bar space of the
> pci-bridge/pcie-root-port behined it and the config space of devices
> behind it.
> 
> Only if the bios(uefi for arm) support multiple roots,
> configure space of devices behind pxbs could be obtained.
> The newest uefi work is updated for discussion by the following link:
> https://edk2.groups.io/g/devel/topic/78135572#67173
> [PATCH v2 0/4] Add extra pci roots support for Arm
> 
> Currently pxb-pcie is not supported by arm,
> the reason for it is pxb-pcie is not described in DSDT table
> and only one main host bridge is described in acpi tables,
> which means it is not impossible to present different io numas
> for different devices.
> 
> This series of patches make arm to support PXB-PCIE.
> 
> Users can configure pxb-pcie with certain numa, Example command
> is:
> 
>    -device pxb-pcie,id=pci.7,bus_nr=128,numa_node=0,bus=pcie.0,addr=0x9
> 
> Jiahui Cen (2):
>   fw_cfg: Refactor extra pci roots addition
>   hw/arm/virt: Write extra pci roots into fw_cfg
> 
> Yubo Miao (7):
>   acpi/gpex: Extract two APIs from acpi_dsdt_add_pci
>   acpi: Extract crs build form acpi_build.c
>   acpi/gpex: Build tables for pxb
>   acpi: Align the size to 128k
>   unit-test: The files changed.
>   unit-test: Add testcase for pxb
>   unit-test: Add the binary file and clear diff.h
> 
>  hw/acpi/aml-build.c            | 285 +++++++++++++++++++
>  hw/arm/virt-acpi-build.c       |  31 ++-
>  hw/arm/virt.c                  |   7 +-
>  hw/i386/acpi-build.c           | 293 --------------------
>  hw/i386/pc.c                   |  18 +-
>  hw/nvram/fw_cfg.c              |  23 ++
>  hw/pci-host/gpex-acpi.c        | 166 +++++++----
>  include/hw/acpi/aml-build.h    |  22 ++
>  include/hw/arm/virt.h          |   1 +
>  include/hw/nvram/fw_cfg.h      |   9 +
>  include/hw/pci-host/gpex.h     |   1 +
>  tests/data/acpi/virt/DSDT.pxb  | Bin 0 -> 7802 bytes
>  tests/qtest/bios-tables-test.c |  58 +++-
>  13 files changed, 545 insertions(+), 369 deletions(-)
>  create mode 100644 tests/data/acpi/virt/DSDT.pxb
> 
> -- 
> 2.28.0


