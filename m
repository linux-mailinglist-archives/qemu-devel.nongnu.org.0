Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998CE39BDD2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:59:05 +0200 (CEST)
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDA0-00006c-L7
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <eb07d6c2e9925788454cfe33d3802e4ffb23ea9a@lizzy.crudebyte.com>)
 id 1lpCpo-0002sg-7N
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:38:12 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <eb07d6c2e9925788454cfe33d3802e4ffb23ea9a@lizzy.crudebyte.com>)
 id 1lpCpj-00045R-Js
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=l47oMoSMNbrULRusWIR736AGGv4CeFqHaRee2bj/oNI=; b=aCuly
 BL5O0hfnOCaPo/wkqW90xYEGwSzDRqPmRD4UbcMEjgi++NWjuPb7OLzcP3clJMqS0ySvBhhVhKdQR
 nX2TZR/n/lLRhq3adBOxy27y5Z9fQM8aJdox/lX/EyuCUynQ6CuT2xUo1geqi31QBItlI0bKZNVCC
 JWD3OeAGEnwRNCCIaVXHoWl93BUhjZQqsvWJ6H2NX6XrbMBGxXEJ/lvivtBRitkL+5p0xnRrIfIPa
 1i2K578jc0sph06RUX8W6GDWDi65hGZUsZ53g9kH/FO6xgCcNBdZlkP7KYu7sYWNmbZ11REmOA9az
 82W0rZXn5a86cIkMa9aOkrrM1v2eQ==;
Message-Id: <eb07d6c2e9925788454cfe33d3802e4ffb23ea9a.1622821729.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 27 May 2021 19:04:11 +0200
Subject: [PATCH v2 3/7] 9pfs: capture root stat
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=eb07d6c2e9925788454cfe33d3802e4ffb23ea9a@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

We already capture the QID of the exported 9p root path, i.e. to
prevent client access outside the defined, exported filesystem's tree.
This is currently checked by comparing the root QID with another FID's
QID.

The problem with the latter is that resolving a QID of any given 9p path
can only be done on 9p server's main thread, that's because it might
mutate the server's state if inode remapping is enabled.

For that reason also capture the POSIX stat info of the root path for
being able to identify on any (e.g. worker) thread whether an
arbitrary given path is identical to the export root.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 10 +++++++++-
 hw/9pfs/9p.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index e10a02f71d..eb15ec2082 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1400,6 +1400,7 @@ static void coroutine_fn v9fs_attach(void *opaque)
     size_t offset = 7;
     V9fsQID qid;
     ssize_t err;
+    struct stat stbuf;
 
     v9fs_string_init(&uname);
     v9fs_string_init(&aname);
@@ -1422,7 +1423,13 @@ static void coroutine_fn v9fs_attach(void *opaque)
         clunk_fid(s, fid);
         goto out;
     }
-    err = fid_to_qid(pdu, fidp, &qid);
+    err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
+    if (err < 0) {
+        err = -EINVAL;
+        clunk_fid(s, fid);
+        goto out;
+    }
+    err = stat_to_qid(pdu, &stbuf, &qid);
     if (err < 0) {
         err = -EINVAL;
         clunk_fid(s, fid);
@@ -1455,6 +1462,7 @@ static void coroutine_fn v9fs_attach(void *opaque)
     err += offset;
 
     memcpy(&s->root_qid, &qid, sizeof(qid));
+    memcpy(&s->root_st, &stbuf, sizeof(stbuf));
     trace_v9fs_attach_return(pdu->tag, pdu->id,
                              qid.type, qid.version, qid.path);
 out:
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 00381591ff..6f0b4c78c0 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -356,6 +356,7 @@ struct V9fsState {
     Error *migration_blocker;
     V9fsConf fsconf;
     V9fsQID root_qid;
+    struct stat root_st;
     dev_t dev_id;
     struct qht qpd_table;
     struct qht qpp_table;
-- 
2.20.1


