Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12053CF922
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:49:28 +0200 (CEST)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oFb-0001qs-L5
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5Z-0003D1-Rl; Tue, 20 Jul 2021 07:39:07 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5T-0007CC-Qt; Tue, 20 Jul 2021 07:39:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdUYVjGeYhk17XxMzjCSbhXfKhP1edJ0XyyCxGUvyWqR2n8W1QtLUp/RSuut8PCKw/HW5rAfGBtlIJ4Zqbc3derL7MpCvnYzTigq8n+8KWvOCRQWv2g11QV7Vl4lAtr1PAwPS4SKptVylFV22HY1QldcHR+lBxxT0Exn+tgOADfKQ7GPyxpSEpgY/mZ51Hr+7JWKUEmZhJ6v1Uk2yQD6S01QpirCLrBz2nP4xbQVZcbkrrM+qMlzvO+ldETFr0Q3+z4JEnRadwJRWH94DG5zCeLw1dDzapd5S+iWGq6JUUramTRGmmKH/YyI7FB1oBQF6Pcc0HgRM2qZa7LL9PkeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQFwhf6pGn34NyRC8BfsW0+5E419pGbK/XoBAc/SozM=;
 b=WSrK/H8rPC9ebYSwKUHeBl8AB5TwyAT5IVFI0obbcf4f9UUFZIuIHk7jb+T5K0oGHCKs3b9llM7sSdqVAchAj65skRGTEvsI9ygXDgodVr1MvNsvP87qI8cNwwPss4dI4NH2w73kixUIi0d3sVniAZOb2oHkwg7NOyu/VywYJ4ENMJOllURV3fJYYd7ixvTwllavAlEL/pzuGymhdrS7FiCUN/B0zqas9G+Nu5BJHAf55yiLUueyx4ODbhhTgDTnSjYsGOyaWYtQ8ekv/LUoNiMm7+Q5qoaKnj150RNfbceXIMmwSWa+gylvvL6Rck5dNHwKE/77pqR4mJTxqMzWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQFwhf6pGn34NyRC8BfsW0+5E419pGbK/XoBAc/SozM=;
 b=Hlq4TjuMOVejuFfrWUj92hrLS7p63i7ef9l2+Sao+7Y6IOpLunaeeTwiICoQ5ZoKJ9sSyI6VO+b8/flUAYBTz0ZXbPpoFvTTA0p0WNdb4YzAMTL1Y9mJXEXrwJS/fpwojNPQjuCslh9y31rjKF81BZeLMYP8nl1HvtSqo0fm+Pg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:38:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:38:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 01/17] iotests.py: img_info_log(): rename imgopts argument
Date: Tue, 20 Jul 2021 14:38:16 +0300
Message-Id: <20210720113832.586428-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29840e97-26c4-48da-be7c-08d94b72f24f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119274C59C85DF3360B9222C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gvxYAHlhiJ7KJKPfCGZQxxYc6RKWk5PQjF6tXpYOk2ptwXEwwe27tl+KGfZyXIv6PjQX2+i5dDXsOESm8g+nCRMUmWF/BPergdYZabIbu82aGt/ZTO0bTU3Yd6weOPUk3H/YyXpP8sLFyga+eGJV+ht5drwYenefsuhOwwyQW8YNG+klGIy0GB60YUXBkduud5S/X0YFcBypfl+Iz5NbfIPsQvRE+3Jf7rptnrLXllXY880wv+4kynH5UwbLwTcXN1x2PVd4Or/z1oFgh9R2xur6vCyfjELhbQVo688/SxudEHSQc/981QcapWh4t0f7F3AR2Bb0zfyDCibvb/5H2STFsdtSv/dquSTGgD6ovP0rwFC6jBJ+39zr65HABHfYNOOy97r0r2I7EkANzsu4eKLwR4bzcVxb2RFdD8/vc2lYCV8djumokuW7VIMOw1JaXXlOpF0RBACHTpMERHdgK5wKlyyrvi7c0z0s7yQEVQ1edb1D926SDb9eSZ3oVdVYKE2uXV+xLWBpZAAZuIt0GssZ37Mn8Alp2FXx7fzkjGPK52Pm6jDumkkKJVPb0jGBfiA7QRG9MQ7R3NTGdxgsLA4m2BVKW8OaqRsRGBeP5xcV6Yb+3Mnhc3gz0ISv/LUD5B29KKHjwFzjCP8lQKeNuYztppHkbl4YPSp+j9UXbY9aQmsbm7z+CNCNuILDjcnSZY8DiGfy9mEMiRRBvTz0+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?boPnUWMnBzLdEkB3j2B2VxYCtWjknAgIKzeTbL2ILAG49meIlfj0ivA7QOLv?=
 =?us-ascii?Q?Ty3SWI6k5juMOhYQiH94iJl4Gh0hJseXPoiK7zs/csR2FHpUQIWI+fbdzAIQ?=
 =?us-ascii?Q?WH2N0iY/ZCoAW/KyyfYk0HAR42+6cXf5OHp/kU+rGnCyXWooFAdlO6WXxEeq?=
 =?us-ascii?Q?AN+quixP5MR8y1fooVJh2Z3mRMas+RVNl8MGBhAkILC8BaQSrPPc9c2cYRPW?=
 =?us-ascii?Q?q3BxqSh5R4Wk9ziGsW07Y1Ol2lRQx2YbAv7jvesvqlgKJO01o2SmGVRQ9l6N?=
 =?us-ascii?Q?0HKhy3rwL08VvcDnM1tkhadsdxtvdn+Tdd/N0kGdLsoWEeUvRfUNcgK300i3?=
 =?us-ascii?Q?xGn/SDXSJM318Dfi+XOu8xOlr7As70/azyZP0k4PSiKBSGdoQkNVoHjIEvRI?=
 =?us-ascii?Q?m7UIvNVzeC4ztkNHRjol1Q/Isx1V4NHrrAP9zwZruI4g8M7+qFzoy2Dh8H6I?=
 =?us-ascii?Q?S7aI0rX5EyK4JEYS9whqeTyzLOie+13OC2sCB+fGLldOvQ/CGj7p2ccdsuiM?=
 =?us-ascii?Q?CocqFCI6kO8+BhAIpF2XeUhlQkHJSeAxRplqI6yWJqWlqhfbEat8eoeZxNsU?=
 =?us-ascii?Q?KvS/bVhBEd8h+UZbx5oGRMmYmLxfoQKRxbFnqN43BwHpjls7HAuxB835uO2K?=
 =?us-ascii?Q?G8x7oBbS1wGxavvGxTP9SHL9qUpoViYCGnPKDVQGAEejunoMN+4U2aKHVgnx?=
 =?us-ascii?Q?gjlFNTg8+aErCAg/tSIeVMFlj62ni+FVkiAzqDZzE6N3NKPumqk1InJJhRpG?=
 =?us-ascii?Q?uiACpX4g/EN69mNtLsob4Kl3Jxh9UhSanyCn3u4OdwaGYblJOMNGTW/cB1xd?=
 =?us-ascii?Q?3YKdTIQrRe+VRepyqbTUJDdpwDsLzJqmMJFfa23h2Y1ZNIkkIEEcM0IQ0UxZ?=
 =?us-ascii?Q?Mtx37u6qsSW9wLbDPpCOwIeFhriQriWCwWmQtVt6wu1UPAqIxzsJEjOt8Mmc?=
 =?us-ascii?Q?an+nhXMtN/8w2W6i5dRWo2z0QfOd1q2vkBY96oXM7NnnsWOSllMjEEjDZkN1?=
 =?us-ascii?Q?2y5WLkYIMrNJ0lgbJ6x2eVfshBx8hMJqXljowNkaos/b2hTnzzyMZjyEKdZg?=
 =?us-ascii?Q?BnQoCE0zzZC9e43++STQBqXBUUZgdi/8fcuG4EZ/MtNeOvDd5wlJoRrdfd1E?=
 =?us-ascii?Q?m3+IAC9GEq55CxpdnrbmksV+MN/PS7K7irf0qsWfEr7Ba3776HTr7iJI3Rrj?=
 =?us-ascii?Q?wfB0rVNqLN/HJaaO7yzxrTgwLr1vpiS9p9ZvLMYb4knPY479+m2AjoyROgyR?=
 =?us-ascii?Q?WTb/ynpursK2odSUIhn0hTezITSsnc6DW5x9NrCW2+irjGnvHYP3RH1Z6fTR?=
 =?us-ascii?Q?9i31OWIjJoGA4xC7bCFkygDe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29840e97-26c4-48da-be7c-08d94b72f24f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:38:51.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P62Hp67yU2t6yzcSfTk+sw8HUni+jJKsLIjPTropAgdWFD6o8cVA+3xyKzXh3BekZg+c0xE7tgYTH+CJLUzeb/XLrb2Wy5T7Tfjp4Z4OEuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We are going to support IMGOPTS environment variable like in bash
tests. Corresponding global variable in iotests.py should be called
imgopts. So to not interfere with function argument, rename it in
advance.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/210        | 8 ++++----
 tests/qemu-iotests/iotests.py | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index 5a62ed4dd1..79b4967225 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -62,7 +62,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Successful image creation (with non-default options)
@@ -96,7 +96,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid BlockdevRef
@@ -132,7 +132,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid sizes
@@ -176,4 +176,4 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..0d99dd841f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -187,9 +187,10 @@ def qemu_img_log(*args):
     log(result, filters=[filter_testfiles])
     return result
 
-def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
+def img_info_log(filename, filter_path=None, use_image_opts=False,
+                 extra_args=()):
     args = ['info']
-    if imgopts:
+    if use_image_opts:
         args.append('--image-opts')
     else:
         args += ['-f', imgfmt]
-- 
2.29.2


