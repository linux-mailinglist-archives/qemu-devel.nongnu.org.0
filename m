Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40D94E3DE7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:58:55 +0100 (CET)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdA6-00055Z-RN
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:58:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8E-00028K-5U
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:56:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8C-0006NY-F9
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4TT4bbocb2VkrJZ5oa3Bxmdsdqc5CNeeucUIzGVai8=;
 b=UKihY1gHoqacHxq8a4yKY2UkyDqjCEQH1vAcIAeKwO+tMTSryn1K7tA4uEyRbEheIqmvX+
 868qRSXIKgweImJkEUHPStbpaLRRIXv0cTxDXXLRa4B/d4t/fnwpLkYtfd9HD7aogEpwll
 4bGaDvYXAOOu7f3o6ldYdqA2Ikw1lY0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-lt1Mr7ypNP6EWtcCqEA_9Q-1; Tue, 22 Mar 2022 07:56:52 -0400
X-MC-Unique: lt1Mr7ypNP6EWtcCqEA_9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8103629DD995;
 Tue, 22 Mar 2022 11:56:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E4BA403D188;
 Tue, 22 Mar 2022 11:56:52 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/25] block/rbd: fix write zeroes with growing images
Date: Tue, 22 Mar 2022 12:56:24 +0100
Message-Id: <20220322115647.726044-3-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit d24f80234b ("block/rbd: increase dynamically the image size")
added a workaround to support growing images (eg. qcow2), resizing
the image before write operations that exceed the current size.

We recently added support for write zeroes and without the
workaround we can have problems with qcow2.

So let's move the resize into qemu_rbd_start_co() and do it when
the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20220317162638.41192-1-sgarzare@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/rbd.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 8f183eba2a..6caf35cbba 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
 
     assert(!qiov || qiov->size == bytes);
 
+    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
+        /*
+         * RBD APIs don't allow us to write more than actual size, so in order
+         * to support growing images, we resize the image before write
+         * operations that exceed the current size.
+         */
+        if (offset + bytes > s->image_size) {
+            int r = qemu_rbd_resize(bs, offset + bytes);
+            if (r < 0) {
+                return r;
+            }
+        }
+    }
+
     r = rbd_aio_create_completion(&task,
                                   (rbd_callback_t) qemu_rbd_completion_cb, &c);
     if (r < 0) {
@@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
                                  int64_t bytes, QEMUIOVector *qiov,
                                  BdrvRequestFlags flags)
 {
-    BDRVRBDState *s = bs->opaque;
-    /*
-     * RBD APIs don't allow us to write more than actual size, so in order
-     * to support growing images, we resize the image before write
-     * operations that exceed the current size.
-     */
-    if (offset + bytes > s->image_size) {
-        int r = qemu_rbd_resize(bs, offset + bytes);
-        if (r < 0) {
-            return r;
-        }
-    }
     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
 }
 
-- 
2.35.1


