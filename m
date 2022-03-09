Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635E4D39FE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:20:01 +0100 (CET)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1qq-0007Ny-ME
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:20:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1ad002a1fbc2f8e48384673b0545a164afff7ce9@lizzy.crudebyte.com>)
 id 1nS1n6-0004se-J7
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:16:08 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:56463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1ad002a1fbc2f8e48384673b0545a164afff7ce9@lizzy.crudebyte.com>)
 id 1nS1n2-000523-CQ
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=eLRL2ELWGCP4lVOogFRJlNjrIZCxYBFRPJLcd96ZEzo=; b=dmN/S
 zxStZWf8ub9QgMrkqg7OE5Vyz4O42USJ8sIO/a8nz4FdjQL5g1OplVcba7TfqEJULg2MxKy/YOIdv
 a5AM3F8IrVIbInkxFbZhKpyYWRfq9dMqpdszzL/p04+AiJQa1Y3j5iytERIQq4KNFNzrjf0tmd2r3
 e3tykw+9BwmMuqxt5/ePcu4lcb7vnP/BxnW4/AGqh8HFHnOQewasK7/LbiKld2h1C3FKujAaG6hrE
 yYGLdHiFeGqJHiJd/fvDn4lS4M6U4eQA+SvvPthzymgN0OI/yEQt0ZB1lSz9XwYzRjFhZfp6Lg1Na
 rUn9/gR5+rIlDgHxAVJQJvFhYgsUg==;
Message-Id: <1ad002a1fbc2f8e48384673b0545a164afff7ce9.1646850707.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 9 Mar 2022 18:57:39 +0100
Subject: [PATCH 5/6] 9pfs: fix 'Twalk' to only send error if no component
 walked
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1ad002a1fbc2f8e48384673b0545a164afff7ce9@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current implementation of 'Twalk' request handling always sends an 'Rerror'
response if any error occured. The 9p2000 protocol spec sais though:

  "
  If the first element cannot be walked for any reason, Rerror is returned.
  Otherwise, the walk will return an Rwalk message containing nwqid qids
  corresponding, in order, to the files that are visited by the nwqid
  successful elementwise walks; nwqid is therefore either nwname or the index
  of the first elementwise walk that failed.
  "

  http://ericvh.github.io/9p-rfc/rfc9p2000.html#anchor33

For that reason we are no longer leaving from an error path in function
v9fs_walk(), unless really no path component could be walked successfully or
if the request has been interrupted.

Local variable 'nvalid' counts and reflects the number of path components
successfully processed by background I/O thread, whereas local variable
'name_idx' subsequently counts and reflects the number of path components
eventually accepted successfully by 9p server controller portion.

New local variable 'any_err' is an aggregate variable reflecting whether any
error occurred at all, while already existing variable 'err' only reflects
the last error.

Despite QIDs being delivered to client in a more relaxed way now, it is
important to note though that fid still must remain uneffacted if any error
occurred.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 6cdc566866..8ccd180608 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
 {
     int name_idx, nvalid;
     g_autofree V9fsQID *qids = NULL;
-    int i, err = 0;
+    int i, err = 0, any_err = 0;
     V9fsPath dpath, path;
     P9ARRAY_REF(V9fsPath) pathes = NULL;
     uint16_t nwnames;
@@ -1832,6 +1832,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
      * driver code altogether inside the following block.
      */
     v9fs_co_run_in_worker({
+        nvalid = 0;
         if (v9fs_request_cancelled(pdu)) {
             err = -EINTR;
             break;
@@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
             break;
         }
         stbuf = fidst;
-        for (nvalid = 0; nvalid < nwnames; nvalid++) {
+        for (; nvalid < nwnames; nvalid++) {
             if (v9fs_request_cancelled(pdu)) {
                 err = -EINTR;
                 break;
@@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
     /*
      * Handle all the rest of this Twalk request on main thread ...
      */
-    if (err < 0) {
+    if ((err < 0 && !nvalid) || err == -EINTR) {
         goto out;
     }
 
+    any_err |= err;
     err = stat_to_qid(pdu, &fidst, &qid);
-    if (err < 0) {
+    if (err < 0 && !nvalid) {
         goto out;
     }
     stbuf = fidst;
@@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void *opaque)
     v9fs_path_copy(&dpath, &fidp->path);
     v9fs_path_copy(&path, &fidp->path);
 
-    for (name_idx = 0; name_idx < nwnames; name_idx++) {
+    for (name_idx = 0; name_idx < nvalid; name_idx++) {
         if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
             strcmp("..", wnames[name_idx].data))
         {
             stbuf = stbufs[name_idx];
             err = stat_to_qid(pdu, &stbuf, &qid);
             if (err < 0) {
-                goto out;
+                break;
             }
             v9fs_path_copy(&path, &pathes[name_idx]);
             v9fs_path_copy(&dpath, &path);
         }
         memcpy(&qids[name_idx], &qid, sizeof(qid));
     }
+    any_err |= err;
+    if (any_err) {
+        if (!name_idx) {
+            /* don't send any QIDs, send Rlerror instead */
+            goto out;
+        } else {
+            /* send QIDs (not Rlerror), but fid MUST remain unaffected */
+            goto send_qids;
+        }
+    }
     if (fid == newfid) {
         if (fidp->fid_type != P9_FID_NONE) {
             err = -EINVAL;
@@ -1919,8 +1931,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
         newfidp->uid = fidp->uid;
         v9fs_path_copy(&newfidp->path, &path);
     }
-    err = v9fs_walk_marshal(pdu, nwnames, qids);
-    trace_v9fs_walk_return(pdu->tag, pdu->id, nwnames, qids);
+send_qids:
+    err = v9fs_walk_marshal(pdu, name_idx, qids);
+    trace_v9fs_walk_return(pdu->tag, pdu->id, name_idx, qids);
 out:
     put_fid(pdu, fidp);
     if (newfidp) {
-- 
2.30.2


