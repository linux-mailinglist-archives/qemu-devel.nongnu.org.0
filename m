Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32024D6E9D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 13:11:52 +0100 (CET)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT0b9-0004XZ-Ga
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 07:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <59571e9379c3729ad287a5c7fce8ef4876e7fed5@lizzy.crudebyte.com>)
 id 1nT0Wk-0008FS-RM
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:07:19 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:33789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <59571e9379c3729ad287a5c7fce8ef4876e7fed5@lizzy.crudebyte.com>)
 id 1nT0Wi-0004xt-QT
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 07:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=z5zfah+2g+HGkJfPbXo34H4jpmLgNrYncozy2OvyVn4=; b=Kxvud
 vwWDwLrdzojeJVAzFaghJfriXyoF4peorx6Vzso0W14quoGJOR5aH6NkqKVGZNNeEZfUzprrdw40S
 PfhAONOOMO0+NdTFSHbvMP66ne2bqxH82FiqZP8Z96RcUSW6oNYgsZhkWT+zLfYbUY46hgFJsmOMZ
 LMTpUtdEZUY60fq5YOqDdh9iToWORHJWIL+CVzbJ+diJmqb/95gcPCbtZCuTMTK/zjjzoEm8cqb4t
 eY5/WL+kgQYtYSOYPjwhSDDNtrGVGRHs0PrU9tu3WxQ7jtbLgB1g2w25DPZJtvNeXOq0WKHh/jvun
 u2OrDxXwN6i3/U7Vy3iWjmzcUDxXQ==;
Message-Id: <59571e9379c3729ad287a5c7fce8ef4876e7fed5.1647083430.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1647083430.git.qemu_oss@crudebyte.com>
References: <cover.1647083430.git.qemu_oss@crudebyte.com>
Date: Sat, 12 Mar 2022 12:06:47 +0100
Subject: [PATCH v2 5/7] 9pfs: fix 'Twalk' to only send error if no component
 walked
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=59571e9379c3729ad287a5c7fce8ef4876e7fed5@lizzy.crudebyte.com;
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
---
 hw/9pfs/9p.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 298f4e6548..e8d838f6fd 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1766,7 +1766,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
 {
     int name_idx, nwalked;
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
+        nwalked = 0;
         if (v9fs_request_cancelled(pdu)) {
             err = -EINTR;
             break;
@@ -1842,7 +1843,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
             break;
         }
         stbuf = fidst;
-        for (nwalked = 0; nwalked < nwnames; nwalked++) {
+        for (; nwalked < nwnames; nwalked++) {
             if (v9fs_request_cancelled(pdu)) {
                 err = -EINTR;
                 break;
@@ -1874,12 +1875,13 @@ static void coroutine_fn v9fs_walk(void *opaque)
     /*
      * Handle all the rest of this Twalk request on main thread ...
      */
-    if (err < 0) {
+    if ((err < 0 && !nwalked) || err == -EINTR) {
         goto out;
     }
 
+    any_err |= err;
     err = stat_to_qid(pdu, &fidst, &qid);
-    if (err < 0) {
+    if (err < 0 && !nwalked) {
         goto out;
     }
     stbuf = fidst;
@@ -1888,20 +1890,30 @@ static void coroutine_fn v9fs_walk(void *opaque)
     v9fs_path_copy(&dpath, &fidp->path);
     v9fs_path_copy(&path, &fidp->path);
 
-    for (name_idx = 0; name_idx < nwnames; name_idx++) {
+    for (name_idx = 0; name_idx < nwalked; name_idx++) {
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


