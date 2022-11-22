Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888B96339FE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRE-0008G0-Sq; Tue, 22 Nov 2022 05:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQR7-0008EW-FS
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQR5-0004iv-C3
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=uP+QKV/Yt5zNXOTBY2YqoXTZ3u/gMQAuq+hCqcBUjEU=;
 b=ae2vtsa9gnjMzqOfA2O+wMCQRRuUIW+xU7/TWXKgM+Cus62YodACKJ9U784P827dO6xL8b
 svGi1gXRLCHgvOCIurzJAuAamb85YFE/i3KOfyLMGmu3KnmcjthWG3e4YElPfiZqa8Mbc+
 92YX06LiAk4xWwXZA1QuPoVmKIvTAfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-VRIfR5GmPRempoxRx98cjQ-1; Tue, 22 Nov 2022 05:23:24 -0500
X-MC-Unique: VRIfR5GmPRempoxRx98cjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c1-20020a7bc001000000b003cfe40fca79so3915229wmb.6
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uP+QKV/Yt5zNXOTBY2YqoXTZ3u/gMQAuq+hCqcBUjEU=;
 b=olYKuVe6mu5+0YL6oxyowg7PK8AhzjIdFXzY07q0ctZN0R/rXnUK2QLH9PufhXGT7J
 pQzs6AwXH8TUJ2JDzhhIkhbWJsIIwL+0taimMVdtPEoCOxkuN2axzjpx2qJq1FyrrzRI
 a3426O9P5daIhD7jCohawEpmifmaP9D2EKUmujPolOyKNCnfo8c7kUTenMrHBYB7jaZ/
 27sdnwhYqeeLw2fl8Zj+YYmExbiXnbo3gAfHlJvz7hfQXNgACOIZAhlTvO2JTSTsWJu7
 /PGKIeXq1YtXUJdXONwSFl874bgr1IXh/fX3WtjQRj94kgZejRArzUAt960Bni0M59J7
 nkvw==
X-Gm-Message-State: ANoB5pknupKIhZ9LSak7TW/ejFSRXXoK8vFwYtvOJWhQuISkkNLngSZb
 pXWlbamy9oOeCAnSKMMogfSWgiV4QU38x1UQrpzXSordIkfUwSWZERKg2pmrI/dzvg1FlBp8HFn
 gvU5OoHQuaRhwwIZINpdt+U5xQwDBut5bnZgD7JUgwZGP//ldsTtEMhLjrHjh
X-Received: by 2002:a05:600c:4fd6:b0:3cf:d952:db2b with SMTP id
 o22-20020a05600c4fd600b003cfd952db2bmr18512376wmq.19.1669112603409; 
 Tue, 22 Nov 2022 02:23:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4IEAfHLV0mCegS9GMgMBwV8QFcP+Lm19ecJ1tZ9HlOH7zTIt67OidhfjNbQS1WwdQsOi+nYg==
X-Received: by 2002:a05:600c:4fd6:b0:3cf:d952:db2b with SMTP id
 o22-20020a05600c4fd600b003cfd952db2bmr18512358wmq.19.1669112603035; 
 Tue, 22 Nov 2022 02:23:23 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003c6f3f6675bsm23325039wmq.26.2022.11.22.02.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:22 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/8] pc,virtio: regression, test fixes
Message-ID: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 2c8311241d1f7377bb4ff76064b1d1fe15166413:

  Update VERSION for v7.2.0-rc1 (2022-11-15 18:56:38 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to b7c61789e653086618d1825858a97b3d9891e822:

  virtio: disable error for out of spec queue-enable (2022-11-22 05:19:00 -0500)

----------------------------------------------------------------
pc,virtio: regression, test fixes

fixes regressions:
    virtio error message triggered by seabios
    failure in vhost due to VIRTIO_F_RING_RESET
    broken keyboard under seabios

some biosbits test fixes

there's still a known regression with migration and vsock,
not fixed yet.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Ani Sinha (2):
      MAINTAINERS: add mst to list of biosbits maintainers
      acpi/tests/avocado/bits: keep the work directory when BITS_DEBUG is set in env

Igor Mammedov (3):
      tests: acpi: whitelist DSDT before moving PRQx to _SB scope
      acpi: x86: move RPQx field back to _SB scope
      tests: acpi: x86: update expected DSDT after moving PRQx fields in _SB scope

John Snow (1):
      tests/avocado: configure acpi-bits to use avocado timeout

Michael S. Tsirkin (1):
      virtio: disable error for out of spec queue-enable

Stefano Garzarella (1):
      vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user devices

 hw/block/vhost-user-blk.c                     |   1 +
 hw/isa/lpc_ich9.c                             |  16 ++++------------
 hw/isa/piix3.c                                |  12 ++++--------
 hw/net/vhost_net.c                            |   1 +
 hw/scsi/vhost-scsi.c                          |   1 +
 hw/scsi/vhost-user-scsi.c                     |   1 +
 hw/virtio/vhost-user-fs.c                     |   1 +
 hw/virtio/vhost-user-gpio.c                   |   1 +
 hw/virtio/vhost-user-i2c.c                    |   1 +
 hw/virtio/vhost-user-rng.c                    |  11 +++++++++--
 hw/virtio/vhost-vsock-common.c                |   1 +
 hw/virtio/virtio.c                            |   7 +++++++
 net/vhost-vdpa.c                              |   1 +
 MAINTAINERS                                   |   1 +
 tests/avocado/acpi-bits.py                    |  23 +++++++++++------------
 tests/data/acpi/pc/DSDT                       | Bin 6501 -> 6458 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6461 -> 6418 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7826 -> 7783 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 9575 -> 9532 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6965 -> 6922 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8155 -> 8112 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6461 -> 6418 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3107 -> 3064 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6573 -> 6530 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7860 -> 7817 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6359 -> 6316 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6507 -> 6464 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 6699 -> 6656 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8412 -> 8310 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8429 -> 8327 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9737 -> 9635 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8691 -> 8589 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8458 -> 8356 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11541 -> 11439 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32552 -> 32450 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8876 -> 8774 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9738 -> 9636 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 10066 -> 9964 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8487 -> 8385 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8500 -> 8398 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8429 -> 8327 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9771 -> 9669 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9542 -> 9440 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 8732 -> 8630 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8270 -> 8168 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8418 -> 8316 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8513 -> 8411 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 9018 -> 8916 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 9044 -> 8942 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9521 -> 9419 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35775 -> 35673 bytes
 51 files changed, 45 insertions(+), 34 deletions(-)


