Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576B39BE45
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:14:08 +0200 (CEST)
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDOZ-0008VJ-Ld
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCSX-0005WT-GP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCST-00041o-OU
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTZ6JKX3zl/zsppy+RNnFpUDLLv6Zb5UE6WSeAEmvtw=;
 b=fFNnRFiokhmxnt3U5WV6OxNRhW3GUailTH7exXMHbnt9nVCDLQc75kgdo22P9W2RP4frmo
 v4/KPEbuQctgB2UazzEDgtDfVA+MTwSU1Mr7n3n00GCekRAv1sFMfkFmFYWrmZFfq3olFV
 cIdhNBcFOzUrl/Hq9cHZQS4AcHfm3KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-H4HwJhJ3Oya8q7v_DU8nhg-1; Fri, 04 Jun 2021 12:14:03 -0400
X-MC-Unique: H4HwJhJ3Oya8q7v_DU8nhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B12EF107ACE4
 for <qemu-devel@nongnu.org>; Fri,  4 Jun 2021 16:14:02 +0000 (UTC)
Received: from localhost (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E55A10023AC;
 Fri,  4 Jun 2021 16:13:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 1/9] virtiofsd: Add TempFd structure
Date: Fri,  4 Jun 2021 18:13:29 +0200
Message-Id: <20210604161337.16048-2-mreitz@redhat.com>
In-Reply-To: <20210604161337.16048-1-mreitz@redhat.com>
References: <20210604161337.16048-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are planning to add file handles to lo_inode objects as an
alternative to lo_inode.fd.  That means that everywhere where we
currently reference lo_inode.fd, we will have to open a temporary file
descriptor that needs to be closed after use.

So instead of directly accessing lo_inode.fd, there will be a helper
function (lo_inode_fd()) that either returns lo_inode.fd, or opens a new
file descriptor with open_by_handle_at().  It encapsulates this result
in a TempFd structure to let the caller know whether the FD needs to be
closed after use (opened from the handle) or not (copied from
lo_inode.fd).

By using g_auto(TempFd) to store this result, callers will not even have
to care about closing a temporary FD after use.  It will be done
automatically once the object goes out of scope.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 49 ++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 49c21fd855..a4674aba80 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -174,6 +174,28 @@ struct lo_data {
     int user_killpriv_v2, killpriv_v2;
 };
 
+/**
+ * Represents a file descriptor that may either be owned by this
+ * TempFd, or only referenced (i.e. the ownership belongs to some
+ * other object, and the value has just been copied into this TempFd).
+ *
+ * The purpose of this encapsulation is to be used as g_auto(TempFd)
+ * to automatically clean up owned file descriptors when this object
+ * goes out of scope.
+ *
+ * Use temp_fd_steal() to get an owned file descriptor that will not
+ * be closed when the TempFd goes out of scope.
+ */
+typedef struct {
+    int fd;
+    bool owned; /* fd owned by this object? */
+} TempFd;
+
+#define TEMP_FD_INIT ((TempFd) { .fd = -1, .owned = false })
+
+static void temp_fd_clear(TempFd *temp_fd);
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(TempFd, temp_fd_clear);
+
 static const struct fuse_opt lo_opts[] = {
     { "sandbox=namespace",
       offsetof(struct lo_data, sandbox),
@@ -249,6 +271,33 @@ static struct lo_data *lo_data(fuse_req_t req)
     return (struct lo_data *)fuse_req_userdata(req);
 }
 
+/**
+ * Clean-up function for TempFds
+ */
+static void temp_fd_clear(TempFd *temp_fd)
+{
+    if (temp_fd->owned) {
+        close(temp_fd->fd);
+        *temp_fd = TEMP_FD_INIT;
+    }
+}
+
+/**
+ * Return an owned fd from *temp_fd that will not be closed when
+ * *temp_fd goes out of scope.
+ *
+ * (TODO: Remove __attribute__ once this is used.)
+ */
+static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
+{
+    if (temp_fd->owned) {
+        temp_fd->owned = false;
+        return temp_fd->fd;
+    } else {
+        return dup(temp_fd->fd);
+    }
+}
+
 /*
  * Load capng's state from our saved state if the current thread
  * hadn't previously been loaded.
-- 
2.31.1


