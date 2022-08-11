Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01858FEE1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:12:24 +0200 (CEST)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9rC-0002Wq-C7
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gU-0002nK-HU; Thu, 11 Aug 2022 11:01:18 -0400
Received: from mail-eopbgr70098.outbound.protection.outlook.com
 ([40.107.7.98]:21646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gR-0003aJ-N1; Thu, 11 Aug 2022 11:01:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE57IkFGamaGVDON9RL1ZzCtRTl8db6W+oqm4lCZO1U1UJJWFdZLL4cQqGOkJvzurNGLcn81kkdGyZPqs2PCkq5pslGu8KMJavuXK/vHec56VfJSvtF0lOP1d/JHqxT2YlhyhQqD4ZsvsYMYEOtn2s1V3zVE0ih54wHBrOljRsVe7Q5zJ8+mUQ7GlcWJEe9OYeGmLH7RWpScStx04hsojAXJMkBYSCRtA5GQuhurMYTN1vhd+zsyjgA4ARrC/B2xEEiZ19xMz/tATXR+FB6gw8HG7H/rzUqT0NpxTTxnSbrGqsvcdgdgfddXnbCTP887TTpnCA64gE/+/uHHxT3KMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeyeuLuikJsYnaH1fTv9dCTDt89NNz2QBnwFdJx/BM4=;
 b=aFTdtSQ4cGRPiVlElRyqT9wFhyqyRTeI6WKESGCrWACk35rpeGFt7fo6jc9ZDOiVf3f2AbPUGUw+TCNKasorzFt9+9CO7NiEn1b07kwlHQ6uuibSuQ82ozGfcna+LqGiQ4ZTMu3k745/lm7uZOWSFDEWURHOl9jRuhKptEwqIzEVxQWiwcYNBOPqmYV7qfOtBJ5xZc3319C9pKaL0gL27qJ8XnWIo+AMs1lCzYUxfmwjfs+PT3hrPgMyTgdocLTbpAaHM+1LJA+ktzGoZelNRhn83QkZLkVJczvNPls9vm8p25ALxewylhQdYNgmzvVgtCfe0EO10GEzyuO8xbeFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeyeuLuikJsYnaH1fTv9dCTDt89NNz2QBnwFdJx/BM4=;
 b=OMz7VX+9R1YRecwM2d23iP60ee/f+bnJjoemOxNNmD25OqYEmhlLvc7VxrSwuoXLBXYd+JDDIMBv08X2W+ri6KmwVhpRdpbPzHqFmKcIGlsUTNBu7Y2nXFv56S8K7/FBbHf28t5OqiJ40vjCmqSJWsUqWx61mu66Mysm/mU496iWs6B80PAxxNKmCxGD6v+PUaDgS9vXQMu74wB1A4absGlaChrNUd3Wi3umT0w15oZgbUZ7lt14OI7HlX+bJOtuerCNEesDI0EnIinp3FOc7yh9OZsbNEN1bSfiTjh/5GTAIal2Hde3SSVKDPCywfAjd5P06OWEpbGWj1b+OFY9ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 15:00:56 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:00:55 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 2/8] parallels: Move BAT entry setting to a separate
 function
Date: Thu, 11 Aug 2022 17:00:38 +0200
Message-Id: <20220811150044.1704013-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6def0b68-e963-455e-8548-08da7baa4ae4
X-MS-TrafficTypeDiagnostic: AS8PR08MB8659:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjaIWcNheRIf+36FbuBK0tTIEcD4niH6GjcWqJuFEinL7Vp0r0oXiO088lTk5cG3jamHUyuJLvSiEREVGJyTDhFIdTxmDuhgsqWucP0C7ztQsixD4/37X+IPyd72k9Af+DyBaR4/ML0SfcqJwwcPAVAd3rX8wR5ZfTcC3IIMHrYcZy9BM2gw88bCb3ZPZfIxGSEZ2FBu9UA+XpvBOJQoUpkAOuoNW+rkDNmYPVCIZJpQCCGGWuPV9IafTJW9v4iuEm4Qwa9G4klZqEN4GQD8bFdBWTjpD6pg6vNVsy8otM1dVO6xPbsGe5p73yVfDH1yroajWoP3jSQgTiZ18gvpdonqGNJZbcR7h4CpepGcpuCpIth8Xd2WfDI2nn2MYDY971fc7WjHZYOtANsuZZUatQ12ijgSK6ehaJ4FZXAEeXzjP9BnNSjxzAoEDv+P4F5XAmryQfPbyAuPyQz3DTc7x2sTYON8y179UY/SSpLJ+w93AkI4QyXZ2+4WzD9q2WjcHQH4STF+omtKPzM9/YkYYsCloXJfRFcQJpiMWPgQqQPKYfuVZW0sXeXyQEh+h4aNVZtxontaPRwg6QGIOwWdbC9DJqFpFhkK6y8rm2LjTmkBf0tEdC1sknYW4OJ0FuI/RiFZ8X//Zyko2LXgMJWA75ExidSsDkd2LTKX8EzbpGtJQNGv53Cs/OwewHnbCbpSVr7TtMUUXN3ZxC9rxDCVx4gHbwNelCvpnDhccruc9ZMaKopkUXGB1QxekwvbKIU77hCvsjWB0C2bWR7HpeF/fvKL4YqjfhDQZ+WCMszVoGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39850400004)(396003)(346002)(136003)(52116002)(4326008)(26005)(6666004)(41300700001)(6512007)(66946007)(6506007)(83380400001)(38100700002)(66476007)(8676002)(6486002)(186003)(316002)(6916009)(86362001)(44832011)(1076003)(2906002)(66556008)(2616005)(478600001)(36756003)(38350700002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ReTVNp0hK0sMnZ8Hjl9LMnBH3h7+ayMHtH7wQ26LeKbCrluZYuvsYqKET/v7?=
 =?us-ascii?Q?tJMKwHZAdCWbmpKBkBQVyrIEQ3Lvcvixw7HrGlavJEyS3vm9GeTHS+b2jbSN?=
 =?us-ascii?Q?2/k63ervx4+i7IF/DZDKZMIGTmaEny9enTZpuu3/nPlh2X3P0qYvFFzCjUhB?=
 =?us-ascii?Q?QzuvAlmJ/ayPrj5fixrgSeLblE9h+6m9d+DIYD+F3PJWfT2NG8WPnJW8pYc/?=
 =?us-ascii?Q?rgT20EYaySuTnirI7ryhePOh7sr+eiWRH4rcR9xI542xP3hn6WKCoiw5aSN5?=
 =?us-ascii?Q?sxQRtJkCfVUxZ/xWeLWoRvSmEPwlkcdYS61+fL+oQ4EbAOjBlGWAzvdh2rov?=
 =?us-ascii?Q?i5d2RM8tJQ4LO1zx4I0gWCgwlYmTr1uI45yI7G831sgEn3iDBnUUDysYwJWa?=
 =?us-ascii?Q?qyOQSMmA6q9o3Os3zXk26XqRLNztKEgROsTK/hye0qmCZQY3Np8R1+pmOuPD?=
 =?us-ascii?Q?kLziPIdNEpVmDGqD6fEJymBtIcBTOn6282MRxUIGwuCVq0Bk8zHnMfYM4ibI?=
 =?us-ascii?Q?yZAEQnlnbUtyDM13uUYpqKpY2yzhUlqjtomx0bQWx55APDR3neeYk7zGH7R3?=
 =?us-ascii?Q?EYUf5phdFPO4wQayh/mIeey1IuLybbcCG19YnPC/l/hRn560WbHns2z6iC2D?=
 =?us-ascii?Q?o68tAEIOqeFwXGU2Q3mzIQadQ2oHuafxCsBMhkYpV/y3IdH+2gX4+TU7cKOh?=
 =?us-ascii?Q?mlBPdm6KIbQ47hiQ3/kksnRjMFjEOnAeYAxhXuXUVQfacYI70J1I35I8ugjs?=
 =?us-ascii?Q?JXwztbH6VKHgwfhr57fs7UP8sDQ2dEr7jGLSQr1Nh7ZgCUh6IAss+cEQ8rK8?=
 =?us-ascii?Q?v6t8TH10rkXv5vAWCMMx1/JaZ+M2THxwh+gApa03777zIxAqskOd5TTK0Tk1?=
 =?us-ascii?Q?X0uk6sXYpO/IT1q88XdXO7zPSKCACGaot1IA6ZNHgdqnsgp1A3EW9d0TrdnT?=
 =?us-ascii?Q?yM2RtGKianwaXq7MA+GpR75hRpfE9EsRGs0vJOMR2Tbkr0YcAL/N3IUWVcIZ?=
 =?us-ascii?Q?RbCFzYZQ5GALJP/Wsa8wbDsXJDZh8c9OcWSbp1lU8SAupbPxPZbsVamk0a7x?=
 =?us-ascii?Q?OGH7sdTihjDO1cpOdOf15vk4klhRtdgKygYXN61d9BtmgPT0nuI2Kv5PgocP?=
 =?us-ascii?Q?zQnQ+o9YKZd9nEIyD+8nEm3VT3PCrI2IikpHrwwIMaFQedgwRcRNdNDlCs3D?=
 =?us-ascii?Q?F5x6sm2ATgYHOUIhNeSPnaKYqaE62KJfi/5GUtaCHj1cnmGb1iNkSFE1w37W?=
 =?us-ascii?Q?wAclYi3xUHoi4vohFn82Dg5SY4U9l8pBsCx9D8MwdIPChdYO8IM1z04jzSY9?=
 =?us-ascii?Q?mNZJZDLfPQOW+cgRElPiRwIX3fGg/MsiiiUfpj3NL/WpztfYgUH1HBnSJJ01?=
 =?us-ascii?Q?qISoM0qrvRRFwSE6owmJ1BKbOjgF/Us3X7Jwcskm7k4/ODK6J5JwkQ76/65y?=
 =?us-ascii?Q?/68I+iRiAt+iVeLQgWTb3/9AXAc58GpCZqQbGXoaDHCWgZenMC4ZHlOuFc9B?=
 =?us-ascii?Q?/4o9NUL9xVau4vdHUooX1e6Cp4snipYAvt3qP+4Njsmptp0bI77JMP32d+lB?=
 =?us-ascii?Q?jcIG9oR0aFFJKFzfMDkSD+KOUSkWjrrhTBcabH1br98vrnMZ6yBl2Ky+A92q?=
 =?us-ascii?Q?lZUJAnebIpYyqjXbSfTFPrA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6def0b68-e963-455e-8548-08da7baa4ae4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:00:55.9057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svW9a2O2AW0o7MmU7SiquYhfSr/WA14M5XOzTIV2pbPLHmqw4JGTBU0ttTVwi51PiAeUb5KKxNk97lwQRrbYcH6///xM3n6UI8eZtp70EWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659
Received-SPF: pass client-ip=40.107.7.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Will need to set BAT entry in multiple places.
Move the code of settings entries and marking relevant blocks dirty
to a separate helper parallels_set_bat_entry.

v2: A new patch - a part of a splitted patch.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index a76cf9d993..7f68f3cbc9 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
+static void parallels_set_bat_entry(BDRVParallelsState *s,
+                                    uint32_t index, uint32_t offset)
+{
+    s->bat_bitmap[index] = offset;
+    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
+}
+
 static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
                                  int nb_sectors, int *pnum)
 {
@@ -250,10 +257,9 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
     }
 
     for (i = 0; i < to_allocate; i++) {
-        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
+        parallels_set_bat_entry(s, idx + i,
+                                cpu_to_le32(s->data_end / s->off_multiplier));
         s->data_end += s->tracks;
-        bitmap_set(s->bat_dirty_bmap,
-                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
     }
 
     return bat2sect(s, idx) + sector_num % s->tracks;
-- 
2.34.1


