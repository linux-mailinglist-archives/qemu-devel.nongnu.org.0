Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625CC690D73
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:46:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ97S-0002DP-Qj; Thu, 09 Feb 2023 10:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pQ97A-0001wZ-TZ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pQ978-0004LV-Ko
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675957528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=c24n6h4cZyn1238lp8INnIalpufCghBolGU2T98Z3MA=;
 b=av4ny38gIJqvwDT1txTQokg8sJVjyAtUzFaO344PcPOy14pIjlTdBtxBq/cCZgDXn1vLlt
 2KOvLiQ08mu24100bJWdyvmMWZP/UpLNU9+Ey6wg9vW7W5Rkjdwci296iA/Y7br2TCbsTL
 4+7HF15ooXD4E30D+JltuPcAcUA/pbk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-ocn7J748O26i7xOx8RDGrw-1; Thu, 09 Feb 2023 10:45:24 -0500
X-MC-Unique: ocn7J748O26i7xOx8RDGrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8680B8027FD;
 Thu,  9 Feb 2023 15:45:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5562E40398A2;
 Thu,  9 Feb 2023 15:45:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Ninad Palsule <ninad@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH] block/file-posix: don't use functions calling AIO_WAIT_WHILE
 in worker threads
Date: Thu,  9 Feb 2023 10:45:22 -0500
Message-Id: <20230209154522.1164401-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
2.39.1


