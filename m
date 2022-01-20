Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACD9495630
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:58:26 +0100 (CET)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfRp-0005XP-G2
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAaBf-0002iG-T8; Thu, 20 Jan 2022 11:21:25 -0500
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:22990 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAaBd-0005rq-8P; Thu, 20 Jan 2022 11:21:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJLQOELl0S46b1qJnbOwLDwpbT0HSRIdrLSMJG96DCxziDahhkXUlQANqt570d4wru8mtHszd27QZ1hZLliBZn82u+Tdx6XYGL/M8C31xKByzc9Wti/gRP682AS1ztCfobdCpDIx22ocMIxOCoKWNjOZwl96RExmcsBqZs9TIC6NUUdAkZDculy2sCRc5oKw7QWx4f8DfxfmMjIzQ862uqNBShfn2+DeQ6Pe4eFZkDBOGwb/2sRc3RXcNKo557AMOiBf1fezrl3LmhyLUfG31QAr2mahobjiL9P7OJmhg6ZvTvvPadohO2XvxvSGus+fll0mxQ9zxcadZVhwDA7PBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4yFBWYA2eBiw8TMf4ht5LiCmJD4yEqKq27odNNN+k4=;
 b=JHnpV4CNhMxM7MzvOromCaj0TJmNSBYma9p6tjVdtA72cneiLFFVwvJsDee0UfcGxGNUMD/sOl9kO3YFxqcvW13giahQ+lJg6aBwyiL+wzdIN/LgwiQMDSLOhEib0j5EbLz1GTsTaHEZ7qsSeJjFrlvgWJ37ba9r/5Rw1g9ND+RiLviYY9POMtllTbi/iZP0tWx4I1QXW4kZy1hd6ZFzksfgR0hoXvI6a3zqk8TVHFAwC/uj7tRM28oxapo03+gigIjrV8lp472mY8+/vWFDFe4zd/9Vw/PNFQrg4/W9oO+ZSY/dzjktNRr1oqVvw7bFSAVXAhZ/s0l7nwK7JAzX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4yFBWYA2eBiw8TMf4ht5LiCmJD4yEqKq27odNNN+k4=;
 b=s1cong/xJZ+TqDh0I/tbWWhvaD1OSnTNez9CxK86dKiNipE+itk+UZ7KpfBfzCvtmBPbfcQ3+BWBI+3upP3pC6KVPtoPZkyEzERiJ0E7nkZ3b5zcXhfYu9y6UUlmBBiQvXF5bv1F8wD07p842NYt7jszzofBLgQu7yqeM7yJYzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by VE1PR08MB4942.eurprd08.prod.outlook.com (2603:10a6:803:10f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 16:21:03 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::f043:6356:ee64:6cc6%6]) with mapi id 15.20.4888.013; Thu, 20 Jan 2022
 16:21:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 2/2] iotests: add qcow2-keep-dirty
Date: Thu, 20 Jan 2022 17:20:43 +0100
Message-Id: <20220120162043.2693196-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120162043.2693196-1-vsementsov@virtuozzo.com>
References: <20220120162043.2693196-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0118.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::23) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03c24bb8-6c0f-49da-070f-08d9dc30da02
X-MS-TrafficTypeDiagnostic: VE1PR08MB4942:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4942803CDB4A3E7A539578ABC15A9@VE1PR08MB4942.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VsxuNC0H8mzSuYayQ7QdOZzhyAsZviav5dQbYU6DKrdHJ4WQjmi4wEzkQS771McF/zsiBRUthAlFMoA9p1ShNolIkOVSQCOiVMfikEz3vLnhvFQSj3brDN7fXhIAcNz0wtO1I+NrSvD3h9mJ9N4JT5Yn+drZZDUhVZPmAhgva9IDsRfx4pxZg0eWuwkHJiaCeBCrL/93shp7i5DR4bmrhC2oqiZlSbD9ogr9yZR5kJERvhvGE9QD5OP5WzJQIZ/qSnVNwDOmuxHu5STzKEjXEQiSs3I86FSylQcBONkJy5vMFyvYL7kKuoPkJXW9Hyb1D2aVphPKzYZSZHtKzg+FAnP+pOXn7pMkNlKKnvvt3I3Fi4V5RVTHmlMY3VDRtHY1jahqKdLhEHMPusk9eTZoHmgt9QsnHGChHwD5NQNKMftawOJgIyylE5BRah+OIwDdc2sUnyElZXwoAcZw6LQL3YwCfnJUb9eTMnNLQWlYVn2oY36eoHe/FrAaQIVrR8KAGUnhuDyfTz3bXHMkYTlt4o7YpRSeVVDE6i4PdNsRHCJ0O/b6fHQW/yxawOMeaZ6bE9IJjI3DyV+O/V2kBjDVe5mnWVK13Ph75pdQNVnnIa8LvQeUkZY0jUw57epDB093++R8mr84oHPXHgtwUI3wbdnnhaz/xpMsn9zpVaXwI1xtMR0cn/bsvwGfcw7dR9ieNWNGNDaSpCZEhx4e3ZjzTw61H2nisrwIH3tLc9w2R8R9yI4TOe/NTC690N08SJ4F8FCtcoc/QmdMXpd+5mhfVK7a/mw9jwxjm4hjllesxM4gcqRqqAUV4fEmiAWLrIXdJitKzVQEBeCwVPtYOgDSHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(38100700002)(508600001)(8936002)(6506007)(1076003)(5660300002)(86362001)(6666004)(83380400001)(26005)(66946007)(2906002)(186003)(66476007)(66556008)(107886003)(6512007)(8676002)(38350700002)(4326008)(6916009)(52116002)(36756003)(6486002)(316002)(2004002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WSe53JzVG0coDsCJe/i5i8XMtE0ITiN7Mkkb+SnED14TInOkJ+Aix3hbrFjt?=
 =?us-ascii?Q?kPA06Yr1NloaQve2IABB435WyAL+zHYlpsFQJhSX9TFPltCn/6oE35N+hHza?=
 =?us-ascii?Q?JB8OAo6kzJd0jj+s7EK/XfW3WiXNt6x/LnLUhBuy5NeYP538hpT/iZB7iPI0?=
 =?us-ascii?Q?RGuH9zaZHId/Shu9GqX1IaYUyLn7X2m4LJqgNt+Y04AzCqGDErYSje3Y5EbW?=
 =?us-ascii?Q?gDk1nPDo4eUrEYcNuRUYKdD9CBaZc2OGBMRMN4Bok2glQy5Uy/NtvtX6mjop?=
 =?us-ascii?Q?HMfFb3bdtYnVHfU1rmlSrcZVaJ0AvipXIJAO/d5hTmNhhfzajxD0Hutmie4Q?=
 =?us-ascii?Q?+HGxiOVIwSaroDq454+vPijjbTz7N48LrXSWbGwIkY+3rU2EwjvNaOjp9aa8?=
 =?us-ascii?Q?cg/hw42ujTdohHCeIW5Fb/b+Ufx+WJRS6gplxfcYsSbodljD/XAjEVtkxrGg?=
 =?us-ascii?Q?oTKOnZf6cu9xhdhkX1Tv1ELblZxiPPiXDdnss3vNR2BRGt2F8CE4B8ybd+k9?=
 =?us-ascii?Q?Mgw7st3i6ODRFcy6lMEgC09R8FwttVi0P5QPriQcwdxlB2WA9mmcUFiN/CAE?=
 =?us-ascii?Q?B7mfe8oB2Q008YIq2mPj+Sk43FUbKEes9kQHIcIezNYQ9+wnFpfaGAeZ8nBv?=
 =?us-ascii?Q?iUIsWIgdeN5kYPvS7Ldr2qXu9UBv6G2VWMzBlcKPYXUFks4K4BV4VsZv4dF/?=
 =?us-ascii?Q?gTktazJIHmxFQS7zQZKEH5voBahgX+x7/jtUDLBEaNSxMoOAaW5Ja4pXdGO6?=
 =?us-ascii?Q?rii2lBP78JNVVksHD8OKusJGzePVyQWJL4ib/w39o1G8y5g0r4XqhqmksVVk?=
 =?us-ascii?Q?zREf5BdrokMIAzKz4kAXdb+lUMhTFLOj+qOxgeQO7Q+mhgw+kjFLPiepavTD?=
 =?us-ascii?Q?ZhXCteN1JfCF+F3mxrJuInfvCWpvtg8wYmJTt8uZwUjU4+my6i3hvkpuXjWB?=
 =?us-ascii?Q?4aY1aHepMzE9n2E7DgaWJds/XbbQurKLHrV9QWo77GqlZH4tfZkmqcVAkQqi?=
 =?us-ascii?Q?rhqrliC47JjJ7ypu5U0ovm3FDJ+49FDI6ylenJcdDVgQ40TpvLUrj0hlJTgD?=
 =?us-ascii?Q?FaemlYcCiHVttFS4HZpM/eXKcIwjA+QjRlu/Cz6B50EAl45juAy9/LUQYrvv?=
 =?us-ascii?Q?4ymAdeVDNLsseFm6HB+b6Z7Ck+gpzTXQF2zsbxxBKA5/86itdZ4l3Xnnoxaa?=
 =?us-ascii?Q?FJ5zn+uQi/QT1G6kYVKuhmC29U21aBB+qXpcOGYlgbi6Qk+WEKR/VOX5BLQN?=
 =?us-ascii?Q?Lbpyr36nXR8QJmq7r8OgtyTeA0019+w8QjUNsKG9z5qaPXUt+FOu9wrBB5OC?=
 =?us-ascii?Q?a8OflnMdymPespD3Hnnb1hv4vcwNBEtKwUI9SrHJjnl6awfyjm5x7HgOzqF8?=
 =?us-ascii?Q?D6SYVNdA8ISPvVQrqySwr/fEyaeEiO9ubbBMCvOIUMQ2T/QhHTuqC3V8KRFJ?=
 =?us-ascii?Q?e9KY5pc7gpeOelunO6s5RAF7ibcmSZofwxJ4uS03eDe9Wzato3akhxnI4JWA?=
 =?us-ascii?Q?1YWuS0o7RYzwYmKDujn27Nvf5ZTuI8IY4O9Ba/4eDV1A/wXhOXX2Zmq/vZFk?=
 =?us-ascii?Q?jc7va/SDe+rdWtixB5s+Phu4BAg1Ie+Gbgtiz/eggsFiVUVOgciqfeoF6GZO?=
 =?us-ascii?Q?8ZM9IIsX3ygfeIGUXQ2muyLAYVlZBJVHeLvjEYsGKrDjP2XuB9cBu71lb6Ps?=
 =?us-ascii?Q?RQLlmLXG+uXGooZE2ExBjC6qrGQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c24bb8-6c0f-49da-070f-08d9dc30da02
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 16:21:03.2182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZQq30AJEQo7uteAUgr8WR53HiojCj5b15DSH14/v/LT3H4fDJR+fT1BUqrSOi/xpydX6FUc6qJJscYNvHfRPik0lDKCmedS5OlmDt6TMfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4942
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Test new qcow2 open option: keep-dirty.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/qcow2-keep-dirty     | 104 ++++++++++++++++++
 tests/qemu-iotests/tests/qcow2-keep-dirty.out |  34 ++++++
 2 files changed, 138 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qcow2-keep-dirty
 create mode 100644 tests/qemu-iotests/tests/qcow2-keep-dirty.out

diff --git a/tests/qemu-iotests/tests/qcow2-keep-dirty b/tests/qemu-iotests/tests/qcow2-keep-dirty
new file mode 100755
index 0000000000..101a82bd28
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-keep-dirty
@@ -0,0 +1,104 @@
+#!/usr/bin/env bash
+# group: rw quick
+#
+# Test qcow2 keep-dirty option
+#
+# Copyright (c) 2022 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+# creator
+owner=vsementsov@virtuozzo.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ../common.rc
+. ../common.filter
+. ../common.qemu
+
+_supported_fmt qcow2
+_supported_proto file
+_supported_os Linux
+# This test does not make much sense with external data files
+_unsupported_imgopts data_file
+
+check_dirty_bit() {
+    $QEMU_IMG info --output=json "$TEST_IMG" | grep 'dirty-flag'
+}
+
+set_dirty_bit() {
+    echo Set dirty bit
+    $PYTHON ../qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
+    check_dirty_bit
+}
+
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+keep_dirty_opts="driver=qcow2,keep-dirty=true,file.filename=$TEST_IMG"
+
+size=10M
+
+_make_test_img $size
+
+echo Check that keep-dirty not allowed without lazy refcounts
+$QEMU_IO -c 'quit' --image-opts "$keep_dirty_opts"
+
+_make_test_img -o "lazy_refcounts=on" $size
+
+echo
+echo Check that keep-dirty not allowed without dirty bit
+$QEMU_IO -c 'quit' --image-opts "$keep_dirty_opts"
+
+echo
+echo Check that usual access clears dirty bit
+set_dirty_bit
+$QEMU_IO -c 'quit' "$TEST_IMG"
+check_dirty_bit
+
+echo
+echo Check keep-dirty
+set_dirty_bit
+$QEMU_IO -c 'quit' --image-opts "$keep_dirty_opts"
+check_dirty_bit
+
+echo
+echo Check that usual qemu-img check clears dirty bit
+set_dirty_bit
+$QEMU_IMG check -r all "$TEST_IMG"
+check_dirty_bit
+
+echo
+echo Test qemu-img check with keep-dirty
+set_dirty_bit
+# also set corrupt bit
+$PYTHON ../qcow2.py "$TEST_IMG" set-feature-bit incompatible 1
+$PYTHON ../qcow2.py "$TEST_IMG" dump-header | grep incompatible
+$QEMU_IMG check -r all --image-opts "$keep_dirty_opts"
+$PYTHON ../qcow2.py "$TEST_IMG" dump-header | grep incompatible
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/qcow2-keep-dirty.out b/tests/qemu-iotests/tests/qcow2-keep-dirty.out
new file mode 100644
index 0000000000..4d2bf40521
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-keep-dirty.out
@@ -0,0 +1,34 @@
+QA output created by qcow2-keep-dirty
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=10485760
+Check that keep-dirty not allowed without lazy refcounts
+qemu-io: can't open: keep-dirty requires lazy refcounts
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=10485760
+
+Check that keep-dirty not allowed without dirty bit
+qemu-io: can't open: keep-dirty behaviour is requested but image is not dirty
+
+Check that usual access clears dirty bit
+Set dirty bit
+    "dirty-flag": true
+    "dirty-flag": false
+
+Check keep-dirty
+Set dirty bit
+    "dirty-flag": true
+    "dirty-flag": true
+
+Check that usual qemu-img check clears dirty bit
+Set dirty bit
+    "dirty-flag": true
+No errors were found on the image.
+Image end offset: 262144
+    "dirty-flag": false
+
+Test qemu-img check with keep-dirty
+Set dirty bit
+    "dirty-flag": true
+incompatible_features     [0, 1]
+No errors were found on the image.
+Image end offset: 262144
+incompatible_features     [0]
+*** done
-- 
2.31.1


