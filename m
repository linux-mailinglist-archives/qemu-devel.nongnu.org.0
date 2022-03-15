Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F1B4D9E33
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:56:24 +0100 (CET)
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8b1-00044m-Bc
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:56:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU8NJ-0000IT-5x
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nU8NG-0001SA-5A
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647355329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLfyluImzysLOPkiTvJo2zm+5FjLUH+6CI5H86s0TvU=;
 b=ecU5cn1IeJEN1gDeWdDHbhPMfYRpsynxHupflWz/KdXRMt72xjS2R94qcSgJe8SDIg1ogk
 YwBoutLWoVCZuQ36Qpm/SIa3PxMdMcSqDiA3RsqL5NurXVLXHlh0l8jbJAAA1YEn475KJf
 LrJN4zpNIvMOrI7/ZQfyLxGcjuUvaYQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-B7jc6o2xM2CidF8CYWCU4w-1; Tue, 15 Mar 2022 10:42:01 -0400
X-MC-Unique: B7jc6o2xM2CidF8CYWCU4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA65E10184A3;
 Tue, 15 Mar 2022 14:41:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E64E540FF40A;
 Tue, 15 Mar 2022 14:41:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C792F21D1F57; Tue, 15 Mar 2022 15:41:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] 9pfs: Use g_new() & friends where that makes obvious
 sense
Date: Tue, 15 Mar 2022 15:41:55 +0100
Message-Id: <20220315144156.1595462-3-armbru@redhat.com>
In-Reply-To: <20220315144156.1595462-1-armbru@redhat.com>
References: <20220315144156.1595462-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>
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


