Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54093425A33
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:01:21 +0200 (CEST)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXho-00036P-BP
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYXZn-0005zW-VR; Thu, 07 Oct 2021 13:53:04 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:59585 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYXZm-0002il-Es; Thu, 07 Oct 2021 13:53:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a61HE/fopUe5G7uJu9cHzuCtknsnU99JRyhzDpWmAmXsOyMl7K47r3A+BZGcgxXWVvsqq42WjXI1wa+HD/SFe6fZNprfMT/KgqhvVXvdiJZvye/sU14x/ZAkGPQblgy9y+k9m5L+sF5woWypmM+jr61eP6GcsuE9sRlkcKRWj84tujY5dArInwElF6+/Zr+80LDBVUh4GDQ6rqcclHiGx22+B37KXfjKb6hpeALJF0X35bdR4gY60jmVa+UNM1iJY/lMk6X2qME+JGhyeMAWL37XC3Cru0jmJniHYUpXQJtfL8XeV9ppl8ltwQi0t2j5zuUoriH19cu48VgcA37yhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N9BkkQwmtkRM44poQEW8K/WiQT5LkNKQGy5Z+bVJKs=;
 b=KJuHU1qCkrgB18AK8UaN0gU57G2+hy4ZFoOvWs6UzuVW4RMAh4xdIREdycdHMq5qRQ7k00J2BU4q0HITsS8YzCXw1/G/1suz2f+F5R7ietZyVqtLuY5QRH++excpbPDmGWsbsIwGLuXksfPoqmh1S9r650gSS29JXEiGQ+oEVpVIZztYGnMNU7ziqwIheqe0ET2FXaHiG03wNHhUO6iZxrwFDkE1TP85w8AnuM2X1eaftrXuvOYkd1jq38QWBzT8X0vsOwewVkxdVrsqaKRIxW74CRj2RPDrPtPewFlOlWuGhkfxBHGkJpZJDRSKg5gje7rz8+2DnYpuKx5iVkkw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N9BkkQwmtkRM44poQEW8K/WiQT5LkNKQGy5Z+bVJKs=;
 b=ahdtr+ZlgFOBqqiEKxZCTi88a039L518Y2x0Wfmoo65VbVmdkeAh3G2GA7c0H/hEu83paLO4S49wDr3uDwzv4LfNawlPYondgbYXkSU+nMCI9+/KQ3/mldF7xag/EMi7W9AEyLi70sQsP+kmoXrepFnFRtLWzkSDxqZoUgGwniQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1779.eurprd08.prod.outlook.com (2603:10a6:203:2f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 17:52:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:52:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 14/12] block-backend: update blk_co_pwrite() and
 blk_co_pread() wrappers
Date: Thu,  7 Oct 2021 19:52:43 +0200
Message-Id: <20211007175243.642516-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0269.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0269.eurprd06.prod.outlook.com (2603:10a6:20b:45f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 17:52:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fdbe2a1-61b7-47be-59e0-08d989bb4998
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1779:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1779A29E0823C583C041443AC1B19@AM5PR0801MB1779.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3xf8T0ElUlhZK5ycjH+2ZGWRwUz+vC3/+x36Egl7QjfD7L4czCR4u0hjVHajoMtmQYhVC+eZ4Wuq9PhRI/kJ7W9/kaEfqRp2DkVw2KMykUUuJt2PrNST4jdd8p812vCWo2Yy3xiN8gobwkEiH6chiC8AKxAlY6BnV8pWUUQ038Y46UgZUpQrla31Bm/hNII1BCEedN+NtfgYAjus/Uk26cRgzkDKwWbdc1C9Xkv3UIuFcTFKTkJAK1OqyYW4r2TiYCe3usKTBhAY/M4xkisqmLzDdFSCjcGH63mh5+95STQRlHmMMNMn0Ug6UsdXozxReIjzkZCAS0GAsxrU8VDKKcQRk59xylPhYj0gIcanDwwRP+8dHMvlxAGbi0WX2NEQwGvltqD1wVBJH0jDLTQTirkuErPoXPsm7BYQVb+Z6m9dCkRN1SGtVW6YoojbgoKKjfuY3c//60eEoxCkRyFq1j2YaYDg5iyMLebJTS5wMKH/yMux9PxYUBYVy4IO0m1naGEPO2jzjFJwv7RNCSLPXPzrxQS9DfkMpWCgZCJSQrvG9k7wXivkSZu14pkwL7A+llQyPXZ98W16CV8fFs9SuNkDuXqimfN6pTgym+CIQNRXXth5g39Y7OiEzZm/nIxwDObmN8YF0EAMck42yDfwpGfxh9AeuxgFaBisJhnZ38xUa069l1lnbT2S/Vyv9jn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(2616005)(86362001)(1076003)(8936002)(5660300002)(316002)(6666004)(83380400001)(6486002)(8676002)(6506007)(6916009)(2906002)(52116002)(66946007)(26005)(66476007)(66556008)(38100700002)(38350700002)(956004)(6512007)(4326008)(508600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d4XmTxT5ysQ+wQxzcFpLwXkStzQy8GwhxT9qURU4vXHEHxXojwz6wz02F/nq?=
 =?us-ascii?Q?5YH0oI6ED014mHkAUFXhkmh/RYH8/ykif9CANMgkS2uoBt738xRcPl1wVa/6?=
 =?us-ascii?Q?yGsadPxKpYYjeFIJ6H4HkGQ3b4qq+s581m64Wc2Dt308FIUwOMrxrhzo+SeK?=
 =?us-ascii?Q?vpHt9Ppe4+Hr3IFehs0TW4vikgrzrx4wBgO5q5tf8mtE/9cfXtLrA7jfb5yy?=
 =?us-ascii?Q?lsm/5cAHPma0kxJVVUJ1fKkECEDWdb7rW8zgyy7MpcjG8yhvoBUsdhJxeFIH?=
 =?us-ascii?Q?/8BOoVGsEYYv5RDxr41ZIpQ4S8V5blBsCqMX3kqHxT3hh9bg4g0mKPzCZ3rk?=
 =?us-ascii?Q?l0KMYrunNf9lXhlRk2t68X/2a/iAgvMI37VaCtSfUo2s+rOahbpk1lQWnICd?=
 =?us-ascii?Q?SJcFnTyUE79or1iKI/sNxzZXEStDsonYZN4fOUKccTffrogqV/XciWEvsHVl?=
 =?us-ascii?Q?H8C6eyo1maqa4LnThUyMuk6F4aiWkR3xjJHqUEfsGHj1GoeD2dkd067EQx3E?=
 =?us-ascii?Q?qkFTrI88ufrbOi6wuBohKhWuO+W7anBKnyiHri71Ux0DYwGOfrRK1mjM7VNl?=
 =?us-ascii?Q?1TM2sbtgbFyj6EmONgFm2AWfbCF1TBgEwj9SlZA+x86rslw/ITMV8xweIm3T?=
 =?us-ascii?Q?wP63lbYVxG44SOTTfuXbzFX5kiEtVIkK/GqRWmfWQMqjEtG6A6/nmOQZGfqf?=
 =?us-ascii?Q?HVaq7KIQCleT6y/W5Qh0TGTlvZUaOycQljhyNWe8Ip7zc1vzELBkmUgFQECh?=
 =?us-ascii?Q?AlO9snRdyPHDKM5WCGfSyrye+XvfSda629O+yVgnU4PoKDba8xoR1vUa+gi9?=
 =?us-ascii?Q?oVIoceIFCB0tXn2aNQ2mmHut0IMjTeamY8+DL4MDFcI0edrEkGKsEFpEH4If?=
 =?us-ascii?Q?ihMPQ0L67t/CB1G/aschbR/JZW3qIRcn8iLQKO6sBb2UfeYBmlIJmab2XZWF?=
 =?us-ascii?Q?9yPpq74QRjxt61lxjXrn+WpALLEDNDTPT5mST1Ecnk6meATLd4r1xCdRwbvZ?=
 =?us-ascii?Q?T3Leg0U4DGUR1cyn8pPWbcJgbUfnCLDAcehkqzf3X+KDRFnSZ1oNWRjEBjnv?=
 =?us-ascii?Q?2NwZjGeMMVSWt0D82qB0CHZXddXnCtC2XS0qDE+/8oLTXqKU8nCd0nNTJxz6?=
 =?us-ascii?Q?HdNgYpEvT3c+h1ihuDZNSxZX98akid+DYcm/zaYKVzdaFLh7zAg1Yxl7b7Dv?=
 =?us-ascii?Q?ugSPWq1SzuHoet8VT04WMshrBeB4weAwl6xGTSxoIrTZvAHbaXSJNha5OR/0?=
 =?us-ascii?Q?rvuLn6yvFzlK00mUsvXkYDL2p2mBnQC6IWRXBg4frfTOwel/ce5kfwAxH3hk?=
 =?us-ascii?Q?M9595C/UEvNqwy8neyZ1wROJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdbe2a1-61b7-47be-59e0-08d989bb4998
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:52:53.7331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASHpvN3evXUlUw4y+8C2JTgF4AslZdbLWmWK3Ktj1v1TppNvhklUSWlYgE84PFtPFznvcBFs+zrfYiXY4II6rIKErDCQm4XcYpDr+cgeviw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1779
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Make bytes argument int64_t to be consistent with modern block-layer.
Callers should be OK with it as type becomes wider.

What is inside functions?

- Conversion from int64_t to size_t. Still, we
can't have a buffer larger than SIZE_MAX, therefore bytes should not be
larger than SIZE_MAX as well. Add and assertion.

- Passing to blk_co_pwritev() / blk_co_preadv() which already has
  int64_t bytes argument.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index f3227098fc..53c9b3271b 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -137,20 +137,24 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                BdrvRequestFlags flags);
 
 static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
-                                            unsigned int bytes, void *buf,
+                                            int64_t bytes, void *buf,
                                             BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
 
+    assert(bytes <= SIZE_MAX);
+
     return blk_co_preadv(blk, offset, bytes, &qiov, flags);
 }
 
 static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             unsigned int bytes, void *buf,
+                                             int64_t bytes, void *buf,
                                              BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
 
+    assert(bytes <= SIZE_MAX);
+
     return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
 }
 
-- 
2.31.1


