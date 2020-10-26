Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE221299622
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 19:56:15 +0100 (CET)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX7fC-0005zf-T0
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 14:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX7TK-0001vW-9F
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 14:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX7TI-0003Zr-Fo
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 14:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603737835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ks0Irnz8eHi/bnIGi5HUdDfgs1llfwLxfRLkOZuL02I=;
 b=Fj2sJ53disYbxZCwtMgYJXyyreZSQWIqxTWFk25q4rR0FulZTz4Yq7QvjVh1KzkYNqJ+SY
 2mIodzKlGfdPmpQlyoKWY6kBviKjrHO4TeDkpMjjZcqXSOSDwnBqR76LT7tLa6wRYZIQlp
 M6mkDixDfPTcLGQ7s8pS77iF8QeLHyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-AJ5gofjWPIewaP-eFd7Tsg-1; Mon, 26 Oct 2020 14:43:52 -0400
X-MC-Unique: AJ5gofjWPIewaP-eFd7Tsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C16C58030DF;
 Mon, 26 Oct 2020 18:43:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-208.ams2.redhat.com
 [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 651E55D9CA;
 Mon, 26 Oct 2020 18:43:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, mreitz@redhat.com,
 misono.tomohiro@jp.fujitsu.com
Subject: [PULL 06/16] tools/virtiofsd: xattr name mappings: Map server xattr
 names
Date: Mon, 26 Oct 2020 18:43:21 +0000
Message-Id: <20201026184331.272953-7-dgilbert@redhat.com>
In-Reply-To: <20201026184331.272953-1-dgilbert@redhat.com>
References: <20201026184331.272953-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, vgoyal@Redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Map xattr names coming from the server, i.e. the host filesystem;
currently this is only from listxattr.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20201023165812.36028-4-dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 90 ++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index cf67737751..8c0187498a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2229,6 +2229,44 @@ static int xattr_map_client(const struct lo_data *lo, const char *client_name,
     return -EPERM;
 }
 
+/*
+ * For use with listxattr where the server fs gives us a name and we may need
+ * to sanitize this for the client.
+ * Returns a pointer to the result in *out_name
+ *   This is always the original string or the current string with some prefix
+ *   removed; no reallocation is done.
+ * Returns 0 on success
+ * Can return -ENODATA to indicate the name should be dropped from the list.
+ */
+static int xattr_map_server(const struct lo_data *lo, const char *server_name,
+                            const char **out_name)
+{
+    size_t i;
+    const char *end;
+
+    for (i = 0; i < lo->xattr_map_nentries; i++) {
+        const XattrMapEntry *cur_entry = lo->xattr_map_list + i;
+
+        if ((cur_entry->flags & XATTR_MAP_FLAG_SERVER) &&
+            (strstart(server_name, cur_entry->prepend, &end))) {
+            if (cur_entry->flags & XATTR_MAP_FLAG_BAD) {
+                return -ENODATA;
+            }
+            if (cur_entry->flags & XATTR_MAP_FLAG_OK) {
+                *out_name = server_name;
+                return 0;
+            }
+            if (cur_entry->flags & XATTR_MAP_FLAG_PREFIX) {
+                /* Remove prefix */
+                *out_name = end;
+                return 0;
+            }
+        }
+    }
+
+    return -ENODATA;
+}
+
 static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         size_t size)
 {
@@ -2383,8 +2421,60 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         if (ret == 0) {
             goto out;
         }
+
+        if (lo->xattr_map_list) {
+            /*
+             * Map the names back, some attributes might be dropped,
+             * some shortened, but not increased, so we shouldn't
+             * run out of room.
+             */
+            size_t out_index, in_index;
+            out_index = 0;
+            in_index = 0;
+            while (in_index < ret) {
+                const char *map_out;
+                char *in_ptr = value + in_index;
+                /* Length of current attribute name */
+                size_t in_len = strlen(value + in_index) + 1;
+
+                int mapret = xattr_map_server(lo, in_ptr, &map_out);
+                if (mapret != -ENODATA && mapret != 0) {
+                    /* Shouldn't happen */
+                    saverr = -mapret;
+                    goto out;
+                }
+                if (mapret == 0) {
+                    /* Either unchanged, or truncated */
+                    size_t out_len;
+                    if (map_out != in_ptr) {
+                        /* +1 copies the NIL */
+                        out_len = strlen(map_out) + 1;
+                    } else {
+                        /* No change */
+                        out_len = in_len;
+                    }
+                    /*
+                     * Move result along, may still be needed for an unchanged
+                     * entry if a previous entry was changed.
+                     */
+                    memmove(value + out_index, map_out, out_len);
+
+                    out_index += out_len;
+                }
+                in_index += in_len;
+            }
+            ret = out_index;
+            if (ret == 0) {
+                goto out;
+            }
+        }
         fuse_reply_buf(req, value, ret);
     } else {
+        /*
+         * xattrmap only ever shortens the result,
+         * so we don't need to do anything clever with the
+         * allocation length here.
+         */
         fuse_reply_xattr(req, ret);
     }
 out_free:
-- 
2.28.0


