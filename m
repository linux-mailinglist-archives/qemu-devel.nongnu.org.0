Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA149CF83
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:21:39 +0100 (CET)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCl3C-0003UP-9D
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:21:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCkuF-0002Gq-Mj
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:23 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:37041 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCkuB-0000NX-O5
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuQHyKBuGpTGeUjIGAXzY9yNIEwTP2Rdut/KcqvZQRTfiXCDt+jg+TmF/3PlXfyOFeuc3ffJkLnkqj6vxcJMI4VuBWdb8gqrjvkGH7kV5SJ6QjwCbSa+MGhRCDpuwafg+H0X2Vc/f/z0V7XNVvQ5+EdkblT4lRtX2/vmJUKsrLoe73H2uS5ec0QpGh5Y5CZJ2dsRnhnR4CXixZjdd49r24BVAndK8oco1HEtGPa5xUp9fGoD4InRxWPWUYnh+YjeOYbvBaZyp/s/507SKhRir17S6O6BYPuwoH/6GJcQ7liRzUUQ8v+siQM17ThyOzNo6/NCAEdsIWbsdUodNo3zzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nXw3Rg5xki/EYwjpTH1qSFZN/7iR+L1Br82XD5lJvU=;
 b=FMtUrUYmv+vk0cnTW2kN2/71HnwbhI/TYOjObRb+DY/hIzSilA8PKCEz2VM+fxbO2o8U7WqyyBxaQ/tzuprmeBeuOlMud6s01iaIa0QqFu045IA3Tpqv3oSJLFSpPThRerlZw3gDLl7NhjxvppUZK7bJ1DthljIyazLZNJmoOwDFv9EwLt2798rm+eHezGNQQS+z9X1XtA6PaBXoxq1ND86/csY79X7yAR6gbe4WLG1TEGSgV+MSObiO3JJWVPB2dOcGXL9ZAptfQSL2/OTzFPS72ViT54wFN3r40ToS0DTcW7v/dlYiyPYnqmla2T9W1Eyi46n92mpz/Vi2QnkBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nXw3Rg5xki/EYwjpTH1qSFZN/7iR+L1Br82XD5lJvU=;
 b=WjBij63F27gyNdWTzAQZvJfZq3NQjkW7CBd6bnU6n4pF0n8Wd7bY8yFu5pbSwIHAOH2a5WduaErELyxUeGAzcz5UUKBXZNwpmEspBOlsLAd5oedXfWAAtsmBVjfJ0l0Q2DLoS7iWjA+chRuYZH/IyD+O0QMXXB4FOt4dvo6tCmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:11:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 6/7] meson: document,
 why we don't generate trace events for tests/ and qga/
Date: Wed, 26 Jan 2022 17:11:29 +0100
Message-Id: <20220126161130.3240892-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b7d6953-2fb0-4b7d-e682-08d9e0e68b73
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB5868F8954BCB1C4E517866F9C1209@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjJ3AbVtwddH0jaC4oaYwCzVIeA+A2slaVasjzynVonHKJb06/oNflipLzfE+DddpCfoNdHKNt9tToUBhrenHa3M2H2p/1psFhwQmLpyhKSAJByqxHuhfzgcAshMCYAY5sqAYBX6ITWkw+b6HNG4PQhexB2gEx+qYlClgj/QKQWX0vMbYsmBtPa5AwINyBxtUF8/OmMKJCDW7RC3KclITYob+qZLuY0y45ffdMXuoVZ4Ng9WFWXTnnJon+rHcQxeLBHXYmpYIN5wyT+03aX7Rp3JmpVKXAgP3zwk16Qm56PzIIFXNcv84GnvfXogObiXoJ+VKN8ZhUEfhsF8GMs2gLQOoqHoe1UF9WEKMiSzYU0Zbwv0gvdagXh9U5jd0qgdn6IIpNteFkg06ybfZbAjSTFj8EuqjsL4XlsDHFlE+MDHZ5loj6jSyWIhywji3GuSqrQpVq7AowqZ4wixfG8/VSczP/ZaN3j9l8vIMoIreGw6yg6i4FeeDmh2sX4QktG1YzLfmmdECae3NrFWE9XDMLejwYo0NwFcYZ1nIArQoNi8i8tRCmu9cQLeAOqGgvfiNw18LYEb5FpgKR1LAgIG9xu65b8a/JzQaos4cV6SDz+qLPD2s5mMNAeYkuV4eBnrgU/zsUU0iLze2mEQDXh6VJM2KJcFWVLr3Q4dNh86eKI7i3D5IyZX2HEp6xKuqjagVcyCCDGRxIuUS0yhzp4tKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(8936002)(6916009)(4326008)(8676002)(26005)(38350700002)(86362001)(186003)(38100700002)(1076003)(36756003)(2616005)(6486002)(2906002)(66946007)(6512007)(66556008)(508600001)(6506007)(52116002)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lxdTqzFhKId64NDsc2KKsVQL5GTsoATYMbYbvp7dA558SiTPfsF759upZqpY?=
 =?us-ascii?Q?RGFeSva9xqR/PZkYAwY3xkbhY4OTsx1jjmGUXhhtCsDd3svUeLBDnO52wQOX?=
 =?us-ascii?Q?0chzcbqOviRdbdpLs+wbucigdmrqQw4PqTba8Njv7KcY5g/MJ0r8DuyYwEfW?=
 =?us-ascii?Q?AGTKTtRHrwQE0X+CQtcdOm4RoqSw/Bdt0bPAapav6bjVLde+dfNm9RFo/q16?=
 =?us-ascii?Q?PBOYMbU3Rsnd9ud7t47B4XiklaT+vB//3ec82qT5CRG230871pl0XbMu4HVh?=
 =?us-ascii?Q?/A1cLSOOL3JHfpXuTep9tdZquzTZD7Y1vKbsirl3bbUOfnUuRZyKFqP2Wkfz?=
 =?us-ascii?Q?YAEzLfnNDNSCtoNv0zxnxMDeMiukMQsTtsvBqTDR/PfbKOEcFq9ymbndWnYX?=
 =?us-ascii?Q?8PjSRKw24KVKnHqqGEuwuGVlbfZKDR4wdKFptSE+wD1/mwMxump2Fr5cI2HY?=
 =?us-ascii?Q?9NeLZtjYzk1YopjXgYXdItKAZMRBXtYJe1hxYUuqCQlU02RoYb0PZ2PXtCAy?=
 =?us-ascii?Q?jixlKoGiNq0wVlWB2n2ZypvHLkwnd4nZFqC69EqrMd8gIGW3VEFRDLmx+4x0?=
 =?us-ascii?Q?O/P9WSvNXMpTtpyIP6xtZs1WfNX/Okzt3QVa5Qnsx1BCTU460bQawfYDMZNF?=
 =?us-ascii?Q?UMlQLXxW+tWbqPZxjKasteApK2rDLmXwx6qpIsDXCLS/gOwnLe/tRmNmc7tW?=
 =?us-ascii?Q?nnK9uqjxlBpfRwBHlC/FSQ9muBuDpTASYCfj1JJklCKe6rz7Wlpd7ESm4HKc?=
 =?us-ascii?Q?szXgUpvrk9T0BwS3fv2z1Xg6UnVqSVYLscU2Jp2W37nWHTc7Kl3+sPITFs10?=
 =?us-ascii?Q?9VSaXGnyQVO4Jyzl1g3Fc5gCmse0yOzEAF7y/DstulfmVJk+kq1cX76KsibE?=
 =?us-ascii?Q?5VRU0qBwzMjmNTwcpApc9HpwbucQq/xXhQ3//jQTPfMG+epwYhjXWk3wFZ8r?=
 =?us-ascii?Q?2sHTXnPM8kJTf5qE3wz2C6CJLmizPIWxhkrrgB/dSPMVwRzB9z/Ir1i6KxBz?=
 =?us-ascii?Q?eHkLQ1nmcMHOJ5uCLttulgjXOztbyQUClKNO1kDCD8448hC+q9xeSR++CVur?=
 =?us-ascii?Q?fu8Kf/Gqgdkt4HN8M++aao1XtNAnLgnEhver/Z/XNuXvIenLBQ8PK3+mcU2b?=
 =?us-ascii?Q?37nYlge3nlVSOw3I/07LFTXGpS50Ap14cp5JcXH4G2rwzYMLcHHsda7zg3Ov?=
 =?us-ascii?Q?DO1MyiH3HVhNgpljeIkRXbMSeFn/5yLBDwxusujkJ4BYIF78W2gGBbE1or+Q?=
 =?us-ascii?Q?d04yA/zpSboja49EuXTU//M/I0MHkciFLNsgFSjfxRl4laWjsyrvtYTBpT+f?=
 =?us-ascii?Q?q2oBBEJPFTJdFnOZWdv2Cu1ctSrKVeR8MXBYPQlKlm0kUf6duyCgwrYF+fuc?=
 =?us-ascii?Q?uZUXcMfYr8I0dY/9Ny7m9eIUtmY2Ufs+xvljI6NJX/uqmpj04JhkViUsD/hU?=
 =?us-ascii?Q?Ra+VywcjH72tAR/jd3s3PY2nzB8qaIJqMxgoT1p9aOKwmdKo1OI7bYftq2xM?=
 =?us-ascii?Q?jzIP8yMeA3fnC0Au/WQsZlAZlUR5aJQ/6JadlyEJLX8AefqpD6Q6I6rL+6qo?=
 =?us-ascii?Q?yaSef/CLN/Az3TctaOCJ2XOegLpjSr8+VUGNyaPhQSHLydM+TlW693c7ky1E?=
 =?us-ascii?Q?zpyzlcQ6rZ4fe1mzoo1j3tj9WwQzYQhU8LszgLsbSUR71oCjTfBCeaAfEka1?=
 =?us-ascii?Q?LhZBLF9cWnlcbwl1YTwNQcrOVnM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7d6953-2fb0-4b7d-e682-08d9e0e68b73
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:43.7927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrnV2uhRVRegjxMU+ZljfRgGmBe7falW+YkynfyMaRQSuEEqXPAZ3/QvQFVCoBdoYDXtMhlGWuYa8KgsVRK1z3nWoGA/ZbXy7A6eIeXWY0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Making trace generation work for tests/ and qga/ would involve some
Meson hackery to ensure we generate the trace-events files before
trace-tool uses them. Since we don't actually support tracing there
anyway, we bypass that problem.

Let's add corresponding comments.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qga/meson.build   | 7 +++++++
 tests/meson.build | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/qga/meson.build b/qga/meson.build
index cfb1fbc085..724d5a667b 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,6 +15,13 @@ qga_qapi_outputs = [
   'qga-qapi-visit.h',
 ]
 
+# Problem: to generate trace events, we'd have to add the .trace-events
+# file to qapi_trace_events like we do in qapi/meson.build.  Since
+# qapi_trace_events is used by trace/meson.build, we'd have to move
+# subdir('qga') above subdir('trace') in the top-level meson.build.
+# Can't, because it would break the dependency of qga on qemuutil (which
+# depends on trace_ss).  Not worth solving now; simply suppress trace
+# event generation instead.
 qga_qapi_files = custom_target('QGA QAPI files',
                                output: qga_qapi_outputs,
                                input: 'qapi-schema.json',
diff --git a/tests/meson.build b/tests/meson.build
index 3f3882748a..af8f5b1746 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -31,6 +31,13 @@ test_qapi_outputs = [
   'test-qapi-visit.h',
 ]
 
+# Problem: to generate trace events, we'd have to add the .trace-events
+# file to qapi_trace_events like we do in qapi/meson.build.  Since
+# qapi_trace_events is used by trace/meson.build, we'd have to move
+# subdir('qga') above subdir('trace') in the top-level meson.build.
+# Can't, because it would break the dependency of qga on qemuutil (which
+# depends on trace_ss).  Not worth solving now; simply suppress trace
+# event generation instead.
 test_qapi_files = custom_target('Test QAPI files',
                                 output: test_qapi_outputs,
                                 input: files('qapi-schema/qapi-schema-test.json',
-- 
2.31.1


