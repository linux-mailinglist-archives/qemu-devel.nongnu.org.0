Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9304B9217
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:08:17 +0100 (CET)
Received: from localhost ([::1]:42940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQb2-0003Ft-Cr
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGd-00044H-62; Wed, 16 Feb 2022 14:47:11 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGZ-0006Dk-Vl; Wed, 16 Feb 2022 14:47:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6wSoH+ukDLhEMldmnDUj9td1RssdGoRsI3zBcOCp1YFKLnsfD/3ZzaJ3tauwvsQ48+5X7yyqqJU1esTBCyxhBpYgMMgCn9ohZH/29YNFr09mVzWfIsYz+9lnIov6mnjQ3s7DVE1mWNO9LIHSRtEmY5S0QqWTGXjVMeMVPIf4CLPd5RTTEks+n/snS0MIDMBOqXSOQn+na7khydVv2oqJy2pbSunb2xiu+mGxVYmfgx62t4DaO2ysm3od5Wq2GU9Rr/P5eIOA99MWKQW5mHS9Fvf4D572IHMLaoqE1kWU22zX/peu3cSsW1/5Pp8MCrP1hc44YGWxe7PSYpz4MuhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVzkeFH0R1sIXZtONO4gJXXS8oiED1uzTni8gHLm97E=;
 b=emxbpTK/Up+aZu/9WvXLx8WZClwP7Cjy5WdNr+6jq1X+62rHBaw9aW16V7Kp3JLltrkIz63fiT5M3QccwPCuUHkO6y45MIEsDkzXwOmW0C1qFbV+1qugz2zbBwRi88Pg0whYd8naiLaxPoXGUvGqAPTydzgRQp0ZF546zRT93W2apIt6q05EXr7Vm8s44kC52yoZYzZRRYxPn2CMxSMKnp7NA3N43W5VmoIVctLEHPJju/bpsxQFFv6cBSWTJ0FUA808UbXYEtMsVL5EmQYBgjGR8O4lOnzvpfaR/7bjuXo7bR+jYhpDs0A5n0jic2uodUFxtnIZyKZNtp0P3yIALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVzkeFH0R1sIXZtONO4gJXXS8oiED1uzTni8gHLm97E=;
 b=NjELU829B7Fk6ThpGcNOrc9OVufLIi/9QIiZ9uaojPEd5I88po1xj02CKAQ1FZNCtnwG6WTM1D3DEKFYqWqQz5i5bm3D5wlv9Qtpmv6vE++PHicXTcc016Z1z7W9qaCXVSwjDM8L1/EAzpV9LZ93fbv2qfdHjyAKl5MnGWW/05c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 11/18] block: introduce snapshot-access filter
Date: Wed, 16 Feb 2022 20:46:10 +0100
Message-Id: <20220216194617.126484-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 473206a0-d1a6-44a1-a8ec-08d9f1850cfe
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB28519571E39111ED9030D01BC1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSWABbmFlIQSnC95mWKs2Fe/fcZ+pW1xV8bH4rnYzZaS4YBlml44AaqdQx6IJ/vMPHI/QKd5Zd9lxLXkHJW0O2HmzRjx3Cx0qfCZXe7LHG3up5RHXqxJhCFvpGjDeMeMLVvWjhyankwmqLN96OFXQPPCv108ALbkP7YzLclFe73ZNyrWYQxznTLnnMpLR56DXO0uZXCOoGfBOxlYmIpxe9JlbmN3ClciJ5OBGOxjccGg/EosOcVngjaW4X6fAZ5wusmkuIApj7PqIusUtN2eynADAUThCLfLXNVV7X8Cp1ccqXaXR/VNC98/PUvkWvnMZajWI+Kw3DrFZDvtwgXsli1OLz+vvJK+VoMVZtIJMyVk+GxiiUR7uB1tFfRWui9b2swojfaICmggkEk3gxtxi+xGsP7FgsRoHoHt+yI3DK/ogMTxemiImeUp6N0urW4Zd6cBgszJej83He6msm+QK3wvw131r0VFtk+7y3J6CEbMe17hB4/elJRZhZMGykj3dzk5KHblx8p9sfU0ItSN4XVq/xIdqv+mNLTZZSdnemVwDISTbMSb3bVX0Y7txYH2fb5eWLICVupfPWBbB5SdWnfX9QY3LVqa01UUBTeMnDTfgJ/Rp3bcki1IAZ6I0k/CNE/tXCMF6c+mjVv5/TAp+tG3MmfA978WOyYSIQ9al/vy8SKnnUANMxOvaJBoh/zsV8e8/+ecIxxF50LGOUXN7uicQ+qmQBdCh41/qbS1H4Rat8h3/OV8gSbwXVeMkIyf3K/JMyOhFaDl47zRbS21Mp0IubWzPEmnsUbJuY0QOKQA0/jPebg8s+Jc4R5601Vb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n1pn36QuQ8d9f+vbeM7nEsUr7wE9OHiRpPFdTciqZBo5VOTkVuW0iJs8MBgt?=
 =?us-ascii?Q?+KC41FTySx89u9EkhIAfQcQT8B92eN+90lshcK3dr3iok/qzpZ2EjqExPx0x?=
 =?us-ascii?Q?YDERVO/L3dEjbi/fvcicTgzRHEbXL/FKvxbjSb4/5rXUmNjjTj0GsKHiKMr3?=
 =?us-ascii?Q?Szhpur7z5bQytOk4rNM/TEOFWrCaRY05p+ii9ceWlS6SlcQ7aF7zOT2tPINc?=
 =?us-ascii?Q?79RhS3db+M6b84bIhXaGJe3mvWtI4AhDwea4Z4LkdGYHFjjt02lIqUPfgqe6?=
 =?us-ascii?Q?lYxRqGYzAuAHih7qlB8dcX3MjeGj04MNLUyP+1e7uFFV/DyLze88wxSsvnj5?=
 =?us-ascii?Q?AsDiuP52lZUuDwq8zw6l07IkjtDWQl0NeEXiRI/Z2Zt6AvGBgqo9WpPZNt3d?=
 =?us-ascii?Q?UpO+E34EYWR4FQuM9Pn9O86lTDLS77my2TMAuEC028bxFBAqEa8Z04BDRlQ2?=
 =?us-ascii?Q?44HMYQONO1JtYvtdybcxXUlgyaNjG2VtPvHG/Ixj83mfzVdZYcuRBjtK787o?=
 =?us-ascii?Q?nI0ctlRQuLcWqvdW6ZI7zytx21D4AUmnR1ReBN3h4Mw4SuqHhZamgX5s51iO?=
 =?us-ascii?Q?oHGFv4zHrgSD4NlZn5an+lEmb3SlPNC0iJuZyHUSzndqPXEr3767TZcejqB+?=
 =?us-ascii?Q?wyj30aKONqSLvlBHuLCC1IvJigOV5r1I0N43okMohY5u5jgnTzCYQJgkf/ml?=
 =?us-ascii?Q?zwTZXnpM5jGP6O8J5MbtplSrwTA96dwPANldm/gh0LVhGiagCKwZxWcMAuja?=
 =?us-ascii?Q?VB0dg2wtY9f3FYi0BODfBpnR1hGR1meMg+PH4OOL8bYHtbMNIGrBGAcH2MUE?=
 =?us-ascii?Q?j2cy5B920FF8I2y8nFcU49akwlnc5tR4F7EJK/i+/qunqiEYSLhesp3LzY96?=
 =?us-ascii?Q?vQegkz4J1KO/OciaY/XVKyv1l4ebCceundEOSeUcoekUVEMOFSk9S6nVcBaO?=
 =?us-ascii?Q?ufEioV82ILbK/7zMa8kIexzd66/7wWL0TUPNXKvFuJiz6pU5ijjOS59tN53U?=
 =?us-ascii?Q?D1iygSD0JxgztQXocutH3+HFOKHNmDwY489C+WC5flauEZbJp+HVELnry9jC?=
 =?us-ascii?Q?tzq25iFHNtCQPx31ZHYbbg0KXRgHubCrDVsx6rFO1prEvIXU9hQk5Fzxf/WK?=
 =?us-ascii?Q?LHXYCaHH9BVH/ogxyEza7y14hGIkBulCCtzpv17SiFsDxwaS6vK+2ljzYbQT?=
 =?us-ascii?Q?UHRyTp+jZxAgbf3yO6JZmpo5SZKcnDKQiaSoc/7nj7JZcX4OYgwQ3TlOm6I9?=
 =?us-ascii?Q?a1jxxgs4nkG7zVCgoi5WmdtbaZEQpRO8UosoTaw7nS33UsECijc9P9YqVroW?=
 =?us-ascii?Q?jJEzk1nDjP7gXF2rRhwsPGSk6pe0h6AqV+emMeigzWkpUjy65fDtKNVrilGr?=
 =?us-ascii?Q?Uhk0ruwPO/1FsIWd4d6ECqaAtrG99JF0p6XuGaDS/sjDTMeRDxMQcI3VauLU?=
 =?us-ascii?Q?DLBzJXTbrV0FJOLWSsQMyn+wZbsLz8pVhwXIlsxfa7JYn3ISy3LUHQpLk4G+?=
 =?us-ascii?Q?PcSYybtvcFKch+QInozGUvZxEh4JJqka1TjGzJsWV+q1qPHNoRF3xirzbP+W?=
 =?us-ascii?Q?uTYoJ6riey7aBtCh7UE6n2Agmup57exPSJYDBkWVMHHpS9vEnjGIo4r8hlsW?=
 =?us-ascii?Q?qwSb+VIXFT4ZXtYmOLydx8+VIrCzdGb7oVt2hH/P4ojdAgMONDj2FWpCGYE7?=
 =?us-ascii?Q?mb+qvg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473206a0-d1a6-44a1-a8ec-08d9f1850cfe
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:40.2015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFfI3orByMthWK5dlx9Ce9v8EABDdCKFj7vYPewQnZ1jOSw9tMi11zWUWxCf+rJ0X36wxwNTLlsNWFAQN2FHMZkEN+aodhsLgmBZ4dhc2Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The filter simply utilizes snapshot-access API of underlying block
node.

In further patches we want to use it like this:

[guest]                   [NBD export]
   |                            |
   | root                       | root
   v                 file       v
[copy-before-write]<------[snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

This way, NBD client will be able to read snapshotted state of active
disk, when active disk is continued to be written by guest. This is
known as "fleecing", and currently uses another scheme based on qcow2
temporary image which backing file is active-disk. New scheme comes
with benefits - see next commit.

The other possible application is exporting internal snapshots of
qcow2, like this:

[guest]          [NBD export]
   |                  |
   | root             | root
   v       file       v
[qcow2]<---------[snapshot-access]

For this, we'll need to implement snapshot-access API handlers in
qcow2 driver, and improve snapshot-access filter (and API) to make it
possibele to select snapshot by name.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json    |   4 +-
 block/snapshot-access.c | 132 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   1 +
 block/meson.build       |   1 +
 4 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 block/snapshot-access.c

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 3bab597506..a904755e98 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2914,13 +2914,14 @@
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
 # @copy-before-write: Since 6.2
+# @snapshot-access: Since 7.0
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
-            'file', 'ftp', 'ftps', 'gluster',
+            'file', 'snapshot-access', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             'http', 'https', 'iscsi',
@@ -4267,6 +4268,7 @@
       'rbd':        'BlockdevOptionsRbd',
       'replication': { 'type': 'BlockdevOptionsReplication',
                        'if': 'CONFIG_REPLICATION' },
+      'snapshot-access': 'BlockdevOptionsGenericFormat',
       'ssh':        'BlockdevOptionsSsh',
       'throttle':   'BlockdevOptionsThrottle',
       'vdi':        'BlockdevOptionsGenericFormat',
diff --git a/block/snapshot-access.c b/block/snapshot-access.c
new file mode 100644
index 0000000000..77b87c1946
--- /dev/null
+++ b/block/snapshot-access.c
@@ -0,0 +1,132 @@
+/*
+ * snapshot_access block driver
+ *
+ * Copyright (c) 2022 Virtuozzo International GmbH.
+ *
+ * Author:
+ *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "sysemu/block-backend.h"
+#include "qemu/cutils.h"
+#include "block/block_int.h"
+
+static coroutine_fn int
+snapshot_access_co_preadv_part(BlockDriverState *bs,
+                               int64_t offset, int64_t bytes,
+                               QEMUIOVector *qiov, size_t qiov_offset,
+                               BdrvRequestFlags flags)
+{
+    if (flags) {
+        return -ENOTSUP;
+    }
+
+    return bdrv_co_preadv_snapshot(bs->file, offset, bytes, qiov, qiov_offset);
+}
+
+static int coroutine_fn
+snapshot_access_co_block_status(BlockDriverState *bs,
+                                bool want_zero, int64_t offset,
+                                int64_t bytes, int64_t *pnum,
+                                int64_t *map, BlockDriverState **file)
+{
+    return bdrv_co_snapshot_block_status(bs->file->bs, want_zero, offset,
+                                         bytes, pnum, map, file);
+}
+
+static int coroutine_fn snapshot_access_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int64_t bytes)
+{
+    return bdrv_co_pdiscard_snapshot(bs->file->bs, offset, bytes);
+}
+
+static int coroutine_fn
+snapshot_access_co_pwrite_zeroes(BlockDriverState *bs,
+                                 int64_t offset, int64_t bytes,
+                                 BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+static coroutine_fn int
+snapshot_access_co_pwritev_part(BlockDriverState *bs,
+                                int64_t offset, int64_t bytes,
+                                QEMUIOVector *qiov, size_t qiov_offset,
+                                BdrvRequestFlags flags)
+{
+    return -ENOTSUP;
+}
+
+
+static void snapshot_access_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
+
+static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
+                                Error **errp)
+{
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    bs->total_sectors = bs->file->bs->total_sectors;
+
+    return 0;
+}
+
+static void snapshot_access_child_perm(BlockDriverState *bs, BdrvChild *c,
+                                BdrvChildRole role,
+                                BlockReopenQueue *reopen_queue,
+                                uint64_t perm, uint64_t shared,
+                                uint64_t *nperm, uint64_t *nshared)
+{
+    /*
+     * Currently, we don't need any permissions. If bs->file provides
+     * snapshot-access API, we can use it.
+     */
+    *nperm = 0;
+    *nshared = BLK_PERM_ALL;
+}
+
+BlockDriver bdrv_snapshot_access_drv = {
+    .format_name = "snapshot-access",
+
+    .bdrv_open                  = snapshot_access_open,
+
+    .bdrv_co_preadv_part        = snapshot_access_co_preadv_part,
+    .bdrv_co_pwritev_part       = snapshot_access_co_pwritev_part,
+    .bdrv_co_pwrite_zeroes      = snapshot_access_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = snapshot_access_co_pdiscard,
+    .bdrv_co_block_status       = snapshot_access_co_block_status,
+
+    .bdrv_refresh_filename      = snapshot_access_refresh_filename,
+
+    .bdrv_child_perm            = snapshot_access_child_perm,
+};
+
+static void snapshot_access_init(void)
+{
+    bdrv_register(&bdrv_snapshot_access_drv);
+}
+
+block_init(snapshot_access_init);
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a5292b814..b16fcca98a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2509,6 +2509,7 @@ F: block/reqlist.c
 F: include/block/reqlist.h
 F: block/copy-before-write.h
 F: block/copy-before-write.c
+F: block/snapshot-access.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index e2f0fe34b4..85f2b03216 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -34,6 +34,7 @@ block_ss.add(files(
   'raw-format.c',
   'reqlist.c',
   'snapshot.c',
+  'snapshot-access.c',
   'throttle-groups.c',
   'throttle.c',
   'vhdx-endian.c',
-- 
2.31.1


