Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D0F57D480
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:04:01 +0200 (CEST)
Received: from localhost ([::1]:40678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcOu-0006Xf-Bp
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHu-0004xm-U7
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:46 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:18156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1oEcHr-0006ak-NV
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:56:45 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LIKx6n025446;
 Thu, 21 Jul 2022 12:56:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=q8tnXKFAvEcaHbJYVt/Ib60A8gi2RFP2dCWAR7BpDV8=;
 b=mR+AHLfOF3y4mzgd6ivqRXwZ6faJ4C04Jd6uWJ+fpCZPJV+yfWjOy/O5uRdssLJS46Ij
 NLdD1y0od7z4SLuxnmJ3Ow6SBXBoXDxAs3cUX8vacYoijSQTppe/fKbob6dKoCK9v950
 hlmjveWPZl5++KNhcdjeXCW3+GVbaz/jn3zlHdnYsCC2+LnRM8zjO8+g4AnyFIDUdzbs
 rDrxuTWHDlYEPRpEwLiVyGwEfGHnb+cTqQ0Hw5p399rKye8V3VlAHmug410tkl7L8x7+
 BDV6iVAI73qz/ygnzHVnB5qteYE+rD0U1hcQz33i8XXf0B+5RzMfV29gzORUOGO5BoEE TQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hbvngm5f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 12:56:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKMSiI6lQGnQQb9RUJwuxvO9zQsQxXj4XVsF4Hx45w8zT5qLug8BQeBM/DQb7KnhU2C8v8TL93vXTBwtY2RO4T4SCs6WCaWZSrAmtQtcwnu5iV0WEC33tVmfdrlg+RcPFDdJbawOpygLHLHv27T8uK+b3Y2qRn/BSLkZKTMchEihvGH9kYGEXaS6QR5mjWQWIfjBMOZ1x3nVtvwRlbNc3zEUiV8tEeB7skF0HA/MuavdMq4pMnQkdJErq8z/1Pbr+Zq5oEgkjwCQTJ40gxI/COKagqVcst6PovpsexDQ5XgjMoVjoKbuWNSCjfSZcs6g8EOikiQjRgd7lil36IqPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8tnXKFAvEcaHbJYVt/Ib60A8gi2RFP2dCWAR7BpDV8=;
 b=aWpc79BrXtSu7GvX82f4mWEOXiTfQN6ObBOOe1XJTK6BkAe51E+A9R+2hOf/zrPnJjnd2sB/hzhAiZFal1unvg1QBOjrQdeIv5+iEVfEMqP3LVnn+xNUuVH7ceclv401zvJze6BKLoCVBcKT0DXx1OTjtJOcmH1PXjIhsijpVowRI/4utYzuJaILqCafevu64clvt8bAXLe9zDnOi7ns5MO7xCWYkQAniI6zC8L38jeIaIHvPZU2YB/Zn9QxvhlbcWBLSKF6wTMKA0yhrwkcjf5TiwpI+CnVEW/wAXtzQQiQjg8/opcJ5DlX1Q0HhTMvGO2X9gAvzXKurpCFqqNASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by DM5PR02MB2825.namprd02.prod.outlook.com (2603:10b6:3:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 19:56:41 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:56:41 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 prerna.saxena@nutanix.com, Het Gala <het.gala@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 4/7] multifd: HMP changes for multifd source and
 destination side
Date: Thu, 21 Jul 2022 19:56:17 +0000
Message-Id: <20220721195620.123837-5-het.gala@nutanix.com>
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
X-MS-Office365-Filtering-Correlation-Id: c137869a-b09d-4772-2e15-08da6b53212b
X-MS-TrafficTypeDiagnostic: DM5PR02MB2825:EE_
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Kz63LEbWDrEYCFlOOsxn1jMquzu2ET4hilDrEtWnzpvVMRAdyot5tngvX2Ozw+tPpfiUhdZZ2IaaVU2LMcv55BZuHzQL4TqMeI7OhtQdFayGz4q89mmMnCPvD9AcJ3AeK/CPxCRm9J54lLo6yTh8wpmOz/EImbL8AiB+ULNh9ekmO7ppLjqLBWKf4YvLJfv20CV6n4nCkR0D/yNmUqK/pkXpGG67PffZztIRSfbBYq/u+u5SEbOQgch0r4Vq3HNdqaKTExHKX6mvvPApCXFO95Zz0WludvnodRL+Fx4yDWj9lPrlQDbFLs9+EqoWUeo03DLhLRKoJ7Oa8iZYg4TqnTzdOgNPfwovSY2freQBT0yuMwfu/4boe7HO1CR+Uqs2c5W8ClJy7IWnGKsc8vG+Ot8jgbYX4bR8PT4eK2k+ZrhSRy7oOh9tcz14RgDka4lGRL8JJbHR2UA5NZsT4iKp5UpxfOC+FZS2PjxibRCyM5F6SBxf40bkKbe6Fykm51QK5Tv772j2sKIgvN8M3rdf3ANR4wkzB5aqcuMLhuKEKaH9efGgim3delROdmwlCDO90JTGkXRt1tfRq/1/MFnY+GcmyJPNq9q5FOVavNI+1/n7rn27i/lYGIKo4D/K4s33JCQvCakgNcrksfHUwH4K2wm7jZCyL/eVKiy0y7pXGaPyP113gJU09/nOztL8U9Fxp3l48aHRV59tMIucvaMnzNwP0rrcFdIATlS6cnEN/MZgoHkk7txDJdC9ry/CgdWgU0t79vIu05bnlFqU7gZZ9lvSScHrAZyxQE+LOf7SoSEM7/QYL+eWfOSHFl2xbRdTI5l2UytF4Lj0fiwGl3X4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(38350700002)(38100700002)(1076003)(83380400001)(36756003)(186003)(2616005)(26005)(86362001)(107886003)(6512007)(316002)(54906003)(478600001)(66946007)(6916009)(66556008)(52116002)(6506007)(41300700001)(5660300002)(4326008)(8676002)(8936002)(44832011)(6486002)(6666004)(66476007)(2906002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qtJGyxRilBMw/D1rnoznyfPw/gkOotSry4r+emWT+zHNBEg0+96XuV6LxXsN?=
 =?us-ascii?Q?W+0naWX9drdNl5V0vKDZUcFIfhZVnEewizVi+kJVUiU9C64Gnihzdd0wEuo5?=
 =?us-ascii?Q?gktpkJbHOJ0XeGHsj8wDCWJBcsEg7e8ZyTPg9MAiOxvqP4WJJWFvOpn1Sxee?=
 =?us-ascii?Q?0v7fgkUK7Dfvw2PPBSP9ScFEvRZobvhYtCzxOy7n59MWdYnmtI3B2WN07V5Y?=
 =?us-ascii?Q?Twhv82moivE6TE6lt7+O5kNpvMoUSMixVimuLbyQt4mOoXl6r5u9B6PD3CAX?=
 =?us-ascii?Q?OyvXYd81lhjv9FeiiqiN1hnKORWO1Kp0/mvTSF6L2EQmxQemFGLrgtQB9krd?=
 =?us-ascii?Q?e+cb2z07zPU8ZeqXwjZ34eXjAV14PA7EO83FKvGWYhjEY1+CYl9lqSsdCbMY?=
 =?us-ascii?Q?dP1ZQhhKSH1euzFr38LV/TpQvrBA5ofppnDg/6TLsjWO8dGpOyL+NxHOKLIw?=
 =?us-ascii?Q?fpTI+C/DlqFGCS8vOH6pm3J9drlg23EDgCbmZK1h/9k6f0czftJ8WVmQ1wWU?=
 =?us-ascii?Q?xkAwcvvLYC33pExrQxVtPjLDdlo4Catqxb7QD7Wgj7ug3h2FhQGU6hEa90VT?=
 =?us-ascii?Q?IxJqDYS8i/tUGxPthzDjNEUT4sb3euSSDwW1XeIOZ8n2SB9M0DpWvfimWa4X?=
 =?us-ascii?Q?aIQlMXS9vFuAbeQjTwss9+YM/Qztx8M4eA6GXQjo5etKTqfOcDf6YXGrraiz?=
 =?us-ascii?Q?wM7rBHQax0C5Xzw0d+yrLB6LEIJTT4yJQVu4kZH95zPBJ8FkyweCbjgPEGMn?=
 =?us-ascii?Q?ze7injx11ytciVOWz3+crLNz4I7VQvX1XyHZTK/MXf34WQnMGSNK757Qzzz0?=
 =?us-ascii?Q?srAZDWzqq1V0rUAFGK+LTL23xtPv/liW5CkH+o0MDzuoGHwVXilCskRY3Erk?=
 =?us-ascii?Q?EVCIjnP7QpUBd2YQexgoowmNoI2Y8NxmqwiKj4KoZsrR3mTuW4OF7VfZ8jaE?=
 =?us-ascii?Q?d+bV+zTOGWYJe9yTzBXgjpHb8z1Tqp5VEgHD/XCSZcAPghITzHZjev3YofPI?=
 =?us-ascii?Q?1WZbfbn+U/gUdLlFk+Ysd7A26m0GYZuMHmY22ZALYGpelsiqKIXr6mazHjnX?=
 =?us-ascii?Q?Hwl6j5+bGu2YRnYfxLuodXzGFZlngeRTsP+TrTczrSIw1MWbxRJkZVj1MhAi?=
 =?us-ascii?Q?AzPgQWa3ngL9oqiwewh9DoUdZDWN4WlWlF5uP4Ww5T/DBzRaUweoJ5FSLh8l?=
 =?us-ascii?Q?7YMSBcdhtzhsB3Mq45XfFYD1lY8/WWjFsqL5dhReOeFMyZClv3gcgN6nG3Cs?=
 =?us-ascii?Q?QtyXh1dVZgw4s5fI649Efb0dkezbm5wQUzXX8ivep7sbHGhqqI/vAv7Fg8jG?=
 =?us-ascii?Q?ozoFWsN5dRIzXstadCAyN9ZyLEK9GM3qZ5A8d6ELOSl6kDa8DeGtWlYNwJo2?=
 =?us-ascii?Q?jhUtgZDb0XyBNHApL0L1h7FTRl+36s/KOJqA3sMqbq3ORsuT3yB2IMMBmkZP?=
 =?us-ascii?Q?W12HKBTdAhOfRpc6R9/fGQqBZ11u6L3IM44hAUYGXbivI336h58xB3EYmZmX?=
 =?us-ascii?Q?rWfcTaUIjdKsruFrRl7gjlp6qyG67JbPHOveS/4tP34zQTsB1XkIyr/12QWk?=
 =?us-ascii?Q?5wj5cYZrziQV8vlB/4RFn4xxpUU5BVHeQp1LEv45?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c137869a-b09d-4772-2e15-08da6b53212b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:56:41.0844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+CrINmLTTDy60pngi8Cl4UNY8Rgl09yNDGaT1z0KDsDxxhBgtIjadIpmBJ3reaMR1ZKla8nGtvD4uDWoXnp0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2825
X-Proofpoint-GUID: kLBMetCWQJHiiXKQpSFxFRjiPSwL4bfq
X-Proofpoint-ORIG-GUID: kLBMetCWQJHiiXKQpSFxFRjiPSwL4bfq
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

i) hmp_migrate and hmp_migrate_incoming functions are modified
   according to the modified qmp monitor commands.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 monitor/hmp-cmds.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8d25fee4be..ec12b950db 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -60,6 +60,9 @@
 #include "migration/misc.h"
 
 
+/* Default number of multi-fd channels */
+#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
+
 #ifdef CONFIG_SPICE
 #include <spice/enums.h>
 #endif
@@ -1127,8 +1130,19 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
     const char *uri = qdict_get_str(qdict, "uri");
+    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
+    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
+                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
+    MigrateIncomingUriList *caps = NULL;
+    MigrateIncomingUri *value;
+
+    value = g_malloc0(sizeof(*value));
+    value->destination_uri = (char *)dst_uri;
+    value->multifd_channels = multifd_channels;
+    QAPI_LIST_PREPEND(caps, value);
 
-    qmp_migrate_incoming(uri, &err);
+    qmp_migrate_incoming(uri, !!caps, caps, &err);
+    qapi_free_MigrateIncomingUriList(caps);
 
     hmp_handle_error(mon, err);
 }
@@ -1551,10 +1565,24 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
     bool inc = qdict_get_try_bool(qdict, "inc", false);
     bool resume = qdict_get_try_bool(qdict, "resume", false);
     const char *uri = qdict_get_str(qdict, "uri");
+
+    const char *src_uri = qdict_get_str(qdict, "source-uri");
+    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
+    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
+                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
     Error *err = NULL;
+    MigrateUriParameterList *caps = NULL;
+    MigrateUriParameter *value;
+
+    value = g_malloc0(sizeof(*value));
+    value->source_uri = (char *)src_uri;
+    value->destination_uri = (char *)dst_uri;
+    value->multifd_channels = multifd_channels;
+    QAPI_LIST_PREPEND(caps, value);
 
-    qmp_migrate(uri, !!blk, blk, !!inc, inc,
-                false, false, true, resume, &err);
+    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
+                inc, false, false, true, resume, &err);
+    qapi_free_MigrateUriParameterList(caps);
     if (hmp_handle_error(mon, err)) {
         return;
     }
-- 
2.22.3


