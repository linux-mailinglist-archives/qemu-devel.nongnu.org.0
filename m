Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DE4A6200
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:12:44 +0100 (CET)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwhu-0001br-GW
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:12:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyF-0002br-Q4
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyD-0003vQ-Ab
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMNOzASyEQpJGUcgeluZ9+vknPOFppWONhu9SuB/j10=;
 b=GYf6D2W9EAwu8suAhQWlaHAMQat3Yc+sNvmShUKzjOUl05Wqwd8WSE7kCEUwDT1I9VnuvE
 1l9MV5uHsgYnoD5MEB/lkrxEHUxl9zMKruolgYVa/yxQdYdd/MZE3BeUeFpORZhpDxX/Kg
 l2flVJn178UXDRul8JcxhHYaatsKBL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-AkY9NXCFO4-2qhR3LJDCkg-1; Tue, 01 Feb 2022 10:21:23 -0500
X-MC-Unique: AkY9NXCFO4-2qhR3LJDCkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B59118C89F4;
 Tue,  1 Feb 2022 15:21:21 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 051BB74EA3;
 Tue,  1 Feb 2022 15:21:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/10] block/export/fuse: Rearrange if-else-if ladder in
 fuse_fallocate()
Date: Tue,  1 Feb 2022 16:21:02 +0100
Message-Id: <20220201152108.171898-5-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

In order to safely maintain a mixture of #ifdef'ry with if-else-if
ladder, rearrange the last statement (!mode) first. Since it is
mutually exclusive with the other conditions, checking it first
doesn't make any logical difference, but allows to add #ifdef'ry
around in a more cleanly way.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220201112655.344373-2-f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 6710d8aed8..d25e478c0a 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -629,7 +629,26 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         length = MIN(length, blk_len - offset);
     }
 
-    if (mode & FALLOC_FL_PUNCH_HOLE) {
+    if (!mode) {
+        /* We can only fallocate at the EOF with a truncate */
+        if (offset < blk_len) {
+            fuse_reply_err(req, EOPNOTSUPP);
+            return;
+        }
+
+        if (offset > blk_len) {
+            /* No preallocation needed here */
+            ret = fuse_do_truncate(exp, offset, true, PREALLOC_MODE_OFF);
+            if (ret < 0) {
+                fuse_reply_err(req, -ret);
+                return;
+            }
+        }
+
+        ret = fuse_do_truncate(exp, offset + length, true,
+                               PREALLOC_MODE_FALLOC);
+    }
+    else if (mode & FALLOC_FL_PUNCH_HOLE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE)) {
             fuse_reply_err(req, EINVAL);
             return;
@@ -665,25 +684,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         } while (ret == 0 && length > 0);
     }
 #endif /* CONFIG_FALLOCATE_ZERO_RANGE */
-    else if (!mode) {
-        /* We can only fallocate at the EOF with a truncate */
-        if (offset < blk_len) {
-            fuse_reply_err(req, EOPNOTSUPP);
-            return;
-        }
-
-        if (offset > blk_len) {
-            /* No preallocation needed here */
-            ret = fuse_do_truncate(exp, offset, true, PREALLOC_MODE_OFF);
-            if (ret < 0) {
-                fuse_reply_err(req, -ret);
-                return;
-            }
-        }
-
-        ret = fuse_do_truncate(exp, offset + length, true,
-                               PREALLOC_MODE_FALLOC);
-    } else {
+    else {
         ret = -EOPNOTSUPP;
     }
 
-- 
2.31.1


