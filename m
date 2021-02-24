Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D20323ADC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:54:51 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErog-0006jY-MW
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhp-00077R-MA; Wed, 24 Feb 2021 05:47:45 -0500
Received: from mail-eopbgr80124.outbound.protection.outlook.com
 ([40.107.8.124]:36517 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhn-0007Jd-7b; Wed, 24 Feb 2021 05:47:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1gZUlbEcsyXyVeWV1Q3nx3WFxpz6kb9L5deeCH/S2v+qyOXHG+jkf+9bV4m7O/uHfYp8ScouiMqBwn4/rWH/MlUNlkPe6PqYLX7vPMr4eqqQl6uvNVfIz4v+Jk2O4lEUrjv3MFTtUi/xJZbxrP6onz3n1KVQKgYqzIT4xn1JPD9AvDWAcgo2ilVkn0o0TcA5BL3O3Y4j3XgxYrOvbxzQdPSD5jPdjcw8DtkNL+47Mwo0PB5IFLRUXfL7Zf4f4MV6zJnLcKrBDKaWYgYXB+cSRqwcDhE3W/ZlT51TdCZVIlW01Xj4rLEjIkKDLSmRNe1OnTlLafDcMis8i1xMsFphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PP9Ewt1deV7hDO7UMcSOSL1B3xxcrqQdxPF4QSzhCY=;
 b=kzeTY0W3nHLKz4OduqWi+Jbl0eWoq0PfSfeqpzsf4UgLMTKC2KnyjsD7sq4ihFklHdwNWOCIJC+9NXKQyFeE04IFOwQIV7/UT91oNCSq5qa0z/o+uui7mmqSGkYVhoe5xCV33RDlZ+7mpM1HJadZXOUXeNtsv2ymCe6OWRhUT9P7KOqsIM+RaVy+o+ryMt9wQG28NzWbjNgG/pFgf6d7Uj9+OMAkh2K2pf2UsUqywGP0TtSClm0gb2Uxai5GG0t+poIZHoV0Yw0+uKcFCfY/DYi5mqAxiLlEoClPB1qKIBzRdoXR6z/3Anubb7cNE48UQmL0facw+2gqF8YOrt9pfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PP9Ewt1deV7hDO7UMcSOSL1B3xxcrqQdxPF4QSzhCY=;
 b=tanDH1oswcnlmdBVJJqd4LVXi33yiByzBFmmzy49okJ2IL8mBJIeDVup+f566uxrBUtMN+CVic8RYsNTiilJOq5jZhioW+mXRuXrDKiB4xoDy/xPW3sjmtjSyIXEqKz4Mb6vQRNaeXfmN23uYSCpiWt2oK2PeDafEO1l1wgAPWg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 10:47:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 10:47:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 6/6] iotests: add parallels-read-bitmap test
Date: Wed, 24 Feb 2021 13:47:07 +0300
Message-Id: <20210224104707.88430-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: HE1PR05CA0177.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.244) by
 HE1PR05CA0177.eurprd05.prod.outlook.com (2603:10a6:3:f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:47:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 434acfb2-9bd2-4fdf-ef21-08d8d8b19715
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951B2DEB70E02A8646D85BFC19F9@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +peFpWMrxaTlQ9OfIYJJiBpReXHguwYk78O2zr7T2p+3vAD2ZYpqGrXWj0ZW0oEW0h/WJveA0PupB/MvHCEdklwCqtaXTEL5lA3mQ/EziEOiYUVQ7b/+YqVkeiFQZsi7/inltc8tn/iMiIJK9oXjASj0cM4a3Z9+lX2BX9rJnIe9e41NxqR4J9zq40D8Bh/sw+xSCPVGjiWQGOYbf1+imfumcFAIKbrx93ykqXGpaWIAURowPYkxen7wULcuQhiZeNRfg7Q4KzNStS+bgdBDXZmjEcvjWEimVrSU0+5367eYUcV4/gfACQhGM/kinOttJLSC50S+LspQXmYAiGAetzrRvub7SAurbkOoxK6YIEXDxv3BQFOFSRQ6SS4L2r85PiDICV9ZsXEoa200fnZtpKjsEcsJPVicdXVCcze72K6zvp9wxVdZKwpkwUyqLL7hNPD7jm8jAQAm8svkcFRPn4/uKp1+RzPGmSgoqt17fJs1L4MEfaaCulC6UDjmqcaKWb550YP8lPDb4NV5+LOYPqURB+PtgBJpYywHQQNbsMTkN8LyBnOHzrQj3CzvQQwJ1PkZOa5gAyNMQoaB5BWhqAqY4zXywy8ATneMefMPrOB8pfIQRrFvXGTyfoPxikNTWRisCvREenaO3WVec6VUKXCMaEd1sNcqOIhBctC8E/DjhphuoFbRdnpUmFGk/bFg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(366004)(396003)(186003)(956004)(2616005)(36756003)(66946007)(2906002)(8936002)(6916009)(26005)(8676002)(16526019)(5660300002)(316002)(52116002)(6506007)(86362001)(4326008)(6512007)(478600001)(6486002)(1076003)(66556008)(69590400012)(66476007)(6666004)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f4zHHrY1iq4Kl8rPyXySewaia6vg+Lg0NGIj/ez+LgVZMhetvzUe5BvClt09?=
 =?us-ascii?Q?fblhGil7LUgauWFZpzstyl4vu3JmOzypCT1hKde4tFo/gbtW2hKQVQrKyyY3?=
 =?us-ascii?Q?t62IYBgh5Dsc/Ib0JdWNPY1MzbfeXQ8wNidrM2VnGZdQvjCQkxkYv/Imm+gp?=
 =?us-ascii?Q?GIBog6VVQjIupoQgCYtgHr276xF2aMiPG7QAT4to7zLn6OrCRY6wUGvuFNxe?=
 =?us-ascii?Q?/Bm4WJ6k7BImSUXTOTenMntiEtnai2LTYRW9/RRpZXMqmatNbJ9DzazFoB7j?=
 =?us-ascii?Q?rd4Yfizk1vh09T41U3W5VHY41QLC/M5/fge7c24+Oy9fB5zNoawlgJuM/RPf?=
 =?us-ascii?Q?ihYQiIR0GFvgIT7ImakzzqKu37JwW5UnXddQykDtV2JllCwhTAzAQxAnqfGI?=
 =?us-ascii?Q?7IafkBkXOH/GETj4LA+kc3D+rz8uql97d59IKCsUt89j3cQqaUgVHxfEZkIO?=
 =?us-ascii?Q?rI9SxBZfIe/9GiXyusyvZI4xfKfbRYPVVJK8wv9uKOKfqUjnurzFNHSxIjPM?=
 =?us-ascii?Q?frUen3qtX6O4XKxrSmx3ZUFYrIl8I1IzOamMtDObnh4gErTWaicnefkCRHTD?=
 =?us-ascii?Q?BGppqPHeGBOlddyhFWmmfszdCZuW2tfVXvTrksiXpC5suyEhh4mYricB9ptq?=
 =?us-ascii?Q?/DZZqRK5GyoDKkWblBY8MqUMhYy0DbbYT5zdeprLZfOyG9mNbZomYX9bLTnq?=
 =?us-ascii?Q?Evl2Wdvrby4Wp38iernThcaNc7lMfIl1ndtqbZgQJOLmod1WgzYMuNZZVxWB?=
 =?us-ascii?Q?PcrcQN3Mc5UZl4VdekaImJReXvZN4pQpayVrWgB6AuMReHwRaFuxRej4ACnF?=
 =?us-ascii?Q?KRLBCTAkYmwotFIRprUYi/UVkaUWHouyxfxCB3cWp79MiOIJwJEFabea1iQB?=
 =?us-ascii?Q?DGJxcjZ78kfeT/IWDvlOO73yGHqKPqLXcv8avQGEa0kAshts0zGZbiAfIkYE?=
 =?us-ascii?Q?QMKU9V+7CyAdBbvRduQSE1hXqlqEWO0pex7SDH4lpJVRmfetHovnZC/Q6fzE?=
 =?us-ascii?Q?ShXm4WqEMrcpQ2WHwY9xFXArd7A3UaSwhNZLBwRwo/znPpzG+AF4AA6b/zgv?=
 =?us-ascii?Q?077GUJM2xViTp7OfxPhm04CCuXr3MuzxKN/fhJzvUfE5Jw2p4235DxhE1AGj?=
 =?us-ascii?Q?UR9n1WllBtbSOttmfyfvXhov1825i7ZanwDvaqxAJVNWZbr48w9+5xJFEcMo?=
 =?us-ascii?Q?XTdITD80/HPP4+mBsKaKE9jyKvB6JNL0KHrt1WNKz4Gsq+mBm1Znhmp/9BBq?=
 =?us-ascii?Q?rtmfnUOIH7htJlC0iwSNobLsqoDp0zKaf6wNZ0NX0lcPeDOeOTg10A2sR9rO?=
 =?us-ascii?Q?rhc2ovUmqt5EJU1OOTzeqWvO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434acfb2-9bd2-4fdf-ef21-08d8d8b19715
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:47:33.1679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIHTHfVq2cZ58pW0qt5aI4pSyCF18rHPUq/t7g2iARm93Vhy19CVfuWw/ap7PFBbZYl03EU8t2qEyIyWfxkYPCssfijjzK8ASi100tm8jFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Test support for reading bitmap from parallels image format.
parallels-with-bitmap.bz2 is generated on Virtuozzo by
parallels-with-bitmap.sh

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
 .../sample_images/parallels-with-bitmap.sh    |  51 ++++++++++++++++
 .../qemu-iotests/tests/parallels-read-bitmap  |  55 ++++++++++++++++++
 .../tests/parallels-read-bitmap.out           |   6 ++
 4 files changed, 112 insertions(+)
 create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
 create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
 create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
 create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out

diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2 b/tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..54892fd4d01bf743d395bd4f3d896494146ab5a9
GIT binary patch
literal 203
zcmV;+05tzXT4*^jL0KkKS@=;0bpT+Hf7|^?Km<xfFyKQJ7=Y^F-%vt;00~Ysa6|-=
zk&7Szk`SoS002EkfMftPG<ipnsiCK}K_sNmm}me3FiZr%Oaf_u5F8kD;mB_~cxD-r
z5P$(X{&Tq5C`<xK02D?NNdN+t$~z$m00O|zFh^ynq*yaCtkn+NZzWom<#OEoF`?zb
zv(i3x^K~wt!aLPcRBP+PckUsIh6*LgjYSh0`}#7hMC9NR5D)+W0d&8Mxgwk>NPH-R
Fx`3oHQ9u9y

literal 0
HcmV?d00001

diff --git a/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
new file mode 100755
index 0000000000..30615aa6bd
--- /dev/null
+++ b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+#
+# Test parallels load bitmap
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+CT=parallels-with-bitmap-ct
+DIR=$PWD/parallels-with-bitmap-dir
+IMG=$DIR/root.hds
+XML=$DIR/DiskDescriptor.xml
+TARGET=parallels-with-bitmap.bz2
+
+rm -rf $DIR
+
+prlctl create $CT --vmtype ct
+prlctl set $CT --device-add hdd --image $DIR --recreate --size 2G
+
+# cleanup the image
+qemu-img create -f parallels $IMG 64G
+
+# create bitmap
+prlctl backup $CT
+
+prlctl set $CT --device-del hdd1
+prlctl destroy $CT
+
+dev=$(ploop mount $XML | sed -n 's/^Adding delta dev=\(\/dev\/ploop[0-9]\+\).*/\1/p')
+dd if=/dev/zero of=$dev bs=64K seek=5 count=2 oflag=direct
+dd if=/dev/zero of=$dev bs=64K seek=30 count=1 oflag=direct
+dd if=/dev/zero of=$dev bs=64K seek=10 count=3 oflag=direct
+ploop umount $XML  # bitmap name will be in the output
+
+bzip2 -z $IMG
+
+mv $IMG.bz2 $TARGET
+
+rm -rf $DIR
diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap b/tests/qemu-iotests/tests/parallels-read-bitmap
new file mode 100755
index 0000000000..af6b9c5db3
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-read-bitmap
@@ -0,0 +1,55 @@
+#!/usr/bin/env python3
+#
+# Test parallels load bitmap
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import json
+import iotests
+from iotests import qemu_nbd_popen, qemu_img_pipe, log, file_path
+
+iotests.script_initialize(supported_fmts=['parallels'])
+
+nbd_sock = file_path('nbd-sock', base_dir=iotests.sock_dir)
+disk = iotests.file_path('disk')
+bitmap = 'e4f2eed0-37fe-4539-b50b-85d2e7fd235f'
+nbd_opts = f'driver=nbd,server.type=unix,server.path={nbd_sock}' \
+        f',x-dirty-bitmap=qemu:dirty-bitmap:{bitmap}'
+
+
+iotests.unarchive_sample_image('parallels-with-bitmap', disk)
+
+
+with qemu_nbd_popen('--read-only', f'--socket={nbd_sock}',
+                    f'--bitmap={bitmap}', '-f', iotests.imgfmt, disk):
+    out = qemu_img_pipe('map', '--output=json', '--image-opts', nbd_opts)
+    chunks = json.loads(out)
+    cluster = 64 * 1024
+
+    log('dirty clusters (cluster size is 64K):')
+    for c in chunks:
+        assert c['start'] % cluster == 0
+        assert c['length'] % cluster == 0
+        if c['data']:
+            continue
+
+        a = c['start'] // cluster
+        b = (c['start'] + c['length']) // cluster
+        if b - a > 1:
+            log(f'{a}-{b-1}')
+        else:
+            log(a)
diff --git a/tests/qemu-iotests/tests/parallels-read-bitmap.out b/tests/qemu-iotests/tests/parallels-read-bitmap.out
new file mode 100644
index 0000000000..e8f6bc9e96
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-read-bitmap.out
@@ -0,0 +1,6 @@
+Start NBD server
+dirty clusters (cluster size is 64K):
+5-6
+10-12
+30
+Kill NBD server
-- 
2.29.2


