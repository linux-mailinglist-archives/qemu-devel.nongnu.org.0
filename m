Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EF3A2B32
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:14:41 +0200 (CEST)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJa4-00033q-Az
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJS1-0002Hj-RW; Thu, 10 Jun 2021 08:06:21 -0400
Received: from mail-eopbgr80090.outbound.protection.outlook.com
 ([40.107.8.90]:15424 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRx-0004Nw-Np; Thu, 10 Jun 2021 08:06:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvZPxpScKNKHNlvI34R/TBA47l+E5KvUpMrkCbWde/p7yoFWXVbLPn41ZAmerDcuQA3Ey8Sp2aWSKw1sCu/ABeWbFnaCfnaYMTmr0kaLRZlGWTJs4M+koCFWest5XoBD/yKl2HQ7XE24W365VtVS7ZqdTkYi7ahjezaHX2xMDDGAFZiOvmnXi3scr6Tpvgod91VYAMsGFTrWYAosA6B3SPCdoHFEfkvQtCCQK0QOUB6qUeBpd71JJ77aO/ZQO5Je1LjTPVN4sBOWO5zjAn/jIwA9PWYNavkM6QpQNSG85OinXq5I1BU2xm5IdWBp6sEt/pLb3kK5EoFgYrtuoEjH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt429nleZHEMCHaQcRAcAxidX+sO6LfRY8Vn2VYzAm4=;
 b=mFuvG3w2JTgIstzi4j2JT1DLVnrQGykdSI+42ciY/DL6TQTgcnrwlg86rvnH7d77aHXzWJ2cTzNWuSguObUpoI1F1Me1XMxUFio+zR957b48UtnO31dlBWa3BGPVzGvAgo9wmGO1xHpQuyWYZahIlqoRKwlky+N7gHE6otXzEaNr1Ao27WKCNpkm9GVBP3PBr6Dvh7hCelkBRNo+Ml+c+x5u9ZOKo98WZFpi9DBwgpxhD0wdEB28Oh8SPw57j/+1MeLB1mrsOYBLZ6x85c5aoqgM83xQZGi8hloNEdl+aE12H/NyHQNz4hQf2zvr+xwghRRaRvbeiVxVu8o5BE02rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt429nleZHEMCHaQcRAcAxidX+sO6LfRY8Vn2VYzAm4=;
 b=vGQsZSa1u29ghDd8abyVDkGChQf3XU6GSoQXQRxshjMQupwjpLGyfBFvadNR8H8XnDuNoPbczgXFRubem8AIGhjhCWOe7rp9EvatVbPWpX+XHE1esFvW93OyLbAaGeyMup/zGSlKq6h1c/A1Kfy8OaYNABcHdlwJHNE8hM6uYKk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:06:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:06:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 9/9] iotests: Test replacing files with x-blockdev-reopen
Date: Thu, 10 Jun 2021 15:05:37 +0300
Message-Id: <20210610120537.196183-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:06:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01693c7b-31c2-46bc-6dc4-08d92c081d91
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42774CDA984EA07E3DC2313CC1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YIH17FiKYAqz1yF2DaeYSrJv4nI/z1J7492Dafj0zm7P35unYkxOFSSgdsg7Vxy2FP3CVmVuN5hNA8vQ/OrgEhULzQbqJRXwOOsj8nNJObkO7Zqcztd912jR6ZBzfOR41tWn/ZI5HcEwp9UcwIpU143e0bjV9YMRr6s1i08aCUaxess7E+5WqTLkxKKRLRYe3u7/siPKjrMwwHWvW90eS9oIWa+VpPCeIvypZJcLoYRzm5BIgY6FR0FoP6Accw3nA9oIoVuqcytS62vIAZZy0cvOcNYNbOgXgDyY5oo4M94Iog4YB8uMazpbCfa6n3YXucn4342qNjyvWFcfCcIBLRkk3ljnVxSm9DxUMcm+2lDQW/taNgxTWhy9IhONIwon4M1KMyRSbRr24b7v21L7BVA/N2Z4uySWvzoefZ4ivLrCUxP6sAdchawxEPilZTHMuXeqG1Bxmof9kULnHoqu6sC8ViJgTKS9CgUtgb8l13GN0Xi0XLhcSBMAdjrQRUgykcHsesp3pRdXGNCh02OTncccRIgt9vsR+TiCK36CWALQYs+bvu0yfAJX5OqVwEbmm8U0JFm9DdxptU6m/XsARuGKA/pCeJlHiiF2i4a36q7CMyPIbV9DJ7r1dM+Z3uowk+RlW1BKUXPL8BFUHKFXrfulr8wI5MFn9YZUH1VB9nAdxEoVcMItxN3LgKQWRSnUrZQ2g3JkiDLQjDinOa/bCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3gquDZ0X9SeGQw/9obK8kIEE+C0T9iDMVoNUTUwtfX3KhXPYvKPTn2cUg7Md?=
 =?us-ascii?Q?YByHTnjVsaljkGTrODxyKbxS1KELwjS913K6b/N+rxJ3DLbpsJVsmm/9tJWY?=
 =?us-ascii?Q?A1fcpzlAFz/qPg/w//jIqBwgxSvCIHgc1kodVZgfbjLV7Ob6rLOYF5Jo6UQS?=
 =?us-ascii?Q?oL0Gi5DeduUpVwicOf25gYsINsM5ntrpUqqoF3fGukIRiUFzvAAIsjQFY/fp?=
 =?us-ascii?Q?I8JMfx8hDwrZWd32kFpzv8tM4pfWkYG3HivgCGnnX2HkzPs7Ie15sz7j8zRC?=
 =?us-ascii?Q?iEPNs9qtKdUftV1z62ymkmao5eL7IhbJD+rPAhFMmEP79OTStBxXjPMdOFgI?=
 =?us-ascii?Q?s5Q1YcTns9pg00S4JvfnvEetQTlvwplS3oxDPaXs+/L8e1Yhi2ucsJIHAodA?=
 =?us-ascii?Q?iW76bttnMXD6hstodFRyqVLmvzqovH3FznV6DAEc2roRMMqPvpeOSZqdk1gR?=
 =?us-ascii?Q?yVMedXRezRXWP/2SI/HH8f6vsfwp3IR5O4fEnGMYxSxPBLXWRkGujSEDN1ZY?=
 =?us-ascii?Q?T+MTzkvf0F4/3J3hrB1l3J6K2uKBSMPq28hWFHkcp9cCdAfg1E+lN/QI7qIM?=
 =?us-ascii?Q?2pxIBqZEVI1IS0izCbTIzvQ1fNprZzNdO9ca43lUQ7V56EmYvLnPNqsMAGQE?=
 =?us-ascii?Q?F0waMqkM8XtdQxDxQQ3MG0qjN5iz+t5kTQs64LrsEe2GSyyFg3Xj4JElgCei?=
 =?us-ascii?Q?9A53Jfuq73NbJ3Dft1p+brglGO8IBqgFIVP4JVq0U1DpONTC+OAmW8K4qaOz?=
 =?us-ascii?Q?Zug8CjZpDIXuVGkZ2GPv3kBKOYpw+fH2IRb0GtISFrjb+aS8ElxpxaqMjSOR?=
 =?us-ascii?Q?VN1SC1YLRFtpnwUKshZkYl15VdlHuoZE01WuiDJBY638FUydcM/ZTrSxtido?=
 =?us-ascii?Q?L0y00BvtCVyx22WgN/x5FjiSLkC6rKSJGZ47dEifKQ+wkWjfmkA2vl2JwjF7?=
 =?us-ascii?Q?4/TuzxbPdXffU8K6MX+CHckZUCB4NrzY3zrsSow3/OyXm/MIkr3aB+1gYkxO?=
 =?us-ascii?Q?hlTuxT7CpPilv5tF41Xgve86kUQEcvAyvxvkT1AF7KTUIbY8yay2GKX9Hvvz?=
 =?us-ascii?Q?tIfTwRZyeN7CNfhgMYGrwmnmfoJCCWYT7GQBRrEvqXdjw5SK2LXS4SXhwEe8?=
 =?us-ascii?Q?7uLYsuzayh1BgEg5mGe74TW1rvdhhKQ/1VryMYpWlCh0QCIciG1xXCgu/2QK?=
 =?us-ascii?Q?tbJKCr0mChQY0OlCzsUkIV5cZTap2OWnXnNU3dExUCzeSx/QuMdVkePmEMeW?=
 =?us-ascii?Q?z0CXYpjxzsppK23DEYEhtzd6fEZgxZUqr3na0P4V2DfED8XX3IWGr3/aU2i/?=
 =?us-ascii?Q?DxyAWwQB7DVu8Cqd6XeXWV0B?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01693c7b-31c2-46bc-6dc4-08d92c081d91
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:06:01.8759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qxzq9EBXUGB6vjgEGvNv9N34I9q/rXHdJ7h1Bl0c5QW13dYZGaesF01/vwzo7BksVgkzTC7GBl/uhGDJaJLFaHmc6qwmvG521ZQ/V9Gp9Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.90;
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

From: Alberto Garcia <berto@igalia.com>

This patch adds new tests in which we use x-blockdev-reopen to change
bs->file

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 tests/qemu-iotests/245     | 109 ++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/245.out |  11 +++-
 2 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index d955e0dfd3..0295129cbb 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -79,7 +79,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         for line in log.split("\n"):
             if line.startswith("Pattern verification failed"):
                 raise Exception("%s (command #%d)" % (line, found))
-            if re.match("read .*/.* bytes at offset", line):
+            if re.match("(read|wrote) .*/.* bytes at offset", line):
                 found += 1
         self.assertEqual(found, self.total_io_cmds,
                          "Expected output of %d qemu-io commands, found %d" %
@@ -537,6 +537,113 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bv')
         self.assert_qmp(result, 'return', {})
 
+    # Replace the protocol layer ('file' parameter) of a disk image
+    def test_replace_file(self):
+        # Create two small raw images and add them to a running VM
+        qemu_img('create', '-f', 'raw', hd_path[0], '10k')
+        qemu_img('create', '-f', 'raw', hd_path[1], '10k')
+
+        hd0_opts = {'driver': 'file', 'node-name': 'hd0-file', 'filename':  hd_path[0] }
+        hd1_opts = {'driver': 'file', 'node-name': 'hd1-file', 'filename':  hd_path[1] }
+
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd1_opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Add a raw format layer that uses hd0-file as its protocol layer
+        opts = {'driver': 'raw', 'node-name': 'hd', 'file': 'hd0-file'}
+
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Fill the image with data
+        self.run_qemu_io("hd", "read  -P 0 0 10k")
+        self.run_qemu_io("hd", "write -P 0xa0 0 10k")
+
+        # Replace hd0-file with hd1-file and fill it with (different) data
+        self.reopen(opts, {'file': 'hd1-file'})
+        self.run_qemu_io("hd", "read  -P 0 0 10k")
+        self.run_qemu_io("hd", "write -P 0xa1 0 10k")
+
+        # Use hd0-file again and check that it contains the expected data
+        self.reopen(opts, {'file': 'hd0-file'})
+        self.run_qemu_io("hd", "read  -P 0xa0 0 10k")
+
+        # And finally do the same with hd1-file
+        self.reopen(opts, {'file': 'hd1-file'})
+        self.run_qemu_io("hd", "read  -P 0xa1 0 10k")
+
+    # Insert (and remove) a throttle filter
+    def test_insert_throttle_filter(self):
+        # Add an image to the VM
+        hd0_opts = hd_opts(0)
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Create a throttle-group object
+        opts = { 'qom-type': 'throttle-group', 'id': 'group0',
+                 'limits': { 'iops-total': 1000 } }
+        result = self.vm.qmp('object-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Add a throttle filter with the group that we just created.
+        # The filter is not used by anyone yet
+        opts = { 'driver': 'throttle', 'node-name': 'throttle0',
+                 'throttle-group': 'group0', 'file': 'hd0-file' }
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Insert the throttle filter between hd0 and hd0-file
+        self.reopen(hd0_opts, {'file': 'throttle0'})
+
+        # Remove the throttle filter from hd0
+        self.reopen(hd0_opts, {'file': 'hd0-file'})
+
+    # Insert (and remove) a compress filter
+    def test_insert_compress_filter(self):
+        # Add an image to the VM: hd (raw) -> hd0 (qcow2) -> hd0-file (file)
+        opts = {'driver': 'raw', 'node-name': 'hd', 'file': hd_opts(0)}
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Add a 'compress' filter
+        filter_opts = {'driver': 'compress',
+                       'node-name': 'compress0',
+                       'file': 'hd0'}
+        result = self.vm.qmp('blockdev-add', conv_keys = False, **filter_opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Unmap the beginning of the image (we cannot write compressed
+        # data to an allocated cluster)
+        self.run_qemu_io("hd", "write -z -u 0 128k")
+
+        # Write data to the first cluster
+        self.run_qemu_io("hd", "write -P 0xa0 0 64k")
+
+        # Insert the filter then write to the second cluster
+        # hd -> compress0 -> hd0 -> hd0-file
+        self.reopen(opts, {'file': 'compress0'})
+        self.run_qemu_io("hd", "write -P 0xa1 64k 64k")
+
+        # Remove the filter then write to the third cluster
+        # hd -> hd0 -> hd0-file
+        self.reopen(opts, {'file': 'hd0'})
+        self.run_qemu_io("hd", "write -P 0xa2 128k 64k")
+
+        # Verify the data that we just wrote
+        self.run_qemu_io("hd", "read -P 0xa0    0 64k")
+        self.run_qemu_io("hd", "read -P 0xa1  64k 64k")
+        self.run_qemu_io("hd", "read -P 0xa2 128k 64k")
+
+        self.vm.shutdown()
+
+        # Check the first byte of the first three L2 entries and verify that
+        # the second one is compressed (0x40) while the others are not (0x80)
+        iotests.qemu_io_log('-f', 'raw', '-c', 'read -P 0x80 0x40000 1',
+                                         '-c', 'read -P 0x40 0x40008 1',
+                                         '-c', 'read -P 0x80 0x40010 1', hd_path[0])
+
     # Misc reopen tests with different block drivers
     @iotests.skip_if_unsupported(['quorum', 'throttle'])
     def test_misc_drivers(self):
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 99c12f4f98..daf1e51922 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -10,8 +10,15 @@
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-...............
+....read 1/1 bytes at offset 262144
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262152
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262160
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+..............
 ----------------------------------------------------------------------
-Ran 21 tests
+Ran 24 tests
 
 OK
-- 
2.29.2


