Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C5B682A81
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMns0-0003Xt-93; Tue, 31 Jan 2023 05:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnry-0003V4-0P; Tue, 31 Jan 2023 05:28:06 -0500
Received: from mail-he1eur04on2122.outbound.protection.outlook.com
 ([40.107.7.122] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrw-0006XE-IP; Tue, 31 Jan 2023 05:28:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGd3p49BMXKgdUJ/9YEFS2o+2Qf+nBzxSZN4h22ztqfVb4NYJc9RSG7ApmOpexCaAmUA5miT8qRsVscZkkPiouj7saRMb2FQ69+HJWh028+N6uY1yP/uZ3NT4kt+0vpJRprlg1dTCArxrbls1Emjm0GJhwauDo39ETp4qtYIsGitH1NUzJFOaZcxjf/BXBylt1z+zONQL3UcPJRjJxQYYyMLV8lj1Biz5oA4hPjn2yhGnh/olr4+O4jjkJsCr9zQ3xpqVbauFo4txtJZ0REvFOaP9ckdj7t4eHGFXhGqOZp3Kh0VJefYgMgESn3s+tLMJgC51L4OJ7sZKbuRCpf4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSMqJx2PL+v6MWcetRwwP8P9X79cWki3OCg7wXojsEM=;
 b=BeXGkiUZAzJsMDUzTKGKJTO7GXo1oC+EL0FvYSYiIRceKaFT7lmWB3AZzpKu3qeCRJbspM+Abfst/iN+xty3VWWcLDou0T/dYHzs8dFOnr06S/Y/3jezRYruXjMG5H4QCLDI1yOoCYVdcwZY9uwNnSwJP0Q/YZx8zz4P3R/qIlAL0qgwsE/PIkTIv1WV7s8RB14vr6qQrz2TRfPKhYcF8FqgC96yXrcI5uk1INZpijZWEkjNz98NoiR9VosduDYKvYiWshTm9xE3YRIpHk/8LrzUnkMLMrEMXKkBEnSq24BA0HYBqASSPdJJFFP58YXJq53SrrxNQT0x+k1xOEqcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSMqJx2PL+v6MWcetRwwP8P9X79cWki3OCg7wXojsEM=;
 b=QQin90HnoutbShxowPw67XWnipSbg/nESmM1h4WA3OMoFlmKaISNVp7ytSu1CFtFl07TYyKK653s6hgH+X9l51yTEIlTYr/FeorgZzH61ruvuP4v98c+L5kyXs+/RwXAMU6C+w1gMJa6ZueNaz5EZwVUIY5LX2DG2BYt4yIhLKaTeJ+QEymwLhn3XnIqlbgu4vCTKI/mph+zySr9Xr+WzyIEdzEHSX7jPwtVaudMFfboSKmN8/J7ejUGUrXm4ne7fkewqsxuwZ86yCetLmSDwy22G79YY6uPnDtjpGn15R54RyzaY6QxfqA98EyFYuVbDYCQnCAAZrJ980yB73q5rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:54 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:53 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 12/12] parallels: Incorrect condition in out-of-image check
Date: Tue, 31 Jan 2023 11:27:36 +0100
Message-Id: <20230131102736.2127945-13-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f1ddf7-e95b-48cd-1713-08db0375cfe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j5HnB0rhusS/IHg5llivEioDU7goZFEIBAPt7lGKgzkizO1vFVYj4KXKeG0CLNk2nrVBeJoXufM6Ey7km1vu0rHYje3738DPaIGa34vjyyjMCsDOjfJ0KMlrGLXCMmF04X3khswCol0vGHLFmdAbSycr16T9Gzm1HXgIGP1vELQDy9RqARtt51Cq2zM7ocD96quIsUglzMQF33CYx17b46DhMpBWYRFSB9pa6fJrrYDxj+f4C2DFrQY61dsw8pvvBPau5VmzAx6k1QsxwRl821axlycoRbC4rYFmrSqq02joRyK8ifqpndiuddQZ8FIraaPTxwfIFTyTaO9R/jlFBKndrvOnMFrn6IA7lP0QVax9z156aj0SxeS1TIfpT+m0F1oJj0OS4HB5uunmgwGAEd1mRHYNBABjEE5dAk3waHDKOXYjVJnEnYLqAfXXiozynN1/naxR2nLruwdgM03hPhqULC79SRDTpVt45vABZFGko8sjjGSkSmR93+KETX9TjZwJxQsQbrOFriCdyQ4f9UBBW4HafIMLexUL0WJBGeUkEI6NXl00zS0qA07vcb6/aTz5mR3CrxoWtcjw5ivsNs3Rfo1lsg964ZMrJcjpz31BSsuKQdcaSBldDtAkxqABnUYVslGD71W6vBmA2b6VAEEpzW6tYtSv8b8Acb7f+VYKSP+3YGCIrm3O5Jeaq37K7YTzaRY3+t7B4fbAme+94Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(4744005)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?prcD9JqENMGv+F+JJqej3Zq35yfAyfDcmeMLIMwqUc/gX9iQbANPBoXbd9et?=
 =?us-ascii?Q?gWVM7yOMymYENbUZmJUr/bVzramY0tp4W2HUCtbPNUMgxrIzg2yc2hjC2CqJ?=
 =?us-ascii?Q?fi87UJDs/y+FfVmaAnsI8oMcEgOAnPK9p4VPjY0AZg7XDeYAGPiMOZzpJeOA?=
 =?us-ascii?Q?v16oeqT7HtwfKZsNYMg3IeMNP3o+ke9uofQnwFD0pgSVljKzKWwsJb/+qvcK?=
 =?us-ascii?Q?V9e6m7f8sVizmCCFb9lkaWvuO8AGrO+EGeW5tXTbAbP69ENxn8wpHZaVbyJi?=
 =?us-ascii?Q?muXuPOeQG871jclv/iPIQjLNf5ApFo2U/kHeCdhfX3hbkCUQdDxnMKhVKlPQ?=
 =?us-ascii?Q?1OxHIbke9AG/yHgNvjsmuaolOg/8rWiqKLvB7gt+IfJba5WYvqTCAxz/9Sqp?=
 =?us-ascii?Q?WBEdUU6a+AJDmLsxvdg+WYm8RAd1wd5kWp09V5Y3t4tMrPDzWy0li5vw7UcH?=
 =?us-ascii?Q?OU2hKhwgxGJQ7h4taVup00jNPUOY2WdKHpj2ixceV1is1Z+zcG014kVwMWPA?=
 =?us-ascii?Q?+jDw505p4joW0499/4532olnnoFJpl321LF06Qu4Wcb6XZpv/h0L9wBRl8wl?=
 =?us-ascii?Q?k0omUCQD8e4MPaqSPjL80uwcOXHgG0IRr7A6MlfCScr8vooOT7t6ce2hAnrG?=
 =?us-ascii?Q?BU1Ble1SGL1osCpnp1ZDmyW8gS1UyPVGbTnOeJjePfM6gD6CflUU406p2W+t?=
 =?us-ascii?Q?GwALtoOGbdC84VhXI1g9gaOkXxqLwuZVETcHOve2bHMPHjDTjRDCPemYpvLu?=
 =?us-ascii?Q?H1XAdhPfIAs1iJoEL0fhaspp5Hk/kA6fm31jFKRlKeCHNYoyY85pogL0+1b4?=
 =?us-ascii?Q?0vzww7kcACtvEGn/r2L7dUAw8TCFs+x+l1RhWdJHFlEcyGT7bubBNVytl5zD?=
 =?us-ascii?Q?WCpNrU9okmlqrUNOOjeJqfzXjdc9ku/emmGzelyqNpIvfajD2Mz9mpTexcS/?=
 =?us-ascii?Q?O3NnE6tqFY8npe9IRH6H4Cr9NfTlOExx3ZqELVt3nv0FH8kejHkMbS2y8/sr?=
 =?us-ascii?Q?2vfRWG63FRH+oDmyev9c7KYZOtkZaJtVJw5tyiryN8Y84ihrkw62htKdFlyu?=
 =?us-ascii?Q?hkPpQ7AojI72DWWHQmgSq0Gqm9gn8AsZgXvIGBd9phgnlJh3zhu+dA/pbYVl?=
 =?us-ascii?Q?bVS4FY68E7R9mjctoqj7n37IO4SP0cqsET1bVFziAoZLTzgCYQDGo4jvf29w?=
 =?us-ascii?Q?iqSLibrzbSCN9WOXSz3UhDe2oUc8q6gWJhkxPHpjhwfWXkifhBMC27R/QQ6Q?=
 =?us-ascii?Q?b6LPVEM/bs97qT6QY0XRafYkav1qtuu3hbYkY31G1kfkeJ0A9EgLsZTXvl6Z?=
 =?us-ascii?Q?J55bME3LCCI/sCawTKGulMqFRsTvdid9mfDLRJ9SoN0w+9VIkhhCd9LyKMvV?=
 =?us-ascii?Q?E0rsVwVkEBcZVuvFYjakK+HyjU4SMe1N0ifxAXxvorAZEpo0t3Ip4z0efzAI?=
 =?us-ascii?Q?Di4/4oFT4mylIOurRBrIRJaZ58M7Kr5dK3wESTzcw+SNIcQuOSZer4cVlLWy?=
 =?us-ascii?Q?3UNIqnOlZeacmZXaaAVqPSzBbTEJ04Alrxz+XpHTq7txi1gGQ+lmXCORdim+?=
 =?us-ascii?Q?GRhBX1TNtzGaNy0cgz9ozczMy1tlJA82s/Kj4UW1+WbswB3/hFWxOMJc8+z/?=
 =?us-ascii?Q?P2vgfQg+8w5cJqkHaI1v3I4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f1ddf7-e95b-48cd-1713-08db0375cfe8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:53.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvcH2zdR3R8q9NJFMjTkj/Zg8XY1czw4utu4NNH3VEpG0ML5YO1JFc6DYkuIXwO3v7PVhHc8HMdegp6yu5TbJoDTfRadOaFmeHWhub+hHcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index e4faa14add..e469fe3f78 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
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


