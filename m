Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F752D7CE8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:30:15 +0100 (CET)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmFC-0005db-1r
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluW-0003m1-24
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluE-00026z-Rd
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7YYa3LFi0Y4wK4CNURxUtOEL+L50jCecL5ttIgFZE8=;
 b=QytCz3XhLIPTB0SCUNsea9m37EEEIGU84TUxcy56TNdpcrWzGQSs738a6AkVnQFOk4aV80
 9aPmNfwcrkxfF9OkIs8mYIMKFo8779Cd0jB4HsfKI1m9GbTFIRTVSaLlDFj9fbBqgGEM5k
 dVq4rs2udBrUPXDwQHBXkK6npbxcZGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-ontAnAgzMfaex2Hv-6JRfg-1; Fri, 11 Dec 2020 12:08:31 -0500
X-MC-Unique: ontAnAgzMfaex2Hv-6JRfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2521107ACF7;
 Fri, 11 Dec 2020 17:08:30 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B11435D71D;
 Fri, 11 Dec 2020 17:08:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/34] fuse: (Partially) implement fallocate()
Date: Fri, 11 Dec 2020 18:07:47 +0100
Message-Id: <20201211170812.228643-10-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This allows allocating areas after the (old) EOF as part of a growing
resize, writing zeroes, and discarding.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027190600.192171-6-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c | 84 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 92d2f50bcc..0b9d226b2f 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -521,6 +521,89 @@ static void fuse_write(fuse_req_t req, fuse_ino_t inode, const char *buf,
     }
 }
 
+/**
+ * Let clients perform various fallocate() operations.
+ */
+static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
+                           off_t offset, off_t length,
+                           struct fuse_file_info *fi)
+{
+    FuseExport *exp = fuse_req_userdata(req);
+    int64_t blk_len;
+    int ret;
+
+    if (!exp->writable) {
+        fuse_reply_err(req, EACCES);
+        return;
+    }
+
+    blk_len = blk_getlength(exp->common.blk);
+    if (blk_len < 0) {
+        fuse_reply_err(req, -blk_len);
+        return;
+    }
+
+    if (mode & FALLOC_FL_KEEP_SIZE) {
+        length = MIN(length, blk_len - offset);
+    }
+
+    if (mode & FALLOC_FL_PUNCH_HOLE) {
+        if (!(mode & FALLOC_FL_KEEP_SIZE)) {
+            fuse_reply_err(req, EINVAL);
+            return;
+        }
+
+        do {
+            int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
+
+            ret = blk_pdiscard(exp->common.blk, offset, size);
+            offset += size;
+            length -= size;
+        } while (ret == 0 && length > 0);
+    } else if (mode & FALLOC_FL_ZERO_RANGE) {
+        if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
+            /* No need for zeroes, we are going to write them ourselves */
+            ret = fuse_do_truncate(exp, offset + length, false,
+                                   PREALLOC_MODE_OFF);
+            if (ret < 0) {
+                fuse_reply_err(req, -ret);
+                return;
+            }
+        }
+
+        do {
+            int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
+
+            ret = blk_pwrite_zeroes(exp->common.blk,
+                                    offset, size, 0);
+            offset += size;
+            length -= size;
+        } while (ret == 0 && length > 0);
+    } else if (!mode) {
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
+    } else {
+        ret = -EOPNOTSUPP;
+    }
+
+    fuse_reply_err(req, ret < 0 ? -ret : 0);
+}
+
 /**
  * Let clients fsync the exported image.
  */
@@ -552,6 +635,7 @@ static const struct fuse_lowlevel_ops fuse_ops = {
     .open       = fuse_open,
     .read       = fuse_read,
     .write      = fuse_write,
+    .fallocate  = fuse_fallocate,
     .flush      = fuse_flush,
     .fsync      = fuse_fsync,
 };
-- 
2.29.2


