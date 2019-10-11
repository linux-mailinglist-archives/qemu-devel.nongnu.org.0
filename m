Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5CD3BBC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 10:58:09 +0200 (CEST)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqkS-0004JJ-NP
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 04:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iIqik-0002Xc-5c
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iIqij-0007hm-1L
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iIqii-0007hg-S5
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:56:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2728B18C4265
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 08:56:19 +0000 (UTC)
Received: from localhost (unknown [10.36.118.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57DA260BE1;
 Fri, 11 Oct 2019 08:56:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] libqos: add VIRTIO PCI 1.0 support
Date: Fri, 11 Oct 2019 09:56:04 +0100
Message-Id: <20191011085611.4194-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 11 Oct 2019 08:56:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
 * Fix checkpatch.pl issues, except MAINTAINERS file warning.  libqos alr=
eady
   has maintainers and the new virtio-pci-modern.[ch] files don't need ex=
tra
   entries since they are already covered by the existing libqos/ entry.

New VIRTIO devices are Non-Transitional.  This means they only expose the
VIRTIO 1.0 PCI register interface.

The libqos virtio-pci.c code only supports Legacy and Transitional device=
s (in
Legacy mode).  This patch series add VIRTIO PCI 1.0 support so that tests=
 can
run against Non-Transitional devices too.

Note that this does not actually add VIRTIO 1.0 support to our tests.  Th=
at
would require extending feature negotiation (VIRTIO_F_VERSION_1).  I will=
 look
at this as a separate step but the most pressing issue is getting libqos =
to
work with Non-Transitional virtio-pci devices.

Stefan Hajnoczi (7):
  libqos: extract Legacy virtio-pci.c code
  libqos: add iteration support to qpci_find_capability()
  libqos: pass full QVirtQueue to set_queue_address()
  libqos: add MSI-X callbacks to QVirtioPCIDevice
  libqos: expose common virtqueue setup/cleanup functions
  libqos: make the virtio-pci BAR index configurable
  libqos: add VIRTIO PCI 1.0 support

 tests/Makefile.include           |   1 +
 tests/libqos/pci.h               |   2 +-
 tests/libqos/virtio-pci-modern.h |  17 ++
 tests/libqos/virtio-pci.h        |  34 ++-
 tests/libqos/virtio.h            |   2 +-
 tests/libqos/pci.c               |  18 +-
 tests/libqos/virtio-mmio.c       |   6 +-
 tests/libqos/virtio-pci-modern.c | 412 +++++++++++++++++++++++++++++++
 tests/libqos/virtio-pci.c        |  92 ++++---
 9 files changed, 537 insertions(+), 47 deletions(-)
 create mode 100644 tests/libqos/virtio-pci-modern.h
 create mode 100644 tests/libqos/virtio-pci-modern.c

--=20
2.21.0


