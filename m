Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D544467546E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqTu-0002aY-GE; Fri, 20 Jan 2023 07:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTs-0002TM-0r
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTp-0000IY-KJ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZb6cjc+N4t2QMjuoFYUxzGicYEOiOQrxauYSz1kBWM=;
 b=TjCuvWd4bbvKgWfAcaTwMbteO7eJYvmm7k/WiMTB9MMj7W0aUMvzQN1R1WRHJ8F8n9B8hy
 VkBwASE0h/KoB40GdQu7o6TTRe5X028aSjw/T3LahfQq3DNrwPcdddKmpSEKsKH2nRduzk
 CpJWZM/v7xaR6nIKgVcnaAZbLGQ0fjQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-GW3Cc4RlMbu6BLqAmWubJQ-1; Fri, 20 Jan 2023 07:26:44 -0500
X-MC-Unique: GW3Cc4RlMbu6BLqAmWubJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4814B18E004A;
 Fri, 20 Jan 2023 12:26:44 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78F9C40C6EC4;
 Fri, 20 Jan 2023 12:26:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/38] qemu-io: do not reinvent the blk_pwrite_zeroes wheel
Date: Fri, 20 Jan 2023 13:26:01 +0100
Message-Id: <20230120122633.84983-7-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

qemu-io's do_co_pwrite_zeroes is reinventing the coroutine wrapper
blk_pwrite_zeroes.  Just use the real thing directly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221215130225.476477-1-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-io-cmds.c | 57 +++++++++-----------------------------------------
 1 file changed, 10 insertions(+), 47 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 952dc940f1..7a412d6512 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -572,54 +572,17 @@ static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
     return 1;
 }
 
-typedef struct {
-    BlockBackend *blk;
-    int64_t offset;
-    int64_t bytes;
-    int64_t *total;
-    int flags;
-    int ret;
-    bool done;
-} CoWriteZeroes;
-
-static void coroutine_fn co_pwrite_zeroes_entry(void *opaque)
-{
-    CoWriteZeroes *data = opaque;
-
-    data->ret = blk_co_pwrite_zeroes(data->blk, data->offset, data->bytes,
-                                     data->flags);
-    data->done = true;
-    if (data->ret < 0) {
-        *data->total = data->ret;
-        return;
-    }
-
-    *data->total = data->bytes;
-}
-
-static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
+static int do_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                                int64_t bytes, int flags, int64_t *total)
 {
-    Coroutine *co;
-    CoWriteZeroes data = {
-        .blk    = blk,
-        .offset = offset,
-        .bytes  = bytes,
-        .total  = total,
-        .flags  = flags,
-        .done   = false,
-    };
-
-    co = qemu_coroutine_create(co_pwrite_zeroes_entry, &data);
-    bdrv_coroutine_enter(blk_bs(blk), co);
-    while (!data.done) {
-        aio_poll(blk_get_aio_context(blk), true);
-    }
-    if (data.ret < 0) {
-        return data.ret;
-    } else {
-        return 1;
+    int ret = blk_pwrite_zeroes(blk, offset, bytes,
+                                flags | BDRV_REQ_ZERO_WRITE);
+
+    if (ret < 0) {
+        return ret;
     }
+    *total = bytes;
+    return 1;
 }
 
 static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
@@ -1042,7 +1005,7 @@ static void write_help(void)
 " -C, -- report statistics in a machine parsable format\n"
 " -q, -- quiet mode, do not show I/O statistics\n"
 " -u, -- with -z, allow unmapping\n"
-" -z, -- write zeroes using blk_co_pwrite_zeroes\n"
+" -z, -- write zeroes using blk_pwrite_zeroes\n"
 "\n");
 }
 
@@ -1199,7 +1162,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     if (bflag) {
         ret = do_save_vmstate(blk, buf, offset, count, &total);
     } else if (zflag) {
-        ret = do_co_pwrite_zeroes(blk, offset, count, flags, &total);
+        ret = do_pwrite_zeroes(blk, offset, count, flags, &total);
     } else if (cflag) {
         ret = do_write_compressed(blk, buf, offset, count, &total);
     } else {
-- 
2.38.1


