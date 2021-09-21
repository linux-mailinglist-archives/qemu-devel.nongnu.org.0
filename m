Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D13413199
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:31:46 +0200 (CEST)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd3w-0003sz-T7
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctQ-0001Lb-Au; Tue, 21 Sep 2021 06:20:52 -0400
Received: from mail-eopbgr140125.outbound.protection.outlook.com
 ([40.107.14.125]:6053 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctL-0002LA-OC; Tue, 21 Sep 2021 06:20:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4RStMT8Hmm/eJSEM9f22TWBass5SGjwge2rirj2xgX5dJ1oCEqHuudtk0ZVquaun7I+Y0/0P6q0NJovy0pUpvpYkJuY9SWaP6a98jPzTkJrTLk0YhhlZJkTeNBUJp3NR0HZCumB4/AMkqwfhchyWS7nwIYp7EA+gtvr63HkA4NAspukb4YHRpSO3uFoaDiqc+3Zy2+4bdDdS4crziTlncxRNzVxFNuoIXflNPK/PV7KKr0vl7gXEA1y/XlY+4VVsjOhSYJOMWQwLh5IsNHlGjAufOQ3Zn3ltODlSz3J2mgotYoiwTX3XndVCINt6M3h0OwUng6mp5dg1D4r4NAg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3jteeIChXzd7qIMt4sHcJhkX6YxeHpAUU/Vkpcy7ylM=;
 b=VPuj3Y0tEzJI36fr/PRf4kAdLROh0hS1HQpZdv4CnjnNBiWwHDn4vEpcHe2Z9BC2g+Q0LJ9Rq3+s1ikukjI8xZup8y8rkkLPub9iujMRZYoP+Z2BlHMWcT2l+Csym76NBZ774eNgiio2feTBj93slSPHq0DH7dsh0Tslix6fg6RccZqq6qpMJriSq8Ou/CIjeW11Bg5mFkX3CyrIqse1+6cp6FZ3qN6y6bk7FBRyRFYSznN8t+k6/b1f8Vi8t+SMd7zCi1WsFYJ8MI5PwBxHk0Xve8xtBy2QsKSulRHFPxmb/Kh2xD0BPinTGt+TEt+OVSbpSOXal8XY6aBA6lCQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jteeIChXzd7qIMt4sHcJhkX6YxeHpAUU/Vkpcy7ylM=;
 b=myD54ct92zXvBzDQXa5iOWTvXXub5N2iYmhAB55MMJnCRELyH+agH6NT5bm7SwrzU+WZwyErAmHEIdu/PjVtop/ADnSkNbpZrQSoAkgt+SwANH9+3xEJ7tDVT2PlHgx6N5KUUaWnbeS+JluvPJquWAquCX+V6Kay9cinGw3FSSI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 10:20:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PULL 02/12] mirror: Keep s->synced on error
Date: Tue, 21 Sep 2021 13:20:07 +0300
Message-Id: <20210921102017.273679-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 151722f6-0eb9-4f1d-8122-08d97ce973e9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631511CBE5AEC3AA502A32FC1A19@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2xrJae+vAEzUmB9BdyACtYctp1wUSnyGduUldV7bVyFysgRj30WvmutsT53G5RlvHiHXiCcnQLBGW4HJo3cY9mOEsVIPsAHzDS4ApXukscEq7jyxHpT4rywcmRbbqCCEi9B2MeyI+Y64kP6OSMSwQ5gZseV8jDp+4aQripovPnrRBQz2KnsZH8o4wAa1uzHywIHlOc7UbsfmebbDJhPXatf9P9mHtg1nCaesXvLILyTMvxy2p+qO+Qf8oLO43xGcKxQrlh9TmIhpNDUAwJnsNDe7ZmoaGBN1/NQbr5bhDa5ME9vJ3v/s8TU71zC2GCPIKXGAYj78G/aa34UeTouwMVUsrPNmmqe4X07rDN5Jbu/qPEOrjZS0dBTMUguTobyFLjy8MZexZPkV+dNGjJM+bPrrgWatLHlF9+pbL/JQK1+RZqcK8nAGtpqrs7t0TrLfPlM1KfEJzqvEbrAIIZiyJ/A4nZPzfVJHqLHwt2xBXJgpmjKH2rwzIi8i59TKL5ut8OtdxFceVv0MkI4lNITpoi8Qrk2j9pVHAD/y3iULwdutOa8nJcQVgyB1wwT+uNYAtCT6YQSbhES9RylizBmDtN+zWsmbr3SYBIrPUplahFLbNFR0ylHxx7KLLBQznqvBkkPxSPTGV52yOLKFlcBlGDHcJfd4rzpzm5YyHoIx4OYKV+KcqUomVLVzePM5vXjrYQ5lLyXkzf7FV1GYqTZEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(38350700002)(38100700002)(186003)(86362001)(8676002)(316002)(4326008)(6916009)(8936002)(6512007)(6666004)(2906002)(26005)(52116002)(5660300002)(6506007)(83380400001)(6486002)(956004)(2616005)(66476007)(36756003)(66556008)(508600001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZQWV7A8XsAp0xcChlskpGImG0/fO3QjArRZ5Z88vC9fT49VROpBxboBoU+2s?=
 =?us-ascii?Q?NMS0Q4EqlsB2GwyB4criYpvIgCloC+QA5A8tiIW1MvPrwJrNXyuyZuIayAx/?=
 =?us-ascii?Q?Ra9PUXvYJzK82ZytjAuamNl8v0IPJHZxg5WhiQ9Nsr2JGRl670RIGDgQpW0P?=
 =?us-ascii?Q?ytDbYIx/ShtbB4nk+cCmpSmoc8Nr1LVlf+uP5CPpDDklFP4caQtR31SKz8mR?=
 =?us-ascii?Q?mlJTYvViTOga1VUXQMwL9K9KsissoJGiaOLigy+XzouHddVJ3RXnRka5xlqb?=
 =?us-ascii?Q?g4ijDPtSG3rbKNA+9oP1mcNXJVie0303+kY8sGCQaLaERvpktFvR+3rG8gqL?=
 =?us-ascii?Q?HesyoCpLFgedAr1gcb3UyV6jjyydSgMl2a+MzQOSVBvvy0mi7Pf7aGZIjzSO?=
 =?us-ascii?Q?SBUPN4BXF1CRYdxYI5xjgwaJPt7Na15djNjwuYKMlxF22Yc2EhJ/0VD6RUCu?=
 =?us-ascii?Q?cYwI9TVIZ/mHPcGywQ2CB6DrEkK/Q56q86I48EeATWDG1tFm8W6UetN774FP?=
 =?us-ascii?Q?hmA2Zsdm7FNzTeTPXa/wwlllr0H2zWCBX5cTK127m0kNdU/pOiUK4IczfZwv?=
 =?us-ascii?Q?jiInEHUZC+XS0ed8gtNDnXoP42j06VdngZwZv0t+iQxeUMOYUWWAKmFPEvwl?=
 =?us-ascii?Q?3GGNHbRMsljodUv85lQOZmev6bqdMyZzpFDfDzXLkmm+evOvJrFRKRacXgNX?=
 =?us-ascii?Q?3NTWYT4579hUfR+5aePVHR3OLHlmVQq5Tyb2xVaREjI93UH1VPvHuLpGnCSd?=
 =?us-ascii?Q?2KSM5fGdi1eNlKpZBm0LzdqgZuH6jA380cq61aNp38GTstlaGWfzSalyWQD1?=
 =?us-ascii?Q?dq+jhbF49Su4WAgz7woKGbKIGR7dTWLNleEOnN5kX/8b0WQ10JGELwJHIs1c?=
 =?us-ascii?Q?QNLoSprPEdedcSSw9YLyKlVmLeOV5ruaAENrnfcQSfNawJoT75xrTL0ipFhj?=
 =?us-ascii?Q?F8hqKgBCLGBOWf7R8CWwBdxx75/wpqoefs9ce5EO/dVogdkcFE0PJ2K0hR1f?=
 =?us-ascii?Q?LCSU+QSoYlj3/GPDAMgtwSbTTmW14BT7ZkOGF7wX0KxlvRgy3N15ehVxlB5b?=
 =?us-ascii?Q?PaLVEtwqRmdRErLfwZ8hJRmGzmw3Vi3hEi0FmEohldJcgQevBD5tKbTEqY+2?=
 =?us-ascii?Q?a4ErmLMURkToSq6PJcHCLgyOXRVfnOuIEYZzxmB/cUPfDmqs/UVh1rujGST5?=
 =?us-ascii?Q?Uh+l7SchpcUrN+WL+F73kuigoXGChof2kE0W8mrctRZ1GWhhdHQaZXtEATKb?=
 =?us-ascii?Q?IlVIlAe12IuiDzK/65PhdPQzEVDy6j0BsvosApG0B0GBC21aiC6jsXLZqrIv?=
 =?us-ascii?Q?bMfL7EXgeWEJmZN/36gPdWsv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151722f6-0eb9-4f1d-8122-08d97ce973e9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:36.4757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/3VqmCaFitLzLXmuclPe7wrseO23iI3ZbOIqG/5AJNOfXMZmBJOWd3Ken+de+es68aj228BI/WrMgzqxUtYGEz4tBd0HRgPX6W8F1vCO2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.14.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

An error does not take us out of the READY phase, which is what
s->synced signifies.  It does of course mean that source and target are
no longer in sync, but that is what s->actively_sync is for -- s->synced
never meant that source and target are in sync, only that they were at
some point (and at that point we transitioned into the READY phase).

The tangible problem is that we transition to READY once we are in sync
and s->synced is false.  By resetting s->synced here, we will transition
from READY to READY once the error is resolved (if the job keeps
running), and that transition is not allowed.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210907124245.143492-3-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index 85b781bc21..cad61496c2 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -121,7 +121,6 @@ typedef enum MirrorMethod {
 static BlockErrorAction mirror_error_action(MirrorBlockJob *s, bool read,
                                             int error)
 {
-    s->synced = false;
     s->actively_synced = false;
     if (read) {
         return block_job_error_action(&s->common, s->on_source_error,
-- 
2.29.2


