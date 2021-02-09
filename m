Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0520F3156BE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:27:46 +0100 (CET)
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yfo-0007Ct-W6
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YJs-0003Dx-O9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YJq-00027t-OK
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGfTDXB3Y9zBXZDDsU0pPd8Flh5YS87NuxSF/Vj4+SA=;
 b=P402asxQdOebfueYcZ22MpuqROa646mF5ZiVm18GGDozzzioSME4Lwu2Wr6u5Qy9rVShb9
 FyoYi9I7QYuAY7L2RuPaD0wzx91XtExtoZfGtJSO2oHXWD2Iqfl+HcgyJ9CQ6cOE1YccDx
 5O7n/wAhQRUzMGXts0epRNO8r+8c8Do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-RSupXggRMem0xp6twtEsvQ-1; Tue, 09 Feb 2021 14:04:53 -0500
X-MC-Unique: RSupXggRMem0xp6twtEsvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F09C5107ACE6
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:04:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7516360C04;
 Tue,  9 Feb 2021 19:04:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 11/24] DAX: virtiofsd: Add setup/remove mapping handlers to
 passthrough_ll
Date: Tue,  9 Feb 2021 19:02:11 +0000
Message-Id: <20210209190224.62827-12-dgilbert@redhat.com>
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 147b59338a..31c43d67a0 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2963,6 +2963,22 @@ static void lo_destroy(void *userdata)
     pthread_mutex_unlock(&lo->mutex);
 }
 
+static void lo_setupmapping(fuse_req_t req, fuse_ino_t ino, uint64_t foffset,
+                            uint64_t len, uint64_t moffset, uint64_t flags,
+                            struct fuse_file_info *fi)
+{
+    /* TODO */
+    fuse_reply_err(req, ENOSYS);
+}
+
+static void lo_removemapping(fuse_req_t req, struct fuse_session *se,
+                             fuse_ino_t ino, unsigned num,
+                             struct fuse_removemapping_one *argp)
+{
+    /* TODO */
+    fuse_reply_err(req, ENOSYS);
+}
+
 static struct fuse_lowlevel_ops lo_oper = {
     .init = lo_init,
     .lookup = lo_lookup,
@@ -3004,6 +3020,8 @@ static struct fuse_lowlevel_ops lo_oper = {
 #endif
     .lseek = lo_lseek,
     .destroy = lo_destroy,
+    .setupmapping = lo_setupmapping,
+    .removemapping = lo_removemapping,
 };
 
 /* Print vhost-user.json backend program capabilities */
-- 
2.29.2


