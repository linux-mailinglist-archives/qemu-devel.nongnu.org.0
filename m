Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFA343B0C6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:08:02 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKJF-00005T-Dh
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiE-0002uB-W2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfJiC-0004i3-Us
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EHu43tTTcaWc8n3R3hdRpj46zYzBKMmWw9W/cy/01iE=;
 b=IwjZUyuQYwb0g9GU58npVyqj6DC6B9GMRl/fFcYDW+2JERtBFGLLVnRRvQpXZQ7vMKalXa
 6W+vDwt2fDnJ5JhZEetGyT2ZUKbsvaBE1z2nhj/W7RDZoruUOi0aI2/szkgIYnDhDeCeKj
 LqMOOe5bTYdSmt2fBWP6AvudK3EURHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-9rbrWAwDNiyvxd5qgbJkiQ-1; Tue, 26 Oct 2021 06:29:43 -0400
X-MC-Unique: 9rbrWAwDNiyvxd5qgbJkiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53579806693
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:29:40 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AAAB1045E87;
 Tue, 26 Oct 2021 10:29:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] virtiofsd: xattr mapping add a new type "unsupported"
Date: Tue, 26 Oct 2021 11:29:29 +0100
Message-Id: <20211026102933.103139-2-dgilbert@redhat.com>
In-Reply-To: <20211026102933.103139-1-dgilbert@redhat.com>
References: <20211026102933.103139-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Right now for xattr remapping, we support types of "prefix", "ok" or "bad".
Type "bad" returns -EPERM on setxattr and hides xattr in listxattr. For
getxattr, mapping code returns -EPERM but getxattr code converts it to -ENODATA.

I need a new semantics where if an xattr is unsupported, then
getxattr()/setxattr() return -ENOTSUP and listxattr() should hide the xattr.
This is needed to simulate that security.selinux is not supported by
virtiofs filesystem and in that case client falls back to some default
label specified by policy.

So add a new type "unsupported" which returns -ENOTSUP on getxattr() and
setxattr() and hides xattrs in listxattr().

For example, one can use following mapping rule to not support
security.selinux xattr and allow others.

"-o xattrmap=/unsupported/all/security.selinux/security.selinux//ok/all///"

Suggested-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <YUt9qbmgAfCFfg5t@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/tools/virtiofsd.rst         |  6 ++++++
 tools/virtiofsd/passthrough_ll.c | 17 ++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index b208f2a6f0..cc31402830 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -183,6 +183,12 @@ Using ':' as the separator a rule is of the form:
   'ok' as either an explicit terminator or for special handling of certain
   patterns.
 
+- 'unsupported' - If a client tries to use a name matching 'key' it's
+  denied using ENOTSUP; when the server passes an attribute
+  name matching 'prepend' it's hidden.  In many ways it's use is very like
+  'ok' as either an explicit terminator or for special handling of certain
+  patterns.
+
 **key** is a string tested as a prefix on an attribute name originating
 on the client.  It maybe empty in which case a 'client' rule
 will always match on client names.
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 38b2af8599..64b5b4fbb1 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2465,6 +2465,11 @@ static void lo_flock(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
  * Automatically reversed on read
  */
 #define XATTR_MAP_FLAG_PREFIX  (1 <<  2)
+/*
+ * The attribute is unsupported;
+ * ENOTSUP on write, hidden on read.
+ */
+#define XATTR_MAP_FLAG_UNSUPPORTED     (1 <<  3)
 
 /* scopes */
 /* Apply rule to get/set/remove */
@@ -2636,6 +2641,8 @@ static void parse_xattrmap(struct lo_data *lo)
             tmp_entry.flags |= XATTR_MAP_FLAG_OK;
         } else if (strstart(map, "bad", &map)) {
             tmp_entry.flags |= XATTR_MAP_FLAG_BAD;
+        } else if (strstart(map, "unsupported", &map)) {
+            tmp_entry.flags |= XATTR_MAP_FLAG_UNSUPPORTED;
         } else if (strstart(map, "map", &map)) {
             /*
              * map is sugar that adds a number of rules, and must be
@@ -2646,8 +2653,8 @@ static void parse_xattrmap(struct lo_data *lo)
         } else {
             fuse_log(FUSE_LOG_ERR,
                      "%s: Unexpected type;"
-                     "Expecting 'prefix', 'ok', 'bad' or 'map' in rule %zu\n",
-                     __func__, lo->xattr_map_nentries);
+                     "Expecting 'prefix', 'ok', 'bad', 'unsupported' or 'map'"
+                     " in rule %zu\n", __func__, lo->xattr_map_nentries);
             exit(1);
         }
 
@@ -2749,6 +2756,9 @@ static int xattr_map_client(const struct lo_data *lo, const char *client_name,
             if (cur_entry->flags & XATTR_MAP_FLAG_BAD) {
                 return -EPERM;
             }
+            if (cur_entry->flags & XATTR_MAP_FLAG_UNSUPPORTED) {
+                return -ENOTSUP;
+            }
             if (cur_entry->flags & XATTR_MAP_FLAG_OK) {
                 /* Unmodified name */
                 return 0;
@@ -2788,7 +2798,8 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
 
         if ((cur_entry->flags & XATTR_MAP_FLAG_SERVER) &&
             (strstart(server_name, cur_entry->prepend, &end))) {
-            if (cur_entry->flags & XATTR_MAP_FLAG_BAD) {
+            if (cur_entry->flags & XATTR_MAP_FLAG_BAD ||
+                cur_entry->flags & XATTR_MAP_FLAG_UNSUPPORTED) {
                 return -ENODATA;
             }
             if (cur_entry->flags & XATTR_MAP_FLAG_OK) {
-- 
2.31.1


