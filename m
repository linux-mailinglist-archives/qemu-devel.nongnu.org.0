Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D304C97B1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 22:21:07 +0100 (CET)
Received: from localhost ([::1]:43022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP9ve-0005Ys-KW
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 16:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9q9-00015u-14; Tue, 01 Mar 2022 16:15:25 -0500
Received: from [2a01:111:f400:7d00::71d] (port=61056
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nP9q6-0005bz-Re; Tue, 01 Mar 2022 16:15:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaTvK0PNkpI12Y4wkza6h/dppUFS1BNloCKHWXeGx6F2k0q+WY/qY4lMVfmMA5luP8EbH1qBqZeOpogbie7D6qW8nB45HfhwH1CeDiTFZe3R+li5kyc08VxOpx8fog/BZE525wl0LB9lFIZDoSrfKaK/BOEvxOsH9fWRkKd1SuyqRo1cmP4exBa/kgx2aC/wPqWZRrNydsd6u7p/qf1uo0xzvaVszxQRtpBH7HO1hgkp12CAb3aYxQBUIrZ9hkjo/Pznbb7fBO24CtPwlgs7S0Y7/2ALr3bUmQbXKrdw9l/3KBV8P0aJGMyMK9qVrqZexxdSoTEXOi4p4onCnRQGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxa9pdiIlYG224un95jOk7Llo5WO8kJSjQk/osRjrkY=;
 b=QHvQ+ci/kxEro6/uF0l6WZzzhxjrHaDPuU0sZFINJ3IcfawWnerKtoIV1wgXAlzZPAqiQFPMGoXxoXAv/C4/jHKLxXI+SSdTwTPm1VnHlfpAFni32G5RfYwWz7owoJDlKAi9qNvLgrXuk3i18OlmMOFV1Mdvz+O07ctpwMcg88eerUiRqRDduu5Tvyhj/5paHKhB10Zy1s+gV9Fex0mMKnPeKIr3eHazzc682kw6nY2+OU5xJQIaMIOKIb6GqvTzGid0svhTuHxQE6fyhSYV/ffW8NwP5aGOmae9uBN6dRv4X3F2n+a2BQnMAKteoYcUvT1OGm8V0a76AAJukJOHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxa9pdiIlYG224un95jOk7Llo5WO8kJSjQk/osRjrkY=;
 b=gRfK7e/gKFrwLFiT8yR3tyxGaL4GLOk++OooHRxhx7PYTnGE0Y06xv/PX6A7SailsoudoiyHrVtyIJpHwWZTGfPxkCq6Gee60zbgsmvAfouYKzgK8tT1ROygzOGDtJqw4zHfwO9k/MBQQc1VwWlz/AE8Jn3O7h4oMhnRnGdpkeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by VI1PR08MB3710.eurprd08.prod.outlook.com (2603:10a6:803:c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 20:59:46 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::c52a:4f5:95c1:7f1e%8]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 20:59:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH 3/3] iotests: add copy-before-write: on-cbw-error tests
Date: Tue,  1 Mar 2022 21:59:29 +0100
Message-Id: <20220301205929.2006041-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
References: <20220301205929.2006041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c43e9d41-0b82-4d8c-6a23-08d9fbc66aed
X-MS-TrafficTypeDiagnostic: VI1PR08MB3710:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB371045E08FFE0675765D2EC4C1029@VI1PR08MB3710.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qwvW4jcirlio5kY1dNxPkhWR1jIjB0QmzFuVf+phKT9hmzl/imYYA0Z4T6/+5BMiOYEzhJz+3WpPR/8fBswfUHnK9XHbsqIxPxqE9+4AFZhQTdfLFDwkAxb4jJyG29dZPJh/oYaipcp9Hxcf6dJjUJql6yae/j30KDffJN7vnpkTDi+9vGxL0WhqzSgIV5o5JP4WmcHXiZfLKA8E2OGwWtD5+AlpC+t9YKcPv+SliUnnpREGObCfp0qQ9pJvIV1GHK+YKokPdx9j/+VAOJ5j/MNgx6Yf9LjyskYvCh/FNLIV3r37k5+CvvFEByg8FPCphgoLrNLbdGNMN/j3qYDoh+AEht2Tr6TlytOqCaEOR5c4f/NF8JloI5Nkp3+k4AFUhxA1zsJ53fcKdoahPheK7sk6q0bV/ACWMlGaUrlCHcEk5mMk7gjbvSEgQAncZowtUo4/FaRKy56PCH7YaOVMIVWcdZHMVE1NwTjeMnu+H6X6sPps3FZq7EDFtBsD3jqCV9JmVzmv4zIr8P6UFlceMhZowoKXjWFQJtL8lJlWAyP95QjxaF65ZNyQ99uZ/Wil4xBqUPzDAgdIul0Nj0b8lDYL0g63aKLBZzLVhPXVWP66h5/SMBbGQpishdJSLO006xtTO3RPGWmtCbBR8w2EgHEQk3qDr7QF8p8U6MW6iGxZS5whm6M0xb/DhI6WTezUCsVDNMyUg2XW7nUDej6LwFvdoN2Rw8WXJabj4dkOOTfAzyYETOAcPOOpMdXztdOxkZzVHWeQZI7Vw5cDfQHMGKINjcoTtNko1vEf+9PyuX9/Vw+yR53dD2/bTLw+qpvvjztGgNqhm+T7PzWD1bD4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(1076003)(186003)(2616005)(83380400001)(6512007)(5660300002)(8936002)(6486002)(508600001)(4326008)(2906002)(52116002)(6506007)(6666004)(66476007)(8676002)(66556008)(66946007)(316002)(6916009)(36756003)(38350700002)(38100700002)(86362001)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gpr6pX40KfT8/qxrcczcRpEh21GKWpi5ezPN+ZbQmxFtrVFbZrQqzhF6zjwQ?=
 =?us-ascii?Q?MBpANU/42Ap9b4UhC5l9YOKXAbGHRheNBs2SwE+0XmsTHQAnUbMCThXvda4d?=
 =?us-ascii?Q?MBB09XJMpURqcmTumi6KUnLWHi1JVxekxjhaWoL8ouf8ozuAuTstwCdNNvIQ?=
 =?us-ascii?Q?t4aqOXdLqT8arlq3/WG0wq0Jbs2gIDVuqnu48ImYZYnSgFRSiVQNyY66WwRe?=
 =?us-ascii?Q?EZymB1tuNG4h2nU387C4xGlAeNCn0JM3mqLUlc5G4qBAYibNiSJJ7QzbVjG9?=
 =?us-ascii?Q?uqo2rLhXu8DEA6DkxCM7QTtkYs2VFscE+elxClgV13EtZc1FX06J9A8c+95A?=
 =?us-ascii?Q?p/oC240s4VjxE/IDf6bm+aXY4qrnsx7Ro4WtTd12DyM0ipd+BvcfsfF9BGth?=
 =?us-ascii?Q?YfLCCZM9M4Z1Hp2U0ZkG/RpwZPvebFsKaKBG8nEscdF44XcjR92k3ByuwoU8?=
 =?us-ascii?Q?oVtw295UrWKIluQ72wo6ERpoHpr8zeI5sK63w8kHl17CLb5JPzCWjeq/lF5C?=
 =?us-ascii?Q?fOWbie5+xHdjfSSwoYccsW3ZCuFz2wPiCcsyBIrP9DscKq8Sn3JZ9CPGI/Z9?=
 =?us-ascii?Q?+p+h0WdXXQe/PDwM3VoQH3l7kohWO2vtOLVe6eyeNV656sP8tf/6ybCbgOYi?=
 =?us-ascii?Q?D8PVMJ9alTenICPWaUxTSMxm618NJiovSg1VQAe2mtYuQSKgz928+ptSDwsU?=
 =?us-ascii?Q?yJDL3Af1uecUhjf8ygnxkzAcPzGwdvaQYyd85PmHQ/4grmzoH7mymav26/sU?=
 =?us-ascii?Q?eTFwaC1WwNtqOAcNuzKUmlKrOnpmWIEScPIc+PicgaV0XwuuFtfB3rOxerhf?=
 =?us-ascii?Q?bWsDA/2XXnL0PoNgzWhzZw4WwPvBIxgOXc+K8rSWZ8xOCaT+nDKvd6ZtQGY2?=
 =?us-ascii?Q?UI4hkL+AGiaXimEZX3/bTCLt0J9sgF7INxvBPGMqvVHd/JwyUd+79seQbNz6?=
 =?us-ascii?Q?V5ulx3xT7xt2zFWFFGyv0Fj9FsLqddJ7/AcW1pMDNkQ3l2X4iMg8SBXTpPdZ?=
 =?us-ascii?Q?8HlqVIrqcTUv9xTYnfOhNOfdsIaye3ho/8Q3WDJLzQ9+pE0q29Ezb7AGJR2/?=
 =?us-ascii?Q?gDoHZwT+8WgG8kTTsK2NFZH6SZJ663JvkYvkDluL1pYy3tonMflFABe4R5iX?=
 =?us-ascii?Q?IhFJzx4DgI11q6tSF5UsQs5BtDwHsFScY38LYs/E2YtzTfZIEW+AzGgWPU5h?=
 =?us-ascii?Q?df+n8CtGp3/t8VC1Rph3oshGRXdq7SFTa5KBPu4ZlkS9iILXq9Zi9CyT+Hbp?=
 =?us-ascii?Q?vnpoDlUcvP2qgr8ZWtMlSjeLU+RIjZ/39DB0xradzDgG/j5tBDYB1GTmGYMa?=
 =?us-ascii?Q?mEnMvsZV0LYEQy9q7aKVsugnOnaalkC4js1McQR/cDGicoelqACA1njXvDEG?=
 =?us-ascii?Q?EFe/qzrMGhd/DSqVj9kLNxE62YMyAIkIC6LvRCmvR++ZJuVX/EmIVH26B4aj?=
 =?us-ascii?Q?/cqy2jBlKJv6bdZrLRQvgUws76uptyKSulxJSWaGeZHL46TRKUJclFr6YTHO?=
 =?us-ascii?Q?PXAQvoyNoB/5rcQk5q+9z19RVH6JLUd4ScF+69iVTAeXmcl2IpS+hUa2VYXB?=
 =?us-ascii?Q?ZDR2RmLIosEdmUSrZPKyr+TDJH6TpseJmS0qug4w7ow41LAAuswd4cwNPH4h?=
 =?us-ascii?Q?iupBE3hpm0k+5ycu7VcQw3ezzPQzIXV/Y4Ut9XovKln7EqD+ztO80E/jvz+p?=
 =?us-ascii?Q?tsvSqYug2lpJvnkENLC8ICKT78o=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43e9d41-0b82-4d8c-6a23-08d9fbc66aed
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 20:59:46.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzMcm6Zqgj9GdEh+KR1U9ayXypqb7DeRIU0d2H6nT8rJQNLK5zaV7j7WI8ubkWneocHyEQIMT7FXVz1jpyy8iSb8JdHwqCVlhs/R9yhYRWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3710
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::71d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Add tests for new option of copy-before-write filter: on-cbw-error.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/copy-before-write    | 128 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 2 files changed, 133 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
new file mode 100755
index 0000000000..a32608f597
--- /dev/null
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -0,0 +1,128 @@
+#!/usr/bin/env python3
+# group: auto backup
+#
+# Copyright (c) 2022 Virtuozzo International GmbH
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
+import os
+import re
+
+import iotests
+from iotests import qemu_img_create, qemu_io
+
+
+temp_img = os.path.join(iotests.test_dir, 'temp')
+source_img = os.path.join(iotests.test_dir, 'source')
+size = '1M'
+
+
+class TestCbwError(iotests.QMPTestCase):
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(temp_img)
+        os.remove(source_img)
+
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, source_img, size)
+        qemu_img_create('-f', iotests.imgfmt, temp_img, size)
+        qemu_io('-c', 'write 0 1M', source_img)
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+    def do_cbw_error(self, on_cbw_error):
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'cbw',
+            'driver': 'copy-before-write',
+            'on-cbw-error': on_cbw_error,
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img,
+                }
+            },
+            'target': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'blkdebug',
+                    'image': {
+                        'driver': 'file',
+                        'filename': temp_img
+                    },
+                    'inject-error': [
+                        {
+                            'event': 'write_aio',
+                            'errno': 5,
+                            'immediately': False,
+                            'once': True
+                        }
+                    ]
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'access',
+            'driver': 'snapshot-access',
+            'file': 'cbw'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.hmp_qemu_io('cbw', 'write 0 1M')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.hmp_qemu_io('access', 'read 0 1M')
+        self.assert_qmp(result, 'return', '')
+
+        self.vm.shutdown()
+        log = self.vm.get_log()
+        log = re.sub(r'^\[I \d+\.\d+\] OPENED\n', '', log)
+        log = re.sub(r'\[I \+\d+\.\d+\] CLOSED\n?$', '', log)
+        log = iotests.filter_qemu_io(log)
+        return log
+
+    def test_break_snapshot_on_cbw_error(self):
+        """break-snapshot behavior:
+        Guest write succeed, but further snapshot-read fails, as snapshot is
+        broken.
+        """
+        log = self.do_cbw_error('break-snapshot')
+
+        self.assertEqual(log, """\
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read failed: Permission denied
+""")
+
+    def test_break_guest_write_on_cbw_error(self):
+        """break-guest-write behavior:
+        Guest write fails, but snapshot-access continues working and further
+        snapshot-read succeeds.
+        """
+        log = self.do_cbw_error('break-guest-write')
+
+        self.assertEqual(log, """\
+write failed: Input/output error
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+""")
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/copy-before-write.out b/tests/qemu-iotests/tests/copy-before-write.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/copy-before-write.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.31.1


