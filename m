Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13436C4E5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:17:31 +0200 (CEST)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLib-00037d-Gi
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbLdA-00088U-Bz; Tue, 27 Apr 2021 07:11:52 -0400
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:25817 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbLd8-00069e-DP; Tue, 27 Apr 2021 07:11:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxKfrjuglAk5rW0/4aFtP0skG0MpBMgkJcM1RjbE6PgpMcnQiNq8qUXwWlakKQYlQmsZ1/hMoIn2MtI/gRqW0Iyd10eGFjBmg+mwqy7Uj+kAm8oXrm1yLY4dyl7yHbVp0hWpVNJIWHJZbn8vrIjsmJnSvJEzmW/vhS8Bh/HlRWZCODvqgMOEFh/rY9lM9WqVTrEwpyRjFu8nyJ1Ai/B4HmaLKocADcAqFHCCF+J4TAk/jABRC3jksDgxr7aPp5VeE5Y16X8FbfHGi7Kq6G5YcFrbc7OqXJ9iy/3fj/VJ6//gdwdF1dH9solNoMm9CCE88i8/hj+iOQz7VAyl44TpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJRZlkZMAJ/EVPk7p71MxFPSZJ/YyKqyZCTNX0VNKlU=;
 b=UgdWqUSAEu4gxSQIfEhJOJlqXP1CQJ5jJnn9hw+XTx3EGUPaHPBSdpvew3nWZbnIksT37kud20vyWDoEDcEKfBHkBZdBjLlYuk6B3B+vyhCgAToS1uO+fUuGMKBaQZFP69ZgjRrekS4LAXSUEfszAF76Dy4JkyIzJjvax1OzuGriqPKRbJphk+gfucW7H/WbfYrkyv1Pjof6xs8Qc4DQg/wYFzxQGQn1nwx6RZuZ8W08WJjJ/iV/jUOPffagoYZMdGfVUsaFpIo2+/iSeJt6BqVAogo9QAtxCpg+Dp5EzHzDnPsyHmXTN4KK6NohFfOs/WUFT55OMgq0x9qjbbITsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJRZlkZMAJ/EVPk7p71MxFPSZJ/YyKqyZCTNX0VNKlU=;
 b=L0PhhDRqJ01RLDXvrtO9Ry0mOPZuTpLxjaO9oZ82HSU6FfBWIwgODOGeJPc0sgzUXXtRrTFr4RiB569L5lspaBlQnKL80NgNnhsC5mxvMPhkkdWZ2ZFUfszNbVTcUXtwy1Ba3nC4kOZYQh6YTcpAxeHsm/UbG0HxcZu8RPuu4pE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 11:11:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 11:11:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, pkrempa@redhat.com, nshirokovskiy@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 2/2] iotests: add allocation-map-to-bitmap
Date: Tue, 27 Apr 2021 14:11:26 +0300
Message-Id: <20210427111126.84307-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210427111126.84307-1-vsementsov@virtuozzo.com>
References: <20210427111126.84307-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0402CA0038.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0402CA0038.eurprd04.prod.outlook.com (2603:10a6:7:7c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Tue, 27 Apr 2021 11:11:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d72de22f-de57-4044-8a0e-08d9096d3c9d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38634AEDF708C14EA0E80225C1419@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9FHN4Hr3AeiQfBfZ8Z/0ebeSXPm8TQNWh920dgS+eEOwcpHFMdxMDpSEhSnSW5eTI2sPQMWYHl1En/DaiJf8TkET4KTRK7bqr771lhR14BXr0lueHVpf//bwGYURnHdqGddXXFCCCCGqNoJHOvh312OuI8d7araHqggU4YHgYANU80ki/ilozVOKsYQ3pFaRjTwI+zMS9N6NySDFqfC5ahLBPhDZmHYq/Fh1z+Y1Zh8RCq/nIOYhpn9M5kSWgKSDflg3MKROLnXWtxbvprhKZzCHoUBU5B/Hbk0YOkp37F4nm0wTV4kQXTmJlP0fMoT43538he0apA17NHA4I0UWqyib5+qCmSQBn8moPOeLd18AFNe5eA1b9Lu71uH1cA7Z9OjJc+eT6lOxzuWh6Q/zNGPb4dbyEv2jTiy4Ue+Kr7H29HvvEwxysQUr01rX3z+1VV0fihKy6W6GEgjMPNAKUe/m/2Cgn903GtbbDi2X32+bsGNQMK8jV+6y3pHK313Us4vr7fRBCEGRYU2xIEJTM1cKh/ETUtNlnQTnZtyj3sbf1q/JGQs2Mw0r4VsZfV4IVFDEKjicsbn2viB+nRRBIGE/qpySJtKAnBX+OwkS7leRcLr0hKnXhjWUkNAEKo921dILSJYuIPoVFa0Wr/qZjJ+YNzV7cfPHhrAgiweupcO9k3uom7Ysqchj3Fdxlj8cbWdsBahn+k2eeCc4YG1OjYNFKJT4a2Y4kOdFwhLpBZxDFKxsnH57gb6Dq35cn1GlGrC3YJ2VlajBrGGeFGP/DKPYO6c72+sPlDu2KfnIZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(346002)(136003)(376002)(38100700002)(38350700002)(4326008)(66556008)(1076003)(6506007)(66476007)(36756003)(5660300002)(6916009)(478600001)(6666004)(107886003)(6486002)(52116002)(8676002)(66946007)(86362001)(8936002)(16526019)(186003)(26005)(956004)(2616005)(2906002)(83380400001)(6512007)(316002)(69590400013)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oeTHNtb6zQVaNRvlS8KyzqmDBY3ETVsZ5taOR7Q7zBsJfqF0R0/YFJTmKc6d?=
 =?us-ascii?Q?O0yaJsHnnfobZhvzH6e+ewOdXqqQOZjpXuvAST7g3sfzVNVKeTvsUbps61+t?=
 =?us-ascii?Q?wjogSeASBSdE8QojiJo5NLgcp9o5JaG1Ncum95PNEhuXND+0Vrrp1kAdyWFd?=
 =?us-ascii?Q?0JR2dWKppbCchm5ucPbBJux0qTTrImwI0wC5Zsavt4iDAehwD8aPmFhIj/vl?=
 =?us-ascii?Q?kR99Zrx25UKoGmQGPNJHsIJJc4H3WWbNLbCjZWkjikuy69gehWXryHlPU27T?=
 =?us-ascii?Q?b6hpsshEXsdp+qSMJL2ov3OH87lRDj2/lISiFe39bR3HAIlxu9arn62vytv2?=
 =?us-ascii?Q?nIicWQDMPHM3ziDlnfxlnUSzivj83fcIkeFGkVNtUsjBW6pRKTdWjKDIaKl1?=
 =?us-ascii?Q?F6TjrDIEH0/NDoFOVeQm6I+5MeWvgfhPOcOMCzb8tJjDh3vm9wKzQwEa06Cu?=
 =?us-ascii?Q?YAgkzbm+mMzZ7O2s6jrxWHXmXJGnmC0cBanxOm8fysGYYoSH+7ir1Co992xu?=
 =?us-ascii?Q?LWQ3kpZ63WRHz95QxFH7QhvkM3EowzB/KVNLvCUPdVBKfe9EDDCxyD92HjRm?=
 =?us-ascii?Q?179Gx6sBJwnEmj7/gGCSzgaA/mLfN4ZTGUmcM0QhDMm/QnQ/tzW5Luaq9o5P?=
 =?us-ascii?Q?JlpTHTNiPKNdintD1IedxqagmjNi50oxpFF+OKZtNJUS8WSPz2D+GRk7eFkd?=
 =?us-ascii?Q?7j8P0bOvwoJ8ww+uxh4xYdVbU9JLOU1CzJTatq8pNp32fpP03fKnlP/CoWjO?=
 =?us-ascii?Q?y4GIptO2ZlxHplj/732F12x+h09sDDxtW18/Ts1GjMnpAkwzggSm6Z6pDaAn?=
 =?us-ascii?Q?0fOvk0ftoh7T5biIwVr8O7Ob7k0jQE3PsElY9oqsPNjyImtvMSTVYqB7Q1Of?=
 =?us-ascii?Q?6NzQRZb0cwvaUKJcgKTfEaZhExK3SvcfxoSuXNm97WRtAFbTgy4OFo7VVVBm?=
 =?us-ascii?Q?JJQXPjv9A1u5jnUp98oBzHjToHJ0UuiDMPBD/gYF5UzKU4wjwEN3SrxDXhf7?=
 =?us-ascii?Q?rG4qEEQRW9sKfqEL9zfidbD3tdPbc5/u3o4omSyZRPMA296xHstwcrclr1sx?=
 =?us-ascii?Q?d1Pn9H6uZNa8v0V3rOEJggMEefkGHOuk4nvN2dT+PA4ZOpLS0bPfV2NB/jGc?=
 =?us-ascii?Q?mZzli7wdGhc/cXb+Y80bEYD8YN5gkoj8pO2+CStUTmMynMOOYZqJu8Dj/yFj?=
 =?us-ascii?Q?zMQXpJPOmqal/ChkKnQFO+ImoOv1Y2+XeaLDRj0g5FpU/TYom0krGS11kf6Q?=
 =?us-ascii?Q?9N4HiC1VMjHo/5L6PJPi6bthc5KrIMhFHxdV3Gqq7f8u8QyXEftoVInCSxzC?=
 =?us-ascii?Q?f2uJF6VTJO9gMKPEN7Gzz4TA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72de22f-de57-4044-8a0e-08d9096d3c9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:11:42.4157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+jWGrM+Usahep6pMo/Uattv9lOCJVpzPpaZZl32unVFeR7kiPS1YzgNyhi2OBjGKSkdjRO0IyxQMYWkjxT8D14Bhf6XiwJ+Nf69mVr5fL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add test to check new possibility of block-dirty-bitmap-merge command
to merge allocation map of some node to target dirty bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/allocation-map-to-bitmap            | 64 +++++++++++++++++++
 .../tests/allocation-map-to-bitmap.out        |  9 +++
 2 files changed, 73 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/allocation-map-to-bitmap
 create mode 100644 tests/qemu-iotests/tests/allocation-map-to-bitmap.out

diff --git a/tests/qemu-iotests/tests/allocation-map-to-bitmap b/tests/qemu-iotests/tests/allocation-map-to-bitmap
new file mode 100755
index 0000000000..bd67eed884
--- /dev/null
+++ b/tests/qemu-iotests/tests/allocation-map-to-bitmap
@@ -0,0 +1,64 @@
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
+from iotests import qemu_nbd_popen, qemu_img_pipe, log, file_path, qemu_img_create, qemu_io
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+nbd_sock = file_path('nbd-sock', base_dir=iotests.sock_dir)
+disk = iotests.file_path('disk')
+bitmap = 'bitmap0'
+nbd_opts = f'driver=nbd,server.type=unix,server.path={nbd_sock}' \
+        f',x-dirty-bitmap=qemu:dirty-bitmap:{bitmap}'
+
+qemu_img_create('-f', 'qcow2', disk, '1M')
+
+qemu_io('-c', 'write 0 512', disk)  # first 64K qcow2 cluster becomes allocated
+qemu_io('-c', 'write 150K 100K', disk)  # 3rd and 4th clusters become allocated
+
+vm = iotests.VM().add_drive(disk)
+vm.launch()
+vm.qmp_log('block-dirty-bitmap-add', node='drive0', name=bitmap,
+           persistent=True)
+vm.qmp_log('block-dirty-bitmap-merge', node='drive0', target=bitmap,
+           bitmaps=[{'node': 'drive0', 'allocation-map': 'top'}])
+vm.shutdown()
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
diff --git a/tests/qemu-iotests/tests/allocation-map-to-bitmap.out b/tests/qemu-iotests/tests/allocation-map-to-bitmap.out
new file mode 100644
index 0000000000..6cfc42aa4e
--- /dev/null
+++ b/tests/qemu-iotests/tests/allocation-map-to-bitmap.out
@@ -0,0 +1,9 @@
+{"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap0", "node": "drive0", "persistent": true}}
+{"return": {}}
+{"execute": "block-dirty-bitmap-merge", "arguments": {"bitmaps": [{"allocation-map": "top", "node": "drive0"}], "node": "drive0", "target": "bitmap0"}}
+{"return": {}}
+Start NBD server
+dirty clusters (cluster size is 64K):
+0
+2-3
+Kill NBD server
-- 
2.29.2


