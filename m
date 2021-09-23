Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F122416242
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:43:06 +0200 (CEST)
Received: from localhost ([::1]:38490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQsL-0000aF-9O
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mTQok-0006Go-Ry
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mTQoN-0001ZA-U9
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632411536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2sqzidaBz+O1jyM/n1f/c2Ezsip12S9gINsfEbFNSao=;
 b=W6YW5IcSysWa5HXTQiimaTUxPNnpDl+oQ0rqrlRMg2Di7fgVhisRFuOVTYb1s5TJe6Z5Dx
 hX3KiZmpFChRT3hi95QzhICax1QzMf93KT0tGcRBkjf2ISi98YcVjcJG6XMZbaluL5h3sK
 nkmwEro0jnlkTL+HQvFxjTuuUv6IUTc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-GwRb2AVbMo-kzR7S_fGrig-1; Thu, 23 Sep 2021 11:38:54 -0400
X-MC-Unique: GwRb2AVbMo-kzR7S_fGrig-1
Received: by mail-ed1-f71.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso7272251edi.1
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 08:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2sqzidaBz+O1jyM/n1f/c2Ezsip12S9gINsfEbFNSao=;
 b=DHEpY4JzRtjNdQqxKhTs4HZEB7CuKyt0ECQEzDbLBvbRKb58S9p/ohTkXR4qW6Qe/5
 0x3xb77pg5TO1JojHlhA0mjfQUCT/iZwQ6FnV1YaHUmsZ0B/7/qqafBeTN5xM4eCNQUk
 C55KYKWH9Lhcn1dHUpINoPu6Yqc4lfxlqKZK5hkMY/2zM/gn0Aq/7s2zGbDnojS33Ho3
 3krWM7hgBsmvNRpbCL56sKc0caZ1ntp0Lp3Vua1d+6BeuhmAlHNKvlpOfXMa1dZrSDFL
 cvFEC7G/wD2sVz/dLy5WD1anr0rQTWiq+HNrrQ4ejf44R4zhQIfx5WAYYkFZuWxLdRa+
 V9HQ==
X-Gm-Message-State: AOAM531lFSPYQdFncAUu6mWUaveKRfP8RQ4NnsZVLmPI16KLDKXAxnKx
 320M/NXFJtLrODss+TYpvil1N7seh8C6x5xWcgslcQLEMO/SPGzjHyBQ8ZlKJVmwaL/SdtruTHq
 dOMJ4SIe0RtM4f/0=
X-Received: by 2002:a17:907:20cb:: with SMTP id
 qq11mr5594985ejb.488.1632411532781; 
 Thu, 23 Sep 2021 08:38:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxVB5+HHJ47y8POn3IBKtoudORJkAbjrZYScXDlzVndfVJeX6HIm6uqb3ObbgX7hQtBydcOA==
X-Received: by 2002:a17:907:20cb:: with SMTP id
 qq11mr5594936ejb.488.1632411532449; 
 Thu, 23 Sep 2021 08:38:52 -0700 (PDT)
Received: from redhat.com ([2.55.11.56])
 by smtp.gmail.com with ESMTPSA id k15sm3161505ejb.92.2021.09.23.08.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 08:38:51 -0700 (PDT)
Date: Thu, 23 Sep 2021 11:38:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/6] Improve consistency of bus init function names
Message-ID: <20210923113832-mutt-send-email-mst@kernel.org>
References: <20210923121153.23754-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210923121153.23754-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 01:11:47PM +0100, Peter Maydell wrote:
> Currently we have a bit of a mishmash of different function
> names for bus creation. There are two basic patterns: you
> can have a function that allocates and returns a new bus
> object; or you can have a function that takes a pointer to
> a bus object and initializes it in-place. We have to some
> extent a convention for those: the allocate-and-return
> function is 'foo_new()', and the 'init in-place' function
> is 'foo_init()'. However many of our bus creation functions
> don't follow that; some use 'foo_new' vs 'foo_new_inplace';
> some use 'foo_new' for the in-place init version; and
> the bottom level qbus functions are 'qbus_create' vs
> 'qbus_create_inplace'. This series tries to bring at least
> scsi, ipack, pci, ide, and qbus into line with the
> _new-vs-_init naming convention.
> 
> The other issue with bus creation functions is that some
> of them take a 'name' argument which can be NULL, and some
> do not. Generally "pass in a specific name" should be the
> rare case, but our API design here is easy to misuse, and
> so a lot of callsites (especially for i2c, sd, ssi) pass
> in names when they should not. Untangling that mess is
> going to be tricky (see other thread for more), but as
> a first step, this series proposes a split between
> foo_bus_new() and foo_bus_new_named() where the latter
> takes a name parameter and the former does not. I do
> this only for scsi (and implicitly ide, whose ide_bus_new
> function already doesn't take a name argument) for the
> moment, as the other bus types have more of a mess of
> "pass name when they should not" callsites, so I didn't
> want to put in too much work before finding out if we
> had agreement on this as a naming convention.
> 
> There are definitely more buses that can be cleaned up
> to follow the init vs new convention, but this series is
> already touching 70 files and trying to do every bus in
> one series seems like a recipe for merge conflicts.
> So this seemed like enough to be going on with...
> 
> thanks
> -- PMM


pci:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge.

> Peter Maydell (6):
>   scsi: Replace scsi_bus_new() with scsi_bus_init(),
>     scsi_bus_init_named()
>   ipack: Rename ipack_bus_new_inplace() to ipack_bus_init()
>   pci: Rename pci_root_bus_new_inplace() to pci_root_bus_init()
>   qbus: Rename qbus_create_inplace() to qbus_init()
>   qbus: Rename qbus_create() to qbus_new()
>   ide: Rename ide_bus_new() to ide_bus_init()
> 
>  include/hw/ide/internal.h     |  4 ++--
>  include/hw/ipack/ipack.h      |  8 ++++----
>  include/hw/pci/pci.h          | 10 +++++-----
>  include/hw/qdev-core.h        |  6 +++---
>  include/hw/scsi/scsi.h        | 30 ++++++++++++++++++++++++++++--
>  hw/audio/intel-hda.c          |  2 +-
>  hw/block/fdc.c                |  2 +-
>  hw/block/swim.c               |  3 +--
>  hw/char/virtio-serial-bus.c   |  4 ++--
>  hw/core/bus.c                 | 13 +++++++------
>  hw/core/sysbus.c              | 10 ++++++----
>  hw/gpio/bcm2835_gpio.c        |  3 +--
>  hw/hyperv/vmbus.c             |  2 +-
>  hw/i2c/core.c                 |  2 +-
>  hw/ide/ahci.c                 |  2 +-
>  hw/ide/cmd646.c               |  2 +-
>  hw/ide/isa.c                  |  2 +-
>  hw/ide/macio.c                |  2 +-
>  hw/ide/microdrive.c           |  2 +-
>  hw/ide/mmio.c                 |  2 +-
>  hw/ide/piix.c                 |  2 +-
>  hw/ide/qdev.c                 |  4 ++--
>  hw/ide/sii3112.c              |  2 +-
>  hw/ide/via.c                  |  2 +-
>  hw/ipack/ipack.c              | 10 +++++-----
>  hw/ipack/tpci200.c            |  4 ++--
>  hw/isa/isa-bus.c              |  2 +-
>  hw/misc/auxbus.c              |  2 +-
>  hw/misc/mac_via.c             |  4 ++--
>  hw/misc/macio/cuda.c          |  4 ++--
>  hw/misc/macio/macio.c         |  4 ++--
>  hw/misc/macio/pmu.c           |  4 ++--
>  hw/nubus/mac-nubus-bridge.c   |  2 +-
>  hw/nvme/ctrl.c                |  4 ++--
>  hw/nvme/subsys.c              |  3 +--
>  hw/pci-host/raven.c           |  4 ++--
>  hw/pci-host/versatile.c       |  6 +++---
>  hw/pci/pci.c                  | 30 +++++++++++++++---------------
>  hw/pci/pci_bridge.c           |  4 ++--
>  hw/ppc/spapr_vio.c            |  2 +-
>  hw/s390x/ap-bridge.c          |  2 +-
>  hw/s390x/css-bridge.c         |  2 +-
>  hw/s390x/event-facility.c     |  4 ++--
>  hw/s390x/s390-pci-bus.c       |  2 +-
>  hw/s390x/virtio-ccw.c         |  3 +--
>  hw/scsi/esp-pci.c             |  2 +-
>  hw/scsi/esp.c                 |  2 +-
>  hw/scsi/lsi53c895a.c          |  2 +-
>  hw/scsi/megasas.c             |  3 +--
>  hw/scsi/mptsas.c              |  2 +-
>  hw/scsi/scsi-bus.c            |  6 +++---
>  hw/scsi/spapr_vscsi.c         |  3 +--
>  hw/scsi/virtio-scsi.c         |  4 ++--
>  hw/scsi/vmw_pvscsi.c          |  3 +--
>  hw/sd/allwinner-sdhost.c      |  4 ++--
>  hw/sd/bcm2835_sdhost.c        |  4 ++--
>  hw/sd/pl181.c                 |  3 +--
>  hw/sd/pxa2xx_mmci.c           |  4 ++--
>  hw/sd/sdhci.c                 |  3 +--
>  hw/sd/ssi-sd.c                |  3 +--
>  hw/ssi/ssi.c                  |  2 +-
>  hw/usb/bus.c                  |  2 +-
>  hw/usb/dev-smartcard-reader.c |  3 +--
>  hw/usb/dev-storage-bot.c      |  3 +--
>  hw/usb/dev-storage-classic.c  |  4 ++--
>  hw/usb/dev-uas.c              |  3 +--
>  hw/virtio/virtio-mmio.c       |  3 +--
>  hw/virtio/virtio-pci.c        |  3 +--
>  hw/xen/xen-bus.c              |  2 +-
>  hw/xen/xen-legacy-backend.c   |  2 +-
>  70 files changed, 156 insertions(+), 142 deletions(-)
> 
> -- 
> 2.20.1


