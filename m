Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5157D477
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:59:13 +0200 (CEST)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcKG-0001vv-Tn
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHv-0004zg-3I
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:47 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:30700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHq-0006af-Lq
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:46 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LIKn6g028504;
 Thu, 21 Jul 2022 12:56:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=spXeaXNZ4Rat3K8aTDPyI/u9V4NSR4MKjyRlHVxRLP0=;
 b=WyGfIkY9naBMD4q24i2OgBNLpGykhw26AOGnnztLy5awlHfk5NiR6/3jBhGwfgZgl1tc
 EfcQKhqEHp/sqXRxU36YaWhuLuR3zDRO8RnACDYPMDG+JAYsRwiAGAhwsCcTaGMDVYrU
 OXSfsQhhQndvADR0Uri6q1Oca95VmNznI3jeE+aCWdj9PM63Ixh8JkhZ2uVlqSuhni1d
 JQPzhxWsMb+gplx3eXYKpapzR7KV49Ceb17tVnkjmIdM4UbnFR4N8rVLmAGfOoURA4qO
 e5Sl0Rhu0ab6iilasM6QTRlvfMgR8Pe1Win3uFdbsP68OxQAzb4BatSIc83PX0xfjeGc Gg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbuehv8s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv7rqdfNZ1/sahaYU7uEKdVKx0T6fP6uLgSIu5S8l8jLc+Tz0SscU7Xe0EP4V0B+h8MWsS3NryMbNhebMtKENKOPtZARioekqYP+lcpSVY5mvdlu2ojKmeLGn0QI2+97v2fKuCpeMnuQUMUOeyTqueTmKf6IOwLl6adSPw/udVmyUTvPdAD8qm+B60nI2Hj1j4t2ktO9ocpLuLILWDKgG2rAvyyc3dnVuoSzWXEeCzv8XSin8jpqOoCtbhHG70kUviOpwewg9KtFal2RTZ7QmDiAo0xvSOtQstgKAkHTuXo/7tLHAV/LuFKBvcZZ+wIszUv3Ts2DbbMlzDGMw5k9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spXeaXNZ4Rat3K8aTDPyI/u9V4NSR4MKjyRlHVxRLP0=;
 b=H3ty+VbsDncfgBWQlIpHukXt7Hda4Er+91blwcFe/WcRBePywB0BuXi9EuM73aWAW9neu4uWPCeHjnB+BLWARpWYLMRZWvVi6SXxLlEZO6qOSF4MS/nmZqRBSsgtAaI+e9GGQX4o4oDYMdGfxxoUwO3YcpRJzNzkhffrCkD2F9TrDkKcVY/QaD8TTtNryQE2M/amcbHNa61Fn0DoRVB0ciFRGtbtJvFcdU/szyX5Kk1mOtoe6Zt8w+soSrIRgzXHXV9SYPu0lhKvDanBmiJvnBHaOJEDYPh5XKQQC62+GH97LxBQL+VvVHbaPPkTJDwZ7vMDLS3bnqVZ/niK8k4GwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:39 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:39 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 3/7] multifd: adding multi-interface support for multifd on
 destination side
Date: Thu, 21 Jul 2022 19:56:16 +0000
Message-Id: <20220721195620.123837-4-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220721195620.123837-1-het.gala@nutanix.com>
References: <20220721195620.123837-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b65b1676-d94d-41dd-7b83-08da6b53200f
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJ33dR4RkQRjE1C+6gLpoOgvUhqoh1wvtvqTjpy1aacu/Xvhc5APrymmsWZ7VM1goL2YWDMJUbcImx40eyLZzZCZnUK6l86fV8UIfjLtHGZROaXE/MeX0ZKAPOljhq5jd/c0M/czv6d5JBLcw9tdP/yXLyd16Q8BAENfzMT5PT8PHKUE5O6LeQOdJZCgJO4o6Lk8pSUaM2wHWc5Vjk7cbC8GvWqzy8PhFkx1NxRKYJj4QC7XfZa51jOvA6NshMWVMg9lsJKLvuW5Pme/qw6qBDsUjYzq37JwiSt1Ruklu8N8AlgU4bxezJv4r3Ksx/NOk3n29RRWvHL4edWw8vTm6cDq3+0VP+9n8J4vwsyuRG8xaVq2OaGW6MBp0h/dppn5sw3Xmm5N9gMxRT+CbHFwX0X7pmrzT+GMnSzsC6ZQckxJTM0yVi3mgSlds2ZrZGrWyZEg0vnm1izM0YXrsP7vdR1uB7zItRWNuNh03u1IFecBNxTjB67VjJ3xHzFgqomh8Qp8eIJX1GLXZlUbfIb9A52XwIlNMhddkD4WMxFuchvPnfx6A5bL3mAkxqkX4z4gpWJEnxc065uCEihlmN3J4aPdIwVT1dy/clot3E1WwSJBsz81eQmvJsqMA29lqhd3YEhGhQwslQLWN0LsqhV8MOQUm7LXOV+TvtLG1wpBrgxdeU7MYJ8xypV8bDKnl2I/MWjAi4A0+NHQSfeJXZU7wCUPqx0L2GB9z7DuObZxksyToNXtLEIlEdH/B5D+kXCuHdxOgrXwh4Ke/bQYO5YqGAz9fw7UI+Kk53AGuDbuHNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(30864003)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pG6NAsz8+jIt8L0IzdkDinuLiY6ONlchBRLvwqbHt6JOExHiBCvOKzQS/8XQ?=
 =?us-ascii?Q?xUOyYQ2uXLQEjZPP6/rSdBLXqbJq3iU8FzW+x3GpjwaRiPORyP2WLM9L+v0l?=
 =?us-ascii?Q?7wwKpiIH1IlbO1LLYxKDUETjLQX0ZoQ0zEDPKmERO9zwAynmhZ3obYNt+siS?=
 =?us-ascii?Q?QsWI8gKU/qYnKksrPnnegYn2lBVvPkoS4mjwZfr/flxnh/jnCAbH2weVMB8/?=
 =?us-ascii?Q?BL5xWibobUaR+hSu7k951/7dC3DihsMx9ftNSF1+/ahdwujOInD7AnXLort1?=
 =?us-ascii?Q?qXMJ2WuwusCzGv33USv7rUVQoLAvsVPDDlgYiM9U4WVLj56z7L5h/ppldapF?=
 =?us-ascii?Q?kRHbBWye8Uqc6tsOANPIDG/HjZLndiIYVNuVruHjF9zsXcuF8btTwADgiGjn?=
 =?us-ascii?Q?wffYoCWfGC+Q6ZMsiytS+rgLEYqONAkzwmzCLEIzPEiB4xB3jp3BiqeW2XVt?=
 =?us-ascii?Q?X0K/SJZWl9Vo7otFx+EdRTHie/8pQjEBXCTidALb9GY6Q6aNJWEGS1SQkAEn?=
 =?us-ascii?Q?AUN0u58AYYHYgzKLdp7RtU4rrv99okJqOxiQLnS4TBjAacnvSl5we+U1FVig?=
 =?us-ascii?Q?dDzkWfoBPg0O2rDnzLHOSZ6YE76GSkfFyK+oJTnWeiTJcPFUEdqP/7r80BKO?=
 =?us-ascii?Q?g/J39X0K2NifYYzVfJPeLBItaSuXx4v6nOTk7JAKmFNP89p4cVa0mzhy5NMf?=
 =?us-ascii?Q?cZLnXxt3QxGHghsljeJTPJy3ogUg46yIL/F+4crD2XY7VP318TEi4l5Zp7mB?=
 =?us-ascii?Q?af9u9RvEhbXaIN/sMCUQqeDiPLmwuJS86GfrNtFf1Eg/ZLmwFP2jR5D2C9J0?=
 =?us-ascii?Q?fK/soM9nJUpzln8PRFF42Vh8kw4Z8uy/Ghuv3gMNz1dzDpt1cGrcxFBytEi1?=
 =?us-ascii?Q?jj9eQVCOPbbbE2zIdwPd/+RlXxUVSPoCs5EjAgl3PWeHWpEhFH836wKPfs5J?=
 =?us-ascii?Q?V8kartxN6K2qBOcLGCbD26/v9wBYTCkDVgvK215pcc/u1LH4yxQJ/EmGAAb1?=
 =?us-ascii?Q?2wTQNlUoh/vf5Gw48aIjFUfTjYDMCoHIcUcnC2IuFv2C4vsnaLGraD+/8Cxg?=
 =?us-ascii?Q?WyRz4OYKSmo8EqYWqyBbRq2SKZocaz2vOIilNj1BmQ04IlPVfUu48EXrXhzv?=
 =?us-ascii?Q?4Er3SWFr9Dh3btQeHPjklMnNaLnkUADvtsQcyCPtx7EqwxdsIviv/qEa0rUU?=
 =?us-ascii?Q?zRSyzHGBWQ+Z98tmKwefzdA4HX3sOOTGqbT8KVNwNtphIzOalPQtKlNRYCha?=
 =?us-ascii?Q?KLXyIm1Rr2mmFkEY8vDNGIhdOLNRiQZtEqmpa8aucSeBs0DI7l8ECl1IR8mY?=
 =?us-ascii?Q?7kcvd1KnhC6t+XI8aLh2SzsHJvJbi1LIsfPl3oj84LNNdYzksR79WYbD8lH1?=
 =?us-ascii?Q?A2zWlPDyo72T5mXbJcr2h1C8MsPhw3MpBLU/Fvxc8wySO/YhlLoE53W94Qko?=
 =?us-ascii?Q?/RqxBrX69574HC4oRMgxx4jSqrQldNodAHNYIWmVJofIFoMCu/7C+2p3NBa7?=
 =?us-ascii?Q?LcbfqwG/Ewa2mZpjmeLaABXUwzs3bUHqs8Pg8MaBC9b30ez4WY2I11sxx3no?=
 =?us-ascii?Q?fxMO84Kf0o/7K3JcOYnYNW6vhHcbEnqsCcVSMwet?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65b1676-d94d-41dd-7b83-08da6b53200f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:39.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXWKLu+reRIVZUVGfNV5WsF2x+1NC41sPiSOYOAiNwvj6XqO8sH1HOqCNAPx/0VOIs6N5QXiDo+4C/s3/WTO4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-GUID: Fpffya1FQdscpHlny4zOrfAbc_FW03NS
X-Proofpoint-ORIG-GUID: Fpffya1FQdscpHlny4zOrfAbc_FW03NS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_27,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12; envelope-from=het.gala@nutanix.com;
 helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

i) Modified the format of qemu monitor command: 'migrate-incoming' by adding
   a list, each element in the list to open socket listeners with a given
   number of multifd channels.

ii) Qemu starts with -incoming flag defer and -multi-fd-incoming defer to
    allow the modified 'migrate-incoming' command to be used.

iii) Format for -multi-fd-incoming flag as a comma separated string has been
     added with each substring containing listener socket address and number
     of sockets to open.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c | 143 ++++++++++++++++++++++++++++++++++++------
 migration/migration.h |   2 +
 migration/socket.c    |  11 ++--
 migration/socket.h    |   3 +-
 qapi/migration.json   |  46 ++++++++++++--
 qapi/qapi-util.c      |   3 +-
 qemu-options.hx       |  18 ++++++
 softmmu/vl.c          |  30 ++++++++-
 8 files changed, 221 insertions(+), 35 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 572b909423..c58b81576c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -486,28 +486,41 @@ void migrate_add_address(SocketAddress *address)
                       QAPI_CLONE(SocketAddress, address));
 }
 
-static void qemu_start_incoming_migration(const char *uri, Error **errp)
+static void qemu_start_incoming_migration(const char *uri,
+                                          uint8_t multifd_count, int idx,
+                                          Error **errp)
 {
     const char *p = NULL;
 
-    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
-    qapi_event_send_migration(MIGRATION_STATUS_SETUP);
-    if (strstart(uri, "tcp:", &p) ||
-        strstart(uri, "unix:", NULL) ||
-        strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multi_channels(true);
-        socket_start_incoming_migration(p ? p : uri, errp);
-#ifdef CONFIG_RDMA
-    } else if (strstart(uri, "rdma:", &p)) {
-        rdma_start_incoming_migration(p, errp);
-#endif
-    } else if (strstart(uri, "exec:", &p)) {
-        exec_start_incoming_migration(p, errp);
-    } else if (strstart(uri, "fd:", &p)) {
-        fd_start_incoming_migration(p, errp);
+    if (multifd_count ==  0) {
+        migrate_protocol_allow_multi_channels(false); /* reset it anyway */
+        qapi_event_send_migration(MIGRATION_STATUS_SETUP);
+        if (strstart(uri, "tcp:", &p) ||
+            strstart(uri, "unix:", NULL) ||
+            strstart(uri, "vsock:", NULL)) {
+            migrate_protocol_allow_multi_channels(true);
+    #ifdef CONFIG_RDMA
+        } else if (strstart(uri, "rdma:", &p)) {
+            rdma_start_incoming_migration(p, errp);
+    #endif
+        } else if (strstart(uri, "exec:", &p)) {
+            exec_start_incoming_migration(p, errp);
+        } else if (strstart(uri, "fd:", &p)) {
+            fd_start_incoming_migration(p, errp);
+        } else {
+            error_setg(errp, "unknown migration protocol: %s", uri);
+        }
     } else {
-        error_setg(errp, "unknown migration protocol: %s", uri);
+        /* multi-FD parameters only support tcp network protocols */
+        if (!strstart(uri, "tcp:", &p)) {
+            error_setg(errp, "multifd-destination uri supports "
+                                "tcp protocol only");
+            return;
+        }
+        store_multifd_migration_params(p ? p : uri, NULL, multifd_count,
+        idx, errp);
     }
+    socket_start_incoming_migration(p ? p : uri, multifd_count, errp);
 }
 
 static void process_incoming_migration_bh(void *opaque)
@@ -2192,7 +2205,8 @@ void migrate_del_blocker(Error *reason)
     migration_blockers = g_slist_remove(migration_blockers, reason);
 }
 
-void qmp_migrate_incoming(const char *uri, Error **errp)
+/* migrate_incoming function is for -incoming flag process */
+void migrate_incoming(const char *uri, Error **errp)
 {
     Error *local_err = NULL;
     static bool once = true;
@@ -2210,7 +2224,7 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
         return;
     }
 
-    qemu_start_incoming_migration(uri, &local_err);
+    qemu_start_incoming_migration(uri, 0, 0, &local_err);
 
     if (local_err) {
         yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -2221,6 +2235,95 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
     once = false;
 }
 
+/*
+ * multi_fd_migrate_incoming function is for -multi-fd-migrate-incoming
+ * flag process
+ */
+void multi_fd_migrate_incoming(const char *uri, Error **errp)
+{
+    Error *local_err = NULL;
+    static bool once = true;
+
+    if (!once) {
+        error_setg(errp, "The incoming migration has already been started");
+        return;
+    }
+    if (!runstate_check(RUN_STATE_INMIGRATE)) {
+        error_setg(errp, "'-multi-fd-incoming' was not specified on the command line");
+        return;
+    }
+
+    strList *st = strList_from_string(uri, ',');
+    strList *r = st;
+    int length = QAPI_LIST_LENGTH(st);
+    init_multifd_array(length);
+
+    for (int i = 0; i < length; i++) {
+        const char *uri = NULL, *ret = NULL;
+        const char *str = r->value;
+        uint8_t multifd_channels = DEFAULT_MIGRATE_MULTIFD_CHANNELS;
+        int parse_count = qemu_string_count_delim(str, ':');
+        if (parse_count < 2 || parse_count > 3) {
+            error_setg(errp, "Invalid format of string-id %d in "
+                             "'-multi-fd-incoming' flag", i);
+            return;
+        }
+        if (parse_count == 3) {
+            ret = strrchr(str, ':');
+            uri = g_strndup(str, strlen(str) - strlen(ret));
+            multifd_channels = atoi(ret + 1);
+        }
+        qemu_start_incoming_migration(parse_count == 2 ? str : uri,
+                                      multifd_channels, i, &local_err);
+        r = r->next;
+    }
+    if (local_err) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    once = false;
+}
+
+/* qmp_migrate_incoming comes from qemu qmp monitor command */
+void qmp_migrate_incoming(const char *uri, bool has_multi_fd_uri_list,
+                          MigrateIncomingUriList *cap, Error **errp)
+{
+    Error *local_err = NULL;
+    static bool once = true;
+
+    if (!once) {
+        error_setg(errp, "The incoming migration has already been started");
+        return;
+    }
+
+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        return;
+    }
+
+    /* For migration thread */
+    qemu_start_incoming_migration(uri, 0, 0, &local_err);
+
+    /* For Multi-FD */
+    int length = QAPI_LIST_LENGTH(cap);
+    init_multifd_array(length);
+    for (int i = 0; i < length; i++) {
+        const char *multifd_dst_uri = cap->value->destination_uri;
+        uint8_t multifd_channels = cap->value->multifd_channels;
+        qemu_start_incoming_migration(multifd_dst_uri, multifd_channels,
+                                      i, &local_err);
+        cap = cap->next;
+    }
+
+    if (local_err) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
+        error_propagate(errp, local_err);
+        return;
+    }
+    once = false;
+}
+
 void qmp_migrate_recover(const char *uri, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
@@ -2246,7 +2349,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    qemu_start_incoming_migration(uri, errp);
+    qemu_start_incoming_migration(uri, 0, 0, errp);
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index cdad8aceaa..4cb81f7cf0 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -394,6 +394,8 @@ bool migration_is_setup_or_active(int state);
 bool migration_is_running(int state);
 
 void migrate_init(MigrationState *s);
+void migrate_incoming(const char *uri, Error **errp);
+void multi_fd_migrate_incoming(const char *uri_str, Error **errp);
 bool migration_is_blocked(Error **errp);
 /* True if outgoing migration has entered postcopy phase */
 bool migration_in_postcopy(void);
diff --git a/migration/socket.c b/migration/socket.c
index f199430bc2..dab872a0fe 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -227,17 +227,17 @@ socket_incoming_migration_end(void *opaque)
 
 static void
 socket_start_incoming_migration_internal(SocketAddress *saddr,
-                                         Error **errp)
+                                         uint8_t multifd_count, Error **errp)
 {
     QIONetListener *listener = qio_net_listener_new();
     MigrationIncomingState *mis = migration_incoming_get_current();
     size_t i;
-    int num = 1;
+    uint8_t num = 1;
 
     qio_net_listener_set_name(listener, "migration-socket-listener");
 
     if (migrate_use_multifd()) {
-        num = migrate_multifd_channels();
+        num = multifd_count;
     } else if (migrate_postcopy_preempt()) {
         num = RAM_CHANNEL_MAX;
     }
@@ -266,12 +266,13 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
     }
 }
 
-void socket_start_incoming_migration(const char *str, Error **errp)
+void socket_start_incoming_migration(const char *str,
+                                     uint8_t multifd_count, Error **errp)
 {
     Error *err = NULL;
     SocketAddress *saddr = socket_parse(str, &err);
     if (!err) {
-        socket_start_incoming_migration_internal(saddr, &err);
+        socket_start_incoming_migration_internal(saddr, multifd_count, &err);
     }
     qapi_free_SocketAddress(saddr);
     error_propagate(errp, err);
diff --git a/migration/socket.h b/migration/socket.h
index 0cbb7220ac..7c82278d33 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -33,7 +33,8 @@ void socket_send_channel_create(QIOTaskFunc f, void *data);
 QIOChannel *socket_send_channel_create_sync(Error **errp);
 int socket_send_channel_destroy(QIOChannel *send);
 
-void socket_start_incoming_migration(const char *str, Error **errp);
+void socket_start_incoming_migration(const char *str, uint8_t number,
+                                     Error **errp);
 
 void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
                                      Error **errp);
diff --git a/qapi/migration.json b/qapi/migration.json
index 456247af8f..3908c9096c 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1526,14 +1526,36 @@
            '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
            '*resume': 'bool' } }
 
+##
+# @MigrateIncomingUri:
+#
+# Information regarding which destination listening interface to be connected
+# and number of multifd channels over that interface.
+#
+# @destination-uri: the Uniform Resource Identifier of the destination VM
+#
+# @multifd-channels: number of channels used to migrate data in parallel for
+#                    for specific source-uri and destination-uri.
+#                    Default value in this case is 2 (Since 4.0)
+#
+##
+{ 'struct' : 'MigrateIncomingUri',
+  'data' : { 'destination-uri' : 'str',
+           '*multifd-channels' : 'uint8'} }
+
 ##
 # @migrate-incoming:
 #
 # Start an incoming migration, the qemu must have been started
-# with -incoming defer
+# with -incoming defer. qemu can also be started with optional
+# -multi-fd-incoming defer for opening multifd listening sockets
 #
 # @uri: The Uniform Resource Identifier identifying the source or
-#       address to listen on
+#       address to listen on.
+#
+# @multi-fd-uri-list: list of pair of source and destination VM Uniform
+#                     Resource Identifiers with number of multifd-channels
+#                     for each pair.
 #
 # Returns: nothing on success
 #
@@ -1545,19 +1567,31 @@
 #    compatible with -incoming and the format of the uri is already exposed
 #    above libvirt.
 #
-# 2. QEMU must be started with -incoming defer to allow migrate-incoming to
+# 2. multi-fd-uri-list will have list of destination uri as listening sockets
+#    and multi-fd number of channels on each listening socket.
+#
+# 3. QEMU must be started with -incoming defer to allow migrate-incoming to
 #    be used.
 #
-# 3. The uri format is the same as for -incoming
+# 4. multi-fd-uri-list format is not the same as for -multi-fd-incoming flag.
+#    For -multi-fd-incoming flag, it is a comma separated list of listener
+#    sockets with multifd channels.
+#    Example: -multi-fd-incoming "tcp::6900:4,tcp:11.0.0.0:7789:5".
 #
 # Example:
 #
 # -> { "execute": "migrate-incoming",
-#      "arguments": { "uri": "tcp::4446" } }
+#      "arguments": {
+#          "uri": "tcp::6789",
+#          "multi-fd-uri-list" : [ { "destination-uri" : "tcp::6900",
+#                                    "multifd-channels": 4},
+#                                  { "destination-uri" : "tcp:11.0.0.0:7789",
+#                                    "multifd-channels": 5} ] } }
 # <- { "return": {} }
 #
 ##
-{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
+{ 'command': 'migrate-incoming',
+  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateIncomingUri'] } }
 
 ##
 # @xen-save-devices-state:
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 9672ac6018..a256f12ad2 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qemu/ctype.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qapi-builtin-types.h"
 
 CompatPolicy compat_policy;
 
@@ -157,7 +158,7 @@ int parse_qapi_name(const char *str, bool complete)
  * Produce a strList from a delimiter separated list.
  * A NULL or empty input string return NULL.
  */
-strList *strList_from_string(const char *in, char c)
+struct strList *strList_from_string(const char *in, char c)
 {
     strList *res = NULL;
     strList **tail = &res;
diff --git a/qemu-options.hx b/qemu-options.hx
index 79e00916a1..5555f0d2fd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4479,6 +4479,24 @@ SRST
     to issuing the migrate\_incoming to allow the migration to begin.
 ERST
 
+DEF("multi-fd-incoming", HAS_ARG, QEMU_OPTION_multi_fd_incoming, \
+    "-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
+    "-multi-fd-incoming defer\n" \
+    "                wait for the URI to be specified via\n" \
+    "                multi_fd_migrate_incoming\n",
+    QEMU_ARCH_ALL)
+SRST
+``-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]``
+    Prepare for multi-fd incoming migration, with multi-fd listening sockets
+    on that connection. Default number of multi-fd channels is 2.
+
+``-multi-fd-incoming defer``
+    Wait for the URI to be specified via multi_fd_migrate\_incoming. The
+    monitor can be used to change settings (such as migration parameters)
+    prior to issuing the multi_fd_migrate\_incoming to allow the migration
+    to begin.
+ERST
+
 DEF("only-migratable", 0, QEMU_OPTION_only_migratable, \
     "-only-migratable     allow only migratable devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aabd82e09a..07c33ded20 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -45,7 +45,7 @@
 #include "sysemu/seccomp.h"
 #include "sysemu/tcg.h"
 #include "sysemu/xen.h"
-
+#include "migration/migration.h"
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
 #include "qemu/accel.h"
@@ -160,6 +160,7 @@ typedef struct DeviceOption {
 static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
+static const char *multi_fd_incoming;
 static const char *loadvm;
 static const char *accelerators;
 static bool have_custom_ram_size;
@@ -2312,6 +2313,11 @@ static void qemu_validate_options(const QDict *machine_opts)
         error_report("'preconfig' supports '-incoming defer' only");
         exit(EXIT_FAILURE);
     }
+    if (multi_fd_incoming && preconfig_requested &&
+        strcmp(multi_fd_incoming, "defer") != 0) {
+        error_report("'preconfig' supports '-multi-fd-incoming defer' only");
+        exit(EXIT_FAILURE);
+    }
 
 #ifdef CONFIG_CURSES
     if (is_daemonized() && dpy.type == DISPLAY_TYPE_CURSES) {
@@ -2600,7 +2606,7 @@ void qmp_x_exit_preconfig(Error **errp)
     if (incoming) {
         Error *local_err = NULL;
         if (strcmp(incoming, "defer") != 0) {
-            qmp_migrate_incoming(incoming, &local_err);
+            migrate_incoming(incoming, &local_err);
             if (local_err) {
                 error_reportf_err(local_err, "-incoming %s: ", incoming);
                 exit(1);
@@ -2609,6 +2615,20 @@ void qmp_x_exit_preconfig(Error **errp)
     } else if (autostart) {
         qmp_cont(NULL);
     }
+
+    if (multi_fd_incoming) {
+        Error *local_err = NULL;
+        if (strcmp(multi_fd_incoming, "defer") != 0) {
+            multi_fd_migrate_incoming(multi_fd_incoming, &local_err);
+            if (local_err) {
+                error_reportf_err(local_err, "-multi-fd-incoming %s: ",
+                                multi_fd_incoming);
+                exit(1);
+            }
+        }
+    } else if (autostart) {
+        qmp_cont(NULL);
+    }
 }
 
 void qemu_init(int argc, char **argv, char **envp)
@@ -3331,6 +3351,12 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 incoming = optarg;
                 break;
+            case QEMU_OPTION_multi_fd_incoming:
+                if (!multi_fd_incoming) {
+                    runstate_set(RUN_STATE_INMIGRATE);
+                }
+                multi_fd_incoming = optarg;
+                break;
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
-- 
2.22.3


