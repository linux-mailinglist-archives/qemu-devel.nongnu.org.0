Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0E467828
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:24:18 +0100 (CET)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8Xx-0002sI-3T
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:24:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8If-00026U-3R; Fri, 03 Dec 2021 08:08:29 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:61828 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Id-00071J-8d; Fri, 03 Dec 2021 08:08:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2FVX9X9MnQsFSBGIfvROVJqxDTMrAsldX4L2pVi/Xz7s9lgecKUV8dTSfCE5fSfuDxwfPyX778Tmc5/cBZh6A8gM4Ij25CgufnxIos5y8RecNGFKGlmdxEHuqPWAAYPXoXeQHVbAikoP8KDhWSsEmwNhXhnX1wgNiLpngAzDSxeXB3BM7mMQ4JqcBm/OmqL0EaLwy/2sCO7sxsWc6/YFibLSS9RMX8hd7DYHxvfnC06GTuje8akoPFJYnbz9OoJbpxdPm2olcv1S6g4bsE6mlaGAzfhuxkXxg1zvcakT2hrdVfhswKULlaa483nP5AdrQX8YQ2w1BgcsGDjkMB58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yX/y5RRgTxN3+SaetWQ1fM1b+d8og1FNDEBJvtslr14=;
 b=axIIsOK6CKzatrFUmTi/xfJxnobytIY9qqWG5vKm8XcaLCrYH4bJEkWeK1Qn5osi/22H9QkM4FUrH8/pu1+krAm/phGp+oOxBCsk5iaPykSGqBYm784JnhxiSExTPDdswl4rCny0fXCyN4mMe188yE6d1ND7+zao4IgIGP04oteG+wuSbZ40TYNzbI9pCezNkYdJUhW+zRLPPFIiU62jvfhnq1gT3bwRBkOphrHjM8bUNVTIijQee0bTGotvQwDNkGyKwCOr77jbCXyMaU/zxk/FkZ52KBmSefd29d8djaQ+VLgp0dEslUAlDGfTOEOC4ziGrPIOrbf8sr+oTS7Gbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yX/y5RRgTxN3+SaetWQ1fM1b+d8og1FNDEBJvtslr14=;
 b=wsgEzkGaWJpxT02msb9IsUcvb2BokNuEP2+wa33wHUIc+GQ69oC7canfFL4FGTugfkYLFQ6n4AhJYTIG8HNzrbo0+dvUM5y+hHiRMJSI5Rmzs1KeGt75m5ddeJcytuJcC47TSj/e+B0rtRF1l2S/e/P6hbPWXl99c715TV7jp6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 11/19] iotests/common.rc: introduce _qcow2_dump_header
 helper
Date: Fri,  3 Dec 2021 14:07:29 +0100
Message-Id: <20211203130737.2924594-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2c4e6ee-a8f7-4c2e-d9bf-08d9b65df72c
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4515DD49FCBB297B6035F7AAC16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4XvP798RLipb+57h3oXF8QUzGOZ5JzSjPiyZLKuVIwhLXfUQYVeHwLwVtN8lyDCBJEuH4ZzwI+cGDvJj3nOv5oiZnqJFvcXl4OsVA6EZ6nsnus6M2Hy3uHF3+tGUwUVlLcuWE7FBcT3wIaab6OTsKd3ylb+OZ5ZVmIEIVHQre4WuG4xPnLT3Z+rq7R+FQ4RwKxWlelpfeXUO4c8R536CuDFwp3GGFs1hAEKfDLCSL3NXZqFf+JjCQbW8Y2HQUgIrlOBiFEvWIfoX37uORWBo9fXoUkkpWe/n4q9miM6lpLifi7gGfCpjOSFVsyJV2qoEQXVZrcJ1vjZLD+dhpMVDMFW7c3oqwDrNoFJ+2W/YdsffOqRFm1KkWWNja8w/iKWHbmiOL877ZpaAI2TQdcj1gdWOWJaMFEILL2dsqLHkZEJdKjN+E0lmxvG49MFWgMdRB1DHoiGKFTjYpdYU3T6VPe25JV2DcO6afKGpIJ6luR4K87K411D7jg3LdXG5PFwbhVjz171aibcdE4dE8jbExP15+PH+5FJhrbK4sCni3m/loTr+33FtB+dD5yCj73OjJocvhFxSuA+ckOueSqIbBZ4XCeEmmkc9PvlK1DHFYnkQEZYnrbRy4ki4ETvz4sWwOP4BIIZqj4eShgy+BIxTNtyhouWKTuxiGPbSKZg/gzfKBVTCaYCEQeFuVC4p3T/lFwLevO67BK7hq/DlfWcEsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(4744005)(66476007)(8936002)(66946007)(66556008)(6666004)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VI1mhVpxD/Sr3FEPaNSigk7I/FmSNRlhksyz/DZbHfP+GFGaQs67ULoLWTJ2?=
 =?us-ascii?Q?Pmp4A7Fq0tRSgVYTPg6mrgak/Bg1u+H+5ZzT5orJVIItJia4KERUV7jvA9Hu?=
 =?us-ascii?Q?XIwZGlYgPBLCFH1HeKOR1WvRZrJR/44NL0XIA0zJWYCiqmUgHoYZ9MZuUUzc?=
 =?us-ascii?Q?lPwCETvNpeOveNB6FvRxg9Rcds06dNl75ra6MI79w8TQYsAi+CuQ7cMxRDYB?=
 =?us-ascii?Q?OSA9SPafByhlAQuyoBlG7+m/QON3bzTxqGkhQqfZA5YzoGA8KZ4OXByZ/Qsl?=
 =?us-ascii?Q?lusq8gzKXCCQgC2rdZ2EEZyHwn8HcFnIbry/LHWC9r3e7PkKvKioj/g7wXiS?=
 =?us-ascii?Q?IGzeBHRYDUbP+gg/LATbmJDOsgu7BfIAjsbeBma9zKM36F4fCggB7k3VnD4/?=
 =?us-ascii?Q?F3jPHleHWAJK5cG7d/Lixp8VO68kdhIA3nzcYZ/n0kYleEyQyFB7etktC/k7?=
 =?us-ascii?Q?0IPiQNGtANH1YwNkOqNdhDeT09GugdzmMtFtKWnBZ4LzVx9icclmTzG6O2Bs?=
 =?us-ascii?Q?trfWF8y8vhjJ7M8z8xz9UkWHmS/rOmTnWeJ6kJ5VEBIF+l647bl/n1Tj8H+T?=
 =?us-ascii?Q?LOXeCCFzI3xmJu7zEAbRrA1CKvktk2VDRdjCm88bmogCAmX5JDeYyMJ73odf?=
 =?us-ascii?Q?dZ4H0hY62caCs8f+rO5AnNzB5L+B/84WaBNlIHaDHGzJ0Ag4y7kGQfn773BP?=
 =?us-ascii?Q?0hgQr1UBuTv8fU/KWI3XIKcZjL1QCPQ3zdeVNQKxtZKG9yptNGcrpgc2Zgrb?=
 =?us-ascii?Q?qth/tfyjLyWWS77RCVFUrceHEvXex6Kl/IIYRcKug4TVNp+ImO/NcXlOPvYZ?=
 =?us-ascii?Q?2z42lMssLshhKzsSGO1YDa3/bIPZxhZb3KxvJ2yy3lC11m32xNtzAAf5aVC/?=
 =?us-ascii?Q?kn9K8+04WLs9t07Dt0LglBqIujblSn2yhH7m9VQwu9dNqsaEA75X8Rur6zai?=
 =?us-ascii?Q?Mc5NN85BetqwX44f348qG8Ppe2yIJ7FgA5qm8/iUpTRrLxsOXtGlmP+1HIbh?=
 =?us-ascii?Q?PlQn4QdKGcU+so7cqSP7lI2rJy1RLc+fFlwo9ZKK7TTRQeYr4KxAxQauC31f?=
 =?us-ascii?Q?i4gPryKFblfXu8FB2kEAvFs71E8idloHeb0PtH+lFbG5GaWoJ1c1O2nPF1lU?=
 =?us-ascii?Q?vh5zEsHXpSwQrnzfzbAqh7S/5nJqZ4eL+hahiFRvGCXVeujNzbrZalUI5y6V?=
 =?us-ascii?Q?l3p52mufnaVmgEVz3s5GU5wBbOwwqZXjY57ZmPQLEtYwixOoHxCw0wH2ZVIt?=
 =?us-ascii?Q?rqx4AKmNG0EO1ijMSeLj5NMT/nabC6UQwIP14yf60YiTjXNn2yWzx5Ax3g/F?=
 =?us-ascii?Q?DOvFVUPo+/+PnZjSmt8tU9RqvvJSqh3+OCl+HuHpEg5rzc6NKpF/pQD+zuWi?=
 =?us-ascii?Q?znnIjFabw+dGkE+frChv1enZ3lhzC6xCjDNmGVHoHbvEnV6Pz/xKApdNQVE9?=
 =?us-ascii?Q?+sMooxwMK/zkvz1qYLNZ5KF6LX4g+wDRscQgMd5ZfKAXMlHWg41IVNVeHO0f?=
 =?us-ascii?Q?ON8/FaSaK+yxquVPwJwvvTVkUfnLSubDq9rhJEaJQ7Rxixovm7en+Ezlg7Zx?=
 =?us-ascii?Q?7BNJ7iq6XlEgpBe2zp+c10UnfITLPDmSlCqRwSaQbOBVtXrk0UQZbs/ecnCb?=
 =?us-ascii?Q?eaV5LDDZ5fIBVcostwTDzrtM2wi6D94FSfyo6TYJEf8JDBTT5xwevVS8bis/?=
 =?us-ascii?Q?Jq/nNQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c4e6ee-a8f7-4c2e-d9bf-08d9b65df72c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:14.6523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L1bViuCWR2vNV+6KwippdPq0CqS/WzIw1S8PfLYbde5K+og2IlpYdIXKmc5rsT0P8I/9+qosG7B3SNZBu4MJ7n2nwc5iyfzKa+QZnQUorI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

We'll use it in tests instead of explicit qcow2.py. Then we are going
to add some filtering in _qcow2_dump_header.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.rc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index d8582454de..5dea310ea0 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -996,5 +996,15 @@ _require_one_device_of()
     _notrun "$* not available"
 }
 
+_qcow2_dump_header()
+{
+    img="$1"
+    if [ -z "$img" ]; then
+        img="$TEST_IMG"
+    fi
+
+    $PYTHON qcow2.py "$img" dump-header
+}
+
 # make sure this script returns success
 true
-- 
2.31.1


