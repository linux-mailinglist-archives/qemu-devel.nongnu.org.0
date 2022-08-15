Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C00592AF0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:21:03 +0200 (CEST)
Received: from localhost ([::1]:34428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNVLK-0006LG-4Z
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUYn-0000Ul-Qs
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:57 -0400
Received: from mail-vi1eur05on2111.outbound.protection.outlook.com
 ([40.107.21.111]:24289 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUYh-00011t-8f
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLyKimDnok1143m35HcyPXBN5Po33jLY4Ppnqb9/grP9TKo0sjwK15+Nhy8Ah20uOp12d4PPNt6ybr89+JKTkytpyCCS/eUGDEQLb1oV6iKwmEoMUfSJZJvW80d8x+9M0mMPyGA/n46n/gyvSgdtpKOGiEQxJQpo9ihJi+5rkK00Ejxh96FOLmoceA0rQ9JDi7QLOh4in9AXEiMVGOBYdN0uoLKSu89psC/ULvHfw1ZlI7O35ERW28NnkOE0e81PKqFlKr96ACZ0+VTyhhIId6xqM6wBGXYrrQbaVjLynYG1zVmra7awtHKyp65BOZV6gyeqBh9TFBgCHFm/YUp0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=368HiiiUUT7+SDj0LbkM1GpDp5W9MyBk1CKOmCZr6ow=;
 b=khDriyVaf04Nj/fiTE+IKVAUW/7EkUhL6AHGqiv+wnrZf4Xn3cA9zDuBT/zNDbZDfk5g61DhQzgKtzcZpafu3HGrCTSL+S+aB0ACCAevlMBMG/aRACWeu5UPwm+FxzgybrwrUZvD5L8V4Ht8zJrsE9A/YQXGx4CwyHfrYPawjRLgc/AiKx5TpLLW8K+iwYVidpUXUFhHE1IcbmuR3esxSgLj/A3RWCDHeFo0ermqfQ5kJXscBF18R85HPviZHru443ILwbRA7Ragj0PcGGH2QyfBv3+KxJ4yK/RdYylHYTbQZxFBXKwYNkpafnkQuyu1BY+s1h3FxDzEd8/rySG6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=368HiiiUUT7+SDj0LbkM1GpDp5W9MyBk1CKOmCZr6ow=;
 b=i2eXbtL3U7qr5wDQzFAMcXCswy+MtNgaLBri7uB8duNNCs0gh+tkGTV/dFZnSGwrq2SIouun4h7jQRNBv2MOV3uFotmgkDvsQBbw/P2JslxSrZry8FIjPHNlLpNWzNbWZgpAQ6deSFpxBI7Quddvr1n5qMqOrf1Yf7bp8HyaAis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM0PR03MB4515.eurprd03.prod.outlook.com (2603:10a6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 07:30:07 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:30:07 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 12/20] disas/nanomips: Replace std::string type
Date: Mon, 15 Aug 2022 09:26:21 +0200
Message-Id: <20220815072629.12865-13-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93bbdb54-b636-4395-d21c-08da7e8ffa3d
X-MS-TrafficTypeDiagnostic: AM0PR03MB4515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H+7X61F3v3ET/Fye8RlckRlAVSKI0xIA6HHH1t4xRobI7Uh+zGudojx68+pNl+u6rpV/SYmRoBES1Ffgmsivx8a5oU7YyF6sqk0MCMghQc4eliWLEL9+KmH8u8uGJ5VPh9vUX9PxbdzRS/mQDqJzuUps+5jdU/c4GRe4q1zOyEja95rkQfgeNOGkI/CoyoubUSEu/Inkz7Ys7rsHa/Fyw/kPoRpaTkPCHq1HzOP5zew5LV4pX64JTn306JzDYqVpHcRu7JLntUuHiWPUBaoNcicd2E1qUWs0BZ9rH2F+BBF/DfcpkCA1OMM9GXd1t3k6QnJM8bGg47YUWIlPx1jokHhTCl9DI/qoghIcnMIKeNO/ENHn4iuyZnSF1fOZCfl1rR489h4uPOHjOhjfmtVI9OuVEfU5H0MTGC77YEXMu6RCFX6HFPnlCKepEYRtW82IujgD+LfYtw/U9EYpqKTh/2U+ZvomGJZGIbc3vvHKmuz2ishBxnfNZMbvUOayaw8HDdK3+yO/XUaUfQt7NqLGD3gr2aWNx2JBeKZAKFYxh9KnT10F9G0eChsabu9IFQZ3jewOTbLaqCPcWzhEIqzcFG2D61psosZthhJ0sOb+HOu2hQpXy/g6kNEeL33WjqJW/cfgB2Pjsx4+2/KIO1PGKxVooDIUGx0KcnbSLDOH4Xnq1Hro9+OF04PuHz5NyAMkMwZWqxG0XLy+HTqKq4sTg/xgoDAjIW0V2qv0VQRaTTSPWri4zWyoVGbo8ePIJoJBcots7Ja0MmQ2YDi+WL8YuferV0cgzf2zlI6ST7jVRj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(366004)(136003)(346002)(376002)(396003)(86362001)(107886003)(186003)(1076003)(2616005)(38350700002)(83380400001)(38100700002)(5660300002)(8936002)(36756003)(66556008)(66476007)(8676002)(4326008)(66946007)(2906002)(30864003)(44832011)(478600001)(41300700001)(52116002)(26005)(6512007)(6506007)(6666004)(6486002)(316002)(6916009)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VVOnBDLwrzWM0WPCaqyVCnrvH6NYNIXAWSjXJ2yFffwzrLPZxzb5bUiFHsDH?=
 =?us-ascii?Q?I9jRQgA+KjLXG7U/Dpb5hle4AjwpZPsCJqAONuN8jLi71VHGM7/ThVna90fX?=
 =?us-ascii?Q?D5TfnV/WngzcD/3HDQFeY3bImyWwFT+IaO/inoYI/L/OY+sjJU4ltESLsKab?=
 =?us-ascii?Q?sBwexO6FB+xYYECl45eMpofoQWEOMQIKCJGZIm30fZrHN6+QpEOVo8VAEsBo?=
 =?us-ascii?Q?GJIgN9nasOZciEgIUh7udnFczAIavTeV60VLKb/yJme9uCewGu8rQ6cXiAay?=
 =?us-ascii?Q?iPbwCcpCetVy1zZ2iLPCSYmFdom2+ddo6Gbdj/nEgZiavaCLBuqwqwLnZMuy?=
 =?us-ascii?Q?bqoyOAXSdGFs4OVeXOOUvEPmc1qWTFBrOUFJJUdQaIhqAjA0O9Btz/tDRVT7?=
 =?us-ascii?Q?pWQyoFkl6hnFhkZcnWmxhtT4XEPSyCgG1sTlJcgJiN5mAp2qLtbZwp40NLkV?=
 =?us-ascii?Q?yy+ectkTPjDYCnyH4aKJx1YNWuuDniqqyA8e56gXA48jul4hdmS6+qbNJ/J7?=
 =?us-ascii?Q?ZAS3R1EM8AEFXjmqX/9yqZOtSIKS2kAHZrGCEs+/tcKHUrtOHOyq7j00vVRs?=
 =?us-ascii?Q?zVgKTA6AwkifSz/Pkv2HWlgze4tpCQxkoIycWSn7wEMOgprgMdrDPTChm1Tc?=
 =?us-ascii?Q?jSdyEzf8Oike8+rXtrA08ypX5OVX4o3U0Ym7F7f/d4l4wmZmcjxl3d25uOAK?=
 =?us-ascii?Q?UYd1e8s2y4mZxWFChFIoHfFv8q1Wz8DKuCp3JK9GWUgwfYKr+q9KU8Ch4gnv?=
 =?us-ascii?Q?stW9oDy1GDhqjYCTDeiTfrNOHjFrWht0sAADMhaIy7tojQs6vWvR3DV4Bl5P?=
 =?us-ascii?Q?7UrgfVYciso1qd2xjJ6SkO8ZCxyP4rgULxJFZfL8XnYcsbnrkL47PM7iOwt7?=
 =?us-ascii?Q?/g8LxBbwWuh97v2DEIJrrP6afFwD+iww+C9PEwrjFiJxYr//6PEfYUzxX8Uk?=
 =?us-ascii?Q?rOj6C3fNq6ABuV3/DGbaUJH3jZOX1GoO5hwtO8y9c4TNM8IC5qf/1IeRdRkQ?=
 =?us-ascii?Q?Jb2ywHXr1Kge0OLH3mc6KxNqjsLTWqdTIL8gKYGC/93v+rrNPoYxEfSvNY1X?=
 =?us-ascii?Q?6ssSseegx5pBLChOQufpY9CgLilYpPdwhglMwjxuNw8PovRg5tRqAa3ikbI2?=
 =?us-ascii?Q?VzvxQBsZmqYLGIcKb7xQekTCiN8nlYG9fSsdPWjmSYyAsL4ummm6t5AQE+L3?=
 =?us-ascii?Q?a6JJCskoUjhiG6s3yAA3ACqDWNNGaXWK9ZYIC+mUMoJA4F2TfZqDt8nigET7?=
 =?us-ascii?Q?LRjzrjZadKvcCdqUYCWzx6aJlVYGNVjQCrG/0nrcG4qj93KmocN1ytpOYv4S?=
 =?us-ascii?Q?8eCZZNkom7vLWSogKdDuLROAV0IC6ZQSgsBj3b4fVYEkSmbp5vU19YBD/bLm?=
 =?us-ascii?Q?EXci3Sxvcfz5Vzx3pFr4O+bG2fBDODL06K7QQMM3WqczS1KxY1kcnYVK9qIi?=
 =?us-ascii?Q?fpnHwKxavvWZD1JOeYo0YVEV8YkNDYoc1AEesG5Cl/JJC/7KBrbk+XyQxtNh?=
 =?us-ascii?Q?zRlVXa3LkYAzkA8GOnRMHtVhbwS6cAezNVSO6ryq3qLE7T6tv27EMDJyDVd7?=
 =?us-ascii?Q?tTFvf++ASFS4RME85pehzhi1xC7cPyr/J539yHqfpMWd1VtEpZFnPqHtMfsG?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bbdb54-b636-4395-d21c-08da7e8ffa3d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:30:07.3562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftMvi8vngbb317Anu619p+gtfuKVo4Qk8N16XlBxycT1nkRECEjt86c7r8auQGJasRXuLtpB0jYF54jBG3Z1Nfa1FNze42NiGVjJW2xP1AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4515
Received-SPF: pass client-ip=40.107.21.111;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

The return type of typedef disassembly_function is changed to
const char * instead of std::string. Therefore, for every particular
disassembly_function function signature is changed.
For example:
- static std::string ABS_D(uint64 instruction) {...} is replaced with
- static const char *ABS_D(uint64 instruction) {...}

Every helper function used to return std::string is changed to return
const char *. This applies to following functions: img_format,
to_string, GPR, save_restore_list, FPR, etc.

Now that we replaced every std::string for const char * or char *, it is
possible to delete multiple versions of the img_format function. The
general version:
- static const char *img_format(const char *format, ...) {...}
can handle all string formatting, so others have been deleted.

Where necessary, strdup() is used to malloc string. Memory leaking needs
to be prevented, so matching free() calls will be added later.

Simple assignments like:
- x = "string"
are handled using the strcpy() function where needed.

String concatenation in the save_restore_list() function is handled
using strcat() function instead of += operator.

Without applying all of these changes, the nanomips disassembler may be
buildable but can't produce the appropriate output, so all of them are
made together.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 4721 ++++++++++++++++++++++----------------------
 1 file changed, 2312 insertions(+), 2409 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 23db8177ef..561e4ff095 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -30,13 +30,11 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 
-#include <cstring>
+#include <string.h>
 #include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>
 
-#include <string>
-
 typedef int64_t int64;
 typedef uint64_t uint64;
 typedef uint32_t uint32;
@@ -44,7 +42,7 @@ typedef uint16_t uint16;
 typedef uint64_t img_address;
 
 typedef bool(*conditional_function)(uint64 instruction);
-typedef std::string(*disassembly_function)(uint64 instruction);
+typedef const char *(*disassembly_function)(uint64 instruction);
 
 enum TABLE_ENTRY_TYPE {
     instruction,
@@ -93,7 +91,7 @@ struct Pool {
 static img_address           m_pc;
 static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
 
-std::string img_format(const char *format, ...)
+static const char *img_format(const char *format, ...)
 {
     char buffer[256];
     va_list args;
@@ -103,112 +101,15 @@ std::string img_format(const char *format, ...)
         perror(buffer);
     }
     va_end(args);
-    return buffer;
+    return strdup(buffer);
 }
 
-std::string img_format(const char *format,
-                   std::string s)
-{
-    char buffer[256];
 
-    sprintf(buffer, format, s.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3,
-                   std::string s4)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                            s4.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3,
-                   std::string s4,
-                   std::string s5)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                            s4.c_str(), s5.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   uint64 d,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, d, s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   uint64 d,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), d, s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   uint64 d)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
-
-    return buffer;
-}
-
-
-std::string to_string(img_address a)
+static const char *to_string(img_address a)
 {
     char buffer[256];
     sprintf(buffer, "0x%" PRIx64, a);
-    return buffer;
+    return strdup(buffer);
 }
 
 
@@ -599,7 +500,7 @@ static uint64 encode_lsb_from_pos_and_size(uint64 d)
 }
 
 
-static std::string GPR(uint64 reg)
+static const char *GPR(uint64 reg)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -617,21 +518,22 @@ static std::string GPR(uint64 reg)
 }
 
 
-static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
+static const char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
 {
-    std::string str;
+    char str[256];
+    str[0] = '\0';
 
     for (uint64 counter = 0; counter != count; counter++) {
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        str += img_format(",%s", GPR(this_rt));
+        strcat(str, img_format(",%s", GPR(this_rt)));
     }
 
-    return str;
+    return strdup(str);
 }
 
 
-static std::string FPR(uint64 reg)
+static const char *FPR(uint64 reg)
 {
     static const char *fpr_reg[32] = {
         "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
@@ -649,7 +551,7 @@ static std::string FPR(uint64 reg)
 }
 
 
-static std::string AC(uint64 reg)
+static const char *AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -664,26 +566,26 @@ static std::string AC(uint64 reg)
 }
 
 
-static std::string IMMEDIATE(uint64 value)
+static const char *IMMEDIATE(uint64 value)
 {
     return img_format("0x%" PRIx64, value);
 }
 
 
-static std::string IMMEDIATE(int64 value)
+static const char *IMMEDIATE(int64 value)
 {
     return img_format("%" PRId64, value);
 }
 
 
-static std::string CPR(uint64 reg)
+static const char *CPR(uint64 reg)
 {
     /* needs more work */
     return img_format("CP%" PRIu64, reg);
 }
 
 
-static std::string ADDRESS(uint64 value, int instruction_size)
+static const char *ADDRESS(uint64 value, int instruction_size)
 {
     /* token for string replace */
     /* const char TOKEN_REPLACE = (char)0xa2; */
@@ -720,7 +622,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      instruction size    - negative is error
  *      disassembly string  - on error will constain error string
  */
-static int Disassemble(const uint16 *data, std::string & dis,
+static int Disassemble(const uint16 *data, char *dis,
                        TABLE_ENTRY_TYPE & type, const Pool *table,
                        int table_size)
 {
@@ -751,25 +653,26 @@ static int Disassemble(const uint16 *data, std::string & dis,
                                  * an ASE attribute and the requested version
                                  * not having that attribute
                                  */
-                                dis = "ASE attribute mismatch";
+                                strcpy(dis, "ASE attribute mismatch");
                                 return -5;
                             }
                             disassembly_function dis_fn = table[i].disassembly;
                             if (dis_fn == 0) {
-                                dis = "disassembler failure - bad table entry";
+                                strcpy(dis,
+                                "disassembler failure - bad table entry");
                                 return -6;
                             }
                             type = table[i].type;
-                            dis = (dis_fn)(op_code);
+                            strcpy(dis, dis_fn(op_code));
                             return table[i].instructions_size;
                         } else {
-                            dis = "reserved instruction";
+                            strcpy(dis, "reserved instruction");
                             return -2;
                         }
                     }
                     catch (std::runtime_error & e)
                     {
-                        dis = e.what();
+                        strcpy(dis, e.what());
                         return -3;          /* runtime error */
                     }
                 }
@@ -778,11 +681,11 @@ static int Disassemble(const uint16 *data, std::string & dis,
     }
     catch (std::exception & e)
     {
-        dis = e.what();
+        strcpy(dis, e.what());
         return -4;          /* runtime error */
     }
 
-    dis = "failed to disassemble";
+    strcpy(dis, "failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
 
@@ -1715,13 +1618,13 @@ static bool SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-static std::string ABS_D(uint64 instruction)
+static const char *ABS_D(uint64 instruction)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1737,13 +1640,13 @@ static std::string ABS_D(uint64 instruction)
  *               fd -----
  *                    fs -----
  */
-static std::string ABS_S(uint64 instruction)
+static const char *ABS_S(uint64 instruction)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1759,13 +1662,13 @@ static std::string ABS_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_PH(uint64 instruction)
+static const char *ABSQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1781,13 +1684,13 @@ static std::string ABSQ_S_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_QB(uint64 instruction)
+static const char *ABSQ_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1803,13 +1706,13 @@ static std::string ABSQ_S_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_W(uint64 instruction)
+static const char *ABSQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1824,15 +1727,15 @@ static std::string ABSQ_S_W(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ACLR(uint64 instruction)
+static const char *ACLR(uint64 instruction)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *bit = IMMEDIATE(copy(bit_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
@@ -1847,15 +1750,15 @@ static std::string ACLR(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADD(uint64 instruction)
+static const char *ADD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
@@ -1872,15 +1775,15 @@ static std::string ADD(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-static std::string ADD_D(uint64 instruction)
+static const char *ADD_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
@@ -1897,15 +1800,15 @@ static std::string ADD_D(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-static std::string ADD_S(uint64 instruction)
+static const char *ADD_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
@@ -1920,15 +1823,15 @@ static std::string ADD_S(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_32_(uint64 instruction)
+static const char *ADDIU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1943,13 +1846,13 @@ static std::string ADDIU_32_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_48_(uint64 instruction)
+static const char *ADDIU_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -1964,13 +1867,13 @@ static std::string ADDIU_48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP48_(uint64 instruction)
+static const char *ADDIU_GP48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
@@ -1985,13 +1888,13 @@ static std::string ADDIU_GP48_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP_B_(uint64 instruction)
+static const char *ADDIU_GP_B_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -2006,13 +1909,13 @@ static std::string ADDIU_GP_B_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP_W_(uint64 instruction)
+static const char *ADDIU_GP_W_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -2027,15 +1930,15 @@ static std::string ADDIU_GP_W_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_NEG_(uint64 instruction)
+static const char *ADDIU_NEG_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -2050,13 +1953,13 @@ static std::string ADDIU_NEG_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_R1_SP_(uint64 instruction)
+static const char *ADDIU_R1_SP_(uint64 instruction)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
@@ -2071,15 +1974,15 @@ static std::string ADDIU_R1_SP_(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_R2_(uint64 instruction)
+static const char *ADDIU_R2_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
@@ -2093,13 +1996,13 @@ static std::string ADDIU_R2_(uint64 instruction)
  *     rt -----
  *           s - ---
  */
-static std::string ADDIU_RS5_(uint64 instruction)
+static const char *ADDIU_RS5_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -2115,13 +2018,13 @@ static std::string ADDIU_RS5_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDIUPC_32_(uint64 instruction)
+static const char *ADDIUPC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2137,13 +2040,13 @@ static std::string ADDIUPC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDIUPC_48_(uint64 instruction)
+static const char *ADDIUPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2159,15 +2062,15 @@ static std::string ADDIUPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_PH(uint64 instruction)
+static const char *ADDQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2184,15 +2087,15 @@ static std::string ADDQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_S_PH(uint64 instruction)
+static const char *ADDQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2208,15 +2111,15 @@ static std::string ADDQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_S_W(uint64 instruction)
+static const char *ADDQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -2233,15 +2136,15 @@ static std::string ADDQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_PH(uint64 instruction)
+static const char *ADDQH_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2258,15 +2161,15 @@ static std::string ADDQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_R_PH(uint64 instruction)
+static const char *ADDQH_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2283,15 +2186,15 @@ static std::string ADDQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_R_W(uint64 instruction)
+static const char *ADDQH_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -2308,15 +2211,15 @@ static std::string ADDQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_W(uint64 instruction)
+static const char *ADDQH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -2332,15 +2235,15 @@ static std::string ADDQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDSC(uint64 instruction)
+static const char *ADDSC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
@@ -2355,15 +2258,15 @@ static std::string ADDSC(uint64 instruction)
  *       rs3 ---
  *          rd3 ---
  */
-static std::string ADDU_16_(uint64 instruction)
+static const char *ADDU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
 
     return img_format("ADDU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -2379,15 +2282,15 @@ static std::string ADDU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_32_(uint64 instruction)
+static const char *ADDU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
@@ -2403,13 +2306,13 @@ static std::string ADDU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_4X4_(uint64 instruction)
+static const char *ADDU_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
     return img_format("ADDU %s, %s", rs4, rt4);
 }
@@ -2425,15 +2328,15 @@ static std::string ADDU_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_PH(uint64 instruction)
+static const char *ADDU_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2449,15 +2352,15 @@ static std::string ADDU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_QB(uint64 instruction)
+static const char *ADDU_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2474,15 +2377,15 @@ static std::string ADDU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_S_PH(uint64 instruction)
+static const char *ADDU_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2498,15 +2401,15 @@ static std::string ADDU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_S_QB(uint64 instruction)
+static const char *ADDU_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2523,15 +2426,15 @@ static std::string ADDU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDUH_QB(uint64 instruction)
+static const char *ADDUH_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2548,15 +2451,15 @@ static std::string ADDUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDUH_R_QB(uint64 instruction)
+static const char *ADDUH_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2571,15 +2474,15 @@ static std::string ADDUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ADDWC(uint64 instruction)
+static const char *ADDWC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
@@ -2595,13 +2498,13 @@ static std::string ADDWC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ALUIPC(uint64 instruction)
+static const char *ALUIPC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2616,13 +2519,13 @@ static std::string ALUIPC(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-static std::string AND_16_(uint64 instruction)
+static const char *AND_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("AND %s, %s", rs3, rt3);
 }
@@ -2638,15 +2541,15 @@ static std::string AND_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string AND_32_(uint64 instruction)
+static const char *AND_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("AND %s, %s, %s", rd, rs, rt);
 }
@@ -2661,15 +2564,15 @@ static std::string AND_32_(uint64 instruction)
  *       rs3 ---
  *           eu ----
  */
-static std::string ANDI_16_(uint64 instruction)
+static const char *ANDI_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 eu_value = extract_eu_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
 
     return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
 }
@@ -2685,15 +2588,15 @@ static std::string ANDI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ANDI_32_(uint64 instruction)
+static const char *ANDI_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
@@ -2709,15 +2612,15 @@ static std::string ANDI_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string APPEND(uint64 instruction)
+static const char *APPEND(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
@@ -2733,15 +2636,15 @@ static std::string APPEND(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ASET(uint64 instruction)
+static const char *ASET(uint64 instruction)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *bit = IMMEDIATE(copy(bit_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
@@ -2757,11 +2660,11 @@ static std::string ASET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BALC_16_(uint64 instruction)
+static const char *BALC_16_(uint64 instruction)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
     return img_format("BALC %s", s);
 }
@@ -2777,11 +2680,11 @@ static std::string BALC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BALC_32_(uint64 instruction)
+static const char *BALC_32_(uint64 instruction)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BALC %s", s);
 }
@@ -2797,13 +2700,13 @@ static std::string BALC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BALRSC(uint64 instruction)
+static const char *BALRSC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2819,15 +2722,15 @@ static std::string BALRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BBEQZC(uint64 instruction)
+static const char *BBEQZC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *bit = IMMEDIATE(copy(bit_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2843,15 +2746,15 @@ static std::string BBEQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BBNEZC(uint64 instruction)
+static const char *BBNEZC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *bit = IMMEDIATE(copy(bit_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2867,11 +2770,11 @@ static std::string BBNEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BC_16_(uint64 instruction)
+static const char *BC_16_(uint64 instruction)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
     return img_format("BC %s", s);
 }
@@ -2887,11 +2790,11 @@ static std::string BC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BC_32_(uint64 instruction)
+static const char *BC_32_(uint64 instruction)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BC %s", s);
 }
@@ -2907,13 +2810,13 @@ static std::string BC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BC1EQZC(uint64 instruction)
+static const char *BC1EQZC(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ft = FPR(copy(ft_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2929,13 +2832,13 @@ static std::string BC1EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BC1NEZC(uint64 instruction)
+static const char *BC1NEZC(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ft = FPR(copy(ft_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2951,13 +2854,13 @@ static std::string BC1NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BC2EQZC(uint64 instruction)
+static const char *BC2EQZC(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ct = CPR(copy(ct_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -2973,13 +2876,13 @@ static std::string BC2EQZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BC2NEZC(uint64 instruction)
+static const char *BC2NEZC(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *ct = CPR(copy(ct_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -2995,15 +2898,15 @@ static std::string BC2NEZC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BEQC_16_(uint64 instruction)
+static const char *BEQC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = ADDRESS(encode_u_from_address(u_value), 2);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -3019,15 +2922,15 @@ static std::string BEQC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BEQC_32_(uint64 instruction)
+static const char *BEQC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -3043,15 +2946,15 @@ static std::string BEQC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BEQIC(uint64 instruction)
+static const char *BEQIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -3067,13 +2970,13 @@ static std::string BEQIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BEQZC_16_(uint64 instruction)
+static const char *BEQZC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -3089,15 +2992,15 @@ static std::string BEQZC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BGEC(uint64 instruction)
+static const char *BGEC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3113,15 +3016,15 @@ static std::string BGEC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BGEIC(uint64 instruction)
+static const char *BGEIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3137,15 +3040,15 @@ static std::string BGEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BGEIUC(uint64 instruction)
+static const char *BGEIUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3161,15 +3064,15 @@ static std::string BGEIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BGEUC(uint64 instruction)
+static const char *BGEUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3185,15 +3088,15 @@ static std::string BGEUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BLTC(uint64 instruction)
+static const char *BLTC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3209,15 +3112,15 @@ static std::string BLTC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BLTIC(uint64 instruction)
+static const char *BLTIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3233,15 +3136,15 @@ static std::string BLTIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BLTIUC(uint64 instruction)
+static const char *BLTIUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3257,15 +3160,15 @@ static std::string BLTIUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BLTUC(uint64 instruction)
+static const char *BLTUC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3281,15 +3184,15 @@ static std::string BLTUC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BNEC_16_(uint64 instruction)
+static const char *BNEC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = ADDRESS(encode_u_from_address(u_value), 2);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3305,15 +3208,15 @@ static std::string BNEC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BNEC_32_(uint64 instruction)
+static const char *BNEC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3329,15 +3232,15 @@ static std::string BNEC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BNEIC(uint64 instruction)
+static const char *BNEIC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3353,13 +3256,13 @@ static std::string BNEIC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BNEZC_16_(uint64 instruction)
+static const char *BNEZC_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 2);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3375,11 +3278,11 @@ static std::string BNEZC_16_(uint64 instruction)
  *            s[13:1] -------------
  *                           s[14] -
  */
-static std::string BPOSGE32C(uint64 instruction)
+static const char *BPOSGE32C(uint64 instruction)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3395,11 +3298,11 @@ static std::string BPOSGE32C(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BREAK_16_(uint64 instruction)
+static const char *BREAK_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3415,11 +3318,11 @@ static std::string BREAK_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BREAK_32_(uint64 instruction)
+static const char *BREAK_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3435,11 +3338,11 @@ static std::string BREAK_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string BRSC(uint64 instruction)
+static const char *BRSC(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("BRSC %s", rs);
 }
@@ -3455,15 +3358,15 @@ static std::string BRSC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CACHE(uint64 instruction)
+static const char *CACHE(uint64 instruction)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *op = IMMEDIATE(copy(op_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
@@ -3479,15 +3382,15 @@ static std::string CACHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CACHEE(uint64 instruction)
+static const char *CACHEE(uint64 instruction)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *op = IMMEDIATE(copy(op_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
@@ -3503,13 +3406,13 @@ static std::string CACHEE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_L_D(uint64 instruction)
+static const char *CEIL_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3525,13 +3428,13 @@ static std::string CEIL_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_L_S(uint64 instruction)
+static const char *CEIL_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3547,13 +3450,13 @@ static std::string CEIL_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_W_D(uint64 instruction)
+static const char *CEIL_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3569,13 +3472,13 @@ static std::string CEIL_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_W_S(uint64 instruction)
+static const char *CEIL_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3591,13 +3494,13 @@ static std::string CEIL_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CFC1(uint64 instruction)
+static const char *CFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("CFC1 %s, %s", rt, cs);
 }
@@ -3613,13 +3516,13 @@ static std::string CFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CFC2(uint64 instruction)
+static const char *CFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("CFC2 %s, %s", rt, cs);
 }
@@ -3635,13 +3538,13 @@ static std::string CFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CLASS_D(uint64 instruction)
+static const char *CLASS_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3657,13 +3560,13 @@ static std::string CLASS_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CLASS_S(uint64 instruction)
+static const char *CLASS_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3679,13 +3582,13 @@ static std::string CLASS_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CLO(uint64 instruction)
+static const char *CLO(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3701,13 +3604,13 @@ static std::string CLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CLZ(uint64 instruction)
+static const char *CLZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3723,15 +3626,15 @@ static std::string CLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_AF_D(uint64 instruction)
+static const char *CMP_AF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3747,15 +3650,15 @@ static std::string CMP_AF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_AF_S(uint64 instruction)
+static const char *CMP_AF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3771,15 +3674,15 @@ static std::string CMP_AF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_EQ_D(uint64 instruction)
+static const char *CMP_EQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3794,13 +3697,13 @@ static std::string CMP_EQ_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_EQ_PH(uint64 instruction)
+static const char *CMP_EQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3816,15 +3719,15 @@ static std::string CMP_EQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_EQ_S(uint64 instruction)
+static const char *CMP_EQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3840,15 +3743,15 @@ static std::string CMP_EQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LE_D(uint64 instruction)
+static const char *CMP_LE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3863,13 +3766,13 @@ static std::string CMP_LE_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_LE_PH(uint64 instruction)
+static const char *CMP_LE_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3885,15 +3788,15 @@ static std::string CMP_LE_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LE_S(uint64 instruction)
+static const char *CMP_LE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3909,15 +3812,15 @@ static std::string CMP_LE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LT_D(uint64 instruction)
+static const char *CMP_LT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
@@ -3932,13 +3835,13 @@ static std::string CMP_LT_D(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_LT_PH(uint64 instruction)
+static const char *CMP_LT_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3954,15 +3857,15 @@ static std::string CMP_LT_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LT_S(uint64 instruction)
+static const char *CMP_LT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
@@ -3978,15 +3881,15 @@ static std::string CMP_LT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_NE_D(uint64 instruction)
+static const char *CMP_NE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4002,15 +3905,15 @@ static std::string CMP_NE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_NE_S(uint64 instruction)
+static const char *CMP_NE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4026,15 +3929,15 @@ static std::string CMP_NE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_OR_D(uint64 instruction)
+static const char *CMP_OR_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4050,15 +3953,15 @@ static std::string CMP_OR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_OR_S(uint64 instruction)
+static const char *CMP_OR_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4074,15 +3977,15 @@ static std::string CMP_OR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SAF_D(uint64 instruction)
+static const char *CMP_SAF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
@@ -4098,15 +4001,15 @@ static std::string CMP_SAF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SAF_S(uint64 instruction)
+static const char *CMP_SAF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
@@ -4122,15 +4025,15 @@ static std::string CMP_SAF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SEQ_D(uint64 instruction)
+static const char *CMP_SEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4146,15 +4049,15 @@ static std::string CMP_SEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SEQ_S(uint64 instruction)
+static const char *CMP_SEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4170,15 +4073,15 @@ static std::string CMP_SEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLE_D(uint64 instruction)
+static const char *CMP_SLE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4194,15 +4097,15 @@ static std::string CMP_SLE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLE_S(uint64 instruction)
+static const char *CMP_SLE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4218,15 +4121,15 @@ static std::string CMP_SLE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLT_D(uint64 instruction)
+static const char *CMP_SLT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4242,15 +4145,15 @@ static std::string CMP_SLT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLT_S(uint64 instruction)
+static const char *CMP_SLT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4266,15 +4169,15 @@ static std::string CMP_SLT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SNE_D(uint64 instruction)
+static const char *CMP_SNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4290,15 +4193,15 @@ static std::string CMP_SNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SNE_S(uint64 instruction)
+static const char *CMP_SNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4314,15 +4217,15 @@ static std::string CMP_SNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SOR_D(uint64 instruction)
+static const char *CMP_SOR_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4338,15 +4241,15 @@ static std::string CMP_SOR_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SOR_S(uint64 instruction)
+static const char *CMP_SOR_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4362,15 +4265,15 @@ static std::string CMP_SOR_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUEQ_D(uint64 instruction)
+static const char *CMP_SUEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4386,15 +4289,15 @@ static std::string CMP_SUEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUEQ_S(uint64 instruction)
+static const char *CMP_SUEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4410,15 +4313,15 @@ static std::string CMP_SUEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULE_D(uint64 instruction)
+static const char *CMP_SULE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4434,15 +4337,15 @@ static std::string CMP_SULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULE_S(uint64 instruction)
+static const char *CMP_SULE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4458,15 +4361,15 @@ static std::string CMP_SULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULT_D(uint64 instruction)
+static const char *CMP_SULT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4482,15 +4385,15 @@ static std::string CMP_SULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULT_S(uint64 instruction)
+static const char *CMP_SULT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4506,15 +4409,15 @@ static std::string CMP_SULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUN_D(uint64 instruction)
+static const char *CMP_SUN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4530,15 +4433,15 @@ static std::string CMP_SUN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUNE_D(uint64 instruction)
+static const char *CMP_SUNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4554,15 +4457,15 @@ static std::string CMP_SUNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUNE_S(uint64 instruction)
+static const char *CMP_SUNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4578,15 +4481,15 @@ static std::string CMP_SUNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUN_S(uint64 instruction)
+static const char *CMP_SUN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4602,15 +4505,15 @@ static std::string CMP_SUN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UEQ_D(uint64 instruction)
+static const char *CMP_UEQ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4626,15 +4529,15 @@ static std::string CMP_UEQ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UEQ_S(uint64 instruction)
+static const char *CMP_UEQ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4650,15 +4553,15 @@ static std::string CMP_UEQ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULE_D(uint64 instruction)
+static const char *CMP_ULE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4674,15 +4577,15 @@ static std::string CMP_ULE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULE_S(uint64 instruction)
+static const char *CMP_ULE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4698,15 +4601,15 @@ static std::string CMP_ULE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULT_D(uint64 instruction)
+static const char *CMP_ULT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4722,15 +4625,15 @@ static std::string CMP_ULT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULT_S(uint64 instruction)
+static const char *CMP_ULT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4746,15 +4649,15 @@ static std::string CMP_ULT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UN_D(uint64 instruction)
+static const char *CMP_UN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4770,15 +4673,15 @@ static std::string CMP_UN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UNE_D(uint64 instruction)
+static const char *CMP_UNE_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4794,15 +4697,15 @@ static std::string CMP_UNE_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UNE_S(uint64 instruction)
+static const char *CMP_UNE_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4818,15 +4721,15 @@ static std::string CMP_UNE_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UN_S(uint64 instruction)
+static const char *CMP_UN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4843,15 +4746,15 @@ static std::string CMP_UN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_EQ_QB(uint64 instruction)
+static const char *CMPGDU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4868,15 +4771,15 @@ static std::string CMPGDU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_LE_QB(uint64 instruction)
+static const char *CMPGDU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4893,15 +4796,15 @@ static std::string CMPGDU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_LT_QB(uint64 instruction)
+static const char *CMPGDU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4918,15 +4821,15 @@ static std::string CMPGDU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_EQ_QB(uint64 instruction)
+static const char *CMPGU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4943,15 +4846,15 @@ static std::string CMPGU_EQ_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_LE_QB(uint64 instruction)
+static const char *CMPGU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4968,15 +4871,15 @@ static std::string CMPGU_LE_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_LT_QB(uint64 instruction)
+static const char *CMPGU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4992,13 +4895,13 @@ static std::string CMPGU_LT_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_EQ_QB(uint64 instruction)
+static const char *CMPU_EQ_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -5014,13 +4917,13 @@ static std::string CMPU_EQ_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_LE_QB(uint64 instruction)
+static const char *CMPU_LE_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -5036,13 +4939,13 @@ static std::string CMPU_LE_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_LT_QB(uint64 instruction)
+static const char *CMPU_LT_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -5058,11 +4961,11 @@ static std::string CMPU_LT_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string COP2_1(uint64 instruction)
+static const char *COP2_1(uint64 instruction)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    std::string cofun = IMMEDIATE(copy(cofun_value));
+    const char *cofun = IMMEDIATE(copy(cofun_value));
 
     return img_format("COP2_1 %s", cofun);
 }
@@ -5078,13 +4981,13 @@ static std::string COP2_1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CTC1(uint64 instruction)
+static const char *CTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("CTC1 %s, %s", rt, cs);
 }
@@ -5100,13 +5003,13 @@ static std::string CTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CTC2(uint64 instruction)
+static const char *CTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("CTC2 %s, %s", rt, cs);
 }
@@ -5122,13 +5025,13 @@ static std::string CTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_L(uint64 instruction)
+static const char *CVT_D_L(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -5144,13 +5047,13 @@ static std::string CVT_D_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_S(uint64 instruction)
+static const char *CVT_D_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -5166,13 +5069,13 @@ static std::string CVT_D_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_W(uint64 instruction)
+static const char *CVT_D_W(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -5188,13 +5091,13 @@ static std::string CVT_D_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_L_D(uint64 instruction)
+static const char *CVT_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5210,13 +5113,13 @@ static std::string CVT_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_L_S(uint64 instruction)
+static const char *CVT_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5232,13 +5135,13 @@ static std::string CVT_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_D(uint64 instruction)
+static const char *CVT_S_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5254,13 +5157,13 @@ static std::string CVT_S_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_L(uint64 instruction)
+static const char *CVT_S_L(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5276,13 +5179,13 @@ static std::string CVT_S_L(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_PL(uint64 instruction)
+static const char *CVT_S_PL(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5298,13 +5201,13 @@ static std::string CVT_S_PL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_PU(uint64 instruction)
+static const char *CVT_S_PU(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5320,13 +5223,13 @@ static std::string CVT_S_PU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_W(uint64 instruction)
+static const char *CVT_S_W(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5342,13 +5245,13 @@ static std::string CVT_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_W_D(uint64 instruction)
+static const char *CVT_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5364,13 +5267,13 @@ static std::string CVT_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_W_S(uint64 instruction)
+static const char *CVT_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5386,13 +5289,13 @@ static std::string CVT_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_48_(uint64 instruction)
+static const char *DADDIU_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("DADDIU %s, %s", rt, s);
 }
@@ -5408,15 +5311,15 @@ static std::string DADDIU_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_NEG_(uint64 instruction)
+static const char *DADDIU_NEG_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5432,15 +5335,15 @@ static std::string DADDIU_NEG_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_U12_(uint64 instruction)
+static const char *DADDIU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5456,15 +5359,15 @@ static std::string DADDIU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DADD(uint64 instruction)
+static const char *DADD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
@@ -5480,15 +5383,15 @@ static std::string DADD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DADDU(uint64 instruction)
+static const char *DADDU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
@@ -5504,13 +5407,13 @@ static std::string DADDU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DCLO(uint64 instruction)
+static const char *DCLO(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5526,13 +5429,13 @@ static std::string DCLO(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DCLZ(uint64 instruction)
+static const char *DCLZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5548,15 +5451,15 @@ static std::string DCLZ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DDIV(uint64 instruction)
+static const char *DDIV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
@@ -5572,15 +5475,15 @@ static std::string DDIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DDIVU(uint64 instruction)
+static const char *DDIVU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5596,7 +5499,7 @@ static std::string DDIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DERET(uint64 instruction)
+static const char *DERET(uint64 instruction)
 {
     (void)instruction;
 
@@ -5614,17 +5517,17 @@ static std::string DERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DEXTM(uint64 instruction)
+static const char *DEXTM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *lsb = IMMEDIATE(copy(lsb_value));
+    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5640,17 +5543,17 @@ static std::string DEXTM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DEXT(uint64 instruction)
+static const char *DEXT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *lsb = IMMEDIATE(copy(lsb_value));
+    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5666,17 +5569,17 @@ static std::string DEXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DEXTU(uint64 instruction)
+static const char *DEXTU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *lsb = IMMEDIATE(copy(lsb_value));
+    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5692,17 +5595,17 @@ static std::string DEXTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DINSM(uint64 instruction)
+static const char *DINSM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
@@ -5720,17 +5623,17 @@ static std::string DINSM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DINS(uint64 instruction)
+static const char *DINS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
@@ -5748,17 +5651,17 @@ static std::string DINS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DINSU(uint64 instruction)
+static const char *DINSU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
@@ -5776,11 +5679,11 @@ static std::string DINSU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DI(uint64 instruction)
+static const char *DI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DI %s", rt);
 }
@@ -5796,15 +5699,15 @@ static std::string DI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DIV(uint64 instruction)
+static const char *DIV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
@@ -5820,15 +5723,15 @@ static std::string DIV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DIV_D(uint64 instruction)
+static const char *DIV_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
@@ -5844,15 +5747,15 @@ static std::string DIV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DIV_S(uint64 instruction)
+static const char *DIV_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
@@ -5868,15 +5771,15 @@ static std::string DIV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DIVU(uint64 instruction)
+static const char *DIVU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5892,17 +5795,17 @@ static std::string DIVU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DLSA(uint64 instruction)
+static const char *DLSA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u2 = IMMEDIATE(copy(u2_value));
 
     return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -5918,13 +5821,13 @@ static std::string DLSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DLUI_48_(uint64 instruction)
+static const char *DLUI_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("DLUI %s, %s", rt, u);
 }
@@ -5940,15 +5843,15 @@ static std::string DLUI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC0(uint64 instruction)
+static const char *DMFC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5964,13 +5867,13 @@ static std::string DMFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC1(uint64 instruction)
+static const char *DMFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -5986,13 +5889,13 @@ static std::string DMFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC2(uint64 instruction)
+static const char *DMFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("DMFC2 %s, %s", rt, cs);
 }
@@ -6008,15 +5911,15 @@ static std::string DMFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMFGC0(uint64 instruction)
+static const char *DMFGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6032,15 +5935,15 @@ static std::string DMFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMOD(uint64 instruction)
+static const char *DMOD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
@@ -6056,15 +5959,15 @@ static std::string DMOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMODU(uint64 instruction)
+static const char *DMODU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
@@ -6080,15 +5983,15 @@ static std::string DMODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC0(uint64 instruction)
+static const char *DMTC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6104,13 +6007,13 @@ static std::string DMTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC1(uint64 instruction)
+static const char *DMTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -6126,13 +6029,13 @@ static std::string DMTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC2(uint64 instruction)
+static const char *DMTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("DMTC2 %s, %s", rt, cs);
 }
@@ -6148,15 +6051,15 @@ static std::string DMTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMTGC0(uint64 instruction)
+static const char *DMTGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6172,11 +6075,11 @@ static std::string DMTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMT(uint64 instruction)
+static const char *DMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMT %s", rt);
 }
@@ -6192,15 +6095,15 @@ static std::string DMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMUH(uint64 instruction)
+static const char *DMUH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
@@ -6216,15 +6119,15 @@ static std::string DMUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMUHU(uint64 instruction)
+static const char *DMUHU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
@@ -6240,15 +6143,15 @@ static std::string DMUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMUL(uint64 instruction)
+static const char *DMUL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
@@ -6264,15 +6167,15 @@ static std::string DMUL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DMULU(uint64 instruction)
+static const char *DMULU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
@@ -6289,15 +6192,15 @@ static std::string DMULU(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string DPA_W_PH(uint64 instruction)
+static const char *DPA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6313,15 +6216,15 @@ static std::string DPA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQ_SA_L_W(uint64 instruction)
+static const char *DPAQ_SA_L_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6337,15 +6240,15 @@ static std::string DPAQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQ_S_W_PH(uint64 instruction)
+static const char *DPAQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6361,15 +6264,15 @@ static std::string DPAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQX_SA_W_PH(uint64 instruction)
+static const char *DPAQX_SA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6385,15 +6288,15 @@ static std::string DPAQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQX_S_W_PH(uint64 instruction)
+static const char *DPAQX_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6409,15 +6312,15 @@ static std::string DPAQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPAU_H_QBL(uint64 instruction)
+static const char *DPAU_H_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6433,15 +6336,15 @@ static std::string DPAU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPAU_H_QBR(uint64 instruction)
+static const char *DPAU_H_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6457,15 +6360,15 @@ static std::string DPAU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPAX_W_PH(uint64 instruction)
+static const char *DPAX_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6481,15 +6384,15 @@ static std::string DPAX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPS_W_PH(uint64 instruction)
+static const char *DPS_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6505,15 +6408,15 @@ static std::string DPS_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQ_SA_L_W(uint64 instruction)
+static const char *DPSQ_SA_L_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6529,15 +6432,15 @@ static std::string DPSQ_SA_L_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQ_S_W_PH(uint64 instruction)
+static const char *DPSQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6553,15 +6456,15 @@ static std::string DPSQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQX_SA_W_PH(uint64 instruction)
+static const char *DPSQX_SA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6577,15 +6480,15 @@ static std::string DPSQX_SA_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQX_S_W_PH(uint64 instruction)
+static const char *DPSQX_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6601,15 +6504,15 @@ static std::string DPSQX_S_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPSU_H_QBL(uint64 instruction)
+static const char *DPSU_H_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6625,15 +6528,15 @@ static std::string DPSU_H_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPSU_H_QBR(uint64 instruction)
+static const char *DPSU_H_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6649,15 +6552,15 @@ static std::string DPSU_H_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DPSX_W_PH(uint64 instruction)
+static const char *DPSX_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6673,15 +6576,15 @@ static std::string DPSX_W_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DROTR(uint64 instruction)
+static const char *DROTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
@@ -6697,15 +6600,15 @@ static std::string DROTR(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-static std::string DROTR32(uint64 instruction)
+static const char *DROTR32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
@@ -6721,15 +6624,15 @@ static std::string DROTR32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DROTRV(uint64 instruction)
+static const char *DROTRV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -6745,17 +6648,17 @@ static std::string DROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DROTX(uint64 instruction)
+static const char *DROTX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *shiftx = IMMEDIATE(copy(shiftx_value));
 
     return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
@@ -6771,15 +6674,15 @@ static std::string DROTX(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-static std::string DSLL(uint64 instruction)
+static const char *DSLL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
@@ -6795,15 +6698,15 @@ static std::string DSLL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-static std::string DSLL32(uint64 instruction)
+static const char *DSLL32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6819,15 +6722,15 @@ static std::string DSLL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DSLLV(uint64 instruction)
+static const char *DSLLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
@@ -6843,15 +6746,15 @@ static std::string DSLLV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRA(uint64 instruction)
+static const char *DSRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
@@ -6867,15 +6770,15 @@ static std::string DSRA(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRA32(uint64 instruction)
+static const char *DSRA32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
@@ -6891,15 +6794,15 @@ static std::string DSRA32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DSRAV(uint64 instruction)
+static const char *DSRAV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
@@ -6915,15 +6818,15 @@ static std::string DSRAV(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRL(uint64 instruction)
+static const char *DSRL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
@@ -6939,15 +6842,15 @@ static std::string DSRL(uint64 instruction)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRL32(uint64 instruction)
+static const char *DSRL32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6963,15 +6866,15 @@ static std::string DSRL32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DSRLV(uint64 instruction)
+static const char *DSRLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
@@ -6987,15 +6890,15 @@ static std::string DSRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DSUB(uint64 instruction)
+static const char *DSUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
@@ -7011,15 +6914,15 @@ static std::string DSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DSUBU(uint64 instruction)
+static const char *DSUBU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
@@ -7035,11 +6938,11 @@ static std::string DSUBU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DVPE(uint64 instruction)
+static const char *DVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DVPE %s", rt);
 }
@@ -7055,11 +6958,11 @@ static std::string DVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string DVP(uint64 instruction)
+static const char *DVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DVP %s", rt);
 }
@@ -7075,7 +6978,7 @@ static std::string DVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EHB(uint64 instruction)
+static const char *EHB(uint64 instruction)
 {
     (void)instruction;
 
@@ -7093,11 +6996,11 @@ static std::string EHB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EI(uint64 instruction)
+static const char *EI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EI %s", rt);
 }
@@ -7113,11 +7016,11 @@ static std::string EI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EMT(uint64 instruction)
+static const char *EMT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EMT %s", rt);
 }
@@ -7133,7 +7036,7 @@ static std::string EMT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ERET(uint64 instruction)
+static const char *ERET(uint64 instruction)
 {
     (void)instruction;
 
@@ -7151,7 +7054,7 @@ static std::string ERET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ERETNC(uint64 instruction)
+static const char *ERETNC(uint64 instruction)
 {
     (void)instruction;
 
@@ -7169,11 +7072,11 @@ static std::string ERETNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EVP(uint64 instruction)
+static const char *EVP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EVP %s", rt);
 }
@@ -7189,11 +7092,11 @@ static std::string EVP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EVPE(uint64 instruction)
+static const char *EVPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EVPE %s", rt);
 }
@@ -7209,17 +7112,17 @@ static std::string EVPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EXT(uint64 instruction)
+static const char *EXT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *lsb = IMMEDIATE(copy(lsb_value));
+    const char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -7235,17 +7138,17 @@ static std::string EXT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EXTD(uint64 instruction)
+static const char *EXTD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7261,17 +7164,17 @@ static std::string EXTD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EXTD32(uint64 instruction)
+static const char *EXTD32(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7287,15 +7190,15 @@ static std::string EXTD32(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPDP(uint64 instruction)
+static const char *EXTPDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *size = IMMEDIATE(copy(size_value));
 
     return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
@@ -7311,15 +7214,15 @@ static std::string EXTPDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPDPV(uint64 instruction)
+static const char *EXTPDPV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
@@ -7335,15 +7238,15 @@ static std::string EXTPDPV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EXTP(uint64 instruction)
+static const char *EXTP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *size = IMMEDIATE(copy(size_value));
 
     return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
@@ -7359,15 +7262,15 @@ static std::string EXTP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPV(uint64 instruction)
+static const char *EXTPV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
@@ -7384,15 +7287,15 @@ static std::string EXTPV(uint64 instruction)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_RS_W(uint64 instruction)
+static const char *EXTR_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
@@ -7409,15 +7312,15 @@ static std::string EXTR_RS_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_R_W(uint64 instruction)
+static const char *EXTR_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
@@ -7434,15 +7337,15 @@ static std::string EXTR_R_W(uint64 instruction)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_S_H(uint64 instruction)
+static const char *EXTR_S_H(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
@@ -7459,15 +7362,15 @@ static std::string EXTR_S_H(uint64 instruction)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_W(uint64 instruction)
+static const char *EXTR_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
@@ -7484,15 +7387,15 @@ static std::string EXTR_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_RS_W(uint64 instruction)
+static const char *EXTRV_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
@@ -7509,15 +7412,15 @@ static std::string EXTRV_RS_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_R_W(uint64 instruction)
+static const char *EXTRV_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
@@ -7534,15 +7437,15 @@ static std::string EXTRV_R_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_S_H(uint64 instruction)
+static const char *EXTRV_S_H(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
@@ -7559,15 +7462,15 @@ static std::string EXTRV_S_H(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_W(uint64 instruction)
+static const char *EXTRV_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
@@ -7584,17 +7487,17 @@ static std::string EXTRV_W(uint64 instruction)
  *               rd -----
  *                 shift -----
  */
-static std::string EXTW(uint64 instruction)
+static const char *EXTW(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7610,13 +7513,13 @@ static std::string EXTW(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_L_D(uint64 instruction)
+static const char *FLOOR_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7632,13 +7535,13 @@ static std::string FLOOR_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_L_S(uint64 instruction)
+static const char *FLOOR_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7654,13 +7557,13 @@ static std::string FLOOR_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_W_D(uint64 instruction)
+static const char *FLOOR_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7676,13 +7579,13 @@ static std::string FLOOR_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_W_S(uint64 instruction)
+static const char *FLOOR_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7698,15 +7601,15 @@ static std::string FLOOR_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string FORK(uint64 instruction)
+static const char *FORK(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
@@ -7722,11 +7625,11 @@ static std::string FORK(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string HYPCALL(uint64 instruction)
+static const char *HYPCALL(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7742,11 +7645,11 @@ static std::string HYPCALL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string HYPCALL_16_(uint64 instruction)
+static const char *HYPCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7762,17 +7665,17 @@ static std::string HYPCALL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string INS(uint64 instruction)
+static const char *INS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    const char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
@@ -7789,13 +7692,13 @@ static std::string INS(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string INSV(uint64 instruction)
+static const char *INSV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7811,7 +7714,7 @@ static std::string INSV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string IRET(uint64 instruction)
+static const char *IRET(uint64 instruction)
 {
     (void)instruction;
 
@@ -7829,11 +7732,11 @@ static std::string IRET(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_16_(uint64 instruction)
+static const char *JALRC_16_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7849,13 +7752,13 @@ static std::string JALRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_32_(uint64 instruction)
+static const char *JALRC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7871,13 +7774,13 @@ static std::string JALRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_HB(uint64 instruction)
+static const char *JALRC_HB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7893,11 +7796,11 @@ static std::string JALRC_HB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string JRC(uint64 instruction)
+static const char *JRC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("JRC %s", rt);
 }
@@ -7913,15 +7816,15 @@ static std::string JRC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LB_16_(uint64 instruction)
+static const char *LB_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LB %s, %s(%s)", rt3, u, rs3);
 }
@@ -7937,13 +7840,13 @@ static std::string LB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LB_GP_(uint64 instruction)
+static const char *LB_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LB %s, %s($%d)", rt, u, 28);
 }
@@ -7959,15 +7862,15 @@ static std::string LB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LB_S9_(uint64 instruction)
+static const char *LB_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, s, rs);
 }
@@ -7983,15 +7886,15 @@ static std::string LB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LB_U12_(uint64 instruction)
+static const char *LB_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, u, rs);
 }
@@ -8007,15 +7910,15 @@ static std::string LB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBE(uint64 instruction)
+static const char *LBE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
@@ -8031,15 +7934,15 @@ static std::string LBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_16_(uint64 instruction)
+static const char *LBU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LBU %s, %s(%s)", rt3, u, rs3);
 }
@@ -8055,13 +7958,13 @@ static std::string LBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_GP_(uint64 instruction)
+static const char *LBU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
@@ -8077,15 +7980,15 @@ static std::string LBU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_S9_(uint64 instruction)
+static const char *LBU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
@@ -8101,15 +8004,15 @@ static std::string LBU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_U12_(uint64 instruction)
+static const char *LBU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
@@ -8125,15 +8028,15 @@ static std::string LBU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBUE(uint64 instruction)
+static const char *LBUE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
@@ -8149,15 +8052,15 @@ static std::string LBUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBUX(uint64 instruction)
+static const char *LBUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8173,15 +8076,15 @@ static std::string LBUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LBX(uint64 instruction)
+static const char *LBX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
@@ -8197,13 +8100,13 @@ static std::string LBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LD_GP_(uint64 instruction)
+static const char *LD_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LD %s, %s($%d)", rt, u, 28);
 }
@@ -8219,15 +8122,15 @@ static std::string LD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LD_S9_(uint64 instruction)
+static const char *LD_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, s, rs);
 }
@@ -8243,15 +8146,15 @@ static std::string LD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LD_U12_(uint64 instruction)
+static const char *LD_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, u, rs);
 }
@@ -8267,13 +8170,13 @@ static std::string LD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_GP_(uint64 instruction)
+static const char *LDC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -8289,15 +8192,15 @@ static std::string LDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_S9_(uint64 instruction)
+static const char *LDC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -8313,15 +8216,15 @@ static std::string LDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_U12_(uint64 instruction)
+static const char *LDC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -8337,15 +8240,15 @@ static std::string LDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1XS(uint64 instruction)
+static const char *LDC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -8361,15 +8264,15 @@ static std::string LDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1X(uint64 instruction)
+static const char *LDC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -8385,15 +8288,15 @@ static std::string LDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDC2(uint64 instruction)
+static const char *LDC2(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ct = CPR(copy(ct_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
@@ -8409,17 +8312,17 @@ static std::string LDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDM(uint64 instruction)
+static const char *LDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -8435,13 +8338,13 @@ static std::string LDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDPC_48_(uint64 instruction)
+static const char *LDPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8457,15 +8360,15 @@ static std::string LDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDX(uint64 instruction)
+static const char *LDX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
@@ -8481,15 +8384,15 @@ static std::string LDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LDXS(uint64 instruction)
+static const char *LDXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8505,15 +8408,15 @@ static std::string LDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LH_16_(uint64 instruction)
+static const char *LH_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LH %s, %s(%s)", rt3, u, rs3);
 }
@@ -8529,13 +8432,13 @@ static std::string LH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LH_GP_(uint64 instruction)
+static const char *LH_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LH %s, %s($%d)", rt, u, 28);
 }
@@ -8551,15 +8454,15 @@ static std::string LH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LH_S9_(uint64 instruction)
+static const char *LH_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, s, rs);
 }
@@ -8575,15 +8478,15 @@ static std::string LH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LH_U12_(uint64 instruction)
+static const char *LH_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, u, rs);
 }
@@ -8599,15 +8502,15 @@ static std::string LH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHE(uint64 instruction)
+static const char *LHE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
@@ -8623,15 +8526,15 @@ static std::string LHE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_16_(uint64 instruction)
+static const char *LHU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LHU %s, %s(%s)", rt3, u, rs3);
 }
@@ -8647,13 +8550,13 @@ static std::string LHU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_GP_(uint64 instruction)
+static const char *LHU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
@@ -8669,15 +8572,15 @@ static std::string LHU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_S9_(uint64 instruction)
+static const char *LHU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
@@ -8693,15 +8596,15 @@ static std::string LHU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_U12_(uint64 instruction)
+static const char *LHU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
@@ -8717,15 +8620,15 @@ static std::string LHU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHUE(uint64 instruction)
+static const char *LHUE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
@@ -8741,15 +8644,15 @@ static std::string LHUE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHUX(uint64 instruction)
+static const char *LHUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8765,15 +8668,15 @@ static std::string LHUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHUXS(uint64 instruction)
+static const char *LHUXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8789,15 +8692,15 @@ static std::string LHUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHXS(uint64 instruction)
+static const char *LHXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8813,15 +8716,15 @@ static std::string LHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LHX(uint64 instruction)
+static const char *LHX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
@@ -8837,13 +8740,13 @@ static std::string LHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LI_16_(uint64 instruction)
+static const char *LI_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
 
     return img_format("LI %s, %s", rt3, eu);
 }
@@ -8859,13 +8762,13 @@ static std::string LI_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LI_48_(uint64 instruction)
+static const char *LI_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("LI %s, %s", rt, s);
 }
@@ -8881,15 +8784,15 @@ static std::string LI_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LL(uint64 instruction)
+static const char *LL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LL %s, %s(%s)", rt, s, rs);
 }
@@ -8905,15 +8808,15 @@ static std::string LL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LLD(uint64 instruction)
+static const char *LLD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
@@ -8929,15 +8832,15 @@ static std::string LLD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LLDP(uint64 instruction)
+static const char *LLDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8953,15 +8856,15 @@ static std::string LLDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LLE(uint64 instruction)
+static const char *LLE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
@@ -8977,15 +8880,15 @@ static std::string LLE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LLWP(uint64 instruction)
+static const char *LLWP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -9001,15 +8904,15 @@ static std::string LLWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LLWPE(uint64 instruction)
+static const char *LLWPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -9025,17 +8928,17 @@ static std::string LLWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LSA(uint64 instruction)
+static const char *LSA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u2 = IMMEDIATE(copy(u2_value));
 
     return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -9051,13 +8954,13 @@ static std::string LSA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LUI(uint64 instruction)
+static const char *LUI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("LUI %s, %%hi(%s)", rt, s);
 }
@@ -9073,15 +8976,15 @@ static std::string LUI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LW_16_(uint64 instruction)
+static const char *LW_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LW %s, %s(%s)", rt3, u, rs3);
 }
@@ -9097,15 +9000,15 @@ static std::string LW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LW_4X4_(uint64 instruction)
+static const char *LW_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("LW %s, %s(%s)", rt4, u, rs4);
 }
@@ -9121,13 +9024,13 @@ static std::string LW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LW_GP_(uint64 instruction)
+static const char *LW_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 28);
 }
@@ -9143,13 +9046,13 @@ static std::string LW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LW_GP16_(uint64 instruction)
+static const char *LW_GP16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
@@ -9165,15 +9068,15 @@ static std::string LW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LW_S9_(uint64 instruction)
+static const char *LW_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, s, rs);
 }
@@ -9189,13 +9092,13 @@ static std::string LW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LW_SP_(uint64 instruction)
+static const char *LW_SP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 29);
 }
@@ -9211,15 +9114,15 @@ static std::string LW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LW_U12_(uint64 instruction)
+static const char *LW_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, u, rs);
 }
@@ -9235,13 +9138,13 @@ static std::string LW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_GP_(uint64 instruction)
+static const char *LWC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -9257,15 +9160,15 @@ static std::string LWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_S9_(uint64 instruction)
+static const char *LWC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -9281,15 +9184,15 @@ static std::string LWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_U12_(uint64 instruction)
+static const char *LWC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -9305,15 +9208,15 @@ static std::string LWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1X(uint64 instruction)
+static const char *LWC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -9329,15 +9232,15 @@ static std::string LWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1XS(uint64 instruction)
+static const char *LWC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -9353,15 +9256,15 @@ static std::string LWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWC2(uint64 instruction)
+static const char *LWC2(uint64 instruction)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ct = CPR(copy(ct_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
@@ -9377,15 +9280,15 @@ static std::string LWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWE(uint64 instruction)
+static const char *LWE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
@@ -9401,17 +9304,17 @@ static std::string LWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWM(uint64 instruction)
+static const char *LWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -9427,13 +9330,13 @@ static std::string LWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWPC_48_(uint64 instruction)
+static const char *LWPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9449,13 +9352,13 @@ static std::string LWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_GP_(uint64 instruction)
+static const char *LWU_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
@@ -9471,15 +9374,15 @@ static std::string LWU_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_S9_(uint64 instruction)
+static const char *LWU_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
@@ -9495,15 +9398,15 @@ static std::string LWU_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_U12_(uint64 instruction)
+static const char *LWU_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
@@ -9519,15 +9422,15 @@ static std::string LWU_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWUX(uint64 instruction)
+static const char *LWUX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
@@ -9543,15 +9446,15 @@ static std::string LWUX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWUXS(uint64 instruction)
+static const char *LWUXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9567,15 +9470,15 @@ static std::string LWUXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWX(uint64 instruction)
+static const char *LWX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
@@ -9591,15 +9494,15 @@ static std::string LWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWXS_16_(uint64 instruction)
+static const char *LWXS_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
 
     return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
@@ -9615,15 +9518,15 @@ static std::string LWXS_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string LWXS_32_(uint64 instruction)
+static const char *LWXS_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9640,15 +9543,15 @@ static std::string LWXS_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MADD_DSP_(uint64 instruction)
+static const char *MADD_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
@@ -9664,15 +9567,15 @@ static std::string MADD_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MADDF_D(uint64 instruction)
+static const char *MADDF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
@@ -9688,15 +9591,15 @@ static std::string MADDF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MADDF_S(uint64 instruction)
+static const char *MADDF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
@@ -9713,15 +9616,15 @@ static std::string MADDF_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MADDU_DSP_(uint64 instruction)
+static const char *MADDU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
@@ -9738,15 +9641,15 @@ static std::string MADDU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_S_W_PHL(uint64 instruction)
+static const char *MAQ_S_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9763,15 +9666,15 @@ static std::string MAQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_S_W_PHR(uint64 instruction)
+static const char *MAQ_S_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9788,15 +9691,15 @@ static std::string MAQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_SA_W_PHL(uint64 instruction)
+static const char *MAQ_SA_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9813,15 +9716,15 @@ static std::string MAQ_SA_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_SA_W_PHR(uint64 instruction)
+static const char *MAQ_SA_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9837,15 +9740,15 @@ static std::string MAQ_SA_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAX_D(uint64 instruction)
+static const char *MAX_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
@@ -9861,15 +9764,15 @@ static std::string MAX_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAX_S(uint64 instruction)
+static const char *MAX_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
@@ -9885,15 +9788,15 @@ static std::string MAX_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAXA_D(uint64 instruction)
+static const char *MAXA_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
@@ -9909,15 +9812,15 @@ static std::string MAXA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MAXA_S(uint64 instruction)
+static const char *MAXA_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
@@ -9933,15 +9836,15 @@ static std::string MAXA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFC0(uint64 instruction)
+static const char *MFC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9957,13 +9860,13 @@ static std::string MFC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFC1(uint64 instruction)
+static const char *MFC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -9979,13 +9882,13 @@ static std::string MFC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFC2(uint64 instruction)
+static const char *MFC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("MFC2 %s, %s", rt, cs);
 }
@@ -10001,15 +9904,15 @@ static std::string MFC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFGC0(uint64 instruction)
+static const char *MFGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10025,15 +9928,15 @@ static std::string MFGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC0(uint64 instruction)
+static const char *MFHC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10049,13 +9952,13 @@ static std::string MFHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC1(uint64 instruction)
+static const char *MFHC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -10071,13 +9974,13 @@ static std::string MFHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC2(uint64 instruction)
+static const char *MFHC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("MFHC2 %s, %s", rt, cs);
 }
@@ -10093,15 +9996,15 @@ static std::string MFHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFHGC0(uint64 instruction)
+static const char *MFHGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10116,13 +10019,13 @@ static std::string MFHGC0(uint64 instruction)
  *     rt -----
  *               ac --
  */
-static std::string MFHI_DSP_(uint64 instruction)
+static const char *MFHI_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -10138,17 +10041,17 @@ static std::string MFHI_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFHTR(uint64 instruction)
+static const char *MFHTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = IMMEDIATE(copy(c0s_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10163,13 +10066,13 @@ static std::string MFHTR(uint64 instruction)
  *     rt -----
  *               ac --
  */
-static std::string MFLO_DSP_(uint64 instruction)
+static const char *MFLO_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -10185,17 +10088,17 @@ static std::string MFLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MFTR(uint64 instruction)
+static const char *MFTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = IMMEDIATE(copy(c0s_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10211,15 +10114,15 @@ static std::string MFTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MIN_D(uint64 instruction)
+static const char *MIN_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
@@ -10235,15 +10138,15 @@ static std::string MIN_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MIN_S(uint64 instruction)
+static const char *MIN_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
@@ -10259,15 +10162,15 @@ static std::string MIN_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MINA_D(uint64 instruction)
+static const char *MINA_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
@@ -10283,15 +10186,15 @@ static std::string MINA_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MINA_S(uint64 instruction)
+static const char *MINA_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10307,15 +10210,15 @@ static std::string MINA_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOD(uint64 instruction)
+static const char *MOD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
@@ -10331,15 +10234,15 @@ static std::string MOD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MODSUB(uint64 instruction)
+static const char *MODSUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
@@ -10355,15 +10258,15 @@ static std::string MODSUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MODU(uint64 instruction)
+static const char *MODU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
@@ -10379,13 +10282,13 @@ static std::string MODU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOV_D(uint64 instruction)
+static const char *MOV_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10401,13 +10304,13 @@ static std::string MOV_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOV_S(uint64 instruction)
+static const char *MOV_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10423,15 +10326,15 @@ static std::string MOV_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOVE_BALC(uint64 instruction)
+static const char *MOVE_BALC(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rd1 = GPR(decode_gpr_gpr1(rd1_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4);
+    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 4);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10447,17 +10350,17 @@ static std::string MOVE_BALC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOVEP(uint64 instruction)
+static const char *MOVEP(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rsz4_value = extract_rsz4_4_2_1_0(instruction);
 
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
-    std::string rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
 
     return img_format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
     /* hand edited */
@@ -10474,16 +10377,16 @@ static std::string MOVEP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOVEP_REV_(uint64 instruction)
+static const char *MOVEP_REV_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
@@ -10501,13 +10404,13 @@ static std::string MOVEP_REV_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOVE(uint64 instruction)
+static const char *MOVE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10523,15 +10426,15 @@ static std::string MOVE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOVN(uint64 instruction)
+static const char *MOVN(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
@@ -10547,15 +10450,15 @@ static std::string MOVN(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MOVZ(uint64 instruction)
+static const char *MOVZ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
@@ -10571,15 +10474,15 @@ static std::string MOVZ(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MSUB_DSP_(uint64 instruction)
+static const char *MSUB_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
@@ -10595,15 +10498,15 @@ static std::string MSUB_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MSUBF_D(uint64 instruction)
+static const char *MSUBF_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
@@ -10619,15 +10522,15 @@ static std::string MSUBF_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MSUBF_S(uint64 instruction)
+static const char *MSUBF_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
@@ -10643,15 +10546,15 @@ static std::string MSUBF_S(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MSUBU_DSP_(uint64 instruction)
+static const char *MSUBU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
@@ -10667,15 +10570,15 @@ static std::string MSUBU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTC0(uint64 instruction)
+static const char *MTC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10691,13 +10594,13 @@ static std::string MTC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTC1(uint64 instruction)
+static const char *MTC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10713,13 +10616,13 @@ static std::string MTC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTC2(uint64 instruction)
+static const char *MTC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("MTC2 %s, %s", rt, cs);
 }
@@ -10735,15 +10638,15 @@ static std::string MTC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTGC0(uint64 instruction)
+static const char *MTGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10759,15 +10662,15 @@ static std::string MTGC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC0(uint64 instruction)
+static const char *MTHC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10783,13 +10686,13 @@ static std::string MTHC0(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC1(uint64 instruction)
+static const char *MTHC1(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -10805,13 +10708,13 @@ static std::string MTHC1(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC2(uint64 instruction)
+static const char *MTHC2(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *cs = CPR(copy(cs_value));
 
     return img_format("MTHC2 %s, %s", rt, cs);
 }
@@ -10827,15 +10730,15 @@ static std::string MTHC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTHGC0(uint64 instruction)
+static const char *MTHGC0(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = CPR(copy(c0s_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10850,13 +10753,13 @@ static std::string MTHGC0(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MTHI_DSP_(uint64 instruction)
+static const char *MTHI_DSP_(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -10871,13 +10774,13 @@ static std::string MTHI_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MTHLIP(uint64 instruction)
+static const char *MTHLIP(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -10893,17 +10796,17 @@ static std::string MTHLIP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTHTR(uint64 instruction)
+static const char *MTHTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = IMMEDIATE(copy(c0s_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10918,13 +10821,13 @@ static std::string MTHTR(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MTLO_DSP_(uint64 instruction)
+static const char *MTLO_DSP_(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -10940,17 +10843,17 @@ static std::string MTLO_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MTTR(uint64 instruction)
+static const char *MTTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *c0s = IMMEDIATE(copy(c0s_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10966,15 +10869,15 @@ static std::string MTTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUH(uint64 instruction)
+static const char *MUH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
@@ -10990,15 +10893,15 @@ static std::string MUH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUHU(uint64 instruction)
+static const char *MUHU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
@@ -11014,15 +10917,15 @@ static std::string MUHU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_32_(uint64 instruction)
+static const char *MUL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
@@ -11038,13 +10941,13 @@ static std::string MUL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_4X4_(uint64 instruction)
+static const char *MUL_4X4_(uint64 instruction)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
     return img_format("MUL %s, %s", rs4, rt4);
 }
@@ -11060,15 +10963,15 @@ static std::string MUL_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_D(uint64 instruction)
+static const char *MUL_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
@@ -11085,15 +10988,15 @@ static std::string MUL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_PH(uint64 instruction)
+static const char *MUL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11110,15 +11013,15 @@ static std::string MUL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_S_PH(uint64 instruction)
+static const char *MUL_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11134,15 +11037,15 @@ static std::string MUL_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_S(uint64 instruction)
+static const char *MUL_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
@@ -11159,15 +11062,15 @@ static std::string MUL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULEQ_S_W_PHL(uint64 instruction)
+static const char *MULEQ_S_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
@@ -11184,15 +11087,15 @@ static std::string MULEQ_S_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULEQ_S_W_PHR(uint64 instruction)
+static const char *MULEQ_S_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
@@ -11209,15 +11112,15 @@ static std::string MULEQ_S_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULEU_S_PH_QBL(uint64 instruction)
+static const char *MULEU_S_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
@@ -11234,15 +11137,15 @@ static std::string MULEU_S_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULEU_S_PH_QBR(uint64 instruction)
+static const char *MULEU_S_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
@@ -11259,15 +11162,15 @@ static std::string MULEU_S_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_RS_PH(uint64 instruction)
+static const char *MULQ_RS_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11284,15 +11187,15 @@ static std::string MULQ_RS_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_RS_W(uint64 instruction)
+static const char *MULQ_RS_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
@@ -11309,15 +11212,15 @@ static std::string MULQ_RS_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_S_PH(uint64 instruction)
+static const char *MULQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11334,15 +11237,15 @@ static std::string MULQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_S_W(uint64 instruction)
+static const char *MULQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -11359,15 +11262,15 @@ static std::string MULQ_S_W(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MULSA_W_PH(uint64 instruction)
+static const char *MULSA_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11384,15 +11287,15 @@ static std::string MULSA_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MULSAQ_S_W_PH(uint64 instruction)
+static const char *MULSAQ_S_W_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11408,15 +11311,15 @@ static std::string MULSAQ_S_W_PH(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MULT_DSP_(uint64 instruction)
+static const char *MULT_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
@@ -11432,15 +11335,15 @@ static std::string MULT_DSP_(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string MULTU_DSP_(uint64 instruction)
+static const char *MULTU_DSP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
@@ -11456,15 +11359,15 @@ static std::string MULTU_DSP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string MULU(uint64 instruction)
+static const char *MULU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
@@ -11480,13 +11383,13 @@ static std::string MULU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string NEG_D(uint64 instruction)
+static const char *NEG_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11502,13 +11405,13 @@ static std::string NEG_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string NEG_S(uint64 instruction)
+static const char *NEG_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11524,7 +11427,7 @@ static std::string NEG_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string NOP_16_(uint64 instruction)
+static const char *NOP_16_(uint64 instruction)
 {
     (void)instruction;
 
@@ -11542,7 +11445,7 @@ static std::string NOP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string NOP_32_(uint64 instruction)
+static const char *NOP_32_(uint64 instruction)
 {
     (void)instruction;
 
@@ -11560,15 +11463,15 @@ static std::string NOP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string NOR(uint64 instruction)
+static const char *NOR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
@@ -11584,13 +11487,13 @@ static std::string NOR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string NOT_16_(uint64 instruction)
+static const char *NOT_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("NOT %s, %s", rt3, rs3);
 }
@@ -11606,13 +11509,13 @@ static std::string NOT_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string OR_16_(uint64 instruction)
+static const char *OR_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("OR %s, %s", rs3, rt3);
 }
@@ -11628,15 +11531,15 @@ static std::string OR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string OR_32_(uint64 instruction)
+static const char *OR_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("OR %s, %s, %s", rd, rs, rt);
 }
@@ -11652,15 +11555,15 @@ static std::string OR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ORI(uint64 instruction)
+static const char *ORI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ORI %s, %s, %s", rt, rs, u);
 }
@@ -11677,15 +11580,15 @@ static std::string ORI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PACKRL_PH(uint64 instruction)
+static const char *PACKRL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11701,7 +11604,7 @@ static std::string PACKRL_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PAUSE(uint64 instruction)
+static const char *PAUSE(uint64 instruction)
 {
     (void)instruction;
 
@@ -11720,15 +11623,15 @@ static std::string PAUSE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PICK_PH(uint64 instruction)
+static const char *PICK_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11745,15 +11648,15 @@ static std::string PICK_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PICK_QB(uint64 instruction)
+static const char *PICK_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
@@ -11770,13 +11673,13 @@ static std::string PICK_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQ_W_PHL(uint64 instruction)
+static const char *PRECEQ_W_PHL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -11793,13 +11696,13 @@ static std::string PRECEQ_W_PHL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQ_W_PHR(uint64 instruction)
+static const char *PRECEQ_W_PHR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -11816,13 +11719,13 @@ static std::string PRECEQ_W_PHR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBLA(uint64 instruction)
+static const char *PRECEQU_PH_QBLA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11839,13 +11742,13 @@ static std::string PRECEQU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBL(uint64 instruction)
+static const char *PRECEQU_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -11862,13 +11765,13 @@ static std::string PRECEQU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBRA(uint64 instruction)
+static const char *PRECEQU_PH_QBRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11885,13 +11788,13 @@ static std::string PRECEQU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBR(uint64 instruction)
+static const char *PRECEQU_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -11909,13 +11812,13 @@ static std::string PRECEQU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBLA(uint64 instruction)
+static const char *PRECEU_PH_QBLA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11932,13 +11835,13 @@ static std::string PRECEU_PH_QBLA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBL(uint64 instruction)
+static const char *PRECEU_PH_QBL(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -11956,13 +11859,13 @@ static std::string PRECEU_PH_QBL(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBRA(uint64 instruction)
+static const char *PRECEU_PH_QBRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11979,13 +11882,13 @@ static std::string PRECEU_PH_QBRA(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBR(uint64 instruction)
+static const char *PRECEU_PH_QBR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -12002,15 +11905,15 @@ static std::string PRECEU_PH_QBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_QB_PH(uint64 instruction)
+static const char *PRECR_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12027,15 +11930,15 @@ static std::string PRECR_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_SRA_PH_W(uint64 instruction)
+static const char *PRECR_SRA_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12052,15 +11955,15 @@ static std::string PRECR_SRA_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_SRA_R_PH_W(uint64 instruction)
+static const char *PRECR_SRA_R_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12077,15 +11980,15 @@ static std::string PRECR_SRA_R_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_PH_W(uint64 instruction)
+static const char *PRECRQ_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12102,15 +12005,15 @@ static std::string PRECRQ_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_QB_PH(uint64 instruction)
+static const char *PRECRQ_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12127,15 +12030,15 @@ static std::string PRECRQ_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_RS_PH_W(uint64 instruction)
+static const char *PRECRQ_RS_PH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12152,15 +12055,15 @@ static std::string PRECRQ_RS_PH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQU_S_QB_PH(uint64 instruction)
+static const char *PRECRQU_S_QB_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12176,15 +12079,15 @@ static std::string PRECRQU_S_QB_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PREF_S9_(uint64 instruction)
+static const char *PREF_S9_(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE(copy(hint_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
@@ -12200,15 +12103,15 @@ static std::string PREF_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PREF_U12_(uint64 instruction)
+static const char *PREF_U12_(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE(copy(hint_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
@@ -12224,15 +12127,15 @@ static std::string PREF_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PREFE(uint64 instruction)
+static const char *PREFE(uint64 instruction)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *hint = IMMEDIATE(copy(hint_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
@@ -12248,15 +12151,15 @@ static std::string PREFE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string PREPEND(uint64 instruction)
+static const char *PREPEND(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
@@ -12271,13 +12174,13 @@ static std::string PREPEND(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string RADDU_W_QB(uint64 instruction)
+static const char *RADDU_W_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -12292,13 +12195,13 @@ static std::string RADDU_W_QB(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-static std::string RDDSP(uint64 instruction)
+static const char *RDDSP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *mask = IMMEDIATE(copy(mask_value));
 
     return img_format("RDDSP %s, %s", rt, mask);
 }
@@ -12314,15 +12217,15 @@ static std::string RDDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RDHWR(uint64 instruction)
+static const char *RDHWR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string hs = CPR(copy(hs_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *hs = CPR(copy(hs_value));
+    const char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
@@ -12338,13 +12241,13 @@ static std::string RDHWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RDPGPR(uint64 instruction)
+static const char *RDPGPR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12360,13 +12263,13 @@ static std::string RDPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RECIP_D(uint64 instruction)
+static const char *RECIP_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12382,13 +12285,13 @@ static std::string RECIP_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RECIP_S(uint64 instruction)
+static const char *RECIP_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12404,13 +12307,13 @@ static std::string RECIP_S(uint64 instruction)
  *     rt -----
  *           s ----------
  */
-static std::string REPL_PH(uint64 instruction)
+static const char *REPL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
 
     return img_format("REPL.PH %s, %s", rt, s);
 }
@@ -12426,13 +12329,13 @@ static std::string REPL_PH(uint64 instruction)
  *     rt -----
  *           u --------
  */
-static std::string REPL_QB(uint64 instruction)
+static const char *REPL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("REPL.QB %s, %s", rt, u);
 }
@@ -12448,13 +12351,13 @@ static std::string REPL_QB(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string REPLV_PH(uint64 instruction)
+static const char *REPLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12469,13 +12372,13 @@ static std::string REPLV_PH(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string REPLV_QB(uint64 instruction)
+static const char *REPLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12491,14 +12394,14 @@ static std::string REPLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_32_(uint64 instruction)
+static const char *RESTORE_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE(copy(u_value));
     return img_format("RESTORE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12514,13 +12417,13 @@ static std::string RESTORE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_JRC_16_(uint64 instruction)
+static const char *RESTORE_JRC_16_(uint64 instruction)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE(copy(u_value));
     return img_format("RESTORE.JRC %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12536,14 +12439,14 @@ static std::string RESTORE_JRC_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_JRC_32_(uint64 instruction)
+static const char *RESTORE_JRC_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE(copy(u_value));
     return img_format("RESTORE.JRC %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12559,13 +12462,13 @@ static std::string RESTORE_JRC_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RESTOREF(uint64 instruction)
+static const char *RESTOREF(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *count = IMMEDIATE(copy(count_value));
 
     return img_format("RESTOREF %s, %s", u, count);
 }
@@ -12581,13 +12484,13 @@ static std::string RESTOREF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RINT_D(uint64 instruction)
+static const char *RINT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12603,13 +12506,13 @@ static std::string RINT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RINT_S(uint64 instruction)
+static const char *RINT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12625,15 +12528,15 @@ static std::string RINT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ROTR(uint64 instruction)
+static const char *ROTR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
@@ -12649,15 +12552,15 @@ static std::string ROTR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ROTRV(uint64 instruction)
+static const char *ROTRV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -12673,7 +12576,7 @@ static std::string ROTRV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ROTX(uint64 instruction)
+static const char *ROTX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12681,11 +12584,11 @@ static std::string ROTX(uint64 instruction)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
-    std::string stripe = IMMEDIATE(copy(stripe_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *shiftx = IMMEDIATE(copy(shiftx_value));
+    const char *stripe = IMMEDIATE(copy(stripe_value));
 
     return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
@@ -12702,13 +12605,13 @@ static std::string ROTX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_L_D(uint64 instruction)
+static const char *ROUND_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -12724,13 +12627,13 @@ static std::string ROUND_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_L_S(uint64 instruction)
+static const char *ROUND_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -12746,13 +12649,13 @@ static std::string ROUND_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_W_D(uint64 instruction)
+static const char *ROUND_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -12768,13 +12671,13 @@ static std::string ROUND_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_W_S(uint64 instruction)
+static const char *ROUND_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -12790,13 +12693,13 @@ static std::string ROUND_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RSQRT_D(uint64 instruction)
+static const char *RSQRT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -12812,13 +12715,13 @@ static std::string RSQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string RSQRT_S(uint64 instruction)
+static const char *RSQRT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -12834,13 +12737,13 @@ static std::string RSQRT_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SAVE_16_(uint64 instruction)
+static const char *SAVE_16_(uint64 instruction)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE(copy(u_value));
     return img_format("SAVE %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12856,14 +12759,14 @@ static std::string SAVE_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SAVE_32_(uint64 instruction)
+static const char *SAVE_32_(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *u = IMMEDIATE(copy(u_value));
     return img_format("SAVE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12879,13 +12782,13 @@ static std::string SAVE_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SAVEF(uint64 instruction)
+static const char *SAVEF(uint64 instruction)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *count = IMMEDIATE(copy(count_value));
 
     return img_format("SAVEF %s, %s", u, count);
 }
@@ -12901,15 +12804,15 @@ static std::string SAVEF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SB_16_(uint64 instruction)
+static const char *SB_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SB %s, %s(%s)", rtz3, u, rs3);
 }
@@ -12925,13 +12828,13 @@ static std::string SB_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SB_GP_(uint64 instruction)
+static const char *SB_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SB %s, %s($%d)", rt, u, 28);
 }
@@ -12947,15 +12850,15 @@ static std::string SB_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SB_S9_(uint64 instruction)
+static const char *SB_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, s, rs);
 }
@@ -12971,15 +12874,15 @@ static std::string SB_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SB_U12_(uint64 instruction)
+static const char *SB_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, u, rs);
 }
@@ -12995,15 +12898,15 @@ static std::string SB_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SBE(uint64 instruction)
+static const char *SBE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
@@ -13019,15 +12922,15 @@ static std::string SBE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SBX(uint64 instruction)
+static const char *SBX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
@@ -13043,15 +12946,15 @@ static std::string SBX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SC(uint64 instruction)
+static const char *SC(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SC %s, %s(%s)", rt, s, rs);
 }
@@ -13067,15 +12970,15 @@ static std::string SC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SCD(uint64 instruction)
+static const char *SCD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
@@ -13091,15 +12994,15 @@ static std::string SCD(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SCDP(uint64 instruction)
+static const char *SCDP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13115,15 +13018,15 @@ static std::string SCDP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SCE(uint64 instruction)
+static const char *SCE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
@@ -13139,15 +13042,15 @@ static std::string SCE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SCWP(uint64 instruction)
+static const char *SCWP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13163,15 +13066,15 @@ static std::string SCWP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SCWPE(uint64 instruction)
+static const char *SCWPE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -13187,13 +13090,13 @@ static std::string SCWPE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SD_GP_(uint64 instruction)
+static const char *SD_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SD %s, %s($%d)", rt, u, 28);
 }
@@ -13209,15 +13112,15 @@ static std::string SD_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SD_S9_(uint64 instruction)
+static const char *SD_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, s, rs);
 }
@@ -13233,15 +13136,15 @@ static std::string SD_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SD_U12_(uint64 instruction)
+static const char *SD_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, u, rs);
 }
@@ -13257,11 +13160,11 @@ static std::string SD_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDBBP_16_(uint64 instruction)
+static const char *SDBBP_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13277,11 +13180,11 @@ static std::string SDBBP_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDBBP_32_(uint64 instruction)
+static const char *SDBBP_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13297,13 +13200,13 @@ static std::string SDBBP_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_GP_(uint64 instruction)
+static const char *SDC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -13319,15 +13222,15 @@ static std::string SDC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_S9_(uint64 instruction)
+static const char *SDC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -13343,15 +13246,15 @@ static std::string SDC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_U12_(uint64 instruction)
+static const char *SDC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -13367,15 +13270,15 @@ static std::string SDC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1X(uint64 instruction)
+static const char *SDC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -13391,15 +13294,15 @@ static std::string SDC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1XS(uint64 instruction)
+static const char *SDC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -13415,15 +13318,15 @@ static std::string SDC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDC2(uint64 instruction)
+static const char *SDC2(uint64 instruction)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *cs = CPR(copy(cs_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
@@ -13439,17 +13342,17 @@ static std::string SDC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDM(uint64 instruction)
+static const char *SDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -13465,13 +13368,13 @@ static std::string SDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDPC_48_(uint64 instruction)
+static const char *SDPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13487,15 +13390,15 @@ static std::string SDPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDXS(uint64 instruction)
+static const char *SDXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -13511,15 +13414,15 @@ static std::string SDXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SDX(uint64 instruction)
+static const char *SDX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
@@ -13535,13 +13438,13 @@ static std::string SDX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SEB(uint64 instruction)
+static const char *SEB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13557,13 +13460,13 @@ static std::string SEB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SEH(uint64 instruction)
+static const char *SEH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13579,15 +13482,15 @@ static std::string SEH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SEL_D(uint64 instruction)
+static const char *SEL_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
@@ -13603,15 +13506,15 @@ static std::string SEL_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SEL_S(uint64 instruction)
+static const char *SEL_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
@@ -13627,15 +13530,15 @@ static std::string SEL_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SELEQZ_D(uint64 instruction)
+static const char *SELEQZ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13651,15 +13554,15 @@ static std::string SELEQZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SELEQZ_S(uint64 instruction)
+static const char *SELEQZ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13675,15 +13578,15 @@ static std::string SELEQZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SELNEZ_D(uint64 instruction)
+static const char *SELNEZ_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13699,15 +13602,15 @@ static std::string SELNEZ_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SELNEZ_S(uint64 instruction)
+static const char *SELNEZ_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13723,15 +13626,15 @@ static std::string SELNEZ_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SEQI(uint64 instruction)
+static const char *SEQI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
@@ -13747,15 +13650,15 @@ static std::string SEQI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SH_16_(uint64 instruction)
+static const char *SH_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SH %s, %s(%s)", rtz3, u, rs3);
 }
@@ -13771,13 +13674,13 @@ static std::string SH_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SH_GP_(uint64 instruction)
+static const char *SH_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SH %s, %s($%d)", rt, u, 28);
 }
@@ -13793,15 +13696,15 @@ static std::string SH_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SH_S9_(uint64 instruction)
+static const char *SH_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, s, rs);
 }
@@ -13817,15 +13720,15 @@ static std::string SH_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SH_U12_(uint64 instruction)
+static const char *SH_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, u, rs);
 }
@@ -13841,15 +13744,15 @@ static std::string SH_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHE(uint64 instruction)
+static const char *SHE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
@@ -13865,13 +13768,13 @@ static std::string SHE(uint64 instruction)
  *      shift ------
  *               ac --
  */
-static std::string SHILO(uint64 instruction)
+static const char *SHILO(uint64 instruction)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string ac = AC(copy(ac_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("SHILO %s, %s", ac, shift);
 }
@@ -13887,13 +13790,13 @@ static std::string SHILO(uint64 instruction)
  *          rs -----
  *               ac --
  */
-static std::string SHILOV(uint64 instruction)
+static const char *SHILOV(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -13909,15 +13812,15 @@ static std::string SHILOV(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-static std::string SHLL_PH(uint64 instruction)
+static const char *SHLL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13933,15 +13836,15 @@ static std::string SHLL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-static std::string SHLL_QB(uint64 instruction)
+static const char *SHLL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -13958,15 +13861,15 @@ static std::string SHLL_QB(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-static std::string SHLL_S_PH(uint64 instruction)
+static const char *SHLL_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13982,15 +13885,15 @@ static std::string SHLL_S_PH(uint64 instruction)
  *          rs -----
  *               sa -----
  */
-static std::string SHLL_S_W(uint64 instruction)
+static const char *SHLL_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
@@ -14007,15 +13910,15 @@ static std::string SHLL_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_PH(uint64 instruction)
+static const char *SHLLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14031,15 +13934,15 @@ static std::string SHLLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_QB(uint64 instruction)
+static const char *SHLLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14056,15 +13959,15 @@ static std::string SHLLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_S_PH(uint64 instruction)
+static const char *SHLLV_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14080,15 +13983,15 @@ static std::string SHLLV_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_S_W(uint64 instruction)
+static const char *SHLLV_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
@@ -14104,15 +14007,15 @@ static std::string SHLLV_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_PH(uint64 instruction)
+static const char *SHRA_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14128,15 +14031,15 @@ static std::string SHRA_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_QB(uint64 instruction)
+static const char *SHRA_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14152,15 +14055,15 @@ static std::string SHRA_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_PH(uint64 instruction)
+static const char *SHRA_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14176,15 +14079,15 @@ static std::string SHRA_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_QB(uint64 instruction)
+static const char *SHRA_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14200,15 +14103,15 @@ static std::string SHRA_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_W(uint64 instruction)
+static const char *SHRA_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
@@ -14224,15 +14127,15 @@ static std::string SHRA_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_PH(uint64 instruction)
+static const char *SHRAV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14248,15 +14151,15 @@ static std::string SHRAV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_QB(uint64 instruction)
+static const char *SHRAV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14272,15 +14175,15 @@ static std::string SHRAV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_PH(uint64 instruction)
+static const char *SHRAV_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14296,15 +14199,15 @@ static std::string SHRAV_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_QB(uint64 instruction)
+static const char *SHRAV_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14320,15 +14223,15 @@ static std::string SHRAV_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_W(uint64 instruction)
+static const char *SHRAV_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
@@ -14344,15 +14247,15 @@ static std::string SHRAV_R_W(uint64 instruction)
  *          rs -----
  *               sa ----
  */
-static std::string SHRL_PH(uint64 instruction)
+static const char *SHRL_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14368,15 +14271,15 @@ static std::string SHRL_PH(uint64 instruction)
  *          rs -----
  *               sa ---
  */
-static std::string SHRL_QB(uint64 instruction)
+static const char *SHRL_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14393,15 +14296,15 @@ static std::string SHRL_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRLV_PH(uint64 instruction)
+static const char *SHRLV_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14417,15 +14320,15 @@ static std::string SHRLV_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHRLV_QB(uint64 instruction)
+static const char *SHRLV_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14441,15 +14344,15 @@ static std::string SHRLV_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHX(uint64 instruction)
+static const char *SHX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
@@ -14465,15 +14368,15 @@ static std::string SHX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SHXS(uint64 instruction)
+static const char *SHXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -14489,11 +14392,11 @@ static std::string SHXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SIGRIE(uint64 instruction)
+static const char *SIGRIE(uint64 instruction)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SIGRIE %s", code);
 }
@@ -14509,15 +14412,15 @@ static std::string SIGRIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SLL_16_(uint64 instruction)
+static const char *SLL_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14533,15 +14436,15 @@ static std::string SLL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SLL_32_(uint64 instruction)
+static const char *SLL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
@@ -14557,15 +14460,15 @@ static std::string SLL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SLLV(uint64 instruction)
+static const char *SLLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
@@ -14581,15 +14484,15 @@ static std::string SLLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SLT(uint64 instruction)
+static const char *SLT(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
@@ -14605,15 +14508,15 @@ static std::string SLT(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SLTI(uint64 instruction)
+static const char *SLTI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
@@ -14629,15 +14532,15 @@ static std::string SLTI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SLTIU(uint64 instruction)
+static const char *SLTIU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
@@ -14653,15 +14556,15 @@ static std::string SLTIU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SLTU(uint64 instruction)
+static const char *SLTU(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
@@ -14677,15 +14580,15 @@ static std::string SLTU(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SOV(uint64 instruction)
+static const char *SOV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
@@ -14701,11 +14604,11 @@ static std::string SOV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SPECIAL2(uint64 instruction)
+static const char *SPECIAL2(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    const char *op = IMMEDIATE(copy(op_value));
 
     return img_format("SPECIAL2 %s", op);
 }
@@ -14721,13 +14624,13 @@ static std::string SPECIAL2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SQRT_D(uint64 instruction)
+static const char *SQRT_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -14743,13 +14646,13 @@ static std::string SQRT_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SQRT_S(uint64 instruction)
+static const char *SQRT_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -14765,15 +14668,15 @@ static std::string SQRT_S(uint64 instruction)
  *               rd -----
  *                    sa -----
  */
-static std::string SRA(uint64 instruction)
+static const char *SRA(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
@@ -14789,15 +14692,15 @@ static std::string SRA(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-static std::string SRAV(uint64 instruction)
+static const char *SRAV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
@@ -14813,15 +14716,15 @@ static std::string SRAV(uint64 instruction)
  *          rt -----
  *               rd -----
  */
-static std::string SRL_16_(uint64 instruction)
+static const char *SRL_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14837,15 +14740,15 @@ static std::string SRL_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SRL_32_(uint64 instruction)
+static const char *SRL_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
@@ -14861,15 +14764,15 @@ static std::string SRL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SRLV(uint64 instruction)
+static const char *SRLV(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
@@ -14885,15 +14788,15 @@ static std::string SRLV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUB(uint64 instruction)
+static const char *SUB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
@@ -14909,15 +14812,15 @@ static std::string SUB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUB_D(uint64 instruction)
+static const char *SUB_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
@@ -14933,15 +14836,15 @@ static std::string SUB_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUB_S(uint64 instruction)
+static const char *SUB_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
@@ -14957,15 +14860,15 @@ static std::string SUB_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_PH(uint64 instruction)
+static const char *SUBQ_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14982,15 +14885,15 @@ static std::string SUBQ_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_S_PH(uint64 instruction)
+static const char *SUBQ_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15007,15 +14910,15 @@ static std::string SUBQ_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_S_W(uint64 instruction)
+static const char *SUBQ_S_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -15032,15 +14935,15 @@ static std::string SUBQ_S_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_PH(uint64 instruction)
+static const char *SUBQH_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15057,15 +14960,15 @@ static std::string SUBQH_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_R_PH(uint64 instruction)
+static const char *SUBQH_R_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15082,15 +14985,15 @@ static std::string SUBQH_R_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_R_W(uint64 instruction)
+static const char *SUBQH_R_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -15107,15 +15010,15 @@ static std::string SUBQH_R_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_W(uint64 instruction)
+static const char *SUBQH_W(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -15131,15 +15034,15 @@ static std::string SUBQH_W(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_16_(uint64 instruction)
+static const char *SUBU_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("SUBU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -15155,15 +15058,15 @@ static std::string SUBU_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_32_(uint64 instruction)
+static const char *SUBU_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
@@ -15179,15 +15082,15 @@ static std::string SUBU_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_PH(uint64 instruction)
+static const char *SUBU_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15203,15 +15106,15 @@ static std::string SUBU_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_QB(uint64 instruction)
+static const char *SUBU_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15228,15 +15131,15 @@ static std::string SUBU_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_S_PH(uint64 instruction)
+static const char *SUBU_S_PH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15253,15 +15156,15 @@ static std::string SUBU_S_PH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_S_QB(uint64 instruction)
+static const char *SUBU_S_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15278,15 +15181,15 @@ static std::string SUBU_S_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBUH_QB(uint64 instruction)
+static const char *SUBUH_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15303,15 +15206,15 @@ static std::string SUBUH_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SUBUH_R_QB(uint64 instruction)
+static const char *SUBUH_R_QB(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15327,15 +15230,15 @@ static std::string SUBUH_R_QB(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SW_16_(uint64 instruction)
+static const char *SW_16_(uint64 instruction)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SW %s, %s(%s)", rtz3, u, rs3);
 }
@@ -15351,15 +15254,15 @@ static std::string SW_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SW_4X4_(uint64 instruction)
+static const char *SW_4X4_(uint64 instruction)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("SW %s, %s(%s)", rtz4, u, rs4);
 }
@@ -15375,13 +15278,13 @@ static std::string SW_4X4_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SW_GP16_(uint64 instruction)
+static const char *SW_GP16_(uint64 instruction)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
@@ -15397,13 +15300,13 @@ static std::string SW_GP16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SW_GP_(uint64 instruction)
+static const char *SW_GP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 28);
 }
@@ -15419,15 +15322,15 @@ static std::string SW_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SW_S9_(uint64 instruction)
+static const char *SW_S9_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, s, rs);
 }
@@ -15443,13 +15346,13 @@ static std::string SW_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SW_SP_(uint64 instruction)
+static const char *SW_SP_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 29);
 }
@@ -15465,15 +15368,15 @@ static std::string SW_SP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SW_U12_(uint64 instruction)
+static const char *SW_U12_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, u, rs);
 }
@@ -15489,13 +15392,13 @@ static std::string SW_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_GP_(uint64 instruction)
+static const char *SWC1_GP_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -15511,15 +15414,15 @@ static std::string SWC1_GP_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_S9_(uint64 instruction)
+static const char *SWC1_S9_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -15535,15 +15438,15 @@ static std::string SWC1_S9_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_U12_(uint64 instruction)
+static const char *SWC1_U12_(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -15559,15 +15462,15 @@ static std::string SWC1_U12_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1X(uint64 instruction)
+static const char *SWC1X(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -15583,15 +15486,15 @@ static std::string SWC1X(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1XS(uint64 instruction)
+static const char *SWC1XS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -15607,15 +15510,15 @@ static std::string SWC1XS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWC2(uint64 instruction)
+static const char *SWC2(uint64 instruction)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *cs = CPR(copy(cs_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
@@ -15631,15 +15534,15 @@ static std::string SWC2(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWE(uint64 instruction)
+static const char *SWE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
@@ -15655,17 +15558,17 @@ static std::string SWE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWM(uint64 instruction)
+static const char *SWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -15681,13 +15584,13 @@ static std::string SWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWPC_48_(uint64 instruction)
+static const char *SWPC_48_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6);
+    const char *rt = GPR(copy(rt_value));
+    const char *s = ADDRESS(encode_s_from_address(s_value), 6);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15703,15 +15606,15 @@ static std::string SWPC_48_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWX(uint64 instruction)
+static const char *SWX(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
@@ -15727,15 +15630,15 @@ static std::string SWX(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SWXS(uint64 instruction)
+static const char *SWXS(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -15751,11 +15654,11 @@ static std::string SWXS(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SYNC(uint64 instruction)
+static const char *SYNC(uint64 instruction)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    std::string stype = IMMEDIATE(copy(stype_value));
+    const char *stype = IMMEDIATE(copy(stype_value));
 
     return img_format("SYNC %s", stype);
 }
@@ -15771,13 +15674,13 @@ static std::string SYNC(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SYNCI(uint64 instruction)
+static const char *SYNCI(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SYNCI %s(%s)", s, rs);
 }
@@ -15793,13 +15696,13 @@ static std::string SYNCI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SYNCIE(uint64 instruction)
+static const char *SYNCIE(uint64 instruction)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SYNCIE %s(%s)", s, rs);
 }
@@ -15815,11 +15718,11 @@ static std::string SYNCIE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string SYSCALL_16_(uint64 instruction)
+static const char *SYSCALL_16_(uint64 instruction)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15833,11 +15736,11 @@ static std::string SYSCALL_16_(uint64 instruction)
  *  00000000000010
  *           code ------------------
  */
-static std::string SYSCALL_32_(uint64 instruction)
+static const char *SYSCALL_32_(uint64 instruction)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15853,13 +15756,13 @@ static std::string SYSCALL_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TEQ(uint64 instruction)
+static const char *TEQ(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -15875,7 +15778,7 @@ static std::string TEQ(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGINV(uint64 instruction)
+static const char *TLBGINV(uint64 instruction)
 {
     (void)instruction;
 
@@ -15893,7 +15796,7 @@ static std::string TLBGINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGINVF(uint64 instruction)
+static const char *TLBGINVF(uint64 instruction)
 {
     (void)instruction;
 
@@ -15911,7 +15814,7 @@ static std::string TLBGINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGP(uint64 instruction)
+static const char *TLBGP(uint64 instruction)
 {
     (void)instruction;
 
@@ -15929,7 +15832,7 @@ static std::string TLBGP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGR(uint64 instruction)
+static const char *TLBGR(uint64 instruction)
 {
     (void)instruction;
 
@@ -15947,7 +15850,7 @@ static std::string TLBGR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGWI(uint64 instruction)
+static const char *TLBGWI(uint64 instruction)
 {
     (void)instruction;
 
@@ -15965,7 +15868,7 @@ static std::string TLBGWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGWR(uint64 instruction)
+static const char *TLBGWR(uint64 instruction)
 {
     (void)instruction;
 
@@ -15983,7 +15886,7 @@ static std::string TLBGWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBINV(uint64 instruction)
+static const char *TLBINV(uint64 instruction)
 {
     (void)instruction;
 
@@ -16001,7 +15904,7 @@ static std::string TLBINV(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBINVF(uint64 instruction)
+static const char *TLBINVF(uint64 instruction)
 {
     (void)instruction;
 
@@ -16019,7 +15922,7 @@ static std::string TLBINVF(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBP(uint64 instruction)
+static const char *TLBP(uint64 instruction)
 {
     (void)instruction;
 
@@ -16037,7 +15940,7 @@ static std::string TLBP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBR(uint64 instruction)
+static const char *TLBR(uint64 instruction)
 {
     (void)instruction;
 
@@ -16055,7 +15958,7 @@ static std::string TLBR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBWI(uint64 instruction)
+static const char *TLBWI(uint64 instruction)
 {
     (void)instruction;
 
@@ -16073,7 +15976,7 @@ static std::string TLBWI(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TLBWR(uint64 instruction)
+static const char *TLBWR(uint64 instruction)
 {
     (void)instruction;
 
@@ -16091,13 +15994,13 @@ static std::string TLBWR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TNE(uint64 instruction)
+static const char *TNE(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -16113,13 +16016,13 @@ static std::string TNE(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_L_D(uint64 instruction)
+static const char *TRUNC_L_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -16135,13 +16038,13 @@ static std::string TRUNC_L_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_L_S(uint64 instruction)
+static const char *TRUNC_L_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -16157,13 +16060,13 @@ static std::string TRUNC_L_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_W_D(uint64 instruction)
+static const char *TRUNC_W_D(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -16179,13 +16082,13 @@ static std::string TRUNC_W_D(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_W_S(uint64 instruction)
+static const char *TRUNC_W_S(uint64 instruction)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -16201,17 +16104,17 @@ static std::string TRUNC_W_S(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string UALDM(uint64 instruction)
+static const char *UALDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16227,15 +16130,15 @@ static std::string UALDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string UALH(uint64 instruction)
+static const char *UALH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
@@ -16251,17 +16154,17 @@ static std::string UALH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string UALWM(uint64 instruction)
+static const char *UALWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16277,17 +16180,17 @@ static std::string UALWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string UASDM(uint64 instruction)
+static const char *UASDM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16303,15 +16206,15 @@ static std::string UASDM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string UASH(uint64 instruction)
+static const char *UASH(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
@@ -16327,17 +16230,17 @@ static std::string UASH(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string UASWM(uint64 instruction)
+static const char *UASWM(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16353,11 +16256,11 @@ static std::string UASWM(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string UDI(uint64 instruction)
+static const char *UDI(uint64 instruction)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    const char *op = IMMEDIATE(copy(op_value));
 
     return img_format("UDI %s", op);
 }
@@ -16371,11 +16274,11 @@ static std::string UDI(uint64 instruction)
  *  001000          1100001101111111
  *   code ----------
  */
-static std::string WAIT(uint64 instruction)
+static const char *WAIT(uint64 instruction)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    const char *code = IMMEDIATE(copy(code_value));
 
     return img_format("WAIT %s", code);
 }
@@ -16391,13 +16294,13 @@ static std::string WAIT(uint64 instruction)
  *     rt -----
  *        mask -------
  */
-static std::string WRDSP(uint64 instruction)
+static const char *WRDSP(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *mask = IMMEDIATE(copy(mask_value));
 
     return img_format("WRDSP %s, %s", rt, mask);
 }
@@ -16413,13 +16316,13 @@ static std::string WRDSP(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string WRPGPR(uint64 instruction)
+static const char *WRPGPR(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16435,13 +16338,13 @@ static std::string WRPGPR(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string XOR_16_(uint64 instruction)
+static const char *XOR_16_(uint64 instruction)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("XOR %s, %s", rs3, rt3);
 }
@@ -16457,15 +16360,15 @@ static std::string XOR_16_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string XOR_32_(uint64 instruction)
+static const char *XOR_32_(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
@@ -16481,15 +16384,15 @@ static std::string XOR_32_(uint64 instruction)
  *          rs -----
  *               rd -----
  */
-static std::string XORI(uint64 instruction)
+static const char *XORI(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *u = IMMEDIATE(copy(u_value));
 
     return img_format("XORI %s, %s, %s", rt, rs, u);
 }
@@ -16504,13 +16407,13 @@ static std::string XORI(uint64 instruction)
  *     rt -----
  *          rs -----
  */
-static std::string YIELD(uint64 instruction)
+static const char *YIELD(uint64 instruction)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("YIELD %s, %s", rt, rs);
 }
@@ -22313,7 +22216,7 @@ static struct Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int Disassemble(const uint16 *data, std::string & dis,
+static int Disassemble(const uint16 *data, char *dis,
                      TABLE_ENTRY_TYPE & type)
 {
     return Disassemble(data, dis, type, MAJOR, 2);
@@ -22325,7 +22228,7 @@ int nanomips_dis(char *buf,
                  unsigned short two,
                  unsigned short three)
 {
-    std::string disasm;
+    char disasm[200];
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
@@ -22333,7 +22236,7 @@ int nanomips_dis(char *buf,
     m_requested_instruction_categories = ALL_ATTRIBUTES;
     int size = Disassemble(bits, disasm, type);
 
-    strcpy(buf, disasm.c_str());
+    strcpy(buf, disasm);
     return size;
 }
 
-- 
2.25.1


