Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653083CF930
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:52:07 +0200 (CEST)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oIA-0007c8-DV
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5f-0003EG-Uy; Tue, 20 Jul 2021 07:39:13 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5d-00077C-Ks; Tue, 20 Jul 2021 07:39:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQ9X+djZJEuEF0Kxjr+FxT4HZO0NzWVmF0wqBXAOK/CKAfas9hOqOJ0eAEitvup6jEzyt2htGP0OV+vSDTM/X9SjwncgV3UIULbplmO4INXu+YTF0BH/qWSo1QhWoR/Vh21nqVLRWP50QgDMFsHqxtw/7umJXLj5Gm/5C57SDtzk3iyzONjXCCBOt3Z/W1jRVobZl9TK+Ix6XpcMsvU7fz10t+Y6u8cuNKM5uLlxNAy+xETDu5OJLFaIZYrFebAzB9vK+SMSyGaOsgz1AWn1I8BPq2meAGmyPlcV/3aHaR9uI3KiSi6zkP4wO/knNiyq3BhNJu9jjegUSo3dXGsq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Apb2arpVeOqHDJs+z7RI3HGryl/2mDzB8TMmoyJ/ksU=;
 b=d2AZ/4VOD8ImZftwr2vnFjGXVNi4/Ghv2R8Q5JvWV//5j9E61qjIsmusbb0ZjSYlk12mV80r3oyXYWJWZwfvCcjjFVmwnCjoU8mQEHoPbfbYC5OH2M94ebqD5EtyvP3lkWi0Iym8rVbhKSVV5SVkQyd9EKPnyC331uHbfh9TR2OHruTXCrP47xVRXzZfIXFRai0HXBox2n0Rbx613tPPURUYd9gaKQA9tY5wZzDXQ3syGOIPQbCGl39XOaA4AQacwqprE/fLpLC3xGfgDTHEfQDG68Pkekt4wCUTCKf1RXO69DBOFrqkl+M89qy/7q2y2cidzIEEkuvMGoKDdTJBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Apb2arpVeOqHDJs+z7RI3HGryl/2mDzB8TMmoyJ/ksU=;
 b=NSVPW+2UMl8oKJkjkIWQb8+mNRl6jZUjtieaIVsq23LJWWppoP/BIvvfb68gdSqPUHfhKxVF/dUtWMnyl9sXItcV+8mUKYUpt6V47D4WeYCsQFBf2B0ycx73xItDdYzk5LVDMPSlZR9HjR1APCEFjg34h3pwYRxuOxPNO/ZsMqk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:38:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:38:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 05/17] iotest 303: explicit compression type
Date: Tue, 20 Jul 2021 14:38:20 +0300
Message-Id: <20210720113832.586428-6-vsementsov@virtuozzo.com>
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
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f722fe0-72e9-44e1-881c-08d94b72f5b8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119606DC466E7AA443B6FC3C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qbJ8jR0eyiYsT2X25vdRZmK4Ripq+2YoQlIfm1PHLhUVXcgDKj5sLWha1e89ppsNa1RXz4DnU9XmO3YX4Bh31hsvfcSM3LEe9Cdt/oVBgYBRsjq6/zN0uVrvaXKKrqi2WxyoKYuTLcUyaDx1MXqGoKQy0UmfkFJEkXcAL9cggRPsGwQzV+bh21YiaqDDEZNj8D8EdtAEN7vPFQMzQPlBGZVAL5+80WtAqew9oloi035CooH0JkVMCOWm3uByvXKUT9kCL+rQzUcCQRh8ZXjtyVUa/0fLdEVUnL5ftgk9dV6MjdAN+46cuWnpKTvIj00aGnhWgdO0szz5i2vgqm9nxQ/1uRDwgxonhHds+W7Y4gCiQmbEvZFRCh5mvXcKdCv/TDhL0iSVAG+cLMgDHOmIQVKV6hj+uUNYeZAm3xQhlmrlxdFAqcQSvZuzo3HI75uTbSO4GzXt9oyRo5CG/UV6DTrYUDBKA2TOY+AwaYF0qC46a2f5sSt054EqcT1ujvYl7RHRq8fjA4CpBKRNglCJtXV8Q5ppYC+VSH2TVafpOp+TVz4famEr8cQO56Gzk3XLqFTkMiOQ8ZhrlUsOOYtxIy0qmImr8wfV2lwW77npw+1MUQLaF73T3uMQCAULoG7g4JbASdtdmozNR4kBDfWGBoytOGDjRcP2i2HbLUKlw+ZE/s2JrIfB/f5IOM5cnU8klH5yO6dMhY2k+p6KseMYB4IAlGWTA740H1kulmEH+ow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3M33AATSkWFhZOmsQ3RcL/FigehS2o8/6gbjY/IN4O8mssI8LUX/VJzBaqAJ?=
 =?us-ascii?Q?P3WXWIzW0LsU0LpDHHwkJhBzirSkaLkNsMNMDSOA+JuzKNlxWxX+suE47Plg?=
 =?us-ascii?Q?sPxbDFwXZgPbFPkBf5M8A1KgZKh/TMpzFkUOYbGfTn3x4i1SmUcWKeqHCpsn?=
 =?us-ascii?Q?F0K+/LbI/D8EAHl6M/v5n82DkVHAdjyen8BUg7mLnyAl64cu083q91I8P6kQ?=
 =?us-ascii?Q?5rWgvV+1HlGZv6adeaeWo8E+R23PS/h2qKiUUHcOY/teUfLBiyp+jhRUzjV3?=
 =?us-ascii?Q?IBjPHlvLmCCa44Lfcc+XRM08mXV2bL5D0EQgHU76pFYMHuT2TLgsKoFlTsS8?=
 =?us-ascii?Q?f+BmTc32xbPtapBS61nSBm2IjgA+Qm2qtxrIK3tlL5fe1Kue8RO2Y0a1H8wf?=
 =?us-ascii?Q?PB0hUd4qGbmK+iyTk/3JPlxKr2qkI/vX1rPepPw2DLpS0Twq/IxwspD7tz5f?=
 =?us-ascii?Q?4ICkujcQFApAjt7EPnkxU7jI8cd4b25ErN0h63rPfHUJf/yaEwKFJtMCLEC+?=
 =?us-ascii?Q?MDOXSGW9EgPnmLStUR+nUyy86h8OOPBTm/JKoqpP8UILHF2aulZR+BUQgZoU?=
 =?us-ascii?Q?YDUuukcXydZPJlwgxogBMoYBMMNGIZ2YRJPvilMfr7BZ5dmjYBx8YtKZay3S?=
 =?us-ascii?Q?Cdx9Pr9UVF0jijT7sH1DtAxOFO0rlfalmg2rFNrT/EiYLUwlMX8/A3paTF2w?=
 =?us-ascii?Q?QSHCvFgzFV7mPDkci/kc6nPoj0s8RSVGwphpDaeBl3Z7fRFLcRe7YxMAzMnK?=
 =?us-ascii?Q?BZvHfCX/XEzaFVrWMuqLfwvdgNEfhNBp6yi2uy6Ctv6rkz1mmYpdLhQ5XZhR?=
 =?us-ascii?Q?i9IBSBR4WzBq7WelpvJ3EZhwqOoQvvVoeOvdjgUS5nhvH46Ly3v+oGZPAmyd?=
 =?us-ascii?Q?+tNopJqUjkLbs4QFq+DrvyyExc0XW6JxA/4HX9KpmAiMbSx/qAmskQyXSQJD?=
 =?us-ascii?Q?yoxZZB6BNynLE9LxXfs72UiFLDWkHM4FabVOkrQqJEoQAQJmzOg2GU8Ot0bh?=
 =?us-ascii?Q?CXSZ15QI4ux+4Zmnm4HwbZ4jOxPEs3cvrCitCxnaXf+4lJpPL7pLMYYjRx32?=
 =?us-ascii?Q?iHGOZYlJWZJ00D06f2XfuvFgoa34ahxNHSuTIpmNU2fmfWvesRrCrcm75Ajx?=
 =?us-ascii?Q?Zx4tkoIhech+lMWxKaJ7h1AKwbcuSm9Ps16AIqRBTjnUcpgnrIRXvhZpPkFi?=
 =?us-ascii?Q?pnUKCI7YR6DxE1nnjWq/URIlsYn1vIdAMIxXP3VNrcFBkWHnPN0O6aJJEc0O?=
 =?us-ascii?Q?nTMqtpgKgXWoo+dKuriNVhuxsLsMUQWwb0a6JFWOjId2+Zb/tnLG0gyAbHZr?=
 =?us-ascii?Q?D5mafyd503qxc6UnQj6G2KRm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f722fe0-72e9-44e1-881c-08d94b72f5b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:38:57.2244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJWNAjl5+JsbwikL9WFM1R9GWTTBkx1L9/2MFU5vMtYWHscbFtOLd7s2gBXFAQsxEtOGn+mnXPAc3uwajxnEwPfS1rPgb/2K/jOAvUg/ASI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
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

The test prints qcow2 header fields which depends on chosen compression
type. So, let's be explicit in what compression type we want and
independent of IMGOPTS. Test both existing compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/303     | 25 ++++++++++++++++---------
 tests/qemu-iotests/303.out | 30 +++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 425544c064..9dee2bdfb8 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -53,12 +53,19 @@ def add_bitmap(num, begin, end, disabled):
     log('')
 
 
-qemu_img_create('-f', iotests.imgfmt, disk, '10M')
-
-add_bitmap(1, 0, 6, False)
-add_bitmap(2, 6, 8, True)
-dump = ['./qcow2.py', disk, 'dump-header']
-subprocess.run(dump)
-# Dump the metadata in JSON format
-dump.append('-j')
-subprocess.run(dump)
+def test(compression_type: str, json_output: bool) -> None:
+    qemu_img_create('-f', iotests.imgfmt,
+                    '-o', f'compression_type={compression_type}',
+                    disk, '10M')
+    add_bitmap(1, 0, 6, False)
+    add_bitmap(2, 6, 8, True)
+
+    cmd = ['./qcow2.py', disk, 'dump-header']
+    if json_output:
+        cmd.append('-j')
+
+    subprocess.run(cmd)
+
+
+test('zlib', False)
+test('zstd', True)
diff --git a/tests/qemu-iotests/303.out b/tests/qemu-iotests/303.out
index 7c16998587..b3c70827b7 100644
--- a/tests/qemu-iotests/303.out
+++ b/tests/qemu-iotests/303.out
@@ -80,6 +80,34 @@ extra_data_size           0
 Bitmap table   type            size         offset
 0              all-zeroes      0            0
 
+Add bitmap 1
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 2097152
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 4194304
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 5242880
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+Add bitmap 2
+wrote 1048576/1048576 bytes at offset 6291456
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 7340032
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
 {
     "magic": 1363560955,
     "version": 3,
@@ -94,7 +122,7 @@ Bitmap table   type            size         offset
     "refcount_table_clusters": 1,
     "nb_snapshots": 0,
     "snapshot_offset": 0,
-    "incompatible_features": 0,
+    "incompatible_features": 8,
     "compatible_features": 0,
     "autoclear_features": 1,
     "refcount_order": 4,
-- 
2.29.2


