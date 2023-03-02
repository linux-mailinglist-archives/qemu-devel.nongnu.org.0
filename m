Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F756A8629
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:20:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlfB-00063h-Oo; Thu, 02 Mar 2023 11:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlf6-0005rK-Mr
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:20:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlf4-0001K9-0o
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYN329bJ7ibLK+t2XJFb42rTpmxv73ale4cqgW7vI+w=;
 b=iblHcKgPD5Q1DwTdSkfkuJN5zmDvAA7V8/1l8hmGyvp0tjpcBoArunok5HE7zvQl88FvgI
 shyIbVU3G9jTqZshL9s/tujGhAGR8KvTdpaT9qGRgF572SKZPqMqSnizwiRgXncYFGP2li
 TcHW9AqQwfnzkkXnDS0Fb2SGdlxtidM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-W50ra_6_Pki9VqQKh5wT7w-1; Thu, 02 Mar 2023 11:20:03 -0500
X-MC-Unique: W50ra_6_Pki9VqQKh5wT7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D4B28027FD
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:20:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4E3540C6EC4;
 Thu,  2 Mar 2023 16:20:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/2] test-vmstate: fix bad GTree usage, use-after-free
Date: Thu,  2 Mar 2023 17:19:58 +0100
Message-Id: <20230302161959.9844-2-quintela@redhat.com>
In-Reply-To: <20230302161959.9844-1-quintela@redhat.com>
References: <20230302161959.9844-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eric Auger <eric.auger@redhat.com>

According to g_tree_foreach() documentation:
"The tree may not be modified while iterating over it (you can't
add/remove items)."

compare_trees()/diff_tree() fail to respect this rule.
Historically GLib2 used a slice allocator for the GTree APIs
which did not immediately release the memory back to the system
allocator. As a result QEMU's use-after-free bug was not visible.
With GLib > 2.75.3 however, GLib2 has switched to using malloc
and now a SIGSEGV can be observed while running test-vmstate.

Get rid of the node removal within the tree traversal. Also
check the trees have the same number of nodes before the actual
diff.

Fixes: 9a85e4b8f6 ("migration: Support gtree migration")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1518
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Richard W.M. Jones <rjones@redhat.com>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/unit/test-vmstate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index 79357b29ca..0b7d5ecd68 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -1073,7 +1073,6 @@ static gboolean diff_tree(gpointer key, gpointer value, gpointer data)
     struct match_node_data d = {tp->tree2, key, value};
 
     g_tree_foreach(tp->tree2, tp->match_node, &d);
-    g_tree_remove(tp->tree1, key);
     return false;
 }
 
@@ -1082,9 +1081,9 @@ static void compare_trees(GTree *tree1, GTree *tree2,
 {
     struct tree_cmp_data tp = {tree1, tree2, function};
 
+    assert(g_tree_nnodes(tree1) == g_tree_nnodes(tree2));
     g_tree_foreach(tree1, diff_tree, &tp);
-    assert(g_tree_nnodes(tree1) == 0);
-    assert(g_tree_nnodes(tree2) == 0);
+    g_tree_destroy(g_tree_ref(tree1));
 }
 
 static void diff_domain(TestGTreeDomain *d1, TestGTreeDomain *d2)
-- 
2.39.2


