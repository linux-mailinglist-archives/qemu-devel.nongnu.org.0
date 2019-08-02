Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE567EAEF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 06:07:09 +0200 (CEST)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htOqR-0006O5-U7
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 00:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50393)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1htOpn-0005cq-6j
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 00:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1htOpj-0001P5-34
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 00:06:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1htOpi-0001OU-UW
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 00:06:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BEF7D765A4;
 Fri,  2 Aug 2019 04:06:20 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
 (hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0F731001B12;
 Fri,  2 Aug 2019 04:06:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Date: Fri,  2 Aug 2019 00:06:00 -0400
Message-Id: <20190802040606.22573-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 02 Aug 2019 04:06:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH V5 0/6] Packed virtqueue for virtrio
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
Cc: yang.zhong@intel.com, tiwei.bie@intel.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, maxime.coquelin@redhat.com, jfreimann@redhat.com,
 weiyshay@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi:

This is an updated version of packed virtqueue support based on Wei's
V4. Tested with, virtio-blk, virito-net (with vhost_net), virtio-scsi, scp
during migration etc.

Please review.

Changes from V4:

- using SET/GET_VRING_BASE to set/get last_used_idx/wrap_counter
- fix virtqueue_pop_packed() to break virtio-scsi
- memory barriers fix
- add missing functions for packed virtqueue
- various refactoring and tweaks

Jason Wang (4):
  virtio: basic packed virtqueue support
  virtio: event suppression support for packed ring
  vhost_net: enable packed ring support
  virtio: add property to enable packed virtqueue

Wei Xu (2):
  virtio: basic structure for packed ring
  virtio: device/driverr area size calculation refactor for split ring

 hw/block/virtio-blk.c       |    2 +-
 hw/char/virtio-serial-bus.c |    2 +-
 hw/net/vhost_net.c          |    2 +
 hw/scsi/virtio-scsi.c       |    3 +-
 hw/virtio/virtio.c          | 1151 +++++++++++++++++++++++++++++++----
 include/hw/virtio/virtio.h  |   14 +-
 6 files changed, 1039 insertions(+), 135 deletions(-)

-- 
2.18.1


