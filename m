Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEE84ED070
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:53:27 +0200 (CEST)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi7y-0000iB-Sg
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:53:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft8-0008IE-Se
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: from [2a00:1450:4864:20::129] (port=35416
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft3-0003NZ-Rr
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:58 -0400
Received: by mail-lf1-x129.google.com with SMTP id h7so38098258lfl.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgttVq7XsJvG6HYwqmkVhSUZyE4JOHmqbHIrKyk8iZY=;
 b=1tB9aVn4P7TBIdX1oe9uRO22zJrI06PievC8n456rtQCyxO0M1iAB2OslVrKB9NjoK
 PdYFvMPyTuk8Pa+uBK6bbzOx8DqpDk1O6tNi51SCeIbJK8H/jaA0Q/MQG3+WGYCsI2Er
 MJl0PaoIz/CejHW4rcRIum0yB1nkE0T/YCtvBhVr2U8rz7T9brsBFu0pIBaQ1XhGJgHv
 m2pLCKbuWYULRsLRQdwu1O7peKpfWkk6IIutMrAOh1tdKS4mU4kOzOTDLqfEUW1vv3Jh
 bFOMmYwdsM8/uhGelF7jI8HkVR3ItAj7AUhlV0Un3egadEX+sbY7ztkgQ2FqPaEC5mjB
 0pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgttVq7XsJvG6HYwqmkVhSUZyE4JOHmqbHIrKyk8iZY=;
 b=kjQ29AmNxdQt54dDaiEIv7sfo7ZpivVLm+mlaAKLwun1ca346SVJNl38L5HO2rOFWb
 1t3DJYLhG5oEpos7jUJMFJZlnnsv+x8+jJqY9QXuWTrcN3U05+0ezujTDbeQU8dscy5e
 ctdGNVFVyIHqnC9Zm5XaOf5Ingt5S8jrM4EgpG37do3rAm6MlLQSE0oCF8DD23tIC+a+
 3E6G6CADDQ/2JZxjQ3fLO4dBX3RNV9Of6gZhvSnekJQgJyYYVkKaHQMrifItFbZ7QNY5
 uNnYeFLzK5vPiQoVg1ePXqdGZZPaMPyDbbjBQ2y+mv1qTC43YWSv0wq1HAIFkaUIMfzU
 JoAw==
X-Gm-Message-State: AOAM533aZtpJrl3gUzUuIcWxJfuWEwSi9fAaYISVaSrAjNNRhfrQHYuY
 Xiz51i6K1ooEc2iJz4ZVa8VKXQ==
X-Google-Smtp-Source: ABdhPJzyS+aV4doppuCZPN5BMgVxVpldW9VbUkco0pCDDhBZ5EHEKvxrlAIDqD+FYo+Uvexzv7Hbew==
X-Received: by 2002:a05:6512:25a:b0:44a:3f55:1746 with SMTP id
 b26-20020a056512025a00b0044a3f551746mr8245061lfo.122.1648675791455; 
 Wed, 30 Mar 2022 14:29:51 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:51 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 32/45] iotests: add blockdev-add-transaction
Date: Thu, 31 Mar 2022 00:28:49 +0300
Message-Id: <20220330212902.590099-33-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x129.google.com
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

Add a test for transaction support of blockdev-add.

Test is format-agnostic, so limit it to qcow2 to avoid extra test runs.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 .../tests/blockdev-add-transaction            | 52 +++++++++++++++++++
 .../tests/blockdev-add-transaction.out        |  6 +++
 2 files changed, 58 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/blockdev-add-transaction
 create mode 100644 tests/qemu-iotests/tests/blockdev-add-transaction.out

diff --git a/tests/qemu-iotests/tests/blockdev-add-transaction b/tests/qemu-iotests/tests/blockdev-add-transaction
new file mode 100755
index 0000000000..ce3c1c069b
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-add-transaction
@@ -0,0 +1,52 @@
+#!/usr/bin/env python3
+#
+# Test blockdev-add transaction action
+#
+# Copyright (c) 2022 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import iotests
+from iotests import log
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+with iotests.VM() as vm:
+    vm.launch()
+
+    # Use same node-name for nodes, neither one should appear.
+    vm.qmp_log('transaction', actions=[
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}},
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}}
+    ])
+
+    n = len(vm.qmp('query-named-block-nodes')['return'])
+    log(f'Created {n} nodes')
+
+    vm.qmp_log('transaction', actions=[
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}},
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node1', 'driver': 'null-co',
+                  'size': 1024 * 1024}}
+    ])
+
+    n = len(vm.qmp('query-named-block-nodes')['return'])
+    log(f'Created {n} nodes')
diff --git a/tests/qemu-iotests/tests/blockdev-add-transaction.out b/tests/qemu-iotests/tests/blockdev-add-transaction.out
new file mode 100644
index 0000000000..7e6cd5a9a3
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-add-transaction.out
@@ -0,0 +1,6 @@
+{"execute": "transaction", "arguments": {"actions": [{"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}, {"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}]}}
+{"error": {"class": "GenericError", "desc": "Duplicate nodes with node-name='node0'"}}
+Created 0 nodes
+{"execute": "transaction", "arguments": {"actions": [{"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}, {"data": {"driver": "null-co", "node-name": "node1", "size": 1048576}, "type": "blockdev-add"}]}}
+{"return": {}}
+Created 2 nodes
-- 
2.35.1


