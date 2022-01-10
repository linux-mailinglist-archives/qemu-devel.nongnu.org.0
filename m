Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AA48A1D1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:22:51 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n727s-0006lY-NP
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:22:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7250-000457-UZ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:19:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n724z-0006YV-Aw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3QMWKfnkWCQcrKUmrnLFZ5FlumGhxjFXzkw8X8GRwsY=;
 b=KjONmJ3pE09WEUhoYns9MYg1yu74IKsbeUPYkbXQZt0skYVFgcBZFZboKkTcG+Yn6kWRwy
 mLj8kmZz2/9e14/Jyjjqc4t8l59bK/oE7PGGKjL/9kaabieWISxFrQJOzWn5pH3gWUBD8y
 GTokWedpfPRTCwvza7uNpxfnEnriXh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-jGav_OYTNSusSsuyVRhQMg-1; Mon, 10 Jan 2022 16:19:45 -0500
X-MC-Unique: jGav_OYTNSusSsuyVRhQMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A24D2F25;
 Mon, 10 Jan 2022 21:19:44 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84D8145D62;
 Mon, 10 Jan 2022 21:19:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
Subject: [PATCH 0/6] qtests/libqos: Introduce pci-arm
Date: Mon, 10 Jan 2022 22:19:09 +0100
Message-Id: <20220110211915.2749082-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up to now the virt-machine node only contains a virtio-mmio
driver node but no driver that eventually produces any pci-bus
interface.

Hence, PCI libqos tests cannot be run with aarch64 binary.

This series brings the pieces needed to be able to run PCI tests
with the aarch64 binary: a generic-pcihost driver node gets
instantiated by the machine. This later contains a pci-bus-arm
driver which produces a pci-bus interface. Then all tests
consuming the pci-bus interface can be run with the libqos arm
virt machine.

One of the first goal was to be able to run the virtio-iommu-pci
tests as the virtio-iommu was initially targetting ARM and it
was awkard to be run the test with the pc machine. This is now
possible.

Only the tests doing hotplug cannot be run yet as hotplug is
not possible on the root bus. This will be dealt with separately
by adding a root port to the object tree.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/libqos-pci-arm-v1

Eric Auger (6):
  tests/qtest/vhost-user-test.c: Use vhostforce=on
  tests/qtest/libqos/pci: Introduce pio_limit
  tests/qtest/libqos: Skip hotplug tests if pci root bus is not
    hotpluggable
  tests/qtest/vhost-user-blk-test: Setup MSIx to avoid error on aarch64
  tests/qtest/vhost-user-blk-test: Factorize vq setup code
  tests/qtest/libqos: Add pci-arm and add a pci-arm producer in arm-virt
    machine

 tests/qtest/e1000e-test.c             |   6 +
 tests/qtest/libqos/arm-virt-machine.c |  47 +++++-
 tests/qtest/libqos/meson.build        |   3 +
 tests/qtest/libqos/pci-arm.c          | 219 ++++++++++++++++++++++++++
 tests/qtest/libqos/pci-arm.h          |  56 +++++++
 tests/qtest/libqos/pci-pc.c           |   1 +
 tests/qtest/libqos/pci-spapr.c        |   1 +
 tests/qtest/libqos/pci.c              |  78 +++++----
 tests/qtest/libqos/pci.h              |   7 +-
 tests/qtest/libqos/qgraph.c           |   7 +
 tests/qtest/libqos/qgraph.h           |  15 ++
 tests/qtest/vhost-user-blk-test.c     |  39 ++++-
 tests/qtest/vhost-user-test.c         |   2 +-
 tests/qtest/virtio-blk-test.c         |   5 +
 tests/qtest/virtio-net-test.c         |   5 +
 tests/qtest/virtio-rng-test.c         |   5 +
 16 files changed, 452 insertions(+), 44 deletions(-)
 create mode 100644 tests/qtest/libqos/pci-arm.c
 create mode 100644 tests/qtest/libqos/pci-arm.h

-- 
2.26.3


