Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880DE4730AE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:38:07 +0100 (CET)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnOw-0004Uu-LM
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK9-00044j-NQ; Mon, 13 Dec 2021 10:33:10 -0500
Received: from mail-eopbgr70120.outbound.protection.outlook.com
 ([40.107.7.120]:48667 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK7-0000k5-T5; Mon, 13 Dec 2021 10:33:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWVDd5eKQGUDDjaI6+tVI3JJEMHhfQVv6WHkvknTX9V/97TH/cLdyxG/oB31A52s/nmLhWtFBsCFMjVe1lv8L5Fo4vpA4QwRgyWsqMM1J+mS6wN8tLB+e12oXTPJBJUpFXkb7BW0yzwHn1Ue2Oyy6crUhcO0CpR4XVklz2xTHilHmxFrgqM/VdKd3qaC2qdm1Qc276T3+WE+M3EUAwTIevMBLCVSDz2pc+7/+cG1Gy0VIHSkalG4vpZJp7AoByI6kjGHc6QoCra6ShNz9P4N9ZrXg/74bCQrCKnxgGP5SU2dIcRQNUtp25fia1xw38a9O38ArTkZG7KwiQN2u3HA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YohgdZU7L2ULZ2isSszwdFxgEwRmjK4/Ve5RA8xyJkY=;
 b=kxODDp/bq5CEOWGOKi6PJ12m7uCRo4eFe4F3xPyl6vk2srPT9XcoLf9FaqHI9o615QatobYZWmbFXxe3A/GiA+axZmiGTEQ4Et3X96Re+Rm57WzdChyWquXyntDXRL0n+ZyHRDwRhyBG/LPYPly/808+6hABVELblIO6Nu0i8GvPA34YNe4L9fsd5z+MGrpVgE735qodv/Rg2lzDFufIgSiqMsqyOtX/Jp7LHKBAH+VMPxdVWVgvStZVjERxZ+BhFwk5sImOV0qyixDommyIk4okpUyJpZqMnmhZUiQj3BaCbz4EtMeHX8Ze2N33cHqdzA0++tkxZCOQ/4qRampZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YohgdZU7L2ULZ2isSszwdFxgEwRmjK4/Ve5RA8xyJkY=;
 b=b1KbZt15014sPHJzu69uSqkpD5wf9mv+ympy47ga09Mh27QhHC0Kyvjw2cArFKM1oKypXizYjr3S/GZqAHndWSA7U0kA/YHk4BiI3yMZxizbb1v9CZAvb8iQ4GycErLchRa+phzwyxAJGvn1HVLdh11pwNmqhLkVFfbhw74CwP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM6PR08MB5094.eurprd08.prod.outlook.com (2603:10a6:20b:e4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 15:32:54 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 7/7] iotests: add nbd-reconnect-on-open test
Date: Mon, 13 Dec 2021 16:32:40 +0100
Message-Id: <20211213153240.480103-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213153240.480103-1-vsementsov@virtuozzo.com>
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b0853d6-c501-4f2f-8312-08d9be4dd4c4
X-MS-TrafficTypeDiagnostic: AM6PR08MB5094:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB50941293A8E1B979CC48C4C2C1749@AM6PR08MB5094.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHD6LKx+xcrQakJo2JmMMDCnLnH428EAfBUuFzfV31Hmkoy13Ct3HGUBNOlCN6xkHBJRFqP59a9VL/6SEahm/J3miNpamDzYY85crRjytpWUw9foWm3JTEBMtaJYr8VETdGWdQlm5WEwn4beu7JYyKvge7m5/iOsP/ouXzsTcDZwE6RQRWKdwUaJIA+I+QdHigDOfMeuG38+SXuGNyLf1LPc4p4fALGqNx2argwghl7ZB+64pezLZR3PTCvHBHpfAxxUddQTOZZOX4kmycpN9Ds7GunaZsaENksmLNHFrPxgT1mnPihtfsAQduaD8UhcPqQzv/dbiUgY/26E62wzuSXJuY8dzA22hc6JW8kiSk5SsusmaL+zRb/EcPF7AAGtLlABPvoTIti6Sw10YwguQuMxPbnGoUW6hZTbmm4QuwW8mqOpn/k0i6/nsHN4+7CLQCBfzGzI6wT9+QVmZ2oJ+UapZuTWwxYNlVdDgyEYlp2pMpFkM5Npqiww1taa1FeH1bD2y1lYWRTmrDG0LDV+vnux8X39dYnJfrXg8DelwboImmuXCV9WblAaqOtikhwU9gxCszONoph/JCh7cOrZejoKhMoppx3iMmVVe4eUOsJKJf7LgogLhQ7Yz79n0bvwcSapeWi3SQYEd5h+8qAtaZjW8pO2uvx8hpltqqg+2yR2pupvZqBkr5/jIxG3UbIS3cvGgeLqkZsLia8qI4pc/Yvw8gtK6bum6ta86BfimliY6opF1v7HB2duuMW7boY5Zi3FO/+HqJXutMiY46Ks4HBlau7TbyWq0iCzsGRO4w0bpysuEcE8aitFYhNHL6PhSxK5RVoqp+cTY037R8loUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(8676002)(6666004)(2906002)(6916009)(8936002)(6512007)(36756003)(5660300002)(38350700002)(52116002)(83380400001)(26005)(1076003)(508600001)(316002)(2616005)(66476007)(66946007)(86362001)(6506007)(66556008)(4326008)(6486002)(21314003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XZTc2suXXc/s4tSoQoERVWm+oD/0JaqSURLlVzYsU0E0E1LpjDLK1CY39O/Z?=
 =?us-ascii?Q?gt72EUm5aWXDht+OK/nzBQIulF1t2kVnC/OW67XJlzPxw5IJw+vcF8g6/HbS?=
 =?us-ascii?Q?EpNt1ZfhTFGleS2YwoPQosbc0cGwR44iKymH/Y6BpkgB/nAlX5bPnV0/VlvZ?=
 =?us-ascii?Q?HIA+KBohb0vhjLPU6XoWr9GikEZ7CupmGu8WhqSpzXPRLfLTA8lrxnHV0MJ4?=
 =?us-ascii?Q?RpT/4zAHOwraY6aEMqQ0hIelTKBq4zMtq/Uqo2Izv2N4Tuj8R7EVBW+PU7UH?=
 =?us-ascii?Q?CeW/gcFF1Qmf+xKZXKDbaWT3gIgKl9bGxmtY6lLx2My7ONG4RMUWXERzPzYh?=
 =?us-ascii?Q?/0QB3klxeiAjNijtMPeCrwjdQvsZ3L1bCpXEFfqd+lTHi6gwerqywwca15Gz?=
 =?us-ascii?Q?Qp/CmLJqZlmU+nyIxZadQKsJrMCpbTi8s5vVtTDjalHtStP4xmhRD5zOe190?=
 =?us-ascii?Q?cFSG+WBgFQziFGJ+hdzyxHldbIPlTEUV0eBuyL8DuwnNfP8R3cACo7p36q+3?=
 =?us-ascii?Q?i2pp6w5rWwLHm4PmPHVcgBsKlXHrQe/cXCRpzgiUNnsLipwo+f2DWxh2q87y?=
 =?us-ascii?Q?D3PGpCRl8RK/m+bUEprOS1IVdQd+6dVwDH3EXpC9ESE6zGSkk7tnZ8dOhcsD?=
 =?us-ascii?Q?ePoF5zcxTpsphcWBiwRZlv+hk4g1UebBIAIvyBRmfkzX5cl9K7+1nXlO6imi?=
 =?us-ascii?Q?s4ZBBJ+e5BJE/BLORR7PGMjtjNxcLzkEcoz3lULAuJUjK8Fl9fmImfOuA2OK?=
 =?us-ascii?Q?4wm39hcDYw/G6qn/r+v91Ir78QKMwcWQV8kiARctSKQYINvXcveyNCQJIfLS?=
 =?us-ascii?Q?EbLqnJQ0q8oD4hhj0VgWDNqcV0IybnoWcNdhBvQv9AkNK3/GFjQEl2lT9b+w?=
 =?us-ascii?Q?l/g7LGkxgHroGbExpwc1JCPrsCmfc0OarHdNYMWZE5xnStlvYIsHi69E1PNR?=
 =?us-ascii?Q?vcobNZZeSlTKoj1206EfoBLFfli7pe5uxR0xYY70TImZ7k+DVE1r39zG7sWd?=
 =?us-ascii?Q?BaH85u0lsWF913u7OTFfhwIDch3uB98OeGnrRcpY3EcGm/KpaJNSdcg0K2MI?=
 =?us-ascii?Q?Ei4stcEn++rL9nUr1OHgKzSpYvM4TMMtd/Rkw2PK55Rq+hw6dtIoM7QHRxrS?=
 =?us-ascii?Q?bgSqYQbhmCNpydk2WowAIn3z7PpCPvgiKBRPHhSyNsg1N27f3d1ht5zZVQ7l?=
 =?us-ascii?Q?qESGFyZCrhXE8PxzYKCrWZ+uwKeMeeUyCxMH/bqI56ogjijTyjhWqOKqGNLG?=
 =?us-ascii?Q?bSu7NOy9eVexVmtsxktOuxel7Lp/O/VXgSsfLsvibnW9QN/qztl8QEH5hbyU?=
 =?us-ascii?Q?yTf5mWrJYdiDGw9ffkLJpdC9gwV3rOcWESmO2h54v6hHgVu9gSxMu3gVbA/0?=
 =?us-ascii?Q?qNB/r3vifxN8VBmux2sU0LPeXCxlHf7upwkorc+QtQKbG4pmapHfZSepX2df?=
 =?us-ascii?Q?UtGTW7nIDkoN8oNfqocUZgHuI46wofXGa6Pg/hcftjNF6KdV9wePCQmZjYAS?=
 =?us-ascii?Q?6Jh3KF2VUF5Mjk09qORZ9v7OZYPnRUOzJU+MWQyqdk9hQ5vHTRq6V4BdD9qh?=
 =?us-ascii?Q?2XjDJNqxnkLxS9bMcLU72qtzU+mVDpLQLXsVGFjB3HlxSi7uWlzX57pD2qMp?=
 =?us-ascii?Q?sD9Cbahfw8Y/dZFemQ28Ykxh145ZQwXiTSLEwP1mVs+BONl7nlDf2ogkenP+?=
 =?us-ascii?Q?qTfK/A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0853d6-c501-4f2f-8312-08d9be4dd4c4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:54.1939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4ovfpX8zu5SRralzds1UCRtT5/Q4aJaFgmUrv4JYjUtnWhlTc7VTQC5XrQTDz2yvrVvYkNOAUG6Oo76lXXl0iPmtaz8t6+z38QbBJM3gKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5094
Received-SPF: pass client-ip=40.107.7.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
 .../tests/nbd-reconnect-on-open.out           | 11 +++
 2 files changed, 82 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
 create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open b/tests/qemu-iotests/tests/nbd-reconnect-on-open
new file mode 100755
index 0000000000..8be721a24f
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open
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
+    if open_timeout <= delta_t <= max_delta:
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
+# check it and at the same time check that with open-timeout=0 client fails
+# immediately.
+check_fail_to_connect(0)
+
+# Check that we will fail after non-zero timeout if server is still unavailable
+check_fail_to_connect(1)
diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open.out b/tests/qemu-iotests/tests/nbd-reconnect-on-open.out
new file mode 100644
index 0000000000..a35ae30ea4
--- /dev/null
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open.out
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
-- 
2.31.1


