Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169968ED89
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 12:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPiMp-0005pO-JT; Wed, 08 Feb 2023 06:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pPiMm-0005nE-1U
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:11:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pPiMk-0001fv-3h
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675854711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NWolw0fcXM8wivpaZz9+zd+TJnWwIr1pskJ88R2CYj8=;
 b=PGRVjTweLSlLRBbYW8qTHZIwfAPJc08xyPUpBOfYuWAcM6Re2LBiUJATQLLscxgHpCWUty
 NGBOcQyMqU91rmL4FfWlqaANGO6ARReM7b6OYWDych30xP1O0Madvy4dBUV/m/MusrBeOF
 jjpnsTG6fX7B5bEpFvN17zoEEJ5J+uI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-O2esOAj7MQ63m512qN31Bw-1; Wed, 08 Feb 2023 06:11:50 -0500
X-MC-Unique: O2esOAj7MQ63m512qN31Bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BED83804500;
 Wed,  8 Feb 2023 11:11:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 149731121314;
 Wed,  8 Feb 2023 11:11:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH] virtio-blk: add missing AioContext lock
Date: Wed,  8 Feb 2023 06:11:48 -0500
Message-Id: <20230208111148.1040083-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

virtio_blk_update_config() calls blk_get_geometry and blk_getlength,
and both functions eventually end up calling bdrv_poll_co when not
running in a coroutine:
- blk_getlength is a co_wrapper_mixed function
- blk_get_geometry calls bdrv_get_geometry -> bdrv_nb_sectors, a
  co_wrapper_mixed function too

Since we are not running in a coroutine, we need to take s->blk
AioContext lock, otherwise bdrv_poll_co will inevitably call
AIO_WAIT_WHILE and therefore try to un unlock() an AioContext lock
that was never acquired.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2167838

Steps to reproduce the issue: simply boot a VM with
-object '{"qom-type":"iothread","id":"iothread1"}' \
-blockdev '{"driver":"file","filename":"$QCOW2","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"qcow2","file":"libvirt-1-storage"}' \
-device virtio-blk-pci,iothread=iothread1,drive=libvirt-1-format,id=virtio-disk0,bootindex=1,write-cache=on

and observe that it will fail not manage to boot with "qemu_mutex_unlock_impl: Operation not permitted"

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/virtio-blk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 1762517878..cefca93b31 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -894,6 +894,10 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     uint64_t capacity;
     int64_t length;
     int blk_size = conf->logical_block_size;
+    AioContext *ctx;
+
+    ctx = blk_get_aio_context(s->blk);
+    aio_context_acquire(ctx);
 
     blk_get_geometry(s->blk, &capacity);
     memset(&blkcfg, 0, sizeof(blkcfg));
@@ -917,6 +921,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
      * per track (cylinder).
      */
     length = blk_getlength(s->blk);
+    aio_context_release(ctx);
     if (length > 0 && length / conf->heads / conf->secs % blk_size) {
         blkcfg.geometry.sectors = conf->secs & ~s->sector_mask;
     } else {
-- 
2.39.1


