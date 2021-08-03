Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285053DEF0B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:27:51 +0200 (CEST)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuST-0002J9-Tp
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQt-0000Dy-77
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:11 -0400
Received: from mail-mw2nam10hn2246.outbound.protection.outlook.com
 ([52.100.157.246]:23648 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQr-0001X3-OS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoTTk4gG2WCcOXU7vEkVkTvwdgRu7SjCjxMwEpfOV4LyEemw7JRURmy2s3CjhsSUfu+nuGEg+MAxsYOdRKHfzrASDFWGjqB4IHu/xL/kRxsv1dsRHZj5/CcMw4Pf2YJoqY/pP0MIdqb/KdfVjP8Gfld4AuzuKqkFGAPLtWt7YtgZ9I/XO8EK3g8+icKlYvfY+u9ULjOmdiWjIM5j7C1+eZGjg4xmC13wKppFx2nkdU9UMlmXfqfoGZZ49ec/Dvpcn87iGtHrnabwNuD8g91iktK2WENDV+HbCHEjdIO5y/iO19LgX1k3o3Sjkc1VioSH10JnKwVqZOauCHgK2GPlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGExaim2fvon7BCXYftJl80kwJHEmshRPfdqOqH1osI=;
 b=kY35yICFuvi9+suSeTBHLjoKGVgojP/FCtHC81WZZpFD1rN+E5YwZWb7p1he3ffQAPC48mv8IGtX9+5qgJ1huj7BKbap+c1W+UNXve5hOul48bw2vz6o7bkxI6FE3hkJrlWnx1nm4gWdtE6HLuP4OR5U+6UiacDNGK7+wfRGxfV5kYTyposFGv0PnCdR4MfNxWkq3Q168ojkMgpJ1q4jwpe5Sp2MxwuTCpyGCxiFiWL/SPtA3uINGkdGgAkfRWyFgwSxr0su6hfXrbp1Ducx5vWIZuaVVPQIXpDhMm0SVnCpMuxg4UjaAwgXMamT7pd9yArSfBXQFnR9ibGCtKKtOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGExaim2fvon7BCXYftJl80kwJHEmshRPfdqOqH1osI=;
 b=iZHHaKN2K9qtkorSh28Ejzs1/8EsxYMHv8skJexK8JhXoD+klhip3wk6OVSIhLjcdVWrFHB+zgJcPKlFGxEQUqMP3ntEBC08rxfumUqT2uOM62ggDk2x9RERMpPrS5mY4X4/nsOHS7woZL0sMu0kjD2nm3pcvECWY6vrVHweCuU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 13:26:06 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:26:06 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Basil Salman <basil@daynix.com>,
 Basil Salman <basil@redhat.com>
Subject: [PULL for-6.1 2/6] qga-win: Fix build_guest_fsinfo() close of
 nonexistent
Date: Tue,  3 Aug 2021 08:24:48 -0500
Message-Id: <20210803132450.1093602-3-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803132450.1093602-1-michael.roth@amd.com>
References: <20210803132450.1093602-1-michael.roth@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::18) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 13:26:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65cc698c-6efb-49d8-dc96-08d956823f72
X-MS-TrafficTypeDiagnostic: CH2PR12MB4136:
X-Microsoft-Antispam-PRVS: <CH2PR12MB413662F824A68B8A550B8E2795F09@CH2PR12MB4136.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?29ricQB4f+Oon4AkucO+6YO4nRVsKQgR4hrfBoaXXl6F5qtAgP36ok/hsgJX?=
 =?us-ascii?Q?5u3H1oiPgmI2IHOjkmfP7CdIUjGOzbxGi2bqOvUyyBYmZEbosBN8AcHPJJk9?=
 =?us-ascii?Q?GJWf6CspoQC67KmD6IPzCSmyYZqd3V7jCoRZu2n/skAF9CJ0NyB0dH8PF8gC?=
 =?us-ascii?Q?VgelwMeNFYHfhUnQvcNuKUjbZiJ0+JtxQazdqTeu/xvMQ4jRJ5cx5XFfCqwD?=
 =?us-ascii?Q?hmycxZG6iW0ppXv4dTb9dTn99LCYvq/LrYwmKLS42kYA2y/ucvSOIkrTgbLv?=
 =?us-ascii?Q?8W5RUC+yeSPJwQHjBKvCU6Kwq6rFMxHqo4FfACNPHBC2QtoE7n+qspdIQ5yj?=
 =?us-ascii?Q?uAGBpUWM/mUBfLZxIZmAPtvCMVXoydjdZBi8Tnu00e1ZaIGZyik93rbbEZDx?=
 =?us-ascii?Q?BjeJnyAyyBQGAHuWaPdDWLiti8fYmH+f0X4wgLnI6tty+XVogQlTvAFI7f/h?=
 =?us-ascii?Q?WD7L2rIyMW4A0uAqIZLYM1F3zzseND5qGjmQldfov4NEIpbZmDf6ynUF+M5h?=
 =?us-ascii?Q?CyYjy3wMST7HdP5LyLgmcgOdHU/O2NQTrEW6wnNVWmX0+1pSqA3yTK5m/hBj?=
 =?us-ascii?Q?O+7BKv03wl4IEdEFNTuoqLIoa/JRJ8vEPqSvaL1NB7FBMU0vMfLQdUoy9GRv?=
 =?us-ascii?Q?xjvtJ3xKwY243RIUQD4STUhVzQLJ3AlNNAogW2yX6e8KFfLYyPMbhwqIyCSC?=
 =?us-ascii?Q?1kZL2DxwfSF+maxhV//7YEj7LqO4P46EWyePEzQIeve3D8MI9hIchgG9zm4k?=
 =?us-ascii?Q?QZaqB7UVImX8bxb/0W6PhgcOXfWL4KBGzb+G/4DuE5Xls9NF5MLDggULIc6E?=
 =?us-ascii?Q?gAIEARcl6NqHGYYA12vI2vI1X2gVi+O3cZCIgkI/TSGdDoCM89l9U2GC3kAf?=
 =?us-ascii?Q?IX+CCoDt2lQMVuHL/UNsGkxrDwr3UGR6K1nUtQjtZ13ipzkAzAyvMN81fYuj?=
 =?us-ascii?Q?0+G7IqKVDJg0762h2v319BLBTf3P6apDfAH9JximK4bhI++ioa1FLsQahdHX?=
 =?us-ascii?Q?TbN8NZvds9Jp4hjXvNNOaW7GePYPDG3f5mFqfbDriQBCTcc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(316002)(2906002)(38100700002)(44832011)(83380400001)(8936002)(1076003)(36756003)(6486002)(6496006)(52116002)(54906003)(38350700002)(2616005)(956004)(478600001)(5660300002)(66476007)(186003)(66946007)(8676002)(66556008)(26005)(4326008)(6666004)(86362001)(6916009)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ErhxBZVy8G9sCfAC7gv+mfpLn3MgCN051PLB0yQl0qgcAb+SisjwWz9o9DzL?=
 =?us-ascii?Q?o0ibC29SJrLL/67mtfxyYTGDmIYCqwIGZh4/lfmwAZZrSNKedaiKlZoW5flJ?=
 =?us-ascii?Q?lDU8rJglObb6dMROWi8kwywkSTqobku8kYCtQgBt7M4tU79ERYENv9JT9/Ch?=
 =?us-ascii?Q?K/eg9RMESxeXSqDN2iaClE+/YPtQtGJV5YesnkbnKWz02h5cXKGd2BCmQCJc?=
 =?us-ascii?Q?SX9RMJd45/SqTBu+0//K8NpzrCLhl967aHD97/kTkCeXQI2miURaeQe45NBi?=
 =?us-ascii?Q?OImbjzMjtX65hIw4Fkp3D0+seaDLvngM/g2z+LQPg9CXaVZQ08DPKH1TTt8X?=
 =?us-ascii?Q?xx3cwZY4rooqJGBMIucu4p2blJwbat8mFSZL2eIAtfz3/2V2MOIx2RIldphe?=
 =?us-ascii?Q?OV3dgoLt+cFJEpBsRBiflqo4aCWGJutUUGvmKUtFTEVERY/nZGudxyG/tTO9?=
 =?us-ascii?Q?Bgda/Wcu2GrLcEtNSOiR4DsCXlJ4DsLlH8wXH2solBQYXIPegWSMYMot80IU?=
 =?us-ascii?Q?5httoDPxS8+R0rOHLftuC7OZJ5vUO1Y+3p0UC0xizVbQXnx4Nhyo6cqYp4Y3?=
 =?us-ascii?Q?zEyNvHXqPr3VvMVBzS5Iiq8ETX9EkUZaO3JhtiqNmFe7jssFrVZ5kEWf0yFS?=
 =?us-ascii?Q?6S5z58OCZXRotKsqw0LqFfmVVkdNdxoxNE0j2Sul7yOYGzQ1qJ6dYXH21JCT?=
 =?us-ascii?Q?OFNIUxHjT8VvVf32JFlkSXJMWtsTvMo9Enp7kqQ/rEEj6P4RvJhIMgzYPAfe?=
 =?us-ascii?Q?8+AdX64j9b/VjmYtoMbH1vPF34t6K2LYbIOhTr2v1PAH3xEOD3cL+/gtnxFh?=
 =?us-ascii?Q?PfoVi4S50DneNAto87EHGQrb7wAK7nrG2+4lOBqzIXIW0T04GOllJGnQGhkK?=
 =?us-ascii?Q?IvtWF3/TqrTu3QKwbwt/4TP8dAW/fQdenSapgIpkMAZLxyAmaFclMAgMRjN1?=
 =?us-ascii?Q?jJOx1spkAeMYjDBVY/z9og+sdoE7G7GEsfxaGjsyp87XkVRbO6FlwkAM1Xyu?=
 =?us-ascii?Q?Fhf4lpRXiJ1YcTF/uE8yzvFffEEPyKInLLWBg9lHUiaXzSHHkMW5+rPq97HH?=
 =?us-ascii?Q?+3AgncVw/GW+R4j+wGYqVhbUi4Lu9TCgCF/xTEpEceYjwYLkI6PXaJ1R5Cvo?=
 =?us-ascii?Q?fGdNAndxi3MnUzgVf/Y66Vs2N3XIiRXJ0jroocvRDNZ4Sex/qiQ4bfS9yRdi?=
 =?us-ascii?Q?xxNBbJWLAVmQXKlyA6d2lmCXe7gtpYpmXg7pzcB+yZ3/VcwugpRPxeP7von/?=
 =?us-ascii?Q?dzOEawJc2PLEfVH+qw7MayrSmrkiQM3DBQfo1Z966jctrt7j6XL4QSJq9xqr?=
 =?us-ascii?Q?mr/XyUNx2yqUebErtJeHXOa0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cc698c-6efb-49d8-dc96-08d956823f72
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:26:06.0930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFUr/Iol8JldMYImvRsVSQnnoByLk5I3LOAPq+FGfeVeXE78mqtLSw8v+Juf7RIHfdAlqCUYNqmVuUaRn7jqTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136
Received-SPF: softfail client-ip=52.100.157.246;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

From: Basil Salman <basil@daynix.com>

On the current error path of build_guest_fsinfo(), a non existent handle
is passed to CloseHandle().

This patch adds initialization of hLocalDiskHandle to
INVALID_HANDLE_VALUE, and checks for handle validity before the handle
is closed.

Signed-off-by: Basil Salman <basil@daynix.com>
Signed-off-by: Basil Salman <basil@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/commands-win32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a099acb34d..763186efd4 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1091,7 +1091,7 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
     size_t len;
     uint64_t i64FreeBytesToCaller, i64TotalBytes, i64FreeBytes;
     GuestFilesystemInfo *fs = NULL;
-    HANDLE hLocalDiskHandle = NULL;
+    HANDLE hLocalDiskHandle = INVALID_HANDLE_VALUE;
 
     GetVolumePathNamesForVolumeName(guid, (LPCH)&mnt, 0, &info_size);
     if (GetLastError() != ERROR_MORE_DATA) {
@@ -1149,7 +1149,9 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
     fs->type = g_strdup(fs_name);
     fs->disk = build_guest_disk_info(guid, errp);
 free:
-    CloseHandle(hLocalDiskHandle);
+    if (hLocalDiskHandle != INVALID_HANDLE_VALUE) {
+        CloseHandle(hLocalDiskHandle);
+    }
     g_free(mnt_point);
     return fs;
 }
-- 
2.25.1


