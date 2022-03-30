Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3804ED07B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:59:16 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiDb-0007OA-ET
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:59:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftC-0008MI-V0
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:06 -0400
Received: from [2a00:1450:4864:20::242] (port=45936
 helo=mail-lj1-x242.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft8-0003RK-RG
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:02 -0400
Received: by mail-lj1-x242.google.com with SMTP id q14so29438816ljc.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yr3IicjiIzijKvaPUL3NuAuXiYMFVz8a7w4vV+d+wDU=;
 b=Kyy0AmzPX+CiOtwW9Ym1aTiHBgIrjObwW7mFNqiHcyCS0of4dbK2ghmJqBwKM1ShnN
 v8QpR6FTpi6aL8brAI0YHMbTR37JhuZGwDEqDF9ycemAgz0uVwn/XKSEaFicTQiy9n3A
 xKz/lhF7HtEpadgqevryb2xgx9gtXKrr+mQXhDnfEjW7JhRflMXobxRyC7yj7BLD4e/I
 mKHsK+BW+rwasEsT3qPlOV6M1RlJ8NvxFLe8Ja8siPWWAnQDklTO+tTiLJ92xClOEXc6
 ZwZ60Ud9OV1n0IIqeUg/W6ttI4YPgb2OawVifz8yTwmllTnPs2RkAnJS5ldFq21EE0T9
 et5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yr3IicjiIzijKvaPUL3NuAuXiYMFVz8a7w4vV+d+wDU=;
 b=6oXK40BdSe3PkQZ6dvT5CehTU45Gvq0wZkWL+FnGItRnEPQuxOm+3qrXsgMxtCfhNr
 Ga5JZe+lRCCiMSGdueHXFemM7h/0yk+BIuE3ZxKeQIvVA/hiraq8KoWauKa53FajGmIo
 cMO1MqBEgD8PYtp3Qaxh0Rf5nFrwx2yegNYQX3rRtNavvsFaT174aSWwK4VE37yTpPDy
 tEMtq+lXyCn2aMhU5aDGu+h2xcfvyqPLUslvL7pfwKra0pY4MYjxA1D67Ci1HoWxGdNY
 Xkt5dZ/6iGT73VPdik0rPIvtlMqz9qAxxOzqT+mQq/NEI3GtKIAB4MSSeuHFiamyHtIH
 cUlA==
X-Gm-Message-State: AOAM5332lHJL+DgbvFVF3YKq2oMidphWtQlsM0UZC2bG6G/+pPMS/6ba
 239ramXHlZavNEcCr2z/wEeS2g==
X-Google-Smtp-Source: ABdhPJw1yTT1NxyGriDvexrBOhU8H4eateD99qx1yPTAKFdiBpaq80hJk5+Jini5E/CCL7cAoV7YGg==
X-Received: by 2002:a2e:bf05:0:b0:247:b233:cfba with SMTP id
 c5-20020a2ebf05000000b00247b233cfbamr8154556ljr.131.1648675797105; 
 Wed, 30 Mar 2022 14:29:57 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:56 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 41/45] iotests.py: introduce VM.assert_edges_list() method
Date: Thu, 31 Mar 2022 00:28:58 +0300
Message-Id: <20220330212902.590099-42-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::242
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x242.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an alternative method to check block graph, to be used in further
commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/iotests.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index c7a38a95a4..aaa77b5105 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1084,6 +1084,23 @@ def check_bitmap_status(self, node_name, bitmap_name, fields):
 
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


