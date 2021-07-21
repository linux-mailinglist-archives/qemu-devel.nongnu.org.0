Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286C3D0C5A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:18:29 +0200 (CEST)
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69J6-0005YU-9T
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697c-0007Te-I2; Wed, 21 Jul 2021 06:06:36 -0400
Received: from mail-he1eur04on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::713]:41470
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697b-00020J-3b; Wed, 21 Jul 2021 06:06:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaU+yCkVghVanDeuOYBMxn2olYQ2zBvudqAAuqbtt4+Mtg8Mujsk7QiZc0V7EHyC1W3AMS2Bgi8UQQHjgfMB7KKxYvI3aV+HhCTInXO3lmCrVh1Csrq5MchTOXcfIr0LDtnIlK8xr0gw8fI/sFHTK2EmFcfC4d4rm6+6aXfXYUL0bZNhVaE43rDBeCd6fqS4fx8Z9iQMbyobUURkK1R/5xwj0mkOjP8Dx1AqJWfSYgENyocWhUvuJx5KWBK4ghzjKBLzuEUBilDoubOumCVlPMrY79x9wlNtxylBEGkeL6EFdy7MWwEKJ+LpQ7ulBTGliggX22rSDThDy8Phnjv5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=bH0dTdIafkH1o3gWi9BsBLAQkRRVMnigO/oRLS+8uYwXhARMQGNrV8AXHfWuW0B8FcB/JWrUXzdbMt5vAS+7DiPHDmqmUZZcYEsSzD2U5oTFQr4BZhkevFL9soiYpg6rtknC8Pfo9D1+SxOYvHE+mou4KzQ5C9Qq9ZrfVeqhckxp60fizrqsFx33jAJnF2k16dtP0nxM6ZFFT9idwJsY6Uh2tMd8N20nhDd9U2onMXBEfEY36othoneYfEO38+0Yvbxdq/Hzsp6ExOKeq3ljsvIqPgso84cOYkAyZUwfm5Z1FOhlJi5HOtEa5gMg7e9BKjSlZthTtdVULg1/pffx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=qbERGsjjznUp6XSaW2wi0z/GZwV3klr5OE7L3tG+3KIU9AFbwXiuoO3iULgtCAwyQOP1s9Eto53u609bNJaJYx5FNadGJ1PgqOCrsrRuVV+JijZFZ4EqLIsZ9wSpUjpmxcVAOI5EFYN4Was+x9j7OEwal+Qyo5i1fko8UhYUh3s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 10:06:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 11/33] block/copy-before-write: drop extra bdrv_unref on
 failure path
Date: Wed, 21 Jul 2021 13:05:33 +0300
Message-Id: <20210721100555.45594-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c1ca013-4ac9-43e1-3fb9-08d94c2f32d5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47240B47796511A973D87ADAC1E39@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIyIygQHw6TWbUnPUCu8emCJedNn0tPYAMLN4DReBxcsyuAYNl4ptUOda/zQuUSa9lumbri1YNAr8kc4l35aFl3z8ZknBaBurdaxHC43Q87M4L2hUduRKJDSOmSTpSTvGzfrT5Uw5b4fZegtYoVcPAebpGRByzWRQ5/eA5eux4T9wfwy/I2G7K7p3gLxcn4NKxK0p8UyCNU8wlvxGcyvgedOOpoqicBJu1YU7aWNjjJ1ZuUBIRx6WETD1LbsxogL7aCdPIRsa+DA8zAOJ43lQBR6Hc+Ot4GWpcG/Obip1ZZS1AzLxuzjzONrIJXXiK8MMdiqyMmC5E+6vwnNfiNYD0nyPaXnRsn9ab0wwd/VM+b3tuedJrbf38NVdGtozL3yGHiZugREITCRjGeF+JcwPcFiGWBeGeQ0xaaMS2BHkDAs8n9NGOggaFLnivi5G2FxHvN3Cqg9lhOLt+cjxj0y0rCoEbWaGcZi3m6x8Kp5E/vTbTSHWKoMtVZaDoKU25yj0EdRiYR/J/eNC6/nQU9I0Z5+QiX18KN0SlC+yHaxhnVV3jZoFF2cxwTwFreeXSeQjwJySZ63ODWEEvudfHktuH5MC/s/rW0oV3XThjjE8T8uEE6oOBoGoNC6vfa/Z94Ym9dAQSJ0lWhYC9HPJ99rWr31dWwIkftRuL0DrHQaAOGhPb4mmSZkjwBFEuc753Gw7qvcpdtmfJMLIDJQnTOWNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(186003)(6486002)(6506007)(8676002)(52116002)(956004)(316002)(86362001)(2616005)(6512007)(83380400001)(5660300002)(478600001)(8936002)(38100700002)(66946007)(66556008)(6666004)(38350700002)(66476007)(2906002)(6916009)(4744005)(26005)(7416002)(4326008)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d2fYejC/QK0vOHswT9Q6sbkAuk20vWKmeRrX85NfFEbrtZ6yFor3puY+eUu4?=
 =?us-ascii?Q?xi/G28bOBuyVBGB4w6DpqSqEN+PcpVKZsDTYMVu11qXKM8rR5e/yrzbwXe46?=
 =?us-ascii?Q?DhJhSszpUDwrEPB09/QUFvQJsYBjKxKrZBCUbk6PK8rc9+XcRhw+84gdMFxd?=
 =?us-ascii?Q?gklMxPEaQMdA1fB7X81H46C7p05DRVtcKXIA+4dAhxSNZ0rN46FNI1pElUzs?=
 =?us-ascii?Q?Jk08YpMmT6nusEqjHPe9NRA+b5+GiF1CQzU0l3WGm8+BZaVkwEJPOWGLJe7J?=
 =?us-ascii?Q?j49h151N3rVJOq+wU4FTtqzaBduq9+HKaVOjc/fWvh6xcHqEn600Oov6BOos?=
 =?us-ascii?Q?Um6KhMVKdQD1eo8BJRPRc19q2mH7Kme7ntVJmCWogyF6pPlq8FbNReKw0iUq?=
 =?us-ascii?Q?oRs0NOOw2K8gRucq6WrBuLNKh59tkVmIJmBrE6AZ5OdeXTfZS7Gp4r2ysteg?=
 =?us-ascii?Q?u5Mrg2YmqLFX+c2uqpz7aK10oEgs0ruoVILeB4BVkQEaDjSjhOe54x6lUDEu?=
 =?us-ascii?Q?C35i2VuYKhbP5mMTBKMqJhW9++arb9ralCs3FsakRrt/mh2zJrIOWYXkX4BP?=
 =?us-ascii?Q?k4GmP0q3JCfDT+dOM18G7uBYAKwW2pLie2zMDVwxHAOYHFMg5kkcCOiu50rv?=
 =?us-ascii?Q?RIr5jZ0DtE9rzwHlbhtKy4oLuiEuEnLiOjid4ElbVTBVDZMHFo3Rar/WUVcn?=
 =?us-ascii?Q?iMFz5HuD8gKjUGE1zFazLnZSUWlSBOdnhnkIf/RsVkjqAF5BgMbKud1VaxrM?=
 =?us-ascii?Q?h4g43VE8qn63plXIJ/WvJG9swJpAUwP7cRQMFWXayuh2NfpSPCAjHiQfU3Fr?=
 =?us-ascii?Q?THUCgiA1DYuXPy1v97Tg3j8/yHnWtqn/kycJiuyFN3+o6DXExnieg1VBXMLi?=
 =?us-ascii?Q?4Gx9fcgEkM35FAaw09YkzKm61Jj0Zd9DtDriqEbzy8anv/e0wIDmRTm+s6qA?=
 =?us-ascii?Q?SCgSGMbQYmyLZQuqo6LfAGmQKJb79Z8WUQs2D7eB7edeuv/kIUoiB3uj+YRT?=
 =?us-ascii?Q?+Y2CfF5LcsXY30W4BEK/l0kfwdHWklYGb4Tk2WSwrRX5KwnWlaTloSu4LOeU?=
 =?us-ascii?Q?+Lhueihn9wi4va6DfLA80GadLQfhAzVVVsVBndk5tgwg/NBkujSHsckVQR42?=
 =?us-ascii?Q?QHbUVUyVjmyRfX5KG6d2l5Cgl/rD1+0MR5gRUhfncLJ8DI8ZEO1yYJP6CHBx?=
 =?us-ascii?Q?QPyzjAHRJSoHLT8XDgRlmbq3UBJf8589j/8+3lfZ0M6UepzGDMDOZOg/MHoH?=
 =?us-ascii?Q?ihQOehHAdOgpP3zxEjYKPFa8KPsxPK2cRVHQqsbxi7cLKup6m5J2PZedba/u?=
 =?us-ascii?Q?KhBkAqpot1SseZyrV/MfAMWQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1ca013-4ac9-43e1-3fb9-08d94c2f32d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:25.0950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+4amfkVbqbmrSsk43/KsGqGDR6Y4P/8Pmp3ZBzikyBv7rQ0J6O1WQLnznM6TVce0NrST7VgOl47UAQs1ktSVKtdGpR4cojAaf4gZOeyGXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=2a01:111:f400:fe0d::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

bdrv_attach_child() do bdrv_unref() on failure, so we shouldn't do it
by hand here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a51cc64e4..945d9340f4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -201,7 +201,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
-        bdrv_unref(target);
         bdrv_unref(top);
         return NULL;
     }
-- 
2.29.2


