Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F9323AC2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:49:54 +0100 (CET)
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErjt-0000Nr-4b
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhe-0006fA-F2; Wed, 24 Feb 2021 05:47:34 -0500
Received: from mail-eopbgr10109.outbound.protection.outlook.com
 ([40.107.1.109]:50657 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhc-0007IR-OE; Wed, 24 Feb 2021 05:47:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPEUOhYWas+lliorU/HhmaVDxGqqwqRl0gajuVOaIKJ3ngB6wF4eTgLSiTc50AYKd2vXE3JwivWo2+psfCastCY4QwPJIJhujqj2SZXIhjw0loRZaBr4MYgVUVDHMG/Lm7Bg20FqDRQH7e9XayzFb5libPrkOXb5mkqFtBBbUC8b6hSSWC+gCzicyJWCGFbAxe21MlBd/0QcWndvLbQnqsDND4640WeF+TsSWryh0lFIrHQnM2fd0lAv70x38UYPNV/W2I52LWn3X69sMP3xqVfV66hqEv2ogf0xYV5j5W4n4RKWhcoBf4GhdamLHb2EJD7XtIt4UUNLa/yMC6jyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBWMQlv5SNOY/VXKJLa/AZ0Id3MdT5M+rdpmU/DA7Ug=;
 b=dPkAhHfMeGLuc/+vVv9ahRTZ9OFpsLpQ7dkPYTcKnA/An+5KsPcyqr2iUy587nG6BaO/001zK+tA7MysmGb0PwHtmekNxH35Rz1O1OiH2KV1TBfo+Di+6A6SUbCbDVWbULabozD16gElfLK0gOwXv+KP5dNPOnN/Vep43bR6Qw4aggQfln7NqRzA+h7cEW9DQc6jX2gWTUtv6W1NlA+C1kelPHxs8zWrb1ZNd1lV1v25EsOO04/DY9S2xKKH2aE29ka6yDmax7hAYKcbwtvMpY460xRoJuGInLxOY9aIBLC4y8vDumUE1uh8dm1su2eSyM532hUzMrvxzyy4NVZ6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBWMQlv5SNOY/VXKJLa/AZ0Id3MdT5M+rdpmU/DA7Ug=;
 b=Jpe+FKv0Ut5m8d3/WufcvqXyqnZJNuh6IqPpx5c8ev+HB5BKIK9XYJ9TMqN/UBODTdIeQdrykSXzhKdTbictWh/hi28VOmZJBo0F7QvpdP63Q7Apf+WxwsEIW9C5H2HnDIQxaI6RsDUseZMiO+O+EMMs4v0WVlo0u1PDTJx4MC8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3574.eurprd08.prod.outlook.com (2603:10a6:20b:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 10:47:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 10:47:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 2/6] parallels.txt: fix bitmap L1 table description
Date: Wed, 24 Feb 2021 13:47:03 +0300
Message-Id: <20210224104707.88430-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: HE1PR05CA0177.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.244) by
 HE1PR05CA0177.eurprd05.prod.outlook.com (2603:10a6:3:f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:47:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34d4402e-ef89-4afa-c013-08d8d8b19389
X-MS-TrafficTypeDiagnostic: AM6PR08MB3574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB357481F87AEE9356174178BCC19F9@AM6PR08MB3574.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PskfIVL9hOqWoPVprV+mmhU1WK8JCeQ9m/scmtmtT1QeVYAc+khyah38yjrZXmOOjnbJypVHr7RBjxIFgmuhVfeZyEOuaXAGEwDNpj2nj7Ftx9Sre+Z2/+me6kTxTZxMnjCX7VbHQ1vCv6oPgVrWRXBugziQos980scgU2iCYy++3aThR+rQAfmkBMp37dH7VjXWjd8zpGkPX2SaJC12ohdVE7yyufSddOgfNtNNwxBZCrPxnpciVrNRSU/bfhRT3/L+g6eUaHD3ccYBmwtwG9Z+W0kYvWQV/Qd6zkWacp4THr9KROlHT2LjZAplKeqCsZO0zXzs0OGODUAts/PLp+a5lvq+JvvVGOA4cc4Oc/26bwCv4+4RF6VRA3/ALrqeO49OvbZ49UM88nDQtF0q3PVPPMMWfGg3KhyWdJ84ZRTqai/hf+YvVUbjn6Rys13jMVb7jmViCuAHESBkbnNi0SP882i+YFfoyC1f8KXPs0wiJHFJrZY8jvzuBJiICGGtg7RVGAaeYCHGfJ/7ZayVnW51+4kJPLT2kol9Ig60W//e9ZR/ZokKDDSolFLOpE2wDZwxDbzOc/gXOXliue4Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(346002)(366004)(136003)(4326008)(6486002)(6916009)(6512007)(186003)(2616005)(478600001)(5660300002)(52116002)(66476007)(6666004)(956004)(36756003)(66946007)(83380400001)(316002)(69590400012)(1076003)(26005)(6506007)(16526019)(8936002)(86362001)(66556008)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UG3swo3r0lC4d93SFOylUkDH/nn356feaxsHmR+wMXki0pv0cMuTQvzfyDi/?=
 =?us-ascii?Q?thVRWaY5dBvR7p8AEm6sMcfbXWcMU0hWPr7qVDE24qEk0nw5Z+q4j4wbgjm1?=
 =?us-ascii?Q?DlYY7oGoKzR4yumCUFj1YjTVxW+nwqD1yirC+yHRMlnRenJpaq4zTug41uQC?=
 =?us-ascii?Q?ZvssFTVOyCV60Cnb8Z1sejFW+zVKpmUuJA36UxXGBTkbtqHcRzKX6ODLAYL4?=
 =?us-ascii?Q?UpolPLYhnI30mduPcCzIbVnQGyYMhj+L0BPTaZFuCjUsC7TdxgF66l87pmcx?=
 =?us-ascii?Q?0hkItbLuPEicxfASwrDx+CdXg2Zd3IOBgYsUBlG+hLfMJfL0eR9gocFF/8Ma?=
 =?us-ascii?Q?pBBqKXNF35HOmpZclt5Z3hTXC/wVuZ6zJ1CzgvVS3+sSrMpLB+P4VNHXNBxw?=
 =?us-ascii?Q?WOviKyNgJOgb9VnwR3tbES1d2LXAKXptp44xqoT9tAqMtssrZdTZ5klm47Pj?=
 =?us-ascii?Q?pGQI4wEm8GZNM0e73+H1G66Up2aiU0WHUH4j6teu7E2ybj34U6SKvMrr8Pml?=
 =?us-ascii?Q?u78AcmDHPZCoRFBeZcOSj+2kUovoI4WVuhU/jztlf5s1oEY+JPBPPxBiIfCm?=
 =?us-ascii?Q?f1Bz5Bb5QlPL7GXD2+WidOGDB958hNb8o2dHWYJtzPhYbqCvsAJCLZFR5Ppj?=
 =?us-ascii?Q?LRdwxVyPWX+4sH4yY1mqWN9iOdSJc5Brpb8Zv92jnlT3ZfF1wUM7flPxGFYA?=
 =?us-ascii?Q?CBSj46aXS31gIalZk3Ulx75BLOVP1810KQIxlYNN1kse5Mpfc4Jl0DlFKmou?=
 =?us-ascii?Q?aNi5XPn7599wGLVoEEW7AECsAh/1v4dMpGj+YuBObCYPeh4JoXR2724NeJAR?=
 =?us-ascii?Q?deQo5cqC4esntspr2v0f8h6XVa2WTOakAB6HNA6NHoyAQSYMdzrt34lbkITN?=
 =?us-ascii?Q?4Wh04QYsVtfbloIHCSQPvl9lZYyjcjBiAwwgCLcyLm0OA6py6fL+og/ZDBP2?=
 =?us-ascii?Q?lxQdtiBQZQpbvPfG7QbDnLWRu6Xab7uh7NdDhO4pOL8tsLDGggWbpr99PP2e?=
 =?us-ascii?Q?Is5j4QF0m4A/9cIPq4czaVWUVM18NeSMoqVXZDV7zIAJ1FZ2WwlojLgBHl1w?=
 =?us-ascii?Q?2JSuBGYagfUpIsyyNHGY+iaMlwd/QgrJn2WHdXU2NSFpnlECB/3Zcd0LjJM2?=
 =?us-ascii?Q?GCHFcsx/01kNHRrFr6n5QgC/c0GmwcXcxX8fqsskms2hlRnvaRD1a5vS8xhL?=
 =?us-ascii?Q?Ah2qLIjjRcUF8rukfE79d5cpzfo5GS+KfdyfZwc0zsawPUMP6QYOgBGa98Vz?=
 =?us-ascii?Q?/HAb+bvkx8IypV8Gx9yFCEo6cpy8mu08HlgAbBMXzaODQeojllF72aJ8Q6FZ?=
 =?us-ascii?Q?EU090e84YDDXCBmWeugrz1Y3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d4402e-ef89-4afa-c013-08d8d8b19389
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:47:27.1165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyDaHH4N0NhTwvsZoucQl9xKHxoW5WkIkEcFi91F+VEKoIiwkBmNsgnTNwFQebtW14W6kZFuRQthpgLZdWVwgMc1Nv78EoHbWxVFjbKZ54s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3574
Received-SPF: pass client-ip=40.107.1.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Actually L1 table entry offset is in 512 bytes sectors. Fix the spec.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/parallels.txt | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
index f15bf35bd1..73af9a2c4b 100644
--- a/docs/interop/parallels.txt
+++ b/docs/interop/parallels.txt
@@ -208,21 +208,24 @@ of its data area are:
   28 - 31:    l1_size
               The number of entries in the L1 table of the bitmap.
 
-  variable:   l1_table (8 * l1_size bytes)
-              L1 offset table (in bytes)
+  variable:   L1 offset table (l1_table), size: 8 * l1_size bytes
 
-A dirty bitmap is stored using a one-level structure for the mapping to host
-clusters - an L1 table.
+Dirty bitmap is stored in the array of clusters inside Parallels Image file.
+Offsets of these clusters are saved in L1 offset table here. Each L1 table
+entry is a 64bit integer described below:
 
-Given an offset in bytes into the bitmap data, the offset in bytes into the
-image file can be obtained as follows:
+Given an offset in bytes into the bitmap data, corresponding L1 entry is
 
-    offset = l1_table[offset / cluster_size] + (offset % cluster_size)
+    l1_table[offset / cluster_size]
 
-If an L1 table entry is 0, the corresponding cluster of the bitmap is assumed
-to be zero.
+If L1 table entry is 0, all bits in the corresponding cluster of the bitmap
+are assumed to be 0.
 
-If an L1 table entry is 1, the corresponding cluster of the bitmap is assumed
-to have all bits set.
+If L1 table entry is 1, all bits in the corresponding cluster of the bitmap
+are assumed to be 1.
 
-If an L1 table entry is not 0 or 1, it allocates a cluster from the data area.
+If an L1 table entry is not 0 or 1, it contains corresponding cluster offset
+(in 512b sectors). Given an offset in bytes into the bitmap data the offset in
+bytes into the image file can be obtained as follows:
+
+    offset = l1_table[offset / cluster_size] * 512 + (offset % cluster_size)
-- 
2.29.2


