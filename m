Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DDC3BEA45
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:04:29 +0200 (CEST)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m196C-0002C6-2o
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m194m-00080K-5v
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m194k-0006VR-HF
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+iEPP4M9ior+MIHFEOM1ekdojNuqm/4Nu9pGBAaPet4=;
 b=GZ/KA4xRRC4NEKvN9hmy3E5JBjCvBsku+6384Wv7xtyL5KsQZufPB1LL7UVJUjavoc+PdS
 t/a0wnqSzQtyGBxjPNJk6SoLHn8s3whUWRQyc6nAnzD41Cqof0julxTjd7z5afE3dQIH5q
 NBbBfyxBWFBvgN57Rh3ALPfcCMWvhUU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-uDs0LZAJOg2h9R7aAQ8nLw-1; Wed, 07 Jul 2021 11:02:56 -0400
X-MC-Unique: uDs0LZAJOg2h9R7aAQ8nLw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r11-20020a5d52cb0000b02901309f5e7298so899937wrv.0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=+iEPP4M9ior+MIHFEOM1ekdojNuqm/4Nu9pGBAaPet4=;
 b=a8BRY9KSSykoD2MOVBAEbCwIst2CN8xTWZ17G7f2VSKMcnCKdJuOeLkFP3XCsVoYAK
 T6h/Eg4mItprKEW23NpEGH78HoFHqPetlNCXsTx70PNRxNFQLHvQ63nJFn5Xs50/YEiz
 1fSMK0g5YFOhHASAWKciqIfr8Pd9ivxPxwwOyIcP7+zt6O6L3yL6OuC6/XpmTZYiRogk
 6hYI6MiPniXuRmT39DQO3JMYTKGxLshBu+S67XmiWjuk/SKakfMKn1AD7Q0mtjQY8+JD
 Gy8nnvfaNNwPucTO0slFpVOM7OmZVnGNbM9nwCWo7TYabOIa62pjYfkQz3fvIhF4+LFK
 m2SQ==
X-Gm-Message-State: AOAM531A2F6FPrNmzmFR9+nAuNiHhEogllkUE3ifw0oyOxHJxpVDIiyV
 Woe1B15iyesBAXorH22eofV231hryPkRh0YJ7zeH/JzfgupkW+VOyFazkobJ9XbS3cI1WO0p5ON
 4Z1Ttrrg2Cfi9XkvmTqF0KPvO4X8uZn5CLln2fRnj8mU7p18eSycT+ENzxY7s
X-Received: by 2002:adf:f149:: with SMTP id y9mr27921887wro.85.1625670175116; 
 Wed, 07 Jul 2021 08:02:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz459ozAQDR0xxARh4WVxfJoAKrsB6ZMmdR83sa68qVjq0l/zhGM5dXFGSS07jlBdIQALFOCA==
X-Received: by 2002:adf:f149:: with SMTP id y9mr27921862wro.85.1625670174950; 
 Wed, 07 Jul 2021 08:02:54 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id h15sm19983846wrq.88.2021.07.07.08.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:02:54 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:02:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] pc,pci,virtio: bugfixes, improvements
Message-ID: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-07-02 11:46:32 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to e3e01466bff42b5ea977340d8d7d90df482b0c97:

  MAINTAINERS: Add maintainer for vhost-user RNG implementation (2021-07-07 06:11:22 -0400)

----------------------------------------------------------------
pc,pci,virtio: bugfixes, improvements

vhost-user-rng support.
Fixes all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Andrew Melnychenko (3):
      virtio-pci: Added check for virtio device presence in mm callbacks.
      virtio-pci: Added check for virtio device in PCI config cbs.
      virtio-pci: Changed return values for "notify", "device" and "isr" read.

Gerd Hoffmann (1):
      acpi/ged: fix reset cause

Greg Kurz (1):
      virtio: Clarify MR transaction optimization

Igor Mammedov (3):
      tests: acpi: prepare for changing DSDT tables
      acpi: pc: revert back to v5.2 PCI slot enumeration
      tests: acpi: pc: update expected DSDT blobs

Laurent Vivier (1):
      migration: failover: reset partially_hotplugged

Mathieu Poirier (1):
      MAINTAINERS: Add maintainer for vhost-user RNG implementation

Pavel Dovgalyuk (1):
      virtio: disable ioeventfd for record/replay

Philippe Mathieu-Daudé (1):
      hw/pci-host/q35: Ignore write of reserved PCIEXBAR LENGTH field

Vincent Bernat (1):
      docs: add slot when adding new PCIe root port

 docs/pcie_pci_bridge.txt         |   6 +++---
 hw/acpi/generic_event_device.c   |   2 +-
 hw/block/dataplane/virtio-blk.c  |  16 ++++++++++++++++
 hw/i386/acpi-build.c             |   9 +++++++--
 hw/net/virtio-net.c              |   1 +
 hw/pci-host/q35.c                |   3 +++
 hw/s390x/virtio-ccw.c            |   6 ++++++
 hw/scsi/virtio-scsi-dataplane.c  |  16 ++++++++++++++++
 hw/virtio/virtio-mmio.c          |   6 ++++++
 hw/virtio/virtio-pci.c           |  33 +++++++++++++++++++++++++++++++--
 hw/virtio/virtio.c               |  16 ++++++++++++++++
 MAINTAINERS                      |   9 +++++++++
 tests/data/acpi/pc/DSDT          | Bin 6002 -> 6002 bytes
 tests/data/acpi/pc/DSDT.acpihmat | Bin 7327 -> 7327 bytes
 tests/data/acpi/pc/DSDT.bridge   | Bin 8668 -> 8668 bytes
 tests/data/acpi/pc/DSDT.cphp     | Bin 6466 -> 6466 bytes
 tests/data/acpi/pc/DSDT.dimmpxm  | Bin 7656 -> 7656 bytes
 tests/data/acpi/pc/DSDT.hpbridge | Bin 5969 -> 5969 bytes
 tests/data/acpi/pc/DSDT.ipmikcs  | Bin 6074 -> 6074 bytes
 tests/data/acpi/pc/DSDT.memhp    | Bin 7361 -> 7361 bytes
 tests/data/acpi/pc/DSDT.nohpet   | Bin 5860 -> 5860 bytes
 tests/data/acpi/pc/DSDT.numamem  | Bin 6008 -> 6008 bytes
 22 files changed, 115 insertions(+), 8 deletions(-)


