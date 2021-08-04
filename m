Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6643DFE6B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:53:03 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDaA-00025Y-B2
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMg-0004vE-6q; Wed, 04 Aug 2021 05:39:06 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMe-00062H-Ac; Wed, 04 Aug 2021 05:39:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9QQdjujgSEBiK1qXcp5M0hw8JpJ5pdf8FUG3p/IW5xKjAAhLyw/ZokhKQwQLohrz90Hl+fP5pWT2528IkUC3ZAdroSCPhs5FKQUX3S5RCpqLDMus1wARvEEL3l+zCZEx17gBGZYQeZHmDkV6Psefu8CBA6i+ELHU5B5BOZEuNpwK/qCYFpvEpi0vdylccOqYOk+dt2rD0VRHTY2mhVq6k6zn0cozFtFOujVQcOI3aSJoiteXW4SHPERf3oJySoZiTdoZFskFdCYl+zi98Op1NtHEkSwjlEY0KgU7vUYq8u1yGL5luXAlhISWg6JUgB+vnTqXxE8mnQqir6cCuKNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=m8KDg9Tvnte5ClZJY3VBvZyd839ZHwFlsADkh1HnjpuVqAHYCj3ClvzsLkJ0z/pritWtGUfciKTC3jK36V9ZpeSVc2fyy6HTdNjxzl/8zzC23esCulJ6BwnHKboftZy4aLn8Prm6n2LlCnBR/9xgoaNHFLEf27bUL+rg0nHZTMowt64Nk40K3uX3wy8OVK7kx9iXIinSmgDIw/ymWC0Kqe80z++WGgf+IsNOKEmwmToMZWEcM4o/QeHaNgSl0Pw48m93rGXyAcM9RGRuJiTChmhTQ8WQKD+9lepH3V0HY1UyQ65DcqUcXsRP398Af52KyfgDj+ijNv8nuGCO3JixFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=Pdyd8rb+Hc39oVNYylVR99Y7GCy8oyb+qXVXr2U2v98tBJNxYFfiLNA2/WthD9rGRuTCXnxeQQKIlZf5VCV8F3WlpvfDK/ujTe6brMzPBb7qyoa8F2+7re91Yg5wW347V2SZytaFYycnhrItUksyh4gpF9JdyQE6yUETjsqbrIA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 15/33] block/copy-before-write: cbw_init(): rename variables
Date: Wed,  4 Aug 2021 12:37:55 +0300
Message-Id: <20210804093813.20688-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc2951b-ba99-47a9-9caa-08d9572baeac
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50320002D75695AEE77AC202C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 88EBSafIS2rA5KUYTZEjMeQbJ83V+W7uqiK+N2njRjmIcIPmP8Z44+0g7BKeDrj/iwPBBbJsYRZpKJ6jlaB7dTcW0VnKNZwEwE25Ehfv+S6mwvkSbGfdyNAKd8cVXWaP2vICasVPmHVhgPqNt1JXLb/NMl4YCtorglh0QffNL1TSqxHTrOpLFw+phv4cTIN1e6uQ7hIygfNCwR0Dd3R/eQuOh+T7lPQzAzqW56Roo6oJmDZWmeJJI0W7Mt7eJ7X2JH9lns4HtwMXfqya0uAgnkBzh1KlldmQ2X7ofjMp5ve59FioFCkAzNdR2g4cELDZMN7AP9CkHx7lhCd9cGOEYXCAjKlP+llEHtoAMyYZm1nMhrkOAM0R/3dlJ69SRR+JTKiRXVa5JxJlJr5FPDtQ+/gYdxCGGNRpur2hW5TY8cB5W4U8CfTHCpty6DfJhC4xuALWWGSw6/f6Rfd3SnrIFSdzaGMnXq0tmj5+RPts7U8J7GrWKGgup9tMfX0NUdV98D4MpyLWCz0vu0kefYZyD2sBxPwe8KDurrwzCx04r/XmTgQMbW2Dv19e1/Yw8sw991cItYrm+ehm0bCxoLqpKmq1FZonPDxVVyCDHXX/AihCkIwuEuDE6g+ho+vpaG2IcXIVZYDTh8TT2dvw1BVZwT1rS5JlRy+fPWfA0OTdwGYXQdi6rvJhyxCYzNO+TZTPADTZWyVsJj2XHeoRUyWYQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N1PRSiPxVlKiOvFP9DrjcOhJpV3YIM/RpqxHUJd8kCVRLjGa5HJ9YqC4yKc3?=
 =?us-ascii?Q?jZlDZnA9GRTludAf9gLBoNbC14zsj7ancPGQqEYLufrCnFMajFDGDMU1RjIf?=
 =?us-ascii?Q?IkoBJJsMy0PlMdCu0xNB3DHbQQksa6nWNryYfXSFA6UE7iHqyBbjYMkSq+dz?=
 =?us-ascii?Q?TL7l/ptnHlG4nLmoMRAR0QJaS9p9w7dbcFJGVAVbszi1q4BZjod+xJIHquYM?=
 =?us-ascii?Q?M1m7iOo//SawRJpUvNbYL7gNuW8sN9YALcy42LP4JXfvrJAr/akTn2ugP/8C?=
 =?us-ascii?Q?8IG44LlexwU6TjKYkbsFdX5pi6q3stkRBKS85uBHR0UeFxfdqHjXBbnNKaFo?=
 =?us-ascii?Q?4gO1o61TXllvw7dVmrX/hs4oq4UJCa3CVjGoylaYaQeRzQnLMmQck6LSi+XW?=
 =?us-ascii?Q?z5FypK8+1e4zelH/SPhRED93Syl6nzhpZIE+lbAWhWrkZsRlZVC8Kn4zH1+L?=
 =?us-ascii?Q?8ldfGJ1OMhbrJKBqfvOqTquWA9U6dlWmL8rtRU/sk+SVj7+1avAv83tbX/W9?=
 =?us-ascii?Q?J5RP3kvVKpreRPKvOrQabzGuTAE8UUsK5STmiWB92euoaaVCLopYhM2CCrUl?=
 =?us-ascii?Q?fkG+IdicVBAeknIa20P4p5hoqpk1KOF1k7nN4NNAObgkUOYyjHr7W7/V1xa1?=
 =?us-ascii?Q?wFbbhLlVMwQLy0mogBvFKZQZ8xf2CSgwt6JvHRBjRkyCTFeLoeGUsyR62L99?=
 =?us-ascii?Q?Jo+/PLqqd+ZSxrA1yny8nTVYBm2hNBWOfCm5STuVSvKYZT9Auq1JCh39R6tu?=
 =?us-ascii?Q?YeWcgwdEdAJKALhciNwCdhbzCXnM4szy7TW9/2PqHF8nSsgZx91B3c4s7lB1?=
 =?us-ascii?Q?XpY3+Ri0zKnyQ8EgzfhoqIW5hFGEAjCjbcUcZezid2NpjzneWpKTT5VovRZq?=
 =?us-ascii?Q?LraYSzjmAda8qW5VD7j8KMrc/H8U7eT/hR2yZyUEt00FOV0V0VbaIfIjwdWt?=
 =?us-ascii?Q?bpARCasKReVcsxpZla/2WN9xlApp8Hz5mLKKzLtwhKzL72rttJvikN6tbqdE?=
 =?us-ascii?Q?GTuU1/4K/NbSM5zuKrHbqyoLjAkNwicD0gHEf1MDQB8AFUmuOn+4qnGxATQW?=
 =?us-ascii?Q?iE8s4YNBgF7QiKiCEtb0Azu1J4WHm/b85rKTCRax39cenbWqy5LQvfKkrpxq?=
 =?us-ascii?Q?Xc1TcPOAy1fv5FI8OCZ05nfMvhI5paGCCwYDE21mDZGgNJuaGJlrbDdMeSAk?=
 =?us-ascii?Q?zNEzipk/z9MkWvlUhZ/tMQZuMRLcl5OW9gxduCiIkVWsmA3b9sPOz/fAr8Pw?=
 =?us-ascii?Q?H3g2pHVgx4d4MSuigHPNHZOlrPVgbTs0RQW7Tm1pkXttvinpTWeWfkI0vlKl?=
 =?us-ascii?Q?dwZ2NwrinjRzZTwbhXVwgJ8f?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc2951b-ba99-47a9-9caa-08d9572baeac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:57.6947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NShp4VkABaee2d2aCdkFBKRsLr27FWsbaisXwhwIFAfn82KR5zWJgZtqGHzxqQHcAdenaxzgejgIRAIQ1eWQUO9rwpNpsXUtHpAaqx+2Wl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

One more step closer to real .bdrv_open() handler: use more usual names
for bs being initialized and its state.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a4fee645fd..d7f1833efa 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,38 +144,37 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
                     BlockDriverState *target, bool compress, Error **errp)
 {
-    BDRVCopyBeforeWriteState *state = top->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->total_sectors = source->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              source->supported_zero_flags);
 
     bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
+    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
+                                  BDRV_CHILD_DATA, errp);
+    if (!s->target) {
         error_prepend(errp, "Cannot attach target child: ");
         return -EINVAL;
     }
 
     bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
+    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
+                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                 errp);
+    if (!bs->file) {
         error_prepend(errp, "Cannot attach file child: ");
         return -EINVAL;
     }
 
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
+    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
     }
-- 
2.29.2


