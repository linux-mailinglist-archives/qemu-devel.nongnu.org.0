Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C105D40205E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:19:36 +0200 (CEST)
Received: from localhost ([::1]:51730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK9X-0006Fk-SV
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxl-0005Z7-3Y; Mon, 06 Sep 2021 15:07:25 -0400
Received: from mail-eopbgr130138.outbound.protection.outlook.com
 ([40.107.13.138]:2000 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxi-0002MH-67; Mon, 06 Sep 2021 15:07:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5Atf2Urls8TjfISmV2qu17vVw2JsJJfkMfxkP1NzECn/Ea6zkIMxROkKsVjWs1V4m+VwtQnr2FQN6oNA3i34EWxLtVScW0/g4GOPKXsPu+298owYybcmviziYFSokudB3sl1skvdCxiRi5oKPNiPUP6GXIlQoumJ3+Y0d947p1x3OXT1bXJAxYgOPLZdONmaNOsLoFnyxWiLp+S0sFvV0fddMVRspiSqbmZfMcV7WPEVxHZpJJi3fS9sttb8OfOdPU2Lhzm82sXqsJgLahBS4pnmzRzgz6Nyfa69uRwAOFbqKzIYIUSYdaZ9BXE64vRER6Qs52MIWmpEECZWRCB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=YidbdpkNEm5RnPXwbgrgp3i+KGTTTW5UUMZ6PKAt2no=;
 b=ne2rmrmEtrYMXyXnTfLD9g76D1i/auYGQDxc8foldp4XJv7k3lb9dkLVOmKQru1li+Rt/dZ0w9HXljHXck0IgkEgq0D1x7u9rb1tBimCsbdAqHxhH973HxJFxv8JeY/OYg7JoTAnBvUqHAsmonY88qG2rEIJL0xWi89cQQKQJXENoWT/Lb3gdmQLMndxKjJb+FPH0mp18ZD2vWF0uRzhPqhxi+fOqUYqtxl+LuMpGx22+2BsOl2CQLITwbkeCT2qyLUbzEK0QxAS3RBx9rJmvSpr9E1KsPhYPO23N1Atu4NzIF5X3kwnQepvhPp42FbZ1HLhsGI0LA/jLmbWa53T4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YidbdpkNEm5RnPXwbgrgp3i+KGTTTW5UUMZ6PKAt2no=;
 b=d+fKpYA09F/ih56lG70/8qDTPejhWLg5KYN+vIC3RbQ1XbrSe8SrIIusXFSAnesWKbVIVLqiBTYJUJdNxw78oh1/N34U8l3Y/YEaqi15b2TzLhxUX8kiC4CqTmjcWaQjtyYvOHF+FwMVForbsG5ieguAiwmGQDM2/XjvSMBLO4U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 19:07:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 9/9] iotests: add nbd-reconnect-on-open test
Date: Mon,  6 Sep 2021 22:06:54 +0300
Message-Id: <20210906190654.183421-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc0869a7-bfa0-48a3-caef-08d971698c32
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5256B8220AE04B50A2E33C1BC1D29@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3uyuRY3fk2Y5BWHNIGxkVkAUF+LsLdSeX3JH1ncpNiboxupIou5H+jeW1MEN16obosuEdt+P0SjvR8JDisVTXr7AHZm6TpCLbcvUdqjCx8wdd+UTE90DSUrEB9i7R6ei6cDco2xgwICWpzXXLZ3+BnZ4oXFPWl15BwT0NRnuwRdY0iddQ0peUHu+j1rxxgQDNQjsLG/5euf+NUhUpqMHnE1ZBrm8PX6T7dKWCI5rGDoRXzgggRsa4ozTcdnjR5xf5jDDLzEPRQJJJhLe/W+XSgEMQ1RZiRdSIxwRhgdc0x8zvs8Tm2M+Z3lxO2GhgSipbF/iGz0n6BblQqkrH8I0Ki9JmBtho/8oOQ9PaHxZpnLjAo/FwHnFpdrQp+8g7Zfd8iO8Ol6+vDh+Ln+ByxrKNmxgPfJ7k1WTxToQG95X9FxliSm1m5ssa96gtCjv3Cjz8tA9uzYK3WOU4XzOmI8eeuWobChwAqnXe8D6YmhYJB4WBBWgDMScJmBdzSsDCVlQ7YXMcNzOMlWBe5HehPuQpB54HT4jiyG21icN811+IDJgphCQHNvJ3hIfiOF7CaY2lM2sJFljm4d23zKpWvv29YeKHkm5gbBNBHrEsr2UeAJWcXehhaPg91zhb3lzSIylqsfXfmZ3weV8NgFat1O3fjf2yF3NbqFG5HD4DnPhJAYS+VOxHJxafpVaLUljN0IiL2ZZVWkeKqSkhK9wlvwY4ww1W+duslQmAbSCPPdoT+pz9Vjf4RVlbLrfkP72DiwK46+ChMNxNnbCMF7L1tTVz1zq1BaucraVUFicQE2P/IQB6uubi2QfGL+5JPc3W9n5c7dBx0ZasyyPMJNmVqA1Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(8936002)(26005)(6486002)(6506007)(4326008)(52116002)(186003)(66476007)(6666004)(66556008)(478600001)(6512007)(2616005)(38100700002)(316002)(1076003)(6916009)(86362001)(956004)(2906002)(66946007)(38350700002)(83380400001)(107886003)(5660300002)(36756003)(8676002)(21314003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6mESC586ewwnoTXi4ORSqXgYxyiduFiUt9ePRjd+yrG4xImsfi1ZKDmjFScr?=
 =?us-ascii?Q?gaoFLifVc0/85zh8FxUu6E2BKmJZvyDxMJrpUenJuqqt8Pq1H3mN8cJwqXn9?=
 =?us-ascii?Q?bxpXljwdkg/Ku2tIEmng4skXIYHjyh4Rsf+RmpML8YTKksn2jfGw4uMbXGdw?=
 =?us-ascii?Q?K8uvk/946A9+vK/tzrkY3sKTMLr9qdjoZgsabv1qlvVRp+wrCIQcr9A4YUHd?=
 =?us-ascii?Q?RCl58egfiOy4xQOirEKjoZz2nzcOt2oIOutWFKeN5fa41AcaLP5kg8/TDxc1?=
 =?us-ascii?Q?qEiu9r5prFPwAjGuOGR9vR5o3E4sb8pEofpgHX3eKqmXZcuyM8e1PXghc+zi?=
 =?us-ascii?Q?QNvfIadGEbwECdHt9W5rlzJ8HO3N43rAAp9rj8cgdijBqypnM4RRPscMgafa?=
 =?us-ascii?Q?R66R0aRKW6sMkbOLxVQB0/bLC3TEUHK9g20h7ArWyD5iLWeni5uUwvbjhQ9M?=
 =?us-ascii?Q?h3oOva4i0asSQJdSL4zB9msDDcSZ71RCvASjWTLfJEmZGFj4OhfRJz4sQkBX?=
 =?us-ascii?Q?KXBGWoEcRLdE9yZ5d94Hltzxe23bY6UsCCUp9BYLFh0mWgmFhBUKxSUdWGMV?=
 =?us-ascii?Q?+x7MITMBcVD11xfG4WzSr32g53vqMeZxAIX3RQBO84P3VyW8IiAky2PejI1G?=
 =?us-ascii?Q?3TCz42Cnz4VxKWt566cB/C7WkKCoR6Kh4GREKDvzuw8gz17mR4zZcAFKbveU?=
 =?us-ascii?Q?6uAFlTJd0mbVsrQJXv3dwHYrtWGwLWQYJzN+YXHLhIb2dTpojqOBh8bDHOi3?=
 =?us-ascii?Q?p+Z7AEigGk1iHACmmxvt603N2ULT9ticCpeuOsFAIZH+av7eU3VDfr0T7YHa?=
 =?us-ascii?Q?/YCg3OFRbMlsPf5NDiAM1hgnKMdIIRQKpMz59VmJEmD6c/NKB46y/eFb9H96?=
 =?us-ascii?Q?yvZkYa646YfGROnWYrtRWTtjMxIoE6xmqbAcYj+uTtjtxyeFl0oj+4nDhC9u?=
 =?us-ascii?Q?0nmsD39Jv0f4lmyLyIpBIhkv6qS5Jj/ooX8+NnSKVfNyS0gzZTwnxXnX2FSB?=
 =?us-ascii?Q?yT8eJr0XGo6TYHvLIKQVTpg8E+QVSW0oZXjH5jEaA0bWu8SIRFPNUH9RnCqR?=
 =?us-ascii?Q?guq9S0VG6OU4tRQ3TNfqDl1p+mRepLtYUlq3cKRfzogg2TWFm/v33bU2PLuu?=
 =?us-ascii?Q?RvlYaeTQvbMUPJtPBcqrhp6NrIZ7SCD9oEResB2H2uli7utWGd/8gZTPWtOq?=
 =?us-ascii?Q?w6RG6/Qwam8UatDQ4cjLjRUR7p9QUIH/th3QFqsZksu4swvzoUZmz8cSUv/Q?=
 =?us-ascii?Q?WNOWYfrRg1uQeD2YzrpdqrrF0pwg2g2fDtoem6ErE5ri2rLIGhlZNSniO+Ap?=
 =?us-ascii?Q?AHRCiOcXYUC3zh3sBz2qKK4Y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0869a7-bfa0-48a3-caef-08d971698c32
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:18.8992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoEbTcwrf1nAFc5uZW7jleM507eF+m7ehHuLDHY6el2dIsLMXmIhnJ8NKcHSVUaJjGic65GqGdd8J2TnUEreS/Q7Pr8fsMWBfUGAY/UFHZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.13.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
 .../tests/nbd-reconnect-on-open.out           | 11 +++
 2 files changed, 82 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
 create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open b/tests/qemu-iotests/tests/nbd-reconnect-on-open
new file mode 100755
index 0000000000..7ee9bce947
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
+# check it and it the same time check that with open-timeout=0 client fails
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
2.29.2


