Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66842597412
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:23:43 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLpW-0003ej-HG
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgl-0007Rp-0q
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgh-0001OI-Qb
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660752874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rHZy6JiyjJLprSW/fyq/tiBs5i+JZ9iZbYF+g8tNyNc=;
 b=jJz3LWYc9fiyj2C4e9PN6Bv8BfWW6KX7mcuqzUIKTs8SH8ixWxZZaozzIzRHgdQoKoAA9p
 VMhG5PqGd7ALqc8d08tqnKXDB4HCOQJ5urWR5yBz81NCLGR/4frhB75tDk7ncQv4lej6g0
 wIGXHe9cz/D6uJDE6Rd7gMB/lXzNfP4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-JIGhYttRPrmJ6YmG3jZdkw-1; Wed, 17 Aug 2022 12:14:33 -0400
X-MC-Unique: JIGhYttRPrmJ6YmG3jZdkw-1
Received: by mail-wr1-f70.google.com with SMTP id
 x6-20020adfbb46000000b00225260970a9so550861wrg.18
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=rHZy6JiyjJLprSW/fyq/tiBs5i+JZ9iZbYF+g8tNyNc=;
 b=TaNZGaDcANRCQMkHma8w2mchqFWhzc2Ev7cUANzKKcsmbXEOQg7f2Hx5li27pHCBFN
 neKVZWENHr7J2W0bLE4vM4hjaoS1FGWROWy5Un2GeEDURwTBCcLTywCf2ml1b6AvEPeI
 KBVTIoW8aXmUUB4nBexLzfBkBiQgbIVrd8f36EvmK1kNW46uJ3ScpaPNzMj0zNsSFjDO
 3wMf+qJopn49wizvz6LZQ/Mf15+Y4BgSIfubxeumDLYGg6dZSrt4wA6naJuu9Qa9hdBn
 /Ha8Im7N4cOzRDlh4SNqwsE9brmg3nEOCo5Qwq0ZRa8yp9mjXFm9rXBjcI6WLZs3b/TS
 RQ/w==
X-Gm-Message-State: ACgBeo0E1QdUitop7v+i/14QOAtaB/ld5U+Mk2WBYDdwEQYy2OkLvDGh
 j32zQ4obNEl/ax71I3YS+x6prX8quxfLXFpqvlY1j2atpCVPmYwl5OC0Sh7JKoIU9c9Te012BBF
 1Mn72+aGmqAC9pDvtqS5AmwmNFOWI5ThvOuUORv7/HAdkwu2GvYPQBqdPT1Br
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id
 w15-20020a1cf60f000000b003a03e0c1de1mr2690420wmc.56.1660752871582; 
 Wed, 17 Aug 2022 09:14:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SCZzZC9RipQNYuSRESTyi8tx4rVSOjrRyUmFFzRyNZ4//UfgTOV0Zl5loYDwcjgjIu5DnXA==
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id
 w15-20020a1cf60f000000b003a03e0c1de1mr2690394wmc.56.1660752871172; 
 Wed, 17 Aug 2022 09:14:31 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 ba11-20020a0560001c0b00b002235eb9d200sm13920810wrb.10.2022.08.17.09.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:30 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/10] pc,virtio: fixes
Message-ID: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:

  Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 019d2530a7cf082af01280a9ad265722a15601f9:

  virtio-pci: don't touch pci on virtio reset (2022-08-17 12:11:05 -0400)

----------------------------------------------------------------
pc,virtio: fixes

Several bugfixes, they all look very safe to me. Revert
seed support since we aren't any closer to a proper fix.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Bennée (3):
      hw/virtio: gracefully handle unset vhost_dev vdev
      hw/virtio: handle un-configured shutdown in virtio-pci
      hw/virtio: fix vhost_user_read tracepoint

Gerd Hoffmann (1):
      x86: disable rng seeding via setup_data

Igor Mammedov (1):
      tests: acpi: silence applesmc warning about invalid key

Jonathan Cameron (3):
      hw/cxl: Add stub write function for RO MemoryRegionOps entries.
      hw/cxl: Fix Get LSA input payload size which should be 8 bytes.
      hw/cxl: Correctly handle variable sized mailbox input payloads.

Michael S. Tsirkin (1):
      virtio-pci: don't touch pci on virtio reset

Stefan Hajnoczi (1):
      virtio-scsi: fix race in virtio_scsi_dataplane_start()

 hw/block/dataplane/virtio-blk.c |  5 +++++
 hw/cxl/cxl-device-utils.c       | 12 +++++++++---
 hw/cxl/cxl-mailbox-utils.c      |  4 ++--
 hw/i386/microvm.c               |  2 +-
 hw/i386/pc_piix.c               |  2 +-
 hw/i386/pc_q35.c                |  2 +-
 hw/scsi/virtio-scsi-dataplane.c | 11 ++++++++---
 hw/virtio/vhost-user.c          |  4 ++--
 hw/virtio/vhost.c               | 10 +++++++---
 hw/virtio/virtio-pci.c          | 19 +++++++++++++++----
 tests/qtest/bios-tables-test.c  |  4 +++-
 11 files changed, 54 insertions(+), 21 deletions(-)


