Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA5441ADC4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:26:15 +0200 (CEST)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBFW-00060m-C5
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1mVBBi-0001KU-Cd
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:22:18 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:60524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1mVBBd-00086t-Bv
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:22:16 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S3DdNE015521
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 04:22:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=ra01t0hzSl2QeIMTz3SOBkEqmkYIv2b7k1T9f3fpQNw=;
 b=gDLWPt6uWPOplTyju8//6o3kEEF+MQo1HPIG3HhcTaTN/4kWajRESVMTa+cQdlrAvbeU
 sgXUyNkx4yI3dhHBoVrh0sI6jU6Z2wQ1x6RiNldRWE7+RSBMf0MioWLGijH2yaYQ6GVF
 P0Mk2w0rgklc7Mq4+jlaw9UxfLaIfDa6YayRbwiNrVXzedW/OJnwoiyt5Ts8GEJEcaJB
 Y3ibS7NaEVLx2sRAAttZQD0dhGnPvgAs1bsuQytHlR8k7MeW1CYTYafPl9R4NeecRI9k
 uRAWx/p6wz5cvCwNTlsvqeDjwbKMhebxIOxEtV6owIICgfvtAVqUAKEbN8I9yxRJlK/y Cw== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bbty80sfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 04:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw4bbizavUZw5kOuqrOes+/6ivMxNb/LyRdgq6+otioukSTmEdbNQ+ART7IWHnwNzvcJGvRlr9mxd4i+bkdHnVc+5eI8zDQOyt1hypRbI2vEAbl5awub947LNpDsP99OnUwwU19iPT2JUayO/ClIeQQaiAWCnr7R9tP9sKNkpQ2jV+fErli+NqH5AuasnDkLO+FuBUXVtypj+KkaKCs17HAdit7VanwlTAdRz3V5lGYtACJYXz2QQjkP2p5muBCGH6XuLkzoeAm/ksCcUyZ96HPEhrPxX3f33n6qQUnzaxbUy2JaOjH1hG2XtDA68IP8Kscd8fuWiRVjHIYty0Bjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ra01t0hzSl2QeIMTz3SOBkEqmkYIv2b7k1T9f3fpQNw=;
 b=n3xjrSrwk8LaQ+xAL6kr5t2qeKBzLEm+aToRDlLyW04pY9WChl1hU3gCIzyJUPCDq3tIqSe7jy/Z/4MJDM25SSpPNNdjIWkR2xoGkXTpZY+eml+xZdrDXnchiluKV4rahK5MAXKrCsD8B2eUHWvI53NN4vZwjL5bJ88677gpy587Sz1ZBNaX43JilPf4Fxhz+VrUCH9cy4QCuMCPqoWi57+/gCmilvmvXq6nluZqhUY2gf9zjlGkpHx5CjtX+ERE8BM4Aqwv/NRaWspmUhBj3Diwze0xxHgmkJ/wxCxm0rK0e084P55vWHaLpL06qBk4UIByHW4iaYbm3xm5Bh899Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB8629.namprd02.prod.outlook.com (2603:10b6:510:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Tue, 28 Sep
 2021 11:22:07 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::9d35:160e:1e2b:a34d]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::9d35:160e:1e2b:a34d%7]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 11:22:06 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration/ram: Avoid throttling VM in the first iteration
Date: Tue, 28 Sep 2021 11:22:01 +0000
Message-Id: <20210928112201.143683-1-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
Received: from manish-mishra.ubvm.nutanix.com (192.146.154.241) by
 BY3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:254::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Tue, 28 Sep 2021 11:22:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5ed8ba1-78e4-4f6e-89cf-08d98272346d
X-MS-TrafficTypeDiagnostic: PH0PR02MB8629:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR02MB8629834F2C63C3F972F6AF37F6A89@PH0PR02MB8629.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: toXkKPLAvCZUQDOXY896OJeuDmTaLjNgVz8E0wmrgMvv9RydaA2NE3eG9oDuOrqMroPbPx6ImY90n3JSu8ZOrl0c7ue5oTQbAkINExX96O0BWGRoWdWJqhMt+8WkeIX3THcXbagVkv1SJyuuf4iCEKFnW8a8FqYJzj5XMJIkAMLqnD8ZIuH69nKKrUoaSJ13KpvMFRG4L3MF3KVWEi79m1M6D3d575LIS8dPblYR553lVbqYqjSh/9QrubFoYEAVfcKnHsDVtSKFMSFhKvJnB5hdkaT1EydVxcBuvi03nzFKvAg9XfeE++8Y6i20anhnMT3qgLl3KXm7hg+hn6jaeG5vlsdTYB/yK+P4QBqzsFegoSYt6Ng4K0OGMOcxQPC8yhmRJnRFL/11OTK3Sc69UgziQq4Sy+/rzRb5OqZFxx5m3PpIKzeYesZ6CkdKNK1/7xtnnzp6YledR7AMIrx87mx94MPrTtI/+NVEyZs7QOVG/a9sZcOH1mNhB807YYbJP6fOPajbAFajQeWFz5H35ZeVRWf1RitFbBAq4HZEU5xrE3/Ng6NHdqxrr6/6HTuA6ytq72JRRAM1wZVTyTT1gCNp06gkagDLyv86d+uCNdJVqGst0SBR48VGHxwvpZzYSbsZc1Cp7llGjJFYE0E5UyPAvt7qrQO8H7rrzoG2+GJ/FMOkwf7AV9/4tidyQxT1+FIQ+9nvLWrMGjF1BCcooQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(4326008)(8936002)(6916009)(83380400001)(186003)(38350700002)(36756003)(66946007)(2616005)(956004)(66476007)(66556008)(86362001)(38100700002)(7696005)(52116002)(6666004)(6486002)(1076003)(2906002)(316002)(508600001)(107886003)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VDmhPnOurZOgvqXirMU41F6WVHOdSWuvq9LDzQPrqUo1bdspOrN1yBXtUsfu?=
 =?us-ascii?Q?8K3+/mDTTfww802jgMZuMzPHrUUbaYT12joQSPqa1qSMD4f8zotb+RzgnUSX?=
 =?us-ascii?Q?sA+w07OMJUMDb/W36xwj1iSqeYZKkWcl3jTOhpIukTZQOlZtXoByCTgx2Rag?=
 =?us-ascii?Q?/w7O46pZbH9xaltIWy6EfA2U689sRBiirjvspLULxElva5E2IvxPBvmVkyPg?=
 =?us-ascii?Q?/3uDhSVNkw5sQtAkBsIvgMiCLJZJPgjcKRt69wkMwaBlt0huzSeGPk+YDtCV?=
 =?us-ascii?Q?j6PF39BqIPD/j27OGosWVuyhSlaUalaKx5vqUS1aO2bj+wZdYp3RMfAfCqzh?=
 =?us-ascii?Q?5QlxL1GxRd/zAEYqthALpYIi4fb3YHCCOD/7TbksGOWbe2fxYtpcSnApycB4?=
 =?us-ascii?Q?Ov6Hm0nPk6mocvYMZt3T2jv8i1RZKhO0dqwrMsbEF6JmBtxhnvO2N9H9Lp0U?=
 =?us-ascii?Q?h8Mg6UZKURsoqGX8ctzxR1dvehBI6UMC4BsMxXdxQDDPemfkHp6JSOFDC20a?=
 =?us-ascii?Q?ct4KpxWejeYkdfl7o9XEdOxa2AfCveoiJs6YxmuZ9dOCAkwMwB5ipSTzFMXo?=
 =?us-ascii?Q?CIUDuUdrtcur5+UVaW1MkTMM7eD/CtpRT9qi9yvg/s3tv4h3Ix5guMy46h+I?=
 =?us-ascii?Q?FQOLunTM7//FbhwZKURxXRQDl67eXSe29EgAZqAaik6z8/xASicrUgOSb7Kn?=
 =?us-ascii?Q?8aOboOaDYRZm4qF0vkYpZR7+ZsXDnmqhuEEKWDKctr4KuK58DOoZI6GieR+g?=
 =?us-ascii?Q?W39mUxmWbbSvvQIzj3JNdUS13RNcF+BwPNNnd56OWktzEL3SHd4j5lv7EYcr?=
 =?us-ascii?Q?HQmjBACqNhU/gGrbYZi6SpejCDnagQGi3VK+IQPQSYGRoxfCznWxNo2IdKax?=
 =?us-ascii?Q?kSXcv8irgRXfCJXJ2v66vQjGLDaO2ram56DkakcPeRzEGT3QZCbfYBI70pGo?=
 =?us-ascii?Q?/2Gt5vv16188MAUQ3Bcr7DPC69fx0YFvhY42ZXs/sOFvvPlLisXvTc4U2XJ/?=
 =?us-ascii?Q?574xu0DPS4qp16UUAvB9MmQKbLUteGiDqkpCWK5vEjo1qGWme5lu+hddnrC5?=
 =?us-ascii?Q?YKTnRaGAn9PTiv1IMzhxT/5KvcNUTzBOS0SpsiPizRKqQgEQFGA8vNUrusfR?=
 =?us-ascii?Q?dxG337vgURk8rX2wWE82JtsZ4Ryl9ssCMcYznuyNqWmG2WH80tijAShEApy6?=
 =?us-ascii?Q?inMstKOTLJ+82DXFG8rBaN7bLH8YR79hi5TmJY183Iwer8Zm/pyVjY4ee8yt?=
 =?us-ascii?Q?h4g5RmxVHsNsCBgsSXE2V8ttbwpStkShnPNKkrk+lqe4ZoqZ3Uofbv1STv80?=
 =?us-ascii?Q?998TiEpSMzXCKIlBT/Rk7XUy?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ed8ba1-78e4-4f6e-89cf-08d98272346d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 11:22:06.8466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9v8JzEDwIpM1KoYrh5by0DAbWrOllXV1S/imh99I2HZsMexeKj0JrROzTfVpIYh8E8uy/Vbd3eOhcoDJi5E0/6FsyBMgRPiTJ8N0xGBhLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8629
X-Proofpoint-GUID: iw7rmmFp-TwYcDpgp09a_P89FyAPw-Z1
X-Proofpoint-ORIG-GUID: iw7rmmFp-TwYcDpgp09a_P89FyAPw-Z1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "manish.mishra" <manish.mishra@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some cases for large size VM, memory_global_dirty_log_sync() and
ramblock_sync_dirty_bitmap() combined can take more than 1 sec. As a
result diff of end_time and rs->time_last_bitmap_sync can be more
than 1 sec even when migration_bitmap_sync is called the first time,
setting up the throttle in the first iteration itself. When
migration_bitmap_sync is called the first-time num_dirty_pages_period
is equal to VM total pages and ram_counters.transferred is zero which
forces VM to throttle to 99 from migration start. So we should always
check if dirty_sync_count is greater than 1 before trying throttling.

Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
---
 migration/ram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7af..9ba1c8b235 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1006,8 +1006,12 @@ static void migration_bitmap_sync(RAMState *rs)
 
     end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
 
-    /* more than 1 second = 1000 millisecons */
-    if (end_time > rs->time_last_bitmap_sync + 1000) {
+    /*
+     * more than 1 second = 1000 millisecons
+     * Avoid throttling VM in the first iteration of live migration.
+     */
+    if (end_time > rs->time_last_bitmap_sync + 1000 &&
+        ram_counters.dirty_sync_count > 1) {
         migration_trigger_throttle(rs);
 
         migration_update_rates(rs, end_time);
-- 
2.22.3


