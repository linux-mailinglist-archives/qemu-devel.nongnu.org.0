Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0436D632
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:12:17 +0200 (CEST)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi76-0006mA-Ri
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhx7-0006LZ-Nx
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhx4-00055C-K1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cWJ3h/2d0E0xJGrEE+Rts6MV3ZsGGPdLVQYWV71bsK4=;
 b=GYtY7trRdIlOShmGKP1NrMSD/SQyN+U52cCHQ67wab9xgaZzHKKrmYyaUIZFhM0R2FdLXa
 j6pYTcuxs11QiflSqltbCAkO4BzFlilp9SbVHhpGbSAgvGMotDYJI2/Dr28ww56eV+JN0C
 mqBIeeRc027IoB6eYBSXSdFfG+TJBI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-DEr7w7IlOoWEzo9driE56g-1; Wed, 28 Apr 2021 07:01:51 -0400
X-MC-Unique: DEr7w7IlOoWEzo9driE56g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20388801FCE;
 Wed, 28 Apr 2021 11:01:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC742100763C;
 Wed, 28 Apr 2021 11:01:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 11/26] DAX: virtiofsd Add cache accessor functions
Date: Wed, 28 Apr 2021 12:00:45 +0100
Message-Id: <20210428110100.27757-12-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add low level functions that the clients can use to map/unmap cache
areas.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.h | 21 +++++++++++++++++++++
 tools/virtiofsd/fuse_virtio.c   | 18 ++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 3bf786b034..3383e3a8a0 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -29,6 +29,8 @@
 #include <sys/uio.h>
 #include <utime.h>
 
+#include "subprojects/libvhost-user/libvhost-user.h"
+
 /*
  * Miscellaneous definitions
  */
@@ -1971,4 +1973,23 @@ void fuse_session_process_buf(struct fuse_session *se,
  */
 int fuse_session_receive_buf(struct fuse_session *se, struct fuse_buf *buf);
 
+/**
+ * For use with virtio-fs; request an fd be mapped into the cache
+ *
+ * @param req The request that triggered this action
+ * @param msg A set of mapping requests
+ * @param fd The fd to map
+ * @return Zero on success
+ */
+int64_t fuse_virtio_map(fuse_req_t req, VhostUserFSSlaveMsg *msg, int fd);
+
+/**
+ * For use with virtio-fs; request unmapping of part of the cache
+ *
+ * @param se The session this request is on
+ * @param msg A set of unmapping requests
+ * @return Zero on success
+ */
+int64_t fuse_virtio_unmap(struct fuse_session *se, VhostUserFSSlaveMsg *msg);
+
 #endif /* FUSE_LOWLEVEL_H_ */
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 2604e7f418..85d90ca595 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -1123,3 +1123,21 @@ void virtio_session_close(struct fuse_session *se)
     free(se->virtio_dev);
     se->virtio_dev = NULL;
 }
+
+int64_t fuse_virtio_map(fuse_req_t req, VhostUserFSSlaveMsg *msg, int fd)
+{
+    if (!req->se->virtio_dev) {
+        return -ENODEV;
+    }
+    return vu_fs_cache_request(&req->se->virtio_dev->dev,
+                               VHOST_USER_SLAVE_FS_MAP, fd, msg);
+}
+
+int64_t fuse_virtio_unmap(struct fuse_session *se, VhostUserFSSlaveMsg *msg)
+{
+    if (!se->virtio_dev) {
+        return -ENODEV;
+    }
+    return vu_fs_cache_request(&se->virtio_dev->dev, VHOST_USER_SLAVE_FS_UNMAP,
+                               -1, msg);
+}
-- 
2.31.1


