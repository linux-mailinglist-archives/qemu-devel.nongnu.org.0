Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116173C240D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:11:57 +0200 (CEST)
Received: from localhost ([::1]:37128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qIO-0004uA-4u
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pya-0003zq-K3
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyY-0003UG-Ad
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNEeG1+kdgaWO7xARkwHEHrkDlaPiqzVvIaIOqASbeQ=;
 b=fc1tXmC6RedXIF0UYfNR5pO/t8KMaEKEOPsP7fDzJ26uQn689aBMpLP0LOXjEzmU18XBaH
 K6AA5PlyMoam+JH3D9YmoQN/Ot+Y8eMuWgmefFZCsoVXUcJ/ge10V2v/wBLAnD+ruAiQjH
 a9ijQXD46d0oAXjhYMK5B5Pxz2ue8vM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-5ZfRG1KVPdKHsydmlsWJ3A-1; Fri, 09 Jul 2021 08:51:24 -0400
X-MC-Unique: 5ZfRG1KVPdKHsydmlsWJ3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E46221084F5A;
 Fri,  9 Jul 2021 12:51:22 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27BD960843;
 Fri,  9 Jul 2021 12:51:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/28] export/fuse: Give SET_ATTR_SIZE its own branch
Date: Fri,  9 Jul 2021 14:50:19 +0200
Message-Id: <20210709125035.191321-13-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

In order to support changing other attributes than the file size in
fuse_setattr(), we have to give each its own independent branch.  This
also applies to the only attribute we do support right now.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210625142317.271673-4-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 4068250241..26ad644cd7 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -417,20 +417,22 @@ static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
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


