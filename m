Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E348822841B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 17:45:34 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxuST-0002uP-V6
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 11:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxuOz-0006uS-8B
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 11:41:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42404
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jxuOv-0000Kt-A0
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 11:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595346112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AP+cHZ9p9v1kaib6ijpzj845c5fWdLTq624R6eiDzv0=;
 b=JKq3UgrrGsaF/zilDuB7/+5AUYHysqvNgqvMD5j9NH6wZP5n/wjQ81PSGHT15bkVQ7Vo1k
 HmtbknZyYDIcAFIX5uj6U9owEYDqb4XGVCWbsWeAwuDT0bk5AmCDwDw6iod56axd8E4RGN
 4g1kZ8qrAsetC/hpuzDF3qmot2LJk0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-2JzC0WMHP2mYKuXflB8RTQ-1; Tue, 21 Jul 2020 11:41:50 -0400
X-MC-Unique: 2JzC0WMHP2mYKuXflB8RTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E130658;
 Tue, 21 Jul 2020 15:41:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B01F172680;
 Tue, 21 Jul 2020 15:41:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B986107F756; Tue, 21 Jul 2020 17:41:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] qom: Make info qom-tree sort children more efficiently
Date: Tue, 21 Jul 2020 17:41:47 +0200
Message-Id: <20200721154147.1657100-4-armbru@redhat.com>
In-Reply-To: <20200721154147.1657100-1-armbru@redhat.com>
References: <20200721154147.1657100-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 10:20:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit e8c9e65816 "qom: Make "info qom-tree" show children sorted"
sorts children the simple, stupid, quadratic way.  I thought the
number of children would be small enough for this not to matter.  I
was wrong: there are outliers with several hundred children, e.g ARM
machines nuri and smdkc210 each have a node with 513 children.

While n^2 sorting isn't noticeable in normal, human usage even for
n=513, it can be quite noticeable in certain automated tests.  In
particular, the sort made device-introspect-test even slower.  Commit
3e7b80f84d "tests: improve performance of device-introspect-test" just
fixed that by cutting back its excessive use of "info qom-tree".
Sorting more efficiently makes sense regardless, so do it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200714160202.3121879-6-armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 qom/qom-hmp-cmds.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
index 4032c96089..8861a109d5 100644
--- a/qom/qom-hmp-cmds.c
+++ b/qom/qom-hmp-cmds.c
@@ -94,25 +94,23 @@ typedef struct QOMCompositionState {
 
 static void print_qom_composition(Monitor *mon, Object *obj, int indent);
 
-static int qom_composition_compare(const void *a, const void *b, void *ignore)
+static int qom_composition_compare(const void *a, const void *b)
 {
-    return g_strcmp0(object_get_canonical_path_component(a),
-                     object_get_canonical_path_component(b));
+    return g_strcmp0(object_get_canonical_path_component(*(Object **)a),
+                     object_get_canonical_path_component(*(Object **)b));
 }
 
 static int insert_qom_composition_child(Object *obj, void *opaque)
 {
-    GQueue *children = opaque;
-
-    g_queue_insert_sorted(children, obj, qom_composition_compare, NULL);
+    g_array_append_val(opaque, obj);
     return 0;
 }
 
 static void print_qom_composition(Monitor *mon, Object *obj, int indent)
 {
+    GArray *children = g_array_new(false, false, sizeof(Object *));
     const char *name;
-    GQueue children;
-    Object *child;
+    int i;
 
     if (obj == object_get_root()) {
         name = "";
@@ -122,11 +120,14 @@ static void print_qom_composition(Monitor *mon, Object *obj, int indent)
     monitor_printf(mon, "%*s/%s (%s)\n", indent, "", name,
                    object_get_typename(obj));
 
-    g_queue_init(&children);
-    object_child_foreach(obj, insert_qom_composition_child, &children);
-    while ((child = g_queue_pop_head(&children))) {
-        print_qom_composition(mon, child, indent + 2);
+    object_child_foreach(obj, insert_qom_composition_child, children);
+    g_array_sort(children, qom_composition_compare);
+
+    for (i = 0; i < children->len; i++) {
+        print_qom_composition(mon, g_array_index(children, Object *, i),
+                              indent + 2);
     }
+    g_array_free(children, TRUE);
 }
 
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict)
-- 
2.26.2


