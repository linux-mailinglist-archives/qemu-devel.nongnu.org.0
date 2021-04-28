Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C4D36D643
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:14:55 +0200 (CEST)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi9e-0001u8-6i
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxC-0006Vr-EW
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxA-00057X-EW
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=olQhEZ/1el0/Ce6ZL1vnHWeu9joLrtu4S+ejkfrPTMA=;
 b=Vg0OkDgM7W8OesGexARqph9eRvL2UUUs8b092lyZPsbCbAz7MlfmIxvt+DQbsCY9neyTQl
 QcGwbRe20nD+BQcyV7X0kX4Ehe2P5HoJQkkIskjNuge+7jb2uRPEs2ZNyyT0INsw8ZStEG
 te3Bz5+ocRfDr3Wty7LKvYoSSIw8x6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-zBae5HVzNDWrksy3ViArDg-1; Wed, 28 Apr 2021 07:01:57 -0400
X-MC-Unique: zBae5HVzNDWrksy3ViArDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D34280ED96;
 Wed, 28 Apr 2021 11:01:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29ACD10840E4;
 Wed, 28 Apr 2021 11:01:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 15/26] DAX: virtiofsd: Make lo_removemapping() work
Date: Wed, 28 Apr 2021 12:00:49 +0100
Message-Id: <20210428110100.27757-16-dgilbert@redhat.com>
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
index 6981737389..1a86378172 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3210,8 +3210,36 @@ static void lo_removemapping(fuse_req_t req, struct fuse_session *se,
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
+                         "(offset=0x%" PRIx64 ", len=0x%" PRIx64 "). err=%d\n",
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


