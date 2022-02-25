Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91454C5247
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:50:55 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkMQ-0007JB-Ri
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFa-0006u1-At; Fri, 25 Feb 2022 18:43:50 -0500
Received: from [2a01:111:f400:fe02::720] (port=38968
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFY-0005i5-BC; Fri, 25 Feb 2022 18:43:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iK519DbCmwia5sKMDMuUudLjRfkNtdwLw8JCEVWzSXdfJjhtdS/RYVS10w+2mZCw5VTojnwcgCT0igms+VEg6IZFJx9m1sFHvpevolIFsT4R4z6/EoNigT2sGNDkOrlN8OhjfzakVGW8bhkReQumpWjP7jzvircG/fwz3J7+P2PL9qY8H8UMyaTXoM+AjJrKMKXo8gbsYZTPgoGQhke2eboivdXssRqBBj+6l82kkM21xtG74rggwR3FOt7So9RiPEoZ24KYU4xaiT4JdoXwryw30RiNtuth+dU/GBXm+vMHSYQu4oFbUUQE/y9JSWfB3LI8JncZtj1UpaCvMnKb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCGYcxrw5WThQzdVJG6nsrIqn/8W3u6pxS50aD81kLA=;
 b=JogEqUnPC9+XBA2TWfyGm6fTt5sl3M+3qsyrPEkBxv31LkCrhWY7Tlp1QJiw0u6JalSE1AvIcxPx5EU7KSX7Tq9Md0ajNc1b5CUbhVEkCtlpImLmuKMKGJ74yRsysofQ0tEkrxkgeIn7TQBlIAJPfGvPMMdKKeko8tnn8SELIXzQECfj7YUg7+rpsJT2RLdzqAPK/V2QSDv1OhqwiHUdjGPg+LFYLfb9B/CVQYwgz5ZnsLyXcQqlvCd3Byo2aCqVkoot1rlKvHUj1Bp6bfn2fKSuwZlFcBN14GY4FxjoUWbPP9I+3DRma4N/MzbdaMs12B3CvP3kic2fErZFX6Vhfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCGYcxrw5WThQzdVJG6nsrIqn/8W3u6pxS50aD81kLA=;
 b=RDRIRqx+OCHJrvTC10/ZABqDg3/82/4PqiW1a9uJfch/JBrPQ3n2O7HM4Vb79NY/R0H4MmqcA4o4jT8Gl75VUJlvGlsWn2hMiRzMq+Tgjw7krzyJATBtwZ0gQiBIhftXxYwJ41a2wtKgRK1whXThE6alijgBcgW1h0qJqunhjd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 05/11] qapi: add x-blockdev-replace command
Date: Sat, 26 Feb 2022 00:43:02 +0100
Message-Id: <20220225234308.1754763-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9147b8a1-faef-4e4e-15c2-08d9f8b8a5ef
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB41720F6580230ACB83A67A85C13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wy59rUT3EIcAqt+5WzkX9sluJgQPiPuzypp8R4gMXJjf7vDANhppYmkXOpOInXcM8U37tK0bqop5805xflIY6UtITPN2YogeOXbw8PIHbsCpaLelzKR5wVa5/THYyvYBkiZ/yaYXJj7svcxtyLCxaS5oUCwcOfieETZwM9QpoHH05Il8vLXI1AcdTuHz6tti2CAJDabQOfmvpgYDW8iM2aE5WFcR+HqrrguC2SJUFkM+bCv4hRqntStTNjwC7JKb0EXf0bz2NbnniFUFfwodABSRs9OgnUA0jZy88c6Spng89u57NYzleo8vwkvr17qX/wo3PNcMFGMzp8aO1o7kPCUu8adhQ3tI1eHM5dEBm3g6CcYPu/FyElMc1/Wp6T8sdfkGqZzspMxusGAznd+Z5rImTgjkUMbKEcgirn/7dXTZ7RcVL0uwnXFQ5fChbvirOE2FjWTTkpP5g2pBjk75wWpn4l66ZS0rpIdvWz5W4AxrQeMt3g35qWD2QAAy7PQ+FTWFzuxJFoKbmDW7dO9lJUuuJmUzCdAR77pTbGi1N5qyCKzGhHUi+OCwUNkrE3iGDMzkVHZtgh2EIyjZnZvgaJulfpdNOYyy5lQOzPDZqExCe0RYhCeWppGQoK4SMkZyPG+4gpMajetu/f7iwk0fwlR9OxdBe+FDD1536sz1UoQdGXALct9/iRh3t57Du/4zytFxvvKa4V8zCbk4ybfapA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WRgi3XRD5e7Kz4z52q4E65sN5Ifi0tKI0PCTmdOM68Ie9Lp0SH7j8ZbpJqU?=
 =?us-ascii?Q?BP5HNwHNixnTWtZpmEA3EHfWhIHjQOu9BUaz1Ia22Jo57hQwN4gwz0UFe107?=
 =?us-ascii?Q?isrylz/nsQacIF/lOD2Y3ld4dZhejCVjpbMuPnTm92YSzzrbZ/AiTvG0lMVP?=
 =?us-ascii?Q?H4YoWznFNJk8k3VXjjPZ/2+FkYk2xZbpFffE1dw1HMxzYNqTD7xX+ElYlhg/?=
 =?us-ascii?Q?3ROgRSaZoNJy6thOgXftPEfPhfbHUjeThxtB5Y+Kzpk6bvBpNarYf9maEbJb?=
 =?us-ascii?Q?KYazOIWowz6aY0UJT7GwzC6raGlxAoPCWQ/6grss/cwPOvjKc88gotihp9ij?=
 =?us-ascii?Q?HwTz0JZ9ryU1n30d9SwXOjnGHEMEgqraeVrP0uAF3X0JlNisHKrXGl7wKuEn?=
 =?us-ascii?Q?SykDWiR+SSd8FrO3342Qc5V9s9TxcQoKQEgjH0pFPOhTFq5ArfJFuymxJEsy?=
 =?us-ascii?Q?c6o30BuI79I/46L44zWpFcAhGI4+GRJjefDftk1lLzVuWiFjmcRz4F3BGvUX?=
 =?us-ascii?Q?K0/ncMUWYS7EvkEDbwwT4j8M/+cz1jK1Xdr83hxITrgOI4zd7BuyQiBfno99?=
 =?us-ascii?Q?SjMTwR0kVo6XUn7OuC8kPsAtVvvYeEpXf8hYzk0U7ocVPvkXH27cjCR5ysVM?=
 =?us-ascii?Q?az1X7FvGrU1asaNpUNnRrdCLwCdVtSHMrwe1PvcSoy5S0zqroJRN6ViFsJYw?=
 =?us-ascii?Q?AttxkGchCPgUV2QQiym5awxE7+SrONkYdGivBr7gfa1tUEONUejI+7G7xm0d?=
 =?us-ascii?Q?1OM6u++13WJDPJUc8gyPlZ+3eZaVldD04USgINVLl9EiCdX9NQWUq3aWk+yk?=
 =?us-ascii?Q?IiZaxidX/Q/e+2czaxTVLVRxSoV4TiiNBdheHmIQCGVSYtgg7sx1QN6L4A/3?=
 =?us-ascii?Q?GBll+H+zz/jdCae2+mzLluQTAxMroDZyMZbBoe4okaESuANcMQX6pmnlEDQk?=
 =?us-ascii?Q?7W/GWU8SNqhzBZuCoO5FwSTKj93YdxNFMJU83WqvSEeRgIcASLRQTD0E0yZA?=
 =?us-ascii?Q?F4MOA3ptyRDNqfhPtqtl1YX2h91MuxPzYzv/K+HCCO0+60GNSBq6uIPotB7x?=
 =?us-ascii?Q?YwHOiKCi0rLMOi7hdx3z+cwAn/ddDbIa4OdDAp5Xja75qdwB6hb2BtzyZksf?=
 =?us-ascii?Q?vbQCs6IOB06RAod5DVP7HCXg4RQJS8fH7aP1wRy94gyLXPCrd40dsvXW4xBk?=
 =?us-ascii?Q?Nub4/Epo5gJdrNHSyHq7DllBr24pfX4zxYeGec5dVZDJwciQJNlZvaLIVV0/?=
 =?us-ascii?Q?qZPckmCRwUVjp4nMIhwp9hEn1YlV2BbngX4x05++J3uB+kch3ln+1v6+4jTI?=
 =?us-ascii?Q?oqNLeEeBAVViFSHJ6WwnQl2AOLgJB9Vr0ahhXEsMAiCvqWcquiTsNYpUC0/H?=
 =?us-ascii?Q?UO6wXzGvEmFRHFWnzG9q3yGcy8thBRemCRb6xgmjnFaVJoNSfuNqCqdsYqBW?=
 =?us-ascii?Q?h4Ddr3BUC3iBFVezH72hpxNT1U/LgDZrVkVbeayYDJ65nw2Hb69aTcYsRs/N?=
 =?us-ascii?Q?jHZ/bicA7FcJssCocpyv6Z0H5PP+YS0/bVxNf4joX+pnteTEj/e3Y9+ZNLVN?=
 =?us-ascii?Q?ubwtixLV1S6a25SfLTUAWtgn6R3ZPStv3Vwtadw6tdRUrwDkE+3x+gb2PuM/?=
 =?us-ascii?Q?OATYyTBhDcMf8BKffNgp2ENKYXBlUtKRWzfLyp07PstFOFReED7rNd886SRD?=
 =?us-ascii?Q?uPiV9A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9147b8a1-faef-4e4e-15c2-08d9f8b8a5ef
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:39.9663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DytduTaBRl8tfr6gcfsJspzBIorwNaKQ3KEX28+KNLDX83j7F48EK9wPTt/6BVdbC3tglGOs5svxJGj2ACusPXHpC31I4hOXN4Xk4ft4/JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::720
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::720;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 qapi/block-core.json   | 62 ++++++++++++++++++++++++++++++++++++++++
 blockdev.c             | 65 ++++++++++++++++++++++++++++++++++++++++++
 stubs/blk-by-qdev-id.c |  9 ++++++
 stubs/meson.build      |  1 +
 4 files changed, 137 insertions(+)
 create mode 100644 stubs/blk-by-qdev-id.c

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..f760dc21f5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5574,3 +5574,65 @@
 { 'command': 'blockdev-snapshot-delete-internal-sync',
   'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
   'returns': 'SnapshotInfo' }
+
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
diff --git a/blockdev.c b/blockdev.c
index d20963be2a..9fd1783be2 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2229,6 +2229,71 @@ static void blockdev_add_abort(BlkActionState *common)
     bdrv_unref(s->bs);
 }
 
+static int blockdev_replace(BlockdevReplace *repl, Transaction *tran,
+                            Error **errp)
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
+            return -EINVAL;
+        }
+
+        child = bdrv_find_child(parent_bs, repl->u.driver.child);
+        if (!child) {
+            error_setg(errp, "Block driver node '%s' doesn't have child "
+                       "named '%s'", repl->u.driver.node_name,
+                       repl->u.driver.child);
+            return -EINVAL;
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
+            return -EINVAL;
+        }
+
+        child = blk_root(blk);
+        if (!child) {
+            error_setg(errp, "%s '%s' is empty, nothing to replace",
+                       is_qdev ? "Device" : "Export", id);
+            return -EINVAL;
+        }
+    }
+
+    assert(child);
+    assert(child->bs);
+
+    new_child_bs = bdrv_find_node(repl->new_child);
+    if (!new_child_bs) {
+        error_setg(errp, "Node '%s' not found", repl->new_child);
+        return -EINVAL;
+    }
+
+    return bdrv_replace_child_bs(child, new_child_bs, tran, errp);
+}
+
+void qmp_x_blockdev_replace(BlockdevReplace *repl, Error **errp)
+{
+    Transaction *tran = tran_new();
+    int ret = blockdev_replace(repl, tran, errp);
+
+    tran_finalize(tran, ret);
+}
+
 static const BlkActionOps actions[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
diff --git a/stubs/blk-by-qdev-id.c b/stubs/blk-by-qdev-id.c
new file mode 100644
index 0000000000..0e751ce4f7
--- /dev/null
+++ b/stubs/blk-by-qdev-id.c
@@ -0,0 +1,9 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "sysemu/block-backend.h"
+
+BlockBackend *blk_by_qdev_id(const char *id, Error **errp)
+{
+    error_setg(errp, "blk '%s' not found", id);
+    return NULL;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index d359cbe1ad..90358823fc 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -1,6 +1,7 @@
 stub_ss.add(files('bdrv-next-monitor-owned.c'))
 stub_ss.add(files('blk-commit-all.c'))
 stub_ss.add(files('blk-exp-close-all.c'))
+stub_ss.add(files('blk-by-qdev-id.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
-- 
2.31.1


