Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAD64C335A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:17:43 +0100 (CET)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHkM-0000a1-Qb
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNHgw-0005jp-B6; Thu, 24 Feb 2022 12:14:10 -0500
Received: from [2a01:111:f400:fe1e::726] (port=14723
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNHgt-0005pu-QC; Thu, 24 Feb 2022 12:14:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmwMtwIPWSvJas60ySqjbIsx3KCSGprCBNObKb8ysZV6dHQHpstKtsC979sHZQxx5nVm/0824XmiupGz0yh/NkiNzcbyi3/Q/3CzRBvBGEFzMWOXVCzIdoycxqIHG3U61Qw2h/aAaT9GNpA1PvA30tGy2+RPQmyXbjKk8MK0eIrowU91lLEgaJGc96I15O/uypb2PZ99ksc8mTonJSvkLsyW0vBkuNrsp7UxAWOgov5wFJ6gIsmfXtyOKehO3Jnk0R5FiIY1ydhqfGMIz0OwT6Ob5DOn2GLvn6ETqLxCUydfD0gjGBkGA0Epvj+uuwOAOvdeo0OLbrFzyi6FeTpUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G47iRQIOgfT0wAzgPUnf4mXbZDrHrM3d/9Bijf+gOsQ=;
 b=G3CFctxGgoizKVflYG/OqzjEBOwwr6zfQsSEnDniiDLY2S/3F2xY+zvAzTTS9mGI/xHYRNvQJzR/8FvxRU0QubczBkE0YVot/DFP2jgcCu/vt8bHTUsVPZsYrHoYZFfqeguJjECFZdUFDd9VAKB2NmNKPe5wgx9+oUVLhEToltp7cFmMr0lqVvifJl/QJcCp0bUFxYkC3YLWAQb5VsN2akdLpuuJMkgMX3gRnvbGTY3yk/Cfbig7xeWV3ebXNy5LNK5TspsRIrx8ZOsq2TGVMo1B+i8imI6z1QdpX1Gp8MspeBJ1bJNxGdi+cf9HB/Na9QkUYnMZ1osBPSWOpm7TDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G47iRQIOgfT0wAzgPUnf4mXbZDrHrM3d/9Bijf+gOsQ=;
 b=pjPfquiVZuqpejuPVizCj7j2jle4ch4lp5hnuOdoLv8mHPEwVUcHaie1sKY3PjwX5jBmLcbYTtCxhqXHeyv4A/t/ccBTYDvNQkjzNdhzzkslQBDMUKBoEFzFwaMR3ibbeBWsmMyGDpi+fTlVt8jwayUPVcf1RNpkaTqYvVaabyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3197.eurprd08.prod.outlook.com (2603:10a6:803:3e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 17:13:54 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 17:13:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH 2/2] iotests: add blockdev-add-transaction
Date: Thu, 24 Feb 2022 18:13:28 +0100
Message-Id: <20220224171328.1628047-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220224171328.1628047-1-vsementsov@virtuozzo.com>
References: <20220224171328.1628047-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 476cda8b-9da4-47b6-1a26-08d9f7b90942
X-MS-TrafficTypeDiagnostic: VI1PR08MB3197:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB319735F17E0ED20EFB238BEEC13D9@VI1PR08MB3197.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7bTDAfPYbHiifpnX3PyExjjziZhHQkTqBrLD6Hp6rF/G7f15nk8hU6vp/Zse/LlxEJOLEu3iVfdWT1Dib5/Ci51Q4kk6u69uvFPBnQf0xgiYQoENvdNR40tcYti+DVCsQRhKkbMsSV3HLwRmvm2Hj21FEMV9vXtC9BsteQBuodXCNlQx3H458OlZUXaL6L6PovMSwKa1VuPSj8C2gTu9w69dcnKJo/2yRkm1m1XgmKrco/vLPOLtNrdYpiReyWl/ZYxFrcBl522uHRimycGfNuMa1LH3RWoyvcJL1bJZpwTiWC/Nv/V1Dt2t9LgLJ0ircUXEonVlfkO24MwlH7fM34kxEFPSPrA0g8/vv1ufck9lEMJJyyufFnSTfm3tbVBIS3yUpq+UgNArg8FLSwR5F1zJBFiKBOpHGtOvemAIjepRqy7DSsqo+ZpeFPFjkXaMPUlgI4991ChW5GMhsilfGnLKBjrpkWG3Mjk4LGZfYfeWFTLJ7MvBQ2bXS1EM9NlAW/AkYSkWdxDae594Oz7NH6EHiB3P1e9WGjMvpR/eSGHfFStOY9+V+nlL3qnBjsHysNn1J0myySHY/Y3c7oMBwbl5CuuOqI+ObzprO3M7qogezBUj2rSDLFvpcucU7R2JCYi1O+OhEMfjSs5wbXjTyqTwXLNZJoYSHPkp26KyEYLPtjuq90r1vtCFxj+7NSG01srpzqBBe4xcsMbLsmxxEYkMe1DwQqSm+umVj0HXV1qShfNhBIesRwO0w+Ug6OXaA3Sv3XqqsaIUgjkp8K7CE/3HwGF/qEeQa4oQecTqtM4l9kjoO0SGOtsB1pEDqdzM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(52116002)(508600001)(6666004)(2616005)(86362001)(38100700002)(38350700002)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(6916009)(316002)(1076003)(8936002)(107886003)(26005)(2906002)(83380400001)(186003)(6512007)(5660300002)(36756003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?reBzyBXVdB2kJCs7qRkyXslQMm7s1v9bexhEDPnN2fF+fTyEnVSd6QmFkaZ3?=
 =?us-ascii?Q?eVWS/UOjB03WcU2gV5ughvDiwhEfc9mPXQ7Kvumjm3uUySudJnrrTiKdmusb?=
 =?us-ascii?Q?KLPVfJQp0N6jx2f9lBj1Lfu+Vcx3RwE7W3JWOyUX32N3AfG+n128RUp7gXN9?=
 =?us-ascii?Q?C6yWNELQamjQJhj9TFBMGiUXgmXGG4bJ2FxD1MWmxGKACd6BCbZ/OC96Ti5M?=
 =?us-ascii?Q?lrHOLvLAp013l8nDfEKrm4UrKotmcWkSFNalU46Rb1wK1QVViwscw67+UtGy?=
 =?us-ascii?Q?PBJVY+UW+k0rQm/WBkAb0e3rSzF4xLUiVbQvDsIG1FojxGJxe5SgD4/dI1hj?=
 =?us-ascii?Q?eM7LjibQ6ZtJz7eACBKk63tNmRN91eiGU82K8Aon8R1eZlsLjHchOmmw8UyY?=
 =?us-ascii?Q?Lt7rT3PEefsYg03OSD/FxTiI+15OSi+MuIkqiCE0BTXO6vXkvCmbGxL5fdOW?=
 =?us-ascii?Q?o1uJgoZDPMWIrDaS/uxz2JfQ5dx4WxpkoZqM+bOTbu4CFI8wYnjdoKef+H0z?=
 =?us-ascii?Q?7IjErsdSyC6y6uMliPrjGLcmg0dwiW6kLQfCh8/pZgIODC4l6Sy602orqRnF?=
 =?us-ascii?Q?QVwOAaseaiCkwY3x1JADy2Ewlh5/Y1dbaVx0utm/o6StnQ4oDS7THGyk5L6c?=
 =?us-ascii?Q?5UIup7xUE0mjSvTrzYQbesmWmE9ZVuQynbBVUtrHwc/yV41XsVqL7ifDrfGC?=
 =?us-ascii?Q?OewlnvSq0zmgAjd3K1lvdal3x1Y+SnsspBTva9LIgO76uZVK60Vu9a0cP2ja?=
 =?us-ascii?Q?cgoFLtDSgcf5RSYpNaydUVoYBhFV8mOXqH7E3FqKKWSNtsP+57KXae9MbDIX?=
 =?us-ascii?Q?5rE5Y5suN5QSDA+U7XP4IKukRZuA8B24kG7GK9I38jMnN+5I/m22PFQKYw3N?=
 =?us-ascii?Q?8D5tjMEA+P6mMIY9J9xhQSsxs/i0uDoSCW80Vbjy53MZkhxkE0VMx8dIqiIW?=
 =?us-ascii?Q?6T8LqSHdAOBadBAFylQazadTOfEbXG9theDRs/T0e3TkPkGojIvUZsGd2866?=
 =?us-ascii?Q?WxfUiq74OpmLM3H8w0LujA+f0xB9Jm838OsqlxKV+2PBv9ekv3y4Y1XNWD1l?=
 =?us-ascii?Q?0CTehqey2ujQE/Ex8oGgqtELeu65nkz9G7V0+sJiA/rHtYnCsKK788ZFMjkH?=
 =?us-ascii?Q?0OYJkFdfBuRtbOq+A0bg2qA6cuNPMQFkNFdFc0+mTTMpBcGT6E6ax+jheGJi?=
 =?us-ascii?Q?6G24B6fiOUOHfX0RI6fNkrsu9ecu263ITXgpeuaHGRAiSulhs9AUG9c1XB8x?=
 =?us-ascii?Q?mDxurWNIZARDspB7z3h74hQqtIqQZPMPXgmbETAMyX/J0OYZgSz7wIKcR38s?=
 =?us-ascii?Q?qyitlYLQP+Yfa9PNf0OFUDZUtLOy1xQjlR9ADHBtojlDMt7ddqiXQtotkflp?=
 =?us-ascii?Q?jxhzLhhDLND0VpnGjwAmRpRV2dHdwBWY14jp4iPVoVi6A2cLWtgIWONJ5GXW?=
 =?us-ascii?Q?Tmhx6xLGQ0luZruJEmR+UgaBLQnQWJoxslKO6g3N6ft5rQ1hf885LEN/taCM?=
 =?us-ascii?Q?0mWtvD5vxocOD60AHqRH2UvYxrxRL59mWbaCCcxOfemjbau2KZ5gOzChgFaW?=
 =?us-ascii?Q?G15jtPxV4DKTet387tkQ6tbODq4Ou9A/3HS25tZto1AlUi5mVsW2PGL4HBbE?=
 =?us-ascii?Q?O+tCIqOj/GM/vvKWDhYg1O9RJ7pOIVnTelD6hnK+MO7obaUw9F0obU0MePPe?=
 =?us-ascii?Q?qDh289PA4+C1D5egEsR3dTgoaGw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476cda8b-9da4-47b6-1a26-08d9f7b90942
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:13:54.6910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQiytWTxV8lXaMG9JSfc5J8j6nB17m2o/ZvGy4oRqsfH8Til7CNXVeOCNXyGPicaY2jm+AxupBxA8/LtZJL2QVpao8ks8mizIu/Ia5Uyn9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3197
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add a test for transaction support of blockdev-add.

Test is format-agnostic, so limit it to qcow2 to avoid extra test runs.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/blockdev-add-transaction            | 52 +++++++++++++++++++
 .../tests/blockdev-add-transaction.out        |  6 +++
 2 files changed, 58 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/blockdev-add-transaction
 create mode 100644 tests/qemu-iotests/tests/blockdev-add-transaction.out

diff --git a/tests/qemu-iotests/tests/blockdev-add-transaction b/tests/qemu-iotests/tests/blockdev-add-transaction
new file mode 100755
index 0000000000..ce3c1c069b
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-add-transaction
@@ -0,0 +1,52 @@
+#!/usr/bin/env python3
+#
+# Test blockdev-add transaction action
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
+from iotests import log
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+with iotests.VM() as vm:
+    vm.launch()
+
+    # Use same node-name for nodes, neither one should appear.
+    vm.qmp_log('transaction', actions=[
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}},
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}}
+    ])
+
+    n = len(vm.qmp('query-named-block-nodes')['return'])
+    log(f'Created {n} nodes')
+
+    vm.qmp_log('transaction', actions=[
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}},
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node1', 'driver': 'null-co',
+                  'size': 1024 * 1024}}
+    ])
+
+    n = len(vm.qmp('query-named-block-nodes')['return'])
+    log(f'Created {n} nodes')
diff --git a/tests/qemu-iotests/tests/blockdev-add-transaction.out b/tests/qemu-iotests/tests/blockdev-add-transaction.out
new file mode 100644
index 0000000000..7e6cd5a9a3
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-add-transaction.out
@@ -0,0 +1,6 @@
+{"execute": "transaction", "arguments": {"actions": [{"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}, {"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}]}}
+{"error": {"class": "GenericError", "desc": "Duplicate nodes with node-name='node0'"}}
+Created 0 nodes
+{"execute": "transaction", "arguments": {"actions": [{"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}, {"data": {"driver": "null-co", "node-name": "node1", "size": 1048576}, "type": "blockdev-add"}]}}
+{"return": {}}
+Created 2 nodes
-- 
2.31.1


