Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC632F106
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:21:05 +0100 (CET)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE8O-0003ZE-NZ
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkV-0007Gk-1w
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007E3-8T
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASTXwOoSK2vmVQ6Qp8CpuGdM9iYJo3SffHQD/ybxTDs=;
 b=EblZuG02siKAmetXG5Eo5TS0RMovGwcYzXN6UHcUQaS0Uh7UyC/jGMmCCrVALb2r4kTisi
 qen6QdGu8nG7xUJbAT4npAXqaraVKpkEXqcOB2AxMvru0PLFQRBjrc8kwuXNFx85y4mZDL
 hyXBlu1BJq96tqqwZ0e1s55v0dKqvsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-qWrBzzb4PTmTOStoDgHpiA-1; Fri, 05 Mar 2021 11:55:54 -0500
X-MC-Unique: qWrBzzb4PTmTOStoDgHpiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4419710A2C68;
 Fri,  5 Mar 2021 16:55:39 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 388E860C43;
 Fri,  5 Mar 2021 16:55:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/31] block/export: port virtio-blk read/write range check
Date: Fri,  5 Mar 2021 17:54:46 +0100
Message-Id: <20210305165454.356840-24-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Check that the sector number and byte count are valid.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210223144653.811468-13-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 04044228d4..cb5d896b7b 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -209,6 +209,8 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
     switch (type & ~VIRTIO_BLK_T_BARRIER) {
     case VIRTIO_BLK_T_IN:
     case VIRTIO_BLK_T_OUT: {
+        QEMUIOVector qiov;
+        int64_t offset;
         ssize_t ret = 0;
         bool is_write = type & VIRTIO_BLK_T_OUT;
         req->sector_num = le64_to_cpu(req->out.sector);
@@ -218,13 +220,24 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
             break;
         }
 
-        int64_t offset = req->sector_num << VIRTIO_BLK_SECTOR_BITS;
-        QEMUIOVector qiov;
         if (is_write) {
             qemu_iovec_init_external(&qiov, out_iov, out_num);
-            ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
         } else {
             qemu_iovec_init_external(&qiov, in_iov, in_num);
+        }
+
+        if (unlikely(!vu_blk_sect_range_ok(vexp,
+                                           req->sector_num,
+                                           qiov.size))) {
+            req->in->status = VIRTIO_BLK_S_IOERR;
+            break;
+        }
+
+        offset = req->sector_num << VIRTIO_BLK_SECTOR_BITS;
+
+        if (is_write) {
+            ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
+        } else {
             ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
         }
         if (ret >= 0) {
-- 
2.29.2


