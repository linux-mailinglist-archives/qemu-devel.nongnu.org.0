Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615AE5ACFB9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:14:39 +0200 (CEST)
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV97l-0006we-IT
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tW-0004dl-Ug
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:54 -0400
Received: from mail-am7eur03on2106.outbound.protection.outlook.com
 ([40.107.105.106]:56865 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tV-0001wM-8L
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvG+q06MQzxE7kmr9H4+uNqDS896xCXf4d5zaxh/iGqZRJ0374AZy3gN23XElbRWXSp1XvsPM7q+LR0eaVVXtG3kWL9EFrJ9UoxZIs3e6PCSZHMXxpyxOJorfLaP1ukagPdaXJGJG7n+SAFL+ggGXHXlS/iZf9A+1taHe8NpvALIhHulrkwKf9s5ns0j5vTxZppbA11tFlcsE1bTvkPe27KCfkiQ6aEi4iNxSyCHqG1/VwWyITSdg1ZJsBpto5ivoVb4Q06N4osrXMAOc24OLG+coMRWQpcUR8FNsCZxoBgQ9/446KHXfGGvzvKnNI+m2MjLsSSxnKq5LkS+vrLtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j1C6yjWoJjrbK/Am6+q3DgkQDCakhNvKyR9Q7eoWdA=;
 b=hnYfcff765l6NDzMB7xUQeBGILR9Opca6DXeStlWIPPXOinVNlZYSnb7foAXKSw5aVl+fbSRXPJ8+yE5HGeooymNHb9j7e5FCin810Erw8o0h4tKVkOLDwF5XgflWjmyVXy5UzJlmP8w+34hzsZ6zV3EvTjV4zCja+yqPZMG8O3nKjOPJTilguY4d6lYVnNHFnZhsm6+7WVDWTSA+fKdaDJ/sS6thR7urusXYWcj+5G87xJ4Pq45cDQM/ru0esCLadmh6mepkTWwDz4rSFMcQDZOpvC+edU+vtsKNbdlECGE2q+/tBkYT8lm1+LSOjMkROVvECJDISLRix3w+Enr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j1C6yjWoJjrbK/Am6+q3DgkQDCakhNvKyR9Q7eoWdA=;
 b=mEtliPjFf4QuJkZX/bCpyP1CIxXQLkTybmKwBNOpmzzKWPqQucUKTvcqV0f39OGd2Ax30OHUQxKg1LscLHwRLCV7PUae7yRjX5NFyHBcsWPHNFCwu6ooHN87bHjl/JavDQnJn9/qM+Cxbjill+pZd07mYDxNvdDq1PtWQaCBBEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 09:59:50 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:59:50 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 09/20] disas/nanomips: Move typedefs etc to nanomips.cpp
Date: Mon,  5 Sep 2022 11:55:11 +0200
Message-Id: <20220905095522.66941-10-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a15593-2702-4241-b661-08da8f255f67
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+WP0ir5/PTp1T+098RRrGmNdWJ1xyzZdVJybWyc530cCkbL5inh9gYFPRhRT5V6xDc5zdFBFvJxHZ/JXMSxh54ufMmAPHkPVkl+hqghnFR+S0IGkgw+ZwpjRpU9TZnA03X8irSWnnuEuZYK8yh1+tY+YybP1NPRL4w5SdUWHuqYNkmCe3MDMsXi+SmfqjJBbnm0nKruU0NJ2RJ/HO5uQm1tQ1HowcfnEP9vT2wOZWCpR3mgDvHJ/0a2r8lgUmVNAosOjP7q0LDpu+ZW1BHZBGsbJ1eTo+VijoYcBK16lk1MZ+qLONrDbryJdS6wjPUnLaeHFLadaNe1Cd4KaAgladCeUJ2mTAGtWDIzvRLlbuMJhzdidURc5Vv5rbl8e/zzQkHjw5XzmO+IY20hlyw5cY0biPo5CuuMiSFjbMYZaroc4bdAvKd6xWm8V20sRqn6aXmPF96IGfYF76JhRuv8nQmfVHfZUVbSdhjB38u9fspkdEFhlR8azrmE/j5UkrJwtHtIxhwvHO1sZmsBAAE7+pc78hgvafpXyCdDYuAQ9S9bib1QyI7FWSNFWwCWp+Xf5XEpRZR0Ll9wemWctEQo4kShrGYfiVnTljiDNzRpzCHSNAJ7SPRxiKpU3vUHPoU9pIwxNX2YWrbOj9tHEoA/Qb05N4ZBejhlOywspoici6/5Xly74K1Ei+z7NX+HQfTTD4aGcaKgNsQDzNsC4g1STYrICFHmYXky67r2UbY96A67Qkq/7+caWzOul5AiZZNIbD22ybIDMbmEuEsGa0jw/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(7416002)(8936002)(44832011)(5660300002)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(6666004)(316002)(83380400001)(6916009)(54906003)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjlGUG9hL3B6Q1M5Z29weERNa1p6a0hJMzdOL01lRStCcW1TZlJCazBQd2h0?=
 =?utf-8?B?UkxsRHZpcE5zckFRNUhlbThyeWtzcnNtTVBmeGZ4QzFSOWRIKy8vSkVFTUZq?=
 =?utf-8?B?WG1HdVVOUzNPQml4WFdkakRxMlh5NUx0WlNWYXAyZWZSNnZxYVZheTdMUXl6?=
 =?utf-8?B?bWtLT1dzVEFVc0NyK2VuRU9uNEx6NThibHp5Z21ZVmlTcEphMmdVTVNxbmlq?=
 =?utf-8?B?UlR2dWMvQ2ZFZi8wZHpKUjdPdGd0Zi9nMk5DbW90cmN6SkJicEtoRmdCZENY?=
 =?utf-8?B?SjJuVC9OS3ZXdXkwcVNrWTltK2hMNHpWdzNpTFBlWnVxQWU0blNGcEg5NFVa?=
 =?utf-8?B?ajRsVXJtcmthOVZjUnRPTDU2QVA3bkNsZENkUDFWWk9id1NpWWVaWkNBLzZB?=
 =?utf-8?B?NXZ5V3k2Znd1NXV5U3E5ZWsyd3VUUGJ3YTZGbTF3bTRrMDhkdUdpOForeWl3?=
 =?utf-8?B?RlovR3c2YUJoeUVhM0xJNE1FTGpOejFId1lzRklhNTBUOWRzUnhzVjkvRlZ6?=
 =?utf-8?B?UWNwK0c5MXZjeWV1bi9VdENrZkhKRDJSMVNTWGg1TkRlTTFNYnk1bTN5NDhV?=
 =?utf-8?B?SStSZkdDYlBXdFUxOTlGbGZ1VmpmSGxMTDR6cTFVVUVRSWZvbkNtQnM2WFV6?=
 =?utf-8?B?Q0hzWDRuV3VNc3Q1cjA2TDZSdFZxVU41TDcwUUJhYmMzZlMvclBhY005MHJu?=
 =?utf-8?B?czdGMDhWKy9EdjYrQWlrSmw3aWJzVko5aWd4bXhLbUxKSVJ0bm1oVFNISEly?=
 =?utf-8?B?cnFPSThaQWtQOTJ0QlZMYmxXWnB3TWZobGMyWnpwV05pdXdNUUtrcnJpZjBn?=
 =?utf-8?B?SGlRMDdibUFIckx6c2tCV0VmN1lzTDZNM2dFWlF6eTc0azVBKytROHRRV0Fu?=
 =?utf-8?B?eFh1WmFza1RmOXg5VjVMYzlDNjRPdkUwNmRKbVN1ZkdLcHRQUG5TTDRMNFBL?=
 =?utf-8?B?eS9lbDB0Y2k3SDVxWXphcGg2bDgwWUZ6U2R1Wmd5MDJsQS9tMTdlWVBVZmJz?=
 =?utf-8?B?cHcwbG5sWkVpa1lWNU00TEZEWGR6cG1NRkp6eDluaXlGT2llVUZJNGkwM2lv?=
 =?utf-8?B?Wjh0by85Z3NHaHcrTDhIMUtoWTRadkJnc0hub1NhbTI4QkZBT3dQdS9WUUhM?=
 =?utf-8?B?QmdsU1IyNzJaMFkzeU9Ta1ZYdHNMMlY3bGE3M3ZmcERXOFdjWFMxRFRiS1p5?=
 =?utf-8?B?cG1qczFNTk5pa3h1cVYwWnpZRGZOY1ZrV2xJR1hLVkZ5UkVnYkRFa2FMN1Vx?=
 =?utf-8?B?TVVDYnZLRlgyWmZDVnNsUUp3b29JWnM1Zlhha0ZTMVEyWStEbTlYYUNubDBu?=
 =?utf-8?B?SFFibGtZZ01RV3gvVWpiZDJUOG81TVkxeDArYTZmN2tHck1aeDhYSDhuY2hx?=
 =?utf-8?B?UVdhcjBsMU1BVnlBN3FlMlFFOERybGl2NkVCN2wwak85QVMzTUROMXhOdnNH?=
 =?utf-8?B?TVpteThYZnhFREZYemVSZGVEaGhYMXp6Rk5FQ09JNE9FN3NyYmp5NDNjT1Ny?=
 =?utf-8?B?amVpYU5UbHdsZVdmRS95REwzU2IyN2U1bXcwdklHZE5DbjFZblpRSlNJTDcw?=
 =?utf-8?B?OTU2bG01ODRnMmIyTDNoRVRWZUtaODc3Zk1HMmNpNFppUDdoL0ZjTDEyOStL?=
 =?utf-8?B?VllSbGQ0bTkvb0Zuc0JObm9LUENjdHpLelJoVldJZUFtQ0w0THJPaDVkZVJv?=
 =?utf-8?B?M0JMeGdTdkRtd1VKMUlkYUdLcEVUTG40aUpPVXRDeHFkWTgvMTlGMWY2L3BE?=
 =?utf-8?B?YTA1bURjQStUVEVwcmFySXE5YjNzY2pEWkRqa0NVZGtsK3h3Um5wMUpFdlls?=
 =?utf-8?B?clhpSkhHNEZmZDNNQllOa0JmNTVxeDhGdEJ1ZDVKbG54YWJTRzdUR1N1S1JT?=
 =?utf-8?B?UldtK3BjTU1nYjZHNHg1dS9HL1V6QXgyeTBGeEZoZW0rREVOMERMVjhPeTRs?=
 =?utf-8?B?S0s4aFVVWmJoQUVrL01iOHB1cENFeDJnWTJScHFFdXVSSVFzN2tUaDVZbXE3?=
 =?utf-8?B?d1V3aTBmZy9xTTZWTThLdXZiZWdXbFBpa05xWEs2Z1crUk5KNjdVelUwVUtn?=
 =?utf-8?B?UDVleFE0dWpuTitGZzNwMnBNTmFKdTZLOXFxcVl4Q291M3NFcEdPemZhRDIy?=
 =?utf-8?B?U3M2dzEwTGdSRzBycm1Sck5TS0d1clJzQTcvWVJWbTNIRk5BS1VMRmpqMlh2?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a15593-2702-4241-b661-08da8f255f67
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:59:50.4947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkJ3+yuHdfUNLhqNOzFrIUvl5BvckAE3+r+HcWDrS/Ttx5WH50Kcisf9a14qTZD/wD+xRqP0XYjSdCIPGEtFFT23Wt0dR6vsDtaUaRWIK9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.106;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following is moved from the nanomips.h to nanomips.cpp file:
- #include line
- typedefs
- enums
- definition of the Pool struct.
Header file nanomips.h will be deleted to be consistent with the rest of
the disas/ code.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 disas/nanomips.cpp | 53 +++++++++++++++++++++++++++++++++++++++++++++-
 disas/nanomips.h   | 53 ----------------------------------------------
 2 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 1326840611..c11c0aceaf 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -36,7 +36,58 @@
 #include <stdio.h>
 #include <stdarg.h>
 
-#include "nanomips.h"
+#include <string>
+
+typedef int64_t int64;
+typedef uint64_t uint64;
+typedef uint32_t uint32;
+typedef uint16_t uint16;
+typedef uint64_t img_address;
+
+typedef bool (*conditional_function)(uint64 instruction);
+typedef std::string (*disassembly_function)(uint64 instruction,
+                                            img_address m_pc);
+
+enum TABLE_ENTRY_TYPE {
+    instruction,
+    call_instruction,
+    branch_instruction,
+    return_instruction,
+    reserved_block,
+    pool,
+};
+
+enum TABLE_ATTRIBUTE_TYPE {
+    MIPS64_    = 0x00000001,
+    XNP_       = 0x00000002,
+    XMMS_      = 0x00000004,
+    EVA_       = 0x00000008,
+    DSP_       = 0x00000010,
+    MT_        = 0x00000020,
+    EJTAG_     = 0x00000040,
+    TLBINV_    = 0x00000080,
+    CP0_       = 0x00000100,
+    CP1_       = 0x00000200,
+    CP2_       = 0x00000400,
+    UDI_       = 0x00000800,
+    MCU_       = 0x00001000,
+    VZ_        = 0x00002000,
+    TLB_       = 0x00004000,
+    MVH_       = 0x00008000,
+    ALL_ATTRIBUTES = 0xffffffffull,
+};
+
+struct Pool {
+    TABLE_ENTRY_TYPE     type;
+    struct Pool          *next_table;
+    int                  next_table_size;
+    int                  instructions_size;
+    uint64               mask;
+    uint64               value;
+    disassembly_function disassembly;
+    conditional_function condition;
+    uint64               attributes;
+};
 
 #define IMGASSERTONCE(test)
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 04f57c26ea..0fd7299900 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -23,57 +23,4 @@
 #ifndef DISAS_NANOMIPS_H
 #define DISAS_NANOMIPS_H
 
-#include <string>
-
-typedef int64_t int64;
-typedef uint64_t uint64;
-typedef uint32_t uint32;
-typedef uint16_t uint16;
-typedef uint64_t img_address;
-
-typedef bool (*conditional_function)(uint64 instruction);
-typedef std::string (*disassembly_function)(uint64 instruction,
-                                            img_address m_pc);
-
-enum TABLE_ENTRY_TYPE {
-    instruction,
-    call_instruction,
-    branch_instruction,
-    return_instruction,
-    reserved_block,
-    pool,
-};
-
-enum TABLE_ATTRIBUTE_TYPE {
-    MIPS64_    = 0x00000001,
-    XNP_       = 0x00000002,
-    XMMS_      = 0x00000004,
-    EVA_       = 0x00000008,
-    DSP_       = 0x00000010,
-    MT_        = 0x00000020,
-    EJTAG_     = 0x00000040,
-    TLBINV_    = 0x00000080,
-    CP0_       = 0x00000100,
-    CP1_       = 0x00000200,
-    CP2_       = 0x00000400,
-    UDI_       = 0x00000800,
-    MCU_       = 0x00001000,
-    VZ_        = 0x00002000,
-    TLB_       = 0x00004000,
-    MVH_       = 0x00008000,
-    ALL_ATTRIBUTES = 0xffffffffull,
-};
-
-struct Pool {
-    TABLE_ENTRY_TYPE     type;
-    struct Pool          *next_table;
-    int                  next_table_size;
-    int                  instructions_size;
-    uint64               mask;
-    uint64               value;
-    disassembly_function disassembly;
-    conditional_function condition;
-    uint64               attributes;
-};
-
 #endif
-- 
2.25.1


