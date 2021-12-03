Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABDD4677F6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:17:19 +0100 (CET)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8RB-0002Kz-4H
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:17:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IR-0001go-Vb; Fri, 03 Dec 2021 08:08:15 -0500
Received: from mail-eopbgr80099.outbound.protection.outlook.com
 ([40.107.8.99]:31910 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IP-000700-V0; Fri, 03 Dec 2021 08:08:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WN0ufH0QoeMXRIR6Y68EoJEgNiyrRQiz7fsmY7UYwZ4V695wA6PLpV1wnfjqwXPwYT3yWVzybWA+XVLY/dCcn+pooGijasapfUA6q+AVI5I7dX5ak8f/JJz/FZYqZMEcqkKMa36UJSDuOzoxV/EokFeT8DkmClU/Amb+MR6UUG4Fuu8r8lPgQFQ9EEEz8vFLp0I2ZhRVKnIxc6r7WF1mJC4PSqkjW4QYHK3G3Ai1c/7oil8/0CpHmluUMrr6w/574YXFYxeieWzkZkJjKxqO0UXNkvMHTFeV5UuAlNz6OvLof0rCvSFkTkdl8n0zEVJ8mrjdSjK0rnJySUAwGqNqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfAH1f1AldwRbRN6ZAAEYbgfqdYt4mT3p1VmNPnl7ic=;
 b=F0AupatCCgXeU63KDqiaguSnIGZ/CxV1A6+mDIPYGZxd4FR9jTFzUiveT+4Hbc00PCzEEc0KgPXB4JKIxRKCxfJk/VBISXL1tRPonaX9WE9wewTfzZ1n4w/k+QZQ6WXa6PbmM5W/665ZJThnWkCMUxDc9B+w2nYYooqxZe1h9EhPUXTP/AwNfl1ONam9f6QZ8oGBX+2wRLeYrA1ttZHKOMhr4PrcvFALKN4QX7rukKd0Zf1XfTxyMSXYEKD9gUCVSSnQCK9tZJoBJtEmrrEErgCSuwkipCYKGAiPh7+C+1zGyZ8VJhRIpBy2Ch9ZIXO8R7AOInFrQYtrYswadUT5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfAH1f1AldwRbRN6ZAAEYbgfqdYt4mT3p1VmNPnl7ic=;
 b=WwZ1Crymt2QUeUGORtbDIl9DT7dxUET6wsS2fWR+tOaQHgLLyQ72n9Rz5VoPkC9JCAQsoWlF5upyWYPOvYnB6VwGymOhU13OAXsnVGSiP2WMPdG/wfwTU79t8Y1xib7JVCPNgL+50kSyLyCVNJlVn9YqkBVJ2KrnULa5JYtuf84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 03/19] iotests: drop qemu_img_verbose() helper
Date: Fri,  3 Dec 2021 14:07:21 +0100
Message-Id: <20211203130737.2924594-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddfd6fc4-c50b-49bc-1ccf-08d9b65df260
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB45153B97003D29D9184146C8C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0TZPSlO12oTkl5CrG6Uc/pRggCxF/gxGQ1inVioPM6EiM14Dfa/FafgSFmo21xtA2tP3HlzYRdCO/zf80VeUsQO2JE/49PJZB9XOEtvQbw2OW15++RRB5T5BML4OPXV569LbE/tN8wZBB5lOjrFcAL/TDEJRIiC0Mo2BPMFvWtVcC/o2utF1Yhpe71AHS6Rh55RICP+BsVwbUDHt5SlpINrHcG03VLLWsdLaXrt6hnG3rec+9l7517XM28lk+dfkqhCkDISqMsCxQcKwhUAlargjEUa4DTw9FmoLRDX4lTL6SDRw6EfDUpR9+vcmp90pIhVBVT2iW7BTl0oTcR0S1GidzlAHJ+OPZ3p9kb6IlEKpUmm0p64/Wr2jb0x1aqFfuLG0KrOPwF8uW2K1dTmX3UPM8Y0Sll/bJ/JXVsu6BR4EJmupqhmMgtV0gh8cqw+/SCxE8ERzheYZ2bRpLDB7OJSb5X/qyCVX5WSd5vF0/nbnsvZnHd6iYfHY9IXo3xtWNbN9QDnov0aIo4Em6xdgGT2dRoNCzG6Rm5eNCEJOZ7mH+0gfXK29VZm/g6zH+vYEWnw8LBJzbOTapTVmU6YBZZnzjc/jUTGx+GitQMAfojwH1VtWU1k1f6++9QXM1FYZUZpZTW6lyQpDrl9lqJUfIyftFbLs2iciUoCpKgy6CtjkTfeD5UlFB3z+NEkjXA1EgpunjVikF1is/BV2eHQaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pigawQ6PVRoy8IlaaXxG75GJjauNqFvuL3ECnuTRmXmLP2DET4T5cuotkxRp?=
 =?us-ascii?Q?hhCbyeHOrJW3gUvvwErfIx/rRNVGhbTyNMXrT/Ozyfm7qwElNolB1m4IW//o?=
 =?us-ascii?Q?EMrKT95n9cYrLw+b+m7oW7b6RhpHkO5mio/NSl0Oy9Fo8qNLTvZSKLRCsQib?=
 =?us-ascii?Q?Ds6Ngo6FuoXEzg25RrtWBG6n4IsqX9i6izsxPtHnz4qUQLpJuQGjA645OpWN?=
 =?us-ascii?Q?h7gylPqTrkd54LzqA+Pi+HCK039SO515zsHs7y/uBmxsxAVExQE0g6jkpi6D?=
 =?us-ascii?Q?QdxSTsva4Pa1VS5c/zJ6plbaYsfr/j7qfZ/uSjSN4I6JA3jYOmKGjGhrNK2h?=
 =?us-ascii?Q?a9j+HW06BU0KocP4y56mMue+cUVp7n9OBZnUl0oKqPk1seQF4Np6Mk3ztUFS?=
 =?us-ascii?Q?RkuWndzKlONZrjeRetBL/HkxB978TXsXzisZRdnHF36ttvr/FEzscG37UJCT?=
 =?us-ascii?Q?rqDuPNyZdRZwHBcYmhv5/RtDHeqztgniyybzK4+f+SGCTMbEYI8/Hf9keyeC?=
 =?us-ascii?Q?s9H79gEtlxxxm7lGp5rdgkU94TOxtm2Fo0D0IUPAGWlGOpby5Nu5Bgrc87DW?=
 =?us-ascii?Q?zZmt4zmWOvs4ymKLNCO75NcuRdb8ybyTgTi9pMBDSNhDLj5nWNMsqThgJOvA?=
 =?us-ascii?Q?K9vYlZumqyfU2DHUrfs21RDkEwxyxdoBYnZ3sdW9jcPT89x+BDMzFndzTI3g?=
 =?us-ascii?Q?0hm9XrdOFckb13OuqXBrXKxVAQg6ZHIgKmgey9pg5UVhwsu/zVzggXF+Hk5H?=
 =?us-ascii?Q?wLXzo0q1vJzjxs1ZSCveg60tGe0n7m3UR7NLWeeAp7RINRPCJ+N/ZsmnMhQm?=
 =?us-ascii?Q?YMVFUALXjk6NDt7EeQDlFjZcHoSs9lF1S4Okm3GpwaMe7QfAGmuRFH6GkLoG?=
 =?us-ascii?Q?V0l6w6hEAiBczz0isKH4vQbD52HGVGwLSoxqGB1pjIofDMr5B0lBwWvYmtac?=
 =?us-ascii?Q?qLt0k6ItP84UxJWw4WeBmsF6unDts6SUclrWiY3J3/8W3uWAKvhcVk6ty9XP?=
 =?us-ascii?Q?ZLc50TrbaUlabvMhvaWA+tplNLNF5yd3nHPVvKBTP4unVfAXjJxi2WYSbCOD?=
 =?us-ascii?Q?RJdG5OCXiKJo09dtHxDFfg6Yrd0cs0t3UX8JjpOvwCfh/Psjl2hsd26HNINd?=
 =?us-ascii?Q?h3I68FqQYXH5HacscywxUopOQg1cSgYcL94r6WWmlt9nQDdYEES4qkGIqF4l?=
 =?us-ascii?Q?jBHGWx84oM4bb3rLuwv/SF96gNiGfP6sug43vb9SG+IX9f5GgxRYRnKCfaTk?=
 =?us-ascii?Q?DYVe1YKOjekvmCETAMsHvLOQ7/OeoDBgLB8gZnIBQP6q6W2C6PiivLG/zNz1?=
 =?us-ascii?Q?TZIqVwU3Ockn3FdahAH05S3Je8cXVyn7tb5Fr9RbnyNNzMBJ5cK/QnB/ki0d?=
 =?us-ascii?Q?vl4weRB0Ro59mtrrflhk2Z5AMfRXXtPUh8iQY+kxDJc96jAmGfnpT9aEbgTV?=
 =?us-ascii?Q?nzDw2bthQwDdbU0RT2y16gP4CuAoYQUP/KnrDvuGiXgyCuN9xMF0WVncp0Fz?=
 =?us-ascii?Q?sxSrwJznE5BSwmQDaEmBkUEpSxOv+LGSiVKJvMQisf2CUD55yMfSMFwSezLY?=
 =?us-ascii?Q?3G0Ru/xIEJdrruq1XWtn5O4gXekIeWewEe8iOKWM4ASGi8dgPquHjO5236l+?=
 =?us-ascii?Q?3XRTAroEgLrd8K/TBjx/YpOxhoqqD4/0YfEEkOppOWt4IlIkrllE217kI8Zg?=
 =?us-ascii?Q?akKPDQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfd6fc4-c50b-49bc-1ccf-08d9b65df260
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:06.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvTAE7kUrFNsglgviBHdHw3FuFsFtgY/ZDD8N30BnTebA/h7fHcKAgsw2gaLfdE29RFnkznlyGVCOh/pWTqOrVocuIMqLOL4kEpGh8hxqZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.8.99;
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
index a7a257ee2f..4846ba7c60 100644
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


