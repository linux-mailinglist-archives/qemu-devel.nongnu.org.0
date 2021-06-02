Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD2398A3D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:13:40 +0200 (CEST)
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQgl-0003DF-Tb
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQep-000077-JO; Wed, 02 Jun 2021 09:11:39 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQen-00035G-1W; Wed, 02 Jun 2021 09:11:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaBht7eE4M33ZuBbBg968hSn9bfh1q/jukpH04cZU5OGwGzrzoCRfM7GWGGJpledGAxl9E4yR5TZ4MjnsFMcWigLOGxkYNRa7zFB+sKklFtkQWcoPr10Cbuv8XQdv8QX6lI9hrIFZGXC2iwbE/wUHhrO6UWcLkyKwZw4Kfhb/r/Ei7magtI8qsQMFjkSSrk8RuXBE0efMs+cM5jZYwRkbUVB58U+gRMg6GZQfR3jqR/Sc/TgmwTlPi+2x6kBRcfovtJI54E8J6RVj2K38L6XTfYqM9mQPZ3eeNJ20KPncnvFsYycdaaS6/P7uA8ThUGMxJhkZQH4nH+gs1L/gjbRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWZA8lIf/Bzl0KopEnik1m4ezjQSLXdF66EIX+PSFp0=;
 b=P1tBVz21cjmJzjiCI4GcgnZA5qvGGy8hHXikqS37WG7pHYE2yfe5JBWUNEGy3nhjyMU/dZM096WV7fQ7+aiLONFqxtypfsY0+y9Wgg6IIXN55zw7NaD3wCbFFVXWbDgJmh/KiUA+nHx6R4YZJkPXF2Xbmv20402uVEQ3yKnVFgDUslwRK61i70duRYyO31UlysVSc2O4tmQSoQrA/DX09pOm9weYv89Bn4gleNx9abhBrh7nYSvIk7gTLu4cTOpVf9WYZTfn8rbGQSIHsTHZwsLb7siFmEC+qyxSdIMI2cRCGG77+xBv7WQ+lAAcre4E8eoHYy/FchZvhybWKVmbiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWZA8lIf/Bzl0KopEnik1m4ezjQSLXdF66EIX+PSFp0=;
 b=Hj7hiVYblpkYMBv1XG+KMIdqr+78tppP+KTI0FrsdQjNG/+NwK5f4byomB5CK8S3libl+bkOnuMcEbVlciiOWFzYp37utbNmy02KdcbFVsc33+OXyMCH/cskvxgXb/njIAy5Zo0Vy+OoluTe/Y755ipX9ff+F8xgJgKjzo3NsIY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 02/35] block: comment graph-modifying function not updating
 permissions
Date: Wed,  2 Jun 2021 16:10:35 +0300
Message-Id: <20210602131108.74979-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8056a9c2-dc56-478c-b3e1-08d925c7eec8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376C89823E2A1CB021F9823C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CoFY0rHGmuE9YY2S26V5u201s9Xb+HN7g8h1aRee/hjDvex8w7n2abuaCgol0/gt1GqzNHu91vXwPFS+6ym/O8p9ZtBZiTMWoAG+trqP5rqTdJESt1xtwUUX1YpIaJ0fxzNvh+LLzcW2Njc0Rylo/sIPSldDtdF0nnWjTj3bPmMnasj4w0wehBGU5ivX65ihfoP6hN1Vq6+JcqK9Jyuwm9ZCe49CMJB7nG/FgIfBcmCUgQwYQeKBd3UzTzhV8IB12tBj2ilcnmry7oUaVWLPGJDHrfUrmTupa2AIgt/XloipwlsiY183AhTcelud4GP6wnAiKKtAhk6U/cxEbTXdQ7b1PcBMwWrlSw0k7P1ypzQ+/JbaEvKcAjFi4HB6+kSLipmS0LxKGgQbq9bjWnqb3NxH+yuNvXR9tVJdis18aSPzR+EEtcBLiXd3HGO6Xes9fxQWQ1QClE3LMxG4DF8a0Bwm0lsGnefXmZMUvls5u7anBs7y9XN4wCpRD4bLfEuFSMZtq5aogZb5q8N5bcjQ8P38Wzu+w7W5TlAQcUcx0KbCdMN58oDQB/M3NdScInjIsqRTPgzTAnbbWArk1SjHoDK1KKQrTEvB53v6AGk8NbdNlktxuKYM/FspCoVRevrwbwRa6c75p7aGQ8JtgBWTgCLowRB9BvA7jyi4BS7at1TF+CQjlusQUaqDC/JcxRuM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(6666004)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xnhS8yUAxI6Uil0WhAVIu3FgQ4nvigY3idS4p8kiFoKRchu7XPDMkikqc7FN?=
 =?us-ascii?Q?CTnjtkSegZjQclbfRsgnNKeFHGt0znJSTkc6od/rld+UwDLaWxeWckzro/K3?=
 =?us-ascii?Q?H6k1fHqHf5pWqTeJ11uge7cZDaeWbLaTlppQMkvJNfUWoP5pE0X2Jiy9fn4F?=
 =?us-ascii?Q?n0QOMz4ERVHJH8x3drn+Mg2A8620WCLTdMhhJQ8wXpRKkQfDWjDeNecEvnLf?=
 =?us-ascii?Q?5OcAGc14i4de7XV90fyEbXEDJsezdqbMnXPmVQdHWfvvY0fM0ctwcb6TP2Jm?=
 =?us-ascii?Q?vch1OUFcMdFmkyw/kHFJY5q6JAZJWX9J56wSS8bkT7Wnq8wDqpJj3N1ceXbg?=
 =?us-ascii?Q?0OWXoZXyKYfF7w+SaPUtKlq+ERumrdXQv82WdKQEWAhI1AglCVaDXEVnv5ul?=
 =?us-ascii?Q?PFkoaIJKL+S8nVXwKyEAqmLQPstBMzz7/ZFYjojipe2aZvTDrJZpDLX5wQ4S?=
 =?us-ascii?Q?VnvgXC6CaMcFZasPXbj6KuoHuC9Y3rWtzdPbOjfO3MiaPIPrVApunNHhaZ91?=
 =?us-ascii?Q?1IE9OEWtAf7X35KoGMcydfLF8ZitVeSQlFLrflld0cEyvydVYWhMyVKSdJDQ?=
 =?us-ascii?Q?UpXiKmu8aZ3eh+6T9K0vTSnX/4V6f0UdziTyVrDLf0/5RL99vbweDaQqRLgn?=
 =?us-ascii?Q?enGWKvdCrDwW4iR5BTGPTxoeG12bMXfbebXBK3Uzn6Q0PtCMSP0D1Vsnz1YS?=
 =?us-ascii?Q?rt0e17pt8yJ8/dr4jS90jof395vlmJ3ZSsvri6WZMax4sgYS8kvWo6bhQhmH?=
 =?us-ascii?Q?KrSXKYAQHd03aPnEGk36t4mUJx/TQoAlQmI2JxTN+1Z/CXWPo+G/61Rt1vfG?=
 =?us-ascii?Q?MOuE2tzjppN3faaoqfPCVGPqnGZov/2kQfi4x8e+Hft9JiNBl+wymErUqq9n?=
 =?us-ascii?Q?2SiOlqyf0e3DdLO5/LOog1h4W+V/5VCCPKh2yxEviHUDCPmgckfq+o2G5DBx?=
 =?us-ascii?Q?C5n0qbmcoBqJPKElRI5TNKHESAiiktreBP7p/0jOJwfOgR4DUWgHEhUex0iv?=
 =?us-ascii?Q?Jj9XZsM7p+Gc5iCA0JWeB8S+CQE8fqKXRfhUvQkoIS+J6kPeDutiIpkHDQKh?=
 =?us-ascii?Q?cBFg1dq+6Zsdzql/hHMI894z3gTBKCbPE0FuZb9HDFP01CkdqZOnVIWdtdNd?=
 =?us-ascii?Q?/BaM1eNx5IZJ8B17XucDnK5YcxnqvY50iqQOoYpFAZpLgzTGb3TuHYfw5cFH?=
 =?us-ascii?Q?d12Q6bCwfSKMlrE9NNpbAtSB4bYOyzCAR3U4IyPSsKiDWagYcmxespM5M71G?=
 =?us-ascii?Q?w8nVAtVYC5NxIUWKQWcdig0MFeaNBspUMOaF8RWxpES9XiNSsO2T4VgwL0hy?=
 =?us-ascii?Q?6LbeBdnPnAmAdBe34mD5E+NE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8056a9c2-dc56-478c-b3e1-08d925c7eec8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:28.5820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubkT8IrhHJ9nBLG/EkDGE4Cf7uapO7FCw8/khuko99vzb3Pn11vlSQUD57sp86hLvMuSsQG6ZkkDlzZH/WfNuZV9i3UXqc2va8a7akolxnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block.c b/block.c
index 34bfe4ffe8..98673e788a 100644
--- a/block.c
+++ b/block.c
@@ -2770,6 +2770,8 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
  * @child is saved to a new entry of @tran, so that *@child could be reverted to
  * NULL on abort(). So referenced variable must live at least until transaction
  * end.
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2848,6 +2850,8 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
 /*
  * Variable referenced by @child must live at least until transaction end.
  * (see bdrv_attach_child_common() doc for details)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
@@ -3115,6 +3119,8 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 /*
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
@@ -4792,6 +4798,8 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * A function to remove backing-chain child of @bs if exists: cow child for
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
-- 
2.29.2


