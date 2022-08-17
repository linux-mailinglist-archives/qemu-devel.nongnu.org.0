Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A75597406
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:20:15 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLmA-0004rI-Cv
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNF-00072M-OG; Wed, 17 Aug 2022 11:54:29 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:6277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNE-0001Kk-1c; Wed, 17 Aug 2022 11:54:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKmrrI6iqS9PF8FVV5D1oK7Bmo9RFaRAHutR+6LpmgVYEiaW+NUT3/EiaF8XvCFPf9fZLu1I3d7FUFRnJxmoqjhDBZCbnnUDELR+w+f5j6MRKhHAHjNZpqIHlhtG//3oxELlRiJrHAHYUDVMaAsJWhFq+tNUD4NSRdWFrQgD6V+N3gyxX7ZL6PCXLnzUrFGhjP71ZIUq4icQSRVQLHwZ1dY0EIhbfNGlcgtbaWtPx12JT4zeDh0viupGDk4VR10Vu6b+QE9F0UV1T2cpzUXiJw3Ken9QZlb6FyhxkTphUZWlSyNK7zNf7gNv4f/a74B9bzZYQyPXgaUrxee7Td2ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk7I4dAzmdN29D9AIJXGJSiGT8T8bEMxyKtmA16X+IA=;
 b=YRy978qWNAQ1HyyHAxXIh7CJIfxdKeep1L/6A3Zu3TbnZQMaYqc4p3BSe+/gVFpcSa/inWPWGLS9oM1fIhyr97HEMjBnJirCZpqi45CWbFH0F54bOgL3rjHVS+nq5YcEvBWdNXYBQyYLji6+Rzf3U5oMt5f9u5DXrY5n/UcfbFC8G0cygnQm3HYJm1FxZuJm1lF2P1mK1Ugbn+ZBc1Zw9VmrFg5dDvbqrBpaT2nX/eu6w3fDK+IRHM3nABcl/tYe4sDb1Pkf0Ur5rgADTZuVdvT0VPIFLs1TwhMDP/Y6S5sQ+pAPZJq5+SnMxSWCzcORnA0E5StCgxPe34DYL//scA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk7I4dAzmdN29D9AIJXGJSiGT8T8bEMxyKtmA16X+IA=;
 b=NpjDRYX/tvuInNRMELBeriAbQgRx7J7nrgsT+ldj7AP2bAHPDnasB8sSZE11bQPf2P+03ESd8xL3ueL2B9iAtLJ0/S0KzvXyOc2zZ2qghNcY9d3qx683VrMMXRJX4lCcs2R+X2fr53DWK+F3HAZOkDUgq15484MwVvIjqVKKkI4LZEmFWzQ++liXPIEsK6WbE1ohIemLa+icK7d2j9HFClvsHxTCAl/eSCgzN2giT+lOJvCARDJHfsNMNrYL57T+9wg2kar5iS8VZWqdXDvFnIdM18sAk0j10baASy0GYG/r7Bs1KzOKeoFzceqSA0wEaabR4KWBGx98Yu5wMo6JAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:16 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:16 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 09/10] iotests: Refactor tests of parallels images checks (131)
Date: Wed, 17 Aug 2022 17:54:00 +0200
Message-Id: <20220817155401.2045492-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbda8bd1-178e-462a-a769-08da8068bd07
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dILWmsbjdCgATTxCQnlrPV8RHuoL6MMnRvOhhcXaH1Cm/PoTbEtj3pGnapxAYmTZpa/B6EfjREiY6rv2s0DKI7McJvJ9Rt3GvwZJZp/0KwoLNDR0HaNxyolboCHZgwC68eHFArK/4wL/KUeAnZu07keti1RgfEwEHM4Di2h+3qhQJhMImF/TkDM66jynt6CgPX4vhdlK4A5sJZy7Ej/AHnhFcTKp2bupUjziUtnJ6o1V4IHt9qJK6kKnNZZ3YQd0VP0sHrUbVfGY5GxCUotUBpMk7e3s8Ci27WEWsOf2fEfAQl9NLAXMHzAZQcDIJSvPVyyzuCi0SgqvBiRQ1niYO725EQaXTyjHtVNzmiIolbw5UEdYHK8lCt2ZiaCxtp7xMPwl+V8kZRQppg2pJexnSQTpYxnaNokdJvizU22S66HMt+06n3KUCKdChpZdxk0lzuzeR34LMMPjLSitrgPzreH+taxaF7n81Lkrf9a1MKPMm4RaOspjHR2NrA3UCmuPxkUDdrcG2ouH0B46xjoe3rPL0LeG2FZ0jZ+mYIb494FZRugUVQT3azO20lt4XxX+Wnl6UcChOqF/5oz15/NSk4sE5zBi0eB+u3oAuRUeb4awKFD7CGnN3JQgee3ge1TuVCmdo0HrgC84Dq3nVd4Z9zww25ThGQL/ejpWf6upIDBocf9ldRV/WkKoQXV7jrzErPUffIfijVsumOyWVapef3feSq+kpT/dS3PnzwkXHsLfEBno6A3r0OGVm1x0n3oFZEvWeHjLbCGAlNNdR13Z6yRvFEjjQcNsIeH+pdeQUmCTGzimvyI+iRcJXkpFYHAT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JJGrkeWmJysp3tOkw67/n/7Vts1f2P2o17wX6YtoR2fhmvapfeikW+5trUTg?=
 =?us-ascii?Q?5jrjnTblT+UlZD11XkGSbCP7paIY+Xw0Chbpo5Oy9zoK1HfU6uVXpM6wiFku?=
 =?us-ascii?Q?gXirT5ZhmxIBUqwk+FEdMiy7owVRYJkwpVqEFcgJ8PmzBEK1jWV5xdTrm3PO?=
 =?us-ascii?Q?I7GQwayKVeuT3Vg2tsSL2GS2rM/Ae1DmLMsdop8JVDHi3EXweGpZS+aiMXbT?=
 =?us-ascii?Q?FntDtvVqQfaRtxbxhK0J9kCQ3kPn/BJL6nHnVd/AgEaVzLYZ1974zZ0HodUm?=
 =?us-ascii?Q?NjJFRfAdyB6IvVLAZevFZpQqfvSY+cu8yBpxAtTE9CtSpSZi2Ig8NNSRzFjd?=
 =?us-ascii?Q?SGbie7vHCLf0P06uxepo3g+ZuYbYW4K7qYLNje5pWxRnzXqwgNzfTdNBjmz1?=
 =?us-ascii?Q?c0j+GxJn/SzXCLrLHa4ThzFa7COKQ/FCj5Fu0Og9BoptxYqqtjRUyexgr5Wk?=
 =?us-ascii?Q?caG/S3g8Yd4k3gO5YuQsNHeYFboMAeO277RD2ZbK+sz+BBF5u8ehb2x7tllw?=
 =?us-ascii?Q?vRqHpcnFq2WQlrXLPAr40b4DimfPyIR6m+qqchnTEQdwvipZaugGWgd14QiY?=
 =?us-ascii?Q?6Y+4B3PTJq3HyQQCvXD+Szoz8VUnLpRI7s2DZ85dz5nHpzb291RjT0qCihrd?=
 =?us-ascii?Q?jGbt24K1RWfddQFR/ma+PO3AFrTNSRclhtSr3eFTnr2nJ6HuodUmJFQg+Ipr?=
 =?us-ascii?Q?K/+d2SeS928c/dSKpGF/ubsdQ9IFkVr++ck869hbdN7a+bXTFWenHgq+50xN?=
 =?us-ascii?Q?/Nf1BZmk7F6w7yt6iEQxEKfKdnDBAZRQ1dkX42ioz9evUteAQ4kCELXK5EiC?=
 =?us-ascii?Q?kjAv0994p4F5/cLbfY8HeX3B6+bMcDkbBLpAEhGhmy2X3+rT5y0/9k+hf5mu?=
 =?us-ascii?Q?pw5F/4D/0kn+IzESdg1k2jmsXMLIsIS07sC30neFUOZ9OCpca+WhuSOCHPeX?=
 =?us-ascii?Q?uowGKFKkToTRrb/RSKNizB04h3ELR5T6JBeqC6QVXAP4miYjOKy3k1YsJxD7?=
 =?us-ascii?Q?udp3l7PvH5f9fwVrW49LWQ2bO4ES00MQL38cfzbLvbVE8UsGoS+FbcRW+QEy?=
 =?us-ascii?Q?yIigBXmUIEbEIfcgXFwRDFyOvo+nP4hKdJ5TkRI64DJZHGz2CrseLOr+LZzY?=
 =?us-ascii?Q?UTUUljj6qfqDiwtAsAHlJEnb6siujv0pwcmY0dKFCZ8Hsn3bVchhZBz5t6/6?=
 =?us-ascii?Q?oeWXWy8BGPyZ505OaXkPXTYAPKDDB5haiMJuzfEdFF6CkqFouTroVvYIQv5K?=
 =?us-ascii?Q?sWR/6CCRYPmR3tO0mjcrIAkKkUa0wlkHTKCdUf0xljDu8AtIZsC8XbTrHIPd?=
 =?us-ascii?Q?z0bAk+qib84X8GJehuQK73+1Ou6eQmmoDxH2NbyLV2UQKOGfJBhiiPrwEGjh?=
 =?us-ascii?Q?Ao68yOLBOn5bBms2eWzaCk7aZ3vckf3vTKx85/G3jX3ds79hlUVJ+xJSChDj?=
 =?us-ascii?Q?3xjgNK6iT2vuyiHHvTj6EbLJ6bT+jaG0u7907SMh6/f5LKo0NABBzwKzxEh4?=
 =?us-ascii?Q?OHS4aivwNgLLxt4PhkNJN75FkkZdt42AXI7/nnRWsVK5Qumi+RlWO/HXFbvT?=
 =?us-ascii?Q?JxNaq4Xk6P+6EuE8oyZsLAMn1/wnfkfuSpzkpBvh5qDchpl+141wGsTfZRil?=
 =?us-ascii?Q?Bnwiq6mu9ZbYk7oUF/m2j2s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbda8bd1-178e-462a-a769-08da8068bd07
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:16.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9VYV3pF1BP1S56sQ91KTk9vpSxWi4C+ZVQqKUTB6i7km1zRSs0Mew1GlAhkQ82fqFIGf8/2Pkzay/5y4BJQsqzSM3vlYdE9NwzjqRtTTEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace hardcoded numbers by variables.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/131 | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index a847692b4c..601546c84c 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -44,31 +44,34 @@ _supported_os Linux
 inuse_offset=$((0x2c))
 
 size=$((64 * 1024 * 1024))
-CLUSTER_SIZE=64k
+CLUSTER_SIZE=$((64 * 1024))
 IMGFMT=parallels
 _make_test_img $size
 
+CLUSTER_HALF_SIZE=$((CLUSTER_SIZE / 2))
+CLUSTER_DBL_SIZE=$((CLUSTER_SIZE * 2))
+
 echo == read empty image ==
-{ $QEMU_IO -c "read -P 0 32k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0 $CLUSTER_HALF_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == write more than 1 block in a row ==
-{ $QEMU_IO -c "write -P 0x11 32k 128k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "write -P 0x11 $CLUSTER_HALF_SIZE $CLUSTER_DBL_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == read less than block ==
-{ $QEMU_IO -c "read -P 0x11 32k 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_HALF_SIZE $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == read exactly 1 block ==
-{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == read more than 1 block ==
-{ $QEMU_IO -c "read -P 0x11 32k 128k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_HALF_SIZE $CLUSTER_DBL_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == check that there is no trash after written ==
-{ $QEMU_IO -c "read -P 0 160k 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0 $((CLUSTER_HALF_SIZE + CLUSTER_DBL_SIZE)) $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 echo == check that there is no trash before written ==
-{ $QEMU_IO -c "read -P 0 0 32k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0 0 $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
 echo "== Corrupt image =="
 poke_file "$TEST_IMG" "$inuse_offset" "\x59\x6e\x6f\x74"
-{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 _check_test_img
 _check_test_img -r all
-{ $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
 echo "== allocate with backing =="
 # Verify that allocating clusters works fine even when there is a backing image.
@@ -83,7 +86,7 @@ TEST_IMG="$TEST_IMG.base" _make_test_img $size
 
 # Write some data to the base image (which would trigger an assertion failure if
 # interpreted as a QEMUIOVector)
-$QEMU_IO -c 'write -P 42 0 64k' "$TEST_IMG.base" | _filter_qemu_io
+$QEMU_IO -c "write -P 42 0 $CLUSTER_SIZE" "$TEST_IMG.base" | _filter_qemu_io
 
 # Parallels does not seem to support storing a backing filename in the image
 # itself, so we need to build our backing chain on the command line
@@ -99,8 +102,8 @@ QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
 QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
     $QEMU_IO --image-opts "$imgopts" \
     -c 'read -P 1 0 64' \
-    -c "read -P 42 64 $((64 * 1024 - 64))" \
-    -c "read -P 0 64k $((size - 64 * 1024))" \
+    -c "read -P 42 64 $((CLUSTER_SIZE - 64))" \
+    -c "read -P 0 $CLUSTER_SIZE $((size - CLUSTER_SIZE))" \
     | _filter_qemu_io
 
 # success, all done
-- 
2.34.1


