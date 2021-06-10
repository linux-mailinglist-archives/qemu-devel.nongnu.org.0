Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0B3A2B1D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:08:10 +0200 (CEST)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJTm-0006mk-01
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRs-0002Aj-K3; Thu, 10 Jun 2021 08:06:13 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:56129 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRp-0004D6-Uc; Thu, 10 Jun 2021 08:06:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3Dujaz1Fn+Vb8bXsNNo4IYl9SAnm1a44CWE2+EcUV3KVnbRw4vtajFvaLgOQHifMFcDagEBRPMnoYopnawl0QYyCe6qDosUSj/C1Bfa+Ky4SZhb8cf+mdP9u51WWoS/bpF/vN9NSyggwaw5EUTva3YCuIidGc7DHyW6huKL7eZI6qYivlh+zho1XVxwSSQwxp5DJCz8TlnCvij94xX4qga0kWi1HTKU4yQHSKiLIYFA70pxdE1UTqitVu5KF4uRRyd3FfSbz4BZEM08ngPUnFrP8B01B7mnxZrSvN6EccOl9WdrjJKMGiimkMWCDxxWz0+Ikurw4NOTULxwauu0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYREjeGL3kjIOGBYj8p+Der8eGbcC1/IqIt4pANG1pU=;
 b=esYdmgCz/JPnp7zpyr8qfhpNdEB5dH/zb8/RIhXyrnH89Mhev0l4T17UIx+jH+wBs3b/YrVzVchGnVLUpHfXybZIV3+SnGr93EVRebqfrU+eKgsSYkwN6wNjnlg9jzS0PxEbBxw+CnBC7wIPGi37nI0t6iMzrdLJfN5bl203JkKE1leq3wXu+Tjfu/lMJcYuvzHV0NWX5AnGlS7Orv/NAVzOczCRKwuKYWfzRhVAfzQ7ZOzd4kemkTxcqzd7GhSWwBQd44vvv7liDYbHiU0sFrORvpdwjmhZLZRDGJw2wa+iS8AbyqeMEHghmN5UZRv1nkGoO5vml8q1brBaYXjJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYREjeGL3kjIOGBYj8p+Der8eGbcC1/IqIt4pANG1pU=;
 b=br3qqdcBcveRF3+QkvLX6cBuXPyrviAGxqyWQQf9gT4FmyUaqtlbNZX4cfPtDSN72asDnSKA4ZVv1rEX4BwV7vcLK6JrSRykSkbhjMhNJQSG+itGeSYd8DSLX5veMomn7CCGgmHVbIiXYe6CoMaKe2XHeueoGsHYXwcE4NNq8ds=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:05:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:05:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 4/9] block: bdrv_reopen_parse_backing(): don't check frozen
 child
Date: Thu, 10 Jun 2021 15:05:32 +0300
Message-Id: <20210610120537.196183-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8eb549f-0913-4ce8-bc27-08d92c081a9a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4277E64644A636BCC14F5312C1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2nHyt16CnZiDOQMk4DlRKYP6unZ8MhrOcGOnjdvaKlXiSu1GbqdbpDTQe98/dIzAx0RKPOiOv8XKvvYGxNyghlbkm1tqPGQRlWllxiv7G18z3Lbug7ftgfb/wLjPKqc+xM4LTjA0GOiGWOnqQuocypcNjSsnPWDap/x8l/RULhu69sHJlmHpZg3dcnbUTsQghBNLaKheBqqfAHv6MYKseeDylheVp8LIpTqtn+YDYFQqMkqJsNms26ZHMzeXSz9ss+yLsaSrTeZ+DAkdifFtQq9hxCnQrjVh3CJ6fhZX1xNWPr7YSYhD8aGcj0v2ibaNy/zpDPrfsvI4B9Z/cFiRygpNS4YgViwzGotN9El4ukf8Sc6c+/ybmDiP8xX2S6t4C6AMEZdd94Q/sQAA3H2exewbAbwj26aWhx4gm2S9d3Jb7KBNaMw52Xu0uEaALsc1OYehdmtu2sRSBal3nCjcCxRD4bPfkjJnPTFguH79M8unI21/BrgUx++8o5YAOLmJt9TmSUAn7Q68q4oVAiwF7jzytNwtMqFS7+UQJcE9iaAGF/Lrvp2t+HhgWrFkx66dzDz0ErKoQLou40wstJJ44sb8i1ZBDJIow5DD0MinP8TqriCKYjNkzuum98Y/tnfiSVC++5wHXCtcjxqiVMb0JqEFm9EAFbd3gQDCBd97iWTLZKAsANaFzHXjQ06bnTCA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bu+JPtFx38Nez356I/Z2gY6I+qmbxYihxuJxpVDkXScTEabEXtGKAzqADSM1?=
 =?us-ascii?Q?okOFt9PkWngGiuHFFGdvuOIfjUT6mzPoy2oNvtdMIouGR9Wnf7e4+/F5jYYA?=
 =?us-ascii?Q?vpXMVKbvmvtB+3zUo2A8IGTMSFmhcMkC9+c0MYSpLQ0YYi4ziF+41YThIMl4?=
 =?us-ascii?Q?PAa8qTCnJv/EzYceB6eYJwTXrvw6vVXq6WP0g9MtR3xo08kM0qoeXLa3ZIqu?=
 =?us-ascii?Q?POord2XWI9QSMzOKX6w3ZXPE7vyz+UjI8bSadpbiTg9dOflZPLA8XxdcJimh?=
 =?us-ascii?Q?TBy7/r/qs0mMeeyIUEZPwMEzsfx7a1fWQM8Z89iSdunUVnJ8g99mtSUo7a/k?=
 =?us-ascii?Q?PBg9g4GA5C+TklecFT1MJV2sEBEX5ByymD1OPTxuGrVYHKEyOyiW16TCMNG+?=
 =?us-ascii?Q?Bn14TqMb9JyVX0zNpGx7BXiPMNW6tWVpz3Y7AeNfZAftYEKdiM2J3DUL0G5I?=
 =?us-ascii?Q?ZgHuQPWH8Zq3HlhIqOhKeud3x4n/2jLMHCxKjdu+P4a/RBqXGK5gpinsTz+v?=
 =?us-ascii?Q?PWdA8NZkHZIzGps+CoEZpFN2ppo84qbYJU3MqEkETKk2q9/EfNpbv4yRUTdr?=
 =?us-ascii?Q?FuOLvMsGQ/XYlKt/H1FimfcKchr4Uijp2j4ybs8hpFm38fvo41M79/F0tWvp?=
 =?us-ascii?Q?x9XMtOtkJ9OFLRtzfuo1LM3vs5c7+IC2+pRtORveAblj2Z5/ptLk7FpEs625?=
 =?us-ascii?Q?ulVYUvEJFN+dk9O02+FmR6dRrIhenuRskbinxi8kRjIS3wQy5Xyoo1qDeY0Z?=
 =?us-ascii?Q?3bI9n3DjHJbkNgB8xEcdllf8iOPUmHefPmdPsZYWRJG2gPPqaR1TUis3Wnw7?=
 =?us-ascii?Q?5MyoOFJuJPKFuyjpzITTqLJm4TXa1JGwbohw2YHigbIRKx3tA995752hjc8l?=
 =?us-ascii?Q?PcxAofHuxmQwLoeXi+0orA4ZcwiEP2vxS3wxDi8K9lrhjei0HQ9v0QqJfcZu?=
 =?us-ascii?Q?e6UN8K93J7eWNIGQSg0NXzoCzk607Hgt9m7czOnY+RVWeF91lPK00hJWe+rw?=
 =?us-ascii?Q?N2toObyLVI7TiTGQ2/RT4dmsQmLyOQxTp9hRvfTe+bpSeEQDKb/e0xO4z7nb?=
 =?us-ascii?Q?FslhbudNgyDkBCAPm3drCyLtlZI09r9TqkSQfRglG/ad4W9nsublRC773Vaa?=
 =?us-ascii?Q?Mf9+2sZJtNLZCuIVcg5j1Vf7mkI/qbfJ0RcO8sRJ4W8i8ZSCue4e136NOcJi?=
 =?us-ascii?Q?IXA5l8tu+DKsvYShjEiiuUE9L41fKSN4W/o9J96KtzwCLMzKIbm4Ml/osM4o?=
 =?us-ascii?Q?T4i+Qaml+R1C9We4SrCCDg4ADdlGTelEXO5mvK3wP2KDVpmyS0GrhIDaDnac?=
 =?us-ascii?Q?JwtbIbOh40I5hvFusHKpWMod?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8eb549f-0913-4ce8-bc27-08d92c081a9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:56.8967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cDDoIWS233KL+fcqv5Pub0N/W8vYuh+vwKIlxim3rALdwJgVelLHA/aR2gTo0g8dik5wCCafZx7khW/guTFzlFj/wf2v9QJ3nmnZ536tKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

bdrv_set_backing_noperm() takes care of it (actual check is in
bdrv_set_file_or_backing_noperm()), so we don't need to check it here.

While being here, improve error message a bit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                | 14 +-------------
 tests/qemu-iotests/245 |  8 ++++----
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 68ac99f2bd..d86e26299e 100644
--- a/block.c
+++ b/block.c
@@ -4308,19 +4308,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
                        "an implicit backing file", bs->node_name);
             return -EPERM;
         }
-        /*
-         * Check if the backing link that we want to replace is frozen.
-         * Note that
-         * bdrv_filter_or_cow_child(overlay_bs) == overlay_bs->backing,
-         * because we know that overlay_bs == bs, and that @bs
-         * either is a filter that uses ->backing or a COW format BDS
-         * with bs->drv->supports_backing == true.
-         */
-        if (bdrv_is_backing_chain_frozen(overlay_bs,
-                                         child_bs(overlay_bs->backing), errp))
-        {
-            return -EPERM;
-        }
+
         reopen_state->replace_backing_bs = true;
         reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
         ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index fc5297e268..c7d671366a 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -878,7 +878,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd1 while the stream job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd0' to 'hd1'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd0' to 'hd1'")
 
         self.vm.run_job('stream0', auto_finalize = False, auto_dismiss = True)
 
@@ -910,7 +910,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
         self.reopen(opts['backing'], {'read-only': False},
-                    "Cannot change 'backing' link from 'hd1' to 'hd2'")
+                    "Cannot change frozen 'backing' link from 'hd1' to 'hd2'")
 
         # We can detach hd1 from hd0 because it doesn't affect the stream job
         opts['backing'] = None
@@ -933,11 +933,11 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd2 while the commit job is ongoing
         opts['backing']['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd1' to 'hd2'")
 
         # We can't remove hd1 while the commit job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change 'backing' link from 'hd0' to 'hd1'")
+        self.reopen(opts, {}, "Cannot change frozen 'backing' link from 'hd0' to 'hd1'")
 
         event = self.vm.event_wait(name='BLOCK_JOB_READY')
         self.assert_qmp(event, 'data/device', 'commit0')
-- 
2.29.2


