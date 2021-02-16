Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583AD31CEAC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:09:37 +0100 (CET)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3qy-0006QW-8d
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3Ue-0007Tm-4S; Tue, 16 Feb 2021 11:46:32 -0500
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:14830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3UY-000776-7K; Tue, 16 Feb 2021 11:46:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFCc+UM2DfkdleR3R55doe9b31cmKEPIg3JV8+0AzQEzvxL0dyKjbM7989/AgoR8dmijGuthdawGWIjED+7V7aaQHyiasdBchEz0jGBtn8wkXYXoEUAL7b1OQMWd3dkzccpIskAozJs1vd8yUswTaFbRcwlOwXTn3wuHU/iTEeel2uFt9mYf9vMHn/t/pL9l2aHfLspkrY2nxjL494iWPK2AF/WcTShiq8DykvQRChpPEQ34Uy1YyKQlwDv0dxZise5zhW8pLgXgb965bn8so6CSp7ZmWnF97s3Wl4CZ47/D26LMp08v6MPmxYW5Rg1KM0ceAo00kCm5HGbJKWNDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dusFbCOLG5HQswB3S9yxL1c96RNG13sbIfxgdSI6P6o=;
 b=RdO1LCiwZWbHY5ZvZwzWWVa4XGAL2VKJMY/cb2U53zdObmsWgPSm+BGFXq52y9pLy1d3vCWW0sYsRmjPbOisYJ3NtI67y3g0bqsg2wukqajoLu50EWWpXfRl1VuYE4BkeuqsWmedi1t6+2/E8V5NBIPTxgE0XwEiogwRwLXYR25fRI6GWtHYH+RpkAHkCYlyUav1ye5ivQ6Q5zsjt9FuSQ17xTH+mcF/R6M+8oTmhwNUt9rwjGbcX/COfhp8CSyojcyPFxwqBoCjaVwkcNK6Y1DttEKAHrDwLEhe/kwKYTAmBj6T+Y13bAlvoDzbCI3NhuKNmk27SUf2495y4iDIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dusFbCOLG5HQswB3S9yxL1c96RNG13sbIfxgdSI6P6o=;
 b=ihZWFp+hRLJInV7YVBcnrVU+pHdP/2Zyx4lEeA38Oo481tVrmy1Qdn1ENFNqNT2yoFS18OxWEb2P/KiUOghno/kHCPrVY3a/fbDFxGunaf5elmOipTTlbTKL3Cbyf2+QrpskRoRzJQQPbNDp696Tg79aHKTo42yxjqlWtybF+Ds=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6359.eurprd08.prod.outlook.com (2603:10a6:20b:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 16:45:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 16:45:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH 5/5] iotests: add parallels-read-bitmap test
Date: Tue, 16 Feb 2021 19:45:27 +0300
Message-Id: <20210216164527.37745-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216164527.37745-1-vsementsov@virtuozzo.com>
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM3PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:207:3::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.244) by
 AM3PR05CA0149.eurprd05.prod.outlook.com (2603:10a6:207:3::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 16:45:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cf0d96d-cd37-4d83-d6f2-08d8d29a4e04
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6359AE0752C6DD06A17D88E9C1879@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FObpIGp+Ewx480fGISvUfFHAjc2Pg5nDYm3mvrEqX690AMjDN8+XgOWWy51C9reg6uuUeXzlUvr8W9n/IyoL7DAPu3yzJouNWcaM66hCjuDLmeDpUKW7RfWvKWO+rHbH/GU4y5lnWC+diixhOJBru6rpHo5OKDH3FaRKgmiHZ+lFfhPzdJ+EzVMyBodMbwwkw+SFAmwO8CoqVRoRz1DrVnM3rdF0v18CAb3+zF9MH1CAAm2KJhrUYZGrc8Vpxx9LA3+n/KrkNgXTJqqgr/Trot6O83IGTULHL7xoCF65kxzR9N3DKuHddBrxxs3p2yCv4s5nj1Oa4omGj0gEWDqBCQXJw7Dznxh+EJfjcavdKJVAen0YIsnUBaHQP3RlQrAMK+HOS3JLGuDBhtmdVDK+oiNGnY7mN5WHJoJPNbeDJbeiDeQFI+eMUwsdih31CzKs0LifbVNlVzq+InF3h27lg8PFjp2JZkVxq3fUukwYfkt+YCZlCExSrY7mKR1VjV/PbiSCJCnxYPOc+yr6LRIm3Tyyz2l6fyc1lJm5Slkr4Fp3WlrGv0ldTRqfMjcWjyc8NaXLwXH2/io7V7gqp+hrIzGRLe+Dde711D0h1FymNJh/EX3e7CO/Cq7GA8Zdc6vGfmWtR1r1ELU+wa9JeCFyFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(8936002)(956004)(316002)(36756003)(26005)(8676002)(2616005)(5660300002)(1076003)(66946007)(66556008)(86362001)(52116002)(6512007)(186003)(2906002)(6486002)(6506007)(4326008)(16526019)(66476007)(6666004)(6916009)(478600001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m07qMjXimTr6cK/SpXt0CothjpD15SahYiFMXALKs6NGf5PsG5BuBkdEsahj?=
 =?us-ascii?Q?RWQxOhISM3+z4J2Dfvfuhb9BGoWX7Xt0s0S4Y7PJESAL23Fsb6g24f/HnDlY?=
 =?us-ascii?Q?j+bcShC4GA+LKCX2m5ZjWSD0o5SAqAC7fHhs7/27+GMLuFe8YOYHnj1PdleX?=
 =?us-ascii?Q?qU2IYMzr4WFdfDirmaBCq35XPrB1zieYPdXAfJXoJ9L4peONE5REkuzIWESv?=
 =?us-ascii?Q?BcX8MMrVUJ8I5G8b6StbvP/DaG4n72Ky9n7EL8WfKeMktKxxS9F7uf8w6Uvf?=
 =?us-ascii?Q?0x4qd2G6oqwiSDL2ltEN0jHOqqca0CEuug0IMS/UaaP21WU5jXT0+2VR7L99?=
 =?us-ascii?Q?TmJHpgP8NrJJoTtKY9EkpatD++C0Ng/svlLE0oz5f6B/n06XSs/oUG6zk7EV?=
 =?us-ascii?Q?10/uBZceU4N7ORQTzwjtsEAtFWeZBhzdY1vdEAGfI+Cs3XJSqcg5ZVpRIbwp?=
 =?us-ascii?Q?QJtc9y11VvwIKLnDSm0WfHanuqgrUxvQBp44CeI5fuWHuDZIbhRlp6UPnAf5?=
 =?us-ascii?Q?7U7KF+79g184CcZwpecHPkfESZtWvBbM0oWo3tAVnHbtxLOlftlvWR/XNm2x?=
 =?us-ascii?Q?stCQ4wxQLyBMKsG72tuuJgYyF0b8mhiq9R1zc6RDhZHRKlB0c8sHWCBzzSYh?=
 =?us-ascii?Q?IjZX7tTCBbv8zIhAfOYXSwmHioPGmP/n9auXmTo6lIS1+CiH+ORpKt7b0U9H?=
 =?us-ascii?Q?ZraGJ/0wdCRLFAmi+aOkvWXEKiMeKyRosGDtOoIfTD3D4IsRDmHum9N+T6vp?=
 =?us-ascii?Q?E0ZAkYMEkuQNsoGhgct2DZrBFPDdHHS7wHxX46dgUy2dc0nmDC6C7uKgijDX?=
 =?us-ascii?Q?1G0sXWMAfnb4BEPPKRGFRQQm6QirfZbAgm8ctw/4KcjknEZvY2afsMsbTPck?=
 =?us-ascii?Q?LrWiNQCzsuqxEgK/BbEgXjKN/CZtwELplhVOZZq41dXFrpXwElcEB2eChQxX?=
 =?us-ascii?Q?DE/QkzrxEwm4h+w2prrj1sYUt5gzElTIQSIQLvHz3TxEivIFnaeCsVkTIsK0?=
 =?us-ascii?Q?3v630naw0k6hmTB/tkegOYTDrWblzRqSx8cMzfagwnJPlHpSJ1gX83EV2SPB?=
 =?us-ascii?Q?brRio1riSqncXh7dORN5LAquxCtknG7p6I2GooULk2o8axdgzopeqHTd5MJt?=
 =?us-ascii?Q?vxkCBFjR12QBhqanJjuzedAcTceB0IbXxgRB5A3lTlK/sBUEjAb4/9Wi0Z74?=
 =?us-ascii?Q?USGqMI6Z9pmKK5QB/ZduMixXwKGwlQ2pQ48+YObuAY8XSRvtyujOJF2lSprO?=
 =?us-ascii?Q?cGcI/NyBWgXR0I/de4qxDuXm2fEBnCNqaN9rSMPIyYfE2VaL4dHGBDzHqG9R?=
 =?us-ascii?Q?4wXVE2Hho1f3DnhTnIB4haYU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf0d96d-cd37-4d83-d6f2-08d8d29a4e04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 16:45:45.0364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFf9jrgSpAyBvdIm8VBAvuoNJXA7D8uq4hHv/tih68oR2RcI+5LefFePpNe3GLKf0MFpejDsTGvQ4rTv8L6zwJ0QPaHlrOB79A7oqbGObEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6359
Received-SPF: pass client-ip=40.107.6.108;
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

Test support for reading bitmap from parallels image format.
parallels-with-bitmap.bz2 is generated on Virtuozzo by
parallels-with-bitmap.sh

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
 .../sample_images/parallels-with-bitmap.sh    |  33 ++++++++++
 .../qemu-iotests/tests/parallels-read-bitmap  |  57 ++++++++++++++++++
 .../tests/parallels-read-bitmap.out           |   6 ++
 4 files changed, 96 insertions(+)
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
index 0000000000..e4a1d71277
--- /dev/null
+++ b/tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
@@ -0,0 +1,33 @@
+#!/bin/bash
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
index 0000000000..b50b79f509
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-read-bitmap
@@ -0,0 +1,57 @@
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
+iotests.unarchive_sample_image('parallels-with-bitmap', '/work/mega')
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


