Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271F2C16AF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:45:36 +0100 (CET)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIiM-0000KA-Gi
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID7-0004T7-Hy; Mon, 23 Nov 2020 15:13:17 -0500
Received: from mail-am6eur05on2111.outbound.protection.outlook.com
 ([40.107.22.111]:23809 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID5-0007Ry-QO; Mon, 23 Nov 2020 15:13:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQXs0XLG5CuwpTCzz5tQKLmsxytUxdxCkXdn6EFbQSM4j2rBqGXjTCp/ZvL6YOVkgjchVe+ukG3qsFnltxWPOQPqmcpMqhbR1u9LsiyjnQ3QF0Xq2FMoqyO0teHQ/SCAiqx7YM4Dz+Fmt96bw3FXG6yY/lu6WMX6JNlrsLKNbPwZyW02JxiNkhY3Gz1nO+LINk+L+0fwiEME0ZfSzvbo6O4cLM/1f/YK2lPnvJuGEsSdxx8292l3CUbXCfJRs7LKRreckP2R/oEDVuWMToZC4viTS074qL+VidaexhzfhetfX4LB3v0m5RFVS8CGo+jjiJZQtMvcGGDU+7iX+47jfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGaEKUvz6IWb8RBnsUSGKZ6oAwNm60XQ4kLSnJGQeoo=;
 b=holt41MLbpDi0tlcvvTeb4+RZ1wCczAY5dRWRUYY4x1kD4Aepyke/Xm4aKm/WZXK0dSfHrsQKb2VAv7J4bxY1mtwHNGbFhlcCm6Mnzx2m3mq7NWN5qLiStv+H4JK1xjH9seNJ17tpBt8mjo7Si2++tbbZixNy6sgGE/V6EapOUMFe/NYVF4XBSagsxRcmPdMq6YZw3UENY5aRAKu+piWjzB/8Ogay5mkJkvBmNAKuaDJ0KXZq6Er8N/V1NQ+5hNcfPvaL3t5wHmmoT+okJLOgnkPIOcVVUO6XUQm3JEgZgxEfjmAsPAMN7pL8/3kyPlVM5ARK8ROoAbV7mmDRq51tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGaEKUvz6IWb8RBnsUSGKZ6oAwNm60XQ4kLSnJGQeoo=;
 b=ITThASpueIGclqPyT/rNkQfjQbi9UQ4S4PXH/7bv5yBpfJd03OYfjVuEzi8ilZPt8nKXwiucvJdF8BPBg4OE7JD760BV4v07doMmWqudcXD7oDumzBFCBuC97FbWUHDju+CihtbTMTIi61Xh4wyVdz6am6iBeDLi5WZiXjorS8Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 15/21] block: split out bdrv_replace_node_noperm()
Date: Mon, 23 Nov 2020 23:12:27 +0300
Message-Id: <20201123201233.9534-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01b0dfc3-3a6f-4753-91cf-08d88fec2f57
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690D32C77641D3EC4874A00C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qa0f6tmSFI+REx5310qMnZkoc9x8ZQ/J10oDzNgwGD3m3bqse7hUIqoXHfVSTiKmoND3QpQw4Qw9ZT+Ps3rXzItS9fveJlg9M15hHKs2ZX4wQVoC16b46A11e6s07UErR+YJTZqR1RAlwgyuDtREYbxnHDkBTfsu4jdgszNDUla3s/elZ05R84TpRo74hWJYdET5t1O7UynBQE7QFuFdzWVcTQ5fDtSYJ2aO6FD4wCndpF+ZLigAHHeqkGwIXMRDNT8C1XaW2hdoMfRyCeiNviDF/EG1qZm0lNOCs1XNISXtZv2tkD371rDKq96xWEo/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: NBEANZhOSFW5XYphrYRswgJWGmzMVOrPh4ziFKKxuTOCyV8G87YJAaJ4G7xD+HvtwPL4Ye20wXS5kA+LirlGpOYNB4Wj6zyIEdIw+Wcsr1PSJFPK3U8GaXApsFLtNfaXEIFGsCvrcLGX56oAa2FBhAOhbIqEsKHX/nE8hJsBKqFuZdgvbSqxF5erzoqTBElyJliHv1YRU6g+hwAvJzxpuQQgR3JFxZiaPTFGB1Bs9ZEKR6jyrWzQQRmAGJ0kWpXqEGvpOUgIPFEk9Y6FqKZ+HVTSPBb80RRBeNRhbSb+gX4pOIz4msz7Yo5D65FD11GKn9HS6mnLACROmFBPKl9dIkguLPnDUCy+N3gacjMzQm3ugFRDsWpehI/ioIMWSz3uD3EBbRvwFZWYRySnGV9zGzPISid9YtGQFbjZ2BDsfIz5BnJfIyrY/U7/dwtsi984dAAHijwdiZuQMhezSPBSk2DMyTe6ReeHxsL2zfA6qLhMr8AJnZql/omncNbidHuDl5gyAlpRIb/4DkXb3ClNuwfKNK7tRM1yLPp5CBZMBvaAZwEnxdlT3xA5jlFE10W9UDnDIwBv8r+UFzOTuIvTPWrPKIit4R6sawm8+k/bGI9mnoedgL4nHjYZI7cDCPlEyNg23v246DjkG7Ipp+5xftH2aKWeTmpyi0LrKRvCEK6iQweOi7RHrJk31HSyoSMkLfon0AYfIC+joIh+iGeZsGRvB7ETADgIXdDx2WbHfY3DcUA0p+9l7Bp73Qi2w61VVRmNT4dp4DlfTkl6n5wRj8ZnLagI7S/MGRou4bBB/93xEF7xvk1Oe2BgoZ6c/8O4xCBvRaoX7GV2I58Tq6yokKFaWo67J008qvO/lDf1ECkvMkeAyDqLGpsalsygHNyZSd9vCZ09zpteeMPy/lGjEw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b0dfc3-3a6f-4753-91cf-08d88fec2f57
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:04.4407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouDiMeeel1LSQ1aOUDERaAsvEHdrYWQvphZV7tVOjDLerYxUBcg2CeLd47NsYKEbMVXp+z3akPpOcWLikyzjCYZAUE06Dt1L0FsXNziNTho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Split part of bdrv_replace_node_common() to be used separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 5f6ad1d016..1327254b8e 100644
--- a/block.c
+++ b/block.c
@@ -4859,6 +4859,33 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+static int bdrv_replace_node_noperm(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, GSList **tran, Error **errp)
+{
+    BdrvChild *c, *next;
+
+    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
+        assert(c->bs == from);
+        if (!should_update_child(c, to)) {
+            if (auto_skip) {
+                continue;
+            }
+            error_setg(errp, "Should not change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EPERM;
+        }
+        if (c->frozen) {
+            error_setg(errp, "Cannot change '%s' link to '%s'",
+                       c->name, from->node_name);
+            return -EPERM;
+        }
+        bdrv_replace_child_safe(c, to, tran);
+    }
+
+    return 0;
+}
+
 /*
  * With auto_skip=true bdrv_replace_node_common skips updating from parents
  * if it creates a parent-child relation loop or if parent is block-job.
@@ -4871,7 +4898,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     bool auto_skip, Error **errp)
 {
     int ret = -EPERM;
-    BdrvChild *c, *next;
     GSList *tran = NULL;
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
@@ -4890,22 +4916,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
-        assert(c->bs == from);
-        if (!should_update_child(c, to)) {
-            if (auto_skip) {
-                continue;
-            }
-            error_setg(errp, "Should not change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        if (c->frozen) {
-            error_setg(errp, "Cannot change '%s' link to '%s'",
-                       c->name, from->node_name);
-            goto out;
-        }
-        bdrv_replace_child_safe(c, to, &tran);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, &tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
     found = g_hash_table_new(NULL, NULL);
-- 
2.21.3


