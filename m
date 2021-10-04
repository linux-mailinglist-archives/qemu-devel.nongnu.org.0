Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B4421842
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:13:49 +0200 (CEST)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXULM-0003uC-NM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ae0464f653ef20292e335ba3de0d62ab3ce8c72c@lizzy.crudebyte.com>)
 id 1mXUFz-0005fe-Oa; Mon, 04 Oct 2021 16:08:15 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ae0464f653ef20292e335ba3de0d62ab3ce8c72c@lizzy.crudebyte.com>)
 id 1mXUFx-00019T-8v; Mon, 04 Oct 2021 16:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=WLafEToa0pRZAOaZ33ttmtTNXix/ukq0+Ud6g4Kwog8=; b=Y8g39
 FcwlCG0LAADLEUoQanvWxbFJ7uPsVT9VHZiIf3kTyVgYkbJOS+vBuJKg1o6HQOpfzTYIqaY90/f7E
 1ELsGqE8AD9LJmE/p6k6lyTNHzF0mOhT8Dsvjp9tSGJiQcNfTbGU2GO6EwJrcpZUD8oMhsI3BNPTm
 HAXHWZ7q2IJvT7mk8R5WJWdrcvqoMjE4cdPAarE+Hg9hnvpU5KkxM8Khs+UDa91Qrn07JkLogqjFe
 FwPiBBHzFwcJllzK/g3DkkvVhZMGh6oCf0GQXHt9llvPdrvQiTzgX89NwcSif4qr7g6p+2OJLRjtx
 uFajbQQGhLGu4eeyzvJ6H2KQxhTNQ==;
Message-Id: <cover.1633376313.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 4 Oct 2021 21:38:00 +0200
Subject: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
    Greg Kurz <groug@kaod.org>,
    Raphael Norwitz <raphael.norwitz@nutanix.com>,
    Kevin Wolf <kwolf@redhat.com>,
    Hanna Reitz <hreitz@redhat.com>,
    Stefan Hajnoczi <stefanha@redhat.com>,
    Laurent Vivier <lvivier@redhat.com>,
    Amit Shah <amit@kernel.org>,
    "Marc-André Lureau" <marcandre.lureau@redhat.com>,
    Paolo Bonzini <pbonzini@redhat.com>,
    Gerd Hoffmann <kraxel@redhat.com>,
    Jason Wang <jasowang@redhat.com>,
    Fam Zheng <fam@euphon.net>,
    "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
    David Hildenbrand <david@redhat.com>,
    "Gonglei (Arei)" <arei.gonglei@huawei.com>,
    Eric Auger <eric.auger@redhat.com>,
    qemu-block@nongnu.org,
    virtio-fs@redhat.com
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=ae0464f653ef20292e335ba3de0d62ab3ce8c72c@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment the maximum transfer size with virtio is limited to 4M
(1024 * PAGE_SIZE). This series raises this limit to its maximum
theoretical possible transfer size of 128M (32k pages) according to the
virtio specs:

https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006

Maintainers: if you don't care about allowing users to go beyond 4M then no
action is required on your side for now. This series preserves the old value
of 1k for now by using VIRTQUEUE_LEGACY_MAX_SIZE on your end.

If you do want to support 128M however, then replace
VIRTQUEUE_LEGACY_MAX_SIZE by VIRTQUEUE_MAX_SIZE on your end (see patch 3 as
example for 9pfs being the first virtio user supporting it) and make sure
that this new transfer size limit is actually supported by you.

Changes v1 -> v2:

  * Instead of simply raising VIRTQUEUE_MAX_SIZE to 32k for all virtio
    users, preserve the old value of 1k for all virtio users unless they
    explicitly opted in:
    https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00056.html

Christian Schoenebeck (3):
  virtio: turn VIRTQUEUE_MAX_SIZE into a variable
  virtio: increase VIRTQUEUE_MAX_SIZE to 32k
  virtio-9p-device: switch to 32k max. transfer size

 hw/9pfs/virtio-9p-device.c     |  3 ++-
 hw/block/vhost-user-blk.c      |  6 +++---
 hw/block/virtio-blk.c          |  7 ++++---
 hw/char/virtio-serial-bus.c    |  2 +-
 hw/display/virtio-gpu-base.c   |  2 +-
 hw/input/virtio-input.c        |  2 +-
 hw/net/virtio-net.c            | 25 ++++++++++++------------
 hw/scsi/virtio-scsi.c          |  2 +-
 hw/virtio/vhost-user-fs.c      |  6 +++---
 hw/virtio/vhost-user-i2c.c     |  3 ++-
 hw/virtio/vhost-vsock-common.c |  2 +-
 hw/virtio/virtio-balloon.c     |  4 ++--
 hw/virtio/virtio-crypto.c      |  3 ++-
 hw/virtio/virtio-iommu.c       |  2 +-
 hw/virtio/virtio-mem.c         |  2 +-
 hw/virtio/virtio-mmio.c        |  4 ++--
 hw/virtio/virtio-pmem.c        |  2 +-
 hw/virtio/virtio-rng.c         |  3 ++-
 hw/virtio/virtio.c             | 35 +++++++++++++++++++++++-----------
 include/hw/virtio/virtio.h     | 25 ++++++++++++++++++++++--
 20 files changed, 90 insertions(+), 50 deletions(-)

-- 
2.20.1


