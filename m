Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4AA47E63F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:15:49 +0100 (CET)
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qku-00010L-JP
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXm-0005FL-Ht; Thu, 23 Dec 2021 11:02:14 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:2176 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXg-0005Js-6a; Thu, 23 Dec 2021 11:02:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3I+nNznB3my47IvhGDk58amh/RaRVhhklViGDmvFUyiDpD9VA7wL5JazRfxrnRa/ZwJS/9qA+Gwl3vWAz+M5ojs9emudDQTJo2ayyUf0+0k2zBJ+sONzf5oipURQ0jgyUKVQdSWWqBRdPcy+dV2MMa0f4ZCB4YOsbE6E+H/TbQu+OpsPV56ijnzOE9iBobdzp6g0NUPaXyJf/OGfTSGe70p3THAhh82IyZG5eItjJdmePjn0itiVnrzA8CfN9uv6eQUbPeJSHnfGJf0r1l1pEPAAGVZN64VlYdIrkfHCvw8/Qy4DEWHraqDCKLn7NQpNizgpxJ697ueC3DBvStdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Fa+F/H7Tvpi70Z+kG/DYY5wrn0r5gwyoz4B9H+F7N8=;
 b=n8EPVTnelPiVx9Dhy18eaR4lYFw2LqFh60yjK9vkShEsd4+Ufuss7VNtValzaL57o1EqdbboJ19Yjz3psirHOWC8MUa4hO8i9WBvz9Ngd/94kqw5VHSEH0iUHARYTQ2H3chtXvJPvv5pLiyHF7DecLWJMbpTLVMkMyMc4DQX/a/oEK1uA6pdibBwS1BIGi48rWNZ2JbSoH/LZkR1fR+PlYiqg/GucCbW+4hVo5CBWU4pqA4+WHxMYdyCIErHni2UgiqwyKWFiGqqekmxZs2MYGDgMB99CoYKOCxnxryxPlvXk96y1noafAWZmwMbLUZPEPSD/q4vcwFGZb7L86Xe5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Fa+F/H7Tvpi70Z+kG/DYY5wrn0r5gwyoz4B9H+F7N8=;
 b=wAHFKSknZDOh44INz23Mp1bdNgGDB5JN67mfn7f6Y/Bptxww4/HCpMkz2066LNjjjVofLlR55ZbenTZiKOqbAvZ3aapJeilO3gJJIIU3D2p3Ahmt7mTk5dgBXVPgImagG4G8293lkRsnHMrqjvFOFTMwgC7lK6XdDbJb9P77KfE=
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
Subject: [PATCH v5 05/19] iotests: drop qemu_img_verbose() helper
Date: Thu, 23 Dec 2021 17:01:30 +0100
Message-Id: <20211223160144.1097696-6-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 84047942-25fd-4681-0ab5-08d9c62d8b4d
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB61487FABF981778B6A2B6326C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erySd0M7+3s2jA0yFtzKpVRPhfMkvXq4p/F5HITSowe07ywFILbVyecgHMGFtTsCf1eUnoEIkHlm2zk7FvGKLh5OKAQQWP4Ag/l6hUbJcZVGwYslCCW4CCmrNg63nvtWEaEUonC65Pji1Kdm248ZhJ70ansnOM1iGTNKQQH5xJ8ssyOXcwxDUG0XMdXSOQqk6p0m9wgEofx6NbPEKk7QntsVwbudyQXxU011ovrqFcePUlypdpZVPzUd6ROVXsCfa03dXa4NaJxD9L5dn7wbYa3P5xJ/khRJmCQf3RwzTcvJeMYNeAYQzs5/rEtDdhgyTfeZQc2rVtS9V1TkqJZRcwIZfN/uvtRNRC0mtxyBLGhGfmbCt/juAyMM+NoVZrUQN81XPdfEUUPg1YVhSlDChaZdFROM5SAJSlWoEsDwgFUYUlYJeVvIRTBfFVFqYPyDQIuPlM5DDuw/aDEaUCpqaHYwEYOr/IlicOjZs6KFOqTmVNFPaDFN2sJFMmAOSMLF8rK9Q4C4i+pzNuJmVVQ9+dGN8U8UI33MI5vgMNI8eQq4kuRmNypr0O3ebuw+fukoHidBsZSv4Y0oAo4aLlwjlpmOa5IsakPCBtRqWBbfi1u34sDD6wliBhfL/bLKZEZVn0C3SKICOzoR1lzqL6eHwVVO0v5dgLH/rIrmQqQDyryj7C+7vawwzin2PJYjOhFFeUaU0XfLtMbagE4D74xa4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?npnKV6uf495Ji4gKEsNt/2EusxhJMc0kLjht38Aclbg4PYGqHEiZPb5s2vmr?=
 =?us-ascii?Q?EXWIXc30PXwDXZuolEhIajfdwojFPdC57deoMbm/BWN+yAa/takuiBVxdSPd?=
 =?us-ascii?Q?NeuTX8aQlstZlPExukkuQKMJSnH2a+6PWWda3ATETV6oGg/EE36uX5uXJHf6?=
 =?us-ascii?Q?71Z644Tt5bpvZ49zpmEUkqNeNo4YVzBtXiT5oRH7SULt5jyAaJLpFHtQxx4q?=
 =?us-ascii?Q?vBV/kwRg4CtXxeGPcYSTlWXrQdcsFl/h4qXM5oK1fxsY+t76JxiwAmvAm67P?=
 =?us-ascii?Q?qiUctyw9PyjbNXJdshKM1zh4zmaTFDlCg+gBcHNkyUv7cAvXry93urAWOW62?=
 =?us-ascii?Q?HdoQoJce1G5puUL2KwhaXIDcVqB9TrTL2/cc0NoXwrJPMge4TDvYiM+DlnZX?=
 =?us-ascii?Q?hINSWoR7APBpAKa5YezjEkQLzelrbwZbqZ0FWTAZShxP/GV8AakTJLfSW0b+?=
 =?us-ascii?Q?SXrrGvJr+/l9A3JmTdU05ckXGco9ZUWD4pfOyY3gdug1C/4TU+Pn6NMdUSw5?=
 =?us-ascii?Q?ldHFAlKvmuPfqkqYlDSFplCBOWkihEHRDZVpXHImXPOH5DjppMoSbDZcee51?=
 =?us-ascii?Q?39Y/rcRjmtOsPeO5LI108PXUZlwoB9eJ4JaE5Obf1303Aq7WD+moqMM8NVUi?=
 =?us-ascii?Q?KNKwZU494B98v+Q6OWZIZwCeVMeD/8fWoQ4mYQRaVL/WghTU67IZjSZKf2p0?=
 =?us-ascii?Q?WrHJDKvU+rzPujz1HQ0mmtJmJEdzYX3FTcGZ42OqYFltZcZ//ELUVziN+b4X?=
 =?us-ascii?Q?Ocj7AbmfpwC3iCPh+TSZiZXN9CnxMxrg3btrOxcvc6gZFepGJjxbZXWAXtyX?=
 =?us-ascii?Q?cCpt5S57AL3jU6WIZUIYtWJsCxGlJUuMQVNZWJDmXjNMcokDywA9b6iQc3hk?=
 =?us-ascii?Q?/8FX5vV+MwJUBbufiwRcWOAAUnsoJXlqQic0d6IP6tbOcky8rzHT6tdU8rOu?=
 =?us-ascii?Q?qTEQp+W2x3px4jRoKzPefBxj+E/My8zlux5jGidSV5Ud4ybWEtUXy5G45lGf?=
 =?us-ascii?Q?SJXWCAJXH8dIiV2U9dPNVAo8ucxn5CtvmN1FOCoNYQGteC+gQNl6IRE3SDI7?=
 =?us-ascii?Q?cQM+K+pnAeZ7ICD2/9k+a15gZx1EKMTpmSia5/QbszO+4pnbX5Z++38WSU+W?=
 =?us-ascii?Q?AKQyouTTfnjPNGHsWI1yhNxZ8D8a75/HHczoz+D+YHaTMO2zoPk5sSJ5ebWk?=
 =?us-ascii?Q?Yhtp5A/6cjXr6VzAmYLDje/FM6cKHZ69KltO33wmh9U/LPTXe7++4Rt+ilZ0?=
 =?us-ascii?Q?v8TFZzEMfM7Of3GP9wtZbS5ffmtJfWBrQUn65uEA0pfGeh9VMjeoTIdlSxU+?=
 =?us-ascii?Q?48R83ZovuFM4tMKxEtbf1Zw7b0EkhA5/gtlKw6ckKrIofBRD8/Kk1plFUGw1?=
 =?us-ascii?Q?yjdsmYjGyKqBjVH512dOb5SCejp94R2GYe7cwSp5Dla+cRAzoI2ewTxCR+oN?=
 =?us-ascii?Q?EsAh19zAPRCC5Kl1CpWzQzGlC9P3XGb4ULScqK91Qr9QUxauYm/+o5BntmEn?=
 =?us-ascii?Q?fEG2pxOro7A462FaO7Amr2htGA20JymS9WaGQJ68StCMenvDGntgJHanmzUz?=
 =?us-ascii?Q?kqlalKyflYaGWQ9adzxUeFqnUzUALDl6zkvl5leStinQwzKPT01EGDydvsCD?=
 =?us-ascii?Q?tOXo4gC4OMsIWQlYF9FyuPPVPtB08VhAgxjhcUCIYScU7VwAOgOb9qeiuQLP?=
 =?us-ascii?Q?CS6+jiTqOuzAZ7rrcS/brZb9c4o=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84047942-25fd-4681-0ab5-08d9c62d8b4d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:56.3483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwUV1p7dnwKp0ssZuqO1ArknEWF2kCi1l02m1JwWfBrDDf9dNsRZVk2p65+yOPVVnRSR21RvYFyWCrT+07AYLu3MUctWq+8NXnib/U0EGWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.124;
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

qemu_img_verbose() has a drawback of not going through generic
qemu_img_pipe_and_status(). qemu_img_verbose() is not very popular, so
update the only two users to qemu_img_log() and drop qemu_img_verbose()
at all.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/044        | 5 +++--
 tests/qemu-iotests/044.out    | 1 +
 tests/qemu-iotests/209        | 7 ++++---
 tests/qemu-iotests/209.out    | 2 ++
 tests/qemu-iotests/iotests.py | 8 --------
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index d696e6442a..a5ee9a7ded 100755
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
@@ -112,10 +112,11 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
 
     def test_grow_refcount_table(self):
         qemu_io('-c', 'write 3800M 1M', test_img)
-        qemu_img_verbose('check' , test_img)
+        qemu_img_log('check' , test_img)
         pass
 
 if __name__ == '__main__':
+    iotests.activate_logging()
     iotests.main(supported_fmts=['qcow2'],
                  supported_protocols=['file'],
                  unsupported_imgopts=['refcount_bits'])
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
index f0370b5206..5a6bfcbb6a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -227,14 +227,6 @@ def qemu_img_measure(*args):
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
2.31.1


