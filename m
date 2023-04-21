Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B06EA976
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:42:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppp99-0006xn-8x; Fri, 21 Apr 2023 07:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8u-0006mf-Cd; Fri, 21 Apr 2023 07:41:33 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8s-0001HL-OX; Fri, 21 Apr 2023 07:41:32 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 4516E61965;
 Fri, 21 Apr 2023 14:41:22 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 3fdrVT1OnCg0-Puvb34Bs; Fri, 21 Apr 2023 14:41:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682077281; bh=fDyWzxUnkejgaTPlhVdraFKY1+bzlYe8s7QSj4Rp7wo=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=d76fKiSVYfFd9MjKycjjChY2kFkoe9iQLjnuA9y7e2nWVITKkRDk9l9GJ7ISCZWZ7
 Bk669Zl0BtzVTgoN3F49EDJ4v8L+NL4rWNWmRgICfTmkPxt8IL02+Ihi1rbQPo1OP6
 jag1Mr0ixRCPkSB2ie4aTZv2rhxszExGhKWLdapQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 alexander.ivanov@virtuozzo.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v7 6/7] iotests.py: introduce VM.assert_edges_list() method
Date: Fri, 21 Apr 2023 14:41:01 +0300
Message-Id: <20230421114102.884457-7-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421114102.884457-1-vsementsov@yandex-team.ru>
References: <20230421114102.884457-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add an alternative method to check block graph, to be used in further
commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/iotests.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 3e82c634cf..3ff172e409 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1092,6 +1092,23 @@ def check_bitmap_status(self, node_name, bitmap_name, fields):
 
         return fields.items() <= ret.items()
 
+    def get_block_graph(self):
+        """
+        Returns block graph in form of edges list, where each edge is a tuple:
+          (parent_node_name, child_name, child_node_name)
+        """
+        graph = self.qmp('x-debug-query-block-graph')['return']
+
+        nodes = {n['id']: n['name'] for n in graph['nodes']}
+        # Check that all names are unique:
+        assert len(set(nodes.values())) == len(nodes)
+
+        return [(nodes[e['parent']], e['name'], nodes[e['child']])
+                for e in graph['edges']]
+
+    def assert_edges_list(self, edges):
+        assert sorted(edges) == sorted(self.get_block_graph())
+
     def assert_block_path(self, root, path, expected_node, graph=None):
         """
         Check whether the node under the given path in the block graph
-- 
2.34.1


