Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2169AF2A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Ns-0005CF-TM; Fri, 17 Feb 2023 10:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NY-0004uF-Px
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NW-0007ZX-C8
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWohMRuh9zgDR1GH+Ur7Wtwbar4xs9BetIOHAE4lCQA=;
 b=isBvJdadd/sUrgiiDbEgN3kmpbue/zoop9E49vLGzQFYYv400PRO3j3km0RpWq6yrmPv00
 YW4KlZ2PAKievBpOU2XGS8+8MESHfgaYTbyo4XTnbY1X24zrdLlozpEEbkx1UaFuAlYhLb
 qvZE3CpEnwvJDBy3jNAvro5nLK4Ll+o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-3ce3Hv2BOvyNiAuiXrblJw-1; Fri, 17 Feb 2023 10:10:22 -0500
X-MC-Unique: 3ce3Hv2BOvyNiAuiXrblJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F1E3828895;
 Fri, 17 Feb 2023 15:10:21 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ED58492C14;
 Fri, 17 Feb 2023 15:10:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 21/22] block/file-posix: don't use functions calling
 AIO_WAIT_WHILE in worker threads
Date: Fri, 17 Feb 2023 16:09:53 +0100
Message-Id: <20230217150954.283920-21-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

When calling bdrv_getlength() in handle_aiocb_write_zeroes(), the
function creates a new coroutine and then waits that it finishes using
AIO_WAIT_WHILE.
The problem is that this function could also run in a worker thread,
that has a different AioContext from main loop and iothreads, therefore
in AIO_WAIT_WHILE we will have in_aio_context_home_thread(ctx) == false
and therefore
assert(qemu_get_current_aio_context() == qemu_get_aio_context());
in the else branch will fail, crashing QEMU.

Aside from that, bdrv_getlength() is wrong also conceptually, because
it reads the BDS graph from another thread and is not protected by
any lock.

Replace it with raw_co_getlength, that doesn't create a coroutine and
doesn't read the BDS graph.

Reported-by: Ninad Palsule <ninad@linux.vnet.ibm.com>
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20230209154522.1164401-1-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d3073a7caa..9a99111f45 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1738,7 +1738,7 @@ static int handle_aiocb_write_zeroes(void *opaque)
 #ifdef CONFIG_FALLOCATE
     /* Last resort: we are trying to extend the file with zeroed data. This
      * can be done via fallocate(fd, 0) */
-    len = bdrv_getlength(aiocb->bs);
+    len = raw_co_getlength(aiocb->bs);
     if (s->has_fallocate && len >= 0 && aiocb->aio_offset >= len) {
         int ret = do_fallocate(s->fd, 0, aiocb->aio_offset, aiocb->aio_nbytes);
         if (ret == 0 || ret != -ENOTSUP) {
-- 
2.39.2


