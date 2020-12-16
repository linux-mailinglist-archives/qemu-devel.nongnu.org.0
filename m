Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11BE2DBB1E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:20:00 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQAJ-0004O5-9m
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7z-0002d9-Vx; Wed, 16 Dec 2020 01:17:36 -0500
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:52920 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7v-0001CD-Lq; Wed, 16 Dec 2020 01:17:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/wbov7j1k6/78l57iJPAgaq50fsX+Bk1UG7+ow6R9gthtYy5WlHNS8bJ/DRmWMA3E1TZIHniI1h0zCNjApjcKYhAmy0eldgmmFE1rG/eFSHeqN6ufD5yl+hN9YXfAsA5We91bEeWf3BoPOkkKmldS5PFKmuheyvwZ+nQwlfaUsRFKYgFMq0DtaWVZCSgvz1BZFo/rSuDj/0u+56/JozscLdBMBd9ZpVUozP8uutLYYXH09VbKXmZf1eXaQVq9/+4EwAREZ4qAD0yME3E6Fi7tYIMuO4UXzI+N30wDFe4R9fDPZp4F6DN0qSzuPuQgmfBgtWrxzPOYN3ErvF/1LcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xREeye5cUA3DLZcSCdMj7Kij5v2Xx2dGoZhbMvOHd1E=;
 b=BHWc943uqmf2bdjZGTavlbF+fmSXqYMXLkkgHHRdaGMRSm8vducjpfUPwMpLS06pzVOlpHywqmzwASPTlC5euNv57u+zwJBYL+Mo3viWYBSLUfJccfi6hCE0EJaR2HX9FwEEDSAddH7BXvkQ2/m/HqxuoAi0foYRAbiOjELmx3z1nnToPSYxnstOeYUSihfxzghfGFcOoVXoGuaLG2k9LdnDVNC5T0E+I3jtgQWW585ApeyQriEwDnJrvPIi5qpA8t8Yct60SyO1oTBOSGd4Ql+g/bCG/H4BDNwcsQZV3dwq5gZGCRkH9uZ3d6Nd64lx6xkJDZCZgogqqAOpzYGZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xREeye5cUA3DLZcSCdMj7Kij5v2Xx2dGoZhbMvOHd1E=;
 b=a+Oo5PyVJ7GNV4AKE1wEaauwoJ1Xh+dyPlnIQJTc3uZP0XaGMSI/ajnHGzS72n7i3KRMuDMgclNzXfzmnii6FdcTm9OGSlBF6rQZcq9ewCV8o/iCsh+w9zyGpwKvWKdoqgf7xF1ROygfZ+w8/zy9fsrFMpNzrX3g1VhFmUMGhj8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 04/13] qapi: add filter-node-name to block-stream
Date: Wed, 16 Dec 2020 09:16:54 +0300
Message-Id: <20201216061703.70908-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c99a887e-2c3a-434a-3502-08d8a18a3f23
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB630964415D55C3F778F7331BC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1X+kcJh+V4NXfF9/voCFGPiMFn7qxmte9o5DYDRZ1jTL00/IjswMkFM98dvIZoJSDwlvgYMkCi3x20TQ8ILGUYSfBtHCQ25CF0EEjTazBi6gG0LbE5rO6NgpNAueyeTIAxwFqki9Wd+4HLDPbsPacrPHJMqP6YQ1d07TOBHIX1aBUIvt/gAZTQo7pGdyajA3AGvGB4HEhEZRmJW36zFRqd2jlP4lOKyzcU1U511t6UXEkY4SdO0Sol377XhFU9c6DD16BHb46MaldbOegM5n4MQtr/GIizfzzTP/xvXpIOjnxyBZQEi3wNq1xUf0iF1cLgXwSm0TDXzpC8ZCo1pX9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k7WNkNgIGSbMAT3Ll1/nYm6VUrJYKCEEST7J8lXYDlDlwEGe/2IIUnnAGJiO?=
 =?us-ascii?Q?iiG664IHWsgBcNT4slSfEtHO7AXn/SkEdCIlPOocs+Rg6zM9h/q0AFTp889l?=
 =?us-ascii?Q?G/J9JuT1UIkLUTOOiYrNpk+Awz+IINP1Y0vQg5tPQFXXCtLyZ2ruoo26VE/T?=
 =?us-ascii?Q?/6AWZYHdNlMEN8ZdyHkZu6aMZXMHDVWsoQgNbSVSNthKQbVsAZlYY9juGwl6?=
 =?us-ascii?Q?QH0kOdFOutjSqxKn1MSp78JhgE4hcWUQ1ZquxT2kZEZ9gibKRUaNdrxKkzPU?=
 =?us-ascii?Q?fFfhAWdL7dAgjctQ5dnpO6/QLpbd7utA59y9rKqhlszlo6lzp7PVol4Lwtss?=
 =?us-ascii?Q?cTbvt7oCm3dqQNYUid3C4qKPnyEX3P2ke8tD8OVi58VSHGgNsD3uw67SOrhG?=
 =?us-ascii?Q?lP/NN2+KfISR5a2ae3QcSIj43KtVNJNPw/oeUebYnAhRRg4T9HwfqNayR+ZK?=
 =?us-ascii?Q?MNhBUnkCnu+o7CB6kVUG+wHbVZkwq+/li8cSNo1MH3l5kg4M3uIQoPQpO7jc?=
 =?us-ascii?Q?ZdM4rpkQAiH6UTmSL3nrmxpV7dko8x5EiplhiEEt8+Fh3aObcBmHrb9aVO7z?=
 =?us-ascii?Q?yxAP/KvCQGw64BTRIBqQXkfdorIbBNDmBRKWrrBWMGANNK5c+hfC1d6HFde8?=
 =?us-ascii?Q?Z7SRCuHF0JqbgIhraKTrZF+6yeLodP133LA/rrV5Y3oMI9xQDceJDlge2ZLn?=
 =?us-ascii?Q?wRseU9fG8pzX8tl3u+2amc4QRCxEI0hFn/SAVNipcryATT2smouMrw56kegL?=
 =?us-ascii?Q?45dtlquDmd809Sbfcg4HD450JA+yj0YMXmfkS6niVem9/wWwPFP4T4cKNTNc?=
 =?us-ascii?Q?iyUYWY9gIglgRrZpSpD9pUQFu9DJ2dUJ9VaYxM3qBV/pvh8yym7JFbppB77z?=
 =?us-ascii?Q?SClvPn65+1yYE1AIMRbpo76QVlS3qfUBM0ciDwS1W71q+tCk6QOF8n46GsZp?=
 =?us-ascii?Q?RT/6XdNxJHd113BLtLc5DC3ORL3B75y3DGkgzsH8JxckOVaoxiMx/5eDBpT9?=
 =?us-ascii?Q?W3Va?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:20.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: c99a887e-2c3a-434a-3502-08d8a18a3f23
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHKIPPziRsErF1xZFyhzfimoUiHwsFxmPFfrBBzcLYcqARY8FOssahKSb7FJu1i3a9cX77aX3AA7eUJH0GXBdzbM3SWccd3gCPqEPp1XAhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.135;
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide the possibility to pass the 'filter-node-name' parameter to the
block-stream job as it is done for the commit block job.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [vsementsov: comment indentation, s/Since: 5.2/Since: 6.0/]
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json           | 6 ++++++
 include/block/block_int.h      | 7 ++++++-
 block/monitor/block-hmp-cmds.c | 4 ++--
 block/stream.c                 | 4 +++-
 blockdev.c                     | 4 +++-
 5 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04c5196e59..6050cf3c39 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2543,6 +2543,11 @@
 #            'stop' and 'enospc' can only be used if the block device
 #            supports io-status (see BlockInfo).  Since 1.3.
 #
+# @filter-node-name: the node name that should be assigned to the
+#                    filter driver that the stream job inserts into the graph
+#                    above @device. If this option is not given, a node name is
+#                    autogenerated. (Since: 6.0)
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
index 1eeafc118c..6f778e2517 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1142,6 +1142,9 @@ int is_windows_drive(const char *filename);
  *                  See @BlockJobCreateFlags
  * @speed: The maximum speed, in bytes per second, or 0 for unlimited.
  * @on_error: The action to take upon error.
+ * @filter_node_name: The node name that should be assigned to the filter
+ *                    driver that the commit job inserts into the graph above
+ *                    @bs. NULL means that a node name should be autogenerated.
  * @errp: Error object.
  *
  * Start a streaming operation on @bs.  Clusters that are unallocated
@@ -1154,7 +1157,9 @@ int is_windows_drive(const char *filename);
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
index 412354b4b6..c290cb1dca 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2501,6 +2501,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_backing_file, const char *backing_file,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
+                      bool has_filter_node_name, const char *filter_node_name,
                       bool has_auto_finalize, bool auto_finalize,
                       bool has_auto_dismiss, bool auto_dismiss,
                       Error **errp)
@@ -2583,7 +2584,8 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     }
 
     stream_start(has_job_id ? job_id : NULL, bs, base_bs, base_name,
-                 job_flags, has_speed ? speed : 0, on_error, &local_err);
+                 job_flags, has_speed ? speed : 0, on_error,
+                 filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out;
-- 
2.25.4


