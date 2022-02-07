Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261D34AC7BC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:37:47 +0100 (CET)
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7xR-0001gG-UB
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:37:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71a-0001wC-Nq; Mon, 07 Feb 2022 11:38:01 -0500
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:2208 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71Z-0005Ix-2I; Mon, 07 Feb 2022 11:37:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/zNg4+g6TCZx0qhQh/u7wj9YxjUVmRs/e0KCKA9IYQJP0VJkVLEFRtGhIxyx2NRHvZtzZj5yimoOIohYAdW5f6UkO1bm4jHf3+02Ef3C79gY8jhv1BQH7j9TIIDz0BNOUWvSA0DbGOz4nvQub7ZC1O3Qrw742QMUpxE7BdEjli6adUrHfRHdc7mAR1Y36wb2L9qd/XZU+fKIbtEYgGM6GOYbO2Hi6RE+LlggmDsk/HdBlKTI+p7Jq7Bph6E8R5ApDxPjdrapwmtqIEK+vxAzhSTh+gDG38yPqkNM9isrzsdsyNhQBdBzPeoMWo2fOYa/xym1OnwLqooeN60CIUDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6N2areXa5/PvBykciQCdMGLPxqi17k9S4yCirRbb3A=;
 b=OgiAkCAkA6otDuHZWz9KxLWOaI7diYkaeGmVbvzMS344B8G/J6CGYWEmGtI/IDl1GAJiKfax2cq7M3XYugjduakBPTylek8VnDrIcfpAzma/Kpcct7Yx6GTvW8pv0bO9J40zPoNZWe2102XuCH3kpSMg15UOWIMGEYAkzniDas1yuN4+9+GuAY6MTaxmgyATtFbS2VeBFSjv/JA48fxgsQ5SZ4NKlCEGU4W4Pb2gs3EII1Nc/+OM6W5fQwhbkkvO9nvSG5uNSDMqht4JwdmWmpzJKG53VxccWgtuyfd3c+wdKGUddtpxWV77q+PCDjIvOXatQp+tKQZu2flcAh/S6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6N2areXa5/PvBykciQCdMGLPxqi17k9S4yCirRbb3A=;
 b=EG7aMV5HB3uBGTvk0D1LyIkrAsVwBr4wCZWyGmQ5COId+Om1/15gYhAy6LMrlq9NZ/WcYBRtZew9PJyqPp6Ea/iLRJyVhLjuC9RfInC8bxz7bfD+z20Nr6Kd5ycxznYd5rOUS0WAmYYVwqMZedkR1tpaQhbt1leB+Hk6dmdxTUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB5085.eurprd08.prod.outlook.com (2603:10a6:803:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Mon, 7 Feb
 2022 16:37:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 14/14] iotests: add test for blockdev-del(force=false)
Date: Mon,  7 Feb 2022 17:37:28 +0100
Message-Id: <20220207163728.30362-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab80776c-0f18-4ce5-9b5e-08d9ea582a9a
X-MS-TrafficTypeDiagnostic: VE1PR08MB5085:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB5085404B40C0148A74070589C12C9@VE1PR08MB5085.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WpEl7amz3XF23hIofcy14Wngh+e7fOhGvJK/zWDc8q8d7hC0VxN/AoypYFFIqW90pZOlYWEgwkE0k7+MOWLx4KfMl6RP4Dmt4JO5cG20bZHNjGiUUHocJMxPJl2qEEhG9bz4kq8vLWn8kHIm3rqdAhGvN8ySot67IVEG+/LjTSp+7bANHLNN1fzAgzuloHNxesllyTMDOy4u6P1+WKPsa8ohjQdkEpuptzjluQkhubqLwj1GT/ZACMnZWgL1VLaMFufZMer2krF1Md1VgKM2b92aFAQe5V6kYzeo3P/rXA9G0LxUUsVjytIDUX3qAbBUURCB38RcqyGxq15n8FherQbn/YvOm5YGXrAX1i1UsU6SXH2dgVZhginHrBFhbSutzJ+qEdZhIe8ARsvM0s9aFpkMqT7PQ0P9U3K106AnQdhTeGLWohnYYTH6BnWGyZjfylIKmi77e/2qM18onOkvmJV5I2rPoTf3ifJhtWk7n0ldCX9komaNQClUJkr53lBDeMGu4KbGrWd68L5dvXrkl1JJg2Z5WwRJc1S8t92Y1DyWbLpRUoaxAy8Wz633jlTO5ZJb6sCf/rQEeRl05jzEhAM9216p3k41jr8LpdjHMgNKVaFwox3YSSoktalyJqBvkdii08UtWWVz/7HmUXPQwE2SekcGqyXQKfctZ+F7m9Bc9899Ul0qCwSBdqbir20+8c79t84F4fpPxqv6UT8IIzwZ8kwzZo06vCYQCVP/gQUII7orqxS5k0UJvpj9Ku1+hcLaDXYMq3lLLVSgXmCeULD/w++VqobFq9hfHXQltDV1nQnp2PAqVC1nxcv/dhQKV/4Na1uyEYfZ6xmJgeiHpIVq7fEQOSbSeXeDJE12kQM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(38100700002)(316002)(8676002)(5660300002)(38350700002)(86362001)(2906002)(4326008)(1076003)(66476007)(66946007)(66556008)(107886003)(6486002)(52116002)(508600001)(2616005)(83380400001)(36756003)(8936002)(186003)(26005)(6512007)(6506007)(6666004)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UOLRvQ7DIrnXS8oC9opsA6WyG+uUETcVfPQFwqNHEtJj5JJV4VpFcddpFwWj?=
 =?us-ascii?Q?uKfE2SjowgmNY5EFQ1Z1CNvMHiggm8quDKQLW0zy/ihd8AHOqMZJY//SyGzp?=
 =?us-ascii?Q?4Eiro85oVJDXqVadZ1M/b8DoDGbq/6itdT7z2vybaM5T4IFrYNAc/SysIP9f?=
 =?us-ascii?Q?AKkcXgKYxuwffABZQbWGJ5iAdtEbYhpwit77+vP26bVvZ8RjoCbeysd9PTAe?=
 =?us-ascii?Q?J5FuOgnBRmgiBPvfT8bboyKPiCNjxDlbgFeCT4JF4fwdxa7WAL1rM2ZPA4vi?=
 =?us-ascii?Q?cssP2djOvqYpIjjgt0hVmUhWvEDVG2nmr09GgSzcF380p43whk/X9R6p5Qqs?=
 =?us-ascii?Q?XSqrYJ5mQf87sKBgLB72MhoDLbTdAUustv5jVMVtGVVm3f6+nRuwOC3dvsIK?=
 =?us-ascii?Q?JEdiLGMn7lyjCedwnmeAsSwLjpsLYYRHox09f2uv5nhz4cEGmBwbG1gaqU83?=
 =?us-ascii?Q?nQC2r3XNNSgvzOr+TX4DaV4obQJxatl8HTu+V5gT5sEcHfPsIiiTzl5r1QWi?=
 =?us-ascii?Q?WH9TwfOC0/MUZeXVfd3pKTtve6cAj4KrQ6VI7swTg/1E1nVMNWyOyjfE+7C0?=
 =?us-ascii?Q?PCsCKLZ08jJK+aqY1+WAwAvIVftd+qT+jeOC3sK8vGs7JIdZ4V4kRtwg/VBr?=
 =?us-ascii?Q?zHru6+RKlGEdOL/CcOd8XIM40qvUYTl06NWJaFFv32lyenZR+GXuNlqB4Ohn?=
 =?us-ascii?Q?+TKDvOmYoX+iUhogvU7ZU1h9lpeUm93BcR4L23l/L5ov17xzyQjR4P7TCf6g?=
 =?us-ascii?Q?cenod2S2lpupwo3+kQbmJI+Lq+4k4VFD2BDsUEdZSv+1415iboLyR4QAdjzW?=
 =?us-ascii?Q?NQVO7ZerGDiTs/qjXtrNEKLUWFkD7H+3V+U2z1bougJvDyyuq9zneIBIEjxc?=
 =?us-ascii?Q?5siFkR/mJvCQK0OZZDwKc94nVsFqVZoLB1X0wJUlrjXvCILSeMjdBqE2ARS9?=
 =?us-ascii?Q?uszDDe9iaCtcbnlXZDgrfrXlortf4+v062XnemjGBjATWtn6OpDe3pi3REb/?=
 =?us-ascii?Q?wO3vX5hy8vb20Ml2Ez8ps8t6ytuRigB0uJepPm/kqJ+/5Koi4QtIuC0MCRrf?=
 =?us-ascii?Q?5Ji5y2W+CZfZa0sQK5gplWBYFkuXA9j+YF0FXXPOTlQKOaziA+BczejU3u2+?=
 =?us-ascii?Q?KJV+ERqxdlmxC0FD/wq06yk6ateoN6s/JumPtAomAUyVL7A2eepaUM6ReKHK?=
 =?us-ascii?Q?lbZQqV2R7VtdwRCLdQbjqQILR9+2J8QBVyN2/ZUWwfelj7f0dY5m/uILuiWQ?=
 =?us-ascii?Q?mGm9FoszCJV+1XV60qNTV5ou7EGS+JpjcRNftux5MJYy2iogcAu0BWXMstrW?=
 =?us-ascii?Q?C5jDOZzaT5xueL80mK1mptx2Y61hZ5qkCDJBVOaE8JK7PUMpJAuwDEsxvj31?=
 =?us-ascii?Q?ocJC68bmiAAiVvNK7B7ZDkqFxWUA2kWtdKsNZ67Uz6z8Kew7046B0npikUi7?=
 =?us-ascii?Q?NpSjWnsfkFbCqyjHyiGI2IYmggFha4Bpn4SQi3V4zAxYMCE9i6jnMV/ApsaO?=
 =?us-ascii?Q?ZlkbfTJJc5VuqwjYd3Teg9Ru+Urc+zpBu0OYMoChCiTgU11QtHhpwPukkMBa?=
 =?us-ascii?Q?1HOiP0eEIJYR4vsAbb98oPpjCLwk5nOvesu/sQUm4lBze+UuyMuIfB2qdsvR?=
 =?us-ascii?Q?yEGPIgDep7mczwYp2sy0xNTsNfxEEoqxi7oT1Q5eJ67ywO5dwgEfKnGo43dj?=
 =?us-ascii?Q?5MmSag=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab80776c-0f18-4ce5-9b5e-08d9ea582a9a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:44.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQYCI0EJV/CkahowXjxTukK0zCJG3UJhNApy90dewX5dMebb5kOAOWqouzvY66ovps6HaY+rS+BtF/9XejhfO8g3f2LJAHgK2MUhrz/tFAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5085
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Test for new option: use NBD server killing to simulate failure on file
close.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/blockdev-del-close-failure          | 54 +++++++++++++++++++
 .../tests/blockdev-del-close-failure.out      |  4 ++
 2 files changed, 58 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/blockdev-del-close-failure
 create mode 100644 tests/qemu-iotests/tests/blockdev-del-close-failure.out

diff --git a/tests/qemu-iotests/tests/blockdev-del-close-failure b/tests/qemu-iotests/tests/blockdev-del-close-failure
new file mode 100755
index 0000000000..12b442f43f
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-del-close-failure
@@ -0,0 +1,54 @@
+#!/usr/bin/env python3
+#
+# Test blockdev-add force=false
+#
+# Copyright (c) 2022 Virtuozzo International GmbH.
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
+import iotests
+from iotests import qemu_img_create, qemu_img, qemu_nbd_popen, qemu_img_pipe
+
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat'])
+
+disk, nbd_sock = iotests.file_path('disk', 'nbd-sock')
+size = '1M'
+
+assert qemu_img_create('-f', iotests.imgfmt, disk, size) == 0
+assert qemu_img('bitmap', '--add', disk, 'bitmap0') == 0
+assert 'bitmaps' in qemu_img_pipe('info', disk)
+
+vm = iotests.VM()
+vm.launch()
+
+with qemu_nbd_popen('-k', nbd_sock, '-f', 'raw', disk):
+    result = vm.qmp('blockdev-add', {
+        'node-name': 'disk0',
+        'driver': 'qcow2',
+        'file': {
+            'driver': 'nbd',
+            'server': {
+                'type': 'unix',
+                'path': nbd_sock
+            }
+        }
+    })
+    assert result == {'return': {}}
+
+# Now bitmap is loaded and marked IN_USE in the image, but connection is lost
+# Bitmap can't be saved and blockdev-del(force=false) should fail
+vm.qmp_log('blockdev-del', node_name='disk0', force=False)
+vm.shutdown()
diff --git a/tests/qemu-iotests/tests/blockdev-del-close-failure.out b/tests/qemu-iotests/tests/blockdev-del-close-failure.out
new file mode 100644
index 0000000000..4a4776cc98
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-del-close-failure.out
@@ -0,0 +1,4 @@
+Start NBD server
+Kill NBD server
+{"execute": "blockdev-del", "arguments": {"force": false, "node-name": "disk0"}}
+{"error": {"class": "GenericError", "desc": "Failed to flush node 'disk0'"}}
-- 
2.31.1


