Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B743D10EB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:12:42 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cxl-0007Et-L0
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqI-0002Fa-H4; Wed, 21 Jul 2021 10:04:58 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:17431 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqB-0007Ca-7t; Wed, 21 Jul 2021 10:04:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OE6nTl3ehbJx03ZtaTVqXnalH+G7ksCIW1zQLe4V0XHFrWQQKL4+P5iMhcoQsbRSIMrXEK4AZv9LpS1aI9VlxzUt+HvQUh8lre7c10URM30z1M5fL6DDfaOvOYGW5GyXTUvMrMlPJcyYI9L/w5W3erqmsurO8rnKKsps6LsrUQPmxcRAHUkybxVsLUiUnzeTPxxoySUdiZhozBxfZfJ/FgM8DEkRclLfBNpRa5Ur317dA6/URYuD3PLdwyX2h25888IGhUFAZ/gdpqQdZG9KUEo11hdqeNaa3Te+vG0+9q6GnFOBtN97GKjDf9sq0ybO6uht+B453jLvvq4h4ZUHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiSzgzOI9RSEXKEdm94TJEWQPysSiTrl7D3wUBiwC34=;
 b=ZoOKo4gEBZmRG2tOeSYLb+JUaVYp9VlrYagHMAJ77mIT2i53lhgFq/znmxpJpPKFuZXDLL/yS/hNCwdKNX/LGz1EqZqzPHMTitedibdJcVp2rQaOhecYwAjRYSqlOAdu5wFNR9+6BMAp76lQ97MsRullrbO4kFIk4FwWWNCaQF5kD4wKdDs5ETcjteZc0Pq2u7R4/ozOznwVmn4OO6IMbc65YHynFIDY4Yse+PgCvQX/9C3n0OFixn8m2z30VSEHlvVmdB9Co+Lxx0fx223j4RsMU1VihEUyFJx5hM6qc1tWU99KczCiNhbA1CTr1ql82ou8yvrhadcPLuvXKwaMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiSzgzOI9RSEXKEdm94TJEWQPysSiTrl7D3wUBiwC34=;
 b=oBOyQy9mYGybb048Eupy3yOIz75AVebTm8qG9DaJeKEg/FbUg733WcYizQTDslE0DSN0FyHwk57QR21TfufBO5TsLFQgz7Al9O2MyCYb9e1nOr1F5H3/5tEZkXP3NybBuoz7rnITxZpVXf0mxFcpif4ip6678QV5tKCR9JO11MA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 14:04:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:04:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v2 3/6] block: share writes on backing child of fleecing node
Date: Wed, 21 Jul 2021 17:04:21 +0300
Message-Id: <20210721140424.163701-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721140424.163701-1-vsementsov@virtuozzo.com>
References: <20210721140424.163701-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 14:04:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5db67ec9-26bd-486a-9712-08d94c507d25
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374FCE1BB14B9B520C98A01C1E39@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KpJMon2LnjTW4u0QILvy42VsxdVIzA4ETo14cxbDnctt6Mh7/wGwZSR0rC9+YZAuwmc7JmyDYoPW4QIW3Xus4WdwdrgF+i80bd9kWPwMw/ZG6UUA3VP+57HbY5ZkzAlMtQf39HEEWw4ASzbMGlzcxAhp59loBpNmG15B6lCwWHR73QKHS9Bunz0F+nXAuEjkGatoxsd00Xo1xaanERde1UXLN9CcQ7QarWZJuLYWM54RlDYyKJtFXPzE/QMnfi1l/Dq7V4EJk9HIRMGZQZ7FBJ7mqb2yVKzfc+l8jBq5T6f4gOMDajbXfhAzeS/LBUtRvF8nRCo4Sq7TUnkx5P5657+E0rC1OqI/G5FwgTJ7clNGUfAEScsByVNWAtREI8zBuGd+LN5r9xxXtAPEALAcXF/ryxoAkHtfRXgD5dt9FFRFfQRJBXpzrW54QVaXTZksy1oSh2mZp/bUEUU2O0DDdU25M3tlvoUyJBHeP3wkLjY7tqFZ48s4z2foZs9IbH/X+7Ja+rdnMgFjOSaHgyqY+CXLY+fbfYbSJaRD+W/SPMLm+3/vN1oZEWXQmSZ+loORpuQvUobiHZD145SzER/6HYmlSnzYrgA3A8zqHW3DpZlOUKuEMMT/kAsyDgKfpU2KWazf/SxwJUZkVo8U7ln2dsniU/UAEwdzvCuqv3C+PqjGiOrIu6AjyWjrG2SqczuMBMSUqc27RfptBL0gS/Jqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39840400004)(376002)(38100700002)(5660300002)(52116002)(38350700002)(2906002)(83380400001)(956004)(1076003)(6506007)(6916009)(316002)(6666004)(66946007)(66476007)(66556008)(478600001)(186003)(4326008)(36756003)(6512007)(86362001)(26005)(8936002)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YrSMMnY7KPDjQAGNbS4hwcR/Uv/cIR+vKkj/IsJb1U40kV2o6iaHmrAAqWEH?=
 =?us-ascii?Q?ls/w3cR/vi5nEMqkYntLUgpx0E9udC1cALdUCgjYTr9NG+Hf8BsEXmx62joM?=
 =?us-ascii?Q?U7NK2r6yzCUA3UMjP+ooouDVPKRFNnX3cqc92Rm2e9g7Re6nPFSNgYupcLKG?=
 =?us-ascii?Q?91ToVdnufxKyEO2G1/PugEBpWFO1CPb5Y2H4QEYayr7sHIsnWBFR8VS78evE?=
 =?us-ascii?Q?QS5+JGs1KhI55MYcbF6v6ZnvqdZbhM5YupEgQYQKdCmv2lv9knqD0qja5GWL?=
 =?us-ascii?Q?pcHHIXXkoiAlOgj4X0PQZUi/D3OYMuYE0dUamCP5Pxac/rJVZc/qKkXRt63/?=
 =?us-ascii?Q?kpsT6hMA3PGJOs+i6rnsApH91pg8KhvwkPaLnMwnPDwTjjt6XsyygrS+OW6b?=
 =?us-ascii?Q?i5T/hX3TnsDvG1L12ynUcPmV4PiOnzMPUZTYMNv1GPuPtenIUr/GHsntCwjA?=
 =?us-ascii?Q?jVM9e6vbWteOcGxpwIr7jeSpHHVS7VQL/ngsHF339oUf30hMwNdpA0K4Td6Q?=
 =?us-ascii?Q?atly2fXMKIuoOVTql4Hz3fhy60mn8Zv0svlboVJ1S0l0DDm+CYincZp8XeiM?=
 =?us-ascii?Q?5LOIxZa8KETKgyIURhdDDJB7qIiwLg65vVuU3fBw4g2AyZva0UXlPXUVtqBS?=
 =?us-ascii?Q?fWenlcNzAMnU5y6UvZKrG+N9r3g76VnyZE7CPByXBUY3qt2u5eAWwbHJq7gJ?=
 =?us-ascii?Q?Y3ZrW20yCJIJNiHfgQIl8f+2fRqKln0Ll4MurALdsqC9m9XZlYhSZTWDmNZY?=
 =?us-ascii?Q?UoKKg5yQduRCnZt2x52mr8B6Y8enG2gV0oeTIQ7cMC2M1WQwFsGX3rO+jG8n?=
 =?us-ascii?Q?3KAiRe2KOCnnjkNGE2dxBAFd+RT6sKwfHjPdDLHo+/ZGQMMEfJqDEBj7ZlDq?=
 =?us-ascii?Q?Swm7ftbGlkRSIEh6bITMxiRAKPG+habI8g5+Wj8iDHVqkhOMb2op/DS7hiuA?=
 =?us-ascii?Q?p6yVNrU8RtNbcvUB/qorE5VoSMOv9lg/wrU6HC007yNz3a9tkmSd5bZWjWFx?=
 =?us-ascii?Q?t/jxKc5cA6eOFkWP448aV3pHZuoPDLz+ZPbLZ9tqlysxWeuWcd6FMlekr33b?=
 =?us-ascii?Q?wJk4lW9cucuVvX3bkarv/PnNJbXAYyjc0ksAaw/wx/pVVzq9QmxehPZmNa6A?=
 =?us-ascii?Q?wByPh+kWgiKs04reoQOX+5MoPBvCGH5Fe2jR7l0vptv+R+4WBIhCiGYFha7j?=
 =?us-ascii?Q?nSt9fXGT+3FXc9GVsgEFHUPaZVZGa+Fv05QabYUAUb2J1nmoBZnxGquFTeI+?=
 =?us-ascii?Q?tRI3odfVlUQcok+kSlhACEhY9urFtbDTq/BKaqe4syaGlaKzBXgylEuS9+EW?=
 =?us-ascii?Q?aVkUTbJ+SW/LUF1Ui7xyGIb4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db67ec9-26bd-486a-9712-08d94c507d25
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:04:43.1819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVI2qzvY2/vuwOJgR7muS4SQxcSjeMGIQLvcL/zZssJKHel7UphWJNZJ5l350e9rB1tC8Yq84d0MOQpK/e53D5ibKuk+MdAhEg/9RbIgaEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.8.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

By default, we share writes on backing child only if our parents share
write permission on us.

Still, with fleecing scheme we want to be able to unshare writes on
fleecing node, which is a kind of immutable snapshot
(copy-before-write operations are write-unchanged). So, let's detect
fleecing node and share writes on its backing child. (we should share
them, otherwise copy-before-write filter can't write to its file
child).

With fleecing scheme we are sure, that writes to backing child goes
through copy-before-write filter, so we are safe to share them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h |  1 +
 block.c                   |  3 ++-
 block/copy-before-write.c | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 51847e711a..a15ae9366d 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -35,5 +35,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
+bool bdrv_is_fleecing_node(BlockDriverState *bs);
 
 #endif /* COPY_BEFORE_WRITE_H */
diff --git a/block.c b/block.c
index 94a556e61d..d1046b7ff5 100644
--- a/block.c
+++ b/block.c
@@ -50,6 +50,7 @@
 #include "qemu/cutils.h"
 #include "qemu/id.h"
 #include "block/coroutines.h"
+#include "block/copy-before-write.h"
 
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
@@ -2507,7 +2508,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
      * writable and resizable backing file.
      * TODO Require !(perm & BLK_PERM_CONSISTENT_READ), too?
      */
-    if (shared & BLK_PERM_WRITE) {
+    if (shared & BLK_PERM_WRITE || bdrv_is_fleecing_node(bs)) {
         shared = BLK_PERM_WRITE | BLK_PERM_RESIZE;
     } else {
         shared = 0;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 808e8707ed..0a311e311a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -257,6 +257,43 @@ void bdrv_cbw_drop(BlockDriverState *bs)
     bdrv_unref(bs);
 }
 
+/*
+ * Detect is bs a fleecing node in some fleecing sceheme like:
+ *
+ * copy-before-write -- target --> fleecing-node
+ *   |                               |
+ *   | file                          | backing
+ * active-node  <---------------------
+ *
+ * In this case, fleecing-node can (and should) safely share writes on its
+ * backing child.
+ */
+bool bdrv_is_fleecing_node(BlockDriverState *bs)
+{
+    BdrvChild *parent;
+    BlockDriverState *parent_bs;
+    BDRVCopyBeforeWriteState *s;
+
+    QLIST_FOREACH(parent, &bs->parents, next_parent) {
+        if (parent->klass != &child_of_bds) {
+            continue;
+        }
+
+        parent_bs = parent->opaque;
+        if (parent_bs->drv != &bdrv_cbw_filter) {
+            continue;
+        }
+
+        s = parent_bs->opaque;
+
+        if (s->target && s->target->bs == bs && cbw_is_fleecing(parent_bs)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 static void cbw_init(void)
 {
     bdrv_register(&bdrv_cbw_filter);
-- 
2.29.2


