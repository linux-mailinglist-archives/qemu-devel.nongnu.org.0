Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE83D505C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 00:16:09 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7mPo-000293-4y
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 18:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m7mOZ-0001M1-2G
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 18:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m7mOV-00015f-DI
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 18:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627251285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K7wiAc36sgnMs8dsGTvOfrH9T+k1KB69aTneazTcTTY=;
 b=RmG/Iot1zmZGCrBoiR/9Azhfi6uQzy8b5xsrrISmaBGuWDhL1ofeQHpi6xeZDar9Vb7OV/
 sz+cpo333kx4mHcXZfDixqCLMZcnzXTAYjrhAegD0J1Ms7AYhjNMOb0Z+NMl5HM+Ov0j7U
 VXQzIVdlARwR7XdTMvPg2wrI+mFIefs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-J2QMee3mPV6ApMqCavJQ8g-1; Sun, 25 Jul 2021 18:14:44 -0400
X-MC-Unique: J2QMee3mPV6ApMqCavJQ8g-1
Received: by mail-wr1-f72.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so3765593wrs.13
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 15:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K7wiAc36sgnMs8dsGTvOfrH9T+k1KB69aTneazTcTTY=;
 b=LRTTyPxUX6RWLqrpb3BiN/abhwGLj8VNNCYNyxqVVKS3iQuanF0afua2hJe3hS4AeV
 myrG4LSLNgYGKXpjNpdNXZxAvmAshPrEYhzKaF6sVsIBUSfGYMhVWonu0VV55/9WxpND
 kyBj19TTCbnecm3MJfLZ11yNLDdEnvcM/EhwoVuZI/AaPKDY4R9dUSP16JRTxyrxQQES
 ndyZ/aDqd27rQ2HRaRBLQ5OEBSZ0nbJgnjIFicUmw1USyzZzixUxLw7iokXO7tx9vTHg
 UbBz73sLIxAT2W7f6Rvwws+uiyd+xt8DeEbGqcWCZ1s8VPxvXYRYt2D44f8mq8vvLc4k
 kN8w==
X-Gm-Message-State: AOAM533tpBHLKmOx03JYcmwfNZo4qbE1Yypm6qw7/DhxxU21flY96v8F
 pWLJfVUMQza7D9NurOZzLtx3FymKmF/smHS7t9xQ+/6fq9TQUkE8XyIAK5Dk2VF9sBal4LJCSYL
 UDSJQd3N2NpVgJmE=
X-Received: by 2002:adf:e7c8:: with SMTP id e8mr15512455wrn.303.1627251282912; 
 Sun, 25 Jul 2021 15:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkS65H8EhKKZxATGZlmKvUalrV/2jRQ7G4/TkEIFLv/LmA4xayUq6fe0D/Z6PLW57KEuuuJA==
X-Received: by 2002:adf:e7c8:: with SMTP id e8mr15512445wrn.303.1627251282709; 
 Sun, 25 Jul 2021 15:14:42 -0700 (PDT)
Received: from redhat.com ([2.55.20.108])
 by smtp.gmail.com with ESMTPSA id 104sm6479109wrc.4.2021.07.25.15.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 15:14:41 -0700 (PDT)
Date: Sun, 25 Jul 2021 18:14:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210725181334-mutt-send-email-mst@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <20210724185234.GA2265457@roeck-us.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> Hi all,
> 
> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> work. Analysis shows that PCI devices with IO ports do not instantiate
> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only affects
> aarch64, not x86/x86_64.
> 
> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> keep firmware resource map"). Since this commit, PCI device BAR
> allocation has changed. Taking tulip as example, the kernel reports
> the following PCI bar assignments when running qemu v5.2.
> 
> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem 0x10000000-0x1000007f]
> 
> With qemu v6.0, the assignment is reported as follows.
> 
> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> 
> and the controller does not instantiate. The problem disapears after
> reverting commit 0cf8882fd0.
> 
> Attached is a summary of test runs with various devices and qemu v5.2
> as well as qemu v6.0, and the command line I use for efi boots.
> 
> Did commit 0cf8882fd0 introduce a bug, do I now need need some different
> command line to instantiate PCI devices with io ports, or are such devices
> simply no longer supported if the system is booted with efi support ?
> 
> Thanks,
> Guenter


So that commit basically just says don't ignore what efi did.

The issue's thus likely efi.

Cc the maintainer. Philippe can you comment pls?

> ---
> Command line (tulip network interface):
> 
> CMDLINE="root=/dev/vda console=ttyAMA0"
> ROOTFS="rootfs.ext2"
> 
> qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
>         -m 512 -cpu cortex-a57 -no-reboot \
>         -device tulip,netdev=net0 -netdev user,id=net0 \
>         -bios QEMU_EFI-aarch64.fd \
>         -snapshot \
>         -device virtio-blk-device,drive=d0 \
>         -drive file=${ROOTFS},if=none,id=d0,format=raw \
>         -nographic -serial stdio -monitor none \
>         --append "${CMDLINE}"
> 
> ---
> Boot tests with various devices known to work in qemu v5.2.
> 
> 		v5.2	v6.0	v6.0
> 		efi	non-efi	efi
> e1000		pass	pass	pass
> e1000-82544gc	pass	pass	pass
> e1000-82545em	pass	pass	pass
> e1000e		pass	pass	pass
> i82550		pass	pass	pass
> i82557a		pass	pass	pass
> i82557b		pass	pass	pass
> i82557c		pass	pass	pass
> i82558a		pass	pass	pass
> i82559b		pass	pass	pass
> i82559c		pass	pass	pass
> i82559er	pass	pass	pass
> i82562		pass	pass	pass
> i82801		pass	pass	pass
> ne2k_pci	pass	pass	fail	<--
> pcnet		pass	pass	pass
> rtl8139		pass	pass	pass
> tulip		pass	pass	fail	<--
> usb-net		pass	pass	pass
> virtio-net-device
> 		pass	pass	pass
> virtio-net-pci	pass	pass	pass
> virtio-net-pci-non-transitional
> 		pass	pass	pass
> 
> usb-xhci	pass	pass	pass
> usb-ehci	pass	pass	pass
> usb-ohci	pass	pass	pass
> usb-uas-xhci	pass	pass	pass
> virtio		pass	pass	pass
> virtio-blk-pci	pass	pass	pass
> virtio-blk-device
> 		pass	pass	pass
> nvme		pass	pass	pass
> sdhci		pass	pass	pass
> dc390		pass	pass	fail	<--
> am53c974	pass	pass	fail	<--
> lsi53c895ai	pass	pass	pass
> mptsas1068	pass	pass	pass
> lsi53c810	pass	pass	pass
> megasas		pass	pass	pass
> megasas-gen2	pass	pass	pass
> virtio-scsi-device
> 		pass	pass	pass
> virtio-scsi-pci	pass	pass	pass


