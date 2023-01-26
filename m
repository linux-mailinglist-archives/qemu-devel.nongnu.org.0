Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03A67D610
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:17:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL8fO-0007g8-0H; Thu, 26 Jan 2023 15:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pL8fJ-0007eJ-Fb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:16:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pL8fD-0003Hd-64
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674764162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=brWxBGwq64UMG6JFb5YKlZl4Caw6Wx1jfqZ/KzoYqBI=;
 b=ZSX2NHHeJKrX6uD7PqZCakm/eYNbWYgovcZkdb72zaGv8gjVniFnBPBDfU8R/41f0bvRUw
 G9Y/KrA2hVKD9WI/TKJGuYIll5bIPrrKxiOMavMhRKlGnaQWyykAHyUPIs8JkCSk4Woz24
 QvsdTP/yNDvLsp/kUI2xuO617qET+gY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-U2_lCzsbMI2LpcHvUqLI3w-1; Thu, 26 Jan 2023 15:15:58 -0500
X-MC-Unique: U2_lCzsbMI2LpcHvUqLI3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B38FC802BF5;
 Thu, 26 Jan 2023 20:15:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D17B1121330;
 Thu, 26 Jan 2023 20:15:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>
Subject: [PATCH 2/4] qemu-io: use BdrvRequestFlags instead of int
Date: Thu, 26 Jan 2023 15:13:59 -0500
Message-Id: <20230126201401.348845-3-stefanha@redhat.com>
In-Reply-To: <20230126201401.348845-1-stefanha@redhat.com>
References: <20230126201401.348845-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The block layer APIs use BdrvRequestFlags while qemu-io code uses int.
Although the code compiles and runs fine, BdrvRequestFlags is clearer
because it differentiates between other types of flags like bdrv_open()
flags.

This is purely refactoring.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-io-cmds.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 952dc940f1..c0125d14c0 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -556,7 +556,7 @@ static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
 }
 
 static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
-                     int64_t bytes, int flags, int64_t *total)
+                     int64_t bytes, BdrvRequestFlags flags, int64_t *total)
 {
     int ret;
 
@@ -577,7 +577,7 @@ typedef struct {
     int64_t offset;
     int64_t bytes;
     int64_t *total;
-    int flags;
+    BdrvRequestFlags flags;
     int ret;
     bool done;
 } CoWriteZeroes;
@@ -598,7 +598,8 @@ static void coroutine_fn co_pwrite_zeroes_entry(void *opaque)
 }
 
 static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                               int64_t bytes, int flags, int64_t *total)
+                               int64_t bytes, BdrvRequestFlags flags,
+                               int64_t *total)
 {
     Coroutine *co;
     CoWriteZeroes data = {
@@ -688,7 +689,7 @@ static int do_aio_readv(BlockBackend *blk, QEMUIOVector *qiov,
 }
 
 static int do_aio_writev(BlockBackend *blk, QEMUIOVector *qiov,
-                         int64_t offset, int flags, int *total)
+                         int64_t offset, BdrvRequestFlags flags, int *total)
 {
     int async_ret = NOT_DONE;
 
@@ -1065,7 +1066,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     struct timespec t1, t2;
     bool Cflag = false, qflag = false, bflag = false;
     bool Pflag = false, zflag = false, cflag = false, sflag = false;
-    int flags = 0;
+    BdrvRequestFlags flags = 0;
     int c, cnt, ret;
     char *buf = NULL;
     int64_t offset;
@@ -1266,7 +1267,7 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timespec t1, t2;
     bool Cflag = false, qflag = false;
-    int flags = 0;
+    BdrvRequestFlags flags = 0;
     int c, cnt, ret;
     char *buf;
     int64_t offset;
@@ -1581,7 +1582,7 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
     int nr_iov, c;
     int pattern = 0xcd;
     struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
-    int flags = 0;
+    BdrvRequestFlags flags = 0;
 
     ctx->blk = blk;
     while ((c = getopt(argc, argv, "CfiqP:uz")) != -1) {
-- 
2.39.1


