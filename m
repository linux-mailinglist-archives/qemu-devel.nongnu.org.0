Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865533BBAE0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:11:50 +0200 (CEST)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LZt-0006nh-Ed
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LSN-0001z6-Gt
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LSL-0001Lk-BP
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9e89yhns/ABCOvoED2UxFdHblDRTHVUgDyiwXwTVXhE=;
 b=IfCM8tR9rdA0lhte9hWwP6poXSiwpZtSSXPcFoMQlBD96/I/zi2YJX5NCDkOU4zaU9Owkz
 U5+9iBAH9XMFuPT2EURv+9NRpLn65bdtW2kto5K+CGrmYkXYe6arnNpvywXug+gmOZK/dB
 48dkeucSwlVDQu8f/sOViZIMQw9McGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-8jdMO3P-PUqnm0sBDQuZEg-1; Mon, 05 Jul 2021 06:03:59 -0400
X-MC-Unique: 8jdMO3P-PUqnm0sBDQuZEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1670E1084F4C;
 Mon,  5 Jul 2021 10:03:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BC0560C0F;
 Mon,  5 Jul 2021 10:03:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 10/19] virtiofsd: Fix fuse setxattr() API change issue
Date: Mon,  5 Jul 2021 11:02:26 +0100
Message-Id: <20210705100235.157093-11-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

With kernel header updates fuse_setxattr_in struct has grown in size.
But this new struct size only takes affect if user has opted in
for fuse feature FUSE_SETXATTR_EXT otherwise fuse continues to
send "fuse_setxattr_in" of older size. Older size is determined
by FUSE_COMPAT_SETXATTR_IN_SIZE.

Fix this. If we have not opted in for FUSE_SETXATTR_EXT, then
expect that we will get fuse_setxattr_in of size FUSE_COMPAT_SETXATTR_IN_SIZE
and not sizeof(struct fuse_sexattr_in).

Fixes: 278f064e4524 ("Update Linux headers to 5.13-rc4")
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20210622150852.1507204-2-vgoyal@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_common.h   | 5 +++++
 tools/virtiofsd/fuse_lowlevel.c | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index fa9671872e..0c2665b977 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -372,6 +372,11 @@ struct fuse_file_info {
  */
 #define FUSE_CAP_HANDLE_KILLPRIV_V2 (1 << 28)
 
+/**
+ * Indicates that file server supports extended struct fuse_setxattr_in
+ */
+#define FUSE_CAP_SETXATTR_EXT (1 << 29)
+
 /**
  * Ioctl flags
  *
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 3d725bcba2..2028677907 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1425,8 +1425,13 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
     struct fuse_setxattr_in *arg;
     const char *name;
     const char *value;
+    bool setxattr_ext = req->se->conn.want & FUSE_CAP_SETXATTR_EXT;
 
-    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
+    if (setxattr_ext) {
+        arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
+    } else {
+        arg = fuse_mbuf_iter_advance(iter, FUSE_COMPAT_SETXATTR_IN_SIZE);
+    }
     name = fuse_mbuf_iter_advance_str(iter);
     if (!arg || !name) {
         fuse_reply_err(req, EINVAL);
-- 
2.31.1


