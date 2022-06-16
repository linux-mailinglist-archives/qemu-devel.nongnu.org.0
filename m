Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F10754DFCE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:13:00 +0200 (CEST)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nQo-000288-Jw
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a93d2e89e59e67ac5796679fdcef9467e6b2cc55@lizzy.crudebyte.com>)
 id 1o1nLs-0007NE-UH
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:54 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a93d2e89e59e67ac5796679fdcef9467e6b2cc55@lizzy.crudebyte.com>)
 id 1o1nLq-0003KO-ED
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=kqagmhT5Hnxzs3s87xAOx4b5O/RWU8vgFLM+v23qnNQ=; b=J8v50
 2CipeToLxQlriKspx6EjxgC49IGaVoHJ6Tbb2sP4bSph5Rq4LUR3vs3m1n8bkHOCfx9eerdqxVnon
 kCIuJACx38xHnCCFdCIFAlsYmQM9EbnQXEKe6I42+Dx6h7Q7WJGnuL+lnubAA03BmeDNVxig3H2nH
 HXLjrL7LNd2/vUMb6wH3XtSxZcclm8RW1SDChNagGkCr24zaOtHt7vNX3SH7a5lMYYAMqLjdfcr0v
 u/8aXpw8YJjeYlBnzlNgKNMNLpb1PVeqo5PuGFt/zujFl0rEvDExg4RvcnQK0eSDJepYonwjHavuC
 38EZDOae2UaDInI7eH0nLVWmaC+lA==;
Message-Id: <a93d2e89e59e67ac5796679fdcef9467e6b2cc55.1655377203.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1655377203.git.qemu_oss@crudebyte.com>
References: <cover.1655377203.git.qemu_oss@crudebyte.com>
Date: Thu, 16 Jun 2022 13:00:04 +0200
Subject: [PULL 5/7] 9pfs: fix 'Twalk' to only send error if no component walked
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a93d2e89e59e67ac5796679fdcef9467e6b2cc55@lizzy.crudebyte.com;
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
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From:  Christian Schoenebeck via <qemu-devel@nongnu.org>

Current implementation of 'Twalk' request handling always sends an 'Rerror'
response if any error occured. The 9p2000 protocol spec says though:

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

Local variable 'nwalked' counts and reflects the number of path components
successfully processed by background I/O thread, whereas local variable
'name_idx' subsequently counts and reflects the number of path components
eventually accepted successfully by 9p server controller portion.

New local variable 'any_err' is an aggregate variable reflecting whether any
error occurred at all, while already existing variable 'err' only reflects
the last error.

Despite QIDs being delivered to client in a more relaxed way now, it is
important to note though that fid still must remain unaffected if any error
occurred.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <bc73e24258a75dc29458024c7936c8a036c3eac5.1647339025.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 49 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index f29611e9ed..aebadeaa03 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1768,7 +1768,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
 {
     int name_idx, nwalked;
     g_autofree V9fsQID *qids = NULL;
-    int i, err = 0;
+    int i, err = 0, any_err = 0;
     V9fsPath dpath, path;
     P9ARRAY_REF(V9fsPath) pathes = NULL;
     uint16_t nwnames;
@@ -1834,19 +1834,20 @@ static void coroutine_fn v9fs_walk(void *opaque)
      * driver code altogether inside the following block.
      */
     v9fs_co_run_in_worker({
+        nwalked = 0;
         if (v9fs_request_cancelled(pdu)) {
-            err = -EINTR;
+            any_err |= err = -EINTR;
             break;
         }
         err = s->ops->lstat(&s->ctx, &dpath, &fidst);
         if (err < 0) {
-            err = -errno;
+            any_err |= err = -errno;
             break;
         }
         stbuf = fidst;
-        for (nwalked = 0; nwalked < nwnames; nwalked++) {
+        for (; nwalked < nwnames; nwalked++) {
             if (v9fs_request_cancelled(pdu)) {
-                err = -EINTR;
+                any_err |= err = -EINTR;
                 break;
             }
             if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
@@ -1856,16 +1857,16 @@ static void coroutine_fn v9fs_walk(void *opaque)
                                            wnames[nwalked].data,
                                            &pathes[nwalked]);
                 if (err < 0) {
-                    err = -errno;
+                    any_err |= err = -errno;
                     break;
                 }
                 if (v9fs_request_cancelled(pdu)) {
-                    err = -EINTR;
+                    any_err |= err = -EINTR;
                     break;
                 }
                 err = s->ops->lstat(&s->ctx, &pathes[nwalked], &stbuf);
                 if (err < 0) {
-                    err = -errno;
+                    any_err |= err = -errno;
                     break;
                 }
                 stbufs[nwalked] = stbuf;
@@ -1875,13 +1876,19 @@ static void coroutine_fn v9fs_walk(void *opaque)
     });
     /*
      * Handle all the rest of this Twalk request on main thread ...
+     *
+     * NOTE: -EINTR is an exception where we deviate from the protocol spec
+     * and simply send a (R)Lerror response instead of bothering to assemble
+     * a (deducted) Rwalk response; because -EINTR is always the result of a
+     * Tflush request, so client would no longer wait for a response in this
+     * case anyway.
      */
-    if (err < 0) {
+    if ((err < 0 && !nwalked) || err == -EINTR) {
         goto out;
     }
 
-    err = stat_to_qid(pdu, &fidst, &qid);
-    if (err < 0) {
+    any_err |= err = stat_to_qid(pdu, &fidst, &qid);
+    if (err < 0 && !nwalked) {
         goto out;
     }
     stbuf = fidst;
@@ -1890,20 +1897,29 @@ static void coroutine_fn v9fs_walk(void *opaque)
     v9fs_path_copy(&dpath, &fidp->path);
     v9fs_path_copy(&path, &fidp->path);
 
-    for (name_idx = 0; name_idx < nwnames; name_idx++) {
+    for (name_idx = 0; name_idx < nwalked; name_idx++) {
         if (!same_stat_id(&pdu->s->root_st, &stbuf) ||
             strcmp("..", wnames[name_idx].data))
         {
             stbuf = stbufs[name_idx];
-            err = stat_to_qid(pdu, &stbuf, &qid);
+            any_err |= err = stat_to_qid(pdu, &stbuf, &qid);
             if (err < 0) {
-                goto out;
+                break;
             }
             v9fs_path_copy(&path, &pathes[name_idx]);
             v9fs_path_copy(&dpath, &path);
         }
         memcpy(&qids[name_idx], &qid, sizeof(qid));
     }
+    if (any_err < 0) {
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
@@ -1921,8 +1937,9 @@ static void coroutine_fn v9fs_walk(void *opaque)
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


