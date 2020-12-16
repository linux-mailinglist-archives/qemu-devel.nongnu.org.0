Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C02DBB2E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:26:39 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQGk-0002QO-SP
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ83-0002hW-6K; Wed, 16 Dec 2020 01:17:39 -0500
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:52920 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ80-0001CD-KC; Wed, 16 Dec 2020 01:17:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScBT6hpFSxHPw9BbO3CNrvGHKAWg4eNPAEXjUGZ2n1MpeaGrK+mJRriSXhhS3o06qZDak+8mKCkqBXBEVrBxy12cBWI52pzq5R+XCZML/Lzgb62huXRzlvPe2zVMOUaPgnKCHfLxFXvIR4Gx6TKcb4S+vXDT112/uTq5vxyhwPHsYrpBtxQR482z1exb5oID/flh0mZUIONbOD33FSFDcAXRbl9jabo6xlBeTh0xIsSb9kZqZkSgZl4BD02xWJ1hdmiUsGmDsYDH6DnZcM7VsHDbxeGbhTI06fk0lMY71yiRLxPzlBfIlu4cP1+NHXoEuXMYQHuP6Pmi7E4ofdnrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdW3agc+22dzruYsT1wtqRfmBd73+Jv+FVjlt+0gPXk=;
 b=Q/At3hyXCiXu+nHOz6r+jQYgE3nBSxlo3TK+VxtlX97/jk80VaDiiNLxemR0w9qop4nw5ZNgZsxzkgFJd7T2SB0mf3Gn2VvcZzTYTY212N3YVtweIb5ZZ6+R7SulxVUDtasQwveSP6MRiEwSQdKbnC02Rw42eJlsdkA+hCbuREtsiFVNv5FcyoGbZ3xlIYUoTvZOUBMgssb+7s3ZhsNGpUVHHECeUP8GjkFQMrgPx0b5jxaz6UEYrfjGhpFjIUvB6H5doouP4h7ZI7JCn1sekQxejhKdURdJekLyFuytKM2iZ363gvSmb3d66SNoH8HbV0HFqaZVWdMEsMAFxXzoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdW3agc+22dzruYsT1wtqRfmBd73+Jv+FVjlt+0gPXk=;
 b=qWbdEIFZVD5ZGO9fuPjR0qWaLJOSQP+XIki0NFkrafZN+Vxmm38tgCEu6UhxwAm8zHdcZ1x70LocmGh73/I9Ha4b9zBznAlIHP1erxTkzIZRWE+2h0Qi00Ao+hHHb48QKVagjSVgJYLHmh3YeiqmcQ1OuhAwpcrJBAjtwzF46gI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 06/13] iotests: add #310 to test bottom node in COR driver
Date: Wed, 16 Dec 2020 09:16:56 +0300
Message-Id: <20201216061703.70908-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae779ee3-b849-400a-613a-08d8a18a405d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63094FBAF96B4F4AD1B1B1CFC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z2mtM930x75hvsx278qiQw/0I0GatdcBPNVe8SiA+5cFemsV/gzSZxke1RZFVXgCVsFCgbcxTVxi6B+ECkKM3/W0fkTkYKWySloAX5lFnL7tNTt7quwqsVFeo0EgckLXPT/33v6uNfFGwgGt9tmrsiueK/EJ1iOPLtFu9MzPvPl0MayD6DgWp1dRpZiJr5nvjmabtyIPCR6fPetduRg3Ox5+pZ0Vi+cW4PNnb+gJDZ0pbJIAISHoUYnhhrtEzBMXLdiSr83HAa27RApd3EuOQKrrp9CJhLSCAtSCZMrbsmHihp6h2Is5TkZCLx3HYi79JxR5onE0bvwna8FoI4V8odGs/zqzYrfY20KjFvtIStkq63EjQFPxr6ay6ewNBGEhsxCrJc4lT2uGhurm9pTbg8/7hudam5Tz7U8pHFQYntw7YBBnZ/jnti1iQMngUs+lzYMyQlXzWpbgF3o4+r42+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2K7OUEQBYy/iUU9NDgJNH0cvYFHacu3BKgmMckxIVlZdpdlD0b5/GhjN5dI+?=
 =?us-ascii?Q?JUe8r7IS9tlYwBjifkQe3VptXzOISoMkIPCw3/y6ohUjz3ern/2wnEP2jekj?=
 =?us-ascii?Q?CU2VJXZA0zXR7qM1nt8hjCGJUNrvmTrLlnyVz4yTkfdOow3ArAp6G2M9OJU2?=
 =?us-ascii?Q?/f0iYzi1+63Trn6XADfLdIed6fMt5NCNI6+SU+rL/vrpljCT26SJVZm67IAH?=
 =?us-ascii?Q?k9GKPdEeJMUZQPXfmBnrI5icuRFnt1dOSxtxBZ5D+DxtN04GplCToOQLfpKO?=
 =?us-ascii?Q?oXqY5f4a1GT77K87HvHTg6vcQM6JsDZWjHmM5VfcsaP/gEt0bW9LGTYGqZ3s?=
 =?us-ascii?Q?2WQx141TmEZwiYhesohulAeThyp4v5hXYWf5RS1bfmcXziqhsnV1yZoppL/a?=
 =?us-ascii?Q?kf1+foep01nte1eivnjIkeRhZTVOmkmaLyADiYCfA5xnV3x9WE5wKUlkvE4A?=
 =?us-ascii?Q?KJHaBvn/8WlsD8d/bMcVa0DKv17TXwOp/vWEz0oUeH0kpyvW4F4QUmPiFYuf?=
 =?us-ascii?Q?2ab4AyZbklfZL8R03SVOdyKX5R3Cip8F7huCaAXWrdkvBaP0ZKV4WBQhZpRB?=
 =?us-ascii?Q?vmbtVnNfJuXKeNJ+lgjxsv5ReNPpDm3cxeIkAktanzDjPojtyLFBkbn61QX0?=
 =?us-ascii?Q?YJPrHaGzcYRRgrU+CUd2IzcEzXv/C0t8XozAaWf/nkZ3xJMmKKsVapdjcaDT?=
 =?us-ascii?Q?KE3HBQgk8B6b0JFPz6UuS+jB9hkWnuE0SA2gz50s2+v6kY5ZPXDsazvr914n?=
 =?us-ascii?Q?B8XFxVoD4fKyfoQmizMOOKGxc5XciHmHltZ9RpN0nwVMEfksa18gXk4Fb9sj?=
 =?us-ascii?Q?OQfUfHgqFdfMYHbEqSuT/7QLlAgrKY96FN7mdqjmQtevzL6nOvIEjoYLYFVA?=
 =?us-ascii?Q?alng70JmiXtUkPLAs2vLBPU2Zi5M6ZUGPUXXKDsbum9Y/L5w4jUq8KGGOQon?=
 =?us-ascii?Q?iBiD6hU6+CKELDZpEhAZkcyhvhb+h2R5YMUjiPV9iJ66Ajh2v4+hBCRoeity?=
 =?us-ascii?Q?FxTM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:22.9907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: ae779ee3-b849-400a-613a-08d8a18a405d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTKOiOKU7wCd0K7TYD3ZK2/B6Rl68kFoAseTT1jICWoqGt19mok9ApwHMlybfCTdmpnPSZSDmL2JabbEY9zvoNSOaow6Yd2frzanFipbNLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.135;
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

The test case #310 is similar to #216 by Max Reitz. The difference is
that the test #310 involves a bottom node to the COR filter driver.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [vsementsov: detach backing to test reads from top, limit to qcow2]
---
 tests/qemu-iotests/310     | 116 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/310.out |  15 +++++
 tests/qemu-iotests/group   |   1 +
 3 files changed, 132 insertions(+)
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out

diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
new file mode 100755
index 0000000000..a35e8e14f5
--- /dev/null
+++ b/tests/qemu-iotests/310
@@ -0,0 +1,116 @@
+#!/usr/bin/env python3
+#
+# Copy-on-read tests using a COR filter with a bottom node
+#
+# Copyright (C) 2018 Red Hat, Inc.
+# Copyright (c) 2020 Virtuozzo International GmbH
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
+from iotests import log, qemu_img, qemu_io_silent
+
+# Need backing file support
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          supported_platforms=['linux'])
+
+log('')
+log('=== Copy-on-read across nodes ===')
+log('')
+
+# This test is similar to the 216 one by Max Reitz <mreitz@redhat.com>
+# The difference is that this test case involves a bottom node to the
+# COR filter driver.
+
+with iotests.FilePath('base.img') as base_img_path, \
+     iotests.FilePath('mid.img') as mid_img_path, \
+     iotests.FilePath('top.img') as top_img_path, \
+     iotests.VM() as vm:
+
+    log('--- Setting up images ---')
+    log('')
+
+    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
+    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
+    assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
+                    '-F', iotests.imgfmt, mid_img_path) == 0
+    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 2M 1M') == 0
+    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 4M 1M') == 0
+    assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
+                    '-F', iotests.imgfmt, top_img_path) == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
+
+#      0 1 2 3 4
+# top    2
+# mid      3   3
+# base 1     1
+
+    log('Done')
+
+    log('')
+    log('--- Doing COR ---')
+    log('')
+
+    vm.launch()
+
+    log(vm.qmp('blockdev-add',
+               node_name='node0',
+               driver='copy-on-read',
+               bottom='node2',
+               file={
+                   'driver': iotests.imgfmt,
+                   'file': {
+                       'driver': 'file',
+                       'filename': top_img_path
+                   },
+                   'backing': {
+                       'node-name': 'node2',
+                       'driver': iotests.imgfmt,
+                       'file': {
+                           'driver': 'file',
+                           'filename': mid_img_path
+                       },
+                       'backing': {
+                           'driver': iotests.imgfmt,
+                           'file': {
+                               'driver': 'file',
+                               'filename': base_img_path
+                           }
+                       },
+                   }
+               }))
+
+    # Trigger COR
+    log(vm.qmp('human-monitor-command',
+               command_line='qemu-io node0 "read 0 5M"'))
+
+    vm.shutdown()
+
+    log('')
+    log('--- Checking COR result ---')
+    log('')
+
+    # Detach backing to check that we can read the data from the top level now
+    assert qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
+                    top_img_path,) == 0
+
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 0 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 2 1M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 2M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 3M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 4M 1M') == 0
+
+    log('Done')
diff --git a/tests/qemu-iotests/310.out b/tests/qemu-iotests/310.out
new file mode 100644
index 0000000000..a70aa5cdae
--- /dev/null
+++ b/tests/qemu-iotests/310.out
@@ -0,0 +1,15 @@
+
+=== Copy-on-read across nodes ===
+
+--- Setting up images ---
+
+Done
+
+--- Doing COR ---
+
+{"return": {}}
+{"return": ""}
+
+--- Checking COR result ---
+
+Done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 9a8394b4cd..9fa72cf442 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -317,3 +317,4 @@
 307 rw quick export
 308 rw
 309 rw auto quick
+310 rw quick
-- 
2.25.4


