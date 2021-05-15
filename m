Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE038192E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:51:07 +0200 (CEST)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhuh8-0005Ul-I5
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudr-0006iu-Vg; Sat, 15 May 2021 09:47:44 -0400
Received: from mail-eopbgr140105.outbound.protection.outlook.com
 ([40.107.14.105]:13825 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudf-00039c-RX; Sat, 15 May 2021 09:47:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeI4m58ae8BfcVnpxgXWAtPBZ57iEJ0sAsQw8MQZ/PEb9u5WtRjtpTvalICNwIiHceKXk1cEEgtDuXHQ8srs9pL1e5baShr2TXoc7uWb3Onu8X5NxSX2vw2w2ZKR0HQKv22ERZh5gUsePI03aY9or+A8dKjqJ2yuomuhUvGnAzCJ6UFnn3Bkog5JBy1Y6LSqgdy3AFPhEsua4KnhTcqsuGqn0uGt7NioK4WgalTcDPADtk6ra3nCQWESzFHN5v3jCylDy0gMZpZC3YQ2UpE0spTsm/S6P906cOFYO61x0Hgf2b2n9T7JE4MXo+dnbzePFn2ksTIpvlGGOS6UIZM3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4fZbuimztf9ZqWUbbWJUe2RHR5CJjj82yU37P2+8pE=;
 b=a/NGlfclzfd6nIVjnfGaJtDDn93izm1gH3Aqee5LFt9EZlX6l5Lxhg9pBG0G9IJGLM5qP10GRejB+/2EQVfYZ1MqXK+8edYgy2jwJEktl47qwQ3YdduHdvEV5MpMILYWCY77g0H6Yb0CfJFc11MkggmqIIEZEqFD22yMUpwgDUwcQC0uOyMxippkYSO50pk2lxtHBSapN0qGieuGiVJ7c8HgsNR8p0J1jMHWCol8dmGCcFbkZwAgHWYPWrmfe4xLZuK6QIkxKruSqf/ML61mpafGr0o26k/nG30W99QS7T7CVSwmnz2pFfuXGM6j5+Mq6sQKH5Pz7Q/7ac/ZV6DAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4fZbuimztf9ZqWUbbWJUe2RHR5CJjj82yU37P2+8pE=;
 b=KfIOfs5Z/JapIQ9jZAtcyYF68xT4pUuzPXsgz272DYwBkAkGaEqjqK3oywdQY0gXU8wstcVPd/qjbALwYnfVB1GzTb7QbSuH5gZl3TtkN4oXu0vjcw1uBYFCAxebltWJU9BZ24xZU0utrWv4sdkAU4Txc9kKFosWXzb0Jo5ttgs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 1/9] block: introduce bdrv_remove_file_or_backing_child()
Date: Sat, 15 May 2021 16:46:57 +0300
Message-Id: <20210515134705.433604-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7c22e7a-9fd5-4c88-a7f9-08d917a7f8a2
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB52069460CD7CC9EE3B4346BEC12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:67;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iUQJbuQfRmuca+QT/FZJVK0GMmg1DwtXY84Jb+rNahjBSRYDcGGjnI+S7Jl+pTWFfqSG2T1D6rBsR4hRps1/iUJ6o2git7LLeP6plKqGwYTK/27t7GArIV/4fsuuvy4Xtl3a72qbxyo1zO6z21ooUSeZXoZRovgsg/6jUVpNYIiDqjlrioJA0MRGttiPCQsVsedZQnyitLszjAIscOI5WfDnOyWFKjkIvoQG65kb1YiRjyvQsYHR+TyGYQW7xAlYgjXlF5qNn0AYGYn3JEy8l/+Pnd5BINNGz9dWeNgfehAO64GZSIRgtS/Nlkw+/pM0B4OqQ6Occ6r+oEF4eaLDV1sJdvDMk7gsSUXWshOtYLjLHd1JW0BYnItPL1GvYO4Ve8ZCVk2NM2YnftEhDkbMYc7euW5MP3cqcqxpluvIkBakKSMKJfFaxYNIxnN18VIXcEx5NtPCUWPxO5vgilVASHTcOSWNTUCR7ayCT0jMGCLP7fb7OS1Uf3jjMFRXjcd7E79yT+vPRukCnTAp0hyAyBxqMDc+ECaJ4I4maHZMl1YN1t/JNIkex3wrw7u5B0DPtg4g0Gz9TkUBTX+Soc17oRBqOx5IDUGmh4T2GSiGsisff8nAOsl7CpgmJ6TwRHdEpa1BYXQJuojJ2u7sF7pEy8bx5dtowtXl/7C2QNLlyxby5QGzMdMrznlsX4QPHcIE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?V6LqZJAVZT+Tf2qtQnIXUMW9Z4Ifo3QTP77q3UkgyB3cxcAHbZd5s6qfL+W9?=
 =?us-ascii?Q?Khdqekh9T7PEG+bFL8461BHSoWx+QpY6CZelUXzbuPZ75t/aSVqsZK1svXAv?=
 =?us-ascii?Q?kHz5dgED9oWEw/LInoKZqrBZzcbg3tQli12UC3qXg4RTcpyW0EtgTOhJjTcf?=
 =?us-ascii?Q?6RPBHp2RT521+hzZg5TJuiXkt2tan2CJGglUsXA5SRpznfMunrbepsk5vZG4?=
 =?us-ascii?Q?akNTc8VAijtP0AH0ksdldmYNsn0avZcwniZKy9wt2asOMwWsZiP+H11e9Qv0?=
 =?us-ascii?Q?Cslf2+xVUX1jLv/TgieQJndvaISyXhrrxMuJqVWa5VWXR2GS+F9/ipwH4wbF?=
 =?us-ascii?Q?NwsEAr+TumA5HwUGOT23dXz0N9w+tc9snsCxILSMra6jS0PgbbRzF25ikibD?=
 =?us-ascii?Q?JhDsbGYD6yOK1K/U1waqcuKYA1AdmssyZTPHXB6TDaSxAH3vLJ7UsuZKMrmD?=
 =?us-ascii?Q?05A+pz+n51sM4DJbHAWAh1mErih2m9kYoWzrutNlHR7yjlbsOIXizEMi3v5h?=
 =?us-ascii?Q?CL41aunp/qPau+TzFDl2dZyqCS+pzIChvYAzxe0dvf9UYJq5KQ1KAnHl52Be?=
 =?us-ascii?Q?X9KXJJzJ3OA/StXDmIJDQlXAxX2lhJGb3iJ3jN0SvEqbXPdeAkUJG3jvTIx/?=
 =?us-ascii?Q?e+3cGu07SSwvrVolGyPxz+g/G0AKU3UB6z/fOVZhLDGxQSCsL6GkNtEAiXum?=
 =?us-ascii?Q?KZumXvtGXbIH9nRj4ZAOlC5xnU4A02TDm/S74q8g212e3zdHQ4Ff1udT9ymd?=
 =?us-ascii?Q?GACmKSQThEwqJjKnuFmNWHDRDlrTGiIKBQ8DorOpmbjFR5O5Q47cF6dHOpfa?=
 =?us-ascii?Q?4F9IediRWTLbLKN9iAaww/MpBzEZFywPFZXw96lWcsDn7wGwkxAAbDzzvEFv?=
 =?us-ascii?Q?j4Tz5xGlbgINERPk1yd68EzL2DJ4r2/IW9XZBnsRKmDQyTwIt1oVXc9lHtEI?=
 =?us-ascii?Q?ELQgayfj1BvEufb+QFJ2KW63tpxMHwRDnFPcmECtd07VM8oh5IsP5Dt4vzRq?=
 =?us-ascii?Q?ObEaAlLrwHaOLc0+tqQzYHR+oX//y8HZOKOI4K040KHkjW7mg9+6sDQXlv6J?=
 =?us-ascii?Q?dLN+xnuPzhE+jT5OxQNhSw17R+9LxJa/0jpaLiik5I3gX8w5QMhROrNXTXE/?=
 =?us-ascii?Q?rypZPoiAZSiezt6sYjeEhlrvvztWosowhTFXnUlXudURatDpn2wrKj6snrUD?=
 =?us-ascii?Q?KSiKVx54AvaDqaEPU3jgso7XBBDLTZ3Yav2JlrbnjyNImNjolnk0+lUNrcBi?=
 =?us-ascii?Q?IBuwJLzOIx55Vp4emsv897q5P5BT1nCxCre4tWZOZMj0vDJ+UyA3JJm9mRXQ?=
 =?us-ascii?Q?3WoKKMfknxfI9j0/EhGqhkBp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c22e7a-9fd5-4c88-a7f9-08d917a7f8a2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:24.9346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWhmAOaUhCJknQu85atLN1A0v3AWFoBIMmCJVfVqU7Fq5ZiymxHm5hvBolBzZ+1vMKo8sldHEsyOzSXdyyFqjnFkYB3vRO8TDiZ0Rw/m16Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.14.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To be used for reopen in future commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 9ad725d205..75565ce4d4 100644
--- a/block.c
+++ b/block.c
@@ -4770,16 +4770,14 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
     .clean = g_free,
 };
 
-/*
- * A function to remove backing-chain child of @bs if exists: cow child for
- * format nodes (always .backing) and filter child for filters (may be .file or
- * .backing)
- */
-static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
-                                            Transaction *tran)
+/* A function to remove backing or file child of @bs */
+static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
+                                              BdrvChild *child,
+                                              Transaction *tran)
 {
     BdrvRemoveFilterOrCowChild *s;
-    BdrvChild *child = bdrv_filter_or_cow_child(bs);
+
+    assert(child == bs->backing || child == bs->file);
 
     if (!child) {
         return;
@@ -4804,6 +4802,17 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 }
 
+/*
+ * A function to remove backing-chain child of @bs if exists: cow child for
+ * format nodes (always .backing) and filter child for filters (may be .file or
+ * .backing)
+ */
+static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
+                                            Transaction *tran)
+{
+    bdrv_remove_file_or_backing_child(bs, bdrv_filter_or_cow_child(bs), tran);
+}
+
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
-- 
2.29.2


