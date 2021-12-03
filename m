Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F804467EDF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:37:46 +0100 (CET)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFJR-0005v8-K2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:37:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8x-0001Fa-C6; Fri, 03 Dec 2021 15:26:55 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:14661 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8v-0001cv-Db; Fri, 03 Dec 2021 15:26:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHIDL22ykN2Hn9f7DN+ELunGr9bArU21SXvvbiODPw1fftuNxoKP9ma64XNdH/S/je3icbAUnq1oh4Zdt5muDgtNYoxL7q7AMQSCyxbj8noYOwww8ziI9m9Lbl5IXn23Y4GroFBCjIyodOfyr2VyDhMGD8t8HS6WSRZtf24nk8uOgaYMz+sXCntwEdekkvfyldtnTD9XAIkevYFRW+lmPM6p0SWb76huaAgo44rBlgWXmrO75bm9GZN287tpcNbieZnMycWxQAdKj+If8gW0sH+ODG4LgYceoJYpaNvSV3Fn/4IJSzB06O4Ba5nRLmXFZWvpcWz0l5lO1UFqnlZfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcS5iw+7biQUKidhckmjzMK5OKupplkEZZwW4G9n3oE=;
 b=dpPgye+MPwLcUaGRb46USErG5AP/tAdybqvmU9JagG/WUtBGa2GA7UDnfWQSMmzDUp0hLCB2FQp4UTSemLbpfPEh1JP3aVnCSL43dZjq8UwAnIJCHm9biFpna+8SdeCu3PHW+4wHzYSv68Py0BLLO3jih6/Jqpa4+IB62VFQdrFoxYW9OpmIAo/BwwHQd48UTf09nWZT56icuq5LV+krXKS7f9MIodY7+6YmY3vvMAqXkQRGkTEWf4ccWgNhn/3EqSFzEtjNrGDneaXE4+ev4KlXv4986IxrxF2xiE+3JhWTz3XSEHTGXEAvEOnCPLCSAyE05A2JeZLu97LqPN9kDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcS5iw+7biQUKidhckmjzMK5OKupplkEZZwW4G9n3oE=;
 b=HRZXrCZoGa37XfF4tg4/UZY7qRafdhVoqF18I/iqJCw8TB3VqyEu4OqJxQEq+1dj8nMYryQHGuGhAnS5+zkEZb0e7bsZerwKemCVe1puY+xlkbiEKjnmorDPhGYgtlasbCDdEdNW4E3QmkFQHo5ui6fY2+gkN/Ia+MY45bZrnuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:22 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 08/14] block/snapshot: stress that we fallback to primary child
Date: Fri,  3 Dec 2021 21:25:47 +0100
Message-Id: <20211203202553.3231580-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c89d31eb-cfee-4daf-80fd-08d9b69b2b7d
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB38411DA3B19A836A9CBE54CEC16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKxMwgbIz+OwlJIDpFY18PXBuCg4xxiDNQEx0KcHNylBwzxUyF6m/9JihbaUxNMsCfb+/mPq7Llws09Nyl2wATvMCh13Krtf55eD9saYTvvlOH9NTiKaVlyacPciT9A88RGigqKog19k4zar5DEBMOwjI/3AFmLaDQ4aYEmudhQ/zW+WCYNvhZhGSDFammJSDhZpVz3yBy4isxTzJpbZ2cGCaKvH1EexNkyZxKeHqjXg1TieRVKJlK+nXVNgUhNmAtDPO9MrkOkXxxHoJAyzeHRB5n0Ns1M0cI+2vRT7B6z2z8CkagNHcQYrVzoiNgy11iYYyJCzMvyKiog1K0Ej/axBp94I1LrqhvcE6SLWoWgSFTA93vBsPv1NDxzHNdCPsvWWTQpXB+T0yi2vBa4jXIj6j7+rpF1lOqkUSEInivduZurcNA7TC1LvldKqSbD1wCeJP3w4Q27dQ5kHz2pEnRvm2c/O4vYwdY+7J5FBVp1+05uQpRLj0+kmr1oqSXpiFAr8cnoffMVfetLNoFUe1wdXaUIWdsxEKWcrzMYta2PQszEJUuepTKcAuFpDwNWWz24D1uzwPr/ZE9OkkOgAE7z6oMvimylhkqYTBcTBDw8ugEmtNr5cFxKFjSYPFggVccB09cMCRbLGXDATxDVhEnQEQ8AkHilLZ/Phx7pwieQZq8g9UTtt63550/Myy/AiNzggeLoJOgwZ+sCjkvOu5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(107886003)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hg/w8n2a2DtgbbO0g1IP9zpDI5unrm3AuUDpHvww4X39JrbPIyHbJikFkM7v?=
 =?us-ascii?Q?PPwe8N52UrtUQ4i2/CNAiuCc2b639zK9eFX1CNI+T4t5r29GMccCX14zFVg+?=
 =?us-ascii?Q?a0S1QNCn0NWIzcqeJk3MKbWI5RfQcz3QyOfX1LzG9zs9KXTXStJOim2UTefB?=
 =?us-ascii?Q?EEviycScj9hRBhkXRFfbnZesLNRfLhZ4faEwBa1p0G9hbU/VudLpa47ceMFa?=
 =?us-ascii?Q?8HcNOEFUuxhceVJdIM0S9OHmO5/7QEgYuO89MopGZrTsYeEYKpjotHg7bLQt?=
 =?us-ascii?Q?NeBGwmoxFAV3QYhBTqB5d6Jof4hww5r2llmB/7jx7+b/LH7I6ExQ5ctAYyE7?=
 =?us-ascii?Q?UYap8Dt4A6Af7Gc1wfdG+oBDDXvsjpjFL+0qEjlpMoGdWwu8PBuo2JJ0zd1S?=
 =?us-ascii?Q?2EP8XSvR4anWcvxhsj6ueXhTGIfRURsyTZDF7tIG17bx8jjHJGdUa/EeH/2f?=
 =?us-ascii?Q?in8CbZUr+aBF6p9r+iSVNBTENdkCtpNpEpfZ9VdjFhfjkWTqbU5FQaHrgUOS?=
 =?us-ascii?Q?xKStRvI1+0HeDYJyORTjH/QZemax9NnAq/Djr9KcC3onWWX5ZpNZSG+Jn5qo?=
 =?us-ascii?Q?eB5MvVJ5ywX1AohZl7H21XIYzqCxyMMs9o4JFYr408QrswPH7URCaXGiRE7d?=
 =?us-ascii?Q?CvzZCzFm95Toao4WpVTTBGUmpoCTwkroXbIK8JR39g1AuY7NQqIubpLLWSux?=
 =?us-ascii?Q?5mCX4cMbmtoBwsAWAL8bkNwL3xSmAZY0ySMhPlqshcdLAQ2cdaQDsYpH0dlK?=
 =?us-ascii?Q?E2Bcom1H8hL8RU6MLy7peadTo2B96BoHftiP5u5FOx9SbfCLXxyCerrXNfZ1?=
 =?us-ascii?Q?JvbsvsjyCfj+1A/SWARwtabCG07G0YqJTIYV1LZEbcMY1jtC118wqPQGg++7?=
 =?us-ascii?Q?ZPXvrpOQYDGWrjg+/PW4O742yiDzq5X1pbRsOlLtG8J0D5ZIti84MWZ7AV7H?=
 =?us-ascii?Q?ZSp5YWm+cuRWeMdwTc3DFpAyUoXrrK4dc+gIPhJZmXdPVuHd0JmJ6raQBIb1?=
 =?us-ascii?Q?KTXrW4esf1Dnvy6NNk7bXEajHmK4B6JHYA5WghPEwjyiv/qLmcP/VWBKWuM1?=
 =?us-ascii?Q?iF0h+/DcQ6XYybD3BFfFuDtp08JGSIpatbHH9MeQRMo0d49g++TPVsVyu0gA?=
 =?us-ascii?Q?dxiNEOep6pfG1ea3G2eVVCwgutsUH/rI0n4GiLqkBexW7ENGiBgj9LVR2OI2?=
 =?us-ascii?Q?W7TY/JCHSLoTe540cnJ09XRgdz2h1pAwdl/9OIXrb5Sw1wUyoIrX8nR9MW45?=
 =?us-ascii?Q?E07fH5G2zQRmdSuKRZbbm5bdOudmRtpc3mufzk4cw1Iui4pklFtK2rD2XfcT?=
 =?us-ascii?Q?RR6xn6kXmZoDJmLsnRnsu2+kS4/bepQ4FY6YEyoaU/tvAaN/3PbrwPggGnCd?=
 =?us-ascii?Q?lEfFsKhIpaSflvSWK5gHY8hNdMrUdxv1mLpqrovAVjCc2swDJ7gaBQq/8g+g?=
 =?us-ascii?Q?NYEbtEfI7JF+dXgQsgX94e5QzBpWxiJSUJCgyyVGixNV3obfu1+Pl5d/wLBH?=
 =?us-ascii?Q?mEzotlyo/Jm6Mkusm4EBem1+ZfKGnX37HJhvYQuK8r4swkwByn5zPvFJeJnX?=
 =?us-ascii?Q?+gtJ6vEEUHuT10NkvdJedcgO7Sag4uRiMMTqIGhG9DYjdiBa2i9CG2J/uES7?=
 =?us-ascii?Q?Q5tWLM90OV1vQBInbeEhuQogFRYE/n7oDsBXVtsVniO4HO+SGbd8blquN3Cg?=
 =?us-ascii?Q?77c2sg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89d31eb-cfee-4daf-80fd-08d9b69b2b7d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:22.0963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/N1vQ0hws/UKyFqp5esL/Lt+meijwItE0Idnc5zDrkVEk/CGJ5sIdJgIL8TVolb8x3qnpQd0D9UfdBGXP1eAeCQ+dY4NpgL+UO6hMPAEOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

Actually what we chose is a primary child. Let's stress it in the code.

We are going to drop indirect pointer logic here in future. Actually
this commit simplifies the future work: we drop use of indirection in
the assertion now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/snapshot.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index ccacda8bd5..12fa0e3904 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -158,21 +158,14 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 {
     BdrvChild **fallback;
-    BdrvChild *child;
+    BdrvChild *child = bdrv_primary_child(bs);
 
-    /*
-     * The only BdrvChild pointers that are safe to modify (and which
-     * we can thus return a reference to) are bs->file and
-     * bs->backing.
-     */
-    fallback = &bs->file;
-    if (!*fallback && bs->drv && bs->drv->is_filter) {
-        fallback = &bs->backing;
-    }
-
-    if (!*fallback) {
+    /* We allow fallback only to primary child */
+    if (!child) {
         return NULL;
     }
+    fallback = (child == bs->file ? &bs->file : &bs->backing);
+    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
@@ -300,15 +293,12 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /*
-         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
-         * was closed above and set to NULL, but the .bdrv_open() call
-         * has opened it again, because we set the respective option
-         * (with the qdict_put_str() call above).
-         * Assert that .bdrv_open() has attached some child on
-         * *fallback_ptr, and that it has attached the one we wanted
-         * it to (i.e., fallback_bs).
+         * fallback was a primary child. It was closed above and set to NULL,
+         * but the .bdrv_open() call has opened it again, because we set the
+         * respective option (with the qdict_put_str() call above).
+         * Assert that .bdrv_open() has attached some BDS as primary child.
          */
-        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
+        assert(bdrv_primary_bs(bs) == fallback_bs);
         bdrv_unref(fallback_bs);
         return ret;
     }
-- 
2.31.1


