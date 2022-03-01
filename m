Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77C4C8EDE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:22:35 +0100 (CET)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4Kg-0002LC-AN
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:22:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP4Ix-0000jZ-2H
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:20:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP4Is-0005x2-6t
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646148038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=46CbhvA9qZAnLHFuxuRDqk4fYVnA9nkYzf/0mVIkX5A=;
 b=Ylu7FimQUP0HashNF2ByIQI7b5MRuJMzzDw8DcasUW2e3yPquMTzNyBPIVdwjFVv+G8eYt
 /fSZFay45ulVuSCHb+GtEFswOcO3ghr11QtYzAvnBZyC3uhKh3+ZpAezwtLBl7tONWKRf+
 +oEDYZAJ5v1qVgi+Pz/siEL0xP1aTvk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-BQq2UrT9N_2asRK2rFdqXQ-1; Tue, 01 Mar 2022 10:20:37 -0500
X-MC-Unique: BQq2UrT9N_2asRK2rFdqXQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so3425230wra.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 07:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=46CbhvA9qZAnLHFuxuRDqk4fYVnA9nkYzf/0mVIkX5A=;
 b=DeEewUxa+s+Kp7A7TTWGrp4CfNnN+Bm+TYcPvraF2th/VQ6aT3sCQRzQ0+zfuaniMH
 /oF4YIiBl2HcHHQdwlTpWYswaW2LHP4CIHLF256b2DpC+/MpfUgBwAY3oAm9hUMDRgNn
 ObpCEM1N08otVa4AWsb8OYTrS5SEsusIjxYqpxUGx1S5P7/2Olrpq8t402KctMd8K9Io
 jFvJ2Q+UMjDWaffsGwNIrUomB0vLL4hmQdfNGPhm5rcA7qEtzsFl66jS1lnAlScG+Xam
 NzEfv+mDk7xrfHUHKKQBamJQPROOqKr8nGNFqKyuoLaBMtzpjjNiA2Bhe8nutURiSz7i
 CfZg==
X-Gm-Message-State: AOAM533cjMZQTWgSBSdIAVAL5bIMwEPPT1ZenaBx9Frw3GLq8lZUy5Rv
 TZjatBg7H8Xhjcg0R+K/7olHolap82Y9nC7rdmPhCgzAzoBGWUAy+0D8FwV5fEEvyCf49uYYsF/
 pJka1hzvXC0otsyE=
X-Received: by 2002:adf:c44d:0:b0:1ea:99b6:2c2a with SMTP id
 a13-20020adfc44d000000b001ea99b62c2amr20211850wrg.716.1646148036280; 
 Tue, 01 Mar 2022 07:20:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIVfn19AqIl3TKyMneiohMu0teNxVbVOS1fumz1Xw0vSFUnTcrWRMdOEVS7sGCTfwNUxKg7A==
X-Received: by 2002:adf:c44d:0:b0:1ea:99b6:2c2a with SMTP id
 a13-20020adfc44d000000b001ea99b62c2amr20211837wrg.716.1646148035986; 
 Tue, 01 Mar 2022 07:20:35 -0800 (PST)
Received: from redhat.com ([2.53.2.184]) by smtp.gmail.com with ESMTPSA id
 p11-20020adfce0b000000b001e7026150besm14108750wrn.31.2022.03.01.07.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 07:20:35 -0800 (PST)
Date: Tue, 1 Mar 2022 10:20:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 0/3] Fix broken PCIe device after migration
Message-ID: <20220301102014-mutt-send-email-mst@kernel.org>
References: <20220301151200.3507298-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220301151200.3507298-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Mar 01, 2022 at 10:11:57AM -0500, Igor Mammedov wrote:
> Changelog:
>    v2:
>      * instead of disabling power control on slot and letting ACPI
>        PCI hotplug  module in guest to deal with it, set
>        PCI_EXP_SLTCTL_PWR_ON on PCIe slot from acpi_pcihp_device_plug_cb()
>        when a device plugged into it.
> 
> Currently ACPI PCI hotplug is enabled by default for Q35 machine
> type and overrides native PCIe hotplug. It works as expected when
> a PCIe device is hotplugged into slot, however the device becomes
> in-operational after migration. Which is caused by BARs being
> disabled on target due to powered off status of the slot.
> 
> Proposed fix turns on power on PCIe slot when a device is
> hotplugged into it, then that state is migrated and device
> stays powred on after migration. 


Looks good for 1-2. Some questions on 3.
Thanks!

> Tested with (seabios: FC34, Win2012; ovmf: RHEL8)
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> CC: mst@redhat.com
> CC: kraxel@redhat.com
> 
> Ref to v1:
>  https://lore.kernel.org/all/20220225100127.78974d71@redhat.com/T/
> Gitlab link:
>  https://gitlab.com/imammedo/qemu/-/tree/pcie_poweroff_acpi_regression_rhbz2053584_V2
> 
> Igor Mammedov (3):
>   pci: expose TYPE_XIO3130_DOWNSTREAM name
>   acpi: pcihp: pcie: set power on cap on parent slot
>   q35: compat: keep hotplugged PCIe device broken after migration for
>     6.2 and older machine types
> 
>  include/hw/acpi/pcihp.h                    |  1 +
>  include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
>  include/hw/pci/pcie.h                      |  1 +
>  hw/acpi/ich9.c                             | 20 ++++++++++++++++++++
>  hw/acpi/pcihp.c                            | 15 ++++++++++++++-
>  hw/core/machine.c                          |  4 +++-
>  hw/pci-bridge/xio3130_downstream.c         |  3 ++-
>  hw/pci/pcie.c                              | 11 +++++++++++
>  8 files changed, 67 insertions(+), 3 deletions(-)
>  create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
> 
> -- 
> 2.31.1


