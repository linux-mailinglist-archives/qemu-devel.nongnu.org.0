Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498E40ABC8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:33:54 +0200 (CEST)
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5lB-0001OW-6H
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dw-0004dR-Gk; Tue, 14 Sep 2021 06:26:24 -0400
Received: from mail-eopbgr150095.outbound.protection.outlook.com
 ([40.107.15.95]:35540 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dt-0003UE-Sg; Tue, 14 Sep 2021 06:26:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuU48sFvETB0hNlmIA4eyeoLV7YoE3W1JYHG1MGf5nIOxNwDc+5y155TziFTFpjtbNkqEJXfbWd4vR8CnOOlw4nBLwm2YXn8KTWHoYrpRCzrNyJctWfpSFHPTlf+J2pS5tG0RoMMbwpfzfB5j1JgV/bPuwwLS05APNLrOhTw1V00Nhx3enBh0/fuN6y44b+c+x1hGAPnJYZMlcCzCuFzaqI0CQ0XJQfmE0o+yDSi38yH6CVjndHBtKsLwBV2jR20zjGrU1cKQBkRh/zWs0mAuEKcD5LgaidHeDyjI3Dih8+lo7v66rc4rva9IllsnEJo9HRcTXv7F54CWhuJ1qVHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=w5aFtROQLbfCktByTa3PSujnpNmJ38tZs2mRSHTHX10=;
 b=lHQ3Pb8M6IQ29fUTwr7RKN3YEJchD85i089uYYvn2dpEkkd+aTf7ts/zQ7p5PW+EwoFiTdc4s8+3eTdsw35oug/Jdg2sNLj7PFKeBLsjZYoBu8KHmBydAFpc6rH6yTtDHhROTRLWJi1VuPJarUl73dAbMmToHhvIE+fjVkjUbAxkr54ocQBxE69xzS99D7AEgFvIiC9rpuQCHHNNNw4PvkBe9D4B+V0WczfmF2a0SOvi08h2ourml+dzEnkJljvF5EJEdn9lASfoM0mu2FDKtVh1Nf6LasYrm5EuF+8pIIzV3JGYpAk73pgD52/TcMF2oVuXdJJw5dI/t81AsBOEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5aFtROQLbfCktByTa3PSujnpNmJ38tZs2mRSHTHX10=;
 b=a6WNRcdZVd9zN87KrGLrdIPbR0jm8bnRvAnAEm/Y3B6+cMUSnAjEsv+OomvFGbL6bm+5JY8QhB2u3/Gj7jRSx269Or1L8ym+t31NpBR8pVn2P4eOpenPb7Hf1afamjt69EQWTC3LW8wOZEIW2JHM2u3RikMH4JIqa6/zUbggzuU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 10:26:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 03/17] iotests: drop qemu_img_verbose() helper
Date: Tue, 14 Sep 2021 13:25:33 +0300
Message-Id: <20210914102547.83963-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42c2fa13-84df-4798-6f48-08d9776a11c3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1716D6EB76DDEB96D49522D7C1DA9@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9JamOBjw05+dFPEx1aKDopSf1+v4tMVv2Mjgktm/Nvw457whGOgMY7CxJOOHHMi6KS3Nt+9GcME1NVjnIWsYBhXsBb062OI8cn9QLK/SvA9qiaKkaQiys0F3MeIqX6WqRUhAf6mrlTxwCAUwSR32Hz0oYe78b6hvShOHm6/aJCMG52FWmZKXb4HvisYC0gxcuwLi1Jg2z9kBKdIN4zmUlqz9XNiKUy5pGjMOLkGcFSP5d/u9RCN/lQcxmGgN0U1OSFE/VGWbLDGvk4/0A5SW2KW3mmYTJiN0BjksEu0INiGvmcsjcMIqWiPQhnPXE/dvD0uRYjn9e/wgFLb3IrVIonyJiyqtYZ/lZVvyg8hgIWCKLSFuYgj9YqoHyVsdHj7tMRg9AghCFxAu9Q4H9SH+IlWuBgCK+tuUpMr54T394j+M6Szci7ksIudTo09sxMelY9ypP3PKhXvBTko6qoFnG0eun7zx/QmiYpnHjtNJc1Lg2SM4P1W5iharupO046FObMer15KqdoC3Ki2EZDw4cWiZzIeQi3bZ3jr5J4BjYcsFIKwjZ7PsdJYuiZMXlzosTQT091zhuq/Ao2nmT+dlDZoyfKCbYyt0ap1VbqzC9jCvoemfiSzbj6Emur3s27JK7P0KNnq59ChticRf66rLQnj37BfnihZZTxHSdsg3E3m9bDbpBsINt8/MPxBzW/h6SccpQHF5FAP26lpSoedX7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(478600001)(66946007)(66476007)(66556008)(36756003)(6512007)(52116002)(186003)(4326008)(6916009)(5660300002)(2906002)(83380400001)(86362001)(2616005)(8676002)(38100700002)(38350700002)(956004)(6666004)(26005)(316002)(6486002)(8936002)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ubQiAn/XLCp47FC/2My8fHPskJbdPc2bB6+g1xVtfE4sZI50icewTFZrbUeI?=
 =?us-ascii?Q?82ZPoKpKiSHGCyKV7wi5KbRVRKRWSYm8xSIGyZS3bpCxu+nZmL3WAPb9nUCO?=
 =?us-ascii?Q?uPa6jgBV+5f2wcrxsweZ7fm6O8b3nVqk4rMpY99v/f140NbBdL+/Bs0Pav+G?=
 =?us-ascii?Q?dzee1Eublvh+PUW3QKrucTqDA1khYTaDtA5IKvib0eq8OcLYNMODxbvaFYn4?=
 =?us-ascii?Q?DP7TS1APJcjxoJzOVAU49ZeBJOs85VuDWeybn892jKv5nteIGyoGFUUhcU39?=
 =?us-ascii?Q?CD2v4uGHKxpyqCMjonkHNko73pEoSlD6aGwPuRwVJkL23u3IcNmmAVEaSJE0?=
 =?us-ascii?Q?IIDq9P8aJ55lU0Kw4Odedi3uwgprfd5BdYepNQRXqLH/FUxMeMAvtg2s3igJ?=
 =?us-ascii?Q?g89WZ4pMToM5o3OIRt+BzLO+Nqb6BmFwfvfo+f2SLuFPrCD7zvPXjarlmQtH?=
 =?us-ascii?Q?P+oLr9BhiQ8dkIiWaY9oRRfyycJhdKMm0pWPUfxxQc5nQVzrpzmr30AAcrfM?=
 =?us-ascii?Q?EUYnau6DktWtetL3NpW15SD9SHEI+wGKCjJBBC8p3LizVpuxjPeHfyV9X9H+?=
 =?us-ascii?Q?xwZ72Hv4pPbvZ1WfKKN+rrdoLq6LD4k8K0+K6cDCmMR23u4A4iYoADyUXzEs?=
 =?us-ascii?Q?FRAx9HhJCkY7qcp7r9X36UEDoHNMniun0FYyVY3K0Y5Vpf23x8sLB6SNUeTA?=
 =?us-ascii?Q?NuUpTafORGkla9jNDAvcsKI+H63XdYUjSyTerLZPVpU46hpFp74CJ/ohZfQ6?=
 =?us-ascii?Q?jhuI32bjqYzGPurpTO+xJPIUqwn87MCla6A1WktXDp/T9yEGuSP+4/ypmOtL?=
 =?us-ascii?Q?fzeYF7/Cqx+XKHmcatSU3rs+lzPaV/EhnGluSFJIkNaarbHUWygzZL9yDVs1?=
 =?us-ascii?Q?dMUWAWxH1f+CAO0e3XJ2IOO190tCB55RtQqIkwLcfXx+pucx1nwasWLLMLis?=
 =?us-ascii?Q?5j5568WRgU2pfE8AnjUF16XllrWa1fT4E0Xp+1GZAxNT3xuHvF2Tf4aQL5zh?=
 =?us-ascii?Q?PH314Z0Gr0+rHfLsG6WWxayaKgCIcl0aOcwo/uDEMVa4FyBJnoLg7Xry35Bz?=
 =?us-ascii?Q?bhzf4exVQNeOzJDy9BhTkVDlBL7F5HVnbbWLHTh8gLLuMmOAAKoa8hfSf0Wv?=
 =?us-ascii?Q?MD1woG36hn29IsvmXZ3xaxNMpwYlOFlSy26UlsTBwaSAbeR8gtVOxxDdyJ6F?=
 =?us-ascii?Q?Z3LcSzYzvI4t5R3u4EqT/TsTJW/XQIinaGs6nnV2Q2Zp2myyn2cgT8h/umvY?=
 =?us-ascii?Q?MMWG2P5a6VKXd82NlRdxnyX3dYy/i4jwVPvvVkaFkR3Bn7ULcAc0TvWez56y?=
 =?us-ascii?Q?c8/PwQvm4ylsSWYAt/NOZRdI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c2fa13-84df-4798-6f48-08d9776a11c3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:09.9050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qu7nXOiFIzB3AmXy4Qe71/SGDI87ecp7j6hsnGpLDf1YmXmU8H39xv/A+YNwvauWwv8Z+04BBffTnCf29NHnA8xMDzGr+JJZBwOt5VtIY1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.15.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
index c878fdebb9..fed7e1f640 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -213,14 +213,6 @@ def qemu_img_measure(*args):
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


