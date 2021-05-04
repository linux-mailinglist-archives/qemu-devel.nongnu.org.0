Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7496B372840
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:48:10 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrez-0000Fi-HF
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrcc-0006yV-Tp; Tue, 04 May 2021 05:45:43 -0400
Received: from mail-eopbgr00109.outbound.protection.outlook.com
 ([40.107.0.109]:61086 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrcZ-0001Xl-6t; Tue, 04 May 2021 05:45:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMfmTMEHNRX6j3J+oiMZM2EHMmwX1aWVVE7BkDI4O5XDI7QNJKkCrHn+dUWg/raZf2QI9iqtFDebduFeI9jEeYU/sPsH3x5YL8dTdorC9u7L3SCGQ2yZiRiev6MRzdYcxQxz+zeQQrse6OiSfJoFNnWc5E1OwW7wpJmdbUe1cOrXwhxAFshH9qZQrCE986zHX9HF/y6kgwyvdpm1duJTVlGvgDs2kBlTR47uLVwo3is0NbDRKFP4wfpHx0EF361cv1Q9YJcaNNrZtHkzeTZCFGocxiSdehN0cHQhqQQIbkrF+VYOzV6NViidk/icHV9FWO8jent8CIecx+QoJW7qDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OvbAEACRnaVoGw9KkxV2qLMM5Yh4YimQFkpvJb3EBU=;
 b=FWSxfHY7Mb90YRl7uFi+5gkaYGRN3VvH+Jva2aXifhUXNYJGvT8U0s8hQkSIqefwE6h4vuwzTADg1Ddi2Jp6KAnWxVVsX28hj04syNznkkL5wQkk3y5hQBqaHkSnl3mQQCtNgoA4oWlTlD0atx3v2ABsn28E8wQwrxn6JwEshhtmuNph1pq1RSUzKtseH32u/IprafC6hWOMwpH0sCsnETakAoUBA5MthBIChWcmRUI1voHHhfunppPuXrZGLkn9avJcaQfs8F7TYSK/2tdkAOfulurvnPTfabJKDJrpLUnskXSvIJ2gDelzlaalla0ldUnkrHV8DL6fGidJfTSb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OvbAEACRnaVoGw9KkxV2qLMM5Yh4YimQFkpvJb3EBU=;
 b=PX8riebd7XTqVbGQRRaSdZ4IElfHgirjz9BVNhJ3f2DdzXm1vFt/X5aZGYbc8CwhaICNzYf6mcABNcMiX00W2O5ujGeAcxTGT/Fu0tptL7XqxNSw/hxv1WbgXMswRe6zaTYTyO7eWCncwSLpJ70FqEdGpWqF8WDKVfjAJ1TbCrE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6947.eurprd08.prod.outlook.com (2603:10a6:20b:346::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 4 May
 2021 09:45:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:45:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, berto@igalia.com
Subject: [PATCH v2 5/5] block: improve permission conflict error message
Date: Tue,  4 May 2021 12:45:10 +0300
Message-Id: <20210504094510.25032-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504094510.25032-1-vsementsov@virtuozzo.com>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:7:29::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:7:29::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 09:45:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4efd6d2-ec4a-42d2-0ffa-08d90ee15a1e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6947B9A1B59FA1602E53B68CC15A9@AS8PR08MB6947.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdsOhWh4y7LHJJHJKH/aBHd92cCXYl6uHIZqZBd928U8eoGC/VkZ8WbhuaSRoX8KPMkIwnYrV4HZS3x5T0cj9YIvQiWqhM5vKzbBIXp4PGqS2C+6mLB7YfI0JovYW+REfPb61rwuCLzOr1rCV5DD6HXTp93iwfElTrI3MYgXMevLM55mqfsOJ6nVDIf8/nG+CcmttvDigkRHmwMB4uuNbngplxdnij5YodbpyoB7K/wCK5TTcJh7cWbDI9rA1WvYcdY9NREGiPEsOdH+iRaJsND0EvYT95zN383IqZ1m/JMKjc/6oe6h8T8iexA+iGAcHstig8O57pILMF2qfjclftILljBpw87TiHBUTh2Bu+Qfy3OFYYJ7jVvYqVLMYPOSdDdD64wrhXds1nGixR+izOjUJgvIh1FUOCtkaHZUwuLDJjX/7O5tLjWOiJa74HQ3IR01F77h8ATmuZuavZXJ4OxxDXqA87GC9ysvOPaev4XX3WzVHGCTlJ1XoGvXl0rUxcmKt201NBAJPXa3ENLL6n9WohUbUbylYVqoZ+51usLpsQR8xi8kf145PlBFtHQ8RsWZHeR3LHKWMG6+Qjdf47rBZXwakR+aUOZNsLMp4mTWxoCrGz4zyCqRolRpjd9yXsV2uyM+nAlaSiW0H5NBvwdKj3wfs4yu19rohNxTTbtynbNbd4m7ck3cYd4Skk4K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39840400004)(6506007)(15650500001)(66946007)(66476007)(16526019)(52116002)(36756003)(83380400001)(6666004)(186003)(6512007)(86362001)(38350700002)(38100700002)(66556008)(478600001)(4326008)(1076003)(5660300002)(316002)(2906002)(8676002)(8936002)(6486002)(6916009)(956004)(2616005)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nihas6wYcOuEgXz6E+s4gI6OmMZ90rXIa5qjcEribsUw1Fwu7frAnIrxpOpg?=
 =?us-ascii?Q?xbDRoGHzEFMV+6wrGKO0oHwnsiWYkzXz9eI+FvuoVeQm1TJuuHTI4O8gttOh?=
 =?us-ascii?Q?MzrjqpmSz7x2q7aX3IH7Gn8/N6iOG31sgy7TiF6oVUw20guhiwi78sB3cHnU?=
 =?us-ascii?Q?J1ZIRQDBavtxN3AsyOsdVLzPhnCUuVDkRJp2hII3V/XdygMftgI9EKtHxazd?=
 =?us-ascii?Q?nXHwt4eb52r1A6Xd/gvMG9oG9PXqkRh+HMEPv4YcnjyPTMbBYodjPDcq/cda?=
 =?us-ascii?Q?k0NaARWwpXwfCiFAQf2TKMnR9t6Ab6OIPEEcOGwjekxiVUBKmuSCLQyPqJvg?=
 =?us-ascii?Q?ty9E1Cz7qqoOxfNIqXjTy6vJRu4SwrDEmoWlcZmEc8y8BSUPTfvQ9lOrbc0k?=
 =?us-ascii?Q?cgFgbpOYMajPa/IyfBezkCMliv2U/ws6lph7V1aRalWdVmdLwOVm2tAOKu/s?=
 =?us-ascii?Q?5JpBL8o3V83KLE8EXl3XwYry+gjnTU1PhhrlXqedXp9TVnlE+TNsLvMUvc9w?=
 =?us-ascii?Q?dCep+2KQrsNmVOMrlqFgRwTUQ5/WOS66uVM6n3dFOcCIHkFQQ+q7nMSs4B0a?=
 =?us-ascii?Q?nmOWQTzQO1mTQLYmE9h/bKqBdxge/0h/8/0PS3FK6IfuMIRYNPwzX9l2sI3i?=
 =?us-ascii?Q?IdFsQ6x1jjPrLSzqZQtxyQfsiFx/eYmvinwkCDDDImSea5YJCjhMf9Px4YZI?=
 =?us-ascii?Q?C8UGtFSD9wQyIKhyUFagRGk0M6G7/tWpCgz1sUZEvnyvZDS1L5bXachoOqq0?=
 =?us-ascii?Q?Y93KtAUaTqw0ACwjp31TLb6nxBJTFMSPLrhAbakpMajDsv/0Y6eLLgSyvR43?=
 =?us-ascii?Q?JCbSxyHkmE6q/ZIm9pq9PxRnvjlH3+KJecedXiA7S+8qTyzAMBf9BknJgzB9?=
 =?us-ascii?Q?YTbSX4a+ZqlzS86D4a7e0Y62mPYjn4J5+/oh5yMuzrbrh7wIFQv3QpDnV0iE?=
 =?us-ascii?Q?eqdLBkuYF+5+x8jUm0Tx0q1JXXAeyw+c3AOx3p4rsddDdEKJUJxx2IsWlPyT?=
 =?us-ascii?Q?5LPQtb4yPgK7fyykYQvmURkr6WszPWzyELKqipNE8eP9lP3++9A2bKdd4SbW?=
 =?us-ascii?Q?gPPmyViBAfI8KqS8UYE513QPVocIvKlDEtrspk2hM0L13lRppUqiSrQAGTud?=
 =?us-ascii?Q?L5wiSMSEpU06Qat5nfhKaIejIzjpd0S+Ife1DRies2Mgp9vb6E8xw5N1Hh6R?=
 =?us-ascii?Q?BOoVOOfKReED6PK4koD/3EnzD1laAHlmD2oRtZf92bWa93JEqCtEEl4jA8qU?=
 =?us-ascii?Q?6ffBR2inrkA1bVRx8UBZq6absEfkc6SKFdSb0CFujQrJvo4zXdYMozzFM1Jg?=
 =?us-ascii?Q?nVehFhw9uuMGcWaGgsrb42wd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4efd6d2-ec4a-42d2-0ffa-08d90ee15a1e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:45:29.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93Zk06YyhECKgZCGnHbUcCJkoEY/attQzA7Ktn7zKBerx360F6SuYTeqbvPIb+KVaWco1EW7Ae78wVvQb20yqbL7rx616NPRZIdCf9PRq9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6947
Received-SPF: pass client-ip=40.107.0.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Now permissions are updated as follows:
 1. do graph modifications ignoring permissions
 2. do permission update

 (of course, we rollback [1] if [2] fails)

So, on stage [2] we can't say which users are "old" and which are
"new" and exist only since [1]. And current error message is a bit
outdated. Let's improve it, to make everything clean.

While being here, add also a comment and some good assertions.

iotests 283, 307, qsd-jobs outputs are updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                               | 29 ++++++++++++++++++++-------
 tests/qemu-iotests/283.out            |  2 +-
 tests/qemu-iotests/307.out            |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index 2f73523285..354438d918 100644
--- a/block.c
+++ b/block.c
@@ -2032,20 +2032,35 @@ static char *bdrv_child_user_desc(BdrvChild *c)
     return c->klass->get_parent_desc(c);
 }
 
+/*
+ * Check that @a allows everything that @b needs. @a and @b must reference same
+ * child node.
+ */
 static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 {
-    g_autofree char *user = NULL;
-    g_autofree char *perm_names = NULL;
+    g_autofree char *a_user = NULL;
+    g_autofree char *a_against = NULL;
+    g_autofree char *b_user = NULL;
+    g_autofree char *b_perm = NULL;
+
+    assert(a->bs);
+    assert(a->bs == b->bs);
 
     if ((b->perm & a->shared_perm) == b->perm) {
         return true;
     }
 
-    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
-    user = bdrv_child_user_desc(a);
-    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
-               "allow '%s' on %s",
-               user, a->name, perm_names, bdrv_get_node_name(b->bs));
+    a_user = bdrv_child_user_desc(a);
+    a_against = bdrv_perm_names(b->perm & ~a->shared_perm);
+
+    b_user = bdrv_child_user_desc(b);
+    b_perm = bdrv_perm_names(b->perm);
+
+    error_setg(errp, "Permission conflict on node '%s': %s wants to use it as "
+               "'%s', which requires these permissions: %s. On the other hand %s "
+               "wants to use it as '%s', which doesn't share: %s",
+               bdrv_get_node_name(b->bs),
+               b_user, b->name, b_perm, a_user, a->name, a_against);
 
     return false;
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index c9397bfc44..92f3cc1ed5 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': node 'other' wants to use it as 'image', which requires these permissions: write. On the other hand node 'source' wants to use it as 'image', which doesn't share: write"}}
 
 === backup-top should be gone after job-finalize ===
 
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index 66bf2ddb74..e03932ba4f 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -53,7 +53,7 @@ exports available: 1
 
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand block device 'sda' wants to use it as 'root', which doesn't share: write"}}
 {"execute": "device_del", "arguments": {"id": "sda"}}
 {"return": {}}
 {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 9f52255da8..b0596d2c95 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -16,7 +16,7 @@ QMP_VERSION
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt_base': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand stream job 'job0' wants to use it as 'intermediate node', which doesn't share: write"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.29.2


