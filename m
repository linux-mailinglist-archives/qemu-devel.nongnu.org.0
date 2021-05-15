Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80028381933
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:54:17 +0200 (CEST)
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhukC-00049G-2p
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhueC-0007Pn-AU; Sat, 15 May 2021 09:48:04 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:8323 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue4-0003EQ-Ke; Sat, 15 May 2021 09:48:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjOzx3XNaq0UJU5GhfZqFgz/+EaTF4t2pk31oe9HcstZN6/bpp3J3zpxnucLXWslxvz9Hyjgh2QzlFVn0i5e0muUf+yBSzCtnJR8oRYLf0n8w3CdR2zH4KqF8pmXPgV0tmW42Zc+1jgrZ/1KKepJDRv504KFnJZJzW1r0lrRZGdtl1O7YprYd+XNjmKJgAkhj7AIOYR3KCLiXzLHeWy8x6d2cFaxnsGIB6DIj+iI3YvzPRN2WdLj5KcxRKlQRyE1CUmAx7Lood9jsuPTrnCRp72PaaA53aJjank9k9zjDbERVq/4O1OdecKvCfjUe/i8iOatzHzNb31pmsk9mITWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEnJzjzH/KUogikDqvdpLaU0odwNJp4gwCca0ins2BY=;
 b=kljqGcV1mFt5FmJ+I8N1+kJCjF79HYbsPrd6vXec6ots8daf7Z4L4FTAsNzbytF+EnqeR4185/FLoMnmH07juaFBHTyNYtqL/wHAgP3zBBjVg5y8IEEnE5li+AdUqq2XUXmEAdqZeJZbvJ8gwNU6TXdDlkpfDQIQCT+whx1h0eO8AJRKcd7oAh2WvUMqlwvaqKMIo6MA8oqVAZTjC2GVVlLv8ul7LzmnCOSKug2iFm1IoN5lBkNy5r+QXbWbHqYTJfRoMuUFO+i/ZRdn5tmex/3ipiHfx9ZLDZL3LxgnyxeHtx8/87Jtodv8Bxi6jkolHa6DYRxNN0Zl/iEPm/eoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEnJzjzH/KUogikDqvdpLaU0odwNJp4gwCca0ins2BY=;
 b=kPRx+my8GJl+CvRSQQKm6z6DirmCmTLeOJiE032ReVWkM5HDIwbPS5JKEh4aga8zNAHFU2JF/65JL6XxezE4CBUaBtU9tdRPQ+KPY6MvTpI4xjIEKYBfc6t76UQiU/9fOKAx1LuWNN76fcHO4KsF3rHNbYxTTS1zZgVp+PFt7Js=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 9/9] iotests: Test replacing files with x-blockdev-reopen
Date: Sat, 15 May 2021 16:47:05 +0300
Message-Id: <20210515134705.433604-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cad68e09-aa6f-4fc5-eb79-08d917a7fcf6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5206C9A438D05AEAC3FBACD8C12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2Plj1j5hY0nUYAi31ye5aKMmOV3ngzTsOB2hmJjNQpBesxAHRFqPR105ZOmUcWk9azyrf5lnEYQpBCAZledF+UP8cHdBc6UyvjslwigB5YJiH4CY0U9DiG/owlIEonlCq+HrnanYBkFCVN4ITVmmuiB4SbFnBPIHc9Q2RbQMFc1DKwNFvmNKXBml1N3qW5ktAZ4O/uwVmtBNNxRZuvpuKBnsCzeiIam2hByvH/u4CPPFwjPAOAtdriRTpomdBfyuCrRdiuf7BfSPxlaMorgqgV4ojtAYKtJDKFQJz4rXN+x4RwDqMhw5xfEWwueyJmo7hwBhkhr/nT9Pzx7CJTt+moaYe3VFZ9yKtPfZJshE32xZaywyna2QSecw+CrPSs7LxL8xLIhCBR7rUBzEsqGeOnJFMSKgDecmtoLTZ7d6edRVPG7N2dqxHzhnIYSAYPN/6BoPgmGDPgOtOFUcnOoGdKKmAVWkGYonDbSBil7huH8FJWirIjvGOfV6vxKQnMC/luBdP9hMWVTpNLOjXF83ediCimCMYa8X5b1s9QvYBbK88yRUv0fCsUso0b57OE11K5/iSC6orDcxJ15wEZITdnVRH/B1dKFlHqS1pOFElgng71i8+CIta6i/niRmOINBXNgZQ6LvpkvgG0W9aUJmHFFOreIAbl2qL0UDuoqHiXAl8LLXh7aCFaAEX/EsFh2dn/1/1yG5YMMtnOf1FPsrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?09iDfSfmaCXjKIsA0qY7o/Xw+teZzXzrNOmIpW/+Gr1LYFuqq7zDLZMxyL0w?=
 =?us-ascii?Q?NWFNYY5H4CTlXAZeJmEo1FzIIfmVyJkq/gSYGMVg3Fa6/3Wm33qau+qinXJM?=
 =?us-ascii?Q?pfxN9PGmNZq/cNwsl4IXNt/cHYOwJ5lQqtC8VIkfO8+PlpcAHbIzsyPQLJXV?=
 =?us-ascii?Q?XHofmVH1gNakpYOulbHebTV8cB2gzSTafEvWiBRvL9FakP/4jsbYjrVcqo/a?=
 =?us-ascii?Q?mMnDJatjGuL/6mSOKTJsJo1HPWFChOUCxuooPQsfh1X5X+ZD7v4P/yt9s/ZL?=
 =?us-ascii?Q?9RH/9kBSj28ckvdaW2o5F0QMGSed5uVeStk+aMB+yMlxsRrOOfE3TRtmdmfq?=
 =?us-ascii?Q?2YOOdGt2njw7bjd3yFgslGXGifmoIpBYXkbYOk/hnXt10wl3KBzRg4wGE3eo?=
 =?us-ascii?Q?XzQAg+29puK0HoCykbom5NbuqN2g3S8ibQlM8hWOrOJEptIGkuWjQyh7155s?=
 =?us-ascii?Q?jE3ySiRNRixwlQWJjwG1aJyv54KpwmugrixNI1ThxQClPmWP7vsW1QlV6bur?=
 =?us-ascii?Q?eNCnwVkoQ2q8FVqWLHcwKeWN9vSl7tW+53A/vA1PIoK+/0ekkjpEObZO/LSf?=
 =?us-ascii?Q?WThXQ86i2nPbL+6IiHJeLFMvEggxa/o7jOT2m51+5x/xXM4wrJNZpSLdON7I?=
 =?us-ascii?Q?Rl7TkkS2bcCsWO+f1oPbZCATpMalBKzaadloOD7FBL/bVY0WmxnJ4muEZm+T?=
 =?us-ascii?Q?mDLNXUe3l5aHUYKmz/11eX2mqqR6HpDi5cEgA+UfqmoqO+oxvI+zPFp4eDrO?=
 =?us-ascii?Q?+4KgNTUU83kwYwCtQL/Vxv9lil+P8ZcA9TarhiNpaSxJCpy0FArkgPvGfJbH?=
 =?us-ascii?Q?5ddZUT7FazZ7Vrf6j9Xgk6EorKykTpQvRyZQ0eEEk6oC0bf5vOb9RLO5iByh?=
 =?us-ascii?Q?N0NGrsr+Yal2JBz02lmii9LIt5CGucGr2PzIwhAvnqWS5JZaUNzZUfLg62Ey?=
 =?us-ascii?Q?BfixBtDK6kLa72NaikbS25yASbrzAKBaCyswup27ZcAyXPr+CxTxqEuDdcsZ?=
 =?us-ascii?Q?zz9gdhoq1lo+fhk9d+MUQL1a/mscP3WurxAuVensKHIOVwbJX6FxL17BgVZ/?=
 =?us-ascii?Q?GXcE4/ByaqZnCcaZi5Oz4NH/dRDw8jcaG0Jd7mqkmqILBUMlUtvrKMWOuGUx?=
 =?us-ascii?Q?upvGKKJosgksYmCqUnhV/8h9IjcaHX9NU4M3DJ7WVjEhXDDGCgZunFGpC2+u?=
 =?us-ascii?Q?vgZGYNN/8eMOgAQHrV0WKrJYTuOzwxo1+vCJ1vy2ikenSHNc8FOpH0yZWNUY?=
 =?us-ascii?Q?yLn+CR4EBo9YDnrNuAKZ0QWDyK1VDTCh4euQXISZel2dq+j2byQgawFUaJYE?=
 =?us-ascii?Q?xX+8UOcy0/nOtZltTkaWGnv0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad68e09-aa6f-4fc5-eb79-08d917a7fcf6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:32.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vDG6/qHi80bR5fbMXhER+5+OV2luCOI2VNum85eu/6kgE1DzxMatvahx5iAzKyLbuKP3cWd11+8RZqrXiKyoRgx3vKIaz1UxoMPoyDn0wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.7.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
index 87b59666f5..1623544a6a 100755
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
index 4b33dcaf5c..6ea1b2798f 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -10,8 +10,15 @@
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-.....................
+read 1/1 bytes at offset 262144
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262152
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1/1 bytes at offset 262160
+1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+........................
 ----------------------------------------------------------------------
-Ran 21 tests
+Ran 24 tests
 
 OK
-- 
2.29.2


