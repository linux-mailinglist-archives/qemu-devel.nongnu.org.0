Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067AD689370
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:20:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsE4-0007CF-Um; Fri, 03 Feb 2023 04:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE0-0007BF-Fy; Fri, 03 Feb 2023 04:19:16 -0500
Received: from mail-dbaeur03on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDw-0000oK-J8; Fri, 03 Feb 2023 04:19:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltzoWVDSP+e9Jv8NKAPQL9fIlAo2xMV4svYQ0hdFkOIbA4iga3xn4YJXtDHZRBMQTom1uu/s+lXtyAWyIc085tf0dWkqNDk424CLdQ/WUowab6XTEAuF5VnYqVpZ0NmyduG5g5SRcZ4iV7qEY3xW1sDv3M+I/HzvmM+SLd9yZdcqP1H2DJtVwCOnRR+hbH/qXO4Padr4lDVWPP8UMB83A7hWzLQBA1vMsY7I3+Ksa/D1bYxjbtL+ARKyEZjKZzswLn881zq1VmCHFyOhiqQdVk6PEH+RY5xPdN5pvrEei/pxhd6qWUuU5E1NhcYKoqXe+9nCf+L85U4hYmBeX6MIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2ts94JiKDu2CEKEoewinTUcevlr0YazshLv5T+UNgU=;
 b=jOtsYLx/2JqT0bbXU+MzhGNHE3ezzxGl7pAeJk2FUevvzacPjgEFtINI1S3ALadexYUWv2JQRdTMo5umTwnl66qTLT9AYDZ0rtD3Zh390J2Jq6Ebdn4QOoORXUBTNbNZMDXJScma8ykC2whKz3xHbPcHShsP+eGHLgXaY3zaYs/+eGo110H03R8RgBCcUeqKlH7yuQeun8eFXKs9tSflqhLdJocK8SXYEL6QWHzu1f12b78vxWWZLsHJRIZxJ33xSu/xr1/E55dpCKDzW/FmyhD1/qKZPQzSFQfHg/57scEnw1U6DNNdvICk4R0Iw9KhmOtn3smHz5o/9H7H//dvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2ts94JiKDu2CEKEoewinTUcevlr0YazshLv5T+UNgU=;
 b=tfgA6kxmCC6YQd+UXKhzOfr5z7d5++IIQtrwP6Dy82ScRkR/I2UGVfeUh//OyucziREIijSiU1XGLTZs0UMOMbXUxQW67nKpM9HlQ2f+vutEP0Fn0VLrnHuk2JvozA2v0MwP1FIBHJKN8dNykdZR0Ecdptr7/fmA/9xBbDsOJBCIcUWrqgBR9c9ZycGaXdKOBxkglYAc2wZ2U9EEXT3/8HJycEPaKzAdh7yEiXHnKT3T1ot55lOX2G5G5JWHvoIF6jrsDIoz6jWGx7GgnlMnWxpu9PtjI5SfJu+y180p4Zt/EyawJ+Hf15DD1I41S6MvEN5VzRKlB7NmAPcvTn+RTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:04 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:04 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 04/12] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Fri,  3 Feb 2023 10:18:46 +0100
Message-Id: <20230203091854.2221397-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: db1dc7cd-ea6a-419c-75ba-08db05c7b1e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ck8flQlCzZa4JGFYq6HurPF8c0kHUhXhqcbIOzoa6gcxe8fbHvXATUkyxtq7KVpRa8KINwAdlR9dYYqHR049P2N4OGdkH+CiqdrDUkuKhtoh4Y4sD1eReQIUV8fkuEicpPaAT168cD6vK5IM0H2sPEa2dM6GdTvbWWz/V1xNEeAabV6PKdOVdWfw6PBwIlYWEc4/QSNTzGRST8FUpfia8zWp4TKntsOAB95ZM+bSFrOGyXiTfJNfzqJ5ah8s+W9WSdKJKVSlIxa7Lcs/avaTW8QCieIpxPPvMuj/WeZiS1sLHZJyvFk4ekoHQYmVuMqZK9Y1dDLvL50cLY150ZW2O066n4W5kmZECj2Y0ERlU8lLTesF9qrClulBhvnJh3bl7P3bNU2wFTJvc7mAKxXMwxtPGVuF15tvyNKb5ArRkD0Sh6VGqnyn9E63gfAFzvKkTSNkvDIVOz5conAW+frydLR40iE+EOMHit95yY2Zw7Q7xNi1DFQcfESq3/JfUMtTD62gSoaAbbt6OyYqPTZMULYPak7fws7koYKO29Q86ETbHGy1EvdfIBpKxnDcx3YmZ9fRtb9w5n8zkj0b1ZVxoxsZLHjeiCDerJzkB++eFNbCkhFqvdhfv1vbGyY6S4eKiFVlaqYf+JezOKLZfv4qdioJ5GjI/h0Sq08zeYAwTscH6ZpuORIwcRaHvk05vL/k6Mriuwht4o8CrYPHsHtnnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zUNj+b0f5fn4meHWBc85wauhNTq48Ay8O3JRnqo9LjO4kdrNVU5PGULU2e8e?=
 =?us-ascii?Q?G59NhkCPwSMbKyj6w2U0lW9kHbsKfnQH7K7MyOIDU2gt9vOtpTsfwJN55Nnn?=
 =?us-ascii?Q?cgQ+iBai77WC77lAUo+X44N6npjCW1A01+oCy41klr4gQWX+2wYQmB7k9M83?=
 =?us-ascii?Q?spH/8FneIBDoQL63/7RuRlZqpjr0DhGSgpRUe80HErMaeTSTE3QCQvajkGmQ?=
 =?us-ascii?Q?qRcFWfThWHYAUvQcdtABh4+jXRelNtomkQZ7T+YHBJ2Ah5Qr9j8FAPN+Y71d?=
 =?us-ascii?Q?xOcA3FSlFFtM+FSjEJ/4ZDYzMffQTY4sv7K5xQl98mtZDOHS0QOXAmkCGLhP?=
 =?us-ascii?Q?7J4PTdKjiuYOTkBkjfbsCumYJ1Fc1dqp8b9SWxrw1B//1HsAqL+hMfAN87Cp?=
 =?us-ascii?Q?cj+Lt1qoO8q45bG4/dq4LdODG/yITczmddma7b699CpjWsh9FU5bQ2PFjvFd?=
 =?us-ascii?Q?zweGffhBdOKleaJy3gVf5MMk+5RXXAz/EW01BX7YN6tNorUNTW79r0V8W+WB?=
 =?us-ascii?Q?wF5CG5R+MeeZZv1BecVITBD57/2EoPHDpP5ZPPCVyH3U8t9hv0HffKeiOQVY?=
 =?us-ascii?Q?BKNpk8WEzir010R1CMWvS2F5P1fTrZJIDa7gxPhyYCaoN1Xd+MrEWNT4/NL0?=
 =?us-ascii?Q?CdwfBtKKHbctmR2dZArEUuEEWwRpCo16WN9sGc3wowxfJlDn4+H3JxfycYZ0?=
 =?us-ascii?Q?uPm/81V33wEGysDpuKSCnMcz3smywEw7qHvxF3DbipzQYtB9OHh3hslLq6FQ?=
 =?us-ascii?Q?Dw9UemLqZbxD6bXJF9htMT5oj/TMBByZtCZAQt6B+HGuSGdrncdCsFrpdlX8?=
 =?us-ascii?Q?DIzyEXOfSjq0y0Mgtku54eWNwLdkvN6ff+fuFU68UjgY0RuPpqSWCKPWPLAJ?=
 =?us-ascii?Q?tFmjuMHLgi0VW1tfIY4sMIZzXcUrHN7ama2A/Nog3ccZbUKzcVERxs6tUGy4?=
 =?us-ascii?Q?kb/acfo6qKRlDVNo+fprNFKag+/lWXpYD6Wqi90D5EAWyqy+J6JliHUnE+ef?=
 =?us-ascii?Q?bdTA7ofgt2cejXcvJptpe2dGcgV2YDTluMIMwvu37s6t3VXgxcFR9r5pIr8G?=
 =?us-ascii?Q?rXJnbO2pYqrxduoOMPKDVHYevmecyM/oR8RBuKhxwhTgfoPwFYoE8uCNGq+H?=
 =?us-ascii?Q?vzkqjxsM2oR46g/vHnzn9XijVyDSdt2o8HRVe5PEAJFAiEKQ9VE3VuoRLqS5?=
 =?us-ascii?Q?FMYvAZNzr9LKGKYzjlfS/eLkTKe9sxTDv7zT9djb3502WYBVrTz5jd3zV7F6?=
 =?us-ascii?Q?p4k+HPnAmskXihV9UCn0ANlcifyzumBOcygAwo/G1ur22RiD9oAUDJThgR27?=
 =?us-ascii?Q?iXwa8QK7wNO6eh9poa0OD2tuVUqE44fwGOFnThuKOxb1LFDF/kaq27IKnghB?=
 =?us-ascii?Q?PZfhrwM2tFqmxHFz3bATdrhREJJJ3Fr1jQVZEDJTSD0JNj5u0A10mnJ0heva?=
 =?us-ascii?Q?lvLGVJTQOkaE3ryUKpv1gg/6vt6GklJdAjgywDurz/Uaymen3zsIXgSCx+tj?=
 =?us-ascii?Q?M+2BdKyi35YvZfF8wUSMcWGYvxEbhsCWC8ion8cSinE33UzrOILn9lEjYeEy?=
 =?us-ascii?Q?a/JSoSefllLNoq0xi4ptoTql+nAEzsz//RWHBwdh8VC1Ake0kS8HBgO3yia7?=
 =?us-ascii?Q?GPQSBcw4VcYWuHTbQrxbhu4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1dc7cd-ea6a-419c-75ba-08db05c7b1e6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:04.5308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: By57qhrB5vEYm2Y8fQFF7M1fnAUk0KFWzRFU7gpvBAJApH3qXXJnpoVdqLlHtsGJ7dFljURlIeyvOyqWYHED9kT0EyhU7WOHBMvKF41jUcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This helper will be reused in next patches during parallels_co_check
rework to simplify its code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 2ed7cca249..b2e3f5f98f 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
+static void parallels_set_bat_entry(BDRVParallelsState *s,
+                                    uint32_t index, uint32_t offset)
+{
+    s->bat_bitmap[index] = cpu_to_le32(offset);
+    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
+}
+
 static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
                                               int64_t sector_num,
                                               int nb_sectors, int *pnum)
@@ -251,10 +258,8 @@ static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
     }
 
     for (i = 0; i < to_allocate; i++) {
-        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
+        parallels_set_bat_entry(s, idx + i, s->data_end / s->off_multiplier);
         s->data_end += s->tracks;
-        bitmap_set(s->bat_dirty_bmap,
-                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
     }
 
     return bat2sect(s, idx) + sector_num % s->tracks;
-- 
2.34.1


