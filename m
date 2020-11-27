Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816AF2C686D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:07:06 +0100 (CET)
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifKz-0000o4-Dx
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1A-0001IG-ND; Fri, 27 Nov 2020 09:46:36 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:28961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif17-0003Ef-Vt; Fri, 27 Nov 2020 09:46:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzpwsfPWcbixsL5XZS+3ykSI2DNOnTC4YF10DkgIkA0WwFvgX7Hidw5f7MKRMUgNXfEskU8+CPpA3qSCDXmgK6VqgZmJRfwmXPtMCwQkPCAy7vdrHx4DgnvzfQDLL0SRTjMjPXeGa4NypWNMz5w12nEZvHF9nrARWVv+yx6unGnvEww7lwBCSSEGcXb93YqMcdRANm5U92sG6rMi/PlWJQUet2SAtpjE1mFa1lVIsBJYdzth3zN5CXuTVi/iuUF0eRlgre0I5m3FsJ1fPi0XEgj/VUIz/6Z57uLMD0m+GZ7Ap+VaRDspmnR6FIid+egRlUqPigWRQCR4yAKU1GciPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YRPusXatcZ/2cnUTTgX7gO6aRBtqcmsjws+q+nBZYo=;
 b=CNFPd8ze3sHD33yv6ZH+wGiU81N8/4bHhL2XXl9qWn2ixSmAwA3RCik/uisO0PdNmIKmqURwEcqWyhlhrU9W603WKJTm+rVGZX/4bM5rZiYzZ5kJ1/8TnbW9yxXus0yguESE5pLWtPGrrlQMz5ou9j6AcHSCe4SYWhNQ2irz5o0+yBoJndic5zyKvw8Nixpw+oISKcZ+iuRkoHVI/e3HuLRPc5q3JJXPbpJMa8p12U4AAOYXq15LprerY3L6pMavpJlZRvPgMftZhs5TBCGiRuvOl1vo1ljjDW6f+mSQ0eg9aJgd39rUCmNbS1c//jkI2e12Gj0l/FaLRuNvMom+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YRPusXatcZ/2cnUTTgX7gO6aRBtqcmsjws+q+nBZYo=;
 b=Rk6IzOehlzX9OaHzrLMUEAni766xBDP+EUvQjWgLIzzc33iAmPU4JR1FbV0RNZyCMU25zlZL8hlB9ZyhZAT9ceL+LZ3JVDsD38ZbZOHgrHL/izCuCPmDvv2HSYafnCXouhA976yYMwG+RH3CyeKQwG35r4Ia9MQubTtnYDLDgb8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 21/36] block: add bdrv_attach_child_noperm() transaction
 action
Date: Fri, 27 Nov 2020 17:45:07 +0300
Message-Id: <20201127144522.29991-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cfb24be-9930-4964-43ce-08d892e323d6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50787660067D24F559751772C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hF3r2DgjK2q25QvYFTIASoGyhozKfQEq3gaOct0DrUNn2nghSN7VOtVW0BodAaTugiEO6npMg9dL8WcjSBZGru8Jvk34RExEqeWBSMrJVbp32Eqq/HDL9eQMUoWfChrGzrjs72NqcJ3UT4y1b2HS7/Pb4qHJsCsafR40qti01gQiq9cbx1yd8fILo6sWGv+Zt9XijqyLf6cG0h++gwxea8qVdoPukrkuhF4mpBKU7Pz8wGimYVug4XMMiXoB0Ie6zedhc2HTQfMntb4bHHHi7ECR/teznhmfbxcfeS90VaUK6uilc4P9p/6abezGdgtDBdbGbLLa+kw0HFizqEuHChinHif5f6XneOXnmGmc3xTkRWFE74P929tiLQ6xKez6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mxA8pPI/vfT3htGtdjsnjVSY9ntiHPclaaTDYd8In+tHSWojWFzRijG6/45T?=
 =?us-ascii?Q?hUqDrbthUVvNVtaqejAgDjs2egQHdOF4H42WWKT12MSUD4Ep8itxnRjgwVL6?=
 =?us-ascii?Q?oUdxkzzcS7r8ThAzSLYOCEttHKTYinqMeC9/iIWktb5oUyFut5tynKtBjEpu?=
 =?us-ascii?Q?DyjPbWfZ73hi3f6nOoUCP1PhLJPpy6IwuCYuB8REvmSWYT7QCXb/eMO+jdai?=
 =?us-ascii?Q?4G1jK10w4q28dxxs3YsAaHq9xywjPdeUrtcM8Y38KMvq1hlPYIO/rZ505Vsj?=
 =?us-ascii?Q?98/9PGh0dBxA63qJtFjy+5AxzHsyZNFfAMbiprjh+CgQYo5XlM4PW3smCCad?=
 =?us-ascii?Q?pQNszU2NVBTpmSKekY4wIsRT/hEt3qHZLhLry/EORZLgN0DG48YrgwHcaC60?=
 =?us-ascii?Q?R3mA3q/A4Or/bGevcAbt8K+J48aN/9owwmcPvohuDLhaV5QFciGyXpbAzBEt?=
 =?us-ascii?Q?3adyz4D8k5pwQaVaPOzGv04QuMFKHRmRByauwnh9qr+2B32zyhfwLPBPTdk+?=
 =?us-ascii?Q?Ka2MtaPJKKpxwMdzsyanSFRm97t501kNpWeOpya5vIauqmGgtNhkRuRB49hI?=
 =?us-ascii?Q?Me96EKQjsOoOV6cELugvpNmqkk7vE8E++eXMw9UW4TH0gR6an/XRQiHlgK/m?=
 =?us-ascii?Q?wLNBios3p6pZFH6XA7XqMTcHCVEIFaDmbvdnEj5EgtTk83APAJKAyVpiD/jY?=
 =?us-ascii?Q?MnYCdO84FTmjbjPCMMGYPUN2PlASdfJp/OESIGWZqqOQedZYyETIT9m+dZ6R?=
 =?us-ascii?Q?QcnM7uWQHqrA7LK/LHUB5ieZ11f3Oxpenldk9yBtyHBuGTcLZWD31xMkqepG?=
 =?us-ascii?Q?N4mpUT/n8EwnDdw6Vpry1OroW1exj9y3whUH0irX9X1cmex8hvyDrykC3vX+?=
 =?us-ascii?Q?JbAgOWTSEu/T89bePK6GpGj4AeARrkIPWw/BsttMN4fcQHZ4Lyr48yjzn2QM?=
 =?us-ascii?Q?qPwh9SYgeSlMgbK4SchoVBPSHfz81e5bKzRk6XkSZXyXpbObTLQ9OjtWCB56?=
 =?us-ascii?Q?hHWm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfb24be-9930-4964-43ce-08d892e323d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:53.1402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrQeI/rh6ypWbZKpcasccomm6Vm/LJaP9BLF3X40Ma/q4iQTWN11UP7oEASFUqfs0XcPqXtAju2TzoLasOD+1Zq3jeSHjJvbFRD/1Ql3pc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Split no-perm part of bdrv_attach_child as separate transaction action.
It will be used in later commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index a7ccbb4fb1..162a247579 100644
--- a/block.c
+++ b/block.c
@@ -86,6 +86,14 @@ static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
                                                GSList **ignore);
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    GSList **tran,
+                                    Error **errp);
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
                                     const BdrvChildClass *child_class,
@@ -2942,23 +2950,26 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BdrvChildRole child_role,
                              Error **errp)
 {
-    BdrvChild *child;
-    uint64_t perm, shared_perm;
-
-    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    int ret;
+    BdrvChild *child = NULL;
+    GSList *tran = NULL;
 
-    assert(parent_bs->drv);
-    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
-                    perm, shared_perm, &perm, &shared_perm);
+    ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
+                                   child_role, &child, &tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
 
-    child = bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   child_role, perm, shared_perm, parent_bs,
-                                   errp);
-    if (child == NULL) {
-        return NULL;
+    ret = bdrv_refresh_perms(parent_bs, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    QLIST_INSERT_HEAD(&parent_bs->children, child, next);
+out:
+    tran_finalize(tran, ret);
+
+    bdrv_unref(child_bs);
+
     return child;
 }
 
@@ -3064,6 +3075,40 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    GSList **tran,
+                                    Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    assert(parent_bs->drv);
+
+    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
+                    perm, shared_perm, &perm, &shared_perm);
+
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, parent_bs,
+                                   child, tran, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
+    /*
+     * child is removed in bdrv_attach_child_common_abort(), so don't care to
+     * abort this change separately.
+     */
+
+    return 0;
+}
+
 static void bdrv_detach_child(BdrvChild *child)
 {
     bdrv_replace_child(child, NULL);
-- 
2.21.3


