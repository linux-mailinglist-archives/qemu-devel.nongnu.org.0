Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8147D4DC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:08:21 +0100 (CET)
Received: from localhost ([::1]:46772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04A8-0001D7-Iy
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:08:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045Q-00055g-HC; Wed, 22 Dec 2021 11:03:28 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:2823 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045O-00043n-W2; Wed, 22 Dec 2021 11:03:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYDKKGwUQy4GJHfFm1kojgBcG1cgfp/tQQ5iZb7IdKmDej4+aBPam1/6E6FOaMgzHgcXz+th37wEhrH/1CsWUfp64On2KuuVGGBMQ+WG/5o1htHsO1FQyyJiQAkeAde2hvEQalzzuMtV4Y3ShHiI/KNAQPQYu2P5XWlDD67HbJG8ufzSW9vjWJUsNq7KBaVQDupaGCY66MWbWmGFMpiMBCpmFcS0px2ClCQwiq8uHd3qEHoJtGJjYv2TRAYUr8FnzYItjsnW56AyHeq6FvVtT8VHkb/l5bZBJ+YCgZkaSK/0WcBOhIUhwqsn9s+U3GSncVW+8upvtMju+7dPwZl2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/tzf8w/tyinpFYKIYCHh45b2/3cCpNwt+6WfE9kBAU=;
 b=hdJtzV12YnUMYXqSDJwmporX7ObEPaHYhNWSfc5JaEe/eBaHaYoQmHajpNOPtqSHL+BxkUGppANPBffSFz9YWd3blXDToDhCmOXTNbskE3ojC4zLOkmvAb5KdVat0RjHybesUUK5xLGPEpmZSlXMvYFw5eh8JwuywQR/51ssXzZ5dFa6lDoksdgDArub092RuuuwRHu/m1gigBxVwp0mVqu9TFf1+E/MJH5+rX3Yonybh57w+QtcylPS2jYsKSX0gTo7ljwpIgLYR08G7CZoceBVlKLYHQlhizfqcZAnkfHwhu2RJDwsZFMM0RK1hJPu3pjxOsnOVP5/3FqZrLkC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/tzf8w/tyinpFYKIYCHh45b2/3cCpNwt+6WfE9kBAU=;
 b=T7p6ThYYWXIMJ06/1mlNGDVHCfy70g6sKkJ6520sC+uqOrrFNHxH8bpOFBFpdwupAcAXhLEX4Qxrg/xavBTv9iTNA/mJuZKo/P6AZ/oOrL11Z+7xL9qRO/Z99H19sCduWog6x2o6tXE0rz4C8PJFEME9AvEWRGi04vWb7d7CDoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 16:03:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Wed, 22 Dec 2021
 16:03:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v2 4/4] qapi: add blockdev-replace command
Date: Wed, 22 Dec 2021 17:02:54 +0100
Message-Id: <20211222160254.226909-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222160254.226909-1-vsementsov@virtuozzo.com>
References: <20211222160254.226909-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0070.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::47) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53a2c510-b39f-497d-d3ae-08d9c5648e8a
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148D8DE5E3C997E724FFDE6C17D9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JukFvGf7fmJzpyKpNdgS3YjzQ+/8SvIAMyjB/0y2bU+yHKrrpCqoUDU5LNiy9kXIWL6W+ZV+nwJAwytkpXupWbuIxpfam8fnGCo6pIUPdC8EZGoZ40vLrZOJO+gkYY2b9WguflktMA5tCV/Br8y2Hh+xF2TptE9QHRoJ7e65XE8eJVdhzP7QBVWuSXWOvGPBJJR8Bd+OqIf9sglE0uKPNg9tU41YrE699xZ2PKytL4L/CLsXmMZUGf/ozw11P3U0wfP5ADL+buSiy5412xaRzcLn04sVfP13+ntaWj3cYClEyMj+t3FOXXz7reCOqbV/u+FybL3eY1YFPCjZQUadFTYZCFM+Kdmdqk0QKZYKaFsRmaAYPQ7xD5iv3PHABRonAcXDiFj5rNrIoj90bmYGChecaABlWw+cWUsOnUSc5SKPwCmFETnnREZO0DbEfbI5pUjl6fqGCmnwgAiWPn/kWqjZpsRNM9+SRKxCoR5G17fBVETfV6ykAqo4TGojbxbZ+CDp4ZKxPPQ6x3rI52Blj9ZHfSoQ8ETgKsrxqK5bn/k+uoZ+Ik+KulvuN+vuvz4RTYoSbNNKtgN1d9cwYpjJMams/lO/4mPUa/9zha7aaXHjWBSfNTOzeBdrtej7jRhestYu/SukJYwFjLccgnovByMbdHLFpthjNiPR5T8S+IdRPYOgy46MD5LrSDU7lWclRoTdlbm4O6f4xc39jEyUHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(6506007)(316002)(2906002)(6916009)(2616005)(1076003)(5660300002)(83380400001)(6666004)(86362001)(8936002)(6512007)(66476007)(36756003)(6486002)(186003)(26005)(4326008)(8676002)(66556008)(508600001)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?61ee0YgjahY05rsF0ZhIva5WVlkFqB6+kcQumQEcMsdpvb6nPPmnX4hCLkkY?=
 =?us-ascii?Q?u8Japs91g3O1T3Lu62wx5097UfS3A2+Qe3ba23U/eVidAiZOkrj8GMB82oq/?=
 =?us-ascii?Q?rx9Rs9uBjoXyBRyVGSRIiHUd7EXnmJC9CDHuXrqhuWFE+aIs6BqZ7R1vm0eu?=
 =?us-ascii?Q?tdlecjEpBencC5wkTzVPfr2/n/JBQWMhHSYzBfaYn7LD0MzyAEV4JF/sGVoV?=
 =?us-ascii?Q?XL/6jJgjwWD/eN/ZAcznlD4RHZYbQSXAbf5eJhvLsrNjW2d5UYGSOsHeQj8/?=
 =?us-ascii?Q?txfo0cwFRqv3WXI2cHY10aazISem1DMzhHpreb1yVJtGIJAdcNBrHAITz/1S?=
 =?us-ascii?Q?NPtC6yj6QnmOUOdsGqi4sNTfibRLMcg0fPq8le/kFkIXnH/dGrJdupfwfCK/?=
 =?us-ascii?Q?CL97qP9kvU2vfxIZV4pohh2eiVQ7aFbqWJc3ydt5u7dexlVs6pE5FQxyCUxf?=
 =?us-ascii?Q?qGLu1pwgPfpUY5gdglKLgrFy2e+/C6fG4/XpqgvgOg6zM0LbFizjvafslajt?=
 =?us-ascii?Q?XZm4F5h1bbq/lMsMk1E6EBjYYuijfbPs/wMmRwbZFVVAtX7tbTPp+Q/8RcYW?=
 =?us-ascii?Q?IbBTK5h3H4eli4hdvPJfryO1s0eAqgTFP8vIaElXDnl8V1renHa0eQvNLpv0?=
 =?us-ascii?Q?cH8PXiqTQJK8PN/cZc3vFpwobPpO0uo4Z7EpZdlcF9xavnfksUhjm2htRRYB?=
 =?us-ascii?Q?rNObcqM/PbqsAJiak1lKqCs8P2s1cJiOMJ58FzT5ILufn2Du3HBUXBqo8yWO?=
 =?us-ascii?Q?jQgNRfEFlOdiR/aiQZdArvPvUWQmhvI781t8a6A6GbrtPDsrdx3KUNI3De9H?=
 =?us-ascii?Q?SA5hpjuzho3+nVU6tC/r7AlVrhJARxQA567m6n55meI6OcCE8pJn2fmlcjmo?=
 =?us-ascii?Q?gLtDJPI36baBFGEvbnS2tTPySRNZ/o7hac+bQqNoxsC2Yfh8ByBEhh7mTjik?=
 =?us-ascii?Q?l+go+cWtgS7U+Lw5xNjwucdi91y8uXpZNtTHOhy5ktz8y0UYlUrWlfqN5ytC?=
 =?us-ascii?Q?1N/pxA93ye2/WlJPW5IKXNjtTKgpZ5/P23a5xry/861I+/sBNqiN1hJx19Nt?=
 =?us-ascii?Q?4u8Se8aiSUBjOrp3P6iMdu3MNot3XgeYL5jrZnma+Zogvrht91HCEVDONWW4?=
 =?us-ascii?Q?BDZyBSSZbjOXGoucIodZyXqFMpQXKUifppox+82oZNW0kxFDcTBZbqYlyxwu?=
 =?us-ascii?Q?rNQPg6j4U00a9b28/KfB/AdmRTqjNljKpUqpypW1tv16LVQ1NsIkc6Xym8t0?=
 =?us-ascii?Q?GkTSo20CCQx4ok3ABqcA0N9VrXSZ8NTcsu5mY//Ey5YQTLzykWivxX9Obkwv?=
 =?us-ascii?Q?zH8W3Jbwy4RUvuQ8ZAVwAXcrFuO9cMe5HtuYeZL6Gm0vYoXTnzTd1CnOmcbX?=
 =?us-ascii?Q?aVb3bZRnJOR+Q5lodBBZoyTTOO9suypeGckWdg3jg6ocMYpz2xwM+VWf9BOo?=
 =?us-ascii?Q?rlLbvk0/UdqCfzXIxr2KVTjIkY5iuZ46N/lZYdR3GC7Jfp8dpD5LR/ukUKfl?=
 =?us-ascii?Q?3OP2wfBYBy7mGW8A0rNv4Go3/CnBNPQvkHiXd3hH3QuX96Vn5MC+9gsqpvg3?=
 =?us-ascii?Q?ZbW4b+VdMeJrgO1ILv1IoDitsdqh3wQxY94qIf17rT3Zo1Pxjz0KritniYQk?=
 =?us-ascii?Q?fw4RjZGIDGA3VpK0l0qHjy+atpv6q9pUcZn8tlBmSmSmRsibj77hL3GJeosp?=
 =?us-ascii?Q?sZcBb3IZ25UF1MmnsNpsbN53xvU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a2c510-b39f-497d-d3ae-08d9c5648e8a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 16:03:12.9749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzjYA4vDOScfV84XKc/HI+eckm2C7kfL4IevKCOnZzFExhFhxrtgpz7Rcr6BozqE5Oc9dfRcVqUJS1AId0sybASjjXofc4eO7RH8PZDyuZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a command that can replace bs in following BdrvChild structures:

 - qdev blk root child
 - block-export blk root child
 - any child BlockDriverState selected by child-name

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block.json     | 61 +++++++++++++++++++++++++++++++++++++++++++++
 block/qapi-sysemu.c | 56 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/qapi/block.json b/qapi/block.json
index 82fcf2c914..a4dd1e34d4 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -570,3 +570,64 @@
            '*boundaries-read': ['uint64'],
            '*boundaries-write': ['uint64'],
            '*boundaries-flush': ['uint64'] } }
+##
+# @BlockParentType:
+#
+# Since 7.0
+##
+{ 'enum': 'BlockParentType',
+  'data': ['qdev', 'driver', 'export'] }
+
+##
+# @BdrvChildRefQdev:
+#
+# Since 7.0
+##
+{ 'struct': 'BdrvChildRefQdev',
+  'data': { 'qdev-id': 'str' } }
+
+##
+# @BdrvChildRefExport:
+#
+# Since 7.0
+##
+{ 'struct': 'BdrvChildRefExport',
+  'data': { 'export-id': 'str' } }
+
+##
+# @BdrvChildRefDriver:
+#
+# Since 7.0
+##
+{ 'struct': 'BdrvChildRefDriver',
+  'data': { 'node-name': 'str', 'child': 'str' } }
+
+##
+# @BlockdevReplace:
+#
+# Since 7.0
+##
+{ 'union': 'BlockdevReplace',
+  'base': {
+      'parent-type': 'BlockParentType',
+      'new-child': 'str'
+  },
+  'discriminator': 'parent-type',
+  'data': {
+      'qdev': 'BdrvChildRefQdev',
+      'export': 'BdrvChildRefExport',
+      'driver': 'BdrvChildRefDriver'
+  } }
+
+##
+# @x-blockdev-replace:
+#
+# Replace a block-node associated with device (selected by
+# @qdev-id) or with block-export (selected by @export-id) or
+# any child of block-node (selected by @node-name and @child)
+# with @new-child block-node.
+#
+# Since 7.0
+##
+{ 'command': 'x-blockdev-replace', 'boxed': true,
+  'data': 'BlockdevReplace' }
diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
index 8498402ad4..ca1aaef376 100644
--- a/block/qapi-sysemu.c
+++ b/block/qapi-sysemu.c
@@ -588,3 +588,59 @@ void qmp_block_latency_histogram_set(
         }
     }
 }
+
+void qmp_x_blockdev_replace(BlockdevReplace *repl, Error **errp)
+{
+    BdrvChild *child = NULL;
+    BlockDriverState *new_child_bs;
+
+    if (repl->parent_type == BLOCK_PARENT_TYPE_DRIVER) {
+        BlockDriverState *parent_bs;
+
+        parent_bs = bdrv_find_node(repl->u.driver.node_name);
+        if (!parent_bs) {
+            error_setg(errp, "Block driver node with node-name '%s' not "
+                       "found", repl->u.driver.node_name);
+            return;
+        }
+
+        child = bdrv_find_child(parent_bs, repl->u.driver.child);
+        if (!child) {
+            error_setg(errp, "Block driver node '%s' doesn't have child "
+                       "named '%s'", repl->u.driver.node_name,
+                       repl->u.driver.child);
+            return;
+        }
+    } else {
+        /* Other types are similar, they work through blk */
+        BlockBackend *blk;
+        bool is_qdev = repl->parent_type == BLOCK_PARENT_TYPE_QDEV;
+        const char *id =
+            is_qdev ? repl->u.qdev.qdev_id : repl->u.export.export_id;
+
+        assert(is_qdev || repl->parent_type == BLOCK_PARENT_TYPE_EXPORT);
+
+        blk = is_qdev ? blk_by_qdev_id(id, errp) : blk_by_export_id(id, errp);
+        if (!blk) {
+            return;
+        }
+
+        child = blk_root(blk);
+        if (!child) {
+            error_setg(errp, "%s '%s' is empty, nothing to replace",
+                       is_qdev ? "Device" : "Export", id);
+            return;
+        }
+    }
+
+    assert(child);
+    assert(child->bs);
+
+    new_child_bs = bdrv_find_node(repl->new_child);
+    if (!new_child_bs) {
+        error_setg(errp, "Node '%s' not found", repl->new_child);
+        return;
+    }
+
+    bdrv_replace_child_bs(child, new_child_bs, errp);
+}
-- 
2.31.1


