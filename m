Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC43F59FF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:45:16 +0200 (CEST)
Received: from localhost ([::1]:37478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS3W-0005WI-UU
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyU-0003HH-7r; Tue, 24 Aug 2021 04:40:02 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:13025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyS-0007eD-72; Tue, 24 Aug 2021 04:40:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSZuXanLeoA4nX1D/YLIKWd+sntCAEXuXx9Axc9yR+NZZ37YxA3A02eflJDh84UYTpIgZYh0WhP9xRWYjizbrInX4xaGgIlK5Fj3kEWeWClp/0VCr/FvyUxEADYiOrT2buCKsdK426JmgH9fueWdmyeb4/uSA+nKhVpkXMDfF6wSnvwHxUX7eDRF38GLFkigdPpwrVprqKh4UKBHrNlY31cUGjAd5icavKh9K3GR4VvDzcnffkC4PlgIFpWqp6fgmYBsf1T7lSJjs4qB0YNsquFq5+ZmsUR276ytrya3Fc4wD30duUm2uj/jU3zh5cCcOP3Ud9mpzhsXl6QlZ4fXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=NyovyubJdV5TSvcQDBAoHpZTc6YQt8p34v9Mh+AlBmr1qAHUSfHQUukO1IPHj1HK0vNvt9EGJpxYATICMMz6TI5XBHgjZ783l5gLbh8GCbgk8A6AtKaf/L+omyFwkdEZ9dx3TuyIrH/j9R/wZKUuNpmv2GyNViAK9mUIdRXQFVrqLqNS0rP86WcTa5WDtiL6G5UaDVfXnS6VdcPBAugBtSAbtqjXbh6eRwOUH/MDzhI8FdTHWiryShtyJor75P067V7qnSCcGrpycwfvC+19CLDk+7/rnMVup1xRgDFJCBOS3nTTo4CsKOsqig1ELnQ2AvJDC8x0fl0c5Hy0g0nMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=ByV1zO2IWxfyvklFDpCagHCw3zL8lOZaaLOQ8XzJylue6iXK3vF24w63tQIRdSGI7Ky9TcMqEr7E1kV6DjTbJPYxx5LNSFpRUWA2vdfTsOuQLjwPCi1wTnkPEPXPK82GbHM3KiQq4Xiw+DI9eMvui8G2j3E56YZT09NWEv0El74=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 08:39:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 26/34] iotests/222: fix pylint and mypy complains
Date: Tue, 24 Aug 2021 11:38:48 +0300
Message-Id: <20210824083856.17408-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 476026ff-5dab-42af-6f89-08d966dabe97
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4088B2772390179EA96ADD81C1C59@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VV1q9LhyxmsYM9m06zaKdvC+N3aHQ1jkvKbeWnd9118Zc6ycSiFqapL7TlOo0HsdFbkUrETEcKS23IXVkYzS2sHWU4Bljg9JoeGoSi9odpKwoXIhdeA4FEfHvJICOHksppYD4I1crmGwltT5oIy2JkqV0Wd7cYnRe4xaPtdVA5G83ywNqDys7mdCiItVAz00VK0dwal+We0KA2+Wke/ZrjtoVFxo6CkNwzZeY9q+LRyegZzM4w2SStqpybFNQrhlZ2gH2Sz8QBLxHPBr98yShZ1NVPiYuhNLeF/z8sHDzCNQ7uRNpwDKvbt4Ny61rD5JxyRiWCpIgpkGeaLY89yBbsDqauAUZVlT5UHh4HhhwRJBrxo4VeiKIJwEFYnkhpp/BIFvtwBJqb5/mg8UBH4teDVNdaPOL53hSxl7k1cZeZtHq/zkhdHPV+vordQ97CHmPvRzbk2V5GPKdKKCslLCsm5vEw4Kt8HB1KIy/ZHXJ1ViThS79n2m5Z0V5DfP8HXotwwX67qL/4F8B3iBHEuSKNedR3ZSmWQHf68MIXAKYRzeAM3V6HzxtW3nhB38asjroVfNY/cmasyF3efTMgPLI/vc4JKT3jz4rsbKePtCxHIyfMqA1YJ++p/QqNVnp5WbdxM1a9akMj0pjQPBpGfjQZRi7HESmN0x1/degpaFZ6GelftT8HbRpNrvZFuT4fI+CMP9u1M7GZ5AGwY1kEDXNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(396003)(136003)(346002)(1076003)(7416002)(83380400001)(4326008)(956004)(6486002)(38100700002)(38350700002)(8676002)(6512007)(2906002)(478600001)(186003)(66556008)(66476007)(6666004)(6506007)(52116002)(26005)(8936002)(36756003)(2616005)(86362001)(6916009)(316002)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7L0Rj+9/jFZBxvlymdr8SgDuJiWlGRa2WztnhmAYTF5lqgWvEaG169IXUNX5?=
 =?us-ascii?Q?tSdvwffRZ3NRHID1SWFs+H77epDZiicWbu9hUhJeEWGWOfsAxL518iwAze4p?=
 =?us-ascii?Q?GnD2myiHct+puWn3l0bffnfwPlmTYPJwVHi7nZ4D6NCj2iupvD4MW6/fqdxn?=
 =?us-ascii?Q?naacPMkHY6aygWkh0w1OnesDJ2MXKshrdEGSCs5HhFUCnJCRiBMppH81SsDN?=
 =?us-ascii?Q?L4O/EiZnJeLF5waq7v1GFmmMPjwnekZ8zooKqYzNKCWgB75FkM26dThs0YmX?=
 =?us-ascii?Q?xjIAYJ5QmOTaqe8wOq9LfK+AwQnwmNOrBnMNRtcEnk+iYwiuBjWM4sZyHbZv?=
 =?us-ascii?Q?vdY9JxrUlt3qKtVs2QBcSB4mWwVFND3fUJ8GJVsBxfUwHQY8zcHRlckDY3iR?=
 =?us-ascii?Q?AyM4c3hO/5n4b92QjVph09g6Fox0FXH0WFeL+5Aklx5eoPRho63ssu1nU0Ps?=
 =?us-ascii?Q?ARS9yfRyoJrUc4OTMi9K0sRMXmUqptZXHSDfn4QJ3jx61M3ao9Xio06FQhfT?=
 =?us-ascii?Q?gisQcNR9BfM6gaiCX/UWqdBe8G6aF3hMe5FLOg5mPlkzDGENF+LjfYqnMUXx?=
 =?us-ascii?Q?slep4de6ZXUUYT0uESYFLt6i4c6bDnAyKVjjzkhFSFib5Q537NeimPkEleN6?=
 =?us-ascii?Q?8/v2hWvBpgXKlgvhFe66YGovScLIPkpa219cOM2uiPgcO4itvP3wpGtlAoSp?=
 =?us-ascii?Q?2YmiqcE1U8+kPptK9DnrUFKYxn6RjDcX9WLjIoUcPq0/T+E4lWwEsytWgOI1?=
 =?us-ascii?Q?ulYdxaKDxzSUU3PfU+PntUcOUjofNik4Hdi1hBKNPXtjZpPAJuiJDg8UT7LA?=
 =?us-ascii?Q?KBbaoDCcxRfofxCNOgUoRDXQZwF4wYtQKyuuwA/A/+4V5I9Y9g1LiSxR5zk8?=
 =?us-ascii?Q?NCC47w7A438jg7F5nnsgxQ1oj9SzJVT+CsMhMgcjMUqP/U+2zHw7KFIhphro?=
 =?us-ascii?Q?CPEKUBL5n8zRpQWo3bgthYffbd2AK/YOi/WkZ4cwOBbL6w1Kr0WBTT/MV1Nq?=
 =?us-ascii?Q?mp0Jr0kTTUGuHwfnW4kttuj7PeWzZPP615sncIBQeWqG5AQajfhXrWjaCNni?=
 =?us-ascii?Q?Uv1+BILCZhbCG6v/XFTTQsuDsxZU1M2d/byUBb7op9aFMdmW1eDK/V1qYIAR?=
 =?us-ascii?Q?FkUSfI7itk9a1O2iEmzG9xFjqBGh1zV1tBPC6zGPQJ1TQvQjq0xhpA3kZH94?=
 =?us-ascii?Q?sS6Q1vhdeea/D0arKQ0wA4ryE6dMBFZjzf3Y9ezzpiv6k0WjAu6Gno2SN7Pa?=
 =?us-ascii?Q?dN7WCfLJJeMipMgVkSg0ENkVE4A9xbSyIVDq5t6HC1uAIttJiotJRviR7Sod?=
 =?us-ascii?Q?zJ74U5fqpbkXnAiRGmeXLVa5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476026ff-5dab-42af-6f89-08d966dabe97
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:53.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrTIn19AxozzCzB7Y8Pmw6O3SgFyqJf5xJGp9FpThxSbY56fnhGw9FlKo9cTwqHK1ybV9tQDB/6enPwnnzkoyi4fx4bBtXksRtuiQjfwAj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


