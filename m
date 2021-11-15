Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269054517D2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:45:37 +0100 (CET)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkjI-00028u-9X
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:45:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkhn-0001Ta-2G
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkhl-0003mj-E3
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1BIOwByKcAXembpXzQc+agrkQmvvvaA+ruQqYp5t/g=;
 b=acDQSBjMjjkn2BWRW4ierRM0Z5dbDOBZsJwzx5y7hWj9wGjsedrpFDC3P4TAskOsaCV1tY
 ry/Yd5wnmdmRxKlCznPKLgzBdWDBYMTTkxsqEpoMk264SBbKo/JN8MZrLrv5SQqxMO+qQS
 QrEu1KubtMCIIt5lIAvvEAVjhra+dT4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-pCAGfxaBPFqIuLJfPNCJxA-1; Mon, 15 Nov 2021 17:43:59 -0500
X-MC-Unique: pCAGfxaBPFqIuLJfPNCJxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so239744wma.5
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D1BIOwByKcAXembpXzQc+agrkQmvvvaA+ruQqYp5t/g=;
 b=3ZCXGNjilZ476YWLxbJnOX4L7kuJGyIdFMhUN1sGxE/CQhM0AVGwr44GFG/njM2pQY
 31wrKQId2VNsHf4agBrdGJTXYQ++TpjWe3oPY+4vgIS+IzrGqFuiyUrugKIsMXWtP77C
 DljdtFuSLkPT3kAiJmBoQtc39J4TZ7EfN9YOqYSunLU0oSLmPY0/FmdyXLWsp8ZazvnS
 hfMlHLSBwrbbq1Si2Sv54uglaK2XORFe2QWKBX6gGQEgUcthJn9J5LUpTKBlob1Eg6mK
 F1YhyLW7evRpPAP5pQ3HrGtOgDljVzJOe2/+YGfOvVmY89EyzsXqi84buKRk7wvjylV5
 TsKw==
X-Gm-Message-State: AOAM533OeuyRYbNCz8Kf2gYn7SeBflk8giKQLV70JFODgpm2Uqc/QFa/
 y6jw0F+U52utefRWa5dcrNJN6DSf6Hwl3AHaSg2zcLtp3qBvDEBPB8UKWxaqto8zhGlbhbdNYGG
 EA9aSJe2X5JxaUQE=
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr62612247wmc.58.1637016238254; 
 Mon, 15 Nov 2021 14:43:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmXnJe4zLgdKHaExV8I/RgT4tk021ZXXY3sYVEie43KjyHpm80O5WHCtkYYENKpE9dL+RCDg==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr62612217wmc.58.1637016237968; 
 Mon, 15 Nov 2021 14:43:57 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 38sm7058475wrc.1.2021.11.15.14.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 14:43:57 -0800 (PST)
Message-ID: <999d5ac2-2c4f-6296-d507-5fc456342385@redhat.com>
Date: Mon, 15 Nov 2021 23:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 00/20] pci,pc,virtio: bugfixes
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211115163607.177432-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 17:37, Michael S. Tsirkin wrote:
> The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:
> 
>   Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 18416c62e36a79823a9e28f6b2260aa13c25e1d9:
> 
>   pcie: expire pending delete (2021-11-15 11:10:11 -0500)
> 
> ----------------------------------------------------------------
> pci,pc,virtio: bugfixes
> 
> pci power management fixes
> acpi hotplug fixes
> misc other fixes
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Eugenio Pérez (4):
>       vhost: Rename last_index to vq_index_end
>       vhost: Fix last vq queue index of devices with no cvq
>       vdpa: Replace qemu_open_old by qemu_open at
>       vdpa: Check for existence of opts.vhostdev
> 
> Gerd Hoffmann (6):
>       pci: implement power state
>       pcie: implement slot power control for pcie root ports
>       pcie: add power indicator blink check
>       pcie: factor out pcie_cap_slot_unplug()
>       pcie: fast unplug when slot power is off
>       pcie: expire pending delete
> 
> Igor Mammedov (2):
>       pcie: rename 'native-hotplug' to 'x-native-hotplug'
>       tests: bios-tables-test update expected blobs
> 
> Jason Wang (2):
>       virtio: use virtio accessor to access packed descriptor flags
>       virtio: use virtio accessor to access packed event
> 
> Julia Suvorova (3):
>       hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type
>       bios-tables-test: Allow changes in DSDT ACPI tables
>       hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC
> 
> Philippe Mathieu-Daudé (1):
>       hw/mem/pc-dimm: Restrict NUMA-specific code to NUMA machines
> 
> Stefan Hajnoczi (1):
>       softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
> 
> Stefano Garzarella (1):
>       net/vhost-vdpa: fix memory leak in vhost_vdpa_get_max_queue_pairs()
> 
>  include/hw/acpi/ich9.h                |   1 +
>  include/hw/pci/pci.h                  |   2 +
>  include/hw/qdev-core.h                |   1 +
>  include/hw/virtio/vhost.h             |   4 +-
>  hw/acpi/ich9.c                        |  18 ++++++++
>  hw/i386/acpi-build.c                  |  12 ++++--
>  hw/i386/pc.c                          |   2 +
>  hw/i386/pc_q35.c                      |   9 +++-
>  hw/mem/pc-dimm.c                      |  23 ++++++----
>  hw/net/vhost_net.c                    |  12 +++---
>  hw/pci/pci.c                          |  25 ++++++++++-
>  hw/pci/pci_host.c                     |   6 ++-
>  hw/pci/pcie.c                         |  79 ++++++++++++++++++++++++++++------
>  hw/pci/pcie_port.c                    |   2 +-
>  hw/virtio/vhost-vdpa.c                |   2 +-
>  hw/virtio/virtio.c                    |  24 ++++-------
>  net/vhost-vdpa.c                      |   8 +++-
>  softmmu/qdev-monitor.c                |   6 ++-

Cc'ing Alex for this apparently unrelated test failure:

make[2]: Entering directory 'build/tests/tcg/arm-linux-user'
timeout --foreground 60  tests/guest-debug/run-test.py --gdb
/usr/bin/gdb-multiarch --qemu build/qemu-arm --qargs "" --bin testthread
--test tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py >
run-gdbstub-thread-breakpoint.out
make[2]: *** [tests/tcg/multiarch/Makefile.target:71:
run-gdbstub-thread-breakpoint] Error 1
make[1]: *** [tests/tcg/Makefile.qemu:102: run-guest-tests] Error 2
make: *** [tests/Makefile.include:63: run-tcg-tests-arm-linux-user] Error 2

https://gitlab.com/qemu-project/qemu/-/jobs/1785024040#L5986


