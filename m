Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DCC380E98
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:07:22 +0200 (CEST)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbHV-0002DK-Q5
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhaje-0000Jy-3d
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajP-0001CP-R1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90aBT2jDoN9mmu6zxbgbCE4NmqBK8YGxv7mwI6LYpuU=;
 b=iVLUezmzb6OiWo94RjGwGrp2gd8gHM42dnELf9hXFH5h6OWnPT+yA7flUsUr7Y8iGw0A16
 XdhARzRXWLO7vED6VdOjcxGqqZbLnxYK4NajVZdpAR2gHkN1qP0AqhJe22CIxEMn2XZShx
 MIHEUCUoptl8bzwHXBtKcDb4NiHy634=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-1iJy8tf5M0ueU3rqhxYEeA-1; Fri, 14 May 2021 12:32:02 -0400
X-MC-Unique: 1iJy8tf5M0ueU3rqhxYEeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65D68800D55;
 Fri, 14 May 2021 16:32:01 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 743001971B;
 Fri, 14 May 2021 16:32:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/14] block/export: improve vu_blk_sect_range_ok()
Date: Fri, 14 May 2021 18:31:15 +0200
Message-Id: <20210514163124.251741-6-kwolf@redhat.com>
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

From: Stefan Hajnoczi <stefanha@redhat.com>

The checks in vu_blk_sect_range_ok() assume VIRTIO_BLK_SECTOR_SIZE is
equal to BDRV_SECTOR_SIZE. This is true, but let's add a
QEMU_BUILD_BUG_ON() to make it explicit.

We might as well check that the request buffer size is a multiple of
VIRTIO_BLK_SECTOR_SIZE while we're at it.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210331142727.391465-1-stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index fa06996d37..1862563336 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -70,9 +70,16 @@ static void vu_blk_req_complete(VuBlkReq *req)
 static bool vu_blk_sect_range_ok(VuBlkExport *vexp, uint64_t sector,
                                  size_t size)
 {
-    uint64_t nb_sectors = size >> BDRV_SECTOR_BITS;
+    uint64_t nb_sectors;
     uint64_t total_sectors;
 
+    if (size % VIRTIO_BLK_SECTOR_SIZE) {
+        return false;
+    }
+
+    nb_sectors = size >> VIRTIO_BLK_SECTOR_BITS;
+
+    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != VIRTIO_BLK_SECTOR_SIZE);
     if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
         return false;
     }
-- 
2.30.2


