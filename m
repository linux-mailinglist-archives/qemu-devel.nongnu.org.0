Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81E47E626
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:07:45 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qd6-0001rS-61
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXl-0005AV-4Y; Thu, 23 Dec 2021 11:02:13 -0500
Received: from mail-eopbgr150128.outbound.protection.outlook.com
 ([40.107.15.128]:32197 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXg-0005La-4p; Thu, 23 Dec 2021 11:02:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxAa7a6tH4U4PAN7uVzCLlXCFcvli7hmnvuZdXr/SL17SKqUoBPupt2VVOYnpauqMT/3dzop58x8Q3Mg4r2gy7+yEoOdMOnseGdp75pmHZkySJgyGM77jh6siYGCOx48o3H7e0RI+IFz9tf44Z7Yfuya+aeT8xrt3vwOz4oEt0uuY7DlX4eTbppI8vU0VnbL1i4+k+unaFUdEiZGNqrOOtgy79YfhaELakXjmH5AwPfHJjvNmyK7wwCvFKbOpYH0Mv5Ml3f6liB9ITV3/9Nux7wz4CsImoBQUdradPq54PxBgM6pEgsE06qAxMiEg4/1+2xKkPO4sGIwMel3oQXcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lqvWBraaEC90gOXEJ0/+9/eyzSsX6A1KQfcrSscf0Y=;
 b=nCtiNo5Jk4V6ysSaL+6Mjo+LPqK8LKiBEnv3S0C539Dz98gD+HPql+bFuot0/gWQ1tJvyb+Xk73Tic1X24VK6PAOuvBMiPfTu5u6Pw0yorktv25YeyPlPyCBgceEtiMaJffCAabQWDPPUaDln05grtgmadJ/W0Y9pGrGYNCc0CxdzqoM3Zf901X5+k12US3y0c+yHER+K8+py7VgmV4lSK6cBs3AtHL4YTGQwd1TC8Vf4UFNwA6m8qlKxBgpIviGaK2egZsJgH9XtHZf8uW1ZLaf7YXaz+R0WIrWLjkYc/EKeni7I3mgQYu7cxX+G731Xs5qghYG0xzDXmd8G6yf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lqvWBraaEC90gOXEJ0/+9/eyzSsX6A1KQfcrSscf0Y=;
 b=pII9LtKyCInfVOv1j1UAr+YjBjZ4VeRJRGxbAq5FmdaR8ZKp1hP32pUrby39Jy7q9JkCu+xbQTlAsOMwYAFi0XgEz2oALxgRasEhLxZyOq758eK3+FhCO2I4FNJfGiwKHfZadC3ehV9MN+LP3Mc/QqpwfJJhpLnL3cjUYXvnSP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:56 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 04/19] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
Date: Thu, 23 Dec 2021 17:01:29 +0100
Message-Id: <20211223160144.1097696-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 652a7aa4-a026-4fac-a067-08d9c62d8b13
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB61481C6CFE0C972A8B0276A7C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Mr5Z4WrtMslg9EVg8zHjW6I0wbcW/QAf2lTwPIFvNAZeLoGbN9YH6kIKVLqxt01kH7XBeZ53TFPex8vc3NDsryK8U8sCan61SCuR9XnU8HcCgUPD6m9whBZG0dUkBDjwz9Pp2iHBadaAuzZM2KfD0cuaToe4ZlzuVpFIyCEmFbtvrzs+wrHYqzjEWZAngvNtaUI2nJ+Ti4Lnmr2r91wQJzIUVBdomH5PKv9zIkCKnOfJutCQSqJ3etS6lvx/tjfQ6iI+Ue219w2h3Fvy9dDDNyOzjOQSGvIwvR1j5xQ7f52lZwjaWHDuyzVt+wx8SAzWnkhxPzQqUSWc0j2UhQLs0QSGAHr2frl0mpmYT+9jfqL5ywzPfy5XKAjjN6sC0k9Phhc5EZb6+oJiFo5Qsc865nnviuwnhVBXtlM2mYTbg/jQoLPZXdUFR/iNreArYIsq23qySXueB/hkNIAqi4XuNV1QHUY1rTTSsO19stjP6/qeiyAmYjzXx0TjSI+vfFYoyQZo5FRDaFy8fGPE4QC9zQ/QCbtBi+yZU+7+xVGUADfUZTTE8HwYoQWvgduAmHbROPUkG8xG93c36H8T+aBxYWZNQE/rWs0XOxXia9UQt/muiZGzGal32av6rIMjkt1iOG85xu/QEekTfiaHdFBxDnPLJmUil6iOHSaQI/qSoQS0A2Dl7X2PP1kel21W4hpUF+nB4x9MCR9IV3jykdclYNvsNXVSgzpQbhsGJ1ndV4UYG0vnR3r25AfID0FNfKoMXqL9KLPSbrAn+TCAhrF/9I2d5XF6isCCTZpknW5LzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lY94NFdnAdVHZIfyyNnJJHdSwZJ6miiNzdxG1ymfSacCXwgmve0f5LDETKHE?=
 =?us-ascii?Q?eKbGhI6hkb9hgvuzM1ZHyKOz09oUemxucQElu4X5FsdKl+xG/RDKtJWdaKZ6?=
 =?us-ascii?Q?h5OuEXZChOFO6yXHcc+VcEX3oliTZTR9v6/V6f8fspNIaH29WcA5awJpGVBX?=
 =?us-ascii?Q?FAUSRYqi8oUqOjBA/o1MthHxhcw+sJfl4384zWmcjUOv1zPEGM7VnoHHYmBa?=
 =?us-ascii?Q?aX5eKAb8fumZhtOXy9UJHN1CviXhY8WTWzBmqDOp0ztErG4cU+v1o0IrhaiD?=
 =?us-ascii?Q?N14+qoGaWyWRNpokcjdUDEfxUO963Z2EPRWYXMW2V8yy6KxS2DLVO6lfVRiT?=
 =?us-ascii?Q?iyD1rWOEiWTRcWyPxxlbaxUo6gJMJuPFJRHMoDWnyO+HcOveusmot9lW/Elb?=
 =?us-ascii?Q?H1ZO8aKNBaoNqQEJnY4EVz70dBLrhyyMIWbjrAS4sq0hhRD6VCQmW22xZd82?=
 =?us-ascii?Q?HWTSc1Goxhf518wmFJFug/0S7ZHAmwZxB/yfuFfNPwqq4+H0cdRsRabq8WwQ?=
 =?us-ascii?Q?5bfNP7RR47qansRviMeDwgQu8abuRvGzM3B7NjEXG/YW1qAJEkTrSR6FRKsH?=
 =?us-ascii?Q?mOWJO2Hc1Mbts2S/8qUAFn2+N0B9+Be0yoadcItbHrfgbyY+vSsibCXPsEJN?=
 =?us-ascii?Q?dA1ICPjOxkG+7jDILEec5KtGOqWu0ItzZpWbB60CbsOAbjonuoXx0bi4emd4?=
 =?us-ascii?Q?obAAaR3JzFUUCSfrIbGBawij1hgMrtD5GTftmvSGsHZh2U/tbe1B4XgngsZE?=
 =?us-ascii?Q?JiDmmjS+yfx0KZmUlo05W8VNnTKdyM5wdNndGuOum1zOUt5XqUmyrbh1X0X/?=
 =?us-ascii?Q?SphniZkx5lRcuaCLlcbpeEZcvnABdBDoBDFWjtmzdBH5GRz2itwUl3Sj/wjv?=
 =?us-ascii?Q?1B1Ae0BA82hiTSO9UWPCu1YBueZC0+hWP3nIVv1P4gnEhFxCfnbeqQPnkS3G?=
 =?us-ascii?Q?UtGahFKJp+fHg+o+YicVsAENyELkyu3GgvBGfP5b6qWLV9s+B+DAZVnlAf+k?=
 =?us-ascii?Q?XhkExt/NPR+gzMamOB5sAm5HWO5t6whR5DoOLXHAZljbVm4Gwy7xwSEKg6nN?=
 =?us-ascii?Q?XkRw6cusOa8R6sr2HzorKbT3br/SlPKFJzDM/aAyJepmMcUhROqQfBTkkXoC?=
 =?us-ascii?Q?CSm7MoMZQnkyNLqvNxfwT2hj584mzpYsOivaq0EkG3pliDVCR3LnA273Sijc?=
 =?us-ascii?Q?gcPSoiPHjaavSNY0xkzoZDNKK21FiyJdWvyggB0D9/TbNEje266VMSxGkLls?=
 =?us-ascii?Q?AfLnsaWLyrAMf5x2C/Jam4HWy5Ppu50c4hWEQclUQr8OnDVN9W3yc2WLH7ep?=
 =?us-ascii?Q?DnwZl7kHd0W+Mee/njhYsZlDstrDcRzh35xpyX/EvkmGViRXL/D1HlWLxHe0?=
 =?us-ascii?Q?2k5AazXJJuj3uGrxcSOErKT7jKFSteErBormtj42tYlhObhJmmkefYe1/hPa?=
 =?us-ascii?Q?xc6+QLQ6JrCdNuUX27siYRPgQ2azPYOW3+q7f75cVCSIXzoGAE1pws3XoSX9?=
 =?us-ascii?Q?EHrKdcq65aVb7tioTIeYYBDD2EOzTkwV5DAHTUbS4KTKmuUO96d511QxSLnM?=
 =?us-ascii?Q?mMQijalYfvOA/hYScDnNoQPkuKRe/8V3xDStv1NFBB3Uk2pwsLeAEoxtAWni?=
 =?us-ascii?Q?rVRuKIrF//ylS0pZWe7BzYwnoX9ZVtXTNJJizqxBxixn9uwE5xGFsCtMrZ7S?=
 =?us-ascii?Q?iwyKZ7brfQFlwNvh4SreFnwA39o=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652a7aa4-a026-4fac-a067-08d9c62d8b13
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:56.0189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iSiE4NbPOE/ccTnndT0fsPSISwrHI7NYpTcOXbtGr2VQ4QG/aiukuD5XnDLuXsnybhP/vgqiF4w/A3Z61obcbyMCWs78KbV8PK68oGKteI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

Adding support of IMGOPTS (like in bash tests) allows user to pass a
lot of different options. Still, some may require additional logic.

Now we want compression_type option, so add some smart logic around it:
ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
compatibility mode. As well, ignore compression_type for non-qcow2
formats.

Note that we may instead add support only to qemu_img_create(), but
that works bad:

1. We'll have to update a lot of tests to use qemu_img_create instead
   of qemu_img('create'). (still, we may want do it anyway, but no
   reason to create a dependancy between task of supporting IMGOPTS and
   updating a lot of tests)

2. Some tests use qemu_img_pipe('create', ..) - even more work on
   updating

3. Even if we update all tests to go through qemu_img_create, we'll
   need a way to avoid creating new tests using qemu_img*('create') -
   add assertions.. That doesn't seem good.

So, let's add support of IMGOPTS to most generic
qemu_img_pipe_and_status().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 35d92715cc..f0370b5206 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -16,6 +16,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import argparse
 import atexit
 import bz2
 from collections import OrderedDict
@@ -153,11 +154,35 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                                {-subp.returncode}: {cmd}\n')
         return (output, subp.returncode)
 
+def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
+    if not args or args[0] != 'create':
+        return list(args)
+    args = args[1:]
+
+    p = argparse.ArgumentParser(allow_abbrev=False)
+    p.add_argument('-f')
+    parsed, remaining = p.parse_known_args(args)
+
+    result = ['create']
+    if parsed.f is not None:
+        result += ['-f', parsed.f]
+
+    # IMGOPTS most probably contain options specific for the selected format,
+    # like extended_l2 or compression_type for qcow2. Test may want to create
+    # additional images in other formats that doesn't support these options.
+    # So, use IMGOPTS only for images created in imgfmt format.
+    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
+        result += ['-o', os.environ['IMGOPTS']]
+
+    result += remaining
+
+    return result
+
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
     """
-    full_args = qemu_img_args + list(args)
+    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
     return qemu_tool_pipe_and_status('qemu-img', full_args)
 
 def qemu_img(*args: str) -> int:
-- 
2.31.1


