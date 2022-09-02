Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610685AAB35
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:17:24 +0200 (CEST)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2nj-0007FJ-5f
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2Qa-0000UR-Jh; Fri, 02 Sep 2022 04:53:28 -0400
Received: from mail-am7eur03on2138.outbound.protection.outlook.com
 ([40.107.105.138]:50657 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QY-0006R5-US; Fri, 02 Sep 2022 04:53:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6qFjRR3tkdoT2hLd+eIT++2vkExy1UmZ6XcYPG0cytKCfplkI7N4XB6n5664V15ONooI0G6IUfE/IcdAUOL1YJGahOwUAXXeAe8R/031eUbmT1IEBO5wepjQEI2rhN15/a7j6JRHzA7FpvV1L/6Xe2iBcBX2vsOpm28E/HABpeImfate8Su0P2d4pIffeWli08Ury8QZCCMybbdTrlOgkG8nSy/Sj+6lFLLB0HUAPjFjsPImV8b9zFZ0HcgTL5UX4IYhm/HRxvCyv4Cl64YmaqQS0tYvVgYxOXX+REyrmxRPAP8UVCNkGR3YIglqYnq6YodZ3dV2IIxLqj8k1bunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuwoEnN8GK/xpPMkAvfdYJDhI/obpO9nn2KN4ApUE74=;
 b=jWAU6fLxfvfX1DUPfSKGQmsJhtUZsKvWS+gswAENxJPUC4YGJeuwADffT7MA+KY24MasrzqvSBev+5BFRhoD01OvDZUs0ApMvWa7SDnqGW7J+SwjXwrKENez1cygnOx/Zc5++5xOrarElofXL8zU7nVwS6Jwl/oHHk+zKuc47Na8p0Yf1LoaS/MHg8hCXGZ06uEQQQ8syMe9T93aDCyN50WlrqzKTgJMr5140p7S/TYJh8iSWghd/PAQv7420MS3zUB+uoeLxWu6+bBvQLN45GTHrlS2SP5jWUdPDTGbZ2ckOLaGsuir1EhP7h/gciqbFZHOHh2BMOhQbIgg0zYlcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuwoEnN8GK/xpPMkAvfdYJDhI/obpO9nn2KN4ApUE74=;
 b=nUFyKX1m/RQ5zM/gwn6y7Aa0PiU1YByEfJ4qOms8hKDYkb2kLSNKi3kQhbA3V6ZL7ymvH/q3zt2GikvosBFDb7D+TV+S8+ZAS2oD0lS55JM5OW+xSeSw0mW+fxteVFFFcxvY0SFvF9Ky43twoalFZN4VZXGsY1kBSMJITvtLUlbGNLv2EL1gvElW0pD5grncK48JzEiQ74qeuhaCDOITA688xcTUJATvrRZRzNZ4PczHw7pImDSM9rOFPjFZDd8qZOzkagBYl5wAqY3PiXkVs1zP7B8pz1yphz4U6e7meCra6qhho5QnqxzoonZgyikPHVNs7u+ZZJUE/82P9RtvlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:53:11 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:53:11 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 4/6] parallels: Use highest_offset() helper in leak check
Date: Fri,  2 Sep 2022 10:52:58 +0200
Message-Id: <20220902085300.508078-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
References: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afab9a92-54ad-48c9-30db-08da8cc090bd
X-MS-TrafficTypeDiagnostic: AM8PR08MB5619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVH42BPdGj5m7ysnZyM1w2gJv0w3aK6fYH+YPLznj82N7qh5HUp1D4rY6rt9+mAR/XU4ukOFCkAaq4midIr1rHle0x/fOvmqlJDacnoI2tG0PgNKKNlje0gbB1YqQNtHP/5afKX/zQc1eBAIElLsuhUSA0LKfVma9WmnrYDHO/GN4uPMFI8ITnE1NhIPs4p/VO56N42Lzu9OpI19CrGieOFu0aj6uO/MQUq7ufaVYhaKgr8wW0ApBu/L8yL2gHx+yW7wMlF2CFlvnYRvD1AFmgEgqcObJ8nT3i13QlV4ZTiEOPaHCOhSNDvBffsgjTcWrKG1GgHqrZVZzgaZlXJ7yg+Rrz24NLY6mEZMNtdK6OoibV0GEQq5xRnM3xXmAkT9gkmDklkvPh5EIbF1DmZlMYh8fcaDqrr82kXk+7Z/eJuse7bIonDKRtKP03yRDuort/4J59MkN2qKhEV9ImJ0c0BKHkMd3xU76hMV24f5JsVMV7oXOtfvBE1gbDfMry1lD+h9pKtOqOU4HyQVdUTOsnLjpu3qBeTYztxxZkHhrdTPbCWOk2g7+NYTYaNhfktvCe1NLd+V4TK8UFc4vRIePCSage5uktRqPKIfIKhu+tt6m9oDWxXirmh1KzVQ0FuQgaCXbI85mp3b5ocoOrf9xPBKQnkwqkHeQhp8sw1g/akFrAf21duM8X40TYLd069cUv5lS2pDlR4raCgdNVRpqgY3+JrA0sVYirmINw3oRRx49rJJ6iiTEYsKm2Xg73tRxbvOgVIxsJTtIVPRxYKt8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(8936002)(6916009)(8676002)(86362001)(66556008)(66476007)(4326008)(66946007)(316002)(6512007)(26005)(2616005)(83380400001)(1076003)(186003)(478600001)(6486002)(6506007)(52116002)(6666004)(38350700002)(41300700001)(38100700002)(36756003)(4744005)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6UyzVBF0iuyBkq9K43IchVLsOGjnH7VIRqYpJNPjd7nzO38HLvAp2Fo1KMW?=
 =?us-ascii?Q?kAijKGe+LW2DjOTKJAZMa6hKlvQUvVODY2lP32Nn0shCJCUTW7c7mkn9bHhP?=
 =?us-ascii?Q?Y8xJZj0mn9dW1jRBZguP7GfKDF1lt226Io1ENgKF4+RWFQg9mtnG2y0zOvl9?=
 =?us-ascii?Q?jtvQKX8dwvLGOSx5S0mKJQgT9UPdqD4MXmGq6gQ2laDetI2xarulmYIqLlAy?=
 =?us-ascii?Q?QnFLsl5AJC73Q914LeBy3JqNA/XxFm5Xft7up5wCqaHkZixNkjIv9h9kOGnS?=
 =?us-ascii?Q?La1mgIA2JUwIqJYVpJsNDErQBcdFnIIQiXLj9mEzya7dEtf6NG5Ju0f9+YQp?=
 =?us-ascii?Q?FwQpA8BMKzvH+wQ7pFb6KsLY2ueYbgiAZmxx42luuebCaRMpCuE5iwr2yqbz?=
 =?us-ascii?Q?WT4g+5zssRFKHvhnpUxonE+PjX9OuYNCN60+fcy+c7IiJztxM/F18sXsh4kE?=
 =?us-ascii?Q?sb4kDzDfOmG9uN94+IiQ0ZX9e+jSxjay5jfs7ilo4Buk/06grStwcP8iZEGt?=
 =?us-ascii?Q?MGzBFYN93N6ZZv1L7yLcUiTMasBK+IEGT8F+T6JvhEL4dZi+efFMJHePACN6?=
 =?us-ascii?Q?ALxuRkpwD0ynZqy7Pz6v4C0H76oueNCQDchdMwskU51exxVol4DkwXPMXAdD?=
 =?us-ascii?Q?Alhb8UBOngp7R6xGGCY4/wz/9JBnun1IpomUivbuMyz9EXP9m3/pTPTM2hQa?=
 =?us-ascii?Q?fQAXS+z3+/RZK5Hi1dWFjSMTiAH5LfqdtqnkSgNr7/orp3zniIQZ1EBU32jS?=
 =?us-ascii?Q?xkMrtPXf4rkVDddN5iSmGAfOVfAeLwgXZd9ets1HhexQGx7BGUcOS95kvyIT?=
 =?us-ascii?Q?vv98O8jbAtrktsE5kWRkD9F9qk+fn4jfvpIkRKtO+bTc/C8NtJxmAVKp2RcA?=
 =?us-ascii?Q?IF561s1p+6K2gje9ZeBW0hP8hvGO2bqKCrnXXthPXkiiEtU8trbx4Tj/kFzP?=
 =?us-ascii?Q?uC1jeP+IM3hetV6kKUvvbAVwF9I+dpmIqBWQlK/EXXK49SYGMjiMGx/igsl5?=
 =?us-ascii?Q?qjBnOow7YQxJLf++Q42XW6OB2oFuNDpU7s7F3F2niRHKgVMp3ntmPMnwZyPS?=
 =?us-ascii?Q?EguFDT5Gz8MKFooAtCrkHfYFjcFNV3osRVXNka58HbpDzhdmNw4Y/qvt9t5i?=
 =?us-ascii?Q?PvEdhrDj1APRWZydvVvYR9BXvP3ouRvH6rmo79C9SmL7S1WVec+6PVXPhiqD?=
 =?us-ascii?Q?EgIhSGK2uL7+9Mpc4yYd3Y6Y30jvdgS0T6oSB7TDyP3YYt3UXdzK9BWczs+u?=
 =?us-ascii?Q?IYuYUdM+fI4yu0uVU/pJCwlpiy/1Kl8Nq8oB2iAvXgVz/GAO2odrH9omuF3Q?=
 =?us-ascii?Q?lXKJDYsaEIUfBDORr9eWbigGfZGdYTrbYL6xNlelaCwTeuusx6qATDtkxjP0?=
 =?us-ascii?Q?euJbKbYYCvwSDG69gt4Xl5w4fC8iu0BBbxszqebvEZN3bzC0y+sKbIzSQqi+?=
 =?us-ascii?Q?/+ExWIPQ2b4bqFOXkxcAuzvRNVVPpE6ho1pL83VSCIBgYqF4hGGjQIFManLP?=
 =?us-ascii?Q?VcEV1wTrVEPz/T1654l3R6MgtUdttvwi0pcgJuN/kguonU7O8ypyw/vPG0yi?=
 =?us-ascii?Q?N98QhooOf5TxJCbNA49DGYoMZDjbjnfByzmpG+12QeFEaA0h5a9tAl2dZndd?=
 =?us-ascii?Q?4McmYtcikfEZp5ddqc4ALFM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afab9a92-54ad-48c9-30db-08da8cc090bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:53:11.7367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDwERP32zdg+4KvG6k08LneFrDtT2PVS9AcKSZyGfA04rGiR0Gn7kbjS9tiTKmue7K0QULEIPN+plYWsXMynvyYALotkH1Y0pEoo4FgIN0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
Received-SPF: pass client-ip=40.107.105.138;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Deduplicate code by using highest_offset() helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 339ce45634..688aa081e2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -535,16 +535,9 @@ static int parallels_check_leak(BlockDriverState *bs,
                                 BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t off, high_off, count, cut_out;
-    uint32_t i;
+    int64_t high_off, count, cut_out;
 
-    high_off = 0;
-    for (i = 0; i < s->bat_size; i++) {
-        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > high_off) {
-            high_off = off;
-        }
-    }
+    high_off = highest_offset(s);
 
     cut_out = parallels_handle_leak(bs, res, high_off, fix & BDRV_FIX_LEAKS);
     if (cut_out < 0) {
-- 
2.34.1


