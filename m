Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17DF402050
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:12:20 +0200 (CEST)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK2V-0004LR-Qq
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxp-0005bE-HZ; Mon, 06 Sep 2021 15:07:29 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:32928 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxn-0002Fk-1Q; Mon, 06 Sep 2021 15:07:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnqeFSGyFn8WIcZjvIxCLpEKGH+C4bvUAsr6CmacmyuyE1rovFNQwwYBdNVxBRxptxxc9qqAii7LVnCuhMPVW+D+BBSX1Ii1BVyKyKvoH00jAtMU4du2MiCMe+a4oOLf1UeQAMZdqiKYQIWk6JQi0QTINyf2Rm0OnzXjq7sY7ALQl+gohUzuxVdx3Ko8tvUirS5q+C9G4Aou18wCQ+vh8ShAocfuTbjmqg4zFELN8ttShCKspblKQX3DCdFD4HU0UdXMe7w3eyFy+UFBCeMDr3ffoJObUDDYrLDWgq/wiAMquSDj3AyhzCNmUgnJcQKK5Ne62NvfZsZgQwDfWkwCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QYwyXZ4lu8PCqVuc2tVoVFwh8E/nuIT35XSCaYWP5Ng=;
 b=WEcDZEei4X45aHmWYQP8vHuMoRA3TMErpN/5Ptntikgamrhb1aruzGBMpZimsEQQSh+DrMvXEZgoxhHrwyDnPazG/NFXBh7KVZaLfyJ4s6iev8OwWzXrT7uSsD7KPCOTUiVv/Ca829MhXy6mGlOPaclsYKRBawG2psI3qwK0BicCOkS2qet3cXN83Vd1noR5Fwd54oC/LFNplWM5NYZjJdAu5QUmTVBGf+d7yBz672TV8aFm3eKepTLzXGDk5nB/VXDzcWzD8ZupjDuhTCdzSGrRs0vDenkZwRlWAJuf/C5uI3uJJ94gn1f2gyji3QtQq3cuzJxH73pYBwDnORKL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYwyXZ4lu8PCqVuc2tVoVFwh8E/nuIT35XSCaYWP5Ng=;
 b=glvIUeNp4U66SM6OK3DeQXJDdRgvR4vpKRGwRBGAhvQ5mxTpQWXiARF8OkiReOcnYU4s4ZVARTihXZlGoeP94Jxkmm5eZF9ma8tDgbdV+NgkmlEgYWLaZAn336sxQHie8057Sy/6BjxxLcv1C0zplnwART4Lhh0GIgpN2NX6ajg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 7/9] iotests.py: add and use qemu_io_wrap_args()
Date: Mon,  6 Sep 2021 22:06:52 +0300
Message-Id: <20210906190654.183421-8-vsementsov@virtuozzo.com>
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
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ac51531-1694-474b-bacd-08d971698add
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4849839F70DEFFD07E7FE101C1D29@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2U7bhn4ZLn5vSc87/Ue+Dricm+38gg1hg+iNzBWALxCOotD0GI0TpjVVcINz3+1ffgpDxEGeAPzGXcO7J7ZFaWwLlcp3rriYy7BDYysZsaRT0VppI6tHXnpFBDWWTFDknwTJwEflJdtp3QayVCfdQ5dND5McDN+AS/3dvRmZD7cqY8rgS5nKA7NLdBvhxS/ku9b1CFUDeFTPYZTGuBdluS7yCynTJQyzIb9Em25tTU0TE7hw655ETM7tUvow9mxajs1Izm68U4joYfDkA7nOFDzpHSjd+d2EyBwjMetEdBXaryqU/cB7ec28me/5jjRXC9qLSqBh/eAoj9WiRctePnj9aZYMat+x7p7uHnwZ2Q8cY1YQtJnai+389yKcjAgQ/OeNZc7/TdhVyN5h0mPzVZqJkPhKYlKeO01aZ8KWcnatjAlX/5ILBqPmtZ/dbSb82tV8G0NCUI+2xWJq9jZ714X/ApXhvO5DSRqKXVFQ1pk4eQ9tKkk8cguW0Jxw8bUBsyDbMJiGv0ptX6lixu/9w46GzbTfJA2s9EE6Z48NAd7oPfYTpVe/P6eT7fnm8pWGJ+MB8EFkz59tEYERNmG06qxjZY4D/kGjqMH7eoMaegMeRBD/y0kAw68FlzYw0nZjiBCFoytcogatHiFTNGUdJqDsb5sCoGfwdz3EheT82FtTyPQhMXnLxPU6RWaROn7GRLt/WRfTREAzue0z36rPCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(66556008)(38350700002)(478600001)(83380400001)(26005)(66946007)(8676002)(5660300002)(1076003)(186003)(38100700002)(52116002)(2616005)(4326008)(8936002)(36756003)(107886003)(6506007)(86362001)(6666004)(956004)(6512007)(316002)(6486002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5ZUv8fM95m4ypg5k8y7GD7R2Rq4VVBcisjU4UbDbGZgNMx0Uxk1pco4hpDd?=
 =?us-ascii?Q?VpHz3h8E9DVTc6b0g4t9nFG6siawmzrX4iZRULeHaebI6MiIpUaVCjqCQwRz?=
 =?us-ascii?Q?1t3R8112it31YCrWuFVLjW4YKfwQkiLDNyBW7lIO+p0UOki9RgcDpT+a4hpt?=
 =?us-ascii?Q?NW9jGZ7w4OcfXM3wRC7B0PdMyX3ceV13R/iHpqpQshAYJ+ox+/YIwbNwPFTL?=
 =?us-ascii?Q?PQJbn5tjrQOmG0kW4liScPxElP7HeMSkEYg6XMgG/sZrmjXus8AWBKdYOg2Z?=
 =?us-ascii?Q?1UqHjoEW+VeiF3QH/mOp531zfr3ooKJRiEwt8g6sQgONRdA00Hr46PfoXfbX?=
 =?us-ascii?Q?JKw4et+54rAjDgCvub6nrPQatAj/ejkVtQu6QoUVwuqTpJhIOyxo10La4FEA?=
 =?us-ascii?Q?l306RkFEFkAelATkCEZfCQOJoldesO701WkXQ+s85Spn+eYTBNTiQZsIJG2d?=
 =?us-ascii?Q?xberuLMbVhYMv8m8Ob7V/pChX7tMtcM+LcUoUwNOszvvWDQ0xhDn8LGeSie/?=
 =?us-ascii?Q?3dRBmg+a2oGN1RdHjkSqBGHdaJaJSncGjVJsfhqAaBlfu+AzgLENCQ9P1tsp?=
 =?us-ascii?Q?jtHXqZIM9XHH8XSQY61bdAhDbfbzAPcd2S/3pNIIGOfA5GrT10rLr4A1bX6H?=
 =?us-ascii?Q?OPYjrzAPDRuNh/YxBvKA5Ld6og/aBvcg3hi18I4L4rxlt3rlG2qXpCgAJEEZ?=
 =?us-ascii?Q?7zHELNnSSyS9CvubaD56SNjxlC47qyy95dml3OdTjfInVAZRfSfa8oBlfU2v?=
 =?us-ascii?Q?aJnQObGTIw6QVpVKGlTiDmBN5qT7p5cBOrPEf/z3IyqaWTl30y9eaVzuf0O8?=
 =?us-ascii?Q?Ph4mfIQ5aIxh0psMGCxuI1IuxiMlErO1OS80Nl0ZWDxurXchlIZr9g9GGQAc?=
 =?us-ascii?Q?MBKw/3zQ8Bw0Qq7mXYKfG1J7j1kOIMQC2ZFZMCEu4UMW18bNx4p8TCMkQQ1m?=
 =?us-ascii?Q?4L5BNdPWXBzTmacUqd0onrv4bFlnfp/VfNt5k2tPUyVSgJpAz4n4N3mVBL4F?=
 =?us-ascii?Q?ExlYSGXmzGQLj0EOrJSTbfjppQ9Gr59KfVfGxzwU4eumgDfb/N0OzqAAOQrS?=
 =?us-ascii?Q?15rSN8jsEz84RRLWfkKWmsCT+IDlxsMl94CqEyUgvsiCkmiCIEYnnBWroDlV?=
 =?us-ascii?Q?aaCYhKT6DdHyVpPi806+PPG9SGbfbw41LNNvK+KnRUXVRO2wp+263kFFRB9q?=
 =?us-ascii?Q?4zgbPRJlan7m96dTN8iqL5fcSjqyiXwaPmxW+0iNGVklfy7fppzdrxYKot81?=
 =?us-ascii?Q?vh6l80P7cNr1hQB4mFGwZ9Ng0ewmo7cAhGv97s94JJmU6z0nLEWpLlVrGWfF?=
 =?us-ascii?Q?do7m67oS8siIUXcABR9w6wRL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac51531-1694-474b-bacd-08d971698add
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:16.6311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWW3yMbDeUpjfBDc2uwADlH7gQOzuegA39es2aSySOznYxTnMgIWSDJyo7hj03Yo8jpEiEj8vPSNkUohzzg6nnnTuMEKrQ4UlTJmOlSFxNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

For qemu_io* functions support --image-opts argument, which conflicts
with -f argument from qemu_io_args.

For QemuIoInteractive use new wrapper as well, which allows relying on
default format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index b518545c09..3b7b57489a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -208,10 +208,17 @@ def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
         filter_path = filename
     log(filter_img_info(output, filter_path))
 
+
+def qemu_io_wrap_args(args: Sequence[str]):
+    if '-f' in args or '--image-opts' in args:
+        return qemu_io_args_no_fmt + list(args)
+    else:
+        return qemu_io_args + list(args)
+
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
-    args = qemu_io_args + list(args)
-    return qemu_tool_pipe_and_status('qemu-io', args)[0]
+    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
 def qemu_io_log(*args):
     result = qemu_io(*args)
@@ -220,12 +227,7 @@ def qemu_io_log(*args):
 
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
-    if '-f' in args or '--image-opts' in args:
-        default_args = qemu_io_args_no_fmt
-    else:
-        default_args = qemu_io_args
-
-    args = default_args + list(args)
+    args = qemu_io_wrap_args(args)
     exitcode = subprocess.call(args, stdout=open('/dev/null', 'w'))
     if exitcode < 0:
         sys.stderr.write('qemu-io received signal %i: %s\n' %
@@ -234,14 +236,14 @@ def qemu_io_silent(*args):
 
 def qemu_io_silent_check(*args):
     '''Run qemu-io and return the true if subprocess returned 0'''
-    args = qemu_io_args + list(args)
+    args = qemu_io_wrap_args(args)
     exitcode = subprocess.call(args, stdout=open('/dev/null', 'w'),
                                stderr=subprocess.STDOUT)
     return exitcode == 0
 
 class QemuIoInteractive:
     def __init__(self, *args):
-        self.args = qemu_io_args_no_fmt + list(args)
+        self.args = qemu_io_wrap_args(args)
         # We need to keep the Popen objext around, and not
         # close it immediately. Therefore, disable the pylint check:
         # pylint: disable=consider-using-with
-- 
2.29.2


