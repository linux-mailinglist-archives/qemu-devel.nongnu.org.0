Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A432589FCB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:18:11 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeU6-00056k-GM
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcDa-0003Zl-7J
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:52:58 -0400
Received: from mail-eopbgr60105.outbound.protection.outlook.com
 ([40.107.6.105]:27575 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcDX-0002DQ-6y
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:52:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRcclT1FTHnXbGJfkIWs73YfxJuA5ywDPgLPPDw7XDL8Y+l+JT3HuiHVzhvRZKeRsGTWQabRF1cPTraVryRtzQTf6Sx5pyA3pHjRd69BmI3OcIO2itC9f3Okhlp7eAxUhEBSOHxbSLkiMSl1w/sPccRxbV1mwcb1mD5Py9ft9EN1MqA4D9TCda8VrAjHNwcXRlwHKjiIFNfiq6Ncrm3RUIc1PggXiCCo4Iqkl66/sw3e9ys4cl588kWDPigzSFim515CdKv7zQF6rMX96F7DH2WFiprh4YfZOX40n8B9uhHQx6ntPjY99d84jFHrNzfexdVaWuCr362OfppErd5q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWcWeG+uxj55j2p60tMLMixK/1LjyViLxQo57wwckBo=;
 b=VY/d47pWjGheyKap2oTb5asPGHTnGWP9GUh8RLzZQeMTL/ruCv0bREYuCMgaflZbpIUlz4zuy98RORpP2WxmAMJc9IGoinrSUMiLHWV1yugdihcpdkDZoIQgcCxOYiGq+7MLfTWgE5jpAJddQz+v8vvgrEzcs71ymgEaGWkTXGgmhp/+7CXpqfrI+Uq1+veI0IoRhYvAdN12SIwZZ+yWmCa7fGB53lnPOFQGa/pE8P+nA439HNCtYYTcIV/7ZHDd/c3UE98C4zRGv+uiZE/qlrl7Q40BWU3bpsYEwnCYQkjfMmHlMn0S+boRQHQZLjQJpPTsm1k7EoPJnPmwdGee9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWcWeG+uxj55j2p60tMLMixK/1LjyViLxQo57wwckBo=;
 b=crZ0+/l/xP8yaQailXpuOpq1OPC6jolD7p+qvkmfcZn3PDb/JHg2cqVVY9MXjvz6Zzwl059gfbO+v1L8bGiB/Lkk8Ock5BQVgZe8gU3PatfysTtARYqgUP1/kE/cENfeInItmMsppMWBjizAEMHLzJuqj7JgPEKGVnCKR+KMXP6EvrVtCmQSF0BetU3Y4Ohxb6LoV/dHmyca46wMouX/xeCx/nLypVZ8Ntfqv1KYdeHYPgeke4nue4EHEnpJmJ640APDvNg7EXNK4GxucUosrKH9Fa7EK3wOSWEnjTQ8ha1G1W8Mq4sVuO7/H3V1E8pkX3NSTeGgMCWw9kVRs/GZFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5624.eurprd08.prod.outlook.com (2603:10a6:10:1a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 14:52:11 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:52:11 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com
Subject: [PATCH 3/3] iotests, parallels: Add a test for duplicated clusters
Date: Thu,  4 Aug 2022 16:52:00 +0200
Message-Id: <20220804145200.564072-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
References: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4c2f5bc-d6c6-49b1-db87-08da7628e956
X-MS-TrafficTypeDiagnostic: DBAPR08MB5624:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MOBg8VCtnQQx6SxEM4Mqip0BqrEiexNSj1pU3uZMoix7yzEj59E36fqxGxh0MG64rWnsGB+DHMqRY69mqmymVCZY+B/CZzBBBkjiSLw2sek0vOuNuK3tqjCxV5lQozJOU6mxVss0Ac7AXbkWqH8jBzlrPjHR4fNWcS+MTmMZA+TVMk8n4Ji70M44+UqwiKVEQ18pDRPzZbHIdVAE2lJuzHBuOKYi8bd5FW+QhOdGgKTE2hp1UYuXnbEwEnyQq0Xph5HS5CvIFVsrX/UmF6Tj0Jc5Pf77r90Ei5559yhECXW65WZYTlWT4vT3jZn2dp7q11uMxY5o4SewwvT2Y8EcdOSe6mwf76mbQdgyJgkA1Ac+b2g/hL84L5hm5kMteqH2NwQ+ocVKewRNkS6a6LcrauNlqaSIu1KtnErg+EEGEceH8j9kfLcJ1hJInuF42w933Y96ggzR0PGkNaCCSFdp9YieW8541IICl2DlcIdVUXkhJwruGcjzStHvMHyIxkcG7jmkqKJeT22BhKUJ/KKUwmo+HpoGUS86scLzYqnamGYrEApsigSLUVwqh6DNFJNBLuKI1LHOhVZrwmEg+Xrb1qgYiyWj3PXyjPEJYeIhtSzwK/JL5tvMZtugdh0rIE9QGXohlT3thfn8orRjk2hEh8riHEs+lzSuYPZEo8Z4+NVh3rL6E//XMjZAvFqJSa0tN5dg2L7m5JJHRw/hJO+KcrRxFevmthiHMS1QeVQMjrXR7sRqPlq+/PLP/ZgJPMXl2AXhqTTNlUmWiDko6ZlqI9nUbBGJvoC4eUKHHjzD2+2fPSRen9edtQLmSlaZRhIJzWR/vHxMrF8i3HfG9Zz1vEMiST2ua/0mqBUhmh1Nkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(66946007)(8936002)(2906002)(83380400001)(2616005)(107886003)(186003)(66556008)(8676002)(36756003)(66476007)(1076003)(5660300002)(4326008)(316002)(6486002)(478600001)(26005)(6512007)(6916009)(41300700001)(6666004)(6506007)(9686003)(52116002)(86362001)(38350700002)(38100700002)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lnpRGLgDfF10Tkg8D00VODGutMiacYkpIJoSQNbwbnHPIwQO52PX9I10+U0G?=
 =?us-ascii?Q?3FvnYBkMvbDAHY4QtZDjgJ0BbVHUFV0fJkb1d8+Qb7XWWbLI7PDULbirESNc?=
 =?us-ascii?Q?IOiX3Z6r2qJpT2jh1qW1fchWtSnnZJDyI2g+/Y3cILwuyUcbW9rOYPVvPJHE?=
 =?us-ascii?Q?R/G46vivTIZVkGr3m+ZQxUgNDdpF3pcbKtIXj01hCEnGO7Rcu2SVR57j04Nr?=
 =?us-ascii?Q?Kt/Jitb3XmE4hzfVEwkbrVYgJ0ogSwzrMJwOGKv3qXNYT/vf/JpT7C30euml?=
 =?us-ascii?Q?umGhb7kBibdjR9Rf3fBGRKQOTpEjVVTZWM8erCUmhrNhRQvksN/zPoJF7Fe0?=
 =?us-ascii?Q?X9zHAb1Zbf1Ln/0tuSKubX4Vc0PekR+Aa6O+HS0YCCVosCgJF4xnQmgh8GVS?=
 =?us-ascii?Q?yrb7jrLGHjp7kl/Pcd2pe2fIiCOCuwIuL1mg6yr0FdsX2l+dSzPvxPfgiXv5?=
 =?us-ascii?Q?EtuBWTqg3HYfNxMHLRxqaGqQfS/HN13qXfqAj72mO5jQpObwc791cZ1k4JfV?=
 =?us-ascii?Q?LZgWJ11VRoXM6CVWxgwu3EvPvMlKCrXWax9bfo0UDzsj2tQMT1cev1PttEFE?=
 =?us-ascii?Q?Ky5du/qL5f9fbNHGveKsSi9JlVkMY+bOPlsckF9AIHvcdzid7t3Cn3h19Sju?=
 =?us-ascii?Q?Vfz1lgvdRyd0DVKHjvYZJKj5qi8qKzrHWW4vcS27uaSCGMsy1xdOsQ1lmgQj?=
 =?us-ascii?Q?oJVfOJ+LIaexhA/Z1aqEvOCfBFpBwXR+H8o948bPM1iRS4RJeh7ayrCstLM4?=
 =?us-ascii?Q?IzJ1567GqWw2KtkEF7lQszbwiy2XdtFzUo0+yNJcUlRajhN6DitbiYF6PbnN?=
 =?us-ascii?Q?2iMwHYJbdyx+zQygEbdPvdLD8eAQ6uPxZvU1+EYpqT+VmAqAkrdqMWg4Uje+?=
 =?us-ascii?Q?BfR1FnzXqTdd2osk6g9vSdPQApNT5BEVxJxVrI23/wlTADwaVWfzjQ/NWVnR?=
 =?us-ascii?Q?w8pJ6PNzq/qC+6y8v4E90RwXfA4iSx/H7bCqWa/KSdGmvVs7QjXL0elSLKW8?=
 =?us-ascii?Q?6VhY59oq2nQvVhpm/6H2C4hGF+Q07RL5YzfrmdRvd69zn1MebX/3b6QMDgSy?=
 =?us-ascii?Q?oqZoVKZa/LAV9yUIq6x7YjByLOcP9N0iJ/68dfhffSRu+CsDMTZFFw2GlagA?=
 =?us-ascii?Q?9cQ6hSe2P7mGW0ErlggpCf1n+wH4p52L9c9KL+Uqf59ErNkJY811Hc9C+M4M?=
 =?us-ascii?Q?IMkMoUalv2hqYozPx6wjnKtwSk2KYjBP5YEAKuhAF9cSiJ8jRBAh2cRlRD2V?=
 =?us-ascii?Q?jrA+e+iNUontTmhgzC6yYs0iNEvjJzUZJPp/JXKcZiNqM4BuCxFdOa8oI48t?=
 =?us-ascii?Q?cPG/Ucg8VVg2o94lABVeQO6mo/dwp6R3a99sbL49+XsrDufjQq9bkDqck42Z?=
 =?us-ascii?Q?9/k43vnyLV29SrWf2Hhc8Jx+vAOCe4wySzIW1Hi9iMrmppPl16Jc2mSLxi3D?=
 =?us-ascii?Q?7PLSuF83zByVNVAgy7WSdteCzltpNpQXD/k4aEKtSu5ptiAvCpXYYmuw2H5G?=
 =?us-ascii?Q?bUS4+nSREjo91CQO9LXGbwPIHEiSsJGS5DgUT841qROM9vGqP819gyPXu8Jx?=
 =?us-ascii?Q?u/qkTpnqTJe7Ss1bwT28BHlVvd8jvt4ILGEPr8C5F5UJdbzYRdzQmbJHtVDP?=
 =?us-ascii?Q?5isvfdcvb2ZqACGIvcdObHc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c2f5bc-d6c6-49b1-db87-08da7628e956
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:52:11.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNEZj18nb98NbRHprLCvUfJjsKsLZd0m//F5DgGyEV3+7IZlrjhZ6SqesG8M2cssLyw1zOdr29yvZF/t9Bs7oWmsQzjwda6qh+B6auc1jao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5624
Received-SPF: pass client-ip=40.107.6.105;
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
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:10:06 -0400
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

Check if original and duplicated offsets refer to the same cluster.
Repair the image and check that writing to a referred cluster
doesn't affects another referred cluster.

Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/314                        |  88 ++++++++++++++++++
 tests/qemu-iotests/314.out                    |  36 +++++++
 .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
 3 files changed, 124 insertions(+)
 create mode 100755 tests/qemu-iotests/314
 create mode 100644 tests/qemu-iotests/314.out
 create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2

diff --git a/tests/qemu-iotests/314 b/tests/qemu-iotests/314
new file mode 100755
index 0000000000..fdf47f86d4
--- /dev/null
+++ b/tests/qemu-iotests/314
@@ -0,0 +1,88 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Test qemu-img check on duplicated clusters
+#
+# Copyright (C) 2009 Red Hat, Inc.
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
+owner=natalia.kuzmina@openvz.org
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1    # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.pattern
+
+_supported_fmt parallels
+_supported_proto file
+_supported_os Linux
+
+echo
+echo "using sample corrupted image"
+echo
+_use_sample_img parallels-2-duplicated-cluster.bz2
+
+CLUSTER_SIZE=65536
+
+#read one cluster from original offset
+$QEMU_IO -c "read -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from duplicated offset (data must be the same as on original offset)
+$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#change data from original offset
+$QEMU_IO -c "write -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from duplicated offset (data must be the same as on original offset)
+$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+echo
+echo "check and repair the image"
+echo
+_check_test_img -r all
+echo
+
+#read one cluster from original offset
+$QEMU_IO -c "read -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read copied data from new offset
+$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#change data from original offset
+$QEMU_IO -c "write -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from new offset (fail, now this data was left unchanged)
+$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+
+echo
+echo
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/314.out b/tests/qemu-iotests/314.out
new file mode 100644
index 0000000000..c36022c407
--- /dev/null
+++ b/tests/qemu-iotests/314.out
@@ -0,0 +1,36 @@
+QA output created by 314
+
+using sample corrupted image
+
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+check and repair the image
+
+Repairing BAT offset in entry 4 duplicates offset in entry 0
+The following inconsistencies were found and repaired:
+
+    0 leaked clusters
+    1 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Pattern verification failed at offset 262144, 65536 bytes
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+*** done
diff --git a/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2 b/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..ee8f0149b5ecffc4fdc5e2c0cf45b731610378af
GIT binary patch
literal 148
zcmZ>Y%CIzaj8qGboOfsS0tPO%`U`(O5*Pv)I2hO&I2yDPt~od`068263_Exd7-leV
zwiz(^Ft8k0sa3TsBZG0}Vv}35zt?O%VET5A+3Q2o4%bdpm~pLC^&`WR2CW6$VGH;&
vm{u|@;OhXBE0|U>d|v){U)AOQJ)h70iu-<&;S?CYW~db}a<vGU0CEKYoE$uo

literal 0
HcmV?d00001

-- 
2.34.1


