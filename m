Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A3421839
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:11:19 +0200 (CEST)
Received: from localhost ([::1]:38766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUIw-0000Ik-12
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ae0464f653ef20292e335ba3de0d62ab3ce8c72c@lizzy.crudebyte.com>)
 id 1mXUG7-00060n-Ry; Mon, 04 Oct 2021 16:08:26 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:36813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ae0464f653ef20292e335ba3de0d62ab3ce8c72c@lizzy.crudebyte.com>)
 id 1mXUG6-0001MW-5e; Mon, 04 Oct 2021 16:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=f4VjqFwtddhhj6avEVv72Wovsfu0a2P1y6ipMsVQxmA=; b=IygOj
 m3X/nSIkD2nnaQX8vUWiOXXWCOtw0SeHxoPvSZECg4Yeg9rTx+lD1LdOdl9L7NXoCA++t8jqwI8WV
 vyz59+yFPJTi9Dbj4279T5Lv3uaQLRs914I4tikhhrwEriiIbPIJcNYt5bVBG6HU3jSaRdweDrUQJ
 ScW/vbDJY9QXwo6rpeVWCdoJYjuD931OoPLRhcbMVXjNvY9GES/SOpKzX2gvIcnJ9oYBElXAMjhjK
 71en4UlA3VR/XruMdBBw7aN9yvfErHlFXIHEKYkOVaq8pEe5Ccv4DceCafHRsowEbeX0giB9vz1xb
 OJTKFPQeBJqTP0lGDJOog/GlF8knQ==;
Message-Id: <ae0464f653ef20292e335ba3de0d62ab3ce8c72c.1633376313.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1633376313.git.qemu_oss@crudebyte.com>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 4 Oct 2021 21:38:12 +0200
Subject: [PATCH v2 3/3] virtio-9p-device: switch to 32k max. transfer size
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

9pfs supports the new maximum virtio queue size of 32k, so let's
switch the 9pfs virtio transport from 1k to 32k.

This will allow a maximum 'msize' option (maximum message size)
by 9p client of approximately 128M (assuming 4k page size, in
practice slightly smaller, e.g. with Linux client minus 2 pages).

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/virtio-9p-device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 9013e7df6e..cd5d95dd51 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -217,7 +217,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
 
     v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
     virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size,
-                VIRTQUEUE_LEGACY_MAX_SIZE);
+                VIRTQUEUE_MAX_SIZE);
     v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
 }
 
-- 
2.20.1


