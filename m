Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457F847E640
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:16:34 +0100 (CET)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qld-0002bU-Bm
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXv-0005lt-MH; Thu, 23 Dec 2021 11:02:23 -0500
Received: from mail-eopbgr150128.outbound.protection.outlook.com
 ([40.107.15.128]:32197 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXs-0005La-9N; Thu, 23 Dec 2021 11:02:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCwJZZarBlw0DwhfacPMG+KAUUs70RxwN+HQAuNxHmiAcDqRFnLMZpnuRXNcN2E69okYWGdvX2W0D76k801XbehQ7dqu4bDdJZ8k3w0HjCFQb8o6vgNAEDDZ/5pXDXqBmc1i2Ck1eca715G5cb/S6/tDUObVuKY1WvxtdWzrcIrz/wu550WvujVaZb7kiI4IgJBAZlidnKYznDnfYT9V3Q/2iGmLY/EDsDVnNtyl9nv/Xznzh5MfzseoH3oFliNX5XtQ94PQ1bYSPLmSjaB2HT/Li5c6ccZc9t0BowauHt51r/F71rm5r4wtEcppJnzQIg3KIQgb2mjEc5ZQpaGBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4yY/cTfJ6ANnVhv7UxkDR3Yy8k1VYZhqmNFWNMFZS4=;
 b=eAlB5dks/o2SYslPobyGxSWAGL5WzYAmcYMcNgLtrTJCInmn1n4vWoWH6IvquzfO7tFccaZsoXWHkxATHGcjUfv2toSxgmZUsDBkjeCZlhZPdoDjfHbZmh2qDY7uVYIIBVCtaL//hWfMuskPZb91Dzp2Z63wFlnjEz3T1dU5iYeARYBTPBiwfu4o/SWkv7RaUpyVeiUY7/ujDzqQgvu3iCs8G7QGgerQGHqXyhaIisutrw2/hEISpArKYjT5OfdLMnVjp70WYWKXO9bVLALqmnzzoRXkBY7Xqka40dpaA0R4hOkqlsSZ0dkxge0bOTsXWYCP9qyzjqYGFDmeLKrbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4yY/cTfJ6ANnVhv7UxkDR3Yy8k1VYZhqmNFWNMFZS4=;
 b=Qwfaz5ZnRbThroTQrZC0tc+/ms2fChUFjBhERowj21hQ8hLwO67xFGM8ZfQ0q+D2UwQBpOHznWf/AbQ4PCms/27QpoPuw/MAAW1oqg1SBTNImAigN4qLY4DgtkDsgoN7Tn57m970B3l2x51jhU2XFmdDiKhWiOYwnu/tLSGOEk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:58 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 09/19] iotests.py: filter out successful output of qemu-img
 create
Date: Thu, 23 Dec 2021 17:01:34 +0100
Message-Id: <20211223160144.1097696-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fec5f8b-b1d7-4ccb-e1d3-08d9c62d8c31
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148BB6AD04CACBBECC1FC49C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:42;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JT+IDtBS5zAkoOVgaj+2XUlFRByeCD2D0uJGBTs0Wqd5cg/5Btg0mF/ezKfeQBrn0N+nUvkFNwjT5A/nqwnxX4qz7vbc9rDEf6NIulN39uFDsNOYtyU6ioRpGETcujhHvIHnQH8tjNapoVAQ5rkRM05e0On1bk0CoheNMUQiQ/pwThAlXZHGXdf+wyWSeJ1NtEO+AOsSJs67Hgx9L7UXlv8d4u+8swNFb8nTvGocFVz+SxkB8txVIVzfcuSJkBLAMRGwYq4NtVTGX/HsyKUCnYWWh6qUMO+/FsU5hy0wpEObQMUQKfU/1TSmj67Kk+GwBMfzb8wX2mhGCMRX99b5cmFwMFeWkR3uCTySVcosZCOgBFPfQ3eF+zGRuouQn1Tn5EBoITjMt6WzX1sZmg7o4EyYGDbaTUQ0xdcRQrsh0Rr4nmNNZhJmnxVKqAOKiGnvJ6yU30L1aKZTY4DFWKZIxGQ1ma9PMYj+hHtnhtC+FBkJaFYMqKojXHPB5/GoDPsFGcUy+XOYzmUyyq4F9v1I+A/ltQCIvneUXttpKa8fnraaLP0RPXh0SFMDw5jo6Ib7ebBuvUebPEnZYKKOq16ZxwIJH74KjwXsyIAvNKBIxAQu2sMFpKudEP6bPXHw5mR4H1nwxh7fy8CA4usLFSHuV9YbTBPgbC4pHQzHU1gm9XRt9AY8jlaP67/P0/DJwM8AD3wW7cbCPNQkIfGAwoUPdfdf/zP47L7vm+/uDL4vhy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NhDkXABA1p9RNxzZ4ec/pUEOPgo6PGxxC0HriJVNj3xZ1/bD3hgNv2nl0tyi?=
 =?us-ascii?Q?P3aEKYDNkK/8i/f/2yvCm0EGjchyatdoOwMXV8jG3wPYzjExwSRQFWMkZFXi?=
 =?us-ascii?Q?DOagonchDKgEYMNpunm3Ce6bcx0Zqd1FGO3H1QOWwqHSu7OTXmN7eSzOyfPE?=
 =?us-ascii?Q?2g1a5wyVOHB8uzUGQnd4wAHkvts1qKePM/WXMW0Bu/CuCnatGCW/bFIYOf5o?=
 =?us-ascii?Q?tJucQrSzOPZzNpm+Tfj65zZNUwsNO1AlmJ25ADiVqiTEKnkUBtKWOoZSwu0j?=
 =?us-ascii?Q?zWpan7ExC4Q5M5X6MCKiJK/c1QyQjSoru2tpLgHH/tKbA2th4P3uz18Pn0Ob?=
 =?us-ascii?Q?VnPtCzGttggAUKgvY5zkNND+5VVUXfBk7Jv42vxCzrbF6dEim5rYOJfWxwkv?=
 =?us-ascii?Q?6PPf87who35XCQyLIbJnVpBdVV9l95ZurhxMejTY1rJBDmQ3awnj9H9O3Hi4?=
 =?us-ascii?Q?qtPheBxMX8eDp6YX7huPaVHax5jb+w5EGNMy3yYv2wGJCnwGRgd6Sv55VUHE?=
 =?us-ascii?Q?gx1v5yxJ++0Jx7wAXnVnQCzPGkJbeb6X/KQbDbitIcKCHwV180EH/w8470zw?=
 =?us-ascii?Q?+ar4+MluXCorxeLxlYAjqR9LYNJN3CvkVBKAmGRpX9FVJh2hQyoXRIDJNwZb?=
 =?us-ascii?Q?IIAbTXUXNhl0x1B81LnibvbA5ArZxpTH/SahLyXE3r2AAJpsAmrzuIk5iZpw?=
 =?us-ascii?Q?VN8oVZqmN0wUIgSZS0dVRBngpA0Ct/Ra71ivGoaCq7Cz7G+Pvwjj13MzTbNB?=
 =?us-ascii?Q?omFm1Vdd5SOYfhIvY/c1WaiBvoExhl4amgN5ZwOGBiV7bQLNGHCF80hNqHp2?=
 =?us-ascii?Q?MeCr6lssS3NRf5bqrc27+LAh4pqc34Ho3ts8t3czUU6RvdSY1AmPo5VwL7Z3?=
 =?us-ascii?Q?gZV7QaQM0SIrFVI4Hflx0jSYC5+E5ZwDBc43fa7w9nIetcc/Z9XYNkisAM/V?=
 =?us-ascii?Q?i3/8OTumSzo9aIjlZZVcvEpNBz5C+xWYJ2Ng5g8vDgaCUEQtOd8vOhc5G3aN?=
 =?us-ascii?Q?JwGzfrIlmGFY9P+T5LUSTsQRHPBuhHHX0W/Uq+cXYmHkVC3oTRBSnJYRkav8?=
 =?us-ascii?Q?7yUVxc13xAq+P6NvbMuv3UaG04aQWktRVNPoXiKGwB4DGbWwrS7rFs/Tu5/b?=
 =?us-ascii?Q?zcz7J9lxxLmaIO/N/t/8W5u4tpbKvJKMcN3tNn5KyPlDZncVBHVdOnhkMgvD?=
 =?us-ascii?Q?Eg33ijdU+1i//zTY/gtueJbJmDNWVYd5VoOuAf2amKoz/wgyvKCYu/RCkQq8?=
 =?us-ascii?Q?yehbPwfQnAUHJdOyNiFqlKt9m+Xjwjeyp/fVFtc2jQ9Yw/4NiC4AwSJOLXRO?=
 =?us-ascii?Q?lzjz8RdqOMaDSSEMXv3GfLVaqsj6uKDD/aGeqvj87DQ4RcJpSYd1IipCaY7Q?=
 =?us-ascii?Q?Mzqr4WJAmZe7mJxujQp0n6yydwp454A9hzEmYqnMmROpgG59JIK7vDbycM9H?=
 =?us-ascii?Q?QIyfuU3JTCJyD4oRclouru2+AOSfVKTieBvE8SRN75UHpl2Th2TPaA7nVc6X?=
 =?us-ascii?Q?4UsefnBG34KZxXpjD330Auht6TsXyybVUoEOzbxVhMj2+XoMzRVWimaVb+9U?=
 =?us-ascii?Q?q4DWJxqhAy5f9yDJsfXlEyWFUYLnrnnN9L3d4H4bVOcxAu7ov8zSsyGI8O0J?=
 =?us-ascii?Q?acmvCYSvLyr/qqYEJGY1KJlnYvYDyPPd1lyoFx4tlMDEKletLbut9NK1V6at?=
 =?us-ascii?Q?4VeOcbwwoOpusSJE7x8o3j35wcY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fec5f8b-b1d7-4ccb-e1d3-08d9c62d8c31
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:57.8949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtT7aPFKanGYrxFkoZ9ZGAl3vW6sl3oR8DWpEd9YOFxVtDA6NsSiMtUGws9qWmzlkh/XtLeglu6lTHRnz4Fj/0shd+KMywLMbFOsq4r45sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The only "feature" of this "Formatting ..." line is that we have to
update it every time we add new option. Let's drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
index 2f09ff5512..aeb9724492 100644
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
index f424e04573..4bb740634d 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -140,7 +140,9 @@ def unarchive_sample_image(sample, fname):
 
 
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
-                              connect_stderr: bool = True) -> Tuple[str, int]:
+                              connect_stderr: bool = True,
+                              drop_successful_output: bool = False) \
+        -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
@@ -152,6 +154,8 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
             cmd = ' '.join(args)
             sys.stderr.write(f'{tool} received signal \
                                {-subp.returncode}: {cmd}\n')
+        if drop_successful_output and subp.returncode == 0:
+            output = ''
         return (output, subp.returncode)
 
 def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
@@ -196,8 +200,10 @@ def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
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
2.31.1


