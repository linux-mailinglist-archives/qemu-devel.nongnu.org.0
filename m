Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66D47D603
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:49:57 +0100 (CET)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05kS-0005BK-L7
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bv-0001fA-2P; Wed, 22 Dec 2021 12:41:07 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:36163 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bt-0002Zq-HZ; Wed, 22 Dec 2021 12:41:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmSoEp9J7FqFl24uWtyjK+mDFpp8Hn6YES4rUzOFNKpN1vYn7GVB7bOBr71RDWWCLmvMCAFR3szLAyFF1MLv2IsVHb/7YdpMKBOqfdzZQ1Yn3oqCUrB4Y7iB6QPIw7hgLu9Lysi5FGM+1R1D26n6YrgPwFBPHBnwucJrttZsekkuCLDfwsyK07KN2OCbkV/r6BH4uEyYDudnGRqXJmNyiOg//syh1u7mmAVg+Bsfpaozisun3cq9pjo6k9hlhYbM3bZCNbcvnkDeKUhON1jnAlba4hH2yFfGTdz6vAD5cQjbJcuoqG0H2oP1q6LmZPHtV1V3lr8C9AuBuOcfD3T9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYPK7ncijaZryIqD+4Q2YvASdig5B1EuqVTP0NbiT9E=;
 b=YyKshYg1wVXYufv01BX51ft9zmiQQU9cR2Tt7pARycbPIU5UPZpKx6SjVavIb7Bo1raW4OdzwAK+xn2IW5+HvSmLWsxiVqCM7nFJNCOyxCemiLKWCvMc/9PEVrLgHx+prXwKjzP1ykNhi7xHn8x+Hvxb/hPHGZFTc1XuwI1GVGwE6hfQXsKcDnj7yQQMfZk1jnX5KiZlz2ZgZ3JxWd3r6fgwAkUueU7c23a9P8E2eTwD0WSID9fBihe3U3iVPLSfNLt5HnzbFyPzXokTh/RCrWO05sY2hdBhrwWKO7X2UNZUAAWVidWfYYLotB7NAOnQ2B0QZNeddRxBgn3ssDEuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYPK7ncijaZryIqD+4Q2YvASdig5B1EuqVTP0NbiT9E=;
 b=HM8XwnDc/y8SW1X9E48D1JPgMdys5uuo1CcnWCD0bdRpXaqCtwiystwSdXdEMeaGfm6WI62FfBMhT8XkcpFovJLSyjsoy7GOkqKceUt4pOB//ei4MvQgjIej+sdYjgfScwJlOgkjtx6McLXdFP8gLnr7TjpJtne7ZRnu9pkxzm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:46 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 17/19] block: blk_root(): return non-const pointer
Date: Wed, 22 Dec 2021 18:40:16 +0100
Message-Id: <20211222174018.257550-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82f94930-93a7-4193-f2ae-08d9c5722f3a
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964236BAADEC92429F62478C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zI2XJtx0n5lK6NdKmXUwit+NvGM4JEcimo0orUYZHOLzliXbWZAvQYQR+F68DT2xq4TWpECVRpwtqvFs1sN2fUmT2tzlkk6cKsNTg8+zqZ9LZo4nxy7ZQh8fKPTqy6Q6gswDi1vaPvBp/ZgqJzVq4po7ErqvSxwylwqOzjzeyt30ilyzW205w9j9TeeHVwS3/k07H0qGlcKwgOmHJg+MSohxGpqvjCyAiQKgoDV9NfcTi/g1mqYfDDbnb/TUIk+OL7iP2uxijbgBEy0FWqupfgl37WZp7A2PuGBhaTomMrIwjbK7n8P7vVwR75EKunLv4t4LkLJIVlPvcx49aojA1+VcwLcknNwoFx7g/OKQ4KiZo//9xjD1sS+Ck614OOP6NOtpqCTT3IHSYNC7A6L0qR5Iqu3woPH8zZ1oUECdl4M+fvCs7UtFBS0pY63TfwZYtho2I/h106KOQnT3UzjDdEu8smtnYUbQ99VVafFJGITQ3RzvyQbVjGo+PpbMh0XFNlJ/dHjh83nL3FiEH2cJOPNv4Fs4nycQY8nfaHoK/ppcVtZggoI4pEVqtbIuhQFk4Soef4IZz76T3B1s4FXtEXNUj9C1NheOlYzZd4CBzAY3bvJSA3DSAsdBjvnyBANMR5YcosfUoYslIuBu2+SaRry1MaHPNLLY9BAKvAqEqRsxdFpBcedQ6Tawkj6u8qpuSsfkFzguBuccTVWYGIJ/wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5fMJlK6g9Snyr87pEUZ8dDy6RtRHwc/90d0lntHQI7unXtPziw0w48MCfcnB?=
 =?us-ascii?Q?gFL4jS7IJjTz0j3nCeA40/bMeEyYa1suzfnDrQ4uaDJTUGv5jmsi6gxsNKPs?=
 =?us-ascii?Q?8bAMcJ14xOxiizGb+EZe4m8fTZFsv1UnE23WLny3FvKXADTEf/vWjCEIzhYu?=
 =?us-ascii?Q?1PNcVezNrs5xD+P/fsUEWBylp3vuY2hz6m46lCB+84HnTECEIQfsIjXDYG8+?=
 =?us-ascii?Q?EpiymhnZ3y8gPv7yRUzTZSBEvRSk7Qrq24NaFqFEmURWwI1WFx2YsYiJ1liB?=
 =?us-ascii?Q?lXuFIQ60LrrvBZuh6wvW9OXtc4Y84V7tNhclZSax1u8cMMnmF5s240BShvOU?=
 =?us-ascii?Q?xGW76Z4lFN6qFTyu2TPXnzDYmDkkHD2b6QRDZKexIG26JqeGHNzEIYPudebs?=
 =?us-ascii?Q?Ol9G+cwPurGCnt10agjX3wuwLJYevkzqVXHJb9VxLQMVJsuQwuB6OaQoCo9T?=
 =?us-ascii?Q?olVOciXhXNvFc31D3Dqxjtfddc7BBh0qd5Fp48GVPS5U+PlRFDem53hJJJDF?=
 =?us-ascii?Q?RiFP6qym5UMY9ouPpFQYjK2odZTzIpa+lfkxn0BAsMqql9pP/EG7lNZy3kf8?=
 =?us-ascii?Q?R6lmQFvMEJO1JF0FJiSuxHGNA0wJDGCh7WWOECAnWjGGLNLI1snTVY6ZUEDb?=
 =?us-ascii?Q?hOKPXc5nRnsgXmzvcnwUIwmhmdca5dQTtyrcHU6XEXrph/fG8r3BuX2fgUdw?=
 =?us-ascii?Q?zTRehW5CLfnBEw4iOKwF53JAlywjWy7XDRELW8dI5j84hcsEb92odR79lKt6?=
 =?us-ascii?Q?Ft/EEbdujw0ox9DG0vf6k1UXDpJCM9bDbPirB/WPY0x1l+MGtObyOgDtgTgO?=
 =?us-ascii?Q?CXqIGwImF7u49El2AvzHecs05LJD6bAk3dHF1FUmb0tJZ99I2VV2mLKIIpW5?=
 =?us-ascii?Q?wiZcdUSf3hJ7RiIcoShRnACYXx9xQ6i43U9dANy3PbbXc9i9phiwXjL6ONUw?=
 =?us-ascii?Q?8vMQI3XQBEd3JQhSKVmsk8HAjKymU6oX4qi28zf6nHkuDCgSLmcDYC8vNQkU?=
 =?us-ascii?Q?M9hg9j6q+CW0zyJmcJVKm1LKSneJ5076RqrqCZTnrZboOC95U0S/KX+Vt3cr?=
 =?us-ascii?Q?ml0i8osee+pOlxdshLq6DbCPGdYSe2ap2ASIwoEtSBnpkNuED/mbk6HUxM2X?=
 =?us-ascii?Q?Y1/q4Cc+v+AHSFbEusIRcmNB4w/h9CpGNZpZyoPNKW749kH+5+kSuEjq7fKj?=
 =?us-ascii?Q?RIvn3SjxPAJeAf33x6ePpUuuVBwnBLWIIq2SHEa87pf8tFga/spc/1a+3xGu?=
 =?us-ascii?Q?6fs1Gp03DDhm7nWf6TNBsd4IS3DeT3univEUPw2zBGZn1rmydKKDfwLdwPlZ?=
 =?us-ascii?Q?hKy03geaTKBJYZhvypjlV16UvW+VrhcLaqhAWBJklLaJ9X/DeaK5MZ/jgXe4?=
 =?us-ascii?Q?844U5lAAkVUMD5tfjguh7WsW6GAX5HEcY4FtAjvhnFlWjttxTW9IMGgHM5Wg?=
 =?us-ascii?Q?iUI3sbEeyLS3wEYBoAiQUyulg0mZPvFFTJsodprmk05mThAJ7bDteSx6e0LI?=
 =?us-ascii?Q?ZfmGPfZrunQoo0MW4iEKcIpZKbVSLzCWgcmHpKfv4EEKrEzYhhj80grdYYw9?=
 =?us-ascii?Q?cpPGQ+Ez5NPXQfl5FfyforXGemOqj8HvsOE++TLBAxcRix8k2/pLgqWRB9jx?=
 =?us-ascii?Q?/36EmJx7zgak8+NC5UCEVbypx8XGjrbIax3rm6F6svoW8jPELF2Q+6M7cBTi?=
 =?us-ascii?Q?9AiZAg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f94930-93a7-4193-f2ae-08d9c5722f3a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:46.0065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Dai5iFvMh7GUxH9ouuDF80rOLJMTysbHrKp3tptzgZFSwgXDvxtykay6Ht3r3+7k+X2Ly9BKV5/aQ5dIsqV/qteK/K6ah2RDmajPYV7CUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the following patch we'll want to pass blk children to block-copy.
Const pointers are not enough. So, return non const pointer from
blk_root().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index e5e1524f06..904d70f49c 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -277,7 +277,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    int64_t bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 12ef80ea17..d994a0f096 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2438,7 +2438,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
-- 
2.31.1


