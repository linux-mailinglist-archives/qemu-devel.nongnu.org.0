Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E23CF910
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:46:13 +0200 (CEST)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oCS-00049g-Jy
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5c-0003DP-5m; Tue, 20 Jul 2021 07:39:09 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5Z-00077C-0C; Tue, 20 Jul 2021 07:39:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWVspqhJZ9qtXftk0espoargnhSg5UhPnepO0F6mtdxDdV5FHMV/c0RCQL+/4ti5YxZtN+qE743UJy45VmOCex0KRKEkh8WAh6uDab/QRDNj1pBJMviqc66SnhwnWvBbzDKXBINuz6cs9BF+NxcUse/b1y1zcdhIyMdcIucsPaTJlK3OA8ikLKyfknHdXA0EftRLWwmGqLlJtBAOh3Ihm6WNZQXOMlcRmaui+Us0T/7JKFLDXc1+01yMPhggGNk9k5B2RtXyc2wJzTTQt3PKfh8pHrtvTnacb1YRoT1GkCr+vZqhiDDKshlogjeE4mM8Mx+CVF7LZxjmjeddqdUfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA/Gu77NoBQeRniJUzkpdyP+hrbdPlO/RIth6ktKGLM=;
 b=CxR5OWIGXuYekUdtSS80lMUMyL1c9+xhELROyaigHVyTjbJBMpgoBJ51nRyaE9MtItMawbo/S6frdZpGQl1q2tipJqUmEz2CHBUkyyJukFTJO8nu7wTEQNso681jJhujA9yoPAcFRZoHbHn3mxLruq9Hlz14KZkF5HlynPDSj5I+HXBDJQu6hqTru+C6Rpc5YEoXwE80YZgFHGtWLN7F4vX+IcexYk0XI+sLPclOtLyo7oizhIoq3zOBRtsVUNbcfQsD6pS3qfbadR8+Cbp48XkQMsgSS6p7lv1o3vpCR+5HpLQtvRGT5+ZtbFZz92tFXYJqz+gKjZemc31eSbP0Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA/Gu77NoBQeRniJUzkpdyP+hrbdPlO/RIth6ktKGLM=;
 b=p77uCvJNTb2ZRmc5fWxZHpvjRLesuW/syi7w0+bCELy+yuHUDqqxTE4yDlzwEGEJwPyWBOLXB/od7CLHp5RdHUGDlAgScGsiDFbf1RKifNdIv+i5gW0M5ByoVQJEOWbvCx8rBx8lRaNCClnN0M3D2seAywCC9CoJ95y1QYEbeoU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:38:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:38:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 03/17] iotests: drop qemu_img_verbose() helper
Date: Tue, 20 Jul 2021 14:38:18 +0300
Message-Id: <20210720113832.586428-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67120a20-57e5-4b97-c284-08d94b72f40f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119FFBBD7E9632647720FF3C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NmQ6Cna8GckXb0jG7iqtbNFdQ2a1jZsZ8ri3TabaGyI5bb2fzOLSfjwBmPoW6yFGcpu7bIYabOSymykFetP0SVl5o06VnVxH6+e9d2X4ljBbGI9W8GHZqKpuLAoLehhTWvWdX/+ZUvFn5PNg1wO9IKReQoMNxoTgIXGNGg6grA5XG6RjRjhM1SBobpl1geT/ZcCiuR6cUwqi9W6U8gD0TCAUsOiH4WNrqW6HwsGpv6NU5WUL6JyFLKx2BrSiwmV7ucmFbytGiIrpzFcBFKbdkQBB82a1OlCor5tiJCHVC4ElPDa5rKFbI+QbX4J+WC3zK/Fdll7CsoQPfPq9lwkEwj8AcUo6p8EKqMzJeHIDiHcVf5+FI4f4uLwZYZhc12Xdu3sAf6FTaNmFE/vI5V1/Lt0Y6GV2RpNhEWilpyr+vOXOogcGiTl9h5W8wz1pbUFftJvkCS/E77+6rUEWeD9kB1qaSfzPOTt6lSBScK7kPiyIVz2N3RjA9nfs7nUkqnO8xLfgfp4y1NXAjfj/qvWA7MF98/WhM1Q3JBDwdBfqY+ZY7aBpVs2sVS7qBCiYRg7aCd7CMZTpBYwmSw9VUbh01FeqomWSHWUsNVyIG4IkkK3Nyy08fvY75aWmTs9q7y7kM6MKkHoZUf04q+PRvn7lqzqvVtuwJIqXDMSITkTKcvjeMeqs7sKefPWL82iUMbBONaXX/UCIvIrSDQFzi0fRCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bQ6/s3skLOEDpB/BAiJjWd/urX+2bJgmzk0AtAdrFOUeNsM2quY6oEeWkYpm?=
 =?us-ascii?Q?li1oI86AMUcPDY/XPBvI5CshG7A4roeQNyc39Xh1dyJyL23+rd2HdSNHk3uE?=
 =?us-ascii?Q?pgErqwJSdprZAl+Ko7yj3LQT6+gn21Cc31Z2GgNyAW3WG87chCsRzowDaGWw?=
 =?us-ascii?Q?aTMd+h8K1dKVkYT6XQfvqs+YpoKXRTeCvPBAr34qEBfEIh62G/bwWAdpZhqb?=
 =?us-ascii?Q?Hb9gTBoBX+XkzzZLWuwfQRNAW8i7TSH+KFNsJJaoy1ipN+F8lj0C+XbPYDUD?=
 =?us-ascii?Q?II3la0YiW1oh4fpDJuTnqWkZNYGr/eeAaAtzbnhBFHmENhzMjJPw8ZjoJOTV?=
 =?us-ascii?Q?1Di5TV7UAK9A899EzBGO9ZEcRtdSYcYVMGOAHt4SiBJpvS8D58+uw2/u9CEi?=
 =?us-ascii?Q?oapp0u31NqxHUQHLeX2gnX29FK5TOLQxs1lgx9jJgQ0IBwlMBQyvRPsq86BK?=
 =?us-ascii?Q?ZxDlAk7AArxILtjFELtFF2ctKItaXh/dIJZUkJPZdYAfh7LaU0vBi7Ou6Cvm?=
 =?us-ascii?Q?p4TTkZ3ZxnKxvKKzMYR0PtUp8c+oaaltzZw+g3CNmS4KBcaZvT9SAqYdawRi?=
 =?us-ascii?Q?khhICozSYhXqKN9HuXj0X486whZj4XyT+KYilOxBlXtenQKgkhm0mhwtnRPu?=
 =?us-ascii?Q?mIC8bvQmw0sKjIw+ZcpCt9iWHW8pH5kH0goljf3AeZ5UFQ2ysA5cQ6p9R0Ha?=
 =?us-ascii?Q?lMoEJVfesoXyO7DX8vM/iDyTqKUXRG3obdaVrGVbu015JvAjR935aMIIPZkE?=
 =?us-ascii?Q?ej6S2Rer/n6vWJWLtiIIt4yuxo93kjPd2myqMR5kWg6M9D2/8wccLyHg7UfN?=
 =?us-ascii?Q?bxwdIGENWKGG3mFSn8KoYJmkYhg31nZfp4Kk3BJ2Gkd1QbDE4swF6KxETSdA?=
 =?us-ascii?Q?eTm0pAMU6rSatRpW7SqvGGDGsqnXp6V16FwY6svM2v9TiUYdcph8NL1l1I5W?=
 =?us-ascii?Q?93OD/gxnK1bnNJGqcy5UalwkjvLOyby3mWky3ICDZ6D0YgGMpsXxWsgfl9TH?=
 =?us-ascii?Q?N3WxvkV+UkBJySFxgTse0v0j04gajQhkS5rY4kMyghW7BXTavnjcqzSkDY5y?=
 =?us-ascii?Q?nXuqgdYsZz+uqjWgdpw812bTVN0/AlRuI0MkOLPQ2CN3f6K4R0Djy6m0FJ7y?=
 =?us-ascii?Q?ZP015EguXJaubb4JhGwahpcKJ3y0YeI3MIyLYynfiPLl1XzkDauYulh4mGsw?=
 =?us-ascii?Q?tJEJ5/z/a2/EeemktkAvDCjW5eFeRKLLJBU3WFjqLZ8DnZudR2MOo0HTcuBC?=
 =?us-ascii?Q?KTBGUZM8PAH7rKsGi+EazrDI1K+Rn4yaY9kfIL/QqfRW9wjv5g8HQngECMnA?=
 =?us-ascii?Q?TQviRy32Z1FIfdnow0PJ/P4r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67120a20-57e5-4b97-c284-08d94b72f40f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:38:54.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WK8JnMdtmDHQHtnvjTyoAw6CjXlUYXMb+9ajDLMVe/RkJXRyfRAJuN49JKLp7Mo8QV9WLL9xfSZi2E5OS8rq8PEaqs/5VzCM9vfBoQ9knbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

qemu_img_verbose() has a drawback of not going through generic
qemu_img_pipe_and_status(). qemu_img_verbose() is not very popular, so
update the only two users to qemu_img_log() and drop qemu_img_verbose()
at all.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/044        | 5 +++--
 tests/qemu-iotests/044.out    | 1 +
 tests/qemu-iotests/209        | 7 ++++---
 tests/qemu-iotests/209.out    | 2 ++
 tests/qemu-iotests/iotests.py | 8 --------
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 64b18eb7c8..714329eb16 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -24,7 +24,7 @@ import os
 import qcow2
 from qcow2 import QcowHeader
 import iotests
-from iotests import qemu_img, qemu_img_verbose, qemu_io
+from iotests import qemu_img, qemu_img_log, qemu_io
 import struct
 import subprocess
 import sys
@@ -112,9 +112,10 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
 
     def test_grow_refcount_table(self):
         qemu_io('-c', 'write 3800M 1M', test_img)
-        qemu_img_verbose('check' , test_img)
+        qemu_img_log('check' , test_img)
         pass
 
 if __name__ == '__main__':
+    iotests.activate_logging()
     iotests.main(supported_fmts=['qcow2'],
                  supported_protocols=['file'])
diff --git a/tests/qemu-iotests/044.out b/tests/qemu-iotests/044.out
index 703cf3dee1..ff663b17d7 100644
--- a/tests/qemu-iotests/044.out
+++ b/tests/qemu-iotests/044.out
@@ -1,6 +1,7 @@
 No errors were found on the image.
 7292415/33554432 = 21.73% allocated, 0.00% fragmented, 0.00% compressed clusters
 Image end offset: 4296217088
+
 .
 ----------------------------------------------------------------------
 Ran 1 tests
diff --git a/tests/qemu-iotests/209 b/tests/qemu-iotests/209
index ff7efea11b..f6ad08ec42 100755
--- a/tests/qemu-iotests/209
+++ b/tests/qemu-iotests/209
@@ -20,8 +20,8 @@
 #
 
 import iotests
-from iotests import qemu_img_create, qemu_io, qemu_img_verbose, qemu_nbd, \
-                    file_path
+from iotests import qemu_img_create, qemu_io, qemu_img_log, qemu_nbd, \
+                    file_path, log
 
 iotests.script_initialize(supported_fmts=['qcow2'])
 
@@ -33,4 +33,5 @@ qemu_img_create('-f', iotests.imgfmt, disk, '1M')
 qemu_io('-f', iotests.imgfmt, '-c', 'write 0 512K', disk)
 
 qemu_nbd('-k', nbd_sock, '-x', 'exp', '-f', iotests.imgfmt, disk)
-qemu_img_verbose('map', '-f', 'raw', '--output=json', nbd_uri)
+qemu_img_log('map', '-f', 'raw', '--output=json', nbd_uri)
+log('done.')  # avoid new line at the end of output file
diff --git a/tests/qemu-iotests/209.out b/tests/qemu-iotests/209.out
index f27be3fa7b..515906ac7a 100644
--- a/tests/qemu-iotests/209.out
+++ b/tests/qemu-iotests/209.out
@@ -1,2 +1,4 @@
 [{ "start": 0, "length": 524288, "depth": 0, "present": true, "zero": false, "data": true, "offset": 0},
 { "start": 524288, "length": 524288, "depth": 0, "present": true, "zero": true, "data": false, "offset": 524288}]
+
+done.
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 03cc00366e..def6ae2475 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -195,14 +195,6 @@ def qemu_img_measure(*args):
 def qemu_img_check(*args):
     return json.loads(qemu_img_pipe("check", "--output", "json", *args))
 
-def qemu_img_verbose(*args):
-    '''Run qemu-img without suppressing its output and return the exit code'''
-    exitcode = subprocess.call(qemu_img_args + list(args))
-    if exitcode < 0:
-        sys.stderr.write('qemu-img received signal %i: %s\n'
-                         % (-exitcode, ' '.join(qemu_img_args + list(args))))
-    return exitcode
-
 def qemu_img_pipe(*args: str) -> str:
     '''Run qemu-img and return its output'''
     return qemu_img_pipe_and_status(*args)[0]
-- 
2.29.2


