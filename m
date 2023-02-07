Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC3168E1F8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:38:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUj5-0000U7-ES; Tue, 07 Feb 2023 15:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pPUj2-0000TD-Lm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pPUj1-0004Lb-68
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675802278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4PEFehov0XWa5Gg2xozxFuWrmHOWJCKqvg8po4LObQ=;
 b=C4d/JJBzTVPbpKHUGPPjUmUG89zyL3rBGiiYs4P2OZ76/RniFLYTOpoFjoPAdeQLd8G0Bq
 MiNrx9RPM6Ted6Cd7Xl/N065Q5vm28PwRW1VoqxQQlZWH7Am3DKWL/DhfBWfI5UIgOFUyz
 lXQX4xWBKcUxRqqpwfscVGPnpgcIxMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-7_eLY9LiO76GY53cHuKejQ-1; Tue, 07 Feb 2023 15:37:55 -0500
X-MC-Unique: 7_eLY9LiO76GY53cHuKejQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01EC8101A55E;
 Tue,  7 Feb 2023 20:37:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65BA9C15BA0;
 Tue,  7 Feb 2023 20:37:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fiona Ebner <f.ebner@proxmox.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v4 2/4] qemu-io: use BdrvRequestFlags instead of int
Date: Tue,  7 Feb 2023 15:37:17 -0500
Message-Id: <20230207203719.242926-3-stefanha@redhat.com>
In-Reply-To: <20230207203719.242926-1-stefanha@redhat.com>
References: <20230207203719.242926-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

The block layer APIs use BdrvRequestFlags while qemu-io code uses int.
Although the code compiles and runs fine, BdrvRequestFlags is clearer
because it differentiates between other types of flags like bdrv_open()
flags.

This is purely refactoring.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-io-cmds.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index a061031615..1f60c23ba4 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -556,7 +556,7 @@ static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
 }
 
 static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
-                     int64_t bytes, int flags, int64_t *total)
+                     int64_t bytes, BdrvRequestFlags flags, int64_t *total)
 {
     int ret;
 
@@ -573,7 +573,8 @@ static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
 }
 
 static int do_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                               int64_t bytes, int flags, int64_t *total)
+                               int64_t bytes, BdrvRequestFlags flags,
+                               int64_t *total)
 {
     int ret = blk_pwrite_zeroes(blk, offset, bytes,
                                 flags | BDRV_REQ_ZERO_WRITE);
@@ -651,7 +652,7 @@ static int do_aio_readv(BlockBackend *blk, QEMUIOVector *qiov,
 }
 
 static int do_aio_writev(BlockBackend *blk, QEMUIOVector *qiov,
-                         int64_t offset, int flags, int *total)
+                         int64_t offset, BdrvRequestFlags flags, int *total)
 {
     int async_ret = NOT_DONE;
 
@@ -1028,7 +1029,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     struct timespec t1, t2;
     bool Cflag = false, qflag = false, bflag = false;
     bool Pflag = false, zflag = false, cflag = false, sflag = false;
-    int flags = 0;
+    BdrvRequestFlags flags = 0;
     int c, cnt, ret;
     char *buf = NULL;
     int64_t offset;
@@ -1229,7 +1230,7 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timespec t1, t2;
     bool Cflag = false, qflag = false;
-    int flags = 0;
+    BdrvRequestFlags flags = 0;
     int c, cnt, ret;
     char *buf;
     int64_t offset;
@@ -1544,7 +1545,7 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
     int nr_iov, c;
     int pattern = 0xcd;
     struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
-    int flags = 0;
+    BdrvRequestFlags flags = 0;
 
     ctx->blk = blk;
     while ((c = getopt(argc, argv, "CfiqP:uz")) != -1) {
-- 
2.39.1


