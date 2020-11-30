Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC62C85EB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:54:24 +0100 (CET)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjdH-0002KD-8I
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQJ-00071J-3A; Mon, 30 Nov 2020 08:40:59 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:37262 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQD-0000RG-5T; Mon, 30 Nov 2020 08:40:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmngxaXTHTKzSqCNpW9k+FLjrbbgapl2qgnPfmbntVEX2mG7UEEoWr9G14Wn3LtLoBmJYCHoF5NW+qHX+8xCopdLl7aANutpQGyiX7OnXRUUZgGTJKHDia66GtnARWGkbC13g8bRyhz2dKIqJXlw+W35O+zTomrtEcuEQXeYZ0L5dzZRtQBEgKhv6mO+Awm/KZLqUWIYjiUAmu2MUZgUxRF08R+z7KwT+Os+II36HH+UubIUAD4WRHjQIX+Nw5QQE+m8ZdSn1jDl6oJjGvioUr4d+fqsHTC1SwLd8kr8r/N40D4mvgDmyI8OEPOD8rKr4s2pKxSN5JdMSkJyQCUV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKYCtRBCRKH+QoKt7KmBTfV113rSvbTK9IirGwZ5Ptw=;
 b=Ys6tR0QbSerFJl9PFKhBbscuUUE2FruvFJOZ+NBxhY7iBAP7QT+X2sNP6Ef0UWR/MhaNaicX07nf85E/RfODo0cbcgCXnFl+e04QBlKIdTAL4k3SaFCkFGqHMFX2LRTMFGU3vFtxhcoowusYfrxc+F66qCF5sa5u30fPjpzdEAsQZy/rpOpj2YLdvH0pKHLg0brqbeNjmWB3kIOx6JHHu5G0gAwCXKyxYEy0R5KiVUswERO6FbHTi384Bc3zRdz8+FiM+szmpgsU6Chh2F5y3fLz1J2BoIPmLucEwXV2BLBqe3JTdfMR2JPjl/llgI/sY7lGTd83Kc++kFlWVVyY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKYCtRBCRKH+QoKt7KmBTfV113rSvbTK9IirGwZ5Ptw=;
 b=HAv7RhulzSbySuogxWCDeg/zzYLMzCTE2bWKBgelVcWZML2i4hgC7evMvnGjr2KYsK53m3PNp752eHxdwobpXwSGwipmdBd0LKwcJhd+l+TTCPxv8GKJ6ajYv1tNBejNQ0n4RYuIWjJtgITxnlpQE2yKwiIgopJ97Syvju2yMU0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 8/8] iotests: add 306 to test reconnect on nbd open
Date: Mon, 30 Nov 2020 16:40:24 +0300
Message-Id: <20201130134024.19212-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f4ed9ed-80f8-49f4-ef96-08d895358a14
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB34471BF0D7092A81A7EFD7AEC1F50@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KnotW7GwvJYRTpDg6kG3nYLEtRm6H5OFMPqSgeaIDGF36HdAjfdJFV3bA/0AP5IUEdMT5BcBu9pWAclqyyg0C7pW7va7gYOxLg3xOTES398hZyJVHLG98CuYTjHidPr1PhjuZgIeQOYlAOcTHrscYQPzm+4ViPQ0b3JPfEgll2p7kBTBuIZjqFh7HDIUJTkoj0YhZMRivLhmNzFcb+XvinzlI7YoE/+kYnFcs6BrUiyMZuuxVuqrECV8tukAnwfNfqAZE/AygbI8PhbTSWzrtfo2i5M3bLf1uKqT+jEUPjmk3jz5511FHLJEhxqnrgfhOzT7qLMm2aZ9tXvbvFPCCuaV+fDtsK6o/RWJPurWb8PiTTpCpIVs5CtEyyApOSoyitPtcmVihpjK2zADYFSLOqEdEUMzB6A8oBbF7YDCKVuKHbPQksR+byqB0+lDvoobvKzEGpRPQwqfskO7zkIRzAw5cgZF5lVJDjaB4KajvRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39840400004)(52116002)(4326008)(2906002)(1076003)(86362001)(6486002)(26005)(107886003)(8936002)(316002)(66946007)(6916009)(66476007)(478600001)(2616005)(16526019)(66556008)(186003)(6506007)(5660300002)(956004)(36756003)(8676002)(6512007)(6666004)(83380400001)(21314003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pJKbmuy77P6LIjZ+pfeuvuTZdoV7uW0Xb1djASkv90SwGcyzHWRm2WbWA38G?=
 =?us-ascii?Q?1SPrvGLnSr1DcoanE6zxiKLrePFP7jOy64s69NzCm6+CeC9nZbfFN4MaSpvY?=
 =?us-ascii?Q?Gr9aI3+3lq2xCheYTc2Qm5XtRoLNIvWTUZ3YpxhN/P4sPLs9PUD92+fMbmX+?=
 =?us-ascii?Q?TpNmUHYHXlwsC9Ep1Kd/ehr1NqDOkyG8yh1ZlLmKKOfy6cKgCt07zIr+3s8P?=
 =?us-ascii?Q?+1RuSYLm1ANkMm9VPFPJr6KHEpXwtRpkjcn24/TK10T2zwAbU5bvWScJEWW0?=
 =?us-ascii?Q?eU/PP3vSNHrJwRccNnhNgdtWETRPNme5v/2F9du+JBkjRzHdShNUFM3s5l8k?=
 =?us-ascii?Q?c3Epg7vZosnzRgwqZF3x9+AZF0l5nlplhQ9sisefBRoANh7N9eS4YAblNSrf?=
 =?us-ascii?Q?xj3U/p/OklW8HX1qAlWtoQWandOFt+ii3J4gPYGmVXPuwxRRsqNme/RMwzsg?=
 =?us-ascii?Q?6Ca5Si9OO9H2CpyXV/rwxTSj8QuX+Oynbg2JPOfyVgdsJfXUsUA/iNrynd12?=
 =?us-ascii?Q?AqF1vB5n4rMtb8VQk00VTAWpkzi4lRnjxQt5QL5UVCVV9preqqIjzDhJmazI?=
 =?us-ascii?Q?Pz1jGPThEK+ErpOg7P2J3g10BScXjzkje4zzB3SdGgXqD0NL+IgiNwrNzVLZ?=
 =?us-ascii?Q?UxdE2h1qlfY4SOx9gqNYGGO1UPX0gDmDztDMeFDVzqTwHHOXU4Y8w+YfTJh7?=
 =?us-ascii?Q?8or40h3aBMAZBTpgXS+iYhfIi01S2jb3wGyb/isb5k6OW5NLtpYpT8Jw1z8b?=
 =?us-ascii?Q?UQMLrTdP55Jo9GmnY38gDXAx0vGe7EMIb8p7So04UAFXbmLSiBqCFVv2wTxJ?=
 =?us-ascii?Q?zEeiMCLjMddAQAKzKWDReIW97doDZk/fQke+mRSZlIiXtq+bI0yqiKoYtbZm?=
 =?us-ascii?Q?6syFdIPWHYPVkIncDutG4yiEiAuXTkVORnHxbHgLQZ8crf6eo4wIaxAP4ABy?=
 =?us-ascii?Q?KwDn+9Y3AHAk1z5PdBMukibc265B7b3+2UVid2Jrhm8Uj8+odpBeVqL3Tjjg?=
 =?us-ascii?Q?8W3K?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4ed9ed-80f8-49f4-ef96-08d895358a14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:45.7469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdvHPqEV3w2WX5TatKsp1a67KN0Jl+IGFH3nQCFGel9te/onlDV/x+I/KW64B5EdEQodxoddtOhXxKGS+4TXA4nUuCkyrIzkxONfCVaggn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.6.102;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Denis V. Lunev <den@openvz.org>
---
 tests/qemu-iotests/306        | 71 +++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/306.out    | 11 ++++++
 tests/qemu-iotests/group      |  1 +
 tests/qemu-iotests/iotests.py | 11 ++++++
 4 files changed, 94 insertions(+)
 create mode 100755 tests/qemu-iotests/306
 create mode 100644 tests/qemu-iotests/306.out

diff --git a/tests/qemu-iotests/306 b/tests/qemu-iotests/306
new file mode 100755
index 0000000000..85216cf088
--- /dev/null
+++ b/tests/qemu-iotests/306
@@ -0,0 +1,71 @@
+#!/usr/bin/env python3
+#
+# Test nbd reconnect on open
+#
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
+import time
+
+import iotests
+from iotests import qemu_img_create, file_path, qemu_io_popen, qemu_nbd, \
+    qemu_io_log, log
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+disk, nbd_sock = file_path('disk', 'nbd-sock')
+
+
+def create_args(open_timeout):
+    return ['--image-opts', '-c', 'read 0 1M',
+            f'driver=nbd,open-timeout={open_timeout},'
+            f'server.type=unix,server.path={nbd_sock}']
+
+
+def check_fail_to_connect(open_timeout):
+    log(f'Check fail to connect with {open_timeout} seconds of timeout')
+
+    start_t = time.time()
+    qemu_io_log(*create_args(open_timeout))
+    delta_t = time.time() - start_t
+
+    max_delta = open_timeout + 0.2
+    if delta_t >= open_timeout and delta_t < max_delta:
+        log(f'qemu_io finished in {open_timeout}..{max_delta} seconds, OK')
+    else:
+        note = 'too early' if delta_t < open_timeout else 'too long'
+        log(f'qemu_io finished in {delta_t:.1f} seconds, {note}')
+
+
+qemu_img_create('-f', iotests.imgfmt, disk, '1M')
+
+# Start NBD client when NBD server is not yet running. It should not fail, but
+# wait for 5 seconds for the server to be available.
+client = qemu_io_popen(*create_args(5))
+
+time.sleep(1)
+qemu_nbd('-k', nbd_sock, '-f', iotests.imgfmt, disk)
+
+# client should succeed
+log(client.communicate()[0], filters=[iotests.filter_qemu_io])
+
+# Server was started without --persistent flag, so it should be off now. Let's
+# check it and it the same time check that with open-timeout=0 client fails
+# immediately.
+check_fail_to_connect(0)
+
+# Check that we will fail after non-zero timeout if server is still unavailable
+check_fail_to_connect(1)
diff --git a/tests/qemu-iotests/306.out b/tests/qemu-iotests/306.out
new file mode 100644
index 0000000000..a35ae30ea4
--- /dev/null
+++ b/tests/qemu-iotests/306.out
@@ -0,0 +1,11 @@
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+Check fail to connect with 0 seconds of timeout
+qemu-io: can't open: Failed to connect to 'TEST_DIR/PID-nbd-sock': No such file or directory
+
+qemu_io finished in 0..0.2 seconds, OK
+Check fail to connect with 1 seconds of timeout
+qemu-io: can't open: Failed to connect to 'TEST_DIR/PID-nbd-sock': No such file or directory
+
+qemu_io finished in 1..1.2 seconds, OK
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 2960dff728..6ea7b83c1e 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -314,5 +314,6 @@
 303 rw quick
 304 rw quick
 305 rw quick
+306 rw auto quick
 307 rw quick export
 309 rw auto quick
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index d7b488f7ee..2530185220 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -208,6 +208,17 @@ def qemu_io_log(*args):
     log(result, filters=[filter_testfiles, filter_qemu_io])
     return result
 
+def qemu_io_popen(*args):
+    '''Run qemu-nbd in daemon mode and return the parent's exit code'''
+    default_args = qemu_io_args[:]
+
+    if ('-f' in args or '--image-opts' in args) and '-f' in default_args:
+        ind = default_args.index('-f')
+        del default_args[ind:ind+2]
+
+    return subprocess.Popen(default_args + list(args), stdout=subprocess.PIPE,
+                            stderr=subprocess.STDOUT, universal_newlines=True)
+
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
     args = qemu_io_wrap_args(args)
-- 
2.21.3


