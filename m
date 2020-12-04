Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D22CF6A5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:15:42 +0100 (CET)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJMb-0008TU-7O
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFh-0003RK-FU; Fri, 04 Dec 2020 17:08:33 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:46336 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFf-00029T-88; Fri, 04 Dec 2020 17:08:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjZp3NGKouFP4rXWxoR5UqhGUXLWzl35iP2YbWcEeB2uuDlt87AC3Z3ZCyd10Zl37RF2n47m14ndSSrVClbjPaV47FRCkLbAHupaZAlhJvkP+bmVnLA3CIKGg9Rn/jKB0HN+Iv2JmCeuHy7UE7lVnRk4sybh6JV0aQUnRby8LFEQ//XHIREQBwgI/n1SUsndF+iVQlc3ZT3cHfdOWsjChOlDB/0MYq2o+8WsHdcGjjo1u7zwdPYMqhMPg6vE8LsZPDF69DIMw9XNr4xBG2p1TYiyeI8swsOWFSWYnv6vACgNhleEDDBH4u+tCmDhzOlutBrmDatkWrzmJTiUH2e0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdcHmrLdUEiIRm+Np48NlarNqzMR5IO1RttOTVYMpKk=;
 b=N7M+vVJGw8iaI+KkU9CNccqcWRlQyBDDHMztZe+s7fBjS8mtkc0OD8Bjdrep2aKuB/u6VIdG3JqtBkdRhZnBOM02N5kSpPI4xl/ldAY6MvUAkaHxfkLQhqk3SW+ApaynEru7JTlixif+G+d58LAaFtPyuZ/It2MwlJPd5E1ev00GkE+W7KxQTx1sUD75xJFp3trvXp0tN0jC10h16OxULR9wxKjHyZWtbuF/CAtfAGyaxeyMFDWjpWK6fz1cZsT+ttcT6OCLYvP6A1fzwWAGoaP3DfL8YdHoMGycrtdVYibVXCRRL/J0WxrLSoVJDCG+Hh+H6cffLLgZhPsAgdTCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdcHmrLdUEiIRm+Np48NlarNqzMR5IO1RttOTVYMpKk=;
 b=G0jUFx/gRMzvout2iN/BY+x0d6zt556AWdrw6Q5vb+e/3/ONPf8P9tjO/0HVWnpt6YhMQCzdIRkjaEOHW5tMt0T3C5PE646upwwkL37u7YwRu7Qe3rNTeLy7r3BYFsXxmO8tmDT32hYTCdJcQWERg3Tgw1GcBQZwVHzMUNUxi1w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 04/13] qapi: add filter-node-name to block-stream
Date: Sat,  5 Dec 2020 01:07:49 +0300
Message-Id: <20201204220758.2879-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d907fc9c-4fdf-4fba-8df6-08d898a11a64
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072A503AE0D09E8B91514E4C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQa0SinFZU082pGyC9DI0hLvK/sJZpiTZROK/uVK4U29ZZ9o6Q5DpBmd8MGyEa+ncQnzWu7VjTO8POYpY1c6MsuG/FJsT5niQamq1PBo+zXhjBzoCoHsdVvYKE569R0/hsv4LfYe1pwta/+wIvD93wwB0M2J8LDqtinErscv+8EENA9CUis2iqAFlxhBBSrIl7clefCniCZL0+lXehJu8vZU5YUdY71a2ZWMX+xU80T4rRKeRIn900QyJ0fAdnK1mgGd4bqH9XIq9cq+u2+01w0MXzrec1jrXu2xleL4LQKq9nwZiML+7Xz1Y4vEcTx4nYbd44VRWeRyPLt5nXgGnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HIYQBvbBMCoUuOkjuJvIXRBLMwiMAdg85jlybP5VXm8dHpEePpnNdlXQwr32?=
 =?us-ascii?Q?2oYLIBiuDQSbhs4nVQSGVvCW1pmabZkCO3rWsOdgYFUqq3r8fANVzBLp1Fm3?=
 =?us-ascii?Q?FAwqOh6iKwAQDhqaPeQjZXFEWaZyOq967ZFcmbHevKXsAgNcIUuRuGJt6EEZ?=
 =?us-ascii?Q?Ni5514Cu2Eu6oCu6c8hFKc6hO+ShpEUPVpFtA2+I3wvUQasbU0iVuC9wYVqS?=
 =?us-ascii?Q?Hqsf9S2QyGgyIMofV7rgylRws7xpg24BhhgBxJ8xeg3OmUFG8Q5WUqFvXRHW?=
 =?us-ascii?Q?2riPKQfGmdZ8LtJANqZbSpZk614w6fRuhk0M/qIT5zkBu0V1+YQQgpKf0SDF?=
 =?us-ascii?Q?KRlSwEZ3cwo3lhqxzXsxwCgEzzXijOi+GLGo4SYov/7znXPPlgAKyTFszNHG?=
 =?us-ascii?Q?ftpJ2ueB0gpfPWgnmNeBfPdT8GP6tro65aYFucwARIZ8LMav0s7l4/PQDzNz?=
 =?us-ascii?Q?R09SsYoumcoys65WXfDUy+uDYcVVDMS2B2LepDuJBZiZ9ewgOFopLe7vE30Y?=
 =?us-ascii?Q?mFqoX3ExS6n19Z6DV/HtwMw9IvTvcXwRp0W07glk6VAoOIRn/gGkTe+8/uxE?=
 =?us-ascii?Q?RQrll+tyjVZog3FMlNfrpd3SbgHfiGJwvTxuHYODAQvxY47H6axf98oE6wMK?=
 =?us-ascii?Q?FsX/JTS/iAoKgmwR43IegG/O1Y/qJNjZT/tHLOq24R5oW5fhg5FBVwGoo1G/?=
 =?us-ascii?Q?LSI9tYYpRhp1OV0p3HVoIhqnFAfm3dPgDWXU7vnLp7N6+WI4yW1UuX2UwY2u?=
 =?us-ascii?Q?YvvVDjP2RkCYH0uVfYYsj2enFHkAlBBROYGVofSmv5wfD+U/bVLLYzK3UDiU?=
 =?us-ascii?Q?0wuofH8m181JWDcMqGV7KqS9jmfhbF+hfRUugkjhk1PzjHCwVUWHp3IP9PMt?=
 =?us-ascii?Q?5e3Su8DUj8eaxUvEWEuLkBNq5sUpMj9frNrt8dzAKTRz1NMUsdPWcKS+1elJ?=
 =?us-ascii?Q?68fhmakE/A7kef6YNwRrWUwFBOws20q+XqwmtYoPCMlvRLJ4ZfW0MZa4LDH4?=
 =?us-ascii?Q?3dun?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d907fc9c-4fdf-4fba-8df6-08d898a11a64
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:17.4372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ezNt2rpF98c0wZXpTFD8GghRxROkdjVo/pgbrByCf8Z5jPzrHvrsKet5joKa6uri+DXSgxa7seOjgi4oURmhcadD4DOFjTsowQtBMSmqE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide the possibility to pass the 'filter-node-name' parameter to the
block-stream job as it is done for the commit block job.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json           | 6 ++++++
 include/block/block_int.h      | 7 ++++++-
 block/monitor/block-hmp-cmds.c | 4 ++--
 block/stream.c                 | 4 +++-
 blockdev.c                     | 4 +++-
 5 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04ad80bc1e..8ef3df6767 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2543,6 +2543,11 @@
 #            'stop' and 'enospc' can only be used if the block device
 #            supports io-status (see BlockInfo).  Since 1.3.
 #
+# @filter-node-name: the node name that should be assigned to the
+#                    filter driver that the stream job inserts into the graph
+#                    above @device. If this option is not given, a node name is
+#                    autogenerated. (Since: 5.2)
+#
 # @auto-finalize: When false, this job will wait in a PENDING state after it has
 #                 finished its work, waiting for @block-job-finalize before
 #                 making any block graph changes.
@@ -2573,6 +2578,7 @@
   'data': { '*job-id': 'str', 'device': 'str', '*base': 'str',
             '*base-node': 'str', '*backing-file': 'str', '*speed': 'int',
             '*on-error': 'BlockdevOnError',
+            '*filter-node-name': 'str',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
 
 ##
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 95d9333be1..c05fa1eb6b 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1134,6 +1134,9 @@ int is_windows_drive(const char *filename);
  *                  See @BlockJobCreateFlags
  * @speed: The maximum speed, in bytes per second, or 0 for unlimited.
  * @on_error: The action to take upon error.
+ * @filter_node_name: The node name that should be assigned to the filter
+ * driver that the commit job inserts into the graph above @bs. NULL means
+ * that a node name should be autogenerated.
  * @errp: Error object.
  *
  * Start a streaming operation on @bs.  Clusters that are unallocated
@@ -1146,7 +1149,9 @@ int is_windows_drive(const char *filename);
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
                   int creation_flags, int64_t speed,
-                  BlockdevOnError on_error, Error **errp);
+                  BlockdevOnError on_error,
+                  const char *filter_node_name,
+                  Error **errp);
 
 /**
  * commit_start:
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index d15a2be827..e8a58f326e 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -508,8 +508,8 @@ void hmp_block_stream(Monitor *mon, const QDict *qdict)
 
     qmp_block_stream(true, device, device, base != NULL, base, false, NULL,
                      false, NULL, qdict_haskey(qdict, "speed"), speed, true,
-                     BLOCKDEV_ON_ERROR_REPORT, false, false, false, false,
-                     &error);
+                     BLOCKDEV_ON_ERROR_REPORT, false, NULL, false, false, false,
+                     false, &error);
 
     hmp_handle_error(mon, error);
 }
diff --git a/block/stream.c b/block/stream.c
index 236384f2f7..6e281c71ac 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -221,7 +221,9 @@ static const BlockJobDriver stream_job_driver = {
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
                   int creation_flags, int64_t speed,
-                  BlockdevOnError on_error, Error **errp)
+                  BlockdevOnError on_error,
+                  const char *filter_node_name,
+                  Error **errp)
 {
     StreamBlockJob *s;
     BlockDriverState *iter;
diff --git a/blockdev.c b/blockdev.c
index fe6fb5dc1d..c917625245 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2499,6 +2499,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_backing_file, const char *backing_file,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
+                      bool has_filter_node_name, const char *filter_node_name,
                       bool has_auto_finalize, bool auto_finalize,
                       bool has_auto_dismiss, bool auto_dismiss,
                       Error **errp)
@@ -2581,7 +2582,8 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     }
 
     stream_start(has_job_id ? job_id : NULL, bs, base_bs, base_name,
-                 job_flags, has_speed ? speed : 0, on_error, &local_err);
+                 job_flags, has_speed ? speed : 0, on_error,
+                 filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out;
-- 
2.21.3


