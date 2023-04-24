Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294B6EC89A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:19:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJf-0006KN-BD; Mon, 24 Apr 2023 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJe-0006Jx-18
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:58 -0400
Received: from mail-db5eur02on2071c.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::71c]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJc-0002zR-Fo
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUifEORzeTR0nwHo+xXnnzU4UH8laqMzjho5HkETIWf6NJu5sNaJ7s8V2Uz3dmDnJ2T0DckQs5l32CoI2xwB/TieWMoOdSHanZ2jjlQH/J6/YJIhTSMhqCwhVmnhpq1599Fsrs/SZ1NFiA5TjbvDnv+rCJsJDM7gS6aR78/6pFkO3XxHEh31cuMvBgFKsd5zpYzq7IENXkNJyWRgTomNf3m7nZCii41clzdZGZwn5dEgu3q9tQ9k87eT7jnvOYmfE7PDmVMoQWKLnkZzpe5nSJQ1S8TWvITOmu34xixfw8X/rivuj7NYwY6n283JhPg8TGgf79f93pGpvbOm8GFznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nx4ydLakxGaxs4rP6xdhzZCIhq1dnfz5GYSH+RoWka0=;
 b=W8psnfkm+oHTcn/zlj6GaLkiZ6hFqcgX0U9Y8OOTDCg0aSdAeYTDkO31w3vhUi2dqvKnwLiOZLK2dM9DzOT/tsM3N1irmB9LEpcDnGerJh0PQZs3mcuojiQRoMcIwA32SUvX4QqHIGAR/3SNnWx95juywC/BTYUWecC7G0cB/NvwHGZ24FHr4lZSB/WXkBj089OeQ6PhPtNeHKtB44lgZGm9V7IiqwecYft4CGdFwmb6X08VDU5gPbheyaiPPsZEsMvpeEHQ4mEHndqTx7ARG8T30G4xOxeR6KBL0JCMHW8GmhshQa6MI9zb1GBZ0ugE/H3fTGdquNPl69GRRiUwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nx4ydLakxGaxs4rP6xdhzZCIhq1dnfz5GYSH+RoWka0=;
 b=Do4YiMqUBytI65uYwK/Cui7EFS7Ex8nbYv4+FLPWD+gH0HjW3kxxg7ZH7I1ipFgzEKAHPncHgOpaYxik/PWaWsVsoa3VpT6BX/8KPwPdGquuoD0ykjwVtV/ceDOjq51en8eyOCjd4WGQbDvJOWMW3ArNBLqzHS49BTtW8NB0Hs/XFlr+IRgTT8UMp/16YZkw8w3Bld1zKOlqVYkHAwJwlcB9wSq1N3qa/8z077Tw0PgN7cv/jgSSFSwAEWElJ7NRbyOLBe12C/E3yJAqA17zLgPqClUUweycg/OpcBeI9PTN0sD1hZhqhBrmyFYQLb6TrkAD13BDMylTF7A+tRG1GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:51 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:51 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 12/12] parallels: Incorrect condition in out-of-image check
Date: Mon, 24 Apr 2023 11:16:26 +0200
Message-Id: <20230424091626.195590-13-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 13de4301-cce8-4acb-4033-08db44a4a34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUUllHgzK7NkR3WQjD6yB6M8g6KzJHHL8lL9b/QBw4YZXQysn6sSIZREcuFTtqR9oFDAmVCSiKllFs/ASEgL/WFIOsQ5O+P2VCAHgKttLavsan+3GL8xGD0fBym6fJYuuvKx60te+zBTv36JH+YgE8PGaJy4ynR26Qy67rg9ykNTycvXuiNXu6jR9HyZV4asKa+SOOn7gC2TNt5MYEwOFMjKFle9X0sq0XuLCdUrMQjgbWxnIv6wnuhiWVrQm9hihLarb8KRhMMSOkuwkSQ+Z2HCTW9mhX2P1IDn3erQWVh4gyHsBIfnn4ud7W7dDzNpuswLxwQLCKPi1pZwrXKQ+4q6v66yEAY6KZcIQeTJGaUNDDpWYYd53SH3QZuMyE21qG7BQsrHGFp40LhRICluycVHQ9zdE5zOzgdO7XUMEnPQurZNpMzzRv3IQebHWGqTGlFZOF1a1dAHvvUlS25Hc5ZJiE0l5xI0l6GZDhrnDZ3ooQADkywwMUb4OSp7aapvRBnRjr3kAouPUJEHfFwDKr4SoPbn7oEYCYxUfUFadDriAzzU5wVPWJIaaJbgBaFFXVXojeBsu6l+MEbMdV1R2STDJvrLeMKx81BjXfKwfxQOAs682wwF4fBYBHhFTDvE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(4744005)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?obb4W8sPeeqeRn9484GNUod9f16qHETQnl3vBvphWG/14b9xQ64aJFpyVATV?=
 =?us-ascii?Q?07bdvb0a/YKSKO49B9vVNzLlb+0iNfkwowKu67NP/oRgOFSH+Gm6JwgPAsot?=
 =?us-ascii?Q?dOQiS3N4LqGh9b0QfivSEwMa9S5sT80QaZZdpG2a28JzxaJvFefOqsU2ZNhz?=
 =?us-ascii?Q?iRlELs3/7EazvHhzK3Un54J+LEJVN0wmDVCTnNdaM63rxwL0b3ERymqFy+Gz?=
 =?us-ascii?Q?tdnJl9Hq8lSVI/eJFvbNz1+NvNdS2dMUv2ACB3Nfg605WOXcaydHclUUZIUY?=
 =?us-ascii?Q?LjSMgF/6As2NbqsWOR94ZXmsoArog6mTsphOEavWaVzWe8p+pYZR8MEWAgd2?=
 =?us-ascii?Q?aIeqKMSetPSy+0K/vd+GaOvUPYuljSsrFFJ0Aq6QSQKCfHwwPC6rzVStqizi?=
 =?us-ascii?Q?gjqzmuLjhzQk1v6UyBJiPeZ6mClg9Kq4CxOrMgBjlK98t2pBCrpVSGj3TPYx?=
 =?us-ascii?Q?6VdcWqSkcRgcckBlbwFB3fg1Voq8PvoIuCB6DGk/yxbvg2kuBzWWWk2gMrtD?=
 =?us-ascii?Q?gwKonucdrvRceWG624lOV8b4FPjStzxPjP/1ZT+djtn8Mmwq1erUa4zIQPYT?=
 =?us-ascii?Q?hLjEYlHFciJVfHA4QuzX1UzGBWMVC+jzZDYyHunZlrK9Cvdw7Faj5pqfSGcu?=
 =?us-ascii?Q?yIZZWKPPQ1gWh1MgzQrV7didUBv1k1WH9p102G91CEuR3/AvV9m07a0RWnPC?=
 =?us-ascii?Q?SyTD7XtSayyZx8OjgSybFHVr5l5IofJIpxAGX3thjMSLQkV+QDVRXE+qayxb?=
 =?us-ascii?Q?UKfD8i/MK98BLPGh9XEj3/oNuir3YM8T8quhPo0n6ltFvBH+JvuSkoiyvPPt?=
 =?us-ascii?Q?qSrdhKDJ4PxWnX+Yuj2BbLQyW4fwUNtb8+scfQ327QhuZ5FDezfV6O93SDaW?=
 =?us-ascii?Q?BLdlbcQx13QYBTOyAYQV3FwaQwsZAAnZAkhWNhSOTBWUgOZRuk8VP+S9Rnda?=
 =?us-ascii?Q?KEQWqXRw0svnZMMopMdH2Qa2bp2eW13WmlIUptKvhGfMuyzhUCcrfrf05RqZ?=
 =?us-ascii?Q?/2Frn3UKLnWayjcJcEGi4Wc6kdYszezAk7K/O05ayVnyHHal0nzlp4/5Y6Sx?=
 =?us-ascii?Q?zPxsy4/S47hEus8sUCqZkKI//AbSeX74VSi30B7TIygk7+NceOiC3h9VziXx?=
 =?us-ascii?Q?QkV7Nw8DrhvSptXAqEEWI6TcHbEqeY0VmlP/pNTwiYasC0OoLeOeXWFbODDu?=
 =?us-ascii?Q?IemVURmykZ1yZx4XQUiBiDl1APscrd9MyRPauNiPF/1hrMriX+kaNe0EUpts?=
 =?us-ascii?Q?YMusEjoUP+H0zfecjvY6Up7didmTsiuNJJW+Xqr4R5ihprYEH3ULRwKEs7Sp?=
 =?us-ascii?Q?c6+q15iuh8/6HIpunT6dw4Bucgb+Gmrcacg84p6YhsCv6FnLF0rmrbaFuTIp?=
 =?us-ascii?Q?jnf436BTDr5HNykptTydB1f6ADY7vofCA1kG1+1aQFdlvoRlrFHbBHUBXCWd?=
 =?us-ascii?Q?3tFAfTkJdog9HpPtk4VVJIcKTazdggAsGiLxwoIpQjAFLGQ/ueqI/QolgYkR?=
 =?us-ascii?Q?s5LOgLYUAyMmVODW7fHgmcqG6Y1Pukfq5/JSSYlzl0E+81SCDqSWHvsiy2lv?=
 =?us-ascii?Q?MouRqNLf2CsN3kG60ZlXouuGElV9eBuwXGhMBlG2EoWLDw1CeT7g0ICdJWTW?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13de4301-cce8-4acb-4033-08db44a4a34c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:50.9984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0zmazudqfALq42qSCpNp+/HCvdwPg9/nN369KAOgHih6nh6rFaaqQQBfq5lNVjng9JsRbPPfZT60P0pgxWVd4uRtiPOUk8NPiMrQdRubwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe12::71c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All the offsets in the BAT must be lower than the file size.
Fix the check condition for correct check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index a6a1c7ce0e..ce9ac47c55 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -457,7 +457,7 @@ parallels_check_outside_image(BlockDriverState *bs, BdrvCheckResult *res,
     high_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > size) {
+        if (off + s->cluster_size > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
-- 
2.34.1


