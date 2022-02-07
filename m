Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E351F4AC68D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:57:14 +0100 (CET)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7KD-0002Nw-H0
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71c-0001wP-Ea; Mon, 07 Feb 2022 11:38:01 -0500
Received: from [2a01:111:f400:7e1b::708] (port=37729
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71Z-0005HI-2X; Mon, 07 Feb 2022 11:38:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZJD8vqfJHxTx6IQYGExJ+RhEbAvqTMcm7VKO79GrICFIlRU2/eeZ5MGO/mICCm8Hms3ftiui1FoO+KGoH3sU8muMX4RgU23sFgAoylJA1CSxfgteDb+Hq96QcBWIovUjVEn45073nQ533msh4C/b+zfa4M5gYgloiA5d6Q3zK8xQy6/WEfGVvJtr0odA9jeueBj+6cBh4Rj3eF5uQA7QC4M18XSb3LVenI4OvQkNcYukWdzTa256UVkxU3+UeluFzrrxAolc5LUNxjYHTvrIiCTnVaxxcm2LibrDjWcIAeX/+tqaWX/c3B2iPwmUvv3unvdddUzDgo98gQXU5b9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/qrTksJY1xRlLtzEuVEraV2yLKM3ZHATY/b1TP3yJo=;
 b=JYCjgbZkrGby2oXrpWIrRVcB/LgkT6fLbGMI/e2aQhj2WQJRaJuhEZq1+uVAAWDsZcnH+P2VK6fVECHwx1JCQaj4v/lGXIGdC1gYzrcGlBrkBBku+L+UoRruEt8+T2pAzWyDUpTRyh886Vok3itCe04XyVgBaVqL7zo424UkQO1vSK6fz77JVYKpFNvDJbVvRw6D2hUHtTmjIC7LnLNq8XJKOT1+v7dofAYfb442eLHSfIkIvIVS7ICc96r71WvsUNX61bDVNbPBQR3c6FPzMCxORX8vZl5W697lOGC7YalMLV6pi36sonPm2MISKyCk8tpK7c95R0O62fyW/4hr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/qrTksJY1xRlLtzEuVEraV2yLKM3ZHATY/b1TP3yJo=;
 b=Ai2drIpo4uk646tCNXtzwVBCYkKOmSScMFeLccLiFMJ6VYkgVK4y4Jnhj7zKUTpF1eZDixYkDtMNNwrct4+JTjA1kf54dlvCeYRxd9e+nco5XjmEoVqP2NsXIhL86AQQUS+2JzLwXXIEVZYtJIqeqZ5Hw8dDR8Xxz4ntnmByqlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:42 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 08/14] qapi/block-core: add 'force' argument to blockdev-del
Date: Mon,  7 Feb 2022 17:37:22 +0100
Message-Id: <20220207163728.30362-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ed3fd8-3e46-479d-f500-08d9ea5828fd
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22887A0FF40D116E3DEDBA01C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Adgm7Ecb52sKHyKvloS5hOKb2Tb9NS4LkhRPej4qeWipZzvuFJwrCqiyZY7LPC/e+XM5PwGKL0PBGrNCL8Mkxn1dTInoWtgljZhtZn2uhuM2DA2eWql12ktjsMgDCLYAsHAIwLfHIu+HUilGLsNUtpLEza5gm56gy+ChzXmb0rU+WYN9Q68fOJ5iQ+b3mZmdsPv8BcK6eIUd5qc8mGvIwW+EkJLdgbCqXxcrMScgykxllJPJ5xGbH7egj2S6xiwZ7sQXg8sfnjgwbkIcsUNk3Bv+5wyVDjeweuCyXoOEjQOsz9jrPYWYDMEHjBJvCwhRwrw/CbabTL+iwTxwowxU1t81nLBTbrSZzSl/aV/Ps+QeZhbPbgh55TiVaGuAk1Ugkn7zJpTs2PM+Utq8wCR8cGpR+hMCB4cu5qev8AbCinyOmbfaUgXs4aem+1FyUaAX5oEQZlhIHbEhoihCdVfREOoYfWr8wBgSK6IDnElwGobnjq7iNNFyv16+KqP0GVdJNP1F5ZfaKUZU50aG1SFktmg3WJBGQDgsYWXT/OMINw0j+Xbwp9LX5AODXFDXOrsH5NeIHEXTYYnVUnzN3MiSM8QA+si3UiP2ovK0swmov8xLb1p8HvBVuog1+sa8jNHc6IGlPrZJWxKRCFbpXy8Adq8i4x7arZHcAYcNxahX5zbXAZHTYa8g70IaYfgHwQpxUOwbAuH1G2YzIp1N0Kl8GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kt4f1kMd+KOtnWHM20zWITE+UxL9w2jmBDUA3TGB5lSyeLVjul9LG3jh/jD5?=
 =?us-ascii?Q?1nvFk5C19bE/i9YcDpSLCb6rZVMubDiTCGtK7NFMOgWKDj+BWjUc2EzacO7p?=
 =?us-ascii?Q?/hFZP3yJRgnRHOQA2Mqi+pYgrCCSErcptCtmd8au6QNVIPccKj1UsJ88EDwF?=
 =?us-ascii?Q?kaAKqXrLQrBXF/efzOYvhY1IgQXzb/CANmcYmT4QW7ISHZrXPl6uhnsvfod1?=
 =?us-ascii?Q?sIMU5msgbBJofUIk5B7vz5mREuvJGspAYVEatWbNYUNnq/Ejd5mUHEXDlNX5?=
 =?us-ascii?Q?DD69h+BZMBG1xUSacw2F3AgN+raSNxOhqakTNssg1KxI7xOdr9zxt05x39E0?=
 =?us-ascii?Q?bHjTa0KOhjKmqa/fEdxEwsH3QSbfyHsbZMlaXrZxiZdscsNC6RX5uHHgtVKE?=
 =?us-ascii?Q?MnqKfPYKcMUv13Jq8ev+PL0gmJttbagWw+edCKBQXqBPLLrEvFNeUdt4s4+R?=
 =?us-ascii?Q?Y/XKov9wjDbQBXWDszN1NcM+L8Hg6nCnV01RkU+C/g39UsO0c/1dUh+qBrap?=
 =?us-ascii?Q?J6hLDe1sHk1WhpTWG3uP5/m97GyaV1Xm7Ok6NvD5j/AhWN/pqOnPFliA81Cu?=
 =?us-ascii?Q?Kayv5YSh1erKX+ChaAD/YbjEY0SwhMu1iD69bIGLNxXReQ0b2okRKYvF86ti?=
 =?us-ascii?Q?kb/LwHbQ0f8dbugNVzyW5nIdS/Vtyd6sfORtZw4v1OQoXc7NtVtg44qSyOTQ?=
 =?us-ascii?Q?6dJD1YEIu10Ick4Le96ApNo0bGsqqyJR8E05Ssuy5+/CWSXQYwbSXjVVDaoU?=
 =?us-ascii?Q?P1DZO3f+PxUO68+JM+1Tf+m4lzVGvZzcgW67bLOfDjPRHpGTo+tvjd5BmMfQ?=
 =?us-ascii?Q?C8e8jsexU39wwz+J9gR0FMkUt0O/qsx7aGZYQEjUyM8ckKOkayRW2+ww11Lq?=
 =?us-ascii?Q?VPK2ua2NWFCbsk1SmiTJYqUHazKYg1ddSRUx9vJjHQhtreUZ6hr5EtiDoJAa?=
 =?us-ascii?Q?8A/9FjtbyCqDJk7kPGJRPbcqnBrgVOfaLr6U6EK3lU555kyBA6Re0Paa+WYy?=
 =?us-ascii?Q?yLCJsO56lD4ZLbxGzWulHwi6h4y/6RCgc+15XFlpuklcR2/PgTpi5ZQpfB/c?=
 =?us-ascii?Q?vXlVEN9K6m68xVb8bxJQ3yXAjcEteHQrFMHoJWxH1p5fzH4baP9DY3vxzVzp?=
 =?us-ascii?Q?seRu4TnJDsUo7OPN1cnUA900pmKBbvVLpl8susyiACiujLhULWQAUngbffy7?=
 =?us-ascii?Q?bAqEuz8VtUjcmsoSRitgm25u5QpykwyUbDEP2kilRWl5F0X9qTG3Tosxyspp?=
 =?us-ascii?Q?7rruVShLLssEPCMEEHUvw++rJ3oDEB7iTHkji3PkqQxXDgfp+XsodO1xWfp/?=
 =?us-ascii?Q?j6fkQZ493v5qnqBzZeygO1U9QS0KaGUfr0+Blbk47JWeLEZZftWaVK5IPbIU?=
 =?us-ascii?Q?bM05CbN6+jqY+vpy7sUXmfPVg9gxryNaXT0WZoVVj81iByALkTA//FIlk2ZC?=
 =?us-ascii?Q?Wn3mWwxYQPYlmAqYVlCbf3nMUY7nJovqmKP78ZjC+PKCQ7kVSFXSMqjXNioQ?=
 =?us-ascii?Q?FvKDUozvmNYt5PLYdlOAJZGA0JjrN5KeCDkAYQNHIhu3oSIeMNcs7VlTiKp/?=
 =?us-ascii?Q?OZeUmJ31sRQvLtQ3WLHHJeuRsJ5Lcj7NBv8wG/p0lWB5eovxz9unCfapMszg?=
 =?us-ascii?Q?mrXvwl+E/ovRN6Iugk8/1QtUfdI2D7BYEXt5R9KBYLkINQP4e0IDvW245pBr?=
 =?us-ascii?Q?vGqYzw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ed3fd8-3e46-479d-f500-08d9ea5828fd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:41.6482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlU5HDiD2+G3SrQIEFlaViC+xk6xNn6T23NKYfL75GekZJL+xRtBYjhSpelMSd1gsaR1tcc9unbM+rKC5GkM9lrjgcuewyhU7p214lUeAfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Default behavior is force=true and it's unchanged. New behavior is
force=false, which makes it possible to be sure that node removal is
done successfully with no error and all metadata is stored and flushed
successfully.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json           |  6 +++++-
 block/monitor/block-hmp-cmds.c |  2 +-
 blockdev.c                     | 17 +++++++++++++++--
 hw/block/xen-block.c           |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..b37d195772 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4403,6 +4403,9 @@
 #
 # @node-name: Name of the graph node to delete.
 #
+# @force: Ignore failures when closing block-nodes, like failed IO
+#         when try to store metadata. Default true. (Since 7.0)
+#
 # Since: 2.9
 #
 # Example:
@@ -4425,7 +4428,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' } }
+{ 'command': 'blockdev-del',
+  'data': { 'node-name': 'str', '*force': 'bool' } }
 
 ##
 # @BlockdevCreateOptionsFile:
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index bfb3c043a0..1c35aa2d6f 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -145,7 +145,7 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
 
     bs = bdrv_find_node(id);
     if (bs) {
-        qmp_blockdev_del(id, &local_err);
+        qmp_blockdev_del(id, true, true, &local_err);
         if (local_err) {
             error_report_err(local_err);
         }
diff --git a/blockdev.c b/blockdev.c
index 8197165bb5..34a195b592 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3582,11 +3582,17 @@ fail:
     g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
 }
 
-void qmp_blockdev_del(const char *node_name, Error **errp)
+void qmp_blockdev_del(const char *node_name, bool has_force,
+                      bool force, Error **errp)
 {
     AioContext *aio_context;
     BlockDriverState *bs;
 
+    if (!has_force) {
+        /* Historical default is force remove */
+        force = true;
+    }
+
     bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
@@ -3616,7 +3622,14 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
     }
 
     QTAILQ_REMOVE(&monitor_bdrv_states, bs, monitor_list);
-    bdrv_unref(bs);
+    if (force) {
+        bdrv_unref(bs);
+    } else {
+        int ret = bdrv_try_unref(bs, errp);
+        if (ret < 0) {
+            bdrv_set_monitor_owned(bs);
+        }
+    }
 
 out:
     aio_context_release(aio_context);
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 674953f1ad..0ac9b599c0 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -649,7 +649,7 @@ static void xen_block_blockdev_del(const char *node_name, Error **errp)
 {
     trace_xen_block_blockdev_del(node_name);
 
-    qmp_blockdev_del(node_name, errp);
+    qmp_blockdev_del(node_name, true, true, errp);
 }
 
 static char *xen_block_blockdev_add(const char *id, QDict *qdict,
-- 
2.31.1


