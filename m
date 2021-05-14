Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E900380EAD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:15:10 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbP3-0003Lr-6g
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajo-0000XO-Lb
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajd-0001GV-RK
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOyl+oU2+E2Q6YAituX/xjJU5GwA/LaY2Vm2j0SxhpM=;
 b=dfgAzIATQBkdcWvHIMsFwcWiwO158Wa0poGfMHvlxUwvpkO7oKZshsyU09YPehzytXokFg
 fHV02W4Fw2q4JmeycO1EvwMKgF1/sXUOPIkTCROJfAqeToFqHYdH5/pPDjcC7hrsDCGEaA
 Ib4aQvPG4sv/bP/7dHyMfPSZahw22XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-_ps2l8ISPNeM2_6GWQtFeQ-1; Fri, 14 May 2021 12:32:06 -0400
X-MC-Unique: _ps2l8ISPNeM2_6GWQtFeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69002801817;
 Fri, 14 May 2021 16:32:05 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7386E1971B;
 Fri, 14 May 2021 16:32:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/14] vhost-user-blk-test: test discard/write zeroes invalid
 inputs
Date: Fri, 14 May 2021 18:31:18 +0200
Message-Id: <20210514163124.251741-9-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Exercise input validation code paths in
block/export/vhost-user-blk-server.c.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210309094106.196911-5-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210322092327.150720-4-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 124 ++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index d37e1c30bd..8796c74ca4 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -94,6 +94,124 @@ static uint64_t virtio_blk_request(QGuestAllocator *alloc, QVirtioDevice *d,
     return addr;
 }
 
+static void test_invalid_discard_write_zeroes(QVirtioDevice *dev,
+                                              QGuestAllocator *alloc,
+                                              QTestState *qts,
+                                              QVirtQueue *vq,
+                                              uint32_t type)
+{
+    QVirtioBlkReq req;
+    struct virtio_blk_discard_write_zeroes dwz_hdr;
+    struct virtio_blk_discard_write_zeroes dwz_hdr2[2];
+    uint64_t req_addr;
+    uint32_t free_head;
+    uint8_t status;
+
+    /* More than one dwz is not supported */
+    req.type = type;
+    req.data = (char *) dwz_hdr2;
+    dwz_hdr2[0].sector = 0;
+    dwz_hdr2[0].num_sectors = 1;
+    dwz_hdr2[0].flags = 0;
+    dwz_hdr2[1].sector = 1;
+    dwz_hdr2[1].num_sectors = 1;
+    dwz_hdr2[1].flags = 0;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr2[0]);
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr2[1]);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr2));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr2), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr2), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr2));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_UNSUPP);
+
+    guest_free(alloc, req_addr);
+
+    /* num_sectors must be less than config->max_write_zeroes_sectors */
+    req.type = type;
+    req.data = (char *) &dwz_hdr;
+    dwz_hdr.sector = 0;
+    dwz_hdr.num_sectors = 0xffffffff;
+    dwz_hdr.flags = 0;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_IOERR);
+
+    guest_free(alloc, req_addr);
+
+    /* sector must be less than the device capacity */
+    req.type = type;
+    req.data = (char *) &dwz_hdr;
+    dwz_hdr.sector = TEST_IMAGE_SIZE / 512 + 1;
+    dwz_hdr.num_sectors = 1;
+    dwz_hdr.flags = 0;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_IOERR);
+
+    guest_free(alloc, req_addr);
+
+    /* reserved flag bits must be zero */
+    req.type = type;
+    req.data = (char *) &dwz_hdr;
+    dwz_hdr.sector = 0;
+    dwz_hdr.num_sectors = 1;
+    dwz_hdr.flags = ~VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP;
+
+    virtio_blk_fix_dwz_hdr(dev, &dwz_hdr);
+
+    req_addr = virtio_blk_request(alloc, dev, &req, sizeof(dwz_hdr));
+
+    free_head = qvirtqueue_add(qts, vq, req_addr, 16, false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16, sizeof(dwz_hdr), false, true);
+    qvirtqueue_add(qts, vq, req_addr + 16 + sizeof(dwz_hdr), 1, true,
+                   false);
+
+    qvirtqueue_kick(qts, dev, vq, free_head);
+
+    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
+                           QVIRTIO_BLK_TIMEOUT_US);
+    status = readb(req_addr + 16 + sizeof(dwz_hdr));
+    g_assert_cmpint(status, ==, VIRTIO_BLK_S_UNSUPP);
+
+    guest_free(alloc, req_addr);
+}
+
 /* Returns the request virtqueue so the caller can perform further tests */
 static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
 {
@@ -235,6 +353,9 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
         g_free(data);
 
         guest_free(alloc, req_addr);
+
+        test_invalid_discard_write_zeroes(dev, alloc, qts, vq,
+                                          VIRTIO_BLK_T_WRITE_ZEROES);
     }
 
     if (features & (1u << VIRTIO_BLK_F_DISCARD)) {
@@ -263,6 +384,9 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
         g_assert_cmpint(status, ==, 0);
 
         guest_free(alloc, req_addr);
+
+        test_invalid_discard_write_zeroes(dev, alloc, qts, vq,
+                                          VIRTIO_BLK_T_DISCARD);
     }
 
     if (features & (1u << VIRTIO_F_ANY_LAYOUT)) {
-- 
2.30.2


