Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC939FD78
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:20:11 +0200 (CEST)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfOc-0002Cb-GD
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqfNo-0001Pk-TM; Tue, 08 Jun 2021 13:19:20 -0400
Received: from mail-eopbgr00137.outbound.protection.outlook.com
 ([40.107.0.137]:47939 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqfNj-0004QI-G7; Tue, 08 Jun 2021 13:19:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7ZUHNBJpmUB3N77H/M8pjpitFfGNBaIkSTgumo4CMnYSIQ9B75RqY0Oh1z9SrgPUFO/ezZLeUUf7FiCPqgzGaS0zXi5xUNrBzajDmI9yNbEjwmApCSbO4DJeMD6rCs5EAqoj48MgzGDg/FhnjXu9favXQKsUvMtEaiGMsx7S53IDfdzL1lOTCOtcEsw/wL5aZpwMwSmhe3bOaCLg89lsqO0OM6UcruLbbdSTADrU5vMNyHSPdhxgt+IMxZcJAmlKwKthEDJ2S3YARrR7zCCcw4DFZrKYTu087E2f/LK9HLyy+yoan54fx6qVYZEY22tva/k+PtntiEbJHH1vPrRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEv1igun2j2fDMUHUUHSz/fI+UWif/45OlHQ8QxFvR8=;
 b=V5VCExNM9mj8HebiUrSzUM5iIysmEqIiwTGT0plLex0RqIYd434HaicbJfCZhExz/tXIp0NHEiIVk6uBRWKF1O+FG5sfF8zzEEKCtlaAY/Rh0CzwGyjiP1v4mnosmyQGD8usradP/LONjr1NK1vlEnMxOs0mN5LTKr2iPqdC3tKqIW0+qqDLJxX0dAGhDb0pwExVZ3wLpjgs2GWXFJZj8DmPC5VR1MYGAZK6IsyRGM0NqNgqJeexwewAImlqkTZlbF9hobPjskC4r8cX9CTyhwvToPTVzbaC1+WOFoOer1HACP8ntFoXmgGE3hVejTQ43XcokoiwI8D9ZOc8hGqvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEv1igun2j2fDMUHUUHSz/fI+UWif/45OlHQ8QxFvR8=;
 b=cHZO2MY/qLYyh2wvar5sdthf19m37lNYfwLUskIT/fZ50LGei0BrHxo3QkUESuhUMdATRDMIB4wpvITQp6nqYXgUUN9ozn5+MnMPFXxpBk7xHC5nfnAWmzKJ7OVRLEtUI8rv/tkBKEVX3XLwCSjD6gJMWg5dwsqVTI724qkuSvM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 17:19:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 17:19:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH] blockdev: fix drive-backup transaction endless drained section
Date: Tue,  8 Jun 2021 20:18:52 +0300
Message-Id: <20210608171852.250775-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR07CA0006.eurprd07.prod.outlook.com
 (2603:10a6:7:67::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:7:67::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Tue, 8 Jun 2021 17:19:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1025b6c4-7b3e-4e4a-be46-08d92aa187ee
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40728D709A8ED1C96E79DE82C1379@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GqYHzIEz4VW1vhUzStv0BecnptLbFLMAIx4uKUESR2G/5UIDBKJ4T0Tvw5PvnKpHvcBo2NwCe7rnKEdoB9YiEn9xwyJvcLxZvAmI7/9YY8eyZyPmyc9HCtBoT+55X0s8muoEdHM85J0982RYcyj2afsM0ZigE3xpbPElmWM5tKcQ1BiboPcDpU13plf/XbNEc1z5aKm5zFKaCli/XF3nM1MwSkJDwsrPpKzs/frxWN2qtdwvs0JlHpPodhdoUvyxgsrBSNO78rTxjuBLZM8cZD70zEU4KrZKicY5D5u0emMECmww68AY0VW5QsvrEHEIcNm5cTPJ2LZt0p8//LpPASaKVhDM+IgO5kxGSpReMzKUG1v5VoQFul0tDvZeVh9uZvcsyeHDiichTGbgIsDT5umf5MT0YsngxGOdBMW/6k3aj4U6W6kBwSxiKtQjNdjpxqKFFp4jTuQFUL2CDsqpOZANaBeJ2QEAa+I0eD31Z4DSsS8xpUWATw5NoQxvN0U3AHrRPWUNFI/EKzApFYvYsWWbU6hG/e8DfwKf4P6MAe2n7jBwjYg5OYEdVhKdahaGXeaVkC/xfcw6FDpuIyyNiU9qovitlw4KDdX6fpkf/OwsoXSIq/Kp5vQHRadpy7z13Yr8xYz1zdyYZl/zaoa9+T4cAhRUVtlVsObvSg+oVyCy4kCFaP+OkbIkIYOygnOybsFZTsrbbDuaKR/3tzB9cO8yKYWbKNll1kTohGeaqxj2o8qb7jBXiLCBRYKyh1W8glof7+cjmWBzXGCM3vSAy0PjiD+w71imoqhr/xro5LueDEKjkipFA5WXxmYT/uV3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(1076003)(4326008)(6512007)(6486002)(8936002)(36756003)(186003)(66556008)(66476007)(107886003)(66946007)(16526019)(38100700002)(26005)(8676002)(6916009)(478600001)(52116002)(5660300002)(2906002)(956004)(2616005)(6506007)(966005)(83380400001)(6666004)(86362001)(38350700002)(316002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?58GUEekGld65mjY9lm+z8KJ5dqWiDT3kfi78jBUe1pUshomCZSnZk8vbqXwn?=
 =?us-ascii?Q?DSMaoZz5/ILzVhkukcUTrvc6aVzpdtDsev4t9ZceiFjAv/qSzmgiCutS2t4H?=
 =?us-ascii?Q?vxjqzin6WXcOlmQ05mHJq4/3Djw7am8V2Jwcr9CflVESSxkmeNeK7sygrpTH?=
 =?us-ascii?Q?JcNZVRAjsZ0XZizu1OxwSV1912fCCSgmOPDinqUmCh9smmuHMQrYppqb9ukv?=
 =?us-ascii?Q?sS2BogP6oyGwVSi7wrqrJp49E5s1PlZGlyKBpuUy8x7qyt+/e0wCIqvPZ1Hx?=
 =?us-ascii?Q?B09r/B9PAWgdqwqOnf0YETNHt1znfMFC+fYZlledtGM+uiKARIwrt4F6sLfT?=
 =?us-ascii?Q?f1jtZwhkiYq+zbYgaQk+Hpa60QAEPCWzyO40twWZRZ5X7AmK8pZUI9lfJ2PM?=
 =?us-ascii?Q?2v1jCOWBHJ90afOLSJah/gopqKgvUs4Z3NiX+sQRT8+Loc0afItGOX2uhuPs?=
 =?us-ascii?Q?/a7z1hPnAMzzKoV8jGi+A1/RP/UVbMZ/kB/n2ad7LGQ1opzxreRbP9oW5Ily?=
 =?us-ascii?Q?un+5ylBf+4HwjDW0cW4fe/m/2ZXfd+S5exek6iOW3vjaLODOFre6N/eqQf2O?=
 =?us-ascii?Q?zq9ziJNxW8PhTbnCaDU5stF0jxzlB2DlnM0IZk0WXLL25Qa8Z1o5gvMxUs9t?=
 =?us-ascii?Q?03W7xUsrL0JTYYjMea79LaJ3t6pi5ESd0iCEb60mQiRYNFj0xEfXBz4H4bvY?=
 =?us-ascii?Q?ourryKqS0h3JA/vMHq0YHXiYNDTD4uBOnPJl61VdRXaJiBK2zBbp3xTUoUjd?=
 =?us-ascii?Q?TChpkDuSiGzDTUYkOH7iNMFB+Bzj/AR3lGILsNX9eK8jBLlFgwdjEVGvvK/Z?=
 =?us-ascii?Q?oNYikiKQFs7WIj712EnMvYlsIvBZFycx1VXVe9FuNOEr9nWDNhd7P6ew4LA3?=
 =?us-ascii?Q?Z2V+9ggzL3beR68ATl6fUhHeOjLTgemjn8kELWHTLmwbAVjo/krRGy27uyKU?=
 =?us-ascii?Q?6Pgy5+1u0RtNWC8vnGvt/fa6JKoxF9HQd2HvLUC/677ibcHKcEl8uqh04kKk?=
 =?us-ascii?Q?o9NtWdA01fgk4GjbqlsVO11/BXsIjDOG2MtOCcXZK3E7OpArs3LwJ2a8lczw?=
 =?us-ascii?Q?1XAoF8X8VNphr/RDd6V8l5LqZHCZgiVx4OdOhq7QCpubfYu6r8DBtnynQO9Y?=
 =?us-ascii?Q?k6Du6b5Jy5IDSrS0cszpz9bbf/FA6pueIfXwqe5+tKHXwAStYrXn8VjfGzZE?=
 =?us-ascii?Q?zMdm5mry2HYtVgf2rdpYDHUcqLFa/iJaz2+B6VG3zsVh+2PuPXOLj3XY0XRL?=
 =?us-ascii?Q?ytG/BztW6n78UWV3xeYkXEhvh6mDmcK2yeiqjQRSzd0G6Wib7w8sEdq/JtPa?=
 =?us-ascii?Q?wv2hev0g18xVAe8RVBYMmWoj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1025b6c4-7b3e-4e4a-be46-08d92aa187ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 17:19:11.1443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7rxQ69IF2yf3QCLxLd8ozeZJRxln10eticCTWjgXcotIKeABIrvjAYK63jaGFs1VJBjqC8ejeM8iIjhd1XnEJHqwQQzcl1D2Ua5wrHdrp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.0.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

drive_backup_prepare() does bdrv_drained_begin() in hope that
bdrv_drained_end() will be called in drive_backup_clean(). Still we
need to set state->bs for this to work. That's done too late: a lot of
failure paths in drive_backup_prepare() miss setting state->bs. Fix
that.

Fixes: 2288ccfac96281c316db942d10e3f921c1373064
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/399
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 blockdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index f08192deda..094c085962 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1714,6 +1714,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
 
+    state->bs = bs;
     /* Paired with .clean() */
     bdrv_drained_begin(bs);
 
@@ -1813,8 +1814,6 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
         }
     }
 
-    state->bs = bs;
-
     state->job = do_backup_common(qapi_DriveBackup_base(backup),
                                   bs, target_bs, aio_context,
                                   common->block_job_txn, errp);
-- 
2.29.2


