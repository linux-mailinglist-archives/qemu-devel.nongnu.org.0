Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E1682A80
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrn-0003MC-TW; Tue, 31 Jan 2023 05:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrl-0003Lm-L4; Tue, 31 Jan 2023 05:27:53 -0500
Received: from mail-vi1eur04on2130.outbound.protection.outlook.com
 ([40.107.8.130] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrj-0006VK-VO; Tue, 31 Jan 2023 05:27:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS/lf8V0O8+G7j2BxJxv+Pwkeb5Gz1B8nEyhACh3MC8z8owJlHY5+Bas23H5f6xzfDhS3LlFhYZh8dt9ndLqvbpHSx8NJQXSf07yvuOC8MgHAYY/YyZTv+IjglDZMwxUbT+0BLkrbL3EzgFG8z0oidGeETpyK8PLJiJPX3PfgzzZDcfMn2ay9a8OOIldR2t6gZU7duEv7qfo4jWlQYMRwuQ3vYu05F9Ll3ySq7nAWlUG4QaooFK3BSDrLfcjt6pPgSqvK/SucaNIJ0+NGFsxDbRF6Aqn6y+B8jIoQRhwEU1K7xTi3RXm4a+bwNudO6NfbxD/acqcQ2AXCjBSNG6Alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeGMhNSAPiDE9IKAGEcH6LdjAaaIhgD2Fgoc4ctDdEI=;
 b=i3JZ7TzAm39Psh1el83tomsvP3js6LDHKQuk5S993uVTqmZsRIJxP9KQFjO5yHK0u7tftC+IWX//vLcJsQCRScQ51KHSkpBTMqcL10bTcoZKSe0EqA8XtiqO++2lED89F46lvTT5gRjgMBZ68HG4j7n6S3RSVfRdG+XuTyQVBLLDf/9X6BkcRBeVKkLvx9ebf4C0ZyBHurUEpQ9JUNV5B4I29O/otyT1XWt8NgT3ZBptbejq8XvNRoboytWxbxcogRq/yu9EbDAjDMJ65aP8/ZseJ3DPEKEvIbG1T7UGU1lxIFQVg0ZwzMCmpYERj2K8yTC22r4pUDktVZFkncrwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeGMhNSAPiDE9IKAGEcH6LdjAaaIhgD2Fgoc4ctDdEI=;
 b=HlWUoaZYCrFEf+BMzEME6Yg8IDFfzqsA35CYM8qI6VG6F8QwL+ZVXFYg1PwlYk774uoCu5V5qcoIsOJpCvIyAHqJmdJJxG53RZQD1sFgffIYk7xFGI500HzGVRLN8+NKBFLFWYX3erOBaFuy+g8xTFcKYo+RbTXBXgnIePdpw/01No1qxbTGy8SpWYDXxu+FgXE96WPk0Zevu+4Dk43H/yHfjG1RjBzugCRol2MZQbfdT4NJyXs2bqhqqaauJiRYSR1SuaYStO63WX+mecQmv+xOaxvaJlK+8SxZN2KUkR7kPxvHN1+yfUpYZiFTcGlwl+OELpde8Zv8Pce16dLvbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB8615.eurprd08.prod.outlook.com (2603:10a6:10:401::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 10:27:43 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:43 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 00/11] parallels: Refactor the code of images checks and
 fix a bug
Date: Tue, 31 Jan 2023 11:27:24 +0100
Message-Id: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 3198f36e-b3dd-4806-939b-08db0375c9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYl7B5jFr9wqWvBE4+ZQTHeJ7PS+YCF8O1hqjQmZLr2zhOlVvQWfddptHwrfOawT3dGY1Qyhs3DkLDPHIkQGBN6JgYRZj1o6ZTe7QtmCuWjM3zuFNa2MRBd4+rZze9TvA8q0M17OO/cI57kQa9QuGchCkxmwhuIkM36RxNgmWds8pMliaRjimbT99r3/gPJ7nIGosWJsy+TOB/ZsVXg7U/4m6q2otvOl0l4ghMkUagYnO8g/tseqZtNnHnjbFrVfdJc7BXCWfmb02n3wPFehvie9yhExMjo3IR8gZ2GGJ9Mgw6FXw4Zje2Cz3RMmxsdJ1OJ56f0wHTDWpfnGuz7hrYFvi+0PMqVfnROylww0Fe+Fcm7I9CnpFxRdwXVbVYgJA+NQmduGSo4M5L8/94Lu1PPGv0yYoGtRKIoF/UpOQfEb6m/6jwARPe4TPTfqP3HKrHPFY+SWhocILBlGaS4WrWCM6wOwre0zQcGG4bLjwjEvgnaMARrl+sTfp4nig2FGz42eaCpkIh6FnbM3RaMf0/AtnEf1rTE1WFzMLtANHXXz1HzdNa5HIrOxDnKNl4kr0zwqeZMIRDxXPuX2mo/B6cmc5pER6TNX5dBgxbo/dQzaqFCclHbuld7dP86UgPYVYl3PKXKLxGAgY2Xz8TuxaZsiRyYR+XPfMnImgljeyKleBYOX6XEzoqa0U3q5V2vy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199018)(44832011)(5660300002)(2906002)(8936002)(41300700001)(6916009)(2616005)(66556008)(8676002)(478600001)(52116002)(4326008)(316002)(38350700002)(6512007)(38100700002)(6486002)(66476007)(86362001)(83380400001)(186003)(26005)(36756003)(6506007)(6666004)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aKvu1b8hN2VEtZ4BGTMd34DRIr76M0gwSp7pioTbhadcc3DOwbbyapJFzx7c?=
 =?us-ascii?Q?y776L/ksgzglEOYwI/mtDgmHTLDLCmTVK/E6DXWjxNfa+KLySnxrT8l7JhW2?=
 =?us-ascii?Q?ukpsvXUgKk6fOjmLQiHFw9MFHHijp9GlD2vJ76bQ8CwD+qlRyKoXRPnlHuGy?=
 =?us-ascii?Q?lJaA6jjC2yOfeB+iN29JhrRNTeYc+u9dMYSvmMdvGD56t47flKNSgjVmLSTv?=
 =?us-ascii?Q?/3vxUdXNBCLyMIJyyynFVta5Pc0Js5PjbOKTISyjjAcx9T7ar8ubBBIO7gMp?=
 =?us-ascii?Q?Y/y4yJhD4/BXdIEyJ/SyaNmmOJM+az2r1iNhPYPM51un78tdS4c7zv9NH0xP?=
 =?us-ascii?Q?D5UFJu++8RkqySp5Z+ufGx6q/jM3xh5uWekUQMINfoeSOkJJIo9cdi9Rkn36?=
 =?us-ascii?Q?OS4z6KzT/8XfddSArGd0AejwK/bYwrE4zxQ4K8wtL7chMkj5YRDw/Px0KiC1?=
 =?us-ascii?Q?8AKYZatxzznR/mzIjPI3zTTL+pKD4nfUfrkxhHIXmismGkbsvnzwfRoULjf/?=
 =?us-ascii?Q?r++34SaQwQou7Ec5V/tWkmO1Jzf3Ia6bn+Fu/Be5OwYR9pFdfxjDEOGNzxUT?=
 =?us-ascii?Q?7iQPjeNFME1vN4nA9btLglTAXBKEONx+Gk5rfvzro03j6hiKj2qJkZC4yOIO?=
 =?us-ascii?Q?OAtX8BOuAWKl1mTQ5uW9epIZiLWKjJS0CjnADqmYLA7hvylLSrg7if+0wx1S?=
 =?us-ascii?Q?UiLrRPgaU/lg+/hruGazP6U0DYfctyTjw/U1WPNy4LMg6cyU7qLEHipeRPBc?=
 =?us-ascii?Q?VFhjDpHmcumLScNrpSB8e5uAzkOFgbqeHb6eGxqaPVndozye+gq+FWIfEbgq?=
 =?us-ascii?Q?H3j865fFvlhCz/0Uhv6BHbg4b8FEPr5kXAOa30uB3jjuvSsbvjMLKkDORQLn?=
 =?us-ascii?Q?r0caxo+Njk8xPPfmqFpX687gEXFTL8xqos+I9JtQajxoBj3PIU+kVczHMuFa?=
 =?us-ascii?Q?2VtEMa9yybsMdrtIJ7+7SFRCoqsoXqACgnCK/Lq6gXQ2Map3BPeOJmxWvBUP?=
 =?us-ascii?Q?JUuFLfbEpJtg5D9H90xNHHkIUNQGuhhynA0AAqO+qlumzCZMmmrwj7Zg1OoA?=
 =?us-ascii?Q?fyPiK9+y1XKuXiA09P4yc1augaTe+sFFv+hIuuq8SsQpcbkoUMYv7C+/gHP4?=
 =?us-ascii?Q?ui8lQihazVJjFrkOpssgpYdtFl0YLMNrBU9yBLNbKTlW4qqbZIbWGM9OI1Kf?=
 =?us-ascii?Q?jUSxsbYLAzvgAur2r8gS6YqUDCzW1tCpXeWfNbWh9kHGH+0QQPhMswcNYSg/?=
 =?us-ascii?Q?95NOufVnceOQNoVd4DE0php3fjkoYbZFM2lOhxRCoShw1nO88KyVlG5cw8HD?=
 =?us-ascii?Q?T/uL8tdPJiMyZw+6bdhBAX2PoTvyhHIMrhB6HpK+eSx3R3J6qKDnGTJJxzV2?=
 =?us-ascii?Q?a3KFGXHE65H15yc7bC1xqTzs1S5DIYj6cxZ5CULXCphzBVQAhZs3KZ5uqPsQ?=
 =?us-ascii?Q?6id2PwP9edNk71yRNIxysjk5I8cRLTaSAOa3Ns2HnlmAdhkFX7pni8PttZz9?=
 =?us-ascii?Q?TwrUxCOGRQO5DZIewzxkOyHOY+vXdGeplGxjPoAVMMLdo/gu4mRWBm6W3uPH?=
 =?us-ascii?Q?8Kzt2D8yT0TXujqMZ/QokVhTPR4wpjhl0MOwmL/x3ayT7RLtf6QJuRrArFiP?=
 =?us-ascii?Q?q5FP+84s0fNvV+C4w9eoPc0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3198f36e-b3dd-4806-939b-08db0375c9c4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:43.5779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgkQUhYeL71yNozQawhSJHSDtf/LMABDNVe2mi8kx4TadZE/JEuKGdwUpt17gNYwhMKP0D4N4nlzF7kF/Dk31bqf668qCZy1el82MOwj+3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8615
Received-SPF: pass client-ip=40.107.8.130;
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

v9:
3: Add (high_off == 0) case handling.
7: Move res->image_end_offset setting to parallels_check_outside_image().
8: Add a patch with a statistics calculation fix.
9: Remove redundant high_off calculation.
12: Change the condition to (off + s->cluster_size > size).

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

Alexander Ivanov (12):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Fix high_off calculation in parallels_co_check()
  parallels: Fix image_end_offset and data_end after out-of-image check
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Fix statistics calculation
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
  parallels: Incorrect condition in out-of-image check

 block/parallels.c | 189 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 133 insertions(+), 56 deletions(-)

-- 
2.34.1


