Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7FA3BBA23
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:25:29 +0200 (CEST)
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kr2-000425-76
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiC-0002Kk-Hu; Mon, 05 Jul 2021 05:16:20 -0400
Received: from mail-eopbgr40109.outbound.protection.outlook.com
 ([40.107.4.109]:55110 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiA-0007tK-Io; Mon, 05 Jul 2021 05:16:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aM8utCXj5KxaO06h9A12BEW5cggtwEtbsPG+uAPDaGFWCXzv0cNccBCq8n+gUSKRUrtbTz6gsEI6S/s7rZJuUFKEZXckC+AKGy/2RxjM5EUo7dIE3hPO3cYjfumpc3fpBFx3IN8iWDibl76atrLLN88ibyGcIEHO3qGx7lpqF9J2HOSdtvLg1Gvy0rzwOdpnSSQOMyTNCjqz9DrpPmQU1Z9x7cNzCWrNjlz9QQMb8CsaZ6Jrrgsnnp0ibeg2P+41x5RQ1XcpRaUt/U2KI0Vej1HnwbkHEpOeIEn2QH3Vrk3XBXD4sO/tBrrcy/XX6yq5/Ci2Nlj2emltYafnFb4msw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GloUs7NER2I2fTIY3RgPX+Z/nh6DWXu6oQL5TK/w1J4=;
 b=fixgoUlqg4jR7XwKUNFqMDRbPV1C9nrm0K8rsw8FDe3gnHaTDO7DWYu4VwJI/krrhhzp8uM0d7ASL8oUSQN70bAvpUsYxBwTFEVXu+99ThB+7Mxs7OxdyCH8VCSTTPdAXWvFhvV8vAEh/s5/QZ70/fN8Rrt1SZ+uqy69PWYwhKWWTy6t3RaSNxs61KJGo9AsQblyIhTC7D8rzIES8a4MYCVDc3mbImABWK49XKFFYhBldULUryL9h6tH7JaiQtaFuABMhHosac4NiTbR+J69PT91/aFA5gD47+ED2umvdtSlGh84Xv26Gy72cDQJAcbzvetXEmwdVaSw1szHVemFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GloUs7NER2I2fTIY3RgPX+Z/nh6DWXu6oQL5TK/w1J4=;
 b=YC+hXXEufGFUkd8p6ik3//y4A75XT1kwyuMIsYGJPvpe74/ln6RHU6fH1Q3esU+zov+COkMo2ShEBeHjjMZYm7MfvAtqJMogYlP6g+1is+w3OcG31G75SNstFJNgv5sz0fdKJ5ltLsJnsdrgjQwGS+KbEXb0I38T3mL9wfA89X4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 03/14] iotest 303: explicit compression type
Date: Mon,  5 Jul 2021 12:15:38 +0300
Message-Id: <20210705091549.178335-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81c6ae9f-38f0-4afe-710d-08d93f9585a7
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171460F89361000DDCB0B469C11C9@AM5PR0801MB1714.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTOV3IZulAZM+jh0yVCraUaFSZtA2O4cUg6UBUJMTP9MxNKJ2RR7Q/PDpJAJLaDxFQO5xNyyaMKW+cPYtJpgRQf0Wx23VoLG/MJQ/Mx7DupzayF5I1mOtl1tKyQUWFQypXrDxSBuYb3vyMuxZw/pSoR+Ol5zY9ed2b0yy58+rTaKfxAhPVbVV6fnGaiaFIxTme4k9gjI66ZGl8nn1n9veSA6CeTya7OBRhu6F3HKksYZrGLz7JF8lSapsZIq5IyPvYF6E0v5XfddNsVXHyL/1yCkw2mGIR36T27VXkiwXNXC3ITWNmWVb56M3td8e8VchvVRXt5eeZ6ANCxODs61XdJm7Mna6ATwSkfQEyCE0aKxI2xAnZaMNMCm+CWqLhs+BVheelfsa4R0PqcaiCsP9T7NIj4yk6w9NHy1Bydqmz/lYJzbi3kHcVcaUOiHLJfxKDGJc/FecdJTpLlvAw/CTBIiOjG5BH4EXnQV9DAB1tnWDOAgtlyBXK8fZU/Q3E4L6JuB50c90PRGRI26yWBqy89j3OXoDv3W9IU7k8ZPeCj+tIkPhVRN3r9fdgYyOmTGKp6yVubX/Ms8vM0JQBrNFcVJs9iNAvPbZ3+tdBe7CWQMfd03Hlq3drurwDfJCxj46fdF90/u40Fua3SuIT51nCH0DoVND1RoK+aaWlNRfpTKWzAqzk3XUg2sXHI2nyjDerm9PYsq4ZI6bceTmEaF/HV8+vwgf93VArh8fqcs52HhlhSk4Bq+C33AaOyn5NMqtGl/zpIR4O7Ijm9ESomkag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39830400003)(366004)(346002)(376002)(16526019)(186003)(8676002)(5660300002)(8936002)(1076003)(36756003)(956004)(2616005)(83380400001)(38100700002)(316002)(6486002)(52116002)(478600001)(66476007)(6916009)(26005)(66946007)(38350700002)(66556008)(4326008)(2906002)(86362001)(6512007)(6666004)(6506007)(69590400013)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VOi0kFIYEEAwFH6qfokJXRwJ/m8fSXcjklyb6hPGCStHKq+gKdoRcmOjIC9r?=
 =?us-ascii?Q?Ghxtt6m3fRgNYjTFNjcHzn/o1bgoZbPc9ctIYjB0XoGWaYAjYLHnFqQrG2vE?=
 =?us-ascii?Q?IiGnr5I1XilKpI4V2XkreRilEwQBBMIAk5sKBhPkpsJB4KAv6HMTG2oVWhDj?=
 =?us-ascii?Q?sSN8QIitCluFRkv21GCP50XG7sXcRVlf2sxZ/RmSXWfscdzIDh8sVXRghFQk?=
 =?us-ascii?Q?ReXs4kYHxLtjylBNIwVSUOxWMTapFFFLSvAig/V8yCxDIZM8l6nbFCnLrEtf?=
 =?us-ascii?Q?JiPuYo1BJe3T8Ql1RJGgBkD4DsHmSFTSIOZClYzIMeSohNaI0y89WXF3/SYe?=
 =?us-ascii?Q?4jGqVkJWo2Z7a7cRmWWeOWTWN3xLVOqVgfKbTJlIBAFBc2C9GlNgJIO9PtFr?=
 =?us-ascii?Q?hXQunMDWMjc9V9YfNEY+MR0cffL1wrO8wYc+0YdJlGvt+v0QmvD5rT8fzLgW?=
 =?us-ascii?Q?7+r7xd7IeazvYBwPEqNbudAZKAojM2rgBbUTl2yzppr1yXBpgbVN1l/I7s5r?=
 =?us-ascii?Q?gxWtpqZyqttm5iV3dEv8um6jMclgFMhjhPMKtGV0iZ+fbTTq1lMje0KOAQzd?=
 =?us-ascii?Q?BrVY6/lsf8NacjFu5SdyogzMERiHyDe1o6QkvNeNLv4nXTuZMx9NY5y500z+?=
 =?us-ascii?Q?5HfTDXSRyhIT7lMXbeZ1ox+Vg+q2W9athl8580V2rovqzwJX+vWFPMRnF1mH?=
 =?us-ascii?Q?y5XkgSuaYOSR3aO1IbO2L7L7E2DvtMia9mAyFmLIo8pI7pUt+pd8eGKHgUIT?=
 =?us-ascii?Q?808rkEu13k4bMCdLecoJZ2IRE8HRA1CdVxU53X5WGXSTzW5nKDgXyoehawwl?=
 =?us-ascii?Q?Ts+v+MtKBkXO+3znmktpqygCRObn3uLPo16TJUyDURquDJep8+ONF6iiB5Bo?=
 =?us-ascii?Q?F1ynJ8z2dIm+iCMQIAKa5rpGK42A+vruc6PzRg0hcvy6Ib/lBMwO8lpFoxUi?=
 =?us-ascii?Q?anmowPAiEmz7TOlbq1H+jO20vnOLDZ96FfFBqYFC3/Z70nDt9n01v6Ygkofg?=
 =?us-ascii?Q?7V5+WdDd6/NV8CAj6xBnttF1gHcAFkhEHgrNHvHb6B7nRs9+4WoPreGfLp0W?=
 =?us-ascii?Q?1Qnef2CLKxR7dxfpktmCvxj0oj8aTl8V0fQRhhTlBIKauDZnGIaFVpygBNuU?=
 =?us-ascii?Q?3zi74m0tHnYED9FFoYZI5/sMozWQcffadriAzbgC/8npMTz9EVmSlGx2Nciv?=
 =?us-ascii?Q?qyQeUdZpoOnb3IKxzZ5CQS/M2s28KSNOG3aKgMFxq68DtvUmhIR4xaGocQo5?=
 =?us-ascii?Q?M3o/Mi+zzmYw58CE8joOcv46rSeuv4PPWl317pSSwUDBGz+KC6uffe7Sn2Y/?=
 =?us-ascii?Q?mdC09EWxYi9Bxwot/5IwptgU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c6ae9f-38f0-4afe-710d-08d93f9585a7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:07.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLdVshmnyVmFcqn8TCzOkZVYf6UXfv/f1EwRn7Frp5VysYbGrFTGKXa++KtikARU7OsQShWfYGrc8qSYOvCqdeihBSPCUWlseUCWifD+qkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
Received-SPF: pass client-ip=40.107.4.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

The test prints qcow2 header fields which depends on chosen compression
type. So, let's be explicit in what compression type we want and
independent of IMGOPTS. Test both existing compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


