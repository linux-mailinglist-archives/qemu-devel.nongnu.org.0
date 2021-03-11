Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F923378BB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:06:10 +0100 (CET)
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNpB-0003qX-2B
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2d-0003iX-Ty; Thu, 11 Mar 2021 10:15:59 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com
 ([40.107.8.115]:13537 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2S-0001X4-HK; Thu, 11 Mar 2021 10:15:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAG8JhfuV6cyls6B6qe1vBRqkrUrF6fBTrPTUxg1NjHKhIvy/SfDh8Nkpy8EQbZMQIm5SftqnImyRWvPxxkuBd9yHQmLTkGwYIxc9nGolosqGUGiVKDnusinyj48iqT409haGZMuNsFa+uGWLSTVL21dwi+RDw0iNJzTv+NupCGWC+C6vSklQG9F7utTJIDGOxeWHnLBGXSrBiHRkD4oKS2bUW9mzr3GTDK8O5ihJYC7492I9G5qF1WC6UxM1pF3zXVI7j5+JjSN3PSewV10QxclxkfSMlOXWWs3lfChH6CWKnhUe7VOmHog6d5848UI3jmp2/OcUDbNG4UhbLj4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1MYexCjjvee7Inz2DIGd1b+/epnG65l/7a8yRHKGIY=;
 b=nx0bv/p0aVcFbsTBN4+PyFdPFiNJcIHXD+nXotxUaPaMxQc9tXVM0NROO0KNQvkMMV91hsDH2DWI0KPY/ncBboJfh5U/FP1N7ToMT+9AauXNPFHJZAJMS7adZEt1bO3Z5YwP6EtBAT4k+n5S0Yx54wNkYERy7yIRkotSkpL+8UW2SKsHrhmqybvCIBYG8nhzJzxxBJtFcAXcnUp/nDXtH0WqgHujA4YoXszWK8oIdPlOdfj8RD5Ke5c5moJQqhuH66lF8LokjQA03f/UWmJPdLucE0dXPSZRSkEzITK4+rrwmBCdPDBEdYC7cfQmQYABiA0RVJsmYw2z+Qj41xtn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1MYexCjjvee7Inz2DIGd1b+/epnG65l/7a8yRHKGIY=;
 b=X88dpAa35MUg5Q93+3IVG8knK0c/1iXmlhwrGze17iuqGsnIKsDv3gYNUfr7kkuXF3/+S2OIhq5LvT8nOOUoWD72xYCe65z/kQd+4tGQvpuWBYSGfWCzjN18BHoIN7lu760YhbJ7V5BJ2pu4fJJAUtF6eAE7CE9E+T+ylkmqYwo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4407.eurprd08.prod.outlook.com (2603:10a6:20b:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Thu, 11 Mar
 2021 15:15:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 15:15:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH 2/3] block: allow filters to be reopened without
 .bdrv_reopen_prepare
Date: Thu, 11 Mar 2021 18:15:04 +0300
Message-Id: <20210311151505.206534-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311151505.206534-1-vsementsov@virtuozzo.com>
References: <20210311151505.206534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0247.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0247.eurprd05.prod.outlook.com (2603:10a6:3:fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 15:15:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1181d44f-f9bd-484e-4924-08d8e4a0882f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4407:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4407B25AC4CBD6A8A71EA872C1909@AM6PR08MB4407.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4mYple8DAFECq14quHSbSZ9ctBnMMLtg+oFIsk2qByX/YU/7jOhjXa4DOOwadIG4I4SqtigVS/R2kj6CL6VR8rYtCUfrW6NA53yODz4kJmJANwVHgZxQIoiEVy3oexgQrVKMkhjZpxacbe73vXEvncFXsup5JGuVpTvcIe/Gd6KfB5MhBOawYzefFRLRuROz0lCjrRcgaMMA/dha4zBXgHPv7/7wKxu89K+PkzPRb9rXO5W4665u2t3OqiliTQNQP2P1x3OhTBwAuSM9Rrx5r59wwPvzY5YZvSY+453NOLWWGOrMr4Jwq95aHglRwK6fvx0MGp/+hg1UJB29vSMtk4ZHJr+H4zsCfuSd4fYg0zhnJXPasB4BWi3M2wGF0+XdpTL47DmG0HUWTDyhPSUzEJS7/QXlXmEnjX6wSgAW7LS28ZfFO9P7cDW/3nxa0zF/HGnKDYW1eSmbyQTTUuhK/7UdpAk+6ho5fJIki2lYEBO5fXE+Tf7H4b+dyDS7AtpVAJZ/xP24MjxlWxM/Ysi+aVzQcnX7DdhhjYz8iUhmipkfHsve82h/xBUKIyJKzZ5qQPiIOluGi2IYomHpNJnbZOC1K/cU9FlMeAwUZ91SJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(346002)(136003)(376002)(6512007)(4326008)(6506007)(16526019)(36756003)(478600001)(6486002)(107886003)(2616005)(956004)(8936002)(1076003)(6666004)(83380400001)(2906002)(316002)(66946007)(66476007)(26005)(69590400012)(8676002)(66556008)(186003)(52116002)(5660300002)(6916009)(86362001)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kMIYWfEu02hU6GN4firZjxs17ciAe2+FqLMJ0+GtoENHC9aJOD9fC9uazldy?=
 =?us-ascii?Q?pnRxMguCDrPAhRo0S69As8THvh6DTwgclH67tuPKeolO+333UA23cV/UNHxM?=
 =?us-ascii?Q?Tq8wQXLdGXdQpzEoON+eQhEDwP24tOassZRps3qx9+z1b0vB+uUcKQF1J9Al?=
 =?us-ascii?Q?/IdmmDukT60OAcskbScnoPmZqNv1nCN+hYqfEUoDvqKTh2kKT1pJXWRwG2GB?=
 =?us-ascii?Q?eHpsGMynOQnr0L0kDNVR8pxeqNbtV1iBFxPjWwuCNotF9JkweZCbxV4ffQCu?=
 =?us-ascii?Q?j+DYGH2BiorSw+TgFolk61KF1Zf+72GO1+sGIZFJsYa+cHOc7d6RrnN3eFPU?=
 =?us-ascii?Q?jDcH6bVxhb1w3UoO+oUQS9pp1g6rlTJjc6qRDPKawEYq6XXVHqMKrOzaMvLY?=
 =?us-ascii?Q?DlkLtHoOW1erucIE0PlJgxGJHysZYHRTVxGi6DMrNmHXQcxggIi7oYZSrvkf?=
 =?us-ascii?Q?fA8IPNKVHbJ9vH8t9IC64n5iouHO0gkLlZa7YEBMqckSxHqVOt54xygBYUXk?=
 =?us-ascii?Q?ttOCPVAwUn0hI5SMd+p2WfILfh9kd0w63MI8EZK82QaYbbgMcEWYiBDXav83?=
 =?us-ascii?Q?jfnbTVaHM5/+F2A4PcQEi46OjnsDhefYrJHnrlDF5NCb3Oc8TedUdzJH+H7q?=
 =?us-ascii?Q?NVST9DoZYdvGLIJkgjlncb9qRSIJFoYA5F/OcGsgeWpQEfzMe4ZJilgJJD5W?=
 =?us-ascii?Q?ks3jsFFE4LWhcb38uzCyklQv8ZewKV+Nf/rbcph9/RJdEYHOQDsl3VtDyY3B?=
 =?us-ascii?Q?E6ULBEpmGnScvFmYhGtoZE0VtWChVMdVL02AV+T9jXQbZPqPu5j/V18HLMpp?=
 =?us-ascii?Q?NgptCGs11Xeyxt39OGSM0S16qzguznXNtkCrYXRzAgKpmVUrLW1UWCtBnJYT?=
 =?us-ascii?Q?XS6DeG5siPRDt2z27OA1Eo/Q/95TXx5e7XkoeO9gLC1wlElFXuzb1PXkQ+In?=
 =?us-ascii?Q?b2S6mn4krE+/jNZRMYdAB4Stl9HWbep8PaiS/aCuknioUtP/g1b671Fx2jLu?=
 =?us-ascii?Q?ybjN1rYasCiuU8vf0c19AQpc2ozTvbXemgBwECQa2J2cxtH60zvIBr91pygv?=
 =?us-ascii?Q?gG4kfwHa5IYxNvTbQx6bG6GXQsRfZxQgGMdqGhjgs+dS8HKyJMamFZB/XxL4?=
 =?us-ascii?Q?MJkd1cmlM2AyMh3N53kD16Yab7M9prd3vBB8Z1uFR/DJhTa9mVcw4sxtENdi?=
 =?us-ascii?Q?8ljkNTpMbEs6HmPIDd+q3K/zC4S85opDt+Ij2zFq49Jce0jxzxea3rOFMgg2?=
 =?us-ascii?Q?v5EFlISIiNeUwesbqZBX04qaDqnKef3ptZqP7CqLYQ9Q7uLveUHIHYUk4Rvs?=
 =?us-ascii?Q?n81YCHPcFQqwu7LOZ1RjpcLo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1181d44f-f9bd-484e-4924-08d8e4a0882f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 15:15:40.5353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/lF/6W7SAMNUwQZYgdKlsSBlYhcgPg+X4uWqWd/aLEyNFEUT4mU2PbQUgjWWcib+hptDgVM1Y+qhMJOrQjfXxZsRItYbjtaTmUiImWjwbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4407
Received-SPF: pass client-ip=40.107.8.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to drop inherits_from logic, so every child will be
recursively reopened including filters. Let's assume that by default
filters do nothing on reopen prepare.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                | 23 +++++++++++++----------
 tests/qemu-iotests/245 |  5 ++---
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index 2daff6d29a..815396f460 100644
--- a/block.c
+++ b/block.c
@@ -4189,7 +4189,7 @@ int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue *queue,
         goto error;
     }
 
-    if (drv->bdrv_reopen_prepare) {
+    if (drv->bdrv_reopen_prepare || drv->is_filter) {
         /*
          * If a driver-specific option is missing, it means that we
          * should reset it to its default value.
@@ -4201,16 +4201,19 @@ int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue *queue,
             goto error;
         }
 
-        ret = drv->bdrv_reopen_prepare(reopen_state, queue, &local_err);
-        if (ret) {
-            if (local_err != NULL) {
-                error_propagate(errp, local_err);
-            } else {
-                bdrv_refresh_filename(reopen_state->bs);
-                error_setg(errp, "failed while preparing to reopen image '%s'",
-                           reopen_state->bs->filename);
+        if (drv->bdrv_reopen_prepare) {
+            ret = drv->bdrv_reopen_prepare(reopen_state, queue, &local_err);
+            if (ret) {
+                if (local_err != NULL) {
+                    error_propagate(errp, local_err);
+                } else {
+                    bdrv_refresh_filename(reopen_state->bs);
+                    error_setg(errp,
+                               "failed while preparing to reopen image '%s'",
+                               reopen_state->bs->filename);
+                }
+                goto error;
             }
-            goto error;
         }
     } else {
         /* It is currently mandatory to have a bdrv_reopen_prepare()
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 11104b9208..a7c70213dd 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -524,9 +524,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         result = self.vm.qmp('blockdev-add', conv_keys = False, **bvopts)
         self.assert_qmp(result, 'return', {})
 
-        # blkverify doesn't currently allow reopening. TODO: implement this
-        self.reopen(bvopts, {}, "Block format 'blkverify' used by node 'bv'" +
-                    " does not support reopening files")
+        # blkverify allows reopening
+        self.reopen(bvopts, {})
 
         # Illegal: hd0 is a child of the blkverify node
         self.reopen(opts[0], {'backing': 'bv'},
-- 
2.29.2


