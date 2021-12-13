Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5EA4730B2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:39:11 +0100 (CET)
Received: from localhost ([::1]:48272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnPy-0005mo-G5
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK3-0003sD-Tq; Mon, 13 Dec 2021 10:33:03 -0500
Received: from mail-eopbgr70120.outbound.protection.outlook.com
 ([40.107.7.120]:48667 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK0-0000k5-EB; Mon, 13 Dec 2021 10:33:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5Id8JKD3sn9Bl2mWoVmFk4nCnyJeUK4B1U+4/INa6ZQYfowyupSSlwwY2JZF2Z3cMy2O0/z3QSTysckeAN2t+WVKREGk6+FcIjSX3sWvdVReJZ5YTsZk4IQrO2ThNgGB7/tMx8QTpgYve9uK2glhaxGBEHJA8ujrbbCHguC+4k968VDPlnIl9TqdmDVtRx8r9rsTYq/wODUK3X5fGSt1GLR2sD2SLSmnJr1xNNw8PzzYiKNwUMBxF/g8/QjXJUdzSnjPVXidcuMHLV7WtYhsIG4fEWH2LiVi1JzkZ+XRBLmS4hBXV7tHjw6TfgrPaoo2Xj2kwjAckGIUJt4YHQIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZsdCQLyhlWBBsWDQY1VNDstcc8Wd6ATx01gxuhQ6Lw=;
 b=bDHqatG57xwAFu6FB1ReRBs5KgU1jRcMsG6zZaFY4EfyAIkYtzXTqIdsSNMpzq9q1g8CvyNZ5EJ8t1U6AC6MSK3qwCxq0ojoQRkNKVLxtzrnu2I7pPwnz2nnH5GKMpt7h8wEC/iFfp9YbY4WJllIZ/UfpFTLMHREmYh1oi7LlSzw4WYR7aH3FFVBfUwDVPD9vCr1r2oVaeeEYWXe4A1OiC29yDcXH1bdamosO3m+gSfV5MS0ZnxTHLC/WCFO6fAfIXH5i9XjJYrmCheHGZLj9RQCFgD9qiXwYex/720NaEB2pKSkBstsTutJPaWg7q2ms836HWLhh74RoS28KEdeMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZsdCQLyhlWBBsWDQY1VNDstcc8Wd6ATx01gxuhQ6Lw=;
 b=uT1i3jAUBaMY3eMxmZf5K+NGr94pqFwCWo4k+QmnUYn4C7R3Rq2CEI/pRXwryTOXPD60bJk/SdRIXo921EQ+QQAL+tNbsDG+JGWjL1eVe2l5R3YlfEl3CiVRHFg5tOcuwHbpPkF59lojL+Bh1bOWeMaD+WpSJ3J0lIEX9VI/CHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM6PR08MB5094.eurprd08.prod.outlook.com (2603:10a6:20b:e4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 15:32:53 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 5/7] For qemu_io* functions support --image-opts argument,
 which conflicts with -f argument from qemu_io_args.
Date: Mon, 13 Dec 2021 16:32:38 +0100
Message-Id: <20211213153240.480103-6-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1c3dd365-5596-49a8-3446-08d9be4dd3f6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5094:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB509484B9B90E4E82E423F74EC1749@AM6PR08MB5094.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e7C+9Dt/hx9YFXyTurKydelyzMAipdJ7nUE94UvIrWw4t9oO1FQYo9RgIiKEXcXsVoOhvcjidGQEcVUhXKIR4MxU1rFV7FusKs8VwvEHNNNm0VDD049MgLA/VNk3Zx3uv6UVDY1OJH21gAsmALGNqhVFEpdUs8cdsgzTk+mVgAk7i5nCOWGhj3K65sj8cXdMCBqahh0+788vRFWAk1yYV5f50+Zt/8i/Kg7ltR0raePPAdme3yzNof4pu0nry6FEgHxSii2yeoghrfx1kwbsRtfwHs0ztePrb1swKxL0nh9vTUquJzm4Bl/cyFP5YnaEe5kpLu0dwqef+2+kLFcXfPtxU8MtM52q1JuJc10llF55QhfgxeH1bBUuE/efMY+IH3LiX7X3qlxdAaDadMNxaFmFnCma0cJSWM86gHlDVWNrF+ovRBDu0QV5gHU6USgGneDkGXuDupTe4nV0uz0bF7uYtym81RSJxoTO0ekcVGI5JpwuKO02d2MFh0lW36Sj1X4aUqjMoYJ55w3/xo8vSKdDC77KWlmi9ttgsCefnsOZuvOkbfLmIv0URwHNHZ+jJs/2owegsG8COq302FhTDscYekSbwPD1ld7v960noWS8V3q0alnOlFT1CSuOnyB3p67V5uoV6cTx8HnWJ0+qwz5ESht/YfzDP0j6aWLJGSIH/YnViDtOQuN98V9vV+FfAZVZY6Tfv0BCapYSkNDN7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(38100700002)(8676002)(6666004)(2906002)(6916009)(8936002)(6512007)(36756003)(5660300002)(38350700002)(52116002)(83380400001)(26005)(1076003)(508600001)(316002)(2616005)(66476007)(66946007)(86362001)(6506007)(66556008)(4326008)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6/702SaW6SFoAx0ch/EHA2bVFnM9cx65aIyKhMAzedpB6CI3iGIoBq3pBdVI?=
 =?us-ascii?Q?Pl2Z9VsHDpaXp4NmTmPwBMdd8hbS+FjIfZeEw0s1qmfwaibPeT6pWNHdlK8x?=
 =?us-ascii?Q?mkbbF/QmMS3jnal0+sFUM35+70bwltIaW+qWlPsSGLKNx/Qhh6e3fsmZE3FC?=
 =?us-ascii?Q?52MLg86OCg9wf5JOuScpk5vhg5YAmepzWpZsu9mE7n9rwBarpyBklPOhyyqu?=
 =?us-ascii?Q?QirE0/fxXfOAHycQfuFlv7+kM2QYF4yA5xPPSuyOqAqAjQwPVTNRWTjEX1RD?=
 =?us-ascii?Q?VvscL+k2N97lU+wi1SFlaBpy9i7sh5aPHnxqJYZsangDYtvyrXrtPqvz9U3Y?=
 =?us-ascii?Q?OfOLDk+E0E2lwqqETYffS9LGlXIOvSHe8vXBYkMU6BDIKuW5wHazsSxpH6eH?=
 =?us-ascii?Q?tZkstyl48EWS92EiwMNfStiJfZiUMfE3IbjKT1blVHM+gGZDl983L+w5K1Z9?=
 =?us-ascii?Q?xfMc4MM7bFL9c8Kx8emS/nT2jRt6TB2orlizv1IH5eMFZsT9JltoExTTy2YX?=
 =?us-ascii?Q?/dp2v8RcFEw10vlcxzN9iJ3lwEgl5nsXl4v7COBQZWJv2VdLZnZiSfe5b1tt?=
 =?us-ascii?Q?AbsWKZVtbKIRtX9ievxmSwf7s5/QXVkEou/fGXFYJrtEjN8OFfUnHdZYkMQH?=
 =?us-ascii?Q?SGq89qbI81LesSevSKNt4cnOmzFHQIe6FeIin/cifHYulLqLc0hDVe2pIx+e?=
 =?us-ascii?Q?G9JVin6Hz37d/wPxDE0VPOtL7xkPkwsAFxE4pVvs79yEyaMurL3yOY7ZhtFn?=
 =?us-ascii?Q?+U5j2afAEoD+Lv7GnEBOFwZe4nFSfMl+PWztEdb6Xjd+b9i/P85FFsv8Lzsy?=
 =?us-ascii?Q?OzQas85LHkB8vyqxheNEwhZ5ocWTnXtTXWSBOYY2nopUP3lbDx0CQi7CfZCC?=
 =?us-ascii?Q?1sGNsCmG8GLEveLktqa5Mt9vGAZIYGND6sSVPwtpk1NDLNS2nG/DdFs0Zfv6?=
 =?us-ascii?Q?Di34wOZBK3MI+l0lURuCAC3S5WJDwnGOUqW6rOxZYhWMxBMJQOuXcZSzPTHF?=
 =?us-ascii?Q?PFuS6qvV5DkAHc2ZGf/iq7ketbjwDSH5UohnU5IfvTJe4ueEh5VZ0dF92RXq?=
 =?us-ascii?Q?/itADMo0uUcr0amLVDArcwxDHmBSk3UEBDkPFLNfIO+NO3UpzpayeolBS0nu?=
 =?us-ascii?Q?gE/zAxh2xfz9jd2r9RC4d6EIoFwbQJRTeWJu+pEo6f6Ti3nFLxMNpn02G51F?=
 =?us-ascii?Q?7KVF4lSBrSQCN1W6bp1j7MBOSJYhI0DGaE852L1gr38Id2dSd2IewzhfNtNE?=
 =?us-ascii?Q?S8V7Af+xhI9leZvtfTGiUzJalSDpOB4zdT1Cpoki+/ZqhY9472wh/h3I340r?=
 =?us-ascii?Q?0r3lv+z3WdwUODqisHUXAWofar0964epDvkOpSwZnjzeY/mx869xTTzyMwXI?=
 =?us-ascii?Q?14tI0rjRFbq0vTKY38JxkxYZtkzkClNlki/zKbxodKJQvzyCu3JKqFYu4YmG?=
 =?us-ascii?Q?wN+XBjOoejQaCCuvEpv5yz44twGyQfHy13F26qoQ1I/bKF8Vc+LuopoEBs44?=
 =?us-ascii?Q?yvUc26kHTwMn9QRXVx4BMsrWl3lGcK3nDBIahSik5l/DLNtewxCXWqNiUqE6?=
 =?us-ascii?Q?PXXbKZPWoSX+h3cYcBJDNov7utJ+aYK/GYDXhGhmGbdWO9+rm30D8GoPaEHq?=
 =?us-ascii?Q?I1akwxqGOWjwVcMd1Qgmwt6U1Y6QbVq9Imyif6YOm3IR6/hMnAXIFu3ypWro?=
 =?us-ascii?Q?IXiX/Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3dd365-5596-49a8-3446-08d9be4dd3f6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:52.8657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sf0OGw4rBGM5sTsf1tncrFMK9JCPFdUghbVJqMI3S1T75fasOkFelVWqHYedrkqsLGzr1jKHsd08crrj3ajZzfClu57rLF0xHcq80YfHVT4=
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

For QemuIoInteractive use new wrapper as well, which allows relying on
default format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 7f9a8bf012..1ed3eb1058 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -240,10 +240,15 @@ def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
         filter_path = filename
     log(filter_img_info(output, filter_path))
 
+def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
+    if '-f' in args or '--image-opts' in args:
+        return qemu_io_args_no_fmt + list(args)
+    else:
+        return qemu_io_args + list(args)
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
-    args = qemu_io_args + list(args)
-    return qemu_tool_pipe_and_status('qemu-io', args)[0]
+    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
 def qemu_io_log(*args):
     result = qemu_io(*args)
@@ -252,12 +257,7 @@ def qemu_io_log(*args):
 
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
-    if '-f' in args or '--image-opts' in args:
-        default_args = qemu_io_args_no_fmt
-    else:
-        default_args = qemu_io_args
-
-    args = default_args + list(args)
+    args = qemu_io_wrap_args(args)
     result = subprocess.run(args, stdout=subprocess.DEVNULL, check=False)
     if result.returncode < 0:
         sys.stderr.write('qemu-io received signal %i: %s\n' %
@@ -266,14 +266,14 @@ def qemu_io_silent(*args):
 
 def qemu_io_silent_check(*args):
     '''Run qemu-io and return the true if subprocess returned 0'''
-    args = qemu_io_args + list(args)
+    args = qemu_io_wrap_args(args)
     result = subprocess.run(args, stdout=subprocess.DEVNULL,
                             stderr=subprocess.STDOUT, check=False)
     return result.returncode == 0
 
 class QemuIoInteractive:
     def __init__(self, *args):
-        self.args = qemu_io_args_no_fmt + list(args)
+        self.args = qemu_io_wrap_args(args)
         # We need to keep the Popen objext around, and not
         # close it immediately. Therefore, disable the pylint check:
         # pylint: disable=consider-using-with
-- 
2.31.1


