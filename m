Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCAE3D0C7F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:39:53 +0200 (CEST)
Received: from localhost ([::1]:57908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69do-0001WV-8G
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697v-0008Oo-WB; Wed, 21 Jul 2021 06:06:56 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:11108 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697u-0002Gy-6i; Wed, 21 Jul 2021 06:06:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFWMY3mG5CGyt3B7wEKy2UazkyeWodbuw7QyEK4oMBOLGfBqLIrhWkAD/if41KlQILfq0V2MfuRXP5NMDb//dJGFxYJCI9XHzPP/oa0qnl4i58Wy66lt9LLr8fY8yEs6EbSZNcKm5lRCSSrIMWtpBKs9BhMA1wJBat4OYpvs4XOhTRJxIXMmm+kqllqP5F/sYPOVBgtMIOcFBBoRDGWRtqZ6AN06Ce9Gd9C0jWifeD3LH91U4WnYY/LbumLp1+6zIpKC2vE51Imj1RJlGIvOLaBYS2VEklk9fRFAHf/O/eUNiUZcfOISgtz5GUj1P2QVi+VnKQz7py82Vupm/nK3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=an6cBU5FXusGPl2GJcOwXqkPGfErmEvaq46ROVt4IHGuwqZdtzXvns28VLe1GVq6tx5dFkk7MqKZSFOyVWMpfH4J56ZO9jUJxf4mUaBhyQ5Am2AjnlhTm2OjHww4S9iIVgYZzIhhWyH4cPunM/N3siAMsPW9U+pXImM6x7h3Bj2lzCAF6CQk+jjs07J1ZUKDaQoL2TWDu2Dr9uAqdThmCKxol2PTaJatpTDRJAzNEFZJsA8lpyG4N28amsBt7wcH75sRjSVpGR3KwJ6bDtE8SvbZRh8Uz7wPWQSd62wdaCFm7DFOxuoZy/osxh+gUXfdllIbq8WZz8GvdQShbzSSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=bsBDnUOxBSHf3/fqD1e3+S0LThSNDRa+03uWsq+Z+W2aQYKQYuhWCfzH//814z1VI7PRgvIUiJUVAoyXqwArhl+WaP8A5IRcezJQnXi25V89IRROdVEixEOiNH2nfghC/eG6qunV2EqQBpuYVhnssuzbT0yR6zADJlbBxl4vh2s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 26/33] iotests/222: fix pylint and mypy complains
Date: Wed, 21 Jul 2021 13:05:48 +0300
Message-Id: <20210721100555.45594-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56cd270-13e8-45cd-ff6d-08d94c2f3f9e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54943AF4868CCBA1BE9711DFC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Be/mnFrgyFBUTOOA3PrmkUp8PaH7DuEFCCuocRa1TI3xbuC8xAOfPol2Hfrg402+0AWqmBy1wiVidq+iR2+U1pWSffQyuEMkj384yqbzL9Gl15KFfpg+JrM/T7w84oWwoPY2FHCn/QIAxDRTEoZYWJ6AS6tebU5nnNZkay0jIW1I6oThzmOGKxUYpRzpJ6zmPlEwEcIuSHycZRi59xcXchAg5ZXWAIlOGbadgnyPpTpfEujqL3fJFMDyAsti48Y9DyfQayPXbdNbbXXCTMLEb00KmCwUlqskHjRFtQlqlVjV3e70IRAPzElrusSVYyWDgk5X03DGFXgukzzc0axLwcsFLkj/EYulDFgXckGXHf/IxUIQ/jvg3RnAoz7jH5kjQHnBxGA/SeXihmyPR0NFBmFWBOUubTZWWLp1rj5RlnjU3oLYAropxvoIye32sq17klniBSU0s6bbMpe//9Zx+mypw/jQ3ctx47m84xqqIYIicgn7A4AQ5Kaoh1j5U/89ofKjZHBuHJflnosoDUpBr6QAtkUnGIqnLcp+qhT6qRkuOXwf51x7cL8Aq4NixeXfwIVV2KhnJK1ftvtbr5703oQPwPvfDEO4YGOiICyfWVUDKwraPp5wW/MePUOKpJOqCNyybrdh6SG0b6Shi90Np2w3wfgiPBeN9oMcngPOQ6Vx1hNV9yOClv4D5xSDWlGQnJguwROycVc9c45xQHhgrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qw8adDhpmtLJST7NGtcpSMvihYcN9OaP/qSu/RI1LonOs4nRjhJoRjfFqc5q?=
 =?us-ascii?Q?WTeUhkZnYH+gOqszXhVtN9dZdpdfmCnf3PrvPHQ3rSrGjm6g+0YTircuJu7p?=
 =?us-ascii?Q?7OtqTh4+BLUYnFJLeFU80/pIUqQeQVTYYmXEIdI3l84WUJh7ocEJiLuoAGZW?=
 =?us-ascii?Q?ssDJpCaxIKted+8bCTDdTUtpJa6AVHh8c1XHEyKiriGLZTJtfUpv3kCTM+UM?=
 =?us-ascii?Q?7x0ZuoZR9s1ZCJuhUsCSGLutmfUtq3U+R44J8BJWxrSC35a7/ChkjEdYvftI?=
 =?us-ascii?Q?/aXaPAK1wiZydYZV6uLnj/4YRq4bpQxhj9JDzVpYJ6AOI8Thbka/VBN6PoVc?=
 =?us-ascii?Q?/9lc10LoPoa0kRXEtbzDzLxHAm9XrkHdQvlHTiLCcroJp4zLahy10SRWAFIU?=
 =?us-ascii?Q?kV+9934GXZKSmO/bzmDh0zKDwyZvJKia5V2Fku2bHOFpmq+IjMCZ+wYknqA2?=
 =?us-ascii?Q?EFszl0p40AI/0xpSOYousWt5HhHEaOOIFV8OTKngle2E1ghxQTGMjWyBjY7G?=
 =?us-ascii?Q?vqGhYKFRyx/BFrCSk4/qECMHyZeAdj6xx8LP4v3m+bUy1qKiXw2FzlpeKg7Q?=
 =?us-ascii?Q?86e5EPxy7W/AkZ6xt5VILvKjPETKp3YbImdFpiVPxuE02FCboPlgDjj5Pb32?=
 =?us-ascii?Q?XUWFllk1aEfk9qyt3wVoVCOf/4pexMnMDOboohtvUbuvSj0gxlO2tn2FGXP9?=
 =?us-ascii?Q?0tF99Z44H2EtFxIadSyzZg52nNqJygjb95IaWenoDcaewg/xpAXQP2AaDvXP?=
 =?us-ascii?Q?SQUpebYsmKi8OetJZ2SMHBnnIQ2ZgW8yKM2T/YmkQsuAvRfuYoyJRUfGbc++?=
 =?us-ascii?Q?2zZUirXxOtBLOjyfNKDS9AXGdQiHWy1DAkAoQvCrJU5kDJAuw06Ozh1HNW5Q?=
 =?us-ascii?Q?7aHwPqRU4qvw1nVlE6fGhCp7rrHJhgig2R/H0hXKJZrLmbWEznXodGwSFqhF?=
 =?us-ascii?Q?7YXIlcLjKzsJ2F4FAwjJAfA+zqzZp2Nsc/UYP/9BMplChg8Mc0rLPtO3gH8A?=
 =?us-ascii?Q?qe8C/OW/18CASfY/G3h0zzaFl2TLM1cL8GyIY1cl9ITpXayFSi8veHRaHs5Z?=
 =?us-ascii?Q?NHOrV08o6fdKNQdkQ4oyyN0JzTG/aVlSMpp61aGzg6UugvcI8xYz1areuuVj?=
 =?us-ascii?Q?EXBI3jcE3mTe3DYtwkUHIRQPN5cmMhpi2sEcKufRuUYTj5BjKAuWDnl0Glvr?=
 =?us-ascii?Q?NhgfKfBfxmwBtBmvDSq1qGXHDGr3BX/cToC8iEHS2TlzIw9wc4xIaMiFnreY?=
 =?us-ascii?Q?81v4cG1JFjtO8SsPy7wfcvNvcY+S7h14q8e0tTGDN5NcRSybu1NqQcP23FAr?=
 =?us-ascii?Q?RjfdjmpfS8DKMDz7qqM/uxtY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56cd270-13e8-45cd-ff6d-08d94c2f3f9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:46.5369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzpZ9JtHgRQmHw2QoduMGDInAIXC8E/JN+Puhv0TG/370jRPOr0yF+CCcYVftPP8QNBUD3mu0VhARFzSPG/FAHsu2dSOhuWdVklKOSplloU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Here:
 - long line
 - move to new interface of vm.qmp() (direct passing dict), to avoid
   mypy false-positive, as it thinks that unpacked dict is a positional
   argument.
 - extra parenthesis
 - handle event_wait possible None value

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/222 | 20 +++++++++++---------
 tests/qemu-iotests/297 |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index b48afe623e..5e2556f8df 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -50,7 +50,8 @@ remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
 
 with iotests.FilePath('base.img') as base_img_path, \
      iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock', base_dir=iotests.sock_dir) as nbd_sock_path, \
+     iotests.FilePath('nbd.sock',
+                      base_dir=iotests.sock_dir) as nbd_sock_path, \
      iotests.VM() as vm:
 
     log('--- Setting up images ---')
@@ -81,7 +82,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     tgt_node = "fleeceNode"
 
     # create tgt_node backed by src_node
-    log(vm.qmp("blockdev-add", **{
+    log(vm.qmp("blockdev-add", {
         "driver": "qcow2",
         "node-name": tgt_node,
         "file": {
@@ -103,8 +104,8 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     nbd_uri = 'nbd+unix:///%s?socket=%s' % (tgt_node, nbd_sock_path)
     log(vm.qmp("nbd-server-start",
-               **{"addr": { "type": "unix",
-                            "data": { "path": nbd_sock_path } } }))
+               {"addr": { "type": "unix",
+                          "data": { "path": nbd_sock_path } } }))
 
     log(vm.qmp("nbd-server-add", device=tgt_node))
 
@@ -112,7 +113,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Sanity Check ---')
     log('')
 
-    for p in (patterns + zeroes):
+    for p in patterns + zeroes:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -130,7 +131,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Verifying Data ---')
     log('')
 
-    for p in (patterns + zeroes):
+    for p in patterns + zeroes:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -140,8 +141,9 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     log(vm.qmp('block-job-cancel', device=src_node))
-    log(vm.event_wait('BLOCK_JOB_CANCELLED'),
-        filters=[iotests.filter_qmp_event])
+    e = vm.event_wait('BLOCK_JOB_CANCELLED')
+    assert e is not None
+    log(e, filters=[iotests.filter_qmp_event])
     log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tgt_node))
     vm.shutdown()
@@ -150,7 +152,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Confirming writes ---')
     log('')
 
-    for p in (overwrite + remainder):
+    for p in overwrite + remainder:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent(base_img_path, '-c', cmd) == 0
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 433b732336..345b617b34 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -31,7 +31,7 @@ SKIP_FILES = (
     '096', '118', '124', '132', '136', '139', '147', '148', '149',
     '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
     '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
-    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
+    '218', '219', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
     '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
     '299', '302', '303', '304', '307',
-- 
2.29.2


