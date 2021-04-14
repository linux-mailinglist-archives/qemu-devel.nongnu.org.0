Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE035F8B0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:09:08 +0200 (CEST)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWi4h-00047y-PD
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoH-0008Ff-6Z
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoF-0000P3-JU
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qrGuDiNJTARD3z3GC2R1ym+cRc4UemoOJpIU5cBpy9Y=;
 b=Dn5YaBLV1QRGop9+cAKC86u99ccSoloIFyZrcwbj1k4dOCcl3SrmkfsSrvzb80BXAz5ztt
 y3O1S9QNMyr+cOgjbr7xEh6R3zO6LH2cCOnsqVQvpY8g3kXcvgKePZyaFMPNHfHyjJZp0/
 WQqv2t//IfVpn7iNadeSldqR5IxczSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-gjjYuaJYM46INjtYXraRZw-1; Wed, 14 Apr 2021 11:52:05 -0400
X-MC-Unique: gjjYuaJYM46INjtYXraRZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12ABE9F942
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDC8518A49;
 Wed, 14 Apr 2021 15:52:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 14/25] DAX: virtiofsd: Make lo_removemapping() work
Date: Wed, 14 Apr 2021 16:51:26 +0100
Message-Id: <20210414155137.46522-15-dgilbert@redhat.com>
In-Reply-To: <20210414155137.46522-1-dgilbert@redhat.com>
References: <20210414155137.46522-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Let guest pass in the offset in dax window a mapping is currently
mapped at and needs to be removed.

Vivek added the initial support to remove single mapping and later Peng
added patch to support removing multiple mappings in single command.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index bf7a7f3c23..a9f0505414 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3209,8 +3209,36 @@ static void lo_removemapping(fuse_req_t req, struct fuse_session *se,
                              fuse_ino_t ino, unsigned num,
                              struct fuse_removemapping_one *argp)
 {
-    /* TODO */
-    fuse_reply_err(req, ENOSYS);
+    VhostUserFSSlaveMsg *msg;
+    size_t alloc_count = (num > VHOST_USER_FS_SLAVE_MAX_ENTRIES) ?
+                              VHOST_USER_FS_SLAVE_MAX_ENTRIES : num;
+    int ret = 0;
+    msg = g_malloc0(sizeof(VhostUserFSSlaveMsg) +
+                    alloc_count * sizeof(VhostUserFSSlaveMsgEntry));
+
+    for (int i = 0, o = 0; num > 0; i++, argp++) {
+        VhostUserFSSlaveMsgEntry *e = &msg->entries[o];
+
+        e->len = argp->len;
+        e->c_offset = argp->moffset;
+
+        o++;
+        if (--num == 0 || o == VHOST_USER_FS_SLAVE_MAX_ENTRIES) {
+            msg->count = o;
+            ret = fuse_virtio_unmap(se, msg);
+            if (ret < 0) {
+                fuse_log(FUSE_LOG_ERR,
+                         "%s: unmap over virtio failed "
+                         "(offset=0x%lx, len=0x%lx). err=%d\n",
+                         __func__, argp->moffset, argp->len, ret);
+                break;
+            }
+            o = 0;
+        }
+    }
+
+    fuse_reply_err(req, -ret);
+    g_free(msg);
 }
 
 static struct fuse_lowlevel_ops lo_oper = {
-- 
2.31.1


