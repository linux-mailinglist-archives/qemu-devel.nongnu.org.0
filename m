Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C21380E71
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:52:19 +0200 (CEST)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb2w-0006jy-2j
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajt-0000bG-4w
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhaje-0001Dg-CC
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQbI6KAUKk/0tYjmv7j5PaWRK0UReHBN/rNw9/XPZI8=;
 b=QWUfS/TJFeeW35DNhAqT4KWPXNIOIvHHL/Zo33B6W+G4SZ72FaHE3Gd1by1qEBlNgFhlvd
 3Kbyr0/8Qt99up3ZVPiUGXrKk65vyMskGgQQ/l5AO0mXlBpDBM74zmJ5fTTxSnyh5ux51T
 qlUn8spdvYIXA5gPOJjwJEwtZZAhCoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-2jEFc6KBOF2b1gLvq5TcgA-1; Fri, 14 May 2021 12:32:07 -0400
X-MC-Unique: 2jEFc6KBOF2b1gLvq5TcgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EB8F1A8A62;
 Fri, 14 May 2021 16:32:06 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE19D1971B;
 Fri, 14 May 2021 16:32:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/14] vhost-user-blk: Make sure to set Error on realize failure
Date: Fri, 14 May 2021 18:31:19 +0200
Message-Id: <20210514163124.251741-10-kwolf@redhat.com>
In-Reply-To: <20210514163124.251741-1-kwolf@redhat.com>
References: <20210514163124.251741-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have to set errp before jumping to virtio_err, otherwise the caller
(virtio_device_realize()) will take this as success and crash when it
later tries to access things that we've already freed in the error path.

Fixes: 77542d431491788d1e8e79d93ce10172ef207775
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210429171316.162022-2-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f5e9682703..7c85248a7b 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -447,7 +447,6 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
-    Error *err = NULL;
     int i, ret;
 
     if (!s->chardev.chr) {
@@ -495,8 +494,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
                              NULL, true);
 
 reconnect:
-    if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
-        error_report_err(err);
+    if (qemu_chr_fe_wait_connected(&s->chardev, errp) < 0) {
         goto virtio_err;
     }
 
-- 
2.30.2


