Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35EA59BC68
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:12:48 +0200 (CEST)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3UF-0008SJ-1F
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NN-0005aw-7O; Mon, 22 Aug 2022 05:05:41 -0400
Received: from mail-eopbgr80100.outbound.protection.outlook.com
 ([40.107.8.100]:45028 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NI-0006wm-Ji; Mon, 22 Aug 2022 05:05:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTevr1e28BPp6WOMuOMmrlW/UDOgygq413iC8/yYOS1Mewa3G9VwppSd9rQMO+dgyS/bL2DeSBHifXQZ2EkfEOvFoyLaRFUtWEKLuFglv4mDWr7Cde3vdQj1omSS2/rfZjQnWMhdA87vuhb5X/3UHeM2zgiSgw6QLaw+X+AGxX6WbLD7LtUyGBJyjFzt8q7LZEJb0RjeAiCcFwgRyACmQcJpPBGQDldh4ahE8Wqa6upzmWY2NpQiUMWLSjuC1V4kcmjPa4JCAYuO0D2ZDLSmbo8X7JmswfhCits6iA+xNEGIicaJ4wzsXcRS7Lkvdb3/2ksJigKKTtAz4baRFb0uPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9562cpvQ4SL8TTuAV4hMbStv3c0Yoyu4y3zK1ubAJw=;
 b=WSM6DoBCAIa9MRdWtVYHPlhYs99+absXMKWsSBfcWTmN06W4ne4QtodFhQrf7rXzzHhz6GXixGr9ioF48Qk7jUSy1UpoV1y71dlrgZ/n/0de4vDiD6EkaqENjjZuI0/Wy8W+tP1uhWganAjGEVwe3F8VJRofouFN4OSNFzvxww8gyGDG8L2LNUadbLU60+DefKv7khJHG4KOvEj1ApnxYMTrLvjaKysG+DJhz7hbVDpKN1mSAafSzve7o62D23OhmTW1dJNF1FMROClx1w7W2vSTurCDAYaeysgtKNzMhMWiFl1pbR5y2oTY7NplGFCfI2b7UunMru+w0oh2zsh+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9562cpvQ4SL8TTuAV4hMbStv3c0Yoyu4y3zK1ubAJw=;
 b=YOZlWsgwf1iapwTWqvw5zGwV8QZ6Nevsn52zHA7SgL7LB160TEBUBwmb4pWnbI2Qz7HEVSqRzrceYGB4TR301lfLtPQXUQc0ZdhJVeP50D8yz9XdhfVPnz/BKEE4RR7AB7QdSx1sSqBeF5JWkoZHijsQne14hrB7nuYoDzmBa6rSAjb1e1U+c7Ftfi8eLSkTvS9mn9LXes1uROMps1FX9VkNICz68MgnCx0+lc7t3ZyOVYmYhbAQw9RKbRyOUVjohQdDvW5n6v+LaonV4QYlbY6cfuytH60X41TyFVC6FgdechOfqYWCkVcro8BaJqIQzE6VOmCCfTA6SSR8+C3OVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:28 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:28 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 0/9] parallels: Refactor the code of images checks and fix
 a bug
Date: Mon, 22 Aug 2022 11:05:08 +0200
Message-Id: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cae3e247-477c-40c0-b05b-08da841d748c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgjbEPJQoGxhqyTQ9hw0pVE3mLVSOi0Og+BOb042foInYTfG4UTkp/4zazRW0hYpjt2bOkM6EXqyfeGjbG2VhtfcHXf4VXj9ncRCkoGVK2hKEHIsPr8Hc8LSjR4YfEyVDE94L9rBcCvioSFdiincS0SLgVJkNf68QesnqqZrRPeHhFmYGie7WHxwnjxcKFIknFmpxhfIYnMApsTZtM1MzGXQVTVm/4MA8K7RNJ6+E1ryYZxZ3U/sDATZKKUpcnZazYo6ZveAbt4KcUUWMBvTpWtX2arF9UKSkZK74mAU2yUtih2cR7FtqSW0HyGFMLtt4Hph4z7T5AZAl7W+8JXMWaOfECM5vgeA6zs+TghuziS2mPaM41MBBIglBPiUpkffm7OmChmaiaLKz52Ui0RJX4XHh+VS5mOg7DkqCMqoKFoS9r/GtupaaMhHASC2FDX8fNYOe6KoUF8vIOO9JljuM1p5fJtmIF5EiazznjvKKNX0Zdco0ule9b8sMCKqKkBK2OlBQiqQ7ymfhovrf+cJu67rUf6iFMpm0siuczpBfNJTZ5bP9jqq7icKPj/vNMSWX82G67qvU6h4Q8T3J7E/efiEyREXgwM0/Goy4SazYaUyz9FsGWsuGY1+ft3zSovaMjeTfjoejhDtWR3v1cCSxQUFIRBzdMCTk0V2R0gBcmEoACkpfkD/4MDv6ChNMPt6sBJKKg3LIF+JQdgD4MHzh/1vGhDF/bqk4jYr1jw6ledzJ4bPM42FYnF3J2gGonLG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k6TN31WoweshGl/r0cg75U7hCnKzBhuwgqfjzU7H2iC3+nkiMAtqOwxw/zXx?=
 =?us-ascii?Q?HL3b82xSmzfqwT4Rsg2tqNUwMn8NZWOSPjvg/RvCL7CGtjFZKQkjUBLWhyT+?=
 =?us-ascii?Q?bw0SRiMir7hhlDFT6lvi31d/BMTz1JeFlEPDBm0iYIXO/UkNDzzkwQGl1dHe?=
 =?us-ascii?Q?td6DbnuuLFVgxvUw49yZ9ocpWhxwPOTOjglrG/FHRKeQ0VHVWbC0gl5N5qls?=
 =?us-ascii?Q?k4xdFi/ucOWZ6+hMxmrpxUOeVDNnDTqdW1IoEoHq58JI7+jhe/vN+chZ6SAe?=
 =?us-ascii?Q?0nGFP6u/b2cOenZB7CwdJFvpcRuwMT5PwrowygGiWjjXxW4EMztBHr00om+G?=
 =?us-ascii?Q?ynCVUX7kYqhXgOoP/5An6oD31TSy2LF/FxAA7cuWimjHO1SnZVOFI3Pbrxw1?=
 =?us-ascii?Q?4WLua4PexYNo2tCYwA3BQx6xfsn1l5z+wWB1Gp4g2Th518bzCZX8leictZvd?=
 =?us-ascii?Q?y3aeV7hHrxtsGBzWHiVoShwL4hK/MOxycjFpTZKCb1HUDhvN7fg0td7q44xb?=
 =?us-ascii?Q?EI2o3xEONZa1ta7PGboLW+I2GUcUsSLnXAqKQjzcI/F26cZRD5veFqcztxBM?=
 =?us-ascii?Q?6b13oXl7++rrx1spjbahgR50msfK87XmtXek5VpLmP8yQDej8fhLkwjS/VSo?=
 =?us-ascii?Q?tKR89NmZByDe2cFQ7bGhibdOcUuubumHoTqgjVmd2Jd61CqtJ1XgQlH74BWg?=
 =?us-ascii?Q?oMktwRY7hV8WRnrTh75ZWfGMVcMU+y3a0LRTuvK9sp0KaL7BQYK4SDgpO4CG?=
 =?us-ascii?Q?sDe1CP9bjT2eXqoz4CWjIdi6ehZSvtX2/4+XEthPfGcvdxhjTb78eRm1tcl+?=
 =?us-ascii?Q?rCyJQ02BWGPVoa7UQPGQeWDwxy0FubwQWPhVWSVnT6U1iilFjAWlzOrUU9uP?=
 =?us-ascii?Q?+lRTgOOtC4RM+1xm0I5FVmZgUOghKSqzghpK/SvyIorDHNUg1G6rEgSNKjRD?=
 =?us-ascii?Q?FvxaFXpQR4bCp47183XDa+D8CM0eolu4mzoj3I5SVUuwGLrLnx1U2T6wkyfG?=
 =?us-ascii?Q?6zmSVBz301/0lWJiI//cR/YpoQ5Qzk5xH91sdgZQ7OXsuLUdx08ycYXfaeQV?=
 =?us-ascii?Q?xbjYtziaJ5iweO4PJjWy0aOJGKzccNWTPsayK92X2BNwqTl45RR7gjCxmCvZ?=
 =?us-ascii?Q?uaq3iDawxyjVJv9jn1xbng6IIzRhNfx+EVsaoAQHv4Rf3xeVkhSi5vgnpY1F?=
 =?us-ascii?Q?npMx0ThmX1KZ3hSVfoTgUxtcdpb+uxbCPnqRm7B5J/bo8SIg0gMHgdBZPzM9?=
 =?us-ascii?Q?9DOosVgR/jDysflZjFLl3kYElvpIfpQ3JzriH5jiHAjhZXVYOm96SLTKjj6+?=
 =?us-ascii?Q?L0geHvcNabB6YAS6BdJr+rdrPZuGutts0WA/wPLlK8zj7booaJ5sw4MY4de8?=
 =?us-ascii?Q?IdXWr8bmL9BjQXWDioQtkP3yGt60h1AhDgAhMO2HUJUDqaffe+6XheReCSve?=
 =?us-ascii?Q?USWEvbPZIWif7ylYnPU7s6qma+NpLN+iQ9kURHGFG7lZzI9ZmixIoX5K7cRH?=
 =?us-ascii?Q?opKOm7zVtJXRcJAXmCjKneE6Ho25ayI4uG/FutbRM6yH20ydyoSRiQ72r/ab?=
 =?us-ascii?Q?clIUCxIzNJUC/hVrwDNqJAnkOvb0slszVomvhY7ZBFe5MnY5l5WqfDzUbaWP?=
 =?us-ascii?Q?r4/jUc03//+RO6cMOqmwMeY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae3e247-477c-40c0-b05b-08da841d748c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:28.0942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83JdKKGQWUKvGJXMbCMKUS7XMluItovTEaE4OjjL4/Owo2sjMSicpEubT02ASzfHq2feXFY0z8nBt6bnHiQwCI0SV3zRLf+w+UxYaMQcHJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.8.100;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix image inflation when offset in BAT is out of image.

Replace whole BAT syncing by flushing only dirty blocks.

Move all the checks outside the main check function in
separate functions

Use WITH_QEMU_LOCK_GUARD for simplier code.


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

Alexander Ivanov (9):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Fix data_end field value in parallels_co_check()
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD

 block/parallels.c | 194 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 138 insertions(+), 56 deletions(-)

-- 
2.34.1


