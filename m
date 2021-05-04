Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B02B372DE1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:17:36 +0200 (CEST)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxjr-0007Lm-Li
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldxa2-0007CP-Fa; Tue, 04 May 2021 12:07:26 -0400
Received: from mail-eopbgr60117.outbound.protection.outlook.com
 ([40.107.6.117]:64334 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldxZs-0002Jb-H2; Tue, 04 May 2021 12:07:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anvplncrehBVRraOdMw/6T/MR+qtJKRL3iLYJJdfciSzB8xzoVOeTi7oUidXduzKhFanIjGi2znd8UIlZfzZZtah8GNxRilHd+N5l97/u+AEqsKGFFAf/hYbQgpEWqkrD4L64+xTG7AF5kkODGlH8sMg8Cv6BXG7nteFwEkQ9A+y7Q8vFHYP2Smi4tVNVJdUskY3Y6UStwn0fnyp93D4yelxIGARbUKGlt072MR3+fmINeZdSh7qHr6t6HZfN2Wi9iEYkm5BgiQ99jtubXgcnwDwBbKk9npfg1+Nuh/CaXHJtCyVutbQDERT2mvs3BoG18AcsOFK5+NV6TVpMtGJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b+c91ZRcbrRQ58ZvO7x4MISPzob4dvcq7I2hfLvhdA=;
 b=aH42Y2QfXfq3ynLFi/WlyqGuQwsQQ6CyeKfjMiuFm5tFVHvWdoovYG4+7jr+XFyYfZdECuivfQg1Q1VdVGDfqYohicpoDEd0bivKBUJR3/P9VEhPdHznQae9LZzkSplrKwguPxUAswsgjKZslyvIkLbun5blRcfdJGtdEyFM94/Cx26zMgAfoJfH74PFtQX1CaefJMPb+Gha9FoZRyJYZZnYndrNBQlce6gD7Ihh7yhECnOd6P9k+mCIMeLNc5UHvkpr3GiIXRkUn65FOo3Jd3B9+1SGcxDI5QrYLRHlbw1ekB+1iIBYPfYraFZ1x5iQ1709ooGiBy8qkawXher18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b+c91ZRcbrRQ58ZvO7x4MISPzob4dvcq7I2hfLvhdA=;
 b=AFBkCJa+72+cipzynkYgW3ywynm0G/RGxpIT8168Nh/xnU6ZhZe18UckoP6WO7PtkrneqYbyUlDEuol+LjZGmn+86xbI+warWUy5UtXDYs3XtrKCjwg7LLDBcf+6kfzA9ZH1gfyTu0FqFDJwWC/GH5UV/Jss6mDU9VPLH53hqYk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4022.eurprd08.prod.outlook.com (2603:10a6:20b:b0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Tue, 4 May
 2021 16:07:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 16:07:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH] qcow2: set bdi->is_dirty
Date: Tue,  4 May 2021 19:06:56 +0300
Message-Id: <20210504160656.462836-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0102CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0102CA0020.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Tue, 4 May 2021 16:07:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85b5beb2-80d4-4029-bc16-08d90f16ae26
X-MS-TrafficTypeDiagnostic: AM6PR08MB4022:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40220264DAEA0931CAC32E1DC15A9@AM6PR08MB4022.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:46;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +PZxzp6qNe06UYhYJmhOVaDKmZf3qbZDKCt2c48C8YmCRbORjW1apRHmHX+GCUGc3s4A82r176aCWdWoukvsaigQWaPsCi1CFDtNerBFyGxO6ZT7zEK4aT1De/uZGJt+FbzICoDD0TeEeBWYezFaLsvteZEeoy/mrUfii+KdINuHw7z0y8COtyAQ3s9nuUiFVvDYfLby7glg59GeRE7P6JCsuSN412oTGdtJ1XKRSso2YipWiuvvEaPYp1V2/+0CYSrDf6AON6gTAxGuoOnGFoRx8AbAUhMukwyRyFWBbnrNHxsgrPN+JptnVd7Fxz3DtQs1bNe7wlYFaT8riGPcbsWn1a5k420jiL+CvfQIsnNVwkYDj43ui0NBBRtvRB38tcuI3jFj40rcSZh/ZWgH1qQeTuzQQVy389SesGicigiVO51L/lD4s1K6WUA6PuCf7OQHbxizz/YhB9CuZ38MfY6DcDAX+jGiSEqcQBmwCWR0E0cW/+uVJYOXRD6u38gBOFn40UGMKC1b/bQqn++zuyeNnlLBDnpDC23aaJe9llpnyUudH2YLLVY034ES16r98oRSj2Khwj1dtAWP6XCT9Gci6+7dbbpNyrkQ0/ln6lmX0J4JewYQ4rpmxMi+o9+poCZr7dYLwASRHDG5gP+vHnHfhYF39tmeZ1GCRlUBjv7+HKqcIDu4MOM2bdcKefYK05yvTKig2S1TPhR1YQQh+X1elmu0MnU0tZVMfFvQzVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(39840400004)(376002)(38100700002)(86362001)(2616005)(26005)(66946007)(186003)(66556008)(66476007)(36756003)(107886003)(6486002)(956004)(8936002)(6666004)(478600001)(6506007)(6916009)(52116002)(38350700002)(83380400001)(8676002)(2906002)(5660300002)(4326008)(316002)(1076003)(16526019)(6512007)(69590400013)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GeakUJ5F5if63ednS3DZuv3Ersl9HRy3p82MS8FnyZbERZ5AWsobY+sSiOw1?=
 =?us-ascii?Q?lqxPEwBOpoEbRJ4EagPfQp7MQET+sw1CrpnG2mmkBr64WiFsUPr6YojMDcAW?=
 =?us-ascii?Q?X+wIF19si5Xv6oZD34sdV96tPLUxbmeIO2T5KBB6lDthZuNxVEenEmJ4Ajtw?=
 =?us-ascii?Q?ufQMRxPCksQIJ84LxFmZuKQEX3SdSkT9ZplobT1YoB1kSIldfCa/ZXHguo0C?=
 =?us-ascii?Q?Z4W3mvM3hMa+u5V+C43d+YtcypOrhJ8LbzMz5Nxjly35lmRjozHfe53SJWyV?=
 =?us-ascii?Q?qCEQqCZO7f9+uQZ0JlZasqf1P2ygoVqUd0okYlNhdAMPvxVg9lQzjT2x8UC5?=
 =?us-ascii?Q?l6lAIofDPaIndL/LAP+39uj0UQqYL5KQu4EDYa/VTMpiXkLpzz2TscZW7/nT?=
 =?us-ascii?Q?/ifdX1VS293HuXNe/4FBnssjDzw5TFHLi6WX6Ky15kNDX0nne8SUwQG4HJaS?=
 =?us-ascii?Q?JjOwbTAxKeDFtoxfH0ks+u2iWFEDTdGL4S6Su61Cm7wNUj4h+hYJjYu+JMGH?=
 =?us-ascii?Q?SNrw0E0C5b9j2l0AR2m8zelHsAXrrtjAHsBVxUfBDfzOhhE12utwqbXHppWQ?=
 =?us-ascii?Q?/JSsNKtHN7OjzxqZB9VEkSN0ZfYw5M0svcrAYQ37uxiyW/ycbY84yicUaJdh?=
 =?us-ascii?Q?9ONRqu/ynxxusqQbKU5wz3vGqIwqxQpo2nnb8NezgVVS60mmlKVgs6ihz2+f?=
 =?us-ascii?Q?4+F43wtm+JG9y19O3z+yswuo2IQrNOCX6PtMIscD3gyAC2gvJkt2F/oSwZul?=
 =?us-ascii?Q?M6EulYWJlqNjgCxWypI9x149mWISpIqrqvyVo91UoOYTBPdKuKzyJbyYbIGh?=
 =?us-ascii?Q?zvycjJhh7LF29unn8tzG71fELMLs8E6RYm6WBJRH2qSThdmdEz+WujXjzGMo?=
 =?us-ascii?Q?nkdYP7nW9Slgb7Rl45RaMXVXov+rGMfNaLwEHjH6J42iSDfbRB2E8LJHyW1h?=
 =?us-ascii?Q?J5T28qmRqLpoa/VVEAgQcxFLhPrioRsaegcwcQ4tQUOpjENEZ8kTb2T4E0Al?=
 =?us-ascii?Q?EFbTQWeOV1oy47LVto65wkxbhY/S5Fnf1ENNMXJZafDYSvl5r3A3eOYZ4Rq7?=
 =?us-ascii?Q?C44kwfctX4x2zgOIM1OoE7n7hiv1GypLAdV8pgTQjDXdrX9K8bZ7MnBUaSCZ?=
 =?us-ascii?Q?q5XTR6w0HmZZbkjLJmGZPJtwfHvtlHqScWDcJI3geIYQR6TGjmc8lLL1Kxhz?=
 =?us-ascii?Q?BDyDrIFk/iTEoa5z4oJDVUvIrTqmhjb4g6q0BChzeQL85vpE4rxu6fVLVSye?=
 =?us-ascii?Q?+YA7hSFrhctXu5dQDyBGf+YI/irKU88M5dxmRB59mp9kkB3l0jThyEbNBPFs?=
 =?us-ascii?Q?BGFUIvFjN8EpRhHhY/z9vSfI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b5beb2-80d4-4029-bc16-08d90f16ae26
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 16:07:13.6869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0VQTeUIZ1vo+TyDMBwedmYUf30LCDPNkfmlk7jVgXEiuPLdYmOpPcFcbH5Q61JqF+erF+U2RmrhLkwcJ/6jldVRFGexdo8VCwtzlEU4ORk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4022
Received-SPF: pass client-ip=40.107.6.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Set bdi->is_dirty, so that qemu-img info could show dirty flag.

After this commit the following check will show '"dirty-flag": true':

./build/qemu-img create -f qcow2 -o lazy_refcounts=on x 1M
./build/qemu-io x
qemu-io> write 0 1M

 After "write" command success, kill the qemu-io process:

kill -9 <qemu-io pid>

./build/qemu-img info --output=json x

This will show '"dirty-flag": true' among other things. (before this
commit it shows '"dirty-flag": false')

Note, that qcow2's dirty-bit is not a "dirty bit for the image". It
only protects qcow2 lazy refcounts feature. So, there are a lot of
conditions when qcow2 session may be not closed correctly, but bit is
0. Still, when bit is set, the last session is definitely not finished
correctly and it's better to report it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 9727ae8fe3..39b91ef940 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5089,6 +5089,7 @@ static int qcow2_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     BDRVQcow2State *s = bs->opaque;
     bdi->cluster_size = s->cluster_size;
     bdi->vm_state_offset = qcow2_vm_state_offset(s);
+    bdi->is_dirty = s->incompatible_features & QCOW2_INCOMPAT_DIRTY;
     return 0;
 }
 
-- 
2.29.2


