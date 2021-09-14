Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2E40ABC9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:34:10 +0200 (CEST)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5lS-00025B-2q
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e1-0004uO-6y; Tue, 14 Sep 2021 06:26:29 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:28801 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5du-0003UG-1O; Tue, 14 Sep 2021 06:26:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eslE4Gdqhy308uW+ajoU6uco4snh2zpVQguVPNaXcMOZ8OEE5Su8l260VV1NskGMnaYn0ssjnfydTkJtPXMOnuM1WiAycygTjXifGsK1UOPrZq0KEeeQKKrTiJn9yQ5xUNUT3Sag0Gb+Su8iScInzbe6KVutYy4zPNaHqvt6Sommrr6EFLsivASqlC6UIAlIiwNUF9ukmzr7ErerUTDOdkEOlW2CAh30ZuHG+omtpbicKd5dSv+hj6ixzZ8K7+5Al/nmDIiM4N8U0KWk9q/dwjucIxUKwkrcyVcdG8Rp9vHjHbT9hoiEJgweXX3E91R49CyBI+cdiO+gtgyuzqQNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=JlZE4P7i38gKDOeuGeVLpFFKQtK91Oeo9YgMP80/7II=;
 b=EVHVkFcBdGDiPm4ktouRD9qmGF+doBWXxJWjAONe5ylvSurOdB5NDNU/vyhhXN/Me80s70V8ofBI8pbaabmit4wCW5XdG5A8b9CuqX1KCJzTkXL93CRfkyrmqfokPkA15CzYxgdwKsfEpUdtgK/elit5g5jgegSfpm+fjSOcl7m0e8vVfLQpAv/xmZFuVYoY4AEnc+uuE4fkvT38tLE7sV5J/zKRZcBwRWmZw8ewyE/LIwT93wTPt7p74nLD2boVVjJjtbm0f7fg+gUg70d9N/XwXmBbE922vkvO/WHIBR8GzIo1U4JkvkS+MIbRmBZP4u+yHdXmGsIl0bvoHN6njA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlZE4P7i38gKDOeuGeVLpFFKQtK91Oeo9YgMP80/7II=;
 b=nHbnhG+HzRsLlH4Sn+YiVr84dzZuBRXpzpt5YdT3xSiLw+9hU+b1Uro46LLvvEil3B4BVvTMPo4vFBdrR3IMvEooXZzn3KxzkUrHfi/dKZlbxd5O7UYBEnvWK+Uzk+frXpdmsdw5AR4IwkktJzpseYfX0hg+GPFdeybjYzJQCIY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 07/17] iotests.py: filter out successful output of qemu-img
 create
Date: Tue, 14 Sep 2021 13:25:37 +0300
Message-Id: <20210914102547.83963-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea9bb30-65f1-4f89-9713-08d9776a1434
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB607148D3123969B0C64BBE13C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:42;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NIlYCoYHuwevs8lMK/QsdE0xXD2/J7DpeJlO9RcwqK71UtOxUAAXIh5AdFqoGpYH5i0VUn2FEfiY6hVgQwBdz4xpVmvYT1MXDgV5d8GXMKvrmLYYkHDEJZR1FPfpcygwiq8KLTgTmw0aL8aWpd5/Z8n8tGo6FB1Z1TyO8gD0rtJ6XaYoMTdujizhPZpEn/v91yT2sNVM0pAYX+lxjeRitZt2EtahwEeG22DZFSnGeLgEKJ5yRlXkoNvuIpqjgwLCeQYbay1hdxWgafZq6agtt1euLyxeDaC9Rj9m+jX8s9f7zHgmuePFKOwNDPQRFzJM/Aa/82VcswlBoMf73fGzlLWNSKj64uU3ZTxzmf7IdsP3rgd3sPvkNEYh02MR+wPkcGp8sUmmSZddr0A3yOF66BdtmUoRcLJ1q8TiB7scyZ6ewTZhww2R1dvBTvgJvRVU4cxXnD8pIhXThkj/1hsIuX/oM6qXIBbsq0fgGdrw3SrgwHj2A9BfFl5OfSXhDzscvAIskt3qo/fBiM/JU7CrI2VJj4Ax/ZPi2decjUfiroQ9GYOpldZxeMzexA16WjGrXSdN/6/N6YttM3fsH8CXZ5N2HwCEJtxmQ8ej3+k/XG65HAmrMcB1IApp/v+6wxMnpeBS0E3MuLbkEOke4EyAx8D7bZJHdb+5Ay3EjUorVE6xW4v8P9BPrmF8DFYR6E0wULKnrpsbXTw/ON0/lGVe5qS7w1HCMS2UAZMn34Bd1VI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(30864003)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BaQNvWuQfKdxNe1qVlpFKPi0JYCMtNNGho0CBv+6ye2/nX+/0kUB6k1ZY1+W?=
 =?us-ascii?Q?aVUlJjebk7IKqQo9YSaN4ao2pkTZwy5ejpeKJ+/TZzD4pJKfqeP0HiHj1JI6?=
 =?us-ascii?Q?vf2k06cj2ughVoH+VOInB+jpmjI6Lil3PkFkhocwJ0XcCnMabEtkVmxm0hTv?=
 =?us-ascii?Q?fbOGvHNLGjmVqUniQU2tDXSgtsHaNgroAAOcYrDJALTwc8ri6tRx04eUazK0?=
 =?us-ascii?Q?fYhDb9WJIbv5YayyeT/pViBRuabe2FMV9wAXcjmLRdYUgUtTiFH6lggUQuXq?=
 =?us-ascii?Q?JYngt8bQKOPt7kGfeSNDfMtiBNgI0Xn2j6V1/K8tgUj3QAtqKkHNspWrR32t?=
 =?us-ascii?Q?5q4Hjkct9VIiHOraLT9mw7EcGGmDCiM4cT6t1kdDqLj4H5iNadOdvQjEgFFY?=
 =?us-ascii?Q?352TqrtJ6FcC7GjIAKp9q46kDXWNohzJAdV85CLmCm14MuV4FMJHu3r642nF?=
 =?us-ascii?Q?+6wm5VQZlxYhfSdjScAAOxCZ/6zx5PW+iGwm3RcFUw9g/GnZPC47zaualyGB?=
 =?us-ascii?Q?mZzt+9MIMaVZaS5RpJ3x1p7giy/t+PTe0esgglNTsjpOD2etOOrM9NGwyj8n?=
 =?us-ascii?Q?0FqHNKiHw7H4v+6iwCbtE23cEwHGBPjsbIbQDBgV0cgntvSI8ggo5ws4YtpG?=
 =?us-ascii?Q?2csFlHphweN0b/ReN9JTfhFuLovtjFOhqty3ighP0RSO/Volmfnh3S9HKhQt?=
 =?us-ascii?Q?pk66/G5oooFAyhoCWdheA4UWNme5zVSgEE0trXe+l0+p1Ub/JYEifSLy7Teg?=
 =?us-ascii?Q?wvdiv7WM2vxVrHFP+5DRhggB/9o9sIIvPF3oyGmZOEWFSCUSpoChmZw2NUes?=
 =?us-ascii?Q?NMUU1WLQBHRwT9w3BvmnPWtwieARtVAPhF7X0WDGgp+/wrriB3f3mXNZKbGC?=
 =?us-ascii?Q?QUCR78U4eg7IjK552iSg2BaO2YyCeWv/dbLN8FbFF0phzgU8xD4XicLhj7UK?=
 =?us-ascii?Q?KpTafIFaYUl+vtHlPBmD6LggWCQ8ClluQdTXTKjc2XtnhCORhLaaiFpHbqni?=
 =?us-ascii?Q?mWsYsFNxCJGdcBv1jujNApd2KQOzopqlZwY7ltuAci1M2+fadkp9VQprLOJB?=
 =?us-ascii?Q?fptjVSKgvI3vukp7rveCkAGi0S520MzUhKiYRZ9UzRcIeUS5rgJ/PiCKfu4i?=
 =?us-ascii?Q?2irRc1iMPRimxSVmxPbaeYz7W8A8JRf1gPrfdEwBfIRtmxBogVtSmH/i3llK?=
 =?us-ascii?Q?HFxP2QiUi2mALLhMJov3bsMGVFT3VadIffyMsxu98MuBz1DseCMAoXg9D37Q?=
 =?us-ascii?Q?XKJAZPKiuNPFOK6TK63Xod/2Du6f+cUsCc0t6bL5twtx84FBG+gyGeNTFucs?=
 =?us-ascii?Q?8xtzV4+CahGlEGAnrtsBMQil?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea9bb30-65f1-4f89-9713-08d9776a1434
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:14.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyebPDhBISjG/stCOeUv+ia7BynYF1ayTBMbV2irYuTAsiGzJEP0+rVtoU2taSfr2fPZYHC+Tj9z5rKI06wuZxTuJKQlPVZpsD7c9rzCJrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

The only "feature" of this "Formatting ..." line is that we have to
update it every time we add new option. Let's drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/149.out    | 21 ---------------------
 tests/qemu-iotests/237.out    |  3 ---
 tests/qemu-iotests/255.out    |  4 ----
 tests/qemu-iotests/274.out    | 29 -----------------------------
 tests/qemu-iotests/280.out    |  1 -
 tests/qemu-iotests/296.out    | 10 +++-------
 tests/qemu-iotests/iotests.py | 10 ++++++++--
 7 files changed, 11 insertions(+), 67 deletions(-)

diff --git a/tests/qemu-iotests/149.out b/tests/qemu-iotests/149.out
index 6877ab6c4a..ab879596ce 100644
--- a/tests/qemu-iotests/149.out
+++ b/tests/qemu-iotests/149.out
@@ -61,7 +61,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha1.img
 # ================= qemu-img aes-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-256-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha1.img qiotest-145-aes-256-xts-plain64-sha1
@@ -181,7 +180,6 @@ unlink TEST_DIR/luks-twofish-256-xts-plain64-sha1.img
 # ================= qemu-img twofish-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=twofish-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-twofish-256-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-twofish-256-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=twofish-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-256-xts-plain64-sha1.img qiotest-145-twofish-256-xts-plain64-sha1
@@ -301,7 +299,6 @@ unlink TEST_DIR/luks-serpent-256-xts-plain64-sha1.img
 # ================= qemu-img serpent-256-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-256-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-serpent-256-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=serpent-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-256-xts-plain64-sha1.img qiotest-145-serpent-256-xts-plain64-sha1
@@ -421,7 +418,6 @@ unlink TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img
 # ================= qemu-img cast5-128-cbc-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=cast5-128,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=cast5-128 cipher-mode=cbc ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img qiotest-145-cast5-128-cbc-plain64-sha1
@@ -542,7 +538,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain-sha1.img
 # ================= qemu-img aes-256-cbc-plain-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-plain-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-plain-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=plain hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain-sha1.img qiotest-145-aes-256-cbc-plain-sha1
@@ -662,7 +657,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain64-sha1.img
 # ================= qemu-img aes-256-cbc-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha1.img qiotest-145-aes-256-cbc-plain64-sha1
@@ -782,7 +776,6 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img
 # ================= qemu-img aes-256-cbc-essiv-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=essiv,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=essiv ivgen-hash-alg=sha256 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-sha256-sha1.img qiotest-145-aes-256-cbc-essiv-sha256-sha1
@@ -902,7 +895,6 @@ unlink TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img
 # ================= qemu-img aes-256-xts-essiv-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=essiv,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=essiv ivgen-hash-alg=sha256 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-essiv-sha256-sha1.img qiotest-145-aes-256-xts-essiv-sha256-sha1
@@ -1022,7 +1014,6 @@ unlink TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img
 # ================= qemu-img aes-128-xts-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-128 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-128-xts-plain64-sha256-sha1.img qiotest-145-aes-128-xts-plain64-sha256-sha1
@@ -1142,7 +1133,6 @@ unlink TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img
 # ================= qemu-img aes-192-xts-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-192,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-192 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-192-xts-plain64-sha256-sha1.img qiotest-145-aes-192-xts-plain64-sha256-sha1
@@ -1262,7 +1252,6 @@ unlink TEST_DIR/luks-twofish-128-xts-plain64-sha1.img
 # ================= qemu-img twofish-128-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=twofish-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-twofish-128-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-twofish-128-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=twofish-128 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-twofish-128-xts-plain64-sha1.img qiotest-145-twofish-128-xts-plain64-sha1
@@ -1383,7 +1372,6 @@ unlink TEST_DIR/luks-serpent-128-xts-plain64-sha1.img
 # ================= qemu-img serpent-128-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-128,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-128-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-serpent-128-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=serpent-128 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-128-xts-plain64-sha1.img qiotest-145-serpent-128-xts-plain64-sha1
@@ -1503,7 +1491,6 @@ unlink TEST_DIR/luks-serpent-192-xts-plain64-sha1.img
 # ================= qemu-img serpent-192-xts-plain64-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=serpent-192,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha1 TEST_DIR/luks-serpent-192-xts-plain64-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-serpent-192-xts-plain64-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=serpent-192 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-serpent-192-xts-plain64-sha1.img qiotest-145-serpent-192-xts-plain64-sha1
@@ -1625,7 +1612,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha224.img
 # ================= qemu-img aes-256-xts-plain64-sha224 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha224 TEST_DIR/luks-aes-256-xts-plain64-sha224.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha224.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha224 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha224.img qiotest-145-aes-256-xts-plain64-sha224
@@ -1745,7 +1731,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha256.img
 # ================= qemu-img aes-256-xts-plain64-sha256 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha256 TEST_DIR/luks-aes-256-xts-plain64-sha256.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha256.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha256 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha256.img qiotest-145-aes-256-xts-plain64-sha256
@@ -1865,7 +1850,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha384.img
 # ================= qemu-img aes-256-xts-plain64-sha384 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha384 TEST_DIR/luks-aes-256-xts-plain64-sha384.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha384.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha384 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha384.img qiotest-145-aes-256-xts-plain64-sha384
@@ -1985,7 +1969,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-sha512.img
 # ================= qemu-img aes-256-xts-plain64-sha512 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=sha512 TEST_DIR/luks-aes-256-xts-plain64-sha512.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-sha512.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=sha512 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-sha512.img qiotest-145-aes-256-xts-plain64-sha512
@@ -2105,7 +2088,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img
 # ================= qemu-img aes-256-xts-plain64-ripemd160 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain64,hash-alg=ripemd160 TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain64 hash-alg=ripemd160 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain64-ripemd160.img qiotest-145-aes-256-xts-plain64-ripemd160
@@ -2299,7 +2281,6 @@ unlink TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img
 # ================= qemu-img aes-256-xts-plain-sha1-pwallslots =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=c2xvdDE=,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=xts,ivgen-alg=plain,hash-alg=sha1 TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=xts ivgen-alg=plain hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-xts-plain-sha1-pwallslots.img qiotest-145-aes-256-xts-plain-sha1-pwallslots
@@ -2419,7 +2400,6 @@ unlink TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img
 # ================= qemu-img aes-256-cbc-essiv-auto-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=essiv,hash-alg=sha1 TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=essiv hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-essiv-auto-sha1.img qiotest-145-aes-256-cbc-essiv-auto-sha1
@@ -2539,7 +2519,6 @@ unlink TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img
 # ================= qemu-img aes-256-cbc-plain64-sha256-sha1 =================
 # Create image
 qemu-img create -f luks --object secret,id=sec0,data=MTIzNDU2,format=base64 -o key-secret=sec0,iter-time=10,cipher-alg=aes-256,cipher-mode=cbc,ivgen-alg=plain64,hash-alg=sha1,ivgen-hash-alg=sha256 TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img 4194304M
-Formatting 'TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img', fmt=luks size=4398046511104 key-secret=sec0 cipher-alg=aes-256 cipher-mode=cbc ivgen-alg=plain64 ivgen-hash-alg=sha256 hash-alg=sha1 iter-time=10
 
 # Open dev
 sudo cryptsetup -q -v luksOpen TEST_DIR/luks-aes-256-cbc-plain64-sha256-sha1.img qiotest-145-aes-256-cbc-plain64-sha256-sha1
diff --git a/tests/qemu-iotests/237.out b/tests/qemu-iotests/237.out
index aa94986803..fa84ee4597 100644
--- a/tests/qemu-iotests/237.out
+++ b/tests/qemu-iotests/237.out
@@ -129,11 +129,8 @@ Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't
 
 === Other subformats ===
 
-Formatting 'TEST_DIR/PID-t.vmdk.1', fmt=vmdk size=0 compat6=off hwversion=undefined
 
-Formatting 'TEST_DIR/PID-t.vmdk.2', fmt=vmdk size=0 compat6=off hwversion=undefined
 
-Formatting 'TEST_DIR/PID-t.vmdk.3', fmt=vmdk size=0 compat6=off hwversion=undefined
 
 == Missing extent ==
 
diff --git a/tests/qemu-iotests/255.out b/tests/qemu-iotests/255.out
index 33b7f22de3..11a05a5213 100644
--- a/tests/qemu-iotests/255.out
+++ b/tests/qemu-iotests/255.out
@@ -3,9 +3,7 @@ Finishing a commit job with background reads
 
 === Create backing chain and start VM ===
 
-Formatting 'TEST_DIR/PID-t.qcow2.mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
 === Start background read requests ===
 
@@ -23,9 +21,7 @@ Closing the VM while a job is being cancelled
 
 === Create images and start VM ===
 
-Formatting 'TEST_DIR/PID-src.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-dst.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
 
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index 16a95a4850..1d2928e14d 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -1,9 +1,6 @@
 == Commit tests ==
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -66,11 +63,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing HMP commit (top -> mid) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -98,11 +92,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> mid) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -136,11 +127,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing qemu-img commit (top -> base) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -166,11 +154,8 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> base) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -205,9 +190,7 @@ read 1048576/1048576 bytes at offset 1048576
 
 == Resize tests ==
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=6442450944 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1073741824 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 5368709120
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -224,9 +207,7 @@ read 65536/65536 bytes at offset 5368709120
 { "start": 1073741824, "length": 7516192768, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=metadata ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=34359738368 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=32212254720 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 33285996544
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -248,9 +229,7 @@ read 65536/65536 bytes at offset 33285996544
 { "start": 34896609280, "length": 536870912, "depth": 0, "present": true, "zero": true, "data": false, "offset": 2685075456}]
 
 === preallocation=falloc ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=10485760 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=5242880 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 9437184
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -267,9 +246,7 @@ read 65536/65536 bytes at offset 9437184
 { "start": 5242880, "length": 10485760, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=full ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=16777216 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=8388608 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 11534336
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -286,9 +263,7 @@ read 65536/65536 bytes at offset 11534336
 { "start": 8388608, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=393216 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=259072 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 259072
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -306,9 +281,7 @@ read 65536/65536 bytes at offset 259072
 { "start": 262144, "length": 262144, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=409600 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 344064
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -325,9 +298,7 @@ read 65536/65536 bytes at offset 344064
 { "start": 262144, "length": 262144, "depth": 0, "present": true, "zero": true, "data": false}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=524288 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 446464
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/280.out b/tests/qemu-iotests/280.out
index 09a0f1a7cb..e39164c579 100644
--- a/tests/qemu-iotests/280.out
+++ b/tests/qemu-iotests/280.out
@@ -1,4 +1,3 @@
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
 
 === Launch VM ===
 Enabling migration QMP events on VM...
diff --git a/tests/qemu-iotests/296.out b/tests/qemu-iotests/296.out
index 6c69735604..42205cc981 100644
--- a/tests/qemu-iotests/296.out
+++ b/tests/qemu-iotests/296.out
@@ -1,4 +1,3 @@
-Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
 
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -13,8 +12,7 @@ Job failed: Failed to get shared "consistent read" lock
 qemu-img: Failed to get shared "consistent read" lock
 Is another process using the image [TEST_DIR/test.img]?
 
-.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
-
+.
 Job failed: Block node is read-only
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
@@ -26,12 +24,10 @@ Job failed: Failed to get shared "consistent read" lock
 {"return": {}}
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
-
+.
 {"return": {}}
 {"error": {"class": "GenericError", "desc": "Failed to get \"write\" lock"}}
-.Formatting 'TEST_DIR/test.img', fmt=luks size=1048576 key-secret=keysec0 iter-time=10
-
+.
 {"return": {}}
 {"return": {}}
 .
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index a838737c28..0ff9e87510 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -126,7 +126,9 @@ def unarchive_sample_image(sample, fname):
 
 
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
-                              connect_stderr: bool = True) -> Tuple[str, int]:
+                              connect_stderr: bool = True,
+                              drop_successful_output: bool = False) \
+        -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
@@ -138,6 +140,8 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
             cmd = ' '.join(args)
             sys.stderr.write(f'{tool} received signal \
                                {-subp.returncode}: {cmd}\n')
+        if drop_successful_output and subp.returncode == 0:
+            output = ''
         return (output, subp.returncode)
 
 def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
@@ -182,8 +186,10 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
     """
+    is_create = bool(args and args[0] == 'create')
     full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
-    return qemu_tool_pipe_and_status('qemu-img', full_args)
+    return qemu_tool_pipe_and_status('qemu-img', full_args,
+                                     drop_successful_output=is_create)
 
 def qemu_img(*args: str) -> int:
     '''Run qemu-img and return the exit code'''
-- 
2.29.2


