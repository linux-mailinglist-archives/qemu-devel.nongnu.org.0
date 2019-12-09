Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E31164EE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 03:04:12 +0100 (CET)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ie8PB-0005ac-LZ
	for lists+qemu-devel@lfdr.de; Sun, 08 Dec 2019 21:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ie8M9-0004Hj-L2
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:01:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ie8Ly-00084w-Cz
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:00:52 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2277 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ie8Lw-0007ma-78
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:00:50 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7F9FA730D59746F93EC9;
 Mon,  9 Dec 2019 10:00:36 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 9 Dec 2019 10:00:30 +0800
From: <pannengyuan@huawei.com>
To: <mst@redhat.com>
Subject: [PATCH v3 0/3] virtio: fix memory leak in
 virtio-balloon/virtio-serial-bus
Date: Mon, 9 Dec 2019 10:00:07 +0800
Message-ID: <1575856810-9388-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: liyiting@huawei.com, kuhn.chenqun@huawei.com,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

This series add a new function to cleanup vqueue through a vq pointer, an=
d fix memory
leaks in virtio-balloon and virtio-serial-bus.

---
Changes v2 to v1:
- add a new function to cleanup vqueue through a vq pointer.
---
Changes v3 to v2:
- change function name from virtio_delete_queue to virtio_queue_cleanup.

Michael S. Tsirkin(1)
  virtio: add ability to delete vq through a pointer=20

Pan Nengyuan (2):
  virtio-balloon: fix memory leak while attach virtio-balloon device
  virtio-serial-bus: fix memory leak while attach virtio-serial-bus

 hw/char/virtio-serial-bus.c |  8 ++++++++
 hw/virtio/virtio-balloon.c  |  7 +++++++
 hw/virtio/virtio.c          | 16 +++++++++++-----
 include/hw/virtio/virtio.h  |  2 ++
 4 files changed, 28 insertions(+), 5 deletions(-)

--=20
2.7.2.windows.1



