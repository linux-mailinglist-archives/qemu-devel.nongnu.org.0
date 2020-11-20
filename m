Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48B2BB01D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:21:14 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg99t-0000yU-3W
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95Y-0003bz-Ml; Fri, 20 Nov 2020 11:16:44 -0500
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:54753 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95W-0004qy-UZ; Fri, 20 Nov 2020 11:16:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hukFMIgD5Gz0DrqHk6zQ3astFYEwxNt6tT33PTVQi5QwjYlf7OSa0PtosElCeAiZn71h+GIJKKTI8OJayPfFvDdhxEx71wBHS/b4JzP1xKLyHxfPFBp4Oo8jGMxz9vfPxK8KKLtvyR/RBXddWn3e1ZjQShfIRZqc9ywNuDHjK9F+dopExyuCrWa3O3qFnG2SOWFpv8zfmMApmj3K0PyeYuieM0JQre9fMEpMLsavhsQYEZRGLgDKG4d9OG5Sa6DF7lfiH4J1Wb/NfsN51mUXZs5uoUnWMQr4/xbP2aMFE1LzsUDuOA1Av3phq3JQYy7/Hn0DdKQH/nmKmA9QSiCzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMSncCLGZq4UmQ1TMkXjMLfz5K9FOnmYOIqXtxACM54=;
 b=hX3+PMU8ZRQCbo/6y/wrFEeNXN64paLNAHY7WtsfTl5w8ylyXSD99sGUIzxBYgK8OhBQLqYiWhYwfiRIJTbY1K+iVqzbhczr86gOsAwCStXvc70tyKw0beDyRRi+KOJA9T4KsXqBXByZihTn5NWW0U7NMnCMPyMVoUxtefO17aalk8MAKKsp+Y8N1pifdWsJ3fT7F/IN6NFvPeCeylwi3war35dq61O1IeCsu3rVnhW1dzFlPmKURB09BkQITLy54IaV+WMD1Ske92sEALS1SJHdOhHgZhVwuMlqgMEnmBEf4irsK4SGBdqnL2CHnplq5XV2wMxb4a+nCxXn/eCPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMSncCLGZq4UmQ1TMkXjMLfz5K9FOnmYOIqXtxACM54=;
 b=VHmwC2njkSFyrm6MEIiVGFjxr7SP/OySg574VFHNmnh7TplpOVIJnODCfo3tKytuaDzkw6SyyG8u6pednyeBt4iSxP4nAeibUCjlXZHqABS8QMeb3KqNva+IjkJsaVMPgdR/zNyq1TNDE71dHaanRO6xJ2PiZX27cTmpXOD8tSs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Fri, 20 Nov
 2020 16:16:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:16:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH 1/5] abort-on-set-to-true
Date: Fri, 20 Nov 2020 19:16:18 +0300
Message-Id: <20201120161622.1537-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201120161622.1537-1-vsementsov@virtuozzo.com>
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.108) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 16:16:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd5001b1-17b4-4f34-912a-08d88d6fa7e0
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53332997802C903E06B5F0F4C1FF0@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +WQWeycv62dt7DdDug7qtg3PZymlJrt726UPVmxAX/7v9brACIjX4qjg1FTQvZvsu2OnhU/4GeoMdXiNo6dyy4q6N1P4x1TYfvyCv4WEfX3Rb7LJMpYuZApn4hVhSKtDjipy+lSrcaP/1B54gwknWb5Yy+07Dv1F6t5ME8AqxEpuwZjL556oPb85m5fJK/iylOqzx9l0xDj5Boh2sbQJxxmXe4A5kIXvIV1Hv8jCxLLynH4rWPuQa3Hi3JybYnnqVgVYLFCOr4EqeMIgxotQOoXqBiKLOh6PLoAOPOIwKO8uYG4Ckp2P+gJ0hGx/JDfp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(6512007)(1076003)(2616005)(7416002)(6916009)(66556008)(2906002)(478600001)(83380400001)(52116002)(66476007)(66946007)(86362001)(26005)(5660300002)(316002)(6666004)(956004)(6506007)(36756003)(16526019)(6486002)(8936002)(186003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: sebbPo+1m1K/qY6zIFoPb/O1ubfOWVHz/ECpwP3hAN4ZjO3PA+ShsTWPghRlYUYjxx1T0lHPsNoGUSWA5JFFqAK8jHqSLNx1PLmML3ebDbN3p5JqYkwMti2DbDVL3MBjlYFJlSgN4R++KM4AbH8glXzs4Id/pGp8JMJuvOuBuRGmhliv5UDc2rnPmZx17zYQWIWtFpoQBZCkw4uPm5Rg36ONbGblK3ga0RZVTvX+8pm/ckLn/mZXzr9FDaydd1dJZhXdvNWLRoE/+2HWfH8sJJdxNHQR0ckewIyHRYq1wEqaTid8xy4M8isOilNYW3ViH8Te0g38jUpYrM25blJ/iIcPprstzU38T+BTIeEmfhEzUBkxM5VFUAjQKpNxlCeWOygcRO1eb+DmzEQ4732aOFB/cHFJCzLUl3Mvy1CTYRKVmTR6rIhFajU+UBTYpinjZw9VP+MvzvQCBMHYwo9wnBdv8Jzffu0EOKavvUEGhU2Ke4qpLSNwiV8BvoYfaaEyuhcwGAW2uROGjfuAY8Zl4nIKg2p/WjHN4kQ7mFN0hL2GjHEE/NqkyXIXZTZmFEItiUFcqmusEKCBMWeGFKe2gNaECMjHLkd887MLnd7L17ffVaEqXIkmhoRvi7OmF/8fItVbwsMByJ+xRKggArqYDA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5001b1-17b4-4f34-912a-08d88d6fa7e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:16:37.3549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsTCRoQ9DqVxzF5hGjn9aIRB7wIKBGUKe1R+zzsOAEwSzt/sTKZ3MhfaKu4qzbll/7OWt2adaKtcaaefc9Lf4mKd8K3JJTMY/5WC073TZiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.22.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index f1cedac362..5e8dd98cec 100644
--- a/block.c
+++ b/block.c
@@ -84,6 +84,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
+bool abort_on_set_to_true = false;
+
 #ifdef _WIN32
 static int is_windows_drive_prefix(const char *filename)
 {
@@ -2002,6 +2004,9 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         added_perms = cumulative_perms & ~current_perms;
         removed_shared_perms = current_shared & ~cumulative_shared_perms;
 
+        if ((added_perms || removed_shared_perms) && tighten_restrictions == &abort_on_set_to_true) {
+            abort();
+        }
         *tighten_restrictions = added_perms || removed_shared_perms;
     }
 
@@ -2066,12 +2071,17 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
-                                    tighten_restrictions ? &child_tighten_restr
-                                                         : NULL,
-                                    errp);
-        if (tighten_restrictions) {
-            *tighten_restrictions |= child_tighten_restr;
+        if (tighten_restrictions == &abort_on_set_to_true) {
+            ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
+                                        &abort_on_set_to_true, errp);
+        } else {
+            ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
+                                        tighten_restrictions ? &child_tighten_restr
+                                                             : NULL,
+                                        errp);
+            if (tighten_restrictions) {
+                *tighten_restrictions |= child_tighten_restr;
+            }
         }
         if (ret < 0) {
             return ret;
@@ -2227,6 +2237,9 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
             char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
 
             if (tighten_restrictions) {
+                if (tighten_restrictions == &abort_on_set_to_true) {
+                    abort();
+                }
                 *tighten_restrictions = true;
             }
 
@@ -2243,6 +2256,9 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
             char *perm_names = bdrv_perm_names(c->perm & ~new_shared_perm);
 
             if (tighten_restrictions) {
+                if (tighten_restrictions == &abort_on_set_to_true) {
+                    abort();
+                }
                 *tighten_restrictions = true;
             }
 
@@ -2639,13 +2655,13 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
         /* Update permissions for old node. This is guaranteed to succeed
          * because we're just taking a parent away, so we're loosening
          * restrictions. */
-        bool tighten_restrictions;
         int ret;
 
+        assert(abort_on_set_to_true == false);
         bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
         ret = bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
-                              &tighten_restrictions, NULL);
-        assert(tighten_restrictions == false);
+                              &abort_on_set_to_true, NULL);
+        assert(abort_on_set_to_true == false);
         if (ret < 0) {
             /* We only tried to loosen restrictions, so errors are not fatal */
             bdrv_abort_perm_update(old_bs);
-- 
2.21.3


