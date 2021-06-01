Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5139788C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:58:44 +0200 (CEST)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7j1-0001ji-Ey
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bj-000269-Mo; Tue, 01 Jun 2021 12:51:11 -0400
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:55602 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bf-0002AT-4i; Tue, 01 Jun 2021 12:51:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V19UjdBEkKqDvjvgN3z2E6m4Qyq/g/FBNzfb9e+ncCdZEOD0mEVuQhVGSQ4gQZ8++X/1O4Vw5HOY7kvGSJBqGi0dFs6+1k1uNu3i6Bm4Mtfvpe1RY7/pBmb9NIRljJIQ7ITDunK+S4vY70aPlOTlJC6IaOshdxqIDEf0eBguCvVBJXLjNAmTNUV3fSJsuhGgPAQt40t6bk1cnBgMSq6GJ4Yir0pW77dR8XJMwhiibkWwrWWzSC2tHfC1/xVAx2PISFC7As+BIbbKh6hi0ZKFv1YCOmjdXN0i/oJEnpeElIuzw/DldJzC+xsm3m3ZZ72hBfimN/9TF7KLgZ6h4lAIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skfCXr/TJKoFFoSup6AW+F+KJ5F1pU5UJDh8y3qWVgA=;
 b=ZOuLKvh5BwVo+or042o6IgDD4z0hEvMHU+s/lu52oQu3RHchaChYIF7t9xHyHtBkUSG9daCApSpLZho7wLzMHr0jUgclakUfghpgQf3kfP1RXcToVnF4Aybw5lLVH9cwKn2Nhb6VX7A4GtUvArjOJhWTGtBPnCUlq02nH5X9cKo5PwrGsnAZihAVPWpyi2N7neFQf9v3C8KA6d3OmB5EidvSIIhEBp/BxVbVD8EWMrabqmPrrppRdy7t+4gmvyFGcKOPH/jQ7SoR7ODE6Dt0ehZNC+la5dJKS2BqwxMFtOjjHCN5QUWLl/5FrKOffiMoGKH47ZZkPFysMVq0EtizjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skfCXr/TJKoFFoSup6AW+F+KJ5F1pU5UJDh8y3qWVgA=;
 b=C/z6V8cf2hRKtuWCi6m7KxwMv6y1YyLH0tbipZPkjb+kSCIokj5Rw9L+ijifn8e1C5tjzxy5V9s5LsoP5JgUvGRkt7FdwJJAAUoZFxkIzXwn2SnmP63hQvqCWRS6z9wFKu36H4GcoFW5G0Grf1R8fUHCxxD2SP8PLRgGxn8xfh8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 07/35] block: rename backup-top to copy-before-write
Date: Tue,  1 Jun 2021 19:49:58 +0300
Message-Id: <20210601165026.326877-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7712f7a6-745d-4c59-63b1-08d9251d6a98
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471342EF908B6D8916A68BDC13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /DpAv2vrk2EIjx3asEyF5eHcU6UO1nJGgyELTMbIDfNrBU5uurGyoJgx1ORdoOJBQEKcHuWhF7xB64uUTBNDpcS1Xi3/46K2sbPBKn4k8l56qsDZr2HyODPJP3GbUGuPKk4TQCwIyqtJj7vT8sYK/yRP1Wwo0en//zxEHuGRwZb14d10XTM9lYg0APWGJIhKJ6R+mkh22NUrmdcUNTegr27mTNk93Y8FhUSuEKXGQ79I0oKOxo2tR14OZur2XKP87dfWsWwzrW4NEZ6gYuUKgsoHZNuV4E5n1gd/p3+OOI9UgOOIt4xt1T+AgEpVIInJSHAe6T4XbsmrA35Ufxj1hcQIKc/nmhO59rvO5xf31G/f6c/HebvV/1NPk8b0nuxSjH218c4T91hH3IytOTi3B7HvIx9X/4MxpfqRz1K0xOYDKn1juS2MC/J59lEEtQiDrD1pmpIz7UTy/FlnwGumTonnd7umffwToMAD9fJ/RsoHg9hSA6c7E+YrO7PNh67u9z3tYYcsdP5ntBIckVwL456VFLFqSlfe7+S4EWmU5L2ueiYTx0uLWoBL2Et7dua3/bRBUBCJceIuiRJ5ZlNnEryCEFyYdUvC6x9R7SCR3Fwccfek+ddTs0USIqRCYh32wxBp+V2MsQFPi7rr13r+bTSNuNlDrnj1FBi4aoBkxdpQoGmSiAZIi9x8MQlcHSEZIBXFqVH75wwZJ95wfn5XjXhTww5h773AGScCynK1mNDvQBmZddeACDDgvNPZJMeDh5vAeP+X3AYdMf0F4yJnnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(30864003)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEpRUndYRU9iWEdTRGg0Nlo0T0ZmS0g1eElENGlhZWZSVk5RekwycFVPZFNQ?=
 =?utf-8?B?TWo2RCthOHZRck5uekQ0SnZWcU1WWk5vVzZ6ZXNYb2EydzBMUGN3eU9KdXVU?=
 =?utf-8?B?eTBQT0E5bEI2QjYveVlMSm9zTXZPZitLcVlTNkdhaXUwbGdkUzhDenRNVGY1?=
 =?utf-8?B?cUQxZWlFUGhKSlMrUVFNMU91V1JENWI0bVhENS9yRkxzUE1iaGlYczRUaVRZ?=
 =?utf-8?B?QklYMjhrRXN4eGt4TDhtVEFhd2NyNWQyVDY0NW1GQ3lHZEl6SWF5L1R2eGcr?=
 =?utf-8?B?bmlSN2hPcU55cFR1dVJaN09Ib1pLSWpWaXhyL2xBVXlueHFOZWRkYjYvNXY3?=
 =?utf-8?B?RVM0MXlQUnF6WW55dlp5d25TRXlGWHVrQUN4QlIxZU5jbnpxR2ZtT0JFRlB5?=
 =?utf-8?B?YnRrTXZhTGRmWllZcDlEU21CajNkR291Wit0YU1QVGdOYVpPN3NBWnROQ09Z?=
 =?utf-8?B?c1NLQS81YnVzd3dpVnNsYzBNL1FiM1I3c1lrbEZyR3VKYVhtNGswaDl6TFlO?=
 =?utf-8?B?K3l6NlUxRWFxdXNpMTF2bm5rMTFxdmxIYWQzUGtTbjI5UG9zbDhQamF6dW1k?=
 =?utf-8?B?QWJ6WlBTTEZJcU16cVEvU29JalBWYkk0L0VlUTFBQjZBQzZvZ0pZWUNSdExC?=
 =?utf-8?B?bWM5Mlk3UkQvL245ZWpRaGdkN0gwYXRDaitCaDNIWmlMRnJqOG1EYXZIVUJ3?=
 =?utf-8?B?bkdwV0lCeWJKd3ViTFR2Y05PbXFPeWxCWjlSd0RYWEpCTUg5c3pVRTg1cU9B?=
 =?utf-8?B?SE03bitrVWVyd0RLMmJEN0VXZlpzL0RwZklJWUx0a1E0SmxaelJxUGtLOG1q?=
 =?utf-8?B?WTNTL3p0RDJESEliVS8rM0hUaUw1WDAvUWg5K3p6VkpvQWl2eVpPWnVWVDZ5?=
 =?utf-8?B?WVBablZDZUMzWWNFRGxYY0QwVitSRS9FY0Z0RURXaVdaclFtbVZpQVZNY3U1?=
 =?utf-8?B?Y2ZGQUpHbWswR1hPdlFPWmEyYnhNNk04aVVpN0ZQaFRLNFl2MXVPK0tYcU5Z?=
 =?utf-8?B?QnR4SXE0UnVUUVh3a2J5K1grL3V6d2o4RXcrM3lpMFc0aDRpd2htWHlOeWZ5?=
 =?utf-8?B?SENQWWh5Kzc2R2JydE5DMjBteUdFbHN0UEllNDM5VG41UFpKV0pwcmFrUzRl?=
 =?utf-8?B?b2gyS1FzUXpZYjRsZnpCQzZBYjRSNkxCanRsVnJzQ0RFRys4K2FnaTFPdk9r?=
 =?utf-8?B?NUpIRnhQTXhGakJDU3dScklrSmpBcEFpZkE5b0VJc04valYyYXBtSGRtUTRM?=
 =?utf-8?B?a044WDl1dlNxaDFhMEVGRmloZHN5OE5Pc0NQdUxuS0RTaU1PQithYWlUUUtJ?=
 =?utf-8?B?MVBLbXF3TnZKM1dtVS9nT1N5TWRxZktnN0Y2NmlvMWV4S1dsellvczhCQVBJ?=
 =?utf-8?B?SnZ6TzVoeVVQWlEvd1NVWXFTSllZMExnNER6Q1VQb2VZeVVpaGNpOXRGNE8y?=
 =?utf-8?B?M3pLRmlnZDl0WmNFKzFxRTJxY3hhM2szb2JxRUNoYk1TaUdya1ZjaUt3T3BB?=
 =?utf-8?B?OWFrbnFhRFNLc0Q4dTZ2ZUdYMzRScGZHUUVpOUxWQkJobFlHY1VVdFNMVmpo?=
 =?utf-8?B?Vy9yVmw3U1RiWnRuOFNDMmxneW5XeDY1NlZOUHVWTXliZU9sZjJCSXJKOFZH?=
 =?utf-8?B?WWVydldVeUNFRDh6VSs1WUIwOU5wcjh2dWVpditTSlN2NnA2enFtbFNJdUNl?=
 =?utf-8?B?T1lta1VpZ2NzRjlmZ2V2KzRmUERWL0RpTGY0T3dCaGdxdVpEa09FTmcrVlRu?=
 =?utf-8?Q?D7q4zojD6PeeZu/80GVWRHuVQ+/KDf/FqVrwP5f?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7712f7a6-745d-4c59-63b1-08d9251d6a98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:52.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KK19nm95KUgyckKfQ7z3jk6QH4sWozg5aIHvTVYsHTbo9sinI/eyNCgaQtmwRQmQfiCTsnfDPsDvJfHZM9/PChHrxqMMOW1X/KnuczGddSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We are going to convert backup_top to full featured public filter,
which can be used in separate of backup job. Start from renaming from
"how it used" to "what it does".

While updating comments in 283 iotest, drop and rephrase also things
about ".active", as this field is now dropped, and filter doesn't have
"inactive" mode.

Note that this change may be considered as incompatible interface
change, as backup-top filter format name was visible through
query-block and query-named-block-nodes.

Still, consider the following reasoning:

1. backup-top was never documented, so if someone depends on format
   name (for driver that can't be used other than it is automatically
   inserted on backup job start), it's a kind of "undocumented feature
   use". So I think we are free to change it.

2. There is a hope, that there is no such users: it's a lot more native
   to give a good node-name to backup-top filter if need to operate
   with it somehow, and don't touch format name.

3. Another "incompatible" change in further commit would be moving
   copy-before-write filter from using backing child to file child. And
   this is even more reasonable than renaming: for now all public
   filters are file-child based.

So, it's a risky change, but risk seems small and good interface worth
it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/{backup-top.h => copy-before-write.h} |  28 +++---
 block/backup.c                              |  22 ++---
 block/{backup-top.c => copy-before-write.c} | 100 ++++++++++----------
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 tests/qemu-iotests/283                      |  35 +++----
 tests/qemu-iotests/283.out                  |   4 +-
 7 files changed, 95 insertions(+), 100 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 rename block/{backup-top.c => copy-before-write.c} (62%)

diff --git a/block/backup-top.h b/block/copy-before-write.h
similarity index 56%
rename from block/backup-top.h
rename to block/copy-before-write.h
index b28b0031c4..5977b7aa31 100644
--- a/block/backup-top.h
+++ b/block/copy-before-write.h
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -23,20 +23,20 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BACKUP_TOP_H
-#define BACKUP_TOP_H
+#ifndef COPY_BEFORE_WRITE_H
+#define COPY_BEFORE_WRITE_H
 
 #include "block/block_int.h"
 #include "block/block-copy.h"
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp);
-void bdrv_backup_top_drop(BlockDriverState *bs);
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp);
+void bdrv_cbw_drop(BlockDriverState *bs);
 
-#endif /* BACKUP_TOP_H */
+#endif /* COPY_BEFORE_WRITE_H */
diff --git a/block/backup.c b/block/backup.c
index bd3614ce70..ac91821b08 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -27,13 +27,13 @@
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
 #define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 typedef struct BackupBlockJob {
     BlockJob common;
-    BlockDriverState *backup_top;
+    BlockDriverState *cbw;
     BlockDriverState *source_bs;
     BlockDriverState *target_bs;
 
@@ -104,7 +104,7 @@ static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     block_job_remove_all_bdrv(&s->common);
-    bdrv_backup_top_drop(s->backup_top);
+    bdrv_cbw_drop(s->cbw);
 }
 
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -408,7 +408,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
     BdrvRequestFlags write_flags;
-    BlockDriverState *backup_top = NULL;
+    BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
     assert(bs);
@@ -521,22 +521,22 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     write_flags = (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
-    backup_top = bdrv_backup_top_append(bs, target, filter_node_name,
+    cbw = bdrv_cbw_append(bs, target, filter_node_name,
                                         cluster_size, perf,
                                         write_flags, &bcs, errp);
-    if (!backup_top) {
+    if (!cbw) {
         goto error;
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, backup_top,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
         goto error;
     }
 
-    job->backup_top = backup_top;
+    job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
     job->on_source_error = on_source_error;
@@ -552,7 +552,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
-    /* Required permissions are already taken by backup-top target */
+    /* Required permissions are taken by copy-before-write filter target */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
                        &error_abort);
 
@@ -562,8 +562,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (sync_bitmap) {
         bdrv_reclaim_dirty_bitmap(sync_bitmap, NULL);
     }
-    if (backup_top) {
-        bdrv_backup_top_drop(backup_top);
+    if (cbw) {
+        bdrv_cbw_drop(cbw);
     }
 
     return NULL;
diff --git a/block/backup-top.c b/block/copy-before-write.c
similarity index 62%
rename from block/backup-top.c
rename to block/copy-before-write.c
index 425e3778be..0dc5a107cf 100644
--- a/block/backup-top.c
+++ b/block/copy-before-write.c
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -32,25 +32,25 @@
 #include "block/qdict.h"
 #include "block/block-copy.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
-typedef struct BDRVBackupTopState {
+typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     int64_t cluster_size;
-} BDRVBackupTopState;
+} BDRVCopyBeforeWriteState;
 
-static coroutine_fn int backup_top_co_preadv(
+static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
-static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, BdrvRequestFlags flags)
+static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
+        uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
     uint64_t off, end;
 
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
@@ -63,10 +63,10 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     return block_copy(s->bcs, off, end - off, true);
 }
 
-static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
+                                        int64_t offset, int bytes)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, 0);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
     if (ret < 0) {
         return ret;
     }
@@ -74,10 +74,10 @@ static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->backing, offset, bytes);
 }
 
-static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
+static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         int64_t offset, int bytes, BdrvRequestFlags flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -85,12 +85,12 @@ static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
     return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
 }
 
-static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
-                                              uint64_t offset,
-                                              uint64_t bytes,
-                                              QEMUIOVector *qiov, int flags)
+static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
+                                       uint64_t offset,
+                                       uint64_t bytes,
+                                       QEMUIOVector *qiov, int flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -98,7 +98,7 @@ static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
     return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
+static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
     if (!bs->backing) {
         return 0;
@@ -107,7 +107,7 @@ static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->backing->bs);
 }
 
-static void backup_top_refresh_filename(BlockDriverState *bs)
+static void cbw_refresh_filename(BlockDriverState *bs)
 {
     if (bs->backing == NULL) {
         /*
@@ -120,11 +120,11 @@ static void backup_top_refresh_filename(BlockDriverState *bs)
             bs->backing->bs->filename);
 }
 
-static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
-                                  BdrvChildRole role,
-                                  BlockReopenQueue *reopen_queue,
-                                  uint64_t perm, uint64_t shared,
-                                  uint64_t *nperm, uint64_t *nshared)
+static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
+                           BdrvChildRole role,
+                           BlockReopenQueue *reopen_queue,
+                           uint64_t perm, uint64_t shared,
+                           uint64_t *nperm, uint64_t *nshared)
 {
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
@@ -149,41 +149,41 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-BlockDriver bdrv_backup_top_filter = {
-    .format_name = "backup-top",
-    .instance_size = sizeof(BDRVBackupTopState),
+BlockDriver bdrv_cbw_filter = {
+    .format_name = "copy-before-write",
+    .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
-    .bdrv_co_preadv             = backup_top_co_preadv,
-    .bdrv_co_pwritev            = backup_top_co_pwritev,
-    .bdrv_co_pwrite_zeroes      = backup_top_co_pwrite_zeroes,
-    .bdrv_co_pdiscard           = backup_top_co_pdiscard,
-    .bdrv_co_flush              = backup_top_co_flush,
+    .bdrv_co_preadv             = cbw_co_preadv,
+    .bdrv_co_pwritev            = cbw_co_pwritev,
+    .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = cbw_co_pdiscard,
+    .bdrv_co_flush              = cbw_co_flush,
 
-    .bdrv_refresh_filename      = backup_top_refresh_filename,
+    .bdrv_refresh_filename      = cbw_refresh_filename,
 
-    .bdrv_child_perm            = backup_top_child_perm,
+    .bdrv_child_perm            = cbw_child_perm,
 
     .is_filter = true,
 };
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp)
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp)
 {
     ERRP_GUARD();
     int ret;
-    BDRVBackupTopState *state;
+    BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_backup_top_filter, filter_node_name,
+    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
         return NULL;
@@ -210,7 +210,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     ret = bdrv_append(top, source, errp);
     if (ret < 0) {
-        error_prepend(errp, "Cannot append backup-top filter: ");
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
@@ -231,7 +231,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        bdrv_backup_top_drop(top);
+        bdrv_cbw_drop(top);
     } else {
         bdrv_unref(top);
     }
@@ -241,9 +241,9 @@ fail:
     return NULL;
 }
 
-void bdrv_backup_top_drop(BlockDriverState *bs)
+void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
     bdrv_drop_filter(bs, &error_abort);
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f55404f2f..a27489a9d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2283,8 +2283,8 @@ F: block/mirror.c
 F: qapi/job.json
 F: block/block-copy.c
 F: include/block/block-copy.c
-F: block/backup-top.h
-F: block/backup-top.c
+F: block/copy-before-write.h
+F: block/copy-before-write.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index e687c54dbc..6e27aa9624 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -4,7 +4,7 @@ block_ss.add(files(
   'aio_task.c',
   'amend.c',
   'backup.c',
-  'backup-top.c',
+  'copy-before-write.c',
   'blkdebug.c',
   'blklogwrites.c',
   'blkverify.c',
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 010c22f0a2..a09e0183ae 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # group: auto quick
 #
-# Test for backup-top filter permission activation failure
+# Test for copy-before-write filter permission conflict
 #
 # Copyright (c) 2019 Virtuozzo International GmbH.
 #
@@ -31,13 +31,13 @@ size = 1024 * 1024
 """ Test description
 
 When performing a backup, all writes on the source subtree must go through the
-backup-top filter so it can copy all data to the target before it is changed.
-backup-top filter is appended above source node, to achieve this thing, so all
-parents of source node are handled. A configuration with side parents of source
-sub-tree with write permission is unsupported (we'd have append several
-backup-top filter like nodes to handle such parents). The test create an
-example of such configuration and checks that a backup is then not allowed
-(blockdev-backup command should fail).
+copy-before-write filter so it can copy all data to the target before it is
+changed.  copy-before-write filter is appended above source node, to achieve
+this thing, so all parents of source node are handled. A configuration with
+side parents of source sub-tree with write permission is unsupported (we'd have
+append several copy-before-write filter like nodes to handle such parents). The
+test create an example of such configuration and checks that a backup is then
+not allowed (blockdev-backup command should fail).
 
 The configuration:
 
@@ -57,11 +57,10 @@ The configuration:
                         │    base     │ ◀──────────── │ other │
                         └─────────────┘               └───────┘
 
-On activation (see .active field of backup-top state in block/backup-top.c),
-backup-top is going to unshare write permission on its source child. Write
-unsharing will be propagated to the "source->base" link and will conflict with
-other node write permission. So permission update will fail and backup job will
-not be started.
+copy-before-write filter wants to unshare write permission on its source child.
+Write unsharing will be propagated to the "source->base" link and will conflict
+with other node write permission. So permission update will fail and backup job
+will not be started.
 
 Note, that the only thing which prevents backup of running on such
 configuration is default permission propagation scheme. It may be altered by
@@ -99,13 +98,9 @@ vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
 vm.shutdown()
 
 
-print('\n=== backup-top should be gone after job-finalize ===\n')
+print('\n=== copy-before-write filter should be gone after job-finalize ===\n')
 
-# Check that the backup-top node is gone after job-finalize.
-#
-# During finalization, the node becomes inactive and can no longer
-# function.  If it is still present, new parents might be attached, and
-# there would be no meaningful way to handle their I/O requests.
+# Check that the copy-before-write node is gone after job-finalize.
 
 vm = iotests.VM()
 vm.launch()
@@ -131,7 +126,7 @@ vm.qmp_log('blockdev-backup',
 
 vm.event_wait('BLOCK_JOB_PENDING', 5.0)
 
-# The backup-top filter should still be present prior to finalization
+# The copy-before-write filter should still be present prior to finalization
 assert vm.node_info('backup-filter') is not None
 
 vm.qmp_log('job-finalize', id='backup')
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 97e62a4c94..e08f807dab 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,9 +5,9 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
-=== backup-top should be gone after job-finalize ===
+=== copy-before-write filter should be gone after job-finalize ===
 
 {"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "source"}}
 {"return": {}}
-- 
2.29.2


