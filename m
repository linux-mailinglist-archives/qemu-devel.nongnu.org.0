Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D23156AB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:22:41 +0100 (CET)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yau-0001jf-MH
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKG-0003RM-Rt
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKE-0002Dq-1N
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HE8LrddnxGky44SJcOH9gN83cUyYp9owH4SNW0DxjQ=;
 b=bEbA3POd0RxlCHtB2a37cD94WUiOKZ0hgWqj6r73GZdUuGTtFn7Ww7aYaVjmIgQp4Rs6Mz
 ehVIkViZ8jrycwjH70HzByQ2g8mM1GyKVYdDp/tPMOSbKTAugHdxrRl/qccssnOFtAH235
 OA6HIxwbOFUc6RXdPanJO6msifQNGxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-8VkxbY-cMA2Q-SpmnMbATA-1; Tue, 09 Feb 2021 14:05:17 -0500
X-MC-Unique: 8VkxbY-cMA2Q-SpmnMbATA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C04A803F4A
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:05:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 393E960C04;
 Tue,  9 Feb 2021 19:04:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 13/24] DAX: virtiofsd: Make lo_removemapping() work
Date: Tue,  9 Feb 2021 19:02:13 +0000
Message-Id: <20210209190224.62827-14-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Let guest pass in the offset in dax window a mapping is currently
mapped at and needs to be removed.

Vivek added the initial support to remove single mapping and later Peng
added patch to support removing multiple mappings in single command.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
---
 tools/virtiofsd/passthrough_ll.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 0493f00756..971ff2b2ea 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3023,8 +3023,30 @@ static void lo_removemapping(fuse_req_t req, struct fuse_session *se,
                              fuse_ino_t ino, unsigned num,
                              struct fuse_removemapping_one *argp)
 {
-    /* TODO */
-    fuse_reply_err(req, ENOSYS);
+    VhostUserFSSlaveMsg msg = { 0 };
+    int ret = 0;
+
+    for (int i = 0; num > 0; i++, argp++) {
+        msg.len[i] = argp->len;
+        msg.c_offset[i] = argp->moffset;
+
+        if (--num == 0 || i == VHOST_USER_FS_SLAVE_ENTRIES - 1) {
+            ret = fuse_virtio_unmap(se, &msg);
+            if (ret < 0) {
+                fuse_log(FUSE_LOG_ERR,
+                         "%s: unmap over virtio failed "
+                         "(offset=0x%lx, len=0x%lx). err=%d\n",
+                         __func__, argp->moffset, argp->len, ret);
+                break;
+            }
+            if (num > 0) {
+                i = 0;
+                memset(&msg, 0, sizeof(msg));
+            }
+        }
+    }
+
+    fuse_reply_err(req, -ret);
 }
 
 static struct fuse_lowlevel_ops lo_oper = {
-- 
2.29.2


