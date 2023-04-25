Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345D6EE6B2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:30:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMSS-000746-43; Tue, 25 Apr 2023 13:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMSP-00073O-Up
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMSO-0003CR-9i
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AI5kqkdzipCjtseeQPE5/aVyAJxrbcrgigA/+qZzi/8=;
 b=idZ+gkjmvrwYeE6c6KQnRkXUNMjTDeTpBaZZPJgqnsu9vZmQOvSnD+eemSKQjmdE1NBcme
 1Ewy3ltVhx+d25ab+zfTV75mHM51VC6/j0cLXdaeocC/NZZ/+XnNGk/Yp9elP/UMUnoQNG
 +TGFajP/qC0wLb/1Z57F523FHGsb64g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-4yW8uuHRMwqs5zACvwosHQ-1; Tue, 25 Apr 2023 13:27:54 -0400
X-MC-Unique: 4yW8uuHRMwqs5zACvwosHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 444E887A9E8;
 Tue, 25 Apr 2023 17:27:53 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7927C15BA0;
 Tue, 25 Apr 2023 17:27:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Lieven <pl@kamp.de>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: [PATCH v4 15/20] block/fuse: do not set is_external=true on FUSE fd
Date: Tue, 25 Apr 2023 13:27:11 -0400
Message-Id: <20230425172716.1033562-16-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This is part of ongoing work to remove the aio_disable_external() API.

Use BlockDevOps .drained_begin/end/poll() instead of
aio_set_fd_handler(is_external=true).

As a side-effect the FUSE export now follows AioContext changes like the
other export types.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/export/fuse.c | 58 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 06fa41079e..65a7f4d723 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -50,6 +50,7 @@ typedef struct FuseExport {
 
     struct fuse_session *fuse_session;
     struct fuse_buf fuse_buf;
+    unsigned int in_flight; /* atomic */
     bool mounted, fd_handler_set_up;
 
     char *mountpoint;
@@ -78,6 +79,42 @@ static void read_from_fuse_export(void *opaque);
 static bool is_regular_file(const char *path, Error **errp);
 
 
+static void fuse_export_drained_begin(void *opaque)
+{
+    FuseExport *exp = opaque;
+
+    aio_set_fd_handler(exp->common.ctx,
+                       fuse_session_fd(exp->fuse_session), false,
+                       NULL, NULL, NULL, NULL, NULL);
+    exp->fd_handler_set_up = false;
+}
+
+static void fuse_export_drained_end(void *opaque)
+{
+    FuseExport *exp = opaque;
+
+    /* Refresh AioContext in case it changed */
+    exp->common.ctx = blk_get_aio_context(exp->common.blk);
+
+    aio_set_fd_handler(exp->common.ctx,
+                       fuse_session_fd(exp->fuse_session), false,
+                       read_from_fuse_export, NULL, NULL, NULL, exp);
+    exp->fd_handler_set_up = true;
+}
+
+static bool fuse_export_drained_poll(void *opaque)
+{
+    FuseExport *exp = opaque;
+
+    return qatomic_read(&exp->in_flight) > 0;
+}
+
+static const BlockDevOps fuse_export_blk_dev_ops = {
+    .drained_begin = fuse_export_drained_begin,
+    .drained_end   = fuse_export_drained_end,
+    .drained_poll  = fuse_export_drained_poll,
+};
+
 static int fuse_export_create(BlockExport *blk_exp,
                               BlockExportOptions *blk_exp_args,
                               Error **errp)
@@ -101,6 +138,15 @@ static int fuse_export_create(BlockExport *blk_exp,
         }
     }
 
+    blk_set_dev_ops(exp->common.blk, &fuse_export_blk_dev_ops, exp);
+
+    /*
+     * We handle draining ourselves using an in-flight counter and by disabling
+     * the FUSE fd handler. Do not queue BlockBackend requests, they need to
+     * complete so the in-flight counter reaches zero.
+     */
+    blk_set_disable_request_queuing(exp->common.blk, true);
+
     init_exports_table();
 
     /*
@@ -224,7 +270,7 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
     g_hash_table_insert(exports, g_strdup(mountpoint), NULL);
 
     aio_set_fd_handler(exp->common.ctx,
-                       fuse_session_fd(exp->fuse_session), true,
+                       fuse_session_fd(exp->fuse_session), false,
                        read_from_fuse_export, NULL, NULL, NULL, exp);
     exp->fd_handler_set_up = true;
 
@@ -246,6 +292,8 @@ static void read_from_fuse_export(void *opaque)
 
     blk_exp_ref(&exp->common);
 
+    qatomic_inc(&exp->in_flight);
+
     do {
         ret = fuse_session_receive_buf(exp->fuse_session, &exp->fuse_buf);
     } while (ret == -EINTR);
@@ -256,6 +304,10 @@ static void read_from_fuse_export(void *opaque)
     fuse_session_process_buf(exp->fuse_session, &exp->fuse_buf);
 
 out:
+    if (qatomic_fetch_dec(&exp->in_flight) == 1) {
+        aio_wait_kick(); /* wake AIO_WAIT_WHILE() */
+    }
+
     blk_exp_unref(&exp->common);
 }
 
@@ -268,7 +320,7 @@ static void fuse_export_shutdown(BlockExport *blk_exp)
 
         if (exp->fd_handler_set_up) {
             aio_set_fd_handler(exp->common.ctx,
-                               fuse_session_fd(exp->fuse_session), true,
+                               fuse_session_fd(exp->fuse_session), false,
                                NULL, NULL, NULL, NULL, NULL);
             exp->fd_handler_set_up = false;
         }
@@ -287,6 +339,8 @@ static void fuse_export_delete(BlockExport *blk_exp)
 {
     FuseExport *exp = container_of(blk_exp, FuseExport, common);
 
+    blk_set_dev_ops(exp->common.blk, NULL, NULL);
+
     if (exp->fuse_session) {
         if (exp->mounted) {
             fuse_session_unmount(exp->fuse_session);
-- 
2.39.2


