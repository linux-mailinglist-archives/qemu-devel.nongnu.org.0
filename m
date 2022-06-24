Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8F559DFC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:02:51 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lli-0008MV-RM
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR8-0006Tf-Pt
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR3-0000sU-Qz
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuN1j5/AUkLScvlQMlzAfLcwGlnDEDTvi8bpEO/hjDw=;
 b=jLwIK8cIHy9dTSNoK8SpG8vk/qZTMXK5adltavGHUq1kFW0eaQJ0kWgHjYRGSItnvOgt+x
 F8u4FEbZowz6PTQ5hyWVZHYztk3f1fJkk0Zx6twTXkPARTccCGVCL0NQfDl1BM+YLcAOto
 xlfECjJ/Hz1rorNClUGOi50r5AZqfck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-Na0cL2NGMa-coJ2jv_niSQ-1; Fri, 24 Jun 2022 11:41:28 -0400
X-MC-Unique: Na0cL2NGMa-coJ2jv_niSQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B78EF811E84;
 Fri, 24 Jun 2022 15:41:27 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23483492C3B;
 Fri, 24 Jun 2022 15:41:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 15/20] block/rbd: report a better error when namespace does
 not exist
Date: Fri, 24 Jun 2022 17:40:58 +0200
Message-Id: <20220624154103.185902-16-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Stefano Garzarella <sgarzare@redhat.com>

If the namespace does not exist, rbd_create() fails with -ENOENT and
QEMU reports a generic "error rbd create: No such file or directory":

    $ qemu-img create rbd:rbd/namespace/image 1M
    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
    qemu-img: rbd:rbd/namespace/image: error rbd create: No such file or directory

Unfortunately rados_ioctx_set_namespace() does not fail if the namespace
does not exist, so let's use rbd_namespace_exists() in qemu_rbd_connect()
to check if the namespace exists, reporting a more understandable error:

    $ qemu-img create rbd:rbd/namespace/image 1M
    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
    qemu-img: rbd:rbd/namespace/image: namespace 'namespace' does not exist

Reported-by: Tingting Mao <timao@redhat.com>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20220517071012.6120-1-sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 24 ++++++++++++++++++++++++
 meson.build |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/block/rbd.c b/block/rbd.c
index 6caf35cbba..f826410f40 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -831,6 +831,26 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
         error_setg_errno(errp, -r, "error opening pool %s", opts->pool);
         goto failed_shutdown;
     }
+
+#ifdef HAVE_RBD_NAMESPACE_EXISTS
+    if (opts->has_q_namespace && strlen(opts->q_namespace) > 0) {
+        bool exists;
+
+        r = rbd_namespace_exists(*io_ctx, opts->q_namespace, &exists);
+        if (r < 0) {
+            error_setg_errno(errp, -r, "error checking namespace");
+            goto failed_ioctx_destroy;
+        }
+
+        if (!exists) {
+            error_setg(errp, "namespace '%s' does not exist",
+                       opts->q_namespace);
+            r = -ENOENT;
+            goto failed_ioctx_destroy;
+        }
+    }
+#endif
+
     /*
      * Set the namespace after opening the io context on the pool,
      * if nspace == NULL or if nspace == "", it is just as we did nothing
@@ -840,6 +860,10 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
     r = 0;
     goto out;
 
+#ifdef HAVE_RBD_NAMESPACE_EXISTS
+failed_ioctx_destroy:
+    rados_ioctx_destroy(*io_ctx);
+#endif
 failed_shutdown:
     rados_shutdown(*cluster);
 out:
diff --git a/meson.build b/meson.build
index 397ca1d60a..a113078f1a 100644
--- a/meson.build
+++ b/meson.build
@@ -1903,6 +1903,12 @@ config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
+if rbd.found()
+  config_host_data.set('HAVE_RBD_NAMESPACE_EXISTS',
+                       cc.has_function('rbd_namespace_exists',
+                                       dependencies: rbd,
+                                       prefix: '#include <rbd/librbd.h>'))
+endif
 if rdma.found()
   config_host_data.set('HAVE_IBV_ADVISE_MR',
                        cc.has_function('ibv_advise_mr',
-- 
2.35.3


