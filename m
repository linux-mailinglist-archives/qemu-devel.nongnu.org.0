Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C473D494A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 20:54:29 +0200 (CEST)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7Mn6-0005KE-31
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 14:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m7MlM-00046l-6k
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 14:52:40 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:46791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m7MlK-00047z-9a
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 14:52:39 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 v8-20020a0568301bc8b02904d5b4e5ca3aso4740431ota.13
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Z6mBG/8Q+VllMDCulMmqmnSbCKA1BH6bIGLixfA92aU=;
 b=Zrlo7ItrVzJ2BpR/mZnoIPR6bGQx1ReJWXJBOPGEpTQw4Ofud4O6caysB9R2bfWSbC
 8V7T4Mm893LVQE+1Kg6GwRbTk0YyDN1KGYPpjZpEVRXKbA7JduGMyzVnF7VXOe53pnTl
 jhNf+fdbhG+eHwD7N7DclXyKguSV5C5m0U5k5Cw0iN8dgcr0IdrElPgaCWEeZZnLf0iO
 Y0PlG2XKDd5gACDWSkOvMCriEVBYveES6LWps/kPgDX7HiSz8kYPMcCX9Nug+ND2aOn8
 2kunTifhlT1pdwF/5lX+tGEHofIEjLyHvgy+uW9t5qH32W4nX1NyU155ewhE7c7RdRtm
 NurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=Z6mBG/8Q+VllMDCulMmqmnSbCKA1BH6bIGLixfA92aU=;
 b=SEJ+VQ5xcmc2mXFFDziZIfd6AqLVP4dXEaLGp81loZZpJ+4FSeWbAahlJu0nxIpb/d
 U7y1vH7soLMY7XtSNKSVqmvKNFNf85eH4dhb+xrMu6tMnR95/yka1jdpGC7Tboki9EJJ
 YKzLInsy/TWfR/Y++ExZ5ok92U2hCGYdSfrNiOjMCiWWHTUGDwBReYyuxdWK2ZU1Q5AL
 pTg7JWFrk1KV9SsazUhLuURemXGmiAzD8hVo0BwhdaZHVijvgfJi3/N8/rTh8Qc3Nvby
 ShIpTgDebrZYOc/MsCDpNI+stpxjy2ofbX4Tjx4g2XUAHeG3Q7XhWff4B+wMPOYGfpCC
 46iQ==
X-Gm-Message-State: AOAM5312va9BDNIAY7x4tfY83Enn0OX5h4C1JMtac3/5HYgrf1SCdwya
 zzeq6xszPQ2r81PG/byu6La7oTqs0H0=
X-Google-Smtp-Source: ABdhPJzZZVDdMy8Kfzm2RfvGVAu5ThoQkCno5CdEJbSWCWWKkovVwkmhL1mP/TIoSdWHgpQ5UYcd0g==
X-Received: by 2002:a9d:6ad4:: with SMTP id m20mr7178791otq.338.1627152756396; 
 Sat, 24 Jul 2021 11:52:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p4sm5937390ooa.35.2021.07.24.11.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 11:52:35 -0700 (PDT)
Date: Sat, 24 Jul 2021 11:52:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-devel@nongnu.org
Subject: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210724185234.GA2265457@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

starting with qemu v6.0, some of my aarch64 efi boot tests no longer
work. Analysis shows that PCI devices with IO ports do not instantiate
in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
(at least) ne2k_pci, tulip, dc390, and am53c974. The problem only affects
aarch64, not x86/x86_64.

I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
keep firmware resource map"). Since this commit, PCI device BAR
allocation has changed. Taking tulip as example, the kernel reports
the following PCI bar assignments when running qemu v5.2.

[    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
[    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
[    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
[    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
[    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem 0x10000000-0x1000007f]

With qemu v6.0, the assignment is reported as follows.

[    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
[    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
[    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]

and the controller does not instantiate. The problem disapears after
reverting commit 0cf8882fd0.

Attached is a summary of test runs with various devices and qemu v5.2
as well as qemu v6.0, and the command line I use for efi boots.

Did commit 0cf8882fd0 introduce a bug, do I now need need some different
command line to instantiate PCI devices with io ports, or are such devices
simply no longer supported if the system is booted with efi support ?

Thanks,
Guenter

---
Command line (tulip network interface):

CMDLINE="root=/dev/vda console=ttyAMA0"
ROOTFS="rootfs.ext2"

qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
        -m 512 -cpu cortex-a57 -no-reboot \
        -device tulip,netdev=net0 -netdev user,id=net0 \
        -bios QEMU_EFI-aarch64.fd \
        -snapshot \
        -device virtio-blk-device,drive=d0 \
        -drive file=${ROOTFS},if=none,id=d0,format=raw \
        -nographic -serial stdio -monitor none \
        --append "${CMDLINE}"

---
Boot tests with various devices known to work in qemu v5.2.

		v5.2	v6.0	v6.0
		efi	non-efi	efi
e1000		pass	pass	pass
e1000-82544gc	pass	pass	pass
e1000-82545em	pass	pass	pass
e1000e		pass	pass	pass
i82550		pass	pass	pass
i82557a		pass	pass	pass
i82557b		pass	pass	pass
i82557c		pass	pass	pass
i82558a		pass	pass	pass
i82559b		pass	pass	pass
i82559c		pass	pass	pass
i82559er	pass	pass	pass
i82562		pass	pass	pass
i82801		pass	pass	pass
ne2k_pci	pass	pass	fail	<--
pcnet		pass	pass	pass
rtl8139		pass	pass	pass
tulip		pass	pass	fail	<--
usb-net		pass	pass	pass
virtio-net-device
		pass	pass	pass
virtio-net-pci	pass	pass	pass
virtio-net-pci-non-transitional
		pass	pass	pass

usb-xhci	pass	pass	pass
usb-ehci	pass	pass	pass
usb-ohci	pass	pass	pass
usb-uas-xhci	pass	pass	pass
virtio		pass	pass	pass
virtio-blk-pci	pass	pass	pass
virtio-blk-device
		pass	pass	pass
nvme		pass	pass	pass
sdhci		pass	pass	pass
dc390		pass	pass	fail	<--
am53c974	pass	pass	fail	<--
lsi53c895ai	pass	pass	pass
mptsas1068	pass	pass	pass
lsi53c810	pass	pass	pass
megasas		pass	pass	pass
megasas-gen2	pass	pass	pass
virtio-scsi-device
		pass	pass	pass
virtio-scsi-pci	pass	pass	pass

