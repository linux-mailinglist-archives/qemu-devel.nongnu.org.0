Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDF42125C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:11:57 +0200 (CEST)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPdE-000189-77
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mXPZL-0006VO-AT; Mon, 04 Oct 2021 11:07:55 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mXPZH-0003zB-AZ; Mon, 04 Oct 2021 11:07:53 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id C7E5D2E048B;
 Mon,  4 Oct 2021 18:07:41 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (2a02:6b8:c12:422d:0:640:76f0:a6db [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ZzUq4IlUzO-7ft8hW1B; Mon, 04 Oct 2021 18:07:41 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1633360061; bh=rcPnPrUDLfxmTzBb/rzMMP98p+GDQZZ9R6/68qJuNwQ=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=UaQ4O2haDXJ4zYajfZosiqiHzYPVdGGIT9+qOXXTtJZkJo6sDisFk8Xn0Vh54FVk6
 iPS/aGYKFpO/A4nmxK3LnfRFo3B11HpZjr2Dxfzx4jJLumMs6atUIBTbZKbzg/bZ82
 TKtoOOwwGxWSlNA29vCuHLmI8jW55xQpBq4C6Fhc=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from den-plotnikov-w.yandex-team.ru (2a02:6b8:b081:8009::1:11
 [2a02:6b8:b081:8009::1:11])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 AnWxZOr920-7e0aZeUU; Mon, 04 Oct 2021 18:07:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device migration
Date: Mon,  4 Oct 2021 18:07:29 +0300
Message-Id: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, mst@redhat.com, yc-core@yandex-team.ru,
 qemu-block@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It might be useful for the cases when a slow block layer should be replaced
with a more performant one on running VM without stopping, i.e. with very low
downtime comparable with the one on migration.

It's possible to achive that for two reasons:

1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
  They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
  each other in the values of migration service fields only.
2.The device driver used in the guest is the same: virtio-blk

In the series cross-migration is achieved by adding a new type.
The new type uses virtio-blk VMState instead of vhost-user-blk specific
VMstate, also it implements migration save/load callbacks to be compatible
with migration stream produced by "virtio-blk" device.

Adding the new type instead of modifying the existing one is convenent.
It ease to differ the new virtio-blk-compatible vhost-user-blk
device from the existing non-compatible one using qemu machinery without any
other modifiactions. That gives all the variety of qemu device related
constraints out of box.

0001: adds new type "vhost-user-virtio-blk"
0002: add new type "vhost-user-virtio-blk-pci"

Denis Plotnikov (2):
  vhost-user-blk: add a new vhost-user-virtio-blk type
  vhost-user-blk-pci: add new pci device type to support
    vhost-user-virtio-blk

 hw/block/vhost-user-blk.c          | 63 ++++++++++++++++++++++++++++++
 hw/virtio/vhost-user-blk-pci.c     | 43 ++++++++++++++++++--
 include/hw/virtio/vhost-user-blk.h |  2 +
 3 files changed, 105 insertions(+), 3 deletions(-)

-- 
2.25.1


