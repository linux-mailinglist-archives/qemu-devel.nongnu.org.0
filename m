Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F009553F98
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:37:08 +0200 (CEST)
Received: from localhost ([::1]:44910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oMk-00013p-Bg
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCP-00033n-SC
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCM-00069S-MD
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkgkihmuWH55uB1nDy9MReJ58rxDzTLx3dpDLFY96WI=;
 b=LiXeJEOmf0/gYb9OxYXC9WPyBs1Ppi67T6yg9HZ1V76whdm+N9tcWwujFvkWdbsf7wGSbV
 pEkVJPXwCYYgsdR1JtfDFeOLzW5gN8h1ZkpX5c30004DGAwqXqr0gLTfHXfhu43qdJTbG6
 hTSx6GU7hXQlptrFTOmZAw2onKOiAuE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-uAf_EWHAO5iPn_k2PfOZ9A-1; Tue, 21 Jun 2022 20:26:20 -0400
X-MC-Unique: uAf_EWHAO5iPn_k2PfOZ9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3BAB80029D;
 Wed, 22 Jun 2022 00:26:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6DC141510D;
 Wed, 22 Jun 2022 00:26:18 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 14/25] migration: convert savevm to use QIOChannelBlock for
 VMState
Date: Wed, 22 Jun 2022 02:25:36 +0200
Message-Id: <20220622002547.64784-15-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

With this change, all QEMUFile usage is backed by QIOChannel at
last.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 42 ++++--------------------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 75d05f1a84..24a50376dc 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -35,6 +35,7 @@
 #include "migration/misc.h"
 #include "migration/register.h"
 #include "migration/global_state.h"
+#include "migration/channel-block.h"
 #include "ram.h"
 #include "qemu-file-channel.h"
 #include "qemu-file.h"
@@ -130,48 +131,13 @@ static struct mig_cmd_args {
 /***********************************************************/
 /* savevm/loadvm support */
 
-static ssize_t block_writev_buffer(void *opaque, struct iovec *iov, int iovcnt,
-                                   int64_t pos, Error **errp)
-{
-    int ret;
-    QEMUIOVector qiov;
-
-    qemu_iovec_init_external(&qiov, iov, iovcnt);
-    ret = bdrv_writev_vmstate(opaque, &qiov, pos);
-    if (ret < 0) {
-        return ret;
-    }
-
-    return qiov.size;
-}
-
-static ssize_t block_get_buffer(void *opaque, uint8_t *buf, int64_t pos,
-                                size_t size, Error **errp)
-{
-    return bdrv_load_vmstate(opaque, buf, pos, size);
-}
-
-static int bdrv_fclose(void *opaque, Error **errp)
-{
-    return bdrv_flush(opaque);
-}
-
-static const QEMUFileOps bdrv_read_ops = {
-    .get_buffer = block_get_buffer,
-    .close =      bdrv_fclose
-};
-
-static const QEMUFileOps bdrv_write_ops = {
-    .writev_buffer  = block_writev_buffer,
-    .close          = bdrv_fclose
-};
-
 static QEMUFile *qemu_fopen_bdrv(BlockDriverState *bs, int is_writable)
 {
     if (is_writable) {
-        return qemu_fopen_ops(bs, &bdrv_write_ops, false);
+        return qemu_fopen_channel_output(QIO_CHANNEL(qio_channel_block_new(bs)));
+    } else {
+        return qemu_fopen_channel_input(QIO_CHANNEL(qio_channel_block_new(bs)));
     }
-    return qemu_fopen_ops(bs, &bdrv_read_ops, false);
 }
 
 
-- 
2.35.3


