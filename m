Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7283132D08C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:20:53 +0100 (CET)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHl6C-0007Ab-Aq
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3a-00055v-Nd; Thu, 04 Mar 2021 05:18:10 -0500
Received: from mail-eopbgr00098.outbound.protection.outlook.com
 ([40.107.0.98]:7297 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHl3Y-0002Ie-Tl; Thu, 04 Mar 2021 05:18:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjSeW9vuhPlmvRV/N0ICHcvGlcpgrl6KVgJzx5knviH9IdbVYdjHOD/lj+VGWG94u5NPkvi+dhI0Cs37ZxPSKgVncq+OTGCgja/+TxTBfvREORhLs5ANycFjpJBZkrnLgf7eAW4HlJfHlH6boVfQIxi4cCIdu7Y4RK6XOl4pzE0DzIKazcPX4xOB0XoC/qH8IU1JLo3FKo9awrUWCbrOj7joZlPd5H4qxdMhy0twCdxfSvSuOs5G3SWJ5SBZzIL/9rdQrS25jkWDT1eju+49Cvc3nuJJdMKwr16nTRVCTiySVsjI+V7Y9sYK5UWqM2Gd1BkxGsZ0Sbilkfl+ncKfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4DThzX2xnZzE0C/2kCwwkhZeKxiTyCsZtHI9S2IfEQ=;
 b=M+MpsSu/+aYBZ32RRRFBu/7zA0HrLIKYQJaJnfl45ok12jW9Oo5WR2AsHUv3lRcnuMw5OH8KnqxNB5oCXiPX0AK6ihWZpRzddOLU1aCgoCYBtd6RgSwghBYLD+rjRVcDJu61+tJVxBv5CdX9iEPo+ZU6cNJq4u4fyf3LRDlTOLBS3rhQNQfpmi/Fx+h8EV+RXIpHz5/1cNe81S7aL9IrQ6cWqTQi6WZ1OvyaTi6EaKN6NG4s+Ud0zitWoGEw8KxAjI+lyV/KM6cg1J95obMzY5ucuQbVLsYc7UgFKsHzP86WkCbetNb7RfaZalTbNvfJFYJR35yoh4z8pONmRKM4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4DThzX2xnZzE0C/2kCwwkhZeKxiTyCsZtHI9S2IfEQ=;
 b=AuKU+dAE0Y8MVf3pAp+rh9OdOkcU7byjZb7FgSLqucW1IoKlML/Nx4S1V4ap2XgCOuyHNTnMr/dqSzvS1F+2LhdyC4Q0la1lA8ULvecNEMh8gBJWEaYiNTK2e5xRCldI3LBjY6k328L/Zz1Iwoqw0fpcUPbk1ip5SzpONVLP86o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 10:18:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 10:18:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com
Subject: [PATCH v2 6/8] simplebench/bench-backup: support qcow2 source files
Date: Thu,  4 Mar 2021 13:17:36 +0300
Message-Id: <20210304101738.20248-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304101738.20248-1-vsementsov@virtuozzo.com>
References: <20210304101738.20248-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.246) by
 HE1P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:18:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 727ed0fb-4608-462a-47fa-08d8def6cae5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB386389A0476698EDFE16059EC1979@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8KSdzKfO+XJbyehGMI1+kGxofxuMPBvyiTH8H3TJrcKdNpqjo2/o79y8CJZ3KvxI5T8zYtUdevlHGIBg0VpOhsS/M1/Z4j/hBXPlvX1FvQafP1A5JL2GN5qMs8ACz6bLD+hSx3w9V5Y0lSYLNwIK59hJ3JaxB63dMG1glbx2kbhC6ANP8ajvMorL8MrTl9M1RLsipuLVaxTrGtxTMXP4laCpLpb5WkT69ZoSXyiIzx4UbJRN41VIr5tcQS1wlTfN2oJFIlU73msHgo/DpWhgy1KGdUyw//CAHFcpVLOdLbvbxGCq/NE8ciME3+Z9N7YcNWylHyTD+nu7hyZE3Xd3lPlfPefG77fZDvWvLuwCWA6S4U8WL57YQLv/i3AB6plerhhf4I0wnpFcKLhJ2QE2NEZYefbL9bIA1cR0REYTchws28jCqSo84QyUJ1qOtrj3nSBGD42fJTZo6ci1/GsgobJULOp8AoY4jGcc0tO7uAklzg5smDlxPtOwNuh3USqvtkx81DBdZHkkIJUyDb8xZ39iWp9WmowZ0XGzwb2FkbvhM1ArGJmJCVpgmzbb49Zp4NlinNllwyIVTstzxYNHcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(83380400001)(8676002)(6666004)(956004)(52116002)(186003)(1076003)(478600001)(2906002)(316002)(2616005)(6916009)(6512007)(4326008)(6506007)(36756003)(26005)(86362001)(5660300002)(66476007)(66946007)(6486002)(69590400012)(16526019)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SCe09aYld35ne6d1nYYbvZmAMiGlNFWPLRl6FEZpXtcM/VvUOYBK+4/SJLxD?=
 =?us-ascii?Q?kgmGU+tUDM8uAXiDPmbBq7KyGmqtDtzhKGjy5W42xsH+ecn82CctXjKl6/8B?=
 =?us-ascii?Q?Q3LkncThqDoK587i47u9GUi4TMh5rWUc9CQBSHfPKcPxFjsJdS5xo75ymzwF?=
 =?us-ascii?Q?nxxlkNTs6vc+Cb3+I7Ka3V9ZE24eoRy6sPkMPkN2naoUGIoRh2qCEuCIEGVm?=
 =?us-ascii?Q?GcgdqsUc89uUs4wl8sBO4xfSOMMIf9uWDpVDNiRUmPILwZ+CTQlRa5unU1xF?=
 =?us-ascii?Q?rHs8+W/HhGRWqiJaS7GLG0dgR0cEAjuH6qU0b5L/f45SgZjzQU5dUf65Ew0x?=
 =?us-ascii?Q?IOMliU43pS2LztOu0OFB4Ki/adRXI7qq2lc7UpDKHgf0jXoxTfPAhw0QL7Vd?=
 =?us-ascii?Q?FsFm3JYkAnOio5kRiXJCWWKXAMx+6hHHYFK6lKem8+fWr81ky7SRX0GSoaCq?=
 =?us-ascii?Q?3co+ckeDglHT9zjXNoZUr0NyE4llol3aBXBw6mAu50cxwo4l4ahA2vdI9NP+?=
 =?us-ascii?Q?n6umcTEFRXrf+8BGku/+XpswATjo9hBf2fdhF5bjFDND2Azn+QIG0ggwKvM2?=
 =?us-ascii?Q?8NNUqv6jRoFJKym3vn78NDwYJ6OoA0C579g3GfK5gYaXEG35FwKT8i40NMVQ?=
 =?us-ascii?Q?Bfn3hqxHTRLazp+w2jYuYEIhatISEmMH8hpMjhW4FL4+HSX2KZsydwmXYHJ6?=
 =?us-ascii?Q?htkOqz32itoOHf5SrScH0x2Lppmqk995FCyFJLDFIqnMPv0pyWZJC++wDwWu?=
 =?us-ascii?Q?ZJuz3a1EhZAigE2cb9UykMztz7Jkkcuz5hBxd9MaLMYhQhZrJp07z9EFSk7y?=
 =?us-ascii?Q?3Z1IorQug4sS/UJZH5CrIuzVzBIf9wNNGPBjww6+FyZ9lVlFQFk7yEsNZTGA?=
 =?us-ascii?Q?C5l/OWAWEdcYpVJI5N8MRdnldg1tNoKgdy7FoWUYKxKDYonQvXmrASSO1K6V?=
 =?us-ascii?Q?6oDbf6PuQJ2CuAoBaAz1AetwDGIpExfxhoXQiDiMDcDDRrQ35OtZrv5WOPty?=
 =?us-ascii?Q?qeS3hD9zKqLciDWF3/7lUsmVek9rgV5xS/r6lKwkQ+c6moxkVZkepRm6PCwr?=
 =?us-ascii?Q?nMRrUcpsxtjxks/4kRks4mmi6r2X4OoCjVdHKLo28J3bpmEr8MTaQu+iSgwx?=
 =?us-ascii?Q?daadxoA7eoje9HlBOSToGRTx+NSmpT2HT687UiMc/UZsViL3+Nxpd/7ASaU/?=
 =?us-ascii?Q?Agi/JGZr5dxXpQRHgECirz5Q+N+NJ+ha6qCC2kmPbwpczklTcUvF91DminrH?=
 =?us-ascii?Q?g4HOzcWQi4XtNOuyY9yBN9GHyW/6jzONwHJ1foUmltronkclM9eMlyHJNft7?=
 =?us-ascii?Q?YXG0v1f4kss6Grcefa8N1NN2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727ed0fb-4608-462a-47fa-08d8def6cae5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:18:02.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FM1rGdn1wkHGVOQdUOOuabqZJWQWOdBUUQQ1YjSNPx6zJOPYUOlYQphhI47wDMBVvu427i8uN3OL6zM6nbo+/wJGmsbZ+V4879O5kGDACj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.0.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Add support for qcow2 source. New option says to use test-source.qcow2
instead of test-source. Of course, test-source.qcow2 should be
precreated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/bench-backup.py    | 5 +++++
 scripts/simplebench/bench_block_job.py | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index fbc85f266f..a2120fcbf0 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -58,6 +58,8 @@ def bench(args):
 
         if src == 'nbd':
             source = nbd_drv
+        elif args.qcow2_sources:
+            source = drv_qcow2(drv_file(dirs[src] + '/test-source.qcow2'))
         else:
             source = drv_file(dirs[src] + '/test-source')
 
@@ -199,6 +201,9 @@ def __call__(self, parser, namespace, values, option_string=None):
 Use compressed backup. It automatically means
 automatically creating qcow2 target with
 lazy_refcounts for each test run''', action='store_true')
+    p.add_argument('--qcow2-sources', help='''\
+Use test-source.qcow2 images as sources instead of
+test-source raw images''', action='store_true')
     p.add_argument('--target-cache', help='''\
 Setup cache for target nodes. Options:
    direct: default, use O_DIRECT and aio=native
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 71d2e489c8..4f03c12169 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -88,6 +88,11 @@ def get_image_size(path):
     return json.loads(out)['virtual-size']
 
 
+def get_blockdev_size(obj):
+    img = obj['filename'] if 'filename' in obj else obj['file']['filename']
+    return get_image_size(img)
+
+
 # Bench backup or mirror
 def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
     """Helper to run bench_block_job() for mirror or backup"""
@@ -101,7 +106,7 @@ def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
 
         subprocess.run(['qemu-img', 'create', '-f', 'qcow2',
                         target['file']['filename'],
-                        str(get_image_size(source['filename']))],
+                        str(get_blockdev_size(source))],
                        stdout=subprocess.DEVNULL,
                        stderr=subprocess.DEVNULL, check=True)
 
-- 
2.29.2


