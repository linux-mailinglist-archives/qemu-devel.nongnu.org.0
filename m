Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4704EBECB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:32:10 +0200 (CEST)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVcX-0000OB-Oo
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:32:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJa-0002Nz-7Q; Wed, 30 Mar 2022 06:12:35 -0400
Received: from smtp46.i.mail.ru ([94.100.177.106]:49652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJW-0007ys-EQ; Wed, 30 Mar 2022 06:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=4397ABXghFoiL3x/cD4TRRTL4MTMgCQ51ouotWgxFdY=; 
 t=1648635150;x=1649240550; 
 b=Il1s8hX734wOkxDfOwtzzrxht40wPJppvZaAkh8V0jm8IGytMMTc2PzcBh1xE204ZiVZ9/wBuNwvncBoyQnLfBgqYsw70mGcyIS8LKoo0OqIpe5jzBVqPQoAW3ZaBJGr8wRMVEo0RZtAEZB2PZeHw74SB2PIkY/YAizZtXoDEcfxcmP94asU1M8CpdSp/SQfU5oq0b93slVDLG0W6aTG4Bf/EJkNaIaeErKeXLugTAHNppnWktxmkaqbcatazSd7+4zQ6TgOsa0Ocbu4/ZXRswAP3cmINEbc1/BP9+zyO6/YwzOLbY/FORyYAHVuSyzqaufPAdHwMpR3dNzJZ1JFLQ==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZVJT-00048P-69; Wed, 30 Mar 2022 13:12:27 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 41/45] iotests.py: introduce VM.assert_edges_list() method
Date: Wed, 30 Mar 2022 13:12:13 +0300
Message-Id: <20220330101217.4229-3-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp46.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B938925D3E27DC8DF54108C85627168217338E05E3556DF6F75083F157FA65ABDB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A8325FA649D0A450EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374D4854EC7C9372F88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83ACABCE5049A7772CDFC24316346298F6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74F330F0740BBDD1F9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B6FC43C45D3E35E8FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC2D8F21B06ECDFCE73AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063789940BDBDF8BFEC0D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F6736582285900E6157739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F5FE7F73E811A2BD70FB801E5B13DDCC1E9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344A2E3AE0A8792E694F38FBBF1058A1B4CBB56892D403D5D7DCDA3F927C57AEEECDA33CE919A5EDB51D7E09C32AA3244C987489CAF5164E887AF1A9B2704DB0135595C85A795C7BAE83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+UtyKRavZiNuQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEF59FC8FC90DF386964EF6E210062E6CC48A2D76722F86E2EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.106;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp46.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an alternative method to check block graph, to be used in further
commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 tests/qemu-iotests/iotests.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 02601162d6..933e354822 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -920,6 +920,23 @@ def check_bitmap_status(self, node_name, bitmap_name, fields):
 
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
2.35.1


