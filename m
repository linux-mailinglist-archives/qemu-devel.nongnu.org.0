Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680535F8AF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:09:07 +0200 (CEST)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWi4g-00041e-E7
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoD-00086z-SB
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoC-0000OB-AJ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGo8tvPFjiXKtKsRTWZpe/zkqD1YvLudAdUZo0J2WDQ=;
 b=Xx1FzF1xdyXlW0g39Ecd2tYWi5ezKTcK+0laAv3wDRWtGlaYSyv4A7ygGfcdQHNvj9FKjH
 8fSPtOcjy0y7D95RQZJI01IOKMpzvbjdOqukf3Z/ma5x8Iw+YsFXyjwKLzXH+PZyGjB/yp
 jz2ms67aH3dt5sOQzmhPtIFZnIYRErk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-HzXSXDAoOCCuvCxQLBpxPw-1; Wed, 14 Apr 2021 11:52:01 -0400
X-MC-Unique: HzXSXDAoOCCuvCxQLBpxPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 475A984E20A
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32D6D610A8;
 Wed, 14 Apr 2021 15:51:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 12/25] DAX: virtiofsd: Add setup/remove mapping handlers to
 passthrough_ll
Date: Wed, 14 Apr 2021 16:51:24 +0100
Message-Id: <20210414155137.46522-13-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 1553d2ef45..afa86650c1 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3144,6 +3144,22 @@ static void lo_destroy(void *userdata)
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
@@ -3185,6 +3201,8 @@ static struct fuse_lowlevel_ops lo_oper = {
 #endif
     .lseek = lo_lseek,
     .destroy = lo_destroy,
+    .setupmapping = lo_setupmapping,
+    .removemapping = lo_removemapping,
 };
 
 /* Print vhost-user.json backend program capabilities */
-- 
2.31.1


