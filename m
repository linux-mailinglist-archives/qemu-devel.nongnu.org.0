Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC95576E0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:43:02 +0200 (CEST)
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4JMb-0003Sx-MH
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8i-0000NI-7W
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8g-0004wE-FF
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWMFylKVndR7Tbpxqd79fyCmIaxCGg+0VgMXEPxlDvk=;
 b=DDTo6VMHNftufdk5IIrK4cfFYde54Xet4HM+UeJEHvde8xDGpOPlihj+4tsKj2gdcqw82I
 qcH7aIgPRyfRi3g/jI1eBvcC1+/2VdVO6HbZHlJMQHYp2OnnB8Eu4RCIqy4mb6hnvEWCmA
 19Kq/vb4+JSbM13vbqEHYBgWMFKUcx4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-pBY-lOWyOKWlg8mchwCUTg-1; Thu, 23 Jun 2022 05:28:33 -0400
X-MC-Unique: pBY-lOWyOKWlg8mchwCUTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F6D329ABA1B;
 Thu, 23 Jun 2022 09:28:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34ACE404E4DC;
 Thu, 23 Jun 2022 09:28:32 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 14/33] migration: convert savevm to use QIOChannelBlock for
 VMState
Date: Thu, 23 Jun 2022 10:27:51 +0100
Message-Id: <20220623092810.96234-15-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Wrap long lines
---
 migration/savevm.c | 44 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 75d05f1a84..3e9612121a 100644
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
@@ -130,48 +131,15 @@ static struct mig_cmd_args {
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
+        return qemu_fopen_channel_output(
+                   QIO_CHANNEL(qio_channel_block_new(bs)));
+    } else {
+        return qemu_fopen_channel_input(
+                   QIO_CHANNEL(qio_channel_block_new(bs)));
     }
-    return qemu_fopen_ops(bs, &bdrv_read_ops, false);
 }
 
 
-- 
2.36.1


