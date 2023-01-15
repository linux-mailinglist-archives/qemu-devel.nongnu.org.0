Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7EB66B23B
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5P8-0001ge-6q; Sun, 15 Jan 2023 10:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P4-0001gG-6p; Sun, 15 Jan 2023 10:58:38 -0500
Received: from mail-vi1eur04on2133.outbound.protection.outlook.com
 ([40.107.8.133] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P1-0001KA-Dl; Sun, 15 Jan 2023 10:58:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQ035jfUs/x7mcYbXN/P2I35UD4161MIVGyOAyvwi0AZSS71v0A0Of3HXH/8GjU/rl/T8s9gJHSDxiuvmx9H3OUj7+KcEk0aISis7piSCRRsfFMFf4pB7Bf4SZWF/AAeI28ki74Ov5fnFG91WYh7Lfcdo0paGz/kBVtqZTRCeY3jyaKDk67kWlhcw2rDWVONdVPqjQ5e7WETeaJd8gS6LLNUptc0gtW9V2EjxfI3/cPGTfF6WBskiYglYMhtvRdMBVIwj9t7Ius+Qjt8x6ByzcwgmNB88gJlcBtByYluxKT2q10fzaruSBFAp2tEhwLxYdTwiTePYOjgcHmxelTbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2JqyTLmgfrvubGqo/Ong/3gdvLfqL8+MuBnSe78GYk=;
 b=hyR3eN5SER39MjpR5cYkcun7qBCxXF5ldE+i7xBqQo61hDpwyyK/qPbzD5Ti6O7CeTUhTIKDrJ0cA4Kwc1MjOcVRxG8q/9aFWGocYOvScjfoNgAFrDdFQGg2SyYHQRZz5/hzvMErnlG2YwJ0poazLlCVpktjiKgJhXnILAFhZTHJvxF6FHnLZ8R3cCVJ2W4gS1npBqd7WWS4neV10IAK3HTMRaO2cjWFR1QPYjIUAB/2m6GwVoRf6XLAXiXReoBpz1SQ0EPdLzGLPI3ZN0EOoAOdMX4NXd685KdYJ++FIfmEMR/bDFrzVcoHvnrLSlN/Lp2KM93Ei5oK2UfaQtpgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2JqyTLmgfrvubGqo/Ong/3gdvLfqL8+MuBnSe78GYk=;
 b=hP5+r5h7yYLq2R+je8wVonm2hvCVgeiqylaq8iPkG31WcXJtyWWewXRMG6flCXVJXz0ViJ2Tj7MzkiJjF3xVsnbtd0+/xMz/KoFkE3nwRsEEThLIaoosxvU6kVXeSSg99iwD5ZJ0AEHvjkUH2IqVI5X2N+8syLX2tu7NkC9dYfKq8uh2Ia8WXnMYOjk1lbGVW9GY5TAz2nipwpkqgYvlndSMVfkKprQXqctJiQrBJDzcK0gX68+PnL1/OU+CGVXt++NNO5mjq7vd8VN27GdUUl4LwPbTiUJJfQPyTFPhHlp9teAR2+tkKwlYjsZbXqQqdDefGtScIgU8cjb/S1BYZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB7857.eurprd08.prod.outlook.com (2603:10a6:10:3b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sun, 15 Jan
 2023 15:58:28 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:28 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 00/11] parallels: Refactor the code of images checks and
 fix a bug
Date: Sun, 15 Jan 2023 16:58:10 +0100
Message-Id: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cdde67-c1f5-4792-2fbe-08daf71157aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpfiXW3KgNKWTv+BSJjVwHgUek21xz1LYl1DVcx/Hu2KV1AigiDj5pErgIneZXUKia35KDrtZfFZxcnsWG1nP0paiZhrqa8El8G7rdF7iYXpjDwRJv/TvSwmfECbRH9qtSbQIMdunQDjbFrC1LKpRUULSlTQcGKY36HBk0acrgt4VrwBHs0uGRzYCOGt52EePSQOw+b6N2Ai5ZDzEuF2+ZhbeUBlGzlMlgmnUgXD/wLBJhSkUetDk6sw/41rjx0Kx+SOd/d/JkNk0NWcUS4h/X+zgqtXwcMvyLJF/oIVuByM7dL5XxyaO3aFpNa43+PAS33dGAeEtYP6K58mlweNlqzKAlzZZGqGZJmQ0VdVBTPK0u0gWmiTBIA0LWU6RLtvj9lg68q3v4yrcZxI3Lnf+2H4f62r/jdvxtHKt/3j1uLRAp94bY8OyObSKZMdeRjtLGGS+5YxbPqO833HQ4HAU1rDjBjx+Z2BjX1LKbVBn0tGrjv4LjtZ2fGYGifNCNXCf3a6qCeDm0PWb7rMzZZdvhNcA8ri0+MxgI/8SwY/En0EjQPTyGIM5LSN3RZGKaDHMdPKCD6+/UHVHngt1zWM5Wo7cbjiUAD5JU1RSCxLvFsxkNJH5dO/tMTFHiaxLoURIBQ/+CQLtJny0FK3/gtAXkkHvUVw4q7OLtq5RmiNoS8QQG+uFZUgld9sQL9zfQYA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(41300700001)(66946007)(66556008)(2616005)(186003)(4326008)(6512007)(8676002)(26005)(36756003)(86362001)(66476007)(8936002)(83380400001)(38350700002)(5660300002)(6916009)(478600001)(6506007)(52116002)(316002)(1076003)(6486002)(44832011)(6666004)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpKNJLxWjbUOkckN/MkVGx68eKsvRVNHBrIlTB8k9P1QeUegivzwwnCdEDWZ?=
 =?us-ascii?Q?FwY9jqG7jOw46oHhcJN+DcoluVOaLHTnLGuCzbfAXCgVLCrB0NcwBpxbEgfF?=
 =?us-ascii?Q?ycjiq3tTkR+jzh/4tVR2/+9Cg5Yfona4mIBshyijidkeR2ydppr0DLBLcLr8?=
 =?us-ascii?Q?v/JD61cwS9VSTYiAHTSBpXiQ57MiJGAGueB0dFQ0dO3kx/7nGqpvOlanhocZ?=
 =?us-ascii?Q?kdD+YIlMl92G0lOJwnzsUwvXIiT3WsMOsobB5exPsH/PRKaZtm5Z3CCQHMHc?=
 =?us-ascii?Q?z4EpQ6cvOYmaEmUQtSacEuO14vIR6fLa2pua+zHRMei9oyR3L8yVyUu8Kf5c?=
 =?us-ascii?Q?hoHIXbVkGRWFTcu4S7w08bQNrGJTfp+dBWSntNNWS6RCNgHW19TAGflCx6rh?=
 =?us-ascii?Q?2Z1SpE9CBcxGmqhfQS9nbgsLY7nObuC3Yyk7QWKSck3S/lMtxmG81noFRtzE?=
 =?us-ascii?Q?xDvjXsQelIG1G5ZE7UMXJkr0x4cfQr1gIcN/NlfUsWRqDAaTGIRFRoVM/pjP?=
 =?us-ascii?Q?JiY8xT4d/wQRnCvf+pq0q49SDlN4qkFqaAqUC9vWkKrm4kDX9CbPOSjfZXbL?=
 =?us-ascii?Q?UgmxU/JG+rUQltp6/NhDC4v8J+t51cw7ZjdlGISigFuXyRurho2VFy4WJmFj?=
 =?us-ascii?Q?+ps659cRSbRaNqWD0h4mAu+UKbJLfP6x4IR0KfjjcMiEG6wPSQ2tG2Czc52X?=
 =?us-ascii?Q?Een7+blqlNfacuUzhNv83oP7hjlFmIASUJtRFMWFO0N9HVIuYDsJLQrPCnqr?=
 =?us-ascii?Q?ef3odM8MRElyMbtLsYzpr5LU4nWnNOQkgpY1UZaRCHoHMn/G3WkhtNGSZpxC?=
 =?us-ascii?Q?OBOZgYqYmCtrfHGgBqrXNR3oct8nTjm8qeMJsOfFFQ+Br/vDNFFso70OPJlg?=
 =?us-ascii?Q?3gFXMpH6Vy1EqPYirqhZYjKDOr4S/JA/eML7ku9k8ume02ktd178Y8yl5EFe?=
 =?us-ascii?Q?5h00Ibwhu5iIw4zX7pFNGJsABeRr9o29gKGBXXHrzeCzYa9D6plcD4k2Zg42?=
 =?us-ascii?Q?A/sJHW+k3pCzFUOqnjY9IT5+Ar6Em45+xtsmDfWeLnN3b+rH7apM2eVVeYMH?=
 =?us-ascii?Q?HLIgXzuWyhq2hyyNxrafnSPsNamMC5//OYM9C8fJeLlLtO/FAOIyTpT/wK06?=
 =?us-ascii?Q?uVM0pNbHpG9+Tfq8/FMkzq3vvTRx4Q0LLRAd7Q694icL5zfBuUCp7DtxOHp9?=
 =?us-ascii?Q?FmGwXBPcYo+kGLb2qDLsU6Kq05MAlkZktxJp44PXZ6m7amvnrPFCdxczpwWW?=
 =?us-ascii?Q?d4nZG3+l1NmyL9t+O+v0TkB5aFgV091PP/l32hffSV5dK42FEKRf0HX2/Kiq?=
 =?us-ascii?Q?57FLFygdKsVJpKfScryMQg9NkKiAoeAVHSCVcy/OHeRJM3hwc+HK5DVYgByQ?=
 =?us-ascii?Q?QkSWVgVTjiBm+J96Fb5B0ODRV23aWJj3ZjcZ6Uaq1WDquZ5syHwffljq1ssr?=
 =?us-ascii?Q?C7Q9ut/viZgsLFtR3ySWCP/nfnuqJiBiVKuIy3uWo3bCymuoJziwo3X++L0S?=
 =?us-ascii?Q?XbY1FlwJrzuIcCwQrbcK3T+2GtVnYlSIp8qof+nKuTonJnCSRReJZunGMV7N?=
 =?us-ascii?Q?pMz0y7awYKhMINCjaTv60m3EsMu6Eu4vF0Q0nDoLRIxQMZz2L4hB6ebStJ32?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cdde67-c1f5-4792-2fbe-08daf71157aa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:28.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oq+ak9capPGOtqRb2ME4ut95kHB6KeVOyspyPF3Njs4LLAVjC2tuXEp1NbPmgvOSM+kc4OT9/lY6uGvZGIgShUH4hXgsqH/xxiN3z5bZDoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7857
Received-SPF: pass client-ip=40.107.8.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Fix image inflation when offset in BAT is out of image.

Replace whole BAT syncing by flushing only dirty blocks.

Move all the checks outside the main check function in
separate functions

Use WITH_QEMU_LOCK_GUARD for simplier code.

Fix incorrect condition in out-of-image check.

v8: Rebase on the top of the current master branch.

v7:
1,2: Fix string lengths in the commit messages.
3: Fix a typo in the commit message.

v6:
1: Move the error check inside the loop. Move file size getting
   to the function beginning. Skip out-of-image offsets.
2: A new patch - don't let high_off be more than the end of the last cluster.
3: Set data_end without any condition.
7: Move data_end setting to parallels_check_outside_image().
8: Remove s->data_end setting from parallels_check_leak().
   Fix 'i' type.

v5:
2: Change the way of data_end fixing.
6,7: Move data_end check to parallels_check_leak().

v4:
1: Move s->data_end fix to parallels_co_check(). Split the check
   in parallels_open() and the fix in parallels_co_check() to two patches.
2: A new patch - a part of the patch 1.
   Add a fix for data_end to parallels_co_check().
3: Move offset convertation to parallels_set_bat_entry().
4: Fix 'ret' rewriting by bdrv_co_flush() results.
7: Keep 'i' as uint32_t.

v3:

1-8: Fix commit message.

v2:

2: A new patch - a part of the splitted patch 2.
3: Patch order was changed so the replacement is done in parallels_co_check.
   Now we use a helper to set BAT entry and mark the block dirty.
4: Revert the condition with s->header_unclean.
5: Move unrelated helper parallels_set_bat_entry creation to a separate patch.
7: Move fragmentation counting code to this function too.
8: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.

Alexander Ivanov (11):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Fix high_off calculation in parallels_co_check()
  parallels: Fix data_end after out-of-image check
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
  parallels: Incorrect condition in out-of-image check

 block/parallels.c | 195 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 139 insertions(+), 56 deletions(-)

-- 
2.34.1


