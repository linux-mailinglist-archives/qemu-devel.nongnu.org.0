Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B226EC912
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYo-0007wU-VE; Mon, 24 Apr 2023 05:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYd-0007lG-EX; Mon, 24 Apr 2023 05:32:28 -0400
Received: from mail-he1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::731]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYa-0007Rb-Vx; Mon, 24 Apr 2023 05:32:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H++YH9iIEL4rD2PqBJIohJ0xSkBlfWD/GqWldxZvdVuh1byDb7FY85FqxYTpv1vfEytVMXSouo7+SETrU9t/3GVLfhYsebTJz5+rS/F8DVMj94XVsj1ws/jEjEziTUn4hjO49ERky5O4dcZlBzDoKSXdbXuxijSsixVfSz5Z3ifZmBu9LJTMn6kzSnQYUbDBBiWlJ8mVBVDT9Y6hWVYPC+/xI3WWat/M9VoM/OGnFDAZn0OLQnRW43MzDIDI/Dx17zlDv1v5Ta3uwZX+YR33A2YucLvhbeEES9H11NBTKt+AbR5aWgsy1+AmQyEICTYxmVrjW7ZDR67uwUPIfeOb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nx4ydLakxGaxs4rP6xdhzZCIhq1dnfz5GYSH+RoWka0=;
 b=cp/1O3onmJRy3Nyx985CFtE2MyIAWVDQCUMr4nbjXEx4XP0cjPH2xCe58yyiMKblwRZv1cwIciPqz/6bLp5uZ3voXJKKbWwtS0JsdugbnB9ibRCWOu7T4wWM4YSCB5H3O6MVQvlVWds9MTy6dClzq0XckNh5cYHQAAzLqArQnJ/XzMYly/LSJSmd2q8GLdGJ5iC+W8YpsV+aKK0D5g2D/VumMrjn49+U9jL9nQNT3dm05bEeAfzAT3S/0WFcSW/FauTeo60b0EmerDTfu3PPuCQ4b4fM+pX8DfNBBvIFS54JR1/akGNguPBMM8daFOtp40CsH5bS4W+qpDy/XDZkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nx4ydLakxGaxs4rP6xdhzZCIhq1dnfz5GYSH+RoWka0=;
 b=ILlQom9jRe7xB3U6qP/7HBUgOmlt+z0nSWDinZELbMN7MhpiZ43FsdkNt3X9LGzwwCKZrS2VKUVc5hqKHHShKlYK41+PsmLTk+e5/iwzaTNt7ivs4lEpbKFKUaoCSURMc43DvhwB4NWuUlHZ/fEsEp64WHF6/ikQ9BRHFd6N9NxccNWnhRySYa35hb77tmik/tvLI3fw+l+pcXe8ko6aHpjlYYQBSM3ApNBpCgFJMNScCRTGeVya3+F6uwCPV1fF59TpnWrA/pOrOFoHZ9A0AAN6owlqkswPF89MEwGPresSbadozBDprO8B9OGqajoVqiffwqbUS/r9KUWg5eJN7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9487.eurprd08.prod.outlook.com (2603:10a6:10:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 12/12] parallels: Incorrect condition in out-of-image check
Date: Mon, 24 Apr 2023 11:31:47 +0200
Message-Id: <20230424093147.197643-13-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adbc7f7-7f81-48cb-4ba2-08db44a6c6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4QGuyKohKWPXW0MCVfyEznlS3XnQRMyLTZr0X9cuP4yq6+6168wvk4c537wTa0tA59GrkmQrd5UTh3MgC9MgSEJIhxtThABYs8tKqkrKntfFFUwgLJ7FoHiO9aj00DH8OF4uJzh1MfsIZTz6PRj4lWN6iJa6+OQGl5oF7K7No80Co00Rsz23Gvmeg855G8L48uhvUkIKe4JrP2eGEPM0eSSc4AVnEpdr5u3CTbgMb7LaK6OAyg9LsVzLes5bvBoTNc/mTD9NMaacVycFWsi/KEhuO2cknQ/OhyguL+cKOzVn4QlJpT64vl0Q0PMT3/RE+qqvkCFlqXd/JBrnghJ4DhCYYMdVNHGICX0KFL3f1hsZd89mOKD8PsxQAwVUMuvpku4eSegGd5eAtCkJ0fPjgZ9c9lcyT2yKcQpoK1lKToXoEu6SLFxq7xdARGFt47FVdszOmhHtWAyGvIQbYTLbve7qFaRJwq/jv3tmz1Thv08r7sahw3vWvZca3zTLkjeobtFHbbgcHl8wLMTvzSdWQHF53JqYQIY2v/UWsLWu1qdszcHajNcFc2oK8nkCozwaM/ipbDZoOwdNdNWN8PjzxIpR7sr1+jLo1vTl9FzV4XPScCyoRbAjBgvNn09Hpua
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(86362001)(36756003)(186003)(6486002)(26005)(52116002)(1076003)(6506007)(6512007)(6666004)(4326008)(6916009)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(4744005)(38350700002)(38100700002)(41300700001)(8676002)(8936002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O+4rZUbif8xJhO2lBx6zzt7B3FWji1J0xbQdoKYrea1A/7gwiCUtZClK/4eh?=
 =?us-ascii?Q?hGHnX8QA0jy/D7RvpNgSymCaLNZxHZr+/B98h8F7qudWH9I53MlC63vv6ZOx?=
 =?us-ascii?Q?RvKJfMW8DS8IbH95u8DV6u186+ePu2RcVOKTYDls8RnxTugMRHy4bb1U8Yve?=
 =?us-ascii?Q?w97ZBPAfAfl6MLu0pw3tFzcCbxsb8QstQHbHGmMdKiu+A+roFwpZkalPin+S?=
 =?us-ascii?Q?XC7FoU5KY6L2zbsyZpuin207/cW8xrKy6SW/7nZnXBfseXhfVxfzphULsm8I?=
 =?us-ascii?Q?Ps3UD/f4cuLElUvLdYh2TBJcvwLrmAEiIanXTXcOtp9pNC8S635J3qUSkFZs?=
 =?us-ascii?Q?+jtkTgBNJibzMo1KoNwBCfRahA11179n5SOOY6GIA7WRbte5T6VkMGBM56il?=
 =?us-ascii?Q?xPmc4eX4qPGwJ5EAlCDhXGpO0aSP9Dd49SUKQYWW27OiHIP0H8ImhzbZUgEy?=
 =?us-ascii?Q?46/Tmhv8eCGb0FKWKdTIVhDOMkUON2Q/lepgWmvnMSNhMXH/yj7ViFoEMUGo?=
 =?us-ascii?Q?ixfNYJlWFdz1RxSgOXsmdpb/7aYR8ZRU0ps5joyCHePNn/E6Q0Mj9dlwzbbw?=
 =?us-ascii?Q?QcO44OEvWcQNLJCNweHzrNwtDxqgH3/4UfeTlP88ZVcXDNx1uzOghQjdI4fY?=
 =?us-ascii?Q?qGg2lHi100/ZsMeTyv8QXyEW7A5J3Sgi6FnbyHCRB/aNLwOgoFgTMLbUdpST?=
 =?us-ascii?Q?lQQZU7d11uPOBs/pp6N6ruFVgipB78fRt54oYIgZW/XktoLgAGT3dx1sh0Jw?=
 =?us-ascii?Q?iS/K0LOX8+kaVotStMVfVGV6WSEd6bHdNEZHJmqaRdl1NvZi9itnjOUdUpfD?=
 =?us-ascii?Q?6ficctlw8Wj5FOXIMksir0hmzhj9VyPU7Aq2u3ejRMGQSS0eW+kj3F0fmCjn?=
 =?us-ascii?Q?9uMqgCjfJhJGAqTJMvtDQ7jlK9Sh4PlQzVL5GhU4xWosTlFQvyd4V4sTkq2F?=
 =?us-ascii?Q?0BhcYXfLuxPWWozc0BLJsujhhIC+TUmobwhoNKKBFCPnkyEVRSQaGmFwzJgp?=
 =?us-ascii?Q?LwVpn/hCTfo5eVOP6S4xkKZaRyGQUGtricZPbbkulQgNSbE9nMBG07cIq5tX?=
 =?us-ascii?Q?giZyI0lVLjQDqK6D88jieHVF1SJrrcNGzAwIPjA/yLc87JsU8IrNLqoZUOvF?=
 =?us-ascii?Q?vbXiKmAmSNRMQ2BKXDCDW//hhljmQj+Otgou519sttRfjqBBnEDW/jp1L0Kc?=
 =?us-ascii?Q?dNOEk7We5G1uVJ+plCBn8qIUCGfy1mIfaAnOoBeS6tslUAKJxXXcenwfwbGQ?=
 =?us-ascii?Q?tP9sZ994ataEDhBaKLX+1wQFJanvK/dwIqPnrJwaGD4eD+Xu8+qt8UtTadOO?=
 =?us-ascii?Q?CEGY1xgaco1wK0g+CYJhJrqwb69gCZd3BU04TVIROkjkBU9loAMHEyApmAT0?=
 =?us-ascii?Q?yKedHIPr5AGWvLBMTVakjQ4jg72rC4WY3CUkV1Yv2b0TVgfMJLeAjT6Kf0mc?=
 =?us-ascii?Q?oDclarQX0K3AGifgqhyxlLwyPc67XpwUdHDpJAgHjaMh85338nvbDMgcN5G/?=
 =?us-ascii?Q?HJYT7tlmFm43miv6tKCPypXQOqQZoQVSdto1sxBwiKM3XO1Kle7mvpTN0gd/?=
 =?us-ascii?Q?KRaCdtB7NFKuIqdjW/3mbvoU/rbq9Q20dN5RBdgOoeC31iO8PoWwDIX6xXpW?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adbc7f7-7f81-48cb-4ba2-08db44a6c6be
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:09.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dk/Gz2PJ8XpEi3FdNiLb1xOKTzhV5Isnw0iWvq9NQld8ql7ymsyyHXDBA2KAsZUXvT4uiLriyVgjr47dAgaT6nv/1ghmfJZuFQESPhiTrsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9487
Received-SPF: pass client-ip=2a01:111:f400:fe0d::731;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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


