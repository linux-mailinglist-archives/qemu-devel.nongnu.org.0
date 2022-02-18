Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22914BB47F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:44:13 +0100 (CET)
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKys8-0003iu-LU
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyZc-0007FH-8Z
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:25:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyZZ-0001Jc-W6
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:25:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645172701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8D7V8oEhW+VzLNw7QPxXIsI+NR3+fB0wb8RMVPip0XA=;
 b=bphf+FlGeVeICQTPwfzQDjBNKWTpDk9z12B68/Z29W/e1kHUC7VtbURNAJUAnIeC4Pnjwr
 +fS5RjY4WAOA5dTBk1ngBozz48ySLsJFMK3D1/pQjLDmgUXvuVMQ4buWubsfNNey9uHKXZ
 iZuUGBAiDC77VlREtSQn3PoXLrDO+qM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-ig1uDzErO_eZt5K7vqRo1w-1; Fri, 18 Feb 2022 03:25:00 -0500
X-MC-Unique: ig1uDzErO_eZt5K7vqRo1w-1
Received: by mail-ed1-f71.google.com with SMTP id
 o8-20020a056402438800b00410b9609a62so5077478edc.3
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 00:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8D7V8oEhW+VzLNw7QPxXIsI+NR3+fB0wb8RMVPip0XA=;
 b=L1qzv2j8ruU9eLXbW4ws40EKz5ij+iiAWQt3Ds7jePbzfs0E4pbTOCTAQKMh4ziJwI
 5TRIR3+tSNama295essNrDmoe6AXqZRbIGtokgDHSdDCrKHq0R81Zi6S48d4Lq8yJ8e7
 EgFiChl0pjsu/mYAYdIcsVoSthrC0o2FRRSM1f+M5rsDViNXSV10BsUdzGeuLGsS8E+T
 BTmo/0sH8Ge4RUEJ4zyXPcEqNkNVeAZaqd3xKha6wOiIhH8MYsG3FX66cl0lhFGn+OJs
 uBGL+Sfz8bY39Peu4GPCHPJjooKvNv0oud3LOuZIqLQ/NZP5hzNfakMnmAnp8vJN6P5A
 KqSA==
X-Gm-Message-State: AOAM533S3tgZklr7/g7pexGo7Kzgbucn/BFfx14u9VTBJOGU0cuPGqxN
 5ccpSYz44CWWkJpxdEYh40e16vMxMg/sXBPvJCU/ZZzLaWbXznj/4MsVVgleixWBluWK+fGVysG
 oQY5cBtNzgIdTyIE=
X-Received: by 2002:aa7:dbd6:0:b0:408:4a31:97a5 with SMTP id
 v22-20020aa7dbd6000000b004084a3197a5mr6989544edt.186.1645172699008; 
 Fri, 18 Feb 2022 00:24:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpIAuSt4DQ5wskwnQE+tdnAtETZ94V1CMMVBsz231hfXzZP7tvInhmXj/1UPBl57dO5aObGg==
X-Received: by 2002:aa7:dbd6:0:b0:408:4a31:97a5 with SMTP id
 v22-20020aa7dbd6000000b004084a3197a5mr6989506edt.186.1645172698612; 
 Fri, 18 Feb 2022 00:24:58 -0800 (PST)
Received: from redhat.com ([2.55.156.211])
 by smtp.gmail.com with ESMTPSA id kw5sm2025836ejc.140.2022.02.18.00.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 00:24:57 -0800 (PST)
Date: Fri, 18 Feb 2022 03:24:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 02/15] pcie: Add some SR/IOV API documentation in
 docs/pcie_sriov.txt
Message-ID: <20220218032448-mutt-send-email-mst@kernel.org>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-3-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20220217174504.1051716-3-lukasz.maniak@linux.intel.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:44:51PM +0100, Lukasz Maniak wrote:
> From: Knut Omang <knut.omang@oracle.com>
> 
> Add a small intro + minimal documentation for how to
> implement SR/IOV support for an emulated device.
> 
> Signed-off-by: Knut Omang <knuto@ifi.uio.no>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  docs/pcie_sriov.txt | 115 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 docs/pcie_sriov.txt
> 
> diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
> new file mode 100644
> index 00000000000..f5e891e1d45
> --- /dev/null
> +++ b/docs/pcie_sriov.txt
> @@ -0,0 +1,115 @@
> +PCI SR/IOV EMULATION SUPPORT
> +============================
> +
> +Description
> +===========
> +SR/IOV (Single Root I/O Virtualization) is an optional extended capability
> +of a PCI Express device. It allows a single physical function (PF) to appear as multiple
> +virtual functions (VFs) for the main purpose of eliminating software
> +overhead in I/O from virtual machines.
> +
> +Qemu now implements the basic common functionality to enable an emulated device
> +to support SR/IOV. Yet no fully implemented devices exists in Qemu, but a
> +proof-of-concept hack of the Intel igb can be found here:
> +
> +git://github.com/knuto/qemu.git sriov_patches_v5
> +
> +Implementation
> +==============
> +Implementing emulation of an SR/IOV capable device typically consists of
> +implementing support for two types of device classes; the "normal" physical device
> +(PF) and the virtual device (VF). From Qemu's perspective, the VFs are just
> +like other devices, except that some of their properties are derived from
> +the PF.
> +
> +A virtual function is different from a physical function in that the BAR
> +space for all VFs are defined by the BAR registers in the PFs SR/IOV
> +capability. All VFs have the same BARs and BAR sizes.
> +
> +Accesses to these virtual BARs then is computed as
> +
> +   <VF BAR start> + <VF number> * <BAR sz> + <offset>
> +
> +From our emulation perspective this means that there is a separate call for
> +setting up a BAR for a VF.
> +
> +1) To enable SR/IOV support in the PF, it must be a PCI Express device so
> +   you would need to add a PCI Express capability in the normal PCI
> +   capability list. You might also want to add an ARI (Alternative
> +   Routing-ID Interpretation) capability to indicate that your device
> +   supports functions beyond it's "own" function space (0-7),
> +   which is necessary to support more than 7 functions, or
> +   if functions extends beyond offset 7 because they are placed at an
> +   offset > 1 or have stride > 1.
> +
> +   ...
> +   #include "hw/pci/pcie.h"
> +   #include "hw/pci/pcie_sriov.h"
> +
> +   pci_your_pf_dev_realize( ... )
> +   {
> +      ...
> +      int ret = pcie_endpoint_cap_init(d, 0x70);
> +      ...
> +      pcie_ari_init(d, 0x100, 1);
> +      ...
> +
> +      /* Add and initialize the SR/IOV capability */
> +      pcie_sriov_pf_init(d, 0x200, "your_virtual_dev",
> +                       vf_devid, initial_vfs, total_vfs,
> +                       fun_offset, stride);
> +
> +      /* Set up individual VF BARs (parameters as for normal BARs) */
> +      pcie_sriov_pf_init_vf_bar( ... )
> +      ...
> +   }
> +
> +   For cleanup, you simply call:
> +
> +      pcie_sriov_pf_exit(device);
> +
> +   which will delete all the virtual functions and associated resources.
> +
> +2) Similarly in the implementation of the virtual function, you need to
> +   make it a PCI Express device and add a similar set of capabilities
> +   except for the SR/IOV capability. Then you need to set up the VF BARs as
> +   subregions of the PFs SR/IOV VF BARs by calling
> +   pcie_sriov_vf_register_bar() instead of the normal pci_register_bar() call:
> +
> +   pci_your_vf_dev_realize( ... )
> +   {
> +      ...
> +      int ret = pcie_endpoint_cap_init(d, 0x60);
> +      ...
> +      pcie_ari_init(d, 0x100, 1);
> +      ...
> +      memory_region_init(mr, ... )
> +      pcie_sriov_vf_register_bar(d, bar_nr, mr);
> +      ...
> +   }
> +
> +Testing on Linux guest
> +======================
> +The easiest is if your device driver supports sysfs based SR/IOV
> +enabling. Support for this was added in kernel v.3.8, so not all drivers
> +support it yet.
> +
> +To enable 4 VFs for a device at 01:00.0:
> +
> +	modprobe yourdriver
> +	echo 4 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
> +
> +You should now see 4 VFs with lspci.
> +To turn SR/IOV off again - the standard requires you to turn it off before you can enable
> +another VF count, and the emulation enforces this:
> +
> +	echo 0 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
> +
> +Older drivers typically provide a max_vfs module parameter
> +to enable it at load time:
> +
> +	modprobe yourdriver max_vfs=4
> +
> +To disable the VFs again then, you simply have to unload the driver:
> +
> +	rmmod yourdriver
> -- 
> 2.25.1


