Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AD2CF69D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:13:16 +0100 (CET)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJKF-0006VJ-SA
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFh-0003Rf-VV; Fri, 04 Dec 2020 17:08:34 -0500
Received: from mail-eopbgr10108.outbound.protection.outlook.com
 ([40.107.1.108]:31004 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFf-00024O-KI; Fri, 04 Dec 2020 17:08:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbixIhu7sUHbSh5ydtW+Ln0yBPpGaeeudrnvXGmOIw6u6utFb6YxtkAmMnF/ygc8s27EaROIUEv4i3WkHOCNwUFHq1oxVAGAu96pqJyFrYjvqWlbiOmUuqb7aXUAgzw9qYpeYxU5nAF9zLN6owfdq1Jz7frJjil9Y/OqBJOttM92gJWQseSuU9uFRtq7CuZear/G4wul6AuouQWD9YDdLmfq/1uCOKoIy6dt5MB2eYOJoCLKKSLclU8U0ekAICTx6S+dZ0GgrbANnggoqZ9Z5eQo7LzC08lHX1mNnmwiKe7m+/WHL/ht4TgSmiUZCH8xWZ4wwbAgwsQGjJI9HB9QeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhjit309SsaDAyHmAW5qOvGafsxH7cNQvCcY7rL9WZg=;
 b=K+u8sYyKI9/Pi4HzY7pDidk+2pxrPqKWXvH7VpVsOjp+ogcoqfHiwBpTFfQYKbu7WFcijIp69YbC2g7R6DEg3NENrM/6DfQDNRYnFy0W7wrinSpPEJT5xw41ykfqvqfE7S6t1tUXW0t3Wq8DAm/UlwigWm7Ng1CqjlDPqpM31igvwBzB0jsSyG66YeB2MSxg7KJYOvFa63KMHsnr4yOCBFxs0lSUaQi+pa4gkscDEkyr30scUgn6GMOKVBXD0qX9IXp/lfhEUPQoUZCYG2FD3PMzsMK4spTAmAdvOISJqwqf3vIFv7KQaAhZNjcsQIzUNdvPSBC77RE4dXWwnV2gfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhjit309SsaDAyHmAW5qOvGafsxH7cNQvCcY7rL9WZg=;
 b=T9S4Txb5Sk9mbJK+OOem8vNCTb0PDy1oxAM/4ntlKYgMfTzfIXjMtdjxHiWdewfgy8d4rNJ5Dh3TTrb8xhbyLkhbOawHN3u8cZ/XSYuhUncUmrhBRv03AUvsQ0pOwtU+XALP6ZMUuW4FLrg9CSh90KTvR+yZOYHBMTnUbz0mCt8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 06/13] iotests: add #310 to test bottom node in COR driver
Date: Sat,  5 Dec 2020 01:07:51 +0300
Message-Id: <20201204220758.2879-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 371c8d60-0d88-467b-17ba-08d898a11b94
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072E3861897B6B387E15ED9C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSQeegtxndQODMmQ1IaObzPpoaBTvYr0TlSJQUazrPF8sLVOTZNyjf0D3uD4xekeEKXK+cGGEyKeuZGeRozFbBQWgfQVpAV4cr6UJHB/u6FRQnz1PWRnrylcOJGohr/A691wPxFAFM0/DVYQnQnuLpDP6KmQh2o1ryRAq3I8OcFrW/VHMp16uCLJjIVpjW2e/p8YFMMCclT5ec5VJ2r8StgWAROAZROPtrgwvkMOlv7n+JVqC5/+jyiBD0IxpKP1+isN/7jD/VRnndeVbmxggCdVnOVQgQUDaoCdCmWPKc5lbsMJKbr+Cr2ZJF7ZF3sLDV+9DusRtubToz+S9xlMjTm8MDmXkWwV9w0b5+QpXoF5xqlP3iCgZNv2+zf49pnqGVPXs52o7wwTasmvLr4RANwb11cOk3XgIvKLl0yorw7eq/X9HfNHDMF/zahhtczsmBBggrAtOrfsxTl2OOINqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4Xxu/ukHpkHVQkrbR77OVG40WALOlz8k/lSzqcWWoNUnrd68QYem+Ic+qgPa?=
 =?us-ascii?Q?T+MnU7Z8rv0hha3ZzKal6iZ8uEeccZILX1RXdLjWwp/Dyxqx3Ad7uA5H1upZ?=
 =?us-ascii?Q?2GKS3YGhugTOfRiEpnXYnrQmPpPHmY4ScSymPDvMaKDwgX/dkqXOd3FOwju5?=
 =?us-ascii?Q?lfK3utZixSp4pA0LFScONJ4GULMUwx00aAJlafg3Kp8KqnY8Hjjslsl31cKt?=
 =?us-ascii?Q?OjqJ9QfEIEtTDtqh9UEviefCO9JzKSnZVpnFzq5n72QBS7byyfiPhJ3aABSG?=
 =?us-ascii?Q?R0xCzrknQ0JDYiZsCEQzEZltcoF/lDuE9IpBtvRD4Md9LpyJ5dFnSM6yriQp?=
 =?us-ascii?Q?gvCPYM6T9wA2pG4ZujXHI9RaGWehCDL9S0pZjplWpphogcxl7SaPLNlpk5qD?=
 =?us-ascii?Q?YprY1rdIB6h1fr4xRB20v10T3piTrSPfYCS3/fXa7KZpOkV3m/++F3ISfdQX?=
 =?us-ascii?Q?G4yww5OpeCPSckiL0vH2FJ5frZfrrmiGv27gzgL1p+sQVqSMHUoT8vPAof0C?=
 =?us-ascii?Q?Kqd/sDy6RW9I9u6CthEbG2vNmN1Ugn/xBNXpzFZoTV4LQrtD0amh/RMh2FzT?=
 =?us-ascii?Q?LUjX95bGT/dHDANRPRGgPvElTMeZtWIMdIKEHwsJWVHnjEk1A6DdEzL7cPWd?=
 =?us-ascii?Q?2qAiUTLInkLkbO/TSe3nqieqtZa68k8viQYuqVuo3gBkb7MgVglLinnwg3sQ?=
 =?us-ascii?Q?bJg/9xCVVZIp7NAAzFJlXh7xES3RIDjiqPtnRs+VOhUV1m8l2/fZMTEmw9PM?=
 =?us-ascii?Q?tyyiWqDj3mfZwbnP9orFEHGjAxsT9lJ1E041apGbcBQJlMkFfIrL2t8QteCs?=
 =?us-ascii?Q?nasRTTR0Bfw28dBKI2lHpifhYqVxlOhbBnSRf/EsUl6MunJ1n9Oo/iwudJz6?=
 =?us-ascii?Q?RdmRNG+4pIMxi2p+cxmICA0QgX6WTHzmqwigmeU3E1HfnIta570bOVJDNDBe?=
 =?us-ascii?Q?NTsJHBjb2AqxX/EqJYy319S0o06/IXmLpb6HCT2xLna14p7MNMgtkAjY1jUW?=
 =?us-ascii?Q?vVDc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371c8d60-0d88-467b-17ba-08d898a11b94
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:19.4116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjFMtO9OOFz5UMYY6ZwX884gZ5UnJeH9t7NdeUEYydS9X47fAlChEUrk52aMERNrs4G+1YmAdC8tu0WnxHRZ4chIvrRpZ4XaCqf4xUj6q98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

The test case #310 is similar to #216 by Max Reitz. The difference is
that the test #310 involves a bottom node to the COR filter driver.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/310     | 114 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/310.out |  15 +++++
 tests/qemu-iotests/group   |   1 +
 3 files changed, 130 insertions(+)
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out

diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
new file mode 100755
index 0000000000..c8b34cd887
--- /dev/null
+++ b/tests/qemu-iotests/310
@@ -0,0 +1,114 @@
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
+iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk'],
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
+    assert qemu_io_silent(base_img_path, '-c', 'discard 0 4M') == 0
+    assert qemu_io_silent(mid_img_path, '-c', 'discard 0M 5M') == 0
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
index 2960dff728..2793dc31be 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -316,3 +316,4 @@
 305 rw quick
 307 rw quick export
 309 rw auto quick
+310 rw quick
-- 
2.21.3


