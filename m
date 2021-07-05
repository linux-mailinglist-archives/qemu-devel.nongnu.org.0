Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D93BBA18
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:21:31 +0200 (CEST)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KnC-0003n2-JT
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiK-0002nu-LH; Mon, 05 Jul 2021 05:16:28 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:40000 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiH-000816-G6; Mon, 05 Jul 2021 05:16:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY69rnkLZRgTMcbmZcwihquXaL+QgHB9sd8rYiI+IlKCVHBKeJJoflCZzamdmYLcSaCJ6dhVUq/UhzWZz/If/B+rk499ri2Cp7unZnHd50R985PUeNZd4q5JXiAomYCiMwYQTqIiTwACh7E/lQ/+AvKNrYnQdMqn52mayE39QLGvKtuosraWkpo7hIWNctyC9mZTYAfuq95QnKPT6AcDjCYSVdS7fDyxyRmD6NPJ/ewz4wao98m9rwVN5PvmHL5NwDv5KHG9Bzkrefy7E/NoS1FQVlgorp5m83yJCmSHZTsKFKlhmaZg0BFjdP5O23CLxwdptSv3j+5U7lMBZIIv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEViaYXwoYVjyIxREYsut4N7XUTEfvMMS5oO0h4ET50=;
 b=i4MdICH7fjvzhaLQTK1+VlWYACyighfVJn608LUXHWdxwZZEdkkxKPP2tMJlRLZc8cnTnqL+gvigi974DFwaOrwgHssRz4X8+p7/sSnDbvPxCKxmQWP/JnpZBNK9uhkYUmAjZ0A57M3oj4eMEYzb4PlIHw8eHbDAGXuj4GK5xkgWeS9UG/CaKdXnqJ7dM089TkdgEWKngMXrWQRKF9Q7rW/2+srZll823IFsEE9PPMqe8qjuxPyglNtTxDRW7t6LOgs9A+pRFPxiR9HB0E/ikEuOrg3wJqn/MqzP+kvigX4eOFQJH/1gq1BbQiUrNSPhrvBC+8bR/eKuzsICW4D6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEViaYXwoYVjyIxREYsut4N7XUTEfvMMS5oO0h4ET50=;
 b=bvk9RolOJWn34xbzrXPSWtS/XyIt5K7tKugokwdSChYcjF3VnkvRoFyTzDLKC0CvFjFlaghTEdwtukBl8s6O9rrImQIXjiK3gbUAIJGJqRIAXkC/FjKu5VRn04rXUTwJsBQq9tr+3dcSSr+Ih1QypJlhNeiU3p8OT2ZszKaZJaI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 10/14] iotests: massive use _qcow2_dump_header
Date: Mon,  5 Jul 2021 12:15:45 +0300
Message-Id: <20210705091549.178335-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca4369bd-dcde-4ce9-84be-08d93f958a10
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447004373A40D42AC5AB894FC11C9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ft/wPjh7T13pQ60CvJGjRXtkSOh9YTqhqtRx2SyArqvvRa2O7IApIdCeWVN0yMd42+lqQmkXF51GDmrpWS4HSB4rBeqc3PDnAJsxP0rqFZn0a6D74FWewlhDKeEXUEjl0yVnlZGYTnl7az4zuU1XD/QUj1pCIcO0Q2mM01JgPOsyOpwBsUXlpWBLv6ec/uv7Jxp4C2IHqumiZPAUb+IIWz6O50DvLQmvemZw4/D/2sJm99f+bkIT+EcE9qucjcKuHKwSXfzVaFIi7mz7xHgBzfFfvve+v6REusLq/3CkeiYUJAmB/Vyr3DXBWLGiBOyiQOogUD7Cig1M1et3/2cfof3o2MHT4KXrClacffIVcEeeLYtweXNb47mTHPMazgx5obEtCAKZByJ0VB7cBVkeIUzy9aIrClkcOVSJ+jLt/253ZL/yYQlwc+Ap0jnKcjRThGWT2ieLj3ru2QHN98TKL7UyvZ/HbeTabM5+ij4aBier3f60LpJG1201sGgaeXbBvhqZLoYmrXIhwM1nx7YAObYHyWUCYxdTakYjxdn0ttklSPvXUqRI6El7DCoYtLX4T2n5Y6fCRDVQ3oOQbzXThI8pTSYN1y3EWdQBxbHEkr74HY4Sua4Q+WCCwoU2U5wgVZBQb5GkEG1zOdHC+HvEUJ8FNMnGwGBkbzoi4Ds+06NGVT18qs1ZiqMY27+QmFseDhoFt/Q0OcN3N5Fx3yus7Cn+dJQzHBcEBbcDLjXd0Impj5RfvexARdgGoVgwYoQE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(478600001)(66946007)(66476007)(66556008)(4326008)(956004)(2616005)(83380400001)(6512007)(2906002)(38350700002)(316002)(38100700002)(30864003)(6916009)(6506007)(6486002)(1076003)(26005)(186003)(16526019)(5660300002)(36756003)(52116002)(8936002)(6666004)(86362001)(8676002)(69590400013)(14583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMhZ2P0/+FuhjUet9CXzOwy5QaN9OQltDk9Avt1/4J3opPyE028NX1bYEhvd?=
 =?us-ascii?Q?eVd/O224bKeIR7bB7liZ/zBiW1IqoJ41TNaPHRyIfKStDQ3Fg/nLiTT/SiBo?=
 =?us-ascii?Q?aMKo4CEyJXVu/Uo6BWOC4J8fas5z28HfR6Narr2Wo8ohAJ6ps1yI6rDwi1ig?=
 =?us-ascii?Q?RaRwIPLWWR/3zM6ww3RKUz+euXVa6bV3FSCLItQbW82+jOFi2Ik7dPWWmIGc?=
 =?us-ascii?Q?1eYTXDxAmD1/1drEBs71b8eNW18Ubi80vqCXjUTU9luF3kuaBJeX3IKvk8eW?=
 =?us-ascii?Q?WsQtfDUWAObo6mIRqM/2r6mb4Y7M6ffq8kbvVg2LWW6xsw9R5KITfCQnQ6l6?=
 =?us-ascii?Q?AenQMA75/QBCYDTDBcubhSYddVb7JS+taSS+BBxyghSb3BMZWBQTiXdxGIM9?=
 =?us-ascii?Q?22QqZZr9k/BVhEvk8zQTMUGHSr2n0hiQFdZRITXMt3VwHIWOwVyKWj0VWfu/?=
 =?us-ascii?Q?iYX/v+xlto6QyFWa+EO5Q+eNMyR/HdBrIGBOe58sRcTJiZtt5ZbrkJxuSZvq?=
 =?us-ascii?Q?YbwEWrYhhvinMV1ePEoLV2HZxelNxiTzP8VDRVJe8ptDe9t9q9C8YeYh8Zvo?=
 =?us-ascii?Q?kRd8GWhPuT+kZKjxxT29oTicLZ7t0Rtk6qU/juXeRue4NZsch/TjdnaYWCoi?=
 =?us-ascii?Q?NpHQxNcYkncZfSMP856L5I04fqWCr/d1QiFyEdUp4IjcJND7CxXDZUgtvgD7?=
 =?us-ascii?Q?GVeuFJLVsuLbkPnkoIojH9TriqJFMdPWr6evWwA7h8LPeOW1imZ2TIOWDa9D?=
 =?us-ascii?Q?jm3lmeQ6h0BYg3tMgGqyX0CPoiBkL7eUTH2u+hqRlZmwbKCJb+IF3axoxNRt?=
 =?us-ascii?Q?Gfw3JDV9eT3sSu8smcJzAguw5rWwgeSGUVgGIS/5+UMx+T8wH+o4OtMABIaj?=
 =?us-ascii?Q?RDqzhWwb6hmr60ov5sMjvycYemA6QoGn9d/hHndhVKSphxwikZKfmiPNWhGs?=
 =?us-ascii?Q?moFIXkOkk3QHxRSvWw5j+HaG+jBt35BdW2mL0BTo2YBf3IbsZZv/TDu+M6MM?=
 =?us-ascii?Q?Tv+frx55VKU0WYP6byD64x51e72HUsO+rKa0f4nzRD776w7UlLoKIZqbm0di?=
 =?us-ascii?Q?kfyTXPFARPDt9LLQj52esSGAfTZQFk0VLHWTOjFHTbOYXuq63guBpTJgj4ms?=
 =?us-ascii?Q?U/SU7c9husVjNxNrnkhIaFQhP9DdwPj18LIg/VshS8dHqrOhF7/DvbLcT64n?=
 =?us-ascii?Q?3Bwc1JkeeHSVe0tUuOQr2f55XS4OEDkdsAYqQcyte8P8A1XJ4w1dJjiW0+PT?=
 =?us-ascii?Q?1V0RXYXPl+RMRyxSTYabnWg4vBE7ArIg37uJ68/uIADnJydayZCE7dv6cka5?=
 =?us-ascii?Q?cUOdf5gUssjqtBdlx86nVOyW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4369bd-dcde-4ce9-84be-08d93f958a10
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:15.0751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUW+54evV/F49BVl3BT6gBkev4LdlKdKXxYlF2qFhjGo6o4c/ib5txS0Q3/mo+d8LyuSliig+PjVH0PmivDXpbpPSvhMJP9g8+Nat8+wqLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.20.138;
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

We are going to add filtering in _qcow2_dump_header and want all tests
use it.

The patch is generated by commands:
  cd tests/qemu-iotests
  sed -ie 's/$PYTHON qcow2.py "$TEST_IMG" dump-header\($\| \)/_qcow2_dump_header\1/' ??? tests/*

(the difficulty is to avoid converting dump-header-exts)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/031 |  6 +++---
 tests/qemu-iotests/036 |  6 +++---
 tests/qemu-iotests/039 | 20 ++++++++++----------
 tests/qemu-iotests/060 | 20 ++++++++++----------
 tests/qemu-iotests/061 | 36 ++++++++++++++++++------------------
 tests/qemu-iotests/137 |  2 +-
 tests/qemu-iotests/287 |  8 ++++----
 7 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 58b57a0ef2..648112f796 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -58,21 +58,21 @@ for compat in "compat=0.10" "compat=1.1"; do
     echo
     _make_test_img -o $compat 64M
     $PYTHON qcow2.py "$TEST_IMG" add-header-ext 0x12345678 "This is a test header extension"
-    $PYTHON qcow2.py "$TEST_IMG" dump-header
+    _qcow2_dump_header
     _check_test_img
 
     echo
     echo === Rewrite header with no backing file ===
     echo
     $QEMU_IMG rebase -u -b "" "$TEST_IMG"
-    $PYTHON qcow2.py "$TEST_IMG" dump-header
+    _qcow2_dump_header
     _check_test_img
 
     echo
     echo === Add a backing file and format ===
     echo
     $QEMU_IMG rebase -u -b "/some/backing/file/path" -F host_device "$TEST_IMG"
-    $PYTHON qcow2.py "$TEST_IMG" dump-header
+    _qcow2_dump_header
 done
 
 # success, all done
diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index 5e567012a8..f703605e44 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -58,7 +58,7 @@ $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 63
 
 # Without feature table
 $PYTHON qcow2.py "$TEST_IMG" del-header-ext 0x6803f857
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+_qcow2_dump_header | grep features
 $PYTHON qcow2.py "$TEST_IMG" dump-header-exts
 _img_info
 
@@ -107,7 +107,7 @@ echo === Create image with unknown autoclear feature bit ===
 echo
 _make_test_img 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 63
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+_qcow2_dump_header | grep features
 $PYTHON qcow2.py "$TEST_IMG" dump-header-exts
 
 echo
@@ -115,7 +115,7 @@ echo === Repair image ===
 echo
 _check_test_img -r all
 
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+_qcow2_dump_header | grep features
 $PYTHON qcow2.py "$TEST_IMG" dump-header-exts
 
 # success, all done
diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 12b2c7fa7b..8e783a8380 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -59,7 +59,7 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" $size
 $QEMU_IO -c "write -P 0x5a 0 512" "$TEST_IMG" | _filter_qemu_io
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 echo
@@ -73,7 +73,7 @@ $QEMU_IO -c "write -P 0x5a 0 512" \
     | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 echo
@@ -82,7 +82,7 @@ echo "== Read-only access must still work =="
 $QEMU_IO -r -c "read -P 0x5a 0 512" "$TEST_IMG" | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "== Repairing the image file must succeed =="
@@ -90,7 +90,7 @@ echo "== Repairing the image file must succeed =="
 _check_test_img -r all
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "== Data should still be accessible after repair =="
@@ -108,12 +108,12 @@ $QEMU_IO -c "write -P 0x5a 0 512" \
     | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 $QEMU_IO -c "write 0 512" "$TEST_IMG" | _filter_qemu_io
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "== Creating an image file with lazy_refcounts=off =="
@@ -126,7 +126,7 @@ $QEMU_IO -c "write -P 0x5a 0 512" \
     | _filter_qemu_io
 
 # The dirty bit must not be set since lazy_refcounts=off
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 echo
@@ -141,7 +141,7 @@ $QEMU_IO -c "write 0 512" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IMG commit "$TEST_IMG"
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $PYTHON qcow2.py "$TEST_IMG".base dump-header | grep incompatible_features
 
 _check_test_img
@@ -159,7 +159,7 @@ $QEMU_IO -c "reopen -o lazy-refcounts=on" \
     | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 _make_test_img -o "compat=1.1,lazy_refcounts=on" $size
@@ -171,7 +171,7 @@ $QEMU_IO -c "reopen -o lazy-refcounts=off" \
     | _filter_qemu_io
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index db26c6b246..d1e3204d4e 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -80,13 +80,13 @@ poke_file "$TEST_IMG" "$l1_offset" "\x80\x00\x00\x00\x00\x03\x00\x00"
 _check_test_img
 
 # The corrupt bit should not be set anyway
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Try to write something, thereby forcing the corrupt bit to be set
 $QEMU_IO -c "$OPEN_RW" -c "write -P 0x2a 0 512" | _filter_qemu_io
 
 # The corrupt bit must now be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # This information should be available through qemu-img info
 _img_info --format-specific
@@ -114,19 +114,19 @@ poke_file "$TEST_IMG" "$(($rb_offset+8))" "\x00\x01"
 # Redirect new data cluster onto refcount block
 poke_file "$TEST_IMG" "$l2_offset" "\x80\x00\x00\x00\x00\x02\x00\x00"
 _check_test_img
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $QEMU_IO -c "$OPEN_RW" -c "write -P 0x2a 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Try to fix it
 _check_test_img -r all
 
 # The corrupt bit should be cleared
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Look if it's really really fixed
 $QEMU_IO -c "$OPEN_RW" -c "write -P 0x2a 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "=== Testing cluster data reference into inactive L2 table ==="
@@ -139,13 +139,13 @@ $QEMU_IO -c "$OPEN_RW" -c "write -P 2 0 512" | _filter_qemu_io
 poke_file "$TEST_IMG" "$l2_offset_after_snapshot" \
                       "\x80\x00\x00\x00\x00\x04\x00\x00"
 _check_test_img
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $QEMU_IO -c "$OPEN_RW" -c "write -P 3 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img -r all
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $QEMU_IO -c "$OPEN_RW" -c "write -P 4 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Check data
 $QEMU_IO -c "$OPEN_RO" -c "read -P 4 0 512" | _filter_qemu_io
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index e26d94a0df..a9bfd8dc0b 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -55,9 +55,9 @@ echo "=== Testing version downgrade with zero expansion ==="
 echo
 _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 $QEMU_IO -c "write -z 0 128k" "$TEST_IMG" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0 0 128k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
@@ -68,10 +68,10 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 $QEMU_IO -c "write -z 0 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c "write -z 32M 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c map "$TEST_IMG" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" --image-opts \
           driver=qcow2,file.filename=$TEST_IMG,l2-cache-entry-size=4096
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0 0 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c "read -P 0 32M 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c map "$TEST_IMG" | _filter_qemu_io
@@ -84,9 +84,9 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 _NO_VALGRIND \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0x2a 0 128k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
@@ -96,9 +96,9 @@ echo
 _make_test_img -o "compat=1.1" 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit compatible 42
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 42
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 _check_test_img
 
 echo
@@ -106,9 +106,9 @@ echo "=== Testing version upgrade and resize ==="
 echo
 _make_test_img -o "compat=0.10" 64M
 $QEMU_IO -c "write -P 0x2a 42M 64k" "$TEST_IMG" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=1.1,lazy_refcounts=on,size=128M" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0x2a 42M 64k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
@@ -120,29 +120,29 @@ $QEMU_IO -c "write -P 0x2a 24M 64k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IMG snapshot -c foo "$TEST_IMG"
 $QEMU_IMG resize "$TEST_IMG" 64M &&
     echo "unexpected pass"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG amend -o "compat=1.1,size=128M" "$TEST_IMG" ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG snapshot -c bar "$TEST_IMG"
 $QEMU_IMG resize --shrink "$TEST_IMG" 64M ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG amend -o "compat=0.10,size=32M" "$TEST_IMG" &&
     echo "unexpected pass"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG snapshot -a bar "$TEST_IMG" ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG snapshot -d bar "$TEST_IMG"
 $QEMU_IMG amend -o "compat=0.10,size=32M" "$TEST_IMG" ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 _check_test_img
 
@@ -154,9 +154,9 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 _NO_VALGRIND \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "lazy_refcounts=off" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0x2a 0 128k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
diff --git a/tests/qemu-iotests/137 b/tests/qemu-iotests/137
index 4680d5df3d..52ee135184 100755
--- a/tests/qemu-iotests/137
+++ b/tests/qemu-iotests/137
@@ -140,7 +140,7 @@ $QEMU_IO \
 
 # The dirty bit must not be set
 # (Filter the external data file bit)
-if $PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features \
+if _qcow2_dump_header | grep incompatible_features \
     | grep -q '\<0\>'
 then
     echo 'ERROR: Dirty bit set'
diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index 22ce9ff0e4..6716419da4 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -61,13 +61,13 @@ echo
 echo "=== Testing compression type incompatible bit setting for zlib ==="
 echo
 _make_test_img -o compression_type=zlib 64M
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "=== Testing compression type incompatible bit setting for zstd ==="
 echo
 _make_test_img -o compression_type=zstd 64M
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "=== Testing zlib with incompatible bit set ==="
@@ -75,7 +75,7 @@ echo
 _make_test_img -o compression_type=zlib 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 3
 # to make sure the bit was actually set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
@@ -87,7 +87,7 @@ echo
 _make_test_img -o compression_type=zstd 64M
 $PYTHON qcow2.py "$TEST_IMG" set-header incompatible_features 0
 # to make sure the bit was actually unset
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
-- 
2.29.2


