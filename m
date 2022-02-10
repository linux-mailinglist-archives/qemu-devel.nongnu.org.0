Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F94B1410
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:22:34 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nID9L-0004NX-Se
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAon-0005Lx-E0
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAok-00045n-Do
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644504785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XOBEna7q0W/WICacVZU1qWUly099NYJkELLQh9WsRHU=;
 b=R09idk8CF4mYd16iyvr7AIlf1KSRUFqL6I1urcF3Wdx2QEGHwNXR4NTf0VXGddnh86R9En
 idfu5gNy3Lca5GF5saOtliAd94g3CdrHuidPQUs6kW1NFKOdGVLzzDkpJrhhVswPCv/SxN
 G8ltikatlTsVT1E0QvX0Nac/pj4HbFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-HRWd44hqMsOXfMQf0F0QIg-1; Thu, 10 Feb 2022 09:53:02 -0500
X-MC-Unique: HRWd44hqMsOXfMQf0F0QIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C6F21091DA5;
 Thu, 10 Feb 2022 14:53:01 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A72772FA5;
 Thu, 10 Feb 2022 14:52:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v3 0/5] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Date: Thu, 10 Feb 2022 15:52:49 +0100
Message-Id: <20220210145254.157790-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up to now the virt-machine node only contains a virtio-mmio
driver node but no driver that eventually produces any pci-bus
interface.

Hence, PCI libqos tests cannot be run with aarch64 binary.

This series brings the pieces needed to be able to run PCI tests
with the aarch64 binary: a generic-pcihost driver node gets
instantiated by the machine. This later contains a pci-bus-generic
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

Also I have some trouble with 2 of the vhost-user-blk-tests. I am
obliged to hack them in "tests/qtest/vhost-user-blk-test: Temporary
hack to get tests passing on aarch64". Looks like a memory
allocation issue, which at first sight seems unrelated to the
aarch64 pci libqos enablement but we are never sure. Calling for
help on this issue, if some vhost-user specialists can dedicate
some cycles on this. Otherwise I will try my best to further debug.

To reproduce the issue, revert the above hack and run

QTEST_QEMU_STORAGE_DAEMON_BINARY=build/storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=build/aarch64-softmmu/qemu-system-aarch64 build/tests/qtest/qos-test

you should get:

    ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
    assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
    Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
    assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/libqos-pci-arm-v3

History

v2 -> v3:
- force -cpu=max along with aarch64/virt
- reduced the vhost-user-block-pci issue workaround to a
  single guest_alloc() instead of enabling MSIs. Call for
  help on this specific issue. The 2 tests which fail otherwise
  are: test_basic and indirect.

v1 -> v2:
- copyright updated to 2022
- QPCIBusARM renamed into QGenericPCIBus
- QGenericPCIHost declarations and definitions moved in the same
  place as the generic pci implementation
- rename pci-arm.c/h in generic-pcihost.c/h and remove any ref to
  ARM there
- remove qos_node_produces_opts, qpci_new_arm, qpci_free_arm
- ecam_alloc_ptr now is a field of QGenericPCIBus and not QPCIBus
- new libqos_init to create generic-pcihost driver that contains
  pci-bus-generic
- QGenericPCIHost moved in the same place as the generic pci
  bindings
- collected Thomas A-b/R-b

Eric Auger (5):
  tests/qtest/vhost-user-test.c: Use vhostforce=on
  tests/qtest/libqos/pci: Introduce pio_limit
  tests/qtest/libqos: Skip hotplug tests if pci root bus is not
    hotpluggable
  tests/qtest/vhost-user-blk-test: Temporary hack to get tests passing
    on aarch64
  tests/qtest/libqos: Add generic pci host bridge in arm-virt machine

 tests/qtest/e1000e-test.c             |   6 +
 tests/qtest/libqos/arm-virt-machine.c |  19 ++-
 tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
 tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
 tests/qtest/libqos/meson.build        |   1 +
 tests/qtest/libqos/pci-pc.c           |   1 +
 tests/qtest/libqos/pci-spapr.c        |   1 +
 tests/qtest/libqos/pci.c              |  78 +++++----
 tests/qtest/libqos/pci.h              |   6 +-
 tests/qtest/vhost-user-blk-test.c     |  16 ++
 tests/qtest/vhost-user-test.c         |   2 +-
 tests/qtest/virtio-blk-test.c         |   5 +
 tests/qtest/virtio-net-test.c         |   5 +
 tests/qtest/virtio-rng-test.c         |   5 +
 14 files changed, 394 insertions(+), 36 deletions(-)
 create mode 100644 tests/qtest/libqos/generic-pcihost.c
 create mode 100644 tests/qtest/libqos/generic-pcihost.h

-- 
2.26.3


