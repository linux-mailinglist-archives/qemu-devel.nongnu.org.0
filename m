Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E14E2B7D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:09:11 +0100 (CET)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJeg-0002vz-BR
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:09:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJUv-0000JC-II
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:59:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJUt-0006JR-O8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647874738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48ezV2g1RYYm3I9NFq2W9lOOGAKmKUoxMQGK0NrKTaI=;
 b=J+ad/5TGY+7Fk5SyUK8BFxfoEdo6WBh6P6KsKJXQottXhf37iZxKO7nVsxU4I8mpqLSQAG
 9u+Wceaul11KA2xkEGYVJJlnhdZM2a9oYwpHRdNEH2jCe7May6Acwm1MhDih4q8XkGwSny
 3DaT2ud4it3r+FajZkRFhz0Pb9e7CIc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-2bNfOfEHNK-ZkMXjFEquNw-1; Mon, 21 Mar 2022 10:58:55 -0400
X-MC-Unique: 2bNfOfEHNK-ZkMXjFEquNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBAF63835B81;
 Mon, 21 Mar 2022 14:58:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D63840CF8FB;
 Mon, 21 Mar 2022 14:58:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5000121A3F4B; Mon, 21 Mar 2022 15:58:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] 9pfs: Use g_new() & friends where that makes obvious sense
Date: Mon, 21 Mar 2022 15:58:52 +0100
Message-Id: <20220321145853.2523825-4-armbru@redhat.com>
In-Reply-To: <20220321145853.2523825-1-armbru@redhat.com>
References: <20220321145853.2523825-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).

Initial patch created mechanically with:

    $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
	     --macro-file scripts/cocci-macro-file.h FILES...

This uncovers a typing error:

    ../hw/9pfs/9p.c: In function ‘qid_path_fullmap’:
    ../hw/9pfs/9p.c:855:13: error: assignment to ‘QpfEntry *’ from incompatible pointer type ‘QppEntry *’ [-Werror=incompatible-pointer-types]
      855 |         val = g_new0(QppEntry, 1);
	  |             ^

Harmless, because QppEntry is larger than QpfEntry.  Manually fixed to
allocate a QpfEntry instead.

Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220315144156.1595462-3-armbru@redhat.com>
---
 hw/9pfs/9p-proxy.c           | 2 +-
 hw/9pfs/9p-synth.c           | 4 ++--
 hw/9pfs/9p.c                 | 8 ++++----
 hw/9pfs/codir.c              | 6 +++---
 tests/qtest/virtio-9p-test.c | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 8b4b5cf7dc..4c5e0fc217 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -1187,7 +1187,7 @@ static int proxy_parse_opts(QemuOpts *opts, FsDriverEntry *fs, Error **errp)
 
 static int proxy_init(FsContext *ctx, Error **errp)
 {
-    V9fsProxy *proxy = g_malloc(sizeof(V9fsProxy));
+    V9fsProxy *proxy = g_new(V9fsProxy, 1);
     int sock_id;
 
     if (ctx->export_flags & V9FS_PROXY_SOCK_NAME) {
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b3080e415b..d99d263985 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -49,7 +49,7 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *parent, int mode,
 
     /* Add directory type and remove write bits */
     mode = ((mode & 0777) | S_IFDIR) & ~(S_IWUSR | S_IWGRP | S_IWOTH);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     if (attr) {
         /* We are adding .. or . entries */
         node->attr = attr;
@@ -128,7 +128,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     }
     /* Add file type and remove write bits */
     mode = ((mode & 0777) | S_IFREG);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     node->attr         = &node->actual_attr;
     node->attr->inode  = synth_node_count++;
     node->attr->nlink  = 1;
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a6d6b3f835..8e9d4aea73 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -324,7 +324,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
             return NULL;
         }
     }
-    f = g_malloc0(sizeof(V9fsFidState));
+    f = g_new0(V9fsFidState, 1);
     f->fid = fid;
     f->fid_type = P9_FID_NONE;
     f->ref = 1;
@@ -804,7 +804,7 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, dev_t dev)
 
     val = qht_lookup(&pdu->s->qpd_table, &lookup, hash);
     if (!val) {
-        val = g_malloc0(sizeof(QpdEntry));
+        val = g_new0(QpdEntry, 1);
         *val = lookup;
         affix = affixForIndex(pdu->s->qp_affix_next);
         val->prefix_bits = affix.bits;
@@ -852,7 +852,7 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
             return -ENFILE;
         }
 
-        val = g_malloc0(sizeof(QppEntry));
+        val = g_new0(QpfEntry, 1);
         *val = lookup;
 
         /* new unique inode and device combo */
@@ -928,7 +928,7 @@ static int qid_path_suffixmap(V9fsPDU *pdu, const struct stat *stbuf,
             return -ENFILE;
         }
 
-        val = g_malloc0(sizeof(QppEntry));
+        val = g_new0(QppEntry, 1);
         *val = lookup;
 
         /* new unique inode affix and device combo */
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 75148bc985..93ba44fb75 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -141,9 +141,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
 
         /* append next node to result chain */
         if (!e) {
-            *entries = e = g_malloc0(sizeof(V9fsDirEnt));
+            *entries = e = g_new0(V9fsDirEnt, 1);
         } else {
-            e = e->next = g_malloc0(sizeof(V9fsDirEnt));
+            e = e->next = g_new0(V9fsDirEnt, 1);
         }
         e->dent = qemu_dirent_dup(dent);
 
@@ -163,7 +163,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
                 break;
             }
 
-            e->st = g_malloc0(sizeof(struct stat));
+            e->st = g_new0(struct stat, 1);
             memcpy(e->st, &stbuf, sizeof(struct stat));
         }
 
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 01ca076afe..e28c71bd8f 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -468,12 +468,12 @@ static void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
          togo -= 13 + 8 + 1 + 2 + slen, ++n)
     {
         if (!e) {
-            e = g_malloc(sizeof(struct V9fsDirent));
+            e = g_new(struct V9fsDirent, 1);
             if (entries) {
                 *entries = e;
             }
         } else {
-            e = e->next = g_malloc(sizeof(struct V9fsDirent));
+            e = e->next = g_new(struct V9fsDirent, 1);
         }
         e->next = NULL;
         /* qid[13] offset[8] type[1] name[s] */
-- 
2.35.1


