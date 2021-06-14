Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1833A6937
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:46:56 +0200 (CEST)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnrb-0006pj-FT
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnp7-0003U9-9L
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnp2-0004Mu-Qr
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623681856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3Xckm5VyhWLEc8icS26yAWa3NZzIwwiA6Wjm404SYU=;
 b=LKOrOoxcPNA0QN/65zdFOGGHyl2cd4KpRcVSbOEp2mHsMlUw0sm7bVkhegkjlsousuKU0x
 K64z4Y05Kzn/m511o/q7Es0dGgosJTwrlf23CPdbITeCjSBFfCo/kHsYa3oDyLldhYbuXB
 gjbHk2j1wp7IM51RBlNcxFpVB/OEzIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-looL65vAMmWisZE4dOUm5A-1; Mon, 14 Jun 2021 10:44:14 -0400
X-MC-Unique: looL65vAMmWisZE4dOUm5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD81610C1ADC;
 Mon, 14 Jun 2021 14:44:13 +0000 (UTC)
Received: from localhost (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76D0410016FE;
 Mon, 14 Jun 2021 14:44:13 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/4] export/fuse: Give SET_ATTR_SIZE its own branch
Date: Mon, 14 Jun 2021 16:44:05 +0200
Message-Id: <20210614144407.134243-3-mreitz@redhat.com>
In-Reply-To: <20210614144407.134243-1-mreitz@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to support changing other attributes than the file size in
fuse_setattr(), we have to give each its own independent branch.  This
also applies to the only attribute we do support right now.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/export/fuse.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 34a5836ece..1d54286d90 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -408,20 +408,22 @@ static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
     FuseExport *exp = fuse_req_userdata(req);
     int ret;
 
-    if (!exp->writable) {
-        fuse_reply_err(req, EACCES);
-        return;
-    }
-
     if (to_set & ~FUSE_SET_ATTR_SIZE) {
         fuse_reply_err(req, ENOTSUP);
         return;
     }
 
-    ret = fuse_do_truncate(exp, statbuf->st_size, true, PREALLOC_MODE_OFF);
-    if (ret < 0) {
-        fuse_reply_err(req, -ret);
-        return;
+    if (to_set & FUSE_SET_ATTR_SIZE) {
+        if (!exp->writable) {
+            fuse_reply_err(req, EACCES);
+            return;
+        }
+
+        ret = fuse_do_truncate(exp, statbuf->st_size, true, PREALLOC_MODE_OFF);
+        if (ret < 0) {
+            fuse_reply_err(req, -ret);
+            return;
+        }
     }
 
     fuse_getattr(req, inode, fi);
-- 
2.31.1


