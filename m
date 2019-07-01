Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD5E4D576
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 19:54:41 +0200 (CEST)
Received: from localhost ([::1]:51932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he1Gi-0004bF-B0
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 13:54:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35287)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1he19b-0007V5-CN
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 13:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1he0yX-0003Eg-LO
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 13:35:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1he0yV-000351-2F
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 13:35:51 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA0C2308FC4A;
 Thu, 20 Jun 2019 17:35:39 +0000 (UTC)
Received: from localhost (ovpn-116-108.ams2.redhat.com [10.36.116.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8A0B608D0;
 Thu, 20 Jun 2019 17:35:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 18:35:29 +0100
Message-Id: <20190620173532.14468-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 20 Jun 2019 17:35:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 0/3] virtio-scsi: restart DMA after iothread
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v5:
 * Plumbing vm change state handlers into DeviceClass/BusClass is a rathe=
r
   large bug fix.  Instead I've combined the previous priorities approach=
 with
   the observation from Kevin and Paolo that we really want to order by q=
dev
   tree depth.

   The new qdev_add_vm_change_state_handler() API lets DeviceStates regis=
ter
   callbacks that execute in qdev tree depth order.  This solves the
   virtio-scsi bug since the virtio-scsi device's callback must complete =
before
   its child scsi-disk's callback runs.

   Is this a good compromise for everyone?

Stefan Hajnoczi (3):
  vl: add qemu_add_vm_change_state_handler_prio()
  qdev: add qdev_add_vm_change_state_handler()
  virtio-scsi: restart DMA after iothread

 hw/core/Makefile.objs             |  1 +
 include/hw/qdev-core.h            |  5 +++
 include/sysemu/sysemu.h           |  2 +
 hw/core/vm-change-state-handler.c | 61 +++++++++++++++++++++++++++++++
 hw/scsi/scsi-bus.c                |  4 +-
 hw/virtio/virtio.c                |  4 +-
 vl.c                              | 59 ++++++++++++++++++++++++------
 7 files changed, 120 insertions(+), 16 deletions(-)
 create mode 100644 hw/core/vm-change-state-handler.c

--=20
2.21.0


