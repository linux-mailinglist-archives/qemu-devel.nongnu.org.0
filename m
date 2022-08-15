Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E901592A6D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:45:02 +0200 (CEST)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUmT-0004TL-Cp
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUW3-0007Pd-RP
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:04 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:18016 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUVy-0000JK-O0
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:28:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/zgtL1ShD5IAQK8b9b7EvM2Wa+vqEizp/089SgUkh+H16bQlxneuwchAPk6P07bVt9QExQA7tvdWn0TkwSid1pH20fiCceWZR16NGmBi/x9knimYQKCAZi4ajjn+n/6tjUPI6KxFRbO8avacyPPUbrRd+PEVGxC8UFLrs+58a09YUO+Bg8IPzKyZbbyeroN0Os2K+I1miChUv1f38AwWtPQX+XN88G4LNNIVkvqvCJk4VWRqWVriGUbvnB/tZkPn1fAzK8R7QVkuCA7Af6jsAg8Q0tQfmrhU3d+ejCIi+4Gcu90QGdRkGSEEj9p8QP7Fg/2aBX/W++xCHbKptr33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbgdtwgEjygcdJvV2ROqCWe7W6cnGPVcCa86i8eV3Os=;
 b=CvQeiYfkT5LC6E8uErJS4lYjPht0TwXsomiFjCkEPXkHePjx6N7s8RUc+r1biBy2c0MrtctgJ3CYTjxSkk/xhBvyxHaUzEpiwHb1A4A2hUiIFUnyP9T/5qW6H1acOAI/tLoco85kCxV+7g/aHLubZ0a2ZBKlkH1iL9b8Q6ZsWl3nHeG3dSo5KJOPJ0oLfjv4mxef4GlRSfwa2ahvzZopq+D9bmyQyiN6ib9YEySdTLc2aMODnkxbcVIe9i4yjOPEHAIi2GynC2wJEGe5AMOHusNsaEAPihcphrV3iDS6pQt/kwIrT5fjRMrpaOtlinnCVuawnmi1/TYMlIgET4TVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbgdtwgEjygcdJvV2ROqCWe7W6cnGPVcCa86i8eV3Os=;
 b=iCodk7kHmjAmS/+/PKz0I06Ea2xGuvZw2wCsjcPi03FvIl2YFo1Wj7EpkNyYCNGIg5dToIUUuplgKDudmfNTCL4/QZVvfCaV8pcgU+tTajdxIAT3XMm0INcxB/68HLGnEYIWyPXNUSJ6yptGK826Rmt77DS4/q00NOcGsUIRW1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:27:09 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:27:09 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 01/20] disas/nanomips: Remove namespace img
Date: Mon, 15 Aug 2022 09:26:10 +0200
Message-Id: <20220815072629.12865-2-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28968eaa-8dc6-4de8-0ecf-08da7e8f8fdd
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DrOgBlpvNhaRTY4/JbGbOgPCiQMWmSquoe5fOZECn3hUdiUlnOXRZL1hVOmTsgZGUFn/gTGxtmC+1nrvzYpZSkP2DZNGInPbvdGHQ3Txmtl5VI/gCasszbr7EKumaZq/OulMJGbvPiDz+PrH6RIDUkazmsODyZOfuwE18QxL2DktevkgBhFbwPTJB6SOMEsG2fs4ytmU8Es1nP6XwAUotUOiHNKWfswWU1TSxdc7xOEqQiztoOKHMrAGjv2tiNxj2mbJMPEVPHgTuQj1CNz4ied/sTYGbNtYNjwYVo/pqCuoSxJQKReULOq2iHovMkEzNQ0PRSeiNu3isc69ZFsCgcGs847nYe9LRCtzY7ttGZlpKRPyJpthKDla5cS0DayWAP0wAhloer+SMdMTwjQbQJeQdO342jelmJ6d51vE7n/aqrpw4gR+sT2nSjbC5JW7QhY6Xp8tFwpxu+S4CK6D9uk+XEf1TJiJe9kpeLFWWmu+R3i6hZ2ok7XJ/2ZXx6zHu0NnDuoNyIYGrxP2G+/iMJkeeBZv3NeU1KjdocHoD/Opst2cevBKIbL4M25NOqgY7qKcPFBCND6xDu4H5k04xZEVpjShmkOJ1RGJHs/mEMSVZWxeGnlZ8WXQmX9O/TKpyxFb4G9Ems0cp+5k10GHbsqj30BIYp4lizgPooYsZVQ7pjoEMcozQPjtFqj41im+TPZYGe8rLasZUCjbyFsgZQFKbv+tkjdmtf6HsdPKxckitQJW7SL92uPSV71t4LN3szYWGr95e4ywqr5s0r2Zxi4RP7KDZ/47UGHISZS7sk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39830400003)(396003)(346002)(376002)(366004)(86362001)(2616005)(6666004)(186003)(316002)(41300700001)(107886003)(44832011)(8676002)(30864003)(36756003)(8936002)(83380400001)(1076003)(4326008)(66556008)(5660300002)(66476007)(66946007)(38100700002)(26005)(2906002)(6916009)(38350700002)(478600001)(6486002)(6512007)(6506007)(52116002)(579004)(559001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P1jZyEwTZGYkG2OwIw5xfBf+6eGOFsQa4dDqarx1v81SDK75W0TO2ejm4dpV?=
 =?us-ascii?Q?Yco6cAtk0lqlrhrtb1J1nLeSoWdJq6Mz1BRthwISkE8sJv1KREIatud5pxr6?=
 =?us-ascii?Q?W+5cECE47/dyDHI+6KW+J8mWzwX7wm1NiHyPLo2ERwO4CVqMSAneSueVxEwF?=
 =?us-ascii?Q?RotfgYzMttEe0n/GLnRHMuwS90+Xd3WeyDxLwkTuDy8xdHqDyBazbSfYxs4b?=
 =?us-ascii?Q?ssBC5tko4aPYPMeVjHie4wIlfyF50aBsUSXnZWQND2eS3tRH4gpBKozZQdal?=
 =?us-ascii?Q?KHfGhEoWrgAqoq87IO+oseYmsHefCToIsyuktc1BTyraSRPj1h4uDOpt2yGX?=
 =?us-ascii?Q?OanUexpo+Y+okRozL+oKjwgfzRL7KOylZtv2RQba96SiEaQNV7KnQwmbbbSz?=
 =?us-ascii?Q?caVg7hyNvrbLVdtUKh/ijdXU8fHlvwfeDUyYM+aDSuUMnuD/4nHSifyP9sx4?=
 =?us-ascii?Q?yEq+j2rIOrziaIA7cptjDwTfAWn5TmdIHkModmA+34+jhJQnzXmNFPLid2xs?=
 =?us-ascii?Q?IUHwP/AbL9Y5kIOtBzXh2bbVDIjbuou1nfnOYN0yEt1GGIOpuzox2Onzicjd?=
 =?us-ascii?Q?g0iAukq7QeMUhf0URoCR1erEYtmTlKx1jQKG+q9DPCFoOz5n/ibG/ik6C/XE?=
 =?us-ascii?Q?ebYHQVToriDIprCwCpBCcgGY8Y3MQsoNbryBrHbnSfnrAAyZbR/Nf6kyboZ2?=
 =?us-ascii?Q?yOasGM9jhnOLvCe0wh0PZH/bZrqROGXU/r3HVsgjCQuI9E9nKQQg7ip/93X9?=
 =?us-ascii?Q?iROKyT+TedgGxXr4w2vongAvO1xXZ2n4k+K2FVxDKiiz5VSNwC3nIf0eX/dJ?=
 =?us-ascii?Q?K9mTIkioj6gTInm+jKLvPyCPeApmtpJs//3QgmkiOOYCLjxUkFm6JPEAp363?=
 =?us-ascii?Q?ohmaS2Hr6kE41w0R1tQziQbeRCe3NbOQnQYoI/yPMd407SG/KdbDAWuS3YNV?=
 =?us-ascii?Q?h7O6LmMhO01hTW+2caKsnmS9k/mYdKVLQot/RdNIkCiTrYzsVRiQjoolYHGY?=
 =?us-ascii?Q?QariAD2O7fsWRVeiUx/3QZrGQbUfZwQi3xaQwBiT9xs979ZmtD7QX4th1CUZ?=
 =?us-ascii?Q?1znu5Sj3TUfyXPLAG6e0HYpIyY4PPWNyY4xUxDoxYUwkXC3Kh7SFDjv0oPVh?=
 =?us-ascii?Q?FF/1Rpn9bemJSpxQWvUDkGz16pIOPpL7XgYPgU0z/eoyaToBByUOMpe/oEau?=
 =?us-ascii?Q?7xgk5wgzfV9coGoTaTk8f9wdoNn+EwhVZAVppaf46z+7ChVouAmHggUodfKI?=
 =?us-ascii?Q?JAnXELzgxgPN3wUGEB6wHGMNCbTuVYxj6nC0jHHOiQA6FxpYVUQ65U9rkDhv?=
 =?us-ascii?Q?ujSQ9HzBfeyx0ETApMtJ22/ZaLlJ3rDAG4owGEz/BzDup6o0MpDYalsoylGh?=
 =?us-ascii?Q?ZpBdiO1x81RLnAF1UvUaC/p0ikAqo2TiW0qC+ow/Xblgjh0wA3K3MHmhuWY8?=
 =?us-ascii?Q?2QUGvs18y2Z9A3Bd7UvcxSojsbBNk7LXA02yWH58BKbuw/88VbGxr/PuUMQy?=
 =?us-ascii?Q?qgK/SW2WskcW87g14P0hlVMcCIPTuEO4Mu9OKKzuSzNHmnPnOMpYt2y4i5gS?=
 =?us-ascii?Q?/xjoX5D1gJBqtB6CHS609P6Gxq/KU9l6eghkgjA/bZ3Lpl0mslyszBW9Og6P?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28968eaa-8dc6-4de8-0ecf-08da7e8f8fdd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:27:08.9148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJKai8qsP52X0CtWMkdZmen63vPKe30RJoh6EObClbSiqZJEiFOEJS8OqPLV2kbJeh4QdCrMGcm77f5U91z7QOSc+X+MgZAY6ji+O8PIZ4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=40.107.21.97;
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

Since there's no namespace feature in C, namespace img has been replaced
with adding the prefix "img" to the namespace members.

Prefix "img" has been added to the function names of functions that used
to be wrapped in namespace img. Those are img::format() functions.
I.e. replaced img::format with the img_format.

Typedef address that used to belong to namespace img now is called
img_address.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 1433 ++++++++++++++++++++++----------------------
 disas/nanomips.h   |   10 +-
 2 files changed, 713 insertions(+), 730 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 9be8df75dd..96b7bfd83b 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -137,131 +137,118 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
 }
 
 
-namespace img
+std::string img_format(const char *format, ...)
 {
-    address addr32(address a)
-    {
-        return a;
+    char buffer[256];
+    va_list args;
+    va_start(args, format);
+    int err = vsprintf(buffer, format, args);
+    if (err < 0) {
+        perror(buffer);
     }
+    va_end(args);
+    return buffer;
+}
 
-    std::string format(const char *format, ...)
-    {
-        char buffer[256];
-        va_list args;
-        va_start(args, format);
-        int err = vsprintf(buffer, format, args);
-        if (err < 0) {
-            perror(buffer);
-        }
-        va_end(args);
-        return buffer;
-    }
-
-    std::string format(const char *format,
-                       std::string s)
-    {
-        char buffer[256];
-
-        sprintf(buffer, format, s.c_str());
+std::string img_format(const char *format,
+                   std::string s)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, s.c_str());
 
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2)
-    {
-        char buffer[256];
+    return buffer;
+}
 
-        sprintf(buffer, format, s1.c_str(), s2.c_str());
+std::string img_format(const char *format,
+                   std::string s1,
+                   std::string s2)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, s1.c_str(), s2.c_str());
 
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       std::string s3)
-    {
-        char buffer[256];
+    return buffer;
+}
 
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
+std::string img_format(const char *format,
+                   std::string s1,
+                   std::string s2,
+                   std::string s3)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
 
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       std::string s3,
-                       std::string s4)
-    {
-        char buffer[256];
+    return buffer;
+}
 
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                                s4.c_str());
+std::string img_format(const char *format,
+                   std::string s1,
+                   std::string s2,
+                   std::string s3,
+                   std::string s4)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
+                            s4.c_str());
 
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       std::string s3,
-                       std::string s4,
-                       std::string s5)
-    {
-        char buffer[256];
+    return buffer;
+}
 
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                                s4.c_str(), s5.c_str());
+std::string img_format(const char *format,
+                   std::string s1,
+                   std::string s2,
+                   std::string s3,
+                   std::string s4,
+                   std::string s5)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
+                            s4.c_str(), s5.c_str());
 
-    std::string format(const char *format,
-                       uint64 d,
-                       std::string s2)
-    {
-        char buffer[256];
+    return buffer;
+}
 
-        sprintf(buffer, format, d, s2.c_str());
+std::string img_format(const char *format,
+                   uint64 d,
+                   std::string s2)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, d, s2.c_str());
 
-    std::string format(const char *format,
-                       std::string s1,
-                       uint64 d,
-                       std::string s2)
-    {
-        char buffer[256];
+    return buffer;
+}
 
-        sprintf(buffer, format, s1.c_str(), d, s2.c_str());
+std::string img_format(const char *format,
+                   std::string s1,
+                   uint64 d,
+                   std::string s2)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, s1.c_str(), d, s2.c_str());
 
-    std::string format(const char *format,
-                       std::string s1,
-                       std::string s2,
-                       uint64 d)
-    {
-        char buffer[256];
+    return buffer;
+}
 
-        sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
+std::string img_format(const char *format,
+                   std::string s1,
+                   std::string s2,
+                   uint64 d)
+{
+    char buffer[256];
 
-        return buffer;
-    }
+    sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
 
-    char as_char(int c)
-    {
-        return static_cast<char>(c);
-    }
-};
+    return buffer;
+}
 
 
-std::string to_string(img::address a)
+std::string to_string(img_address a)
 {
     char buffer[256];
     sprintf(buffer, "0x%" PRIx64, a);
@@ -289,7 +276,7 @@ uint64 NMD::renumber_registers(uint64 index, uint64 *register_list,
         return register_list[index];
     }
 
-    throw std::runtime_error(img::format(
+    throw std::runtime_error(img_format(
                    "Invalid register mapping index %" PRIu64
                    ", size of list = %zu",
                    index, register_list_size));
@@ -683,7 +670,7 @@ std::string NMD::save_restore_list(uint64 rt, uint64 count, uint64 gp)
     for (uint64 counter = 0; counter != count; counter++) {
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        str += img::format(",%s", GPR(this_rt));
+        str += img_format(",%s", GPR(this_rt));
     }
 
     return str;
@@ -703,7 +690,7 @@ std::string NMD::GPR(uint64 reg)
         return gpr_reg[reg];
     }
 
-    throw std::runtime_error(img::format("Invalid GPR register index %" PRIu64,
+    throw std::runtime_error(img_format("Invalid GPR register index %" PRIu64,
                                          reg));
 }
 
@@ -721,7 +708,7 @@ std::string NMD::FPR(uint64 reg)
         return fpr_reg[reg];
     }
 
-    throw std::runtime_error(img::format("Invalid FPR register index %" PRIu64,
+    throw std::runtime_error(img_format("Invalid FPR register index %" PRIu64,
                                          reg));
 }
 
@@ -736,27 +723,27 @@ std::string NMD::AC(uint64 reg)
         return ac_reg[reg];
     }
 
-    throw std::runtime_error(img::format("Invalid AC register index %" PRIu64,
+    throw std::runtime_error(img_format("Invalid AC register index %" PRIu64,
                                          reg));
 }
 
 
 std::string NMD::IMMEDIATE(uint64 value)
 {
-    return img::format("0x%" PRIx64, value);
+    return img_format("0x%" PRIx64, value);
 }
 
 
 std::string NMD::IMMEDIATE(int64 value)
 {
-    return img::format("%" PRId64, value);
+    return img_format("%" PRId64, value);
 }
 
 
 std::string NMD::CPR(uint64 reg)
 {
     /* needs more work */
-    return img::format("CP%" PRIu64, reg);
+    return img_format("CP%" PRIu64, reg);
 }
 
 
@@ -764,9 +751,9 @@ std::string NMD::ADDRESS(uint64 value, int instruction_size)
 {
     /* token for string replace */
     /* const char TOKEN_REPLACE = (char)0xa2; */
-    img::address address = m_pc + value + instruction_size;
+    img_address address = m_pc + value + instruction_size;
     /* symbol replacement */
-    /* return img::as_char(TOKEN_REPLACE) + to_string(address); */
+    /* return img_as_char(TOKEN_REPLACE) + to_string(address); */
     return to_string(address);
 }
 
@@ -1807,7 +1794,7 @@ std::string NMD::ABS_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string fd = FPR(copy(fd_value));
 
-    return img::format("ABS.D %s, %s", fd, fs);
+    return img_format("ABS.D %s, %s", fd, fs);
 }
 
 
@@ -1829,7 +1816,7 @@ std::string NMD::ABS_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string fd = FPR(copy(fd_value));
 
-    return img::format("ABS.S %s, %s", fd, fs);
+    return img_format("ABS.S %s, %s", fd, fs);
 }
 
 
@@ -1851,7 +1838,7 @@ std::string NMD::ABSQ_S_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("ABSQ_S.PH %s, %s", rt, rs);
+    return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
 
 
@@ -1873,7 +1860,7 @@ std::string NMD::ABSQ_S_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("ABSQ_S.QB %s, %s", rt, rs);
+    return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
 
 
@@ -1895,7 +1882,7 @@ std::string NMD::ABSQ_S_W(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("ABSQ_S.W %s, %s", rt, rs);
+    return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
 
 
@@ -1918,7 +1905,7 @@ std::string NMD::ACLR(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("ACLR %s, %s(%s)", bit, s, rs);
+    return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
 
 
@@ -1941,7 +1928,7 @@ std::string NMD::ADD(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADD %s, %s, %s", rd, rs, rt);
+    return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -1966,7 +1953,7 @@ std::string NMD::ADD_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string fd = FPR(copy(fd_value));
 
-    return img::format("ADD.D %s, %s, %s", fd, fs, ft);
+    return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -1991,7 +1978,7 @@ std::string NMD::ADD_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string fd = FPR(copy(fd_value));
 
-    return img::format("ADD.S %s, %s, %s", fd, fs, ft);
+    return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -2014,7 +2001,7 @@ std::string NMD::ADDIU_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("ADDIU %s, %s, %s", rt, rs, u);
+    return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -2035,7 +2022,7 @@ std::string NMD::ADDIU_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = IMMEDIATE(copy(s_value));
 
-    return img::format("ADDIU %s, %s", rt, s);
+    return img_format("ADDIU %s, %s", rt, s);
 }
 
 
@@ -2056,7 +2043,7 @@ std::string NMD::ADDIU_GP48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = IMMEDIATE(copy(s_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt, 28, s);
+    return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
 
 
@@ -2077,7 +2064,7 @@ std::string NMD::ADDIU_GP_B_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt, 28, u);
+    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
 
 
@@ -2098,7 +2085,7 @@ std::string NMD::ADDIU_GP_W_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt, 28, u);
+    return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
 
 
@@ -2121,7 +2108,7 @@ std::string NMD::ADDIU_NEG_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(neg_copy(u_value));
 
-    return img::format("ADDIU %s, %s, %s", rt, rs, u);
+    return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -2142,7 +2129,7 @@ std::string NMD::ADDIU_R1_SP_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("ADDIU %s, $%d, %s", rt3, 29, u);
+    return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
 
 
@@ -2165,7 +2152,7 @@ std::string NMD::ADDIU_R2_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("ADDIU %s, %s, %s", rt3, rs3, u);
+    return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
 
 
@@ -2185,7 +2172,7 @@ std::string NMD::ADDIU_RS5_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = IMMEDIATE(copy(s_value));
 
-    return img::format("ADDIU %s, %s", rt, s);
+    return img_format("ADDIU %s, %s", rt, s);
 }
 
 
@@ -2207,7 +2194,7 @@ std::string NMD::ADDIUPC_32_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("ADDIUPC %s, %s", rt, s);
+    return img_format("ADDIUPC %s, %s", rt, s);
 }
 
 
@@ -2229,7 +2216,7 @@ std::string NMD::ADDIUPC_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("ADDIUPC %s, %s", rt, s);
+    return img_format("ADDIUPC %s, %s", rt, s);
 }
 
 
@@ -2253,7 +2240,7 @@ std::string NMD::ADDQ_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDQ.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2278,7 +2265,7 @@ std::string NMD::ADDQ_S_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2302,7 +2289,7 @@ std::string NMD::ADDQ_S_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2327,7 +2314,7 @@ std::string NMD::ADDQH_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDQH.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2352,7 +2339,7 @@ std::string NMD::ADDQH_R_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2377,7 +2364,7 @@ std::string NMD::ADDQH_R_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2402,7 +2389,7 @@ std::string NMD::ADDQH_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDQH.W %s, %s, %s", rd, rs, rt);
+    return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2426,7 +2413,7 @@ std::string NMD::ADDSC(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDSC %s, %s, %s", rd, rs, rt);
+    return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2449,7 +2436,7 @@ std::string NMD::ADDU_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
 
-    return img::format("ADDU %s, %s, %s", rd3, rs3, rt3);
+    return img_format("ADDU %s, %s, %s", rd3, rs3, rt3);
 }
 
 
@@ -2473,7 +2460,7 @@ std::string NMD::ADDU_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDU %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2495,7 +2482,7 @@ std::string NMD::ADDU_4X4_(uint64 instruction)
     std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
     std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
-    return img::format("ADDU %s, %s", rs4, rt4);
+    return img_format("ADDU %s, %s", rs4, rt4);
 }
 
 
@@ -2519,7 +2506,7 @@ std::string NMD::ADDU_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDU.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2543,7 +2530,7 @@ std::string NMD::ADDU_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDU.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2568,7 +2555,7 @@ std::string NMD::ADDU_S_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2592,7 +2579,7 @@ std::string NMD::ADDU_S_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2617,7 +2604,7 @@ std::string NMD::ADDUH_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDUH.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2642,7 +2629,7 @@ std::string NMD::ADDUH_R_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
+    return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
 
 /*
@@ -2665,7 +2652,7 @@ std::string NMD::ADDWC(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ADDWC %s, %s, %s", rd, rs, rt);
+    return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2687,7 +2674,7 @@ std::string NMD::ALUIPC(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
+    return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
 
 
@@ -2708,7 +2695,7 @@ std::string NMD::AND_16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("AND %s, %s", rs3, rt3);
+    return img_format("AND %s, %s", rs3, rt3);
 }
 
 
@@ -2732,7 +2719,7 @@ std::string NMD::AND_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("AND %s, %s, %s", rd, rs, rt);
+    return img_format("AND %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -2755,7 +2742,7 @@ std::string NMD::ANDI_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
 
-    return img::format("ANDI %s, %s, %s", rt3, rs3, eu);
+    return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
 }
 
 
@@ -2779,7 +2766,7 @@ std::string NMD::ANDI_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("ANDI %s, %s, %s", rt, rs, u);
+    return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -2803,7 +2790,7 @@ std::string NMD::APPEND(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("APPEND %s, %s, %s", rt, rs, sa);
+    return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -2827,7 +2814,7 @@ std::string NMD::ASET(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("ASET %s, %s(%s)", bit, s, rs);
+    return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
 
 
@@ -2847,7 +2834,7 @@ std::string NMD::BALC_16_(uint64 instruction)
 
     std::string s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BALC %s", s);
+    return img_format("BALC %s", s);
 }
 
 
@@ -2867,7 +2854,7 @@ std::string NMD::BALC_32_(uint64 instruction)
 
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BALC %s", s);
+    return img_format("BALC %s", s);
 }
 
 
@@ -2889,7 +2876,7 @@ std::string NMD::BALRSC(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("BALRSC %s, %s", rt, rs);
+    return img_format("BALRSC %s, %s", rt, rs);
 }
 
 
@@ -2913,7 +2900,7 @@ std::string NMD::BBEQZC(uint64 instruction)
     std::string bit = IMMEDIATE(copy(bit_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BBEQZC %s, %s, %s", rt, bit, s);
+    return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
 
 
@@ -2937,7 +2924,7 @@ std::string NMD::BBNEZC(uint64 instruction)
     std::string bit = IMMEDIATE(copy(bit_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BBNEZC %s, %s, %s", rt, bit, s);
+    return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
 
 
@@ -2957,7 +2944,7 @@ std::string NMD::BC_16_(uint64 instruction)
 
     std::string s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BC %s", s);
+    return img_format("BC %s", s);
 }
 
 
@@ -2977,7 +2964,7 @@ std::string NMD::BC_32_(uint64 instruction)
 
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC %s", s);
+    return img_format("BC %s", s);
 }
 
 
@@ -2999,7 +2986,7 @@ std::string NMD::BC1EQZC(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC1EQZC %s, %s", ft, s);
+    return img_format("BC1EQZC %s, %s", ft, s);
 }
 
 
@@ -3021,7 +3008,7 @@ std::string NMD::BC1NEZC(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC1NEZC %s, %s", ft, s);
+    return img_format("BC1NEZC %s, %s", ft, s);
 }
 
 
@@ -3043,7 +3030,7 @@ std::string NMD::BC2EQZC(uint64 instruction)
     std::string ct = CPR(copy(ct_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC2EQZC %s, %s", ct, s);
+    return img_format("BC2EQZC %s, %s", ct, s);
 }
 
 
@@ -3065,7 +3052,7 @@ std::string NMD::BC2NEZC(uint64 instruction)
     std::string ct = CPR(copy(ct_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BC2NEZC %s, %s", ct, s);
+    return img_format("BC2NEZC %s, %s", ct, s);
 }
 
 
@@ -3089,7 +3076,7 @@ std::string NMD::BEQC_16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = ADDRESS(encode_u_from_address(u_value), 2);
 
-    return img::format("BEQC %s, %s, %s", rs3, rt3, u);
+    return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
 
 
@@ -3113,7 +3100,7 @@ std::string NMD::BEQC_32_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BEQC %s, %s, %s", rs, rt, s);
+    return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3137,7 +3124,7 @@ std::string NMD::BEQIC(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BEQIC %s, %s, %s", rt, u, s);
+    return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3159,7 +3146,7 @@ std::string NMD::BEQZC_16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BEQZC %s, %s", rt3, s);
+    return img_format("BEQZC %s, %s", rt3, s);
 }
 
 
@@ -3183,7 +3170,7 @@ std::string NMD::BGEC(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEC %s, %s, %s", rs, rt, s);
+    return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3207,7 +3194,7 @@ std::string NMD::BGEIC(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEIC %s, %s, %s", rt, u, s);
+    return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3231,7 +3218,7 @@ std::string NMD::BGEIUC(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEIUC %s, %s, %s", rt, u, s);
+    return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3255,7 +3242,7 @@ std::string NMD::BGEUC(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BGEUC %s, %s, %s", rs, rt, s);
+    return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3279,7 +3266,7 @@ std::string NMD::BLTC(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTC %s, %s, %s", rs, rt, s);
+    return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3303,7 +3290,7 @@ std::string NMD::BLTIC(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTIC %s, %s, %s", rt, u, s);
+    return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3327,7 +3314,7 @@ std::string NMD::BLTIUC(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTIUC %s, %s, %s", rt, u, s);
+    return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3351,7 +3338,7 @@ std::string NMD::BLTUC(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BLTUC %s, %s, %s", rs, rt, s);
+    return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3375,7 +3362,7 @@ std::string NMD::BNEC_16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = ADDRESS(encode_u_from_address(u_value), 2);
 
-    return img::format("BNEC %s, %s, %s", rs3, rt3, u);
+    return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
 
 
@@ -3399,7 +3386,7 @@ std::string NMD::BNEC_32_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BNEC %s, %s, %s", rs, rt, s);
+    return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
 
 
@@ -3423,7 +3410,7 @@ std::string NMD::BNEIC(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BNEIC %s, %s, %s", rt, u, s);
+    return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
 
 
@@ -3445,7 +3432,7 @@ std::string NMD::BNEZC_16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 2);
 
-    return img::format("BNEZC %s, %s", rt3, s);
+    return img_format("BNEZC %s, %s", rt3, s);
 }
 
 
@@ -3465,7 +3452,7 @@ std::string NMD::BPOSGE32C(uint64 instruction)
 
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("BPOSGE32C %s", s);
+    return img_format("BPOSGE32C %s", s);
 }
 
 
@@ -3485,7 +3472,7 @@ std::string NMD::BREAK_16_(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("BREAK %s", code);
+    return img_format("BREAK %s", code);
 }
 
 
@@ -3505,7 +3492,7 @@ std::string NMD::BREAK_32_(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("BREAK %s", code);
+    return img_format("BREAK %s", code);
 }
 
 
@@ -3525,7 +3512,7 @@ std::string NMD::BRSC(uint64 instruction)
 
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("BRSC %s", rs);
+    return img_format("BRSC %s", rs);
 }
 
 
@@ -3549,7 +3536,7 @@ std::string NMD::CACHE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("CACHE %s, %s(%s)", op, s, rs);
+    return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
 
 
@@ -3573,7 +3560,7 @@ std::string NMD::CACHEE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("CACHEE %s, %s(%s)", op, s, rs);
+    return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
 
 
@@ -3595,7 +3582,7 @@ std::string NMD::CEIL_L_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CEIL.L.D %s, %s", ft, fs);
+    return img_format("CEIL.L.D %s, %s", ft, fs);
 }
 
 
@@ -3617,7 +3604,7 @@ std::string NMD::CEIL_L_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CEIL.L.S %s, %s", ft, fs);
+    return img_format("CEIL.L.S %s, %s", ft, fs);
 }
 
 
@@ -3639,7 +3626,7 @@ std::string NMD::CEIL_W_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CEIL.W.D %s, %s", ft, fs);
+    return img_format("CEIL.W.D %s, %s", ft, fs);
 }
 
 
@@ -3661,7 +3648,7 @@ std::string NMD::CEIL_W_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CEIL.W.S %s, %s", ft, fs);
+    return img_format("CEIL.W.S %s, %s", ft, fs);
 }
 
 
@@ -3683,7 +3670,7 @@ std::string NMD::CFC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("CFC1 %s, %s", rt, cs);
+    return img_format("CFC1 %s, %s", rt, cs);
 }
 
 
@@ -3705,7 +3692,7 @@ std::string NMD::CFC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("CFC2 %s, %s", rt, cs);
+    return img_format("CFC2 %s, %s", rt, cs);
 }
 
 
@@ -3727,7 +3714,7 @@ std::string NMD::CLASS_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CLASS.D %s, %s", ft, fs);
+    return img_format("CLASS.D %s, %s", ft, fs);
 }
 
 
@@ -3749,7 +3736,7 @@ std::string NMD::CLASS_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CLASS.S %s, %s", ft, fs);
+    return img_format("CLASS.S %s, %s", ft, fs);
 }
 
 
@@ -3771,7 +3758,7 @@ std::string NMD::CLO(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("CLO %s, %s", rt, rs);
+    return img_format("CLO %s, %s", rt, rs);
 }
 
 
@@ -3793,7 +3780,7 @@ std::string NMD::CLZ(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("CLZ %s, %s", rt, rs);
+    return img_format("CLZ %s, %s", rt, rs);
 }
 
 
@@ -3817,7 +3804,7 @@ std::string NMD::CMP_AF_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.AF.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3841,7 +3828,7 @@ std::string NMD::CMP_AF_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.AF.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3865,7 +3852,7 @@ std::string NMD::CMP_EQ_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3886,7 +3873,7 @@ std::string NMD::CMP_EQ_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMP.EQ.PH %s, %s", rs, rt);
+    return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
 
 
@@ -3910,7 +3897,7 @@ std::string NMD::CMP_EQ_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3934,7 +3921,7 @@ std::string NMD::CMP_LE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.LE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -3955,7 +3942,7 @@ std::string NMD::CMP_LE_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMP.LE.PH %s, %s", rs, rt);
+    return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
 
 
@@ -3979,7 +3966,7 @@ std::string NMD::CMP_LE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.LE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4003,7 +3990,7 @@ std::string NMD::CMP_LT_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.LT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4024,7 +4011,7 @@ std::string NMD::CMP_LT_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMP.LT.PH %s, %s", rs, rt);
+    return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
 
 
@@ -4048,7 +4035,7 @@ std::string NMD::CMP_LT_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.LT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4072,7 +4059,7 @@ std::string NMD::CMP_NE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.NE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4096,7 +4083,7 @@ std::string NMD::CMP_NE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.NE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4120,7 +4107,7 @@ std::string NMD::CMP_OR_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.OR.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4144,7 +4131,7 @@ std::string NMD::CMP_OR_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.OR.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4168,7 +4155,7 @@ std::string NMD::CMP_SAF_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4192,7 +4179,7 @@ std::string NMD::CMP_SAF_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4216,7 +4203,7 @@ std::string NMD::CMP_SEQ_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4240,7 +4227,7 @@ std::string NMD::CMP_SEQ_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4264,7 +4251,7 @@ std::string NMD::CMP_SLE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4288,7 +4275,7 @@ std::string NMD::CMP_SLE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4312,7 +4299,7 @@ std::string NMD::CMP_SLT_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4336,7 +4323,7 @@ std::string NMD::CMP_SLT_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4360,7 +4347,7 @@ std::string NMD::CMP_SNE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4384,7 +4371,7 @@ std::string NMD::CMP_SNE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4408,7 +4395,7 @@ std::string NMD::CMP_SOR_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4432,7 +4419,7 @@ std::string NMD::CMP_SOR_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4456,7 +4443,7 @@ std::string NMD::CMP_SUEQ_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4480,7 +4467,7 @@ std::string NMD::CMP_SUEQ_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4504,7 +4491,7 @@ std::string NMD::CMP_SULE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4528,7 +4515,7 @@ std::string NMD::CMP_SULE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4552,7 +4539,7 @@ std::string NMD::CMP_SULT_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4576,7 +4563,7 @@ std::string NMD::CMP_SULT_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4600,7 +4587,7 @@ std::string NMD::CMP_SUN_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4624,7 +4611,7 @@ std::string NMD::CMP_SUNE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4648,7 +4635,7 @@ std::string NMD::CMP_SUNE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4672,7 +4659,7 @@ std::string NMD::CMP_SUN_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4696,7 +4683,7 @@ std::string NMD::CMP_UEQ_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4720,7 +4707,7 @@ std::string NMD::CMP_UEQ_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4744,7 +4731,7 @@ std::string NMD::CMP_ULE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4768,7 +4755,7 @@ std::string NMD::CMP_ULE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4792,7 +4779,7 @@ std::string NMD::CMP_ULT_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4816,7 +4803,7 @@ std::string NMD::CMP_ULT_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4840,7 +4827,7 @@ std::string NMD::CMP_UN_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.UN.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4864,7 +4851,7 @@ std::string NMD::CMP_UNE_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4888,7 +4875,7 @@ std::string NMD::CMP_UNE_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4912,7 +4899,7 @@ std::string NMD::CMP_UN_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("CMP.UN.S %s, %s, %s", fd, fs, ft);
+    return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -4937,7 +4924,7 @@ std::string NMD::CMPGDU_EQ_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -4962,7 +4949,7 @@ std::string NMD::CMPGDU_LE_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -4987,7 +4974,7 @@ std::string NMD::CMPGDU_LT_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5012,7 +4999,7 @@ std::string NMD::CMPGU_EQ_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5037,7 +5024,7 @@ std::string NMD::CMPGU_LE_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5062,7 +5049,7 @@ std::string NMD::CMPGU_LT_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
+    return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5084,7 +5071,7 @@ std::string NMD::CMPU_EQ_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPU.EQ.QB %s, %s", rs, rt);
+    return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
 
 
@@ -5106,7 +5093,7 @@ std::string NMD::CMPU_LE_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPU.LE.QB %s, %s", rs, rt);
+    return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
 
 
@@ -5128,7 +5115,7 @@ std::string NMD::CMPU_LT_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("CMPU.LT.QB %s, %s", rs, rt);
+    return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
 
 
@@ -5148,7 +5135,7 @@ std::string NMD::COP2_1(uint64 instruction)
 
     std::string cofun = IMMEDIATE(copy(cofun_value));
 
-    return img::format("COP2_1 %s", cofun);
+    return img_format("COP2_1 %s", cofun);
 }
 
 
@@ -5170,7 +5157,7 @@ std::string NMD::CTC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("CTC1 %s, %s", rt, cs);
+    return img_format("CTC1 %s, %s", rt, cs);
 }
 
 
@@ -5192,7 +5179,7 @@ std::string NMD::CTC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("CTC2 %s, %s", rt, cs);
+    return img_format("CTC2 %s, %s", rt, cs);
 }
 
 
@@ -5214,7 +5201,7 @@ std::string NMD::CVT_D_L(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.D.L %s, %s", ft, fs);
+    return img_format("CVT.D.L %s, %s", ft, fs);
 }
 
 
@@ -5236,7 +5223,7 @@ std::string NMD::CVT_D_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.D.S %s, %s", ft, fs);
+    return img_format("CVT.D.S %s, %s", ft, fs);
 }
 
 
@@ -5258,7 +5245,7 @@ std::string NMD::CVT_D_W(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.D.W %s, %s", ft, fs);
+    return img_format("CVT.D.W %s, %s", ft, fs);
 }
 
 
@@ -5280,7 +5267,7 @@ std::string NMD::CVT_L_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.L.D %s, %s", ft, fs);
+    return img_format("CVT.L.D %s, %s", ft, fs);
 }
 
 
@@ -5302,7 +5289,7 @@ std::string NMD::CVT_L_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.L.S %s, %s", ft, fs);
+    return img_format("CVT.L.S %s, %s", ft, fs);
 }
 
 
@@ -5324,7 +5311,7 @@ std::string NMD::CVT_S_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.S.D %s, %s", ft, fs);
+    return img_format("CVT.S.D %s, %s", ft, fs);
 }
 
 
@@ -5346,7 +5333,7 @@ std::string NMD::CVT_S_L(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.S.L %s, %s", ft, fs);
+    return img_format("CVT.S.L %s, %s", ft, fs);
 }
 
 
@@ -5368,7 +5355,7 @@ std::string NMD::CVT_S_PL(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.S.PL %s, %s", ft, fs);
+    return img_format("CVT.S.PL %s, %s", ft, fs);
 }
 
 
@@ -5390,7 +5377,7 @@ std::string NMD::CVT_S_PU(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.S.PU %s, %s", ft, fs);
+    return img_format("CVT.S.PU %s, %s", ft, fs);
 }
 
 
@@ -5412,7 +5399,7 @@ std::string NMD::CVT_S_W(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.S.W %s, %s", ft, fs);
+    return img_format("CVT.S.W %s, %s", ft, fs);
 }
 
 
@@ -5434,7 +5421,7 @@ std::string NMD::CVT_W_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.W.D %s, %s", ft, fs);
+    return img_format("CVT.W.D %s, %s", ft, fs);
 }
 
 
@@ -5456,7 +5443,7 @@ std::string NMD::CVT_W_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("CVT.W.S %s, %s", ft, fs);
+    return img_format("CVT.W.S %s, %s", ft, fs);
 }
 
 
@@ -5478,7 +5465,7 @@ std::string NMD::DADDIU_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = IMMEDIATE(copy(s_value));
 
-    return img::format("DADDIU %s, %s", rt, s);
+    return img_format("DADDIU %s, %s", rt, s);
 }
 
 
@@ -5502,7 +5489,7 @@ std::string NMD::DADDIU_NEG_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(neg_copy(u_value));
 
-    return img::format("DADDIU %s, %s, %s", rt, rs, u);
+    return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -5526,7 +5513,7 @@ std::string NMD::DADDIU_U12_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("DADDIU %s, %s, %s", rt, rs, u);
+    return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -5550,7 +5537,7 @@ std::string NMD::DADD(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DADD %s, %s, %s", rd, rs, rt);
+    return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5574,7 +5561,7 @@ std::string NMD::DADDU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DADDU %s, %s, %s", rd, rs, rt);
+    return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5596,7 +5583,7 @@ std::string NMD::DCLO(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("DCLO %s, %s", rt, rs);
+    return img_format("DCLO %s, %s", rt, rs);
 }
 
 
@@ -5618,7 +5605,7 @@ std::string NMD::DCLZ(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("DCLZ %s, %s", rt, rs);
+    return img_format("DCLZ %s, %s", rt, rs);
 }
 
 
@@ -5642,7 +5629,7 @@ std::string NMD::DDIV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DDIV %s, %s, %s", rd, rs, rt);
+    return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5666,7 +5653,7 @@ std::string NMD::DDIVU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DDIVU %s, %s, %s", rd, rs, rt);
+    return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5710,7 +5697,7 @@ std::string NMD::DEXTM(uint64 instruction)
     std::string lsb = IMMEDIATE(copy(lsb_value));
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img::format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -5736,7 +5723,7 @@ std::string NMD::DEXT(uint64 instruction)
     std::string lsb = IMMEDIATE(copy(lsb_value));
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img::format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -5762,7 +5749,7 @@ std::string NMD::DEXTU(uint64 instruction)
     std::string lsb = IMMEDIATE(copy(lsb_value));
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img::format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -5789,7 +5776,7 @@ std::string NMD::DINSM(uint64 instruction)
     std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -5817,7 +5804,7 @@ std::string NMD::DINS(uint64 instruction)
     std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("DINS %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -5845,7 +5832,7 @@ std::string NMD::DINSU(uint64 instruction)
     std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -5866,7 +5853,7 @@ std::string NMD::DI(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DI %s", rt);
+    return img_format("DI %s", rt);
 }
 
 
@@ -5890,7 +5877,7 @@ std::string NMD::DIV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DIV %s, %s, %s", rd, rs, rt);
+    return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5914,7 +5901,7 @@ std::string NMD::DIV_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("DIV.D %s, %s, %s", fd, fs, ft);
+    return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -5938,7 +5925,7 @@ std::string NMD::DIV_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("DIV.S %s, %s, %s", fd, fs, ft);
+    return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -5962,7 +5949,7 @@ std::string NMD::DIVU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DIVU %s, %s, %s", rd, rs, rt);
+    return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -5988,7 +5975,7 @@ std::string NMD::DLSA(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u2 = IMMEDIATE(copy(u2_value));
 
-    return img::format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
+    return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
 
 
@@ -6010,7 +5997,7 @@ std::string NMD::DLUI_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("DLUI %s, %s", rt, u);
+    return img_format("DLUI %s, %s", rt, u);
 }
 
 
@@ -6034,7 +6021,7 @@ std::string NMD::DMFC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("DMFC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6056,7 +6043,7 @@ std::string NMD::DMFC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("DMFC1 %s, %s", rt, fs);
+    return img_format("DMFC1 %s, %s", rt, fs);
 }
 
 
@@ -6078,7 +6065,7 @@ std::string NMD::DMFC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("DMFC2 %s, %s", rt, cs);
+    return img_format("DMFC2 %s, %s", rt, cs);
 }
 
 
@@ -6102,7 +6089,7 @@ std::string NMD::DMFGC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("DMFGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6126,7 +6113,7 @@ std::string NMD::DMOD(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DMOD %s, %s, %s", rd, rs, rt);
+    return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6150,7 +6137,7 @@ std::string NMD::DMODU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DMODU %s, %s, %s", rd, rs, rt);
+    return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6174,7 +6161,7 @@ std::string NMD::DMTC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("DMTC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6196,7 +6183,7 @@ std::string NMD::DMTC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("DMTC1 %s, %s", rt, fs);
+    return img_format("DMTC1 %s, %s", rt, fs);
 }
 
 
@@ -6218,7 +6205,7 @@ std::string NMD::DMTC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("DMTC2 %s, %s", rt, cs);
+    return img_format("DMTC2 %s, %s", rt, cs);
 }
 
 
@@ -6242,7 +6229,7 @@ std::string NMD::DMTGC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("DMTGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -6262,7 +6249,7 @@ std::string NMD::DMT(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DMT %s", rt);
+    return img_format("DMT %s", rt);
 }
 
 
@@ -6286,7 +6273,7 @@ std::string NMD::DMUH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DMUH %s, %s, %s", rd, rs, rt);
+    return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6310,7 +6297,7 @@ std::string NMD::DMUHU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DMUHU %s, %s, %s", rd, rs, rt);
+    return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6334,7 +6321,7 @@ std::string NMD::DMUL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DMUL %s, %s, %s", rd, rs, rt);
+    return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6358,7 +6345,7 @@ std::string NMD::DMULU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DMULU %s, %s, %s", rd, rs, rt);
+    return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6383,7 +6370,7 @@ std::string NMD::DPA_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6407,7 +6394,7 @@ std::string NMD::DPAQ_SA_L_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6431,7 +6418,7 @@ std::string NMD::DPAQ_S_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6455,7 +6442,7 @@ std::string NMD::DPAQX_SA_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6479,7 +6466,7 @@ std::string NMD::DPAQX_S_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6503,7 +6490,7 @@ std::string NMD::DPAU_H_QBL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
+    return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6527,7 +6514,7 @@ std::string NMD::DPAU_H_QBR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
+    return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6551,7 +6538,7 @@ std::string NMD::DPAX_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6575,7 +6562,7 @@ std::string NMD::DPS_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPS.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6599,7 +6586,7 @@ std::string NMD::DPSQ_SA_L_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6623,7 +6610,7 @@ std::string NMD::DPSQ_S_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6647,7 +6634,7 @@ std::string NMD::DPSQX_SA_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6671,7 +6658,7 @@ std::string NMD::DPSQX_S_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6695,7 +6682,7 @@ std::string NMD::DPSU_H_QBL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
+    return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6719,7 +6706,7 @@ std::string NMD::DPSU_H_QBR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
+    return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6743,7 +6730,7 @@ std::string NMD::DPSX_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -6767,7 +6754,7 @@ std::string NMD::DROTR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DROTR %s, %s, %s", rt, rs, shift);
+    return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6791,7 +6778,7 @@ std::string NMD::DROTR32(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DROTR32 %s, %s, %s", rt, rs, shift);
+    return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6815,7 +6802,7 @@ std::string NMD::DROTRV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DROTRV %s, %s, %s", rd, rs, rt);
+    return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6841,7 +6828,7 @@ std::string NMD::DROTX(uint64 instruction)
     std::string shift = IMMEDIATE(copy(shift_value));
     std::string shiftx = IMMEDIATE(copy(shiftx_value));
 
-    return img::format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
+    return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
 
 
@@ -6865,7 +6852,7 @@ std::string NMD::DSLL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DSLL %s, %s, %s", rt, rs, shift);
+    return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6889,7 +6876,7 @@ std::string NMD::DSLL32(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DSLL32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6913,7 +6900,7 @@ std::string NMD::DSLLV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DSLLV %s, %s, %s", rd, rs, rt);
+    return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -6937,7 +6924,7 @@ std::string NMD::DSRA(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DSRA %s, %s, %s", rt, rs, shift);
+    return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6961,7 +6948,7 @@ std::string NMD::DSRA32(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DSRA32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -6985,7 +6972,7 @@ std::string NMD::DSRAV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DSRAV %s, %s, %s", rd, rs, rt);
+    return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7009,7 +6996,7 @@ std::string NMD::DSRL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DSRL %s, %s, %s", rt, rs, shift);
+    return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -7033,7 +7020,7 @@ std::string NMD::DSRL32(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("DSRL32 %s, %s, %s", rt, rs, shift);
+    return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -7057,7 +7044,7 @@ std::string NMD::DSRLV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DSRLV %s, %s, %s", rd, rs, rt);
+    return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7081,7 +7068,7 @@ std::string NMD::DSUB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DSUB %s, %s, %s", rd, rs, rt);
+    return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7105,7 +7092,7 @@ std::string NMD::DSUBU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DSUBU %s, %s, %s", rd, rs, rt);
+    return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7125,7 +7112,7 @@ std::string NMD::DVPE(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DVPE %s", rt);
+    return img_format("DVPE %s", rt);
 }
 
 
@@ -7145,7 +7132,7 @@ std::string NMD::DVP(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("DVP %s", rt);
+    return img_format("DVP %s", rt);
 }
 
 
@@ -7183,7 +7170,7 @@ std::string NMD::EI(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("EI %s", rt);
+    return img_format("EI %s", rt);
 }
 
 
@@ -7203,7 +7190,7 @@ std::string NMD::EMT(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("EMT %s", rt);
+    return img_format("EMT %s", rt);
 }
 
 
@@ -7259,7 +7246,7 @@ std::string NMD::EVP(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("EVP %s", rt);
+    return img_format("EVP %s", rt);
 }
 
 
@@ -7279,7 +7266,7 @@ std::string NMD::EVPE(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("EVPE %s", rt);
+    return img_format("EVPE %s", rt);
 }
 
 
@@ -7305,7 +7292,7 @@ std::string NMD::EXT(uint64 instruction)
     std::string lsb = IMMEDIATE(copy(lsb_value));
     std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
-    return img::format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
+    return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
 
 
@@ -7331,7 +7318,7 @@ std::string NMD::EXTD(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
 
 
@@ -7357,7 +7344,7 @@ std::string NMD::EXTD32(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
 
 
@@ -7381,7 +7368,7 @@ std::string NMD::EXTPDP(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string size = IMMEDIATE(copy(size_value));
 
-    return img::format("EXTPDP %s, %s, %s", rt, ac, size);
+    return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
 
 
@@ -7405,7 +7392,7 @@ std::string NMD::EXTPDPV(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("EXTPDPV %s, %s, %s", rt, ac, rs);
+    return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7429,7 +7416,7 @@ std::string NMD::EXTP(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string size = IMMEDIATE(copy(size_value));
 
-    return img::format("EXTP %s, %s, %s", rt, ac, size);
+    return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
 
 
@@ -7453,7 +7440,7 @@ std::string NMD::EXTPV(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("EXTPV %s, %s, %s", rt, ac, rs);
+    return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7478,7 +7465,7 @@ std::string NMD::EXTR_RS_W(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7503,7 +7490,7 @@ std::string NMD::EXTR_R_W(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("EXTR_R.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7528,7 +7515,7 @@ std::string NMD::EXTR_S_H(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("EXTR_S.H %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7553,7 +7540,7 @@ std::string NMD::EXTR_W(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("EXTR.W %s, %s, %s", rt, ac, shift);
+    return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
 
 
@@ -7578,7 +7565,7 @@ std::string NMD::EXTRV_RS_W(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7603,7 +7590,7 @@ std::string NMD::EXTRV_R_W(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7628,7 +7615,7 @@ std::string NMD::EXTRV_S_H(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7653,7 +7640,7 @@ std::string NMD::EXTRV_W(uint64 instruction)
     std::string ac = AC(copy(ac_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("EXTRV.W %s, %s, %s", rt, ac, rs);
+    return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
 
 
@@ -7680,7 +7667,7 @@ std::string NMD::EXTW(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
+    return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
 
 
@@ -7702,7 +7689,7 @@ std::string NMD::FLOOR_L_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("FLOOR.L.D %s, %s", ft, fs);
+    return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
 
 
@@ -7724,7 +7711,7 @@ std::string NMD::FLOOR_L_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("FLOOR.L.S %s, %s", ft, fs);
+    return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
 
 
@@ -7746,7 +7733,7 @@ std::string NMD::FLOOR_W_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("FLOOR.W.D %s, %s", ft, fs);
+    return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
 
 
@@ -7768,7 +7755,7 @@ std::string NMD::FLOOR_W_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("FLOOR.W.S %s, %s", ft, fs);
+    return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
 
 
@@ -7792,7 +7779,7 @@ std::string NMD::FORK(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("FORK %s, %s, %s", rd, rs, rt);
+    return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -7812,7 +7799,7 @@ std::string NMD::HYPCALL(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("HYPCALL %s", code);
+    return img_format("HYPCALL %s", code);
 }
 
 
@@ -7832,7 +7819,7 @@ std::string NMD::HYPCALL_16_(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("HYPCALL %s", code);
+    return img_format("HYPCALL %s", code);
 }
 
 
@@ -7859,7 +7846,7 @@ std::string NMD::INS(uint64 instruction)
     std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("INS %s, %s, %s, %s", rt, rs, pos, size);
+    return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
     /* hand edited */
 }
 
@@ -7881,7 +7868,7 @@ std::string NMD::INSV(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("INSV %s, %s", rt, rs);
+    return img_format("INSV %s, %s", rt, rs);
 }
 
 
@@ -7919,7 +7906,7 @@ std::string NMD::JALRC_16_(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("JALRC $%d, %s", 31, rt);
+    return img_format("JALRC $%d, %s", 31, rt);
 }
 
 
@@ -7941,7 +7928,7 @@ std::string NMD::JALRC_32_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("JALRC %s, %s", rt, rs);
+    return img_format("JALRC %s, %s", rt, rs);
 }
 
 
@@ -7963,7 +7950,7 @@ std::string NMD::JALRC_HB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("JALRC.HB %s, %s", rt, rs);
+    return img_format("JALRC.HB %s, %s", rt, rs);
 }
 
 
@@ -7983,7 +7970,7 @@ std::string NMD::JRC(uint64 instruction)
 
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("JRC %s", rt);
+    return img_format("JRC %s", rt);
 }
 
 
@@ -8007,7 +7994,7 @@ std::string NMD::LB_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LB %s, %s(%s)", rt3, u, rs3);
+    return img_format("LB %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8029,7 +8016,7 @@ std::string NMD::LB_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LB %s, %s($%d)", rt, u, 28);
+    return img_format("LB %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8053,7 +8040,7 @@ std::string NMD::LB_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LB %s, %s(%s)", rt, s, rs);
+    return img_format("LB %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8077,7 +8064,7 @@ std::string NMD::LB_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LB %s, %s(%s)", rt, u, rs);
+    return img_format("LB %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8101,7 +8088,7 @@ std::string NMD::LBE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LBE %s, %s(%s)", rt, s, rs);
+    return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8125,7 +8112,7 @@ std::string NMD::LBU_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LBU %s, %s(%s)", rt3, u, rs3);
+    return img_format("LBU %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8147,7 +8134,7 @@ std::string NMD::LBU_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LBU %s, %s($%d)", rt, u, 28);
+    return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8171,7 +8158,7 @@ std::string NMD::LBU_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LBU %s, %s(%s)", rt, s, rs);
+    return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8195,7 +8182,7 @@ std::string NMD::LBU_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LBU %s, %s(%s)", rt, u, rs);
+    return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8219,7 +8206,7 @@ std::string NMD::LBUE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LBUE %s, %s(%s)", rt, s, rs);
+    return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8243,7 +8230,7 @@ std::string NMD::LBUX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LBUX %s, %s(%s)", rd, rs, rt);
+    return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8267,7 +8254,7 @@ std::string NMD::LBX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LBX %s, %s(%s)", rd, rs, rt);
+    return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8289,7 +8276,7 @@ std::string NMD::LD_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LD %s, %s($%d)", rt, u, 28);
+    return img_format("LD %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8313,7 +8300,7 @@ std::string NMD::LD_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LD %s, %s(%s)", rt, s, rs);
+    return img_format("LD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8337,7 +8324,7 @@ std::string NMD::LD_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LD %s, %s(%s)", rt, u, rs);
+    return img_format("LD %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8359,7 +8346,7 @@ std::string NMD::LDC1_GP_(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LDC1 %s, %s($%d)", ft, u, 28);
+    return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -8383,7 +8370,7 @@ std::string NMD::LDC1_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LDC1 %s, %s(%s)", ft, s, rs);
+    return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -8407,7 +8394,7 @@ std::string NMD::LDC1_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LDC1 %s, %s(%s)", ft, u, rs);
+    return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -8431,7 +8418,7 @@ std::string NMD::LDC1XS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LDC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -8455,7 +8442,7 @@ std::string NMD::LDC1X(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LDC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -8479,7 +8466,7 @@ std::string NMD::LDC2(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LDC2 %s, %s(%s)", ct, s, rs);
+    return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
 
 
@@ -8505,7 +8492,7 @@ std::string NMD::LDM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("LDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -8527,7 +8514,7 @@ std::string NMD::LDPC_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("LDPC %s, %s", rt, s);
+    return img_format("LDPC %s, %s", rt, s);
 }
 
 
@@ -8551,7 +8538,7 @@ std::string NMD::LDX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LDX %s, %s(%s)", rd, rs, rt);
+    return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8575,7 +8562,7 @@ std::string NMD::LDXS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LDXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8599,7 +8586,7 @@ std::string NMD::LH_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LH %s, %s(%s)", rt3, u, rs3);
+    return img_format("LH %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8621,7 +8608,7 @@ std::string NMD::LH_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LH %s, %s($%d)", rt, u, 28);
+    return img_format("LH %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8645,7 +8632,7 @@ std::string NMD::LH_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LH %s, %s(%s)", rt, s, rs);
+    return img_format("LH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8669,7 +8656,7 @@ std::string NMD::LH_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LH %s, %s(%s)", rt, u, rs);
+    return img_format("LH %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8693,7 +8680,7 @@ std::string NMD::LHE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LHE %s, %s(%s)", rt, s, rs);
+    return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8717,7 +8704,7 @@ std::string NMD::LHU_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LHU %s, %s(%s)", rt3, u, rs3);
+    return img_format("LHU %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -8739,7 +8726,7 @@ std::string NMD::LHU_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LHU %s, %s($%d)", rt, u, 28);
+    return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -8763,7 +8750,7 @@ std::string NMD::LHU_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LHU %s, %s(%s)", rt, s, rs);
+    return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8787,7 +8774,7 @@ std::string NMD::LHU_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LHU %s, %s(%s)", rt, u, rs);
+    return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -8811,7 +8798,7 @@ std::string NMD::LHUE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LHUE %s, %s(%s)", rt, s, rs);
+    return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8835,7 +8822,7 @@ std::string NMD::LHUX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LHUX %s, %s(%s)", rd, rs, rt);
+    return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8859,7 +8846,7 @@ std::string NMD::LHUXS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LHUXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8883,7 +8870,7 @@ std::string NMD::LHXS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LHXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8907,7 +8894,7 @@ std::string NMD::LHX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LHX %s, %s(%s)", rd, rs, rt);
+    return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -8929,7 +8916,7 @@ std::string NMD::LI_16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
 
-    return img::format("LI %s, %s", rt3, eu);
+    return img_format("LI %s, %s", rt3, eu);
 }
 
 
@@ -8951,7 +8938,7 @@ std::string NMD::LI_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = IMMEDIATE(copy(s_value));
 
-    return img::format("LI %s, %s", rt, s);
+    return img_format("LI %s, %s", rt, s);
 }
 
 
@@ -8975,7 +8962,7 @@ std::string NMD::LL(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LL %s, %s(%s)", rt, s, rs);
+    return img_format("LL %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -8999,7 +8986,7 @@ std::string NMD::LLD(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LLD %s, %s(%s)", rt, s, rs);
+    return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9023,7 +9010,7 @@ std::string NMD::LLDP(uint64 instruction)
     std::string ru = GPR(copy(ru_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LLDP %s, %s, (%s)", rt, ru, rs);
+    return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -9047,7 +9034,7 @@ std::string NMD::LLE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LLE %s, %s(%s)", rt, s, rs);
+    return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9071,7 +9058,7 @@ std::string NMD::LLWP(uint64 instruction)
     std::string ru = GPR(copy(ru_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LLWP %s, %s, (%s)", rt, ru, rs);
+    return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -9095,7 +9082,7 @@ std::string NMD::LLWPE(uint64 instruction)
     std::string ru = GPR(copy(ru_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LLWPE %s, %s, (%s)", rt, ru, rs);
+    return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -9121,7 +9108,7 @@ std::string NMD::LSA(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u2 = IMMEDIATE(copy(u2_value));
 
-    return img::format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
+    return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
 
 
@@ -9143,7 +9130,7 @@ std::string NMD::LUI(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = IMMEDIATE(copy(s_value));
 
-    return img::format("LUI %s, %%hi(%s)", rt, s);
+    return img_format("LUI %s, %%hi(%s)", rt, s);
 }
 
 
@@ -9167,7 +9154,7 @@ std::string NMD::LW_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("LW %s, %s(%s)", rt3, u, rs3);
+    return img_format("LW %s, %s(%s)", rt3, u, rs3);
 }
 
 
@@ -9191,7 +9178,7 @@ std::string NMD::LW_4X4_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img::format("LW %s, %s(%s)", rt4, u, rs4);
+    return img_format("LW %s, %s(%s)", rt4, u, rs4);
 }
 
 
@@ -9213,7 +9200,7 @@ std::string NMD::LW_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LW %s, %s($%d)", rt, u, 28);
+    return img_format("LW %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -9235,7 +9222,7 @@ std::string NMD::LW_GP16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LW %s, %s($%d)", rt3, u, 28);
+    return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
 
 
@@ -9259,7 +9246,7 @@ std::string NMD::LW_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LW %s, %s(%s)", rt, s, rs);
+    return img_format("LW %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9281,7 +9268,7 @@ std::string NMD::LW_SP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LW %s, %s($%d)", rt, u, 29);
+    return img_format("LW %s, %s($%d)", rt, u, 29);
 }
 
 
@@ -9305,7 +9292,7 @@ std::string NMD::LW_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LW %s, %s(%s)", rt, u, rs);
+    return img_format("LW %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -9327,7 +9314,7 @@ std::string NMD::LWC1_GP_(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LWC1 %s, %s($%d)", ft, u, 28);
+    return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -9351,7 +9338,7 @@ std::string NMD::LWC1_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LWC1 %s, %s(%s)", ft, s, rs);
+    return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -9375,7 +9362,7 @@ std::string NMD::LWC1_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LWC1 %s, %s(%s)", ft, u, rs);
+    return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -9399,7 +9386,7 @@ std::string NMD::LWC1X(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LWC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -9423,7 +9410,7 @@ std::string NMD::LWC1XS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LWC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -9447,7 +9434,7 @@ std::string NMD::LWC2(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LWC2 %s, %s(%s)", ct, s, rs);
+    return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
 
 
@@ -9471,7 +9458,7 @@ std::string NMD::LWE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LWE %s, %s(%s)", rt, s, rs);
+    return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9497,7 +9484,7 @@ std::string NMD::LWM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("LWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -9519,7 +9506,7 @@ std::string NMD::LWPC_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("LWPC %s, %s", rt, s);
+    return img_format("LWPC %s, %s", rt, s);
 }
 
 
@@ -9541,7 +9528,7 @@ std::string NMD::LWU_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("LWU %s, %s($%d)", rt, u, 28);
+    return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -9565,7 +9552,7 @@ std::string NMD::LWU_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LWU %s, %s(%s)", rt, s, rs);
+    return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -9589,7 +9576,7 @@ std::string NMD::LWU_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("LWU %s, %s(%s)", rt, u, rs);
+    return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -9613,7 +9600,7 @@ std::string NMD::LWUX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LWUX %s, %s(%s)", rd, rs, rt);
+    return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9637,7 +9624,7 @@ std::string NMD::LWUXS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LWUXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9661,7 +9648,7 @@ std::string NMD::LWX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LWX %s, %s(%s)", rd, rs, rt);
+    return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9685,7 +9672,7 @@ std::string NMD::LWXS_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
 
-    return img::format("LWXS %s, %s(%s)", rd3, rs3, rt3);
+    return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
 
 
@@ -9709,7 +9696,7 @@ std::string NMD::LWXS_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("LWXS %s, %s(%s)", rd, rs, rt);
+    return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -9734,7 +9721,7 @@ std::string NMD::MADD_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MADD %s, %s, %s", ac, rs, rt);
+    return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9758,7 +9745,7 @@ std::string NMD::MADDF_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MADDF.D %s, %s, %s", fd, fs, ft);
+    return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9782,7 +9769,7 @@ std::string NMD::MADDF_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MADDF.S %s, %s, %s", fd, fs, ft);
+    return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9807,7 +9794,7 @@ std::string NMD::MADDU_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MADDU %s, %s, %s", ac, rs, rt);
+    return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9832,7 +9819,7 @@ std::string NMD::MAQ_S_W_PHL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9857,7 +9844,7 @@ std::string NMD::MAQ_S_W_PHR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9882,7 +9869,7 @@ std::string NMD::MAQ_SA_W_PHL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9907,7 +9894,7 @@ std::string NMD::MAQ_SA_W_PHR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
+    return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -9931,7 +9918,7 @@ std::string NMD::MAX_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MAX.D %s, %s, %s", fd, fs, ft);
+    return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9955,7 +9942,7 @@ std::string NMD::MAX_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MAX.S %s, %s, %s", fd, fs, ft);
+    return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -9979,7 +9966,7 @@ std::string NMD::MAXA_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MAXA.D %s, %s, %s", fd, fs, ft);
+    return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10003,7 +9990,7 @@ std::string NMD::MAXA_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MAXA.S %s, %s, %s", fd, fs, ft);
+    return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10027,7 +10014,7 @@ std::string NMD::MFC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MFC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10049,7 +10036,7 @@ std::string NMD::MFC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("MFC1 %s, %s", rt, fs);
+    return img_format("MFC1 %s, %s", rt, fs);
 }
 
 
@@ -10071,7 +10058,7 @@ std::string NMD::MFC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("MFC2 %s, %s", rt, cs);
+    return img_format("MFC2 %s, %s", rt, cs);
 }
 
 
@@ -10095,7 +10082,7 @@ std::string NMD::MFGC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MFGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10119,7 +10106,7 @@ std::string NMD::MFHC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MFHC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10141,7 +10128,7 @@ std::string NMD::MFHC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("MFHC1 %s, %s", rt, fs);
+    return img_format("MFHC1 %s, %s", rt, fs);
 }
 
 
@@ -10163,7 +10150,7 @@ std::string NMD::MFHC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("MFHC2 %s, %s", rt, cs);
+    return img_format("MFHC2 %s, %s", rt, cs);
 }
 
 
@@ -10187,7 +10174,7 @@ std::string NMD::MFHGC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MFHGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10208,7 +10195,7 @@ std::string NMD::MFHI_DSP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string ac = AC(copy(ac_value));
 
-    return img::format("MFHI %s, %s", rt, ac);
+    return img_format("MFHI %s, %s", rt, ac);
 }
 
 
@@ -10234,7 +10221,7 @@ std::string NMD::MFHTR(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -10255,7 +10242,7 @@ std::string NMD::MFLO_DSP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string ac = AC(copy(ac_value));
 
-    return img::format("MFLO %s, %s", rt, ac);
+    return img_format("MFLO %s, %s", rt, ac);
 }
 
 
@@ -10281,7 +10268,7 @@ std::string NMD::MFTR(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -10305,7 +10292,7 @@ std::string NMD::MIN_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MIN.D %s, %s, %s", fd, fs, ft);
+    return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10329,7 +10316,7 @@ std::string NMD::MIN_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MIN.S %s, %s, %s", fd, fs, ft);
+    return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10353,7 +10340,7 @@ std::string NMD::MINA_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MINA.D %s, %s, %s", fd, fs, ft);
+    return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10377,7 +10364,7 @@ std::string NMD::MINA_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MINA.S %s, %s, %s", fd, fs, ft);
+    return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10401,7 +10388,7 @@ std::string NMD::MOD(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MOD %s, %s, %s", rd, rs, rt);
+    return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10425,7 +10412,7 @@ std::string NMD::MODSUB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MODSUB %s, %s, %s", rd, rs, rt);
+    return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10449,7 +10436,7 @@ std::string NMD::MODU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MODU %s, %s, %s", rd, rs, rt);
+    return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10471,7 +10458,7 @@ std::string NMD::MOV_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("MOV.D %s, %s", ft, fs);
+    return img_format("MOV.D %s, %s", ft, fs);
 }
 
 
@@ -10493,7 +10480,7 @@ std::string NMD::MOV_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("MOV.S %s, %s", ft, fs);
+    return img_format("MOV.S %s, %s", ft, fs);
 }
 
 
@@ -10517,7 +10504,7 @@ std::string NMD::MOVE_BALC(uint64 instruction)
     std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 4);
 
-    return img::format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
+    return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
 
 
@@ -10543,7 +10530,7 @@ std::string NMD::MOVEP(uint64 instruction)
     std::string rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
     std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
 
-    return img::format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
+    return img_format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
     /* hand edited */
 }
 
@@ -10570,7 +10557,7 @@ std::string NMD::MOVEP_REV_(uint64 instruction)
     std::string rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
 
-    return img::format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
+    return img_format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
     /* hand edited */
 }
 
@@ -10593,7 +10580,7 @@ std::string NMD::MOVE(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("MOVE %s, %s", rt, rs);
+    return img_format("MOVE %s, %s", rt, rs);
 }
 
 
@@ -10617,7 +10604,7 @@ std::string NMD::MOVN(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MOVN %s, %s, %s", rd, rs, rt);
+    return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10641,7 +10628,7 @@ std::string NMD::MOVZ(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MOVZ %s, %s, %s", rd, rs, rt);
+    return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -10665,7 +10652,7 @@ std::string NMD::MSUB_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MSUB %s, %s, %s", ac, rs, rt);
+    return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -10689,7 +10676,7 @@ std::string NMD::MSUBF_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MSUBF.D %s, %s, %s", fd, fs, ft);
+    return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10713,7 +10700,7 @@ std::string NMD::MSUBF_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MSUBF.S %s, %s, %s", fd, fs, ft);
+    return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -10737,7 +10724,7 @@ std::string NMD::MSUBU_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MSUBU %s, %s, %s", ac, rs, rt);
+    return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -10761,7 +10748,7 @@ std::string NMD::MTC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MTC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10783,7 +10770,7 @@ std::string NMD::MTC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("MTC1 %s, %s", rt, fs);
+    return img_format("MTC1 %s, %s", rt, fs);
 }
 
 
@@ -10805,7 +10792,7 @@ std::string NMD::MTC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("MTC2 %s, %s", rt, cs);
+    return img_format("MTC2 %s, %s", rt, cs);
 }
 
 
@@ -10829,7 +10816,7 @@ std::string NMD::MTGC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MTGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10853,7 +10840,7 @@ std::string NMD::MTHC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MTHC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10875,7 +10862,7 @@ std::string NMD::MTHC1(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("MTHC1 %s, %s", rt, fs);
+    return img_format("MTHC1 %s, %s", rt, fs);
 }
 
 
@@ -10897,7 +10884,7 @@ std::string NMD::MTHC2(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string cs = CPR(copy(cs_value));
 
-    return img::format("MTHC2 %s, %s", rt, cs);
+    return img_format("MTHC2 %s, %s", rt, cs);
 }
 
 
@@ -10921,7 +10908,7 @@ std::string NMD::MTHGC0(uint64 instruction)
     std::string c0s = CPR(copy(c0s_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MTHGC0 %s, %s, %s", rt, c0s, sel);
+    return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
 
 
@@ -10942,7 +10929,7 @@ std::string NMD::MTHI_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string ac = AC(copy(ac_value));
 
-    return img::format("MTHI %s, %s", rs, ac);
+    return img_format("MTHI %s, %s", rs, ac);
 }
 
 
@@ -10963,7 +10950,7 @@ std::string NMD::MTHLIP(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string ac = AC(copy(ac_value));
 
-    return img::format("MTHLIP %s, %s", rs, ac);
+    return img_format("MTHLIP %s, %s", rs, ac);
 }
 
 
@@ -10989,7 +10976,7 @@ std::string NMD::MTHTR(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -11010,7 +10997,7 @@ std::string NMD::MTLO_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string ac = AC(copy(ac_value));
 
-    return img::format("MTLO %s, %s", rs, ac);
+    return img_format("MTLO %s, %s", rs, ac);
 }
 
 
@@ -11036,7 +11023,7 @@ std::string NMD::MTTR(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
+    return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
 
 
@@ -11060,7 +11047,7 @@ std::string NMD::MUH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MUH %s, %s, %s", rd, rs, rt);
+    return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11084,7 +11071,7 @@ std::string NMD::MUHU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MUHU %s, %s, %s", rd, rs, rt);
+    return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11108,7 +11095,7 @@ std::string NMD::MUL_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MUL %s, %s, %s", rd, rs, rt);
+    return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11130,7 +11117,7 @@ std::string NMD::MUL_4X4_(uint64 instruction)
     std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
     std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
-    return img::format("MUL %s, %s", rs4, rt4);
+    return img_format("MUL %s, %s", rs4, rt4);
 }
 
 
@@ -11154,7 +11141,7 @@ std::string NMD::MUL_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MUL.D %s, %s, %s", fd, fs, ft);
+    return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -11179,7 +11166,7 @@ std::string NMD::MUL_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MUL.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11204,7 +11191,7 @@ std::string NMD::MUL_S_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MUL_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11228,7 +11215,7 @@ std::string NMD::MUL_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("MUL.S %s, %s, %s", fd, fs, ft);
+    return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -11253,7 +11240,7 @@ std::string NMD::MULEQ_S_W_PHL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
+    return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11278,7 +11265,7 @@ std::string NMD::MULEQ_S_W_PHR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
+    return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11303,7 +11290,7 @@ std::string NMD::MULEU_S_PH_QBL(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
+    return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11328,7 +11315,7 @@ std::string NMD::MULEU_S_PH_QBR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
+    return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11353,7 +11340,7 @@ std::string NMD::MULQ_RS_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11378,7 +11365,7 @@ std::string NMD::MULQ_RS_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11403,7 +11390,7 @@ std::string NMD::MULQ_S_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11428,7 +11415,7 @@ std::string NMD::MULQ_S_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULQ_S.W %s, %s, %s", rd, rs, rt);
+    return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11453,7 +11440,7 @@ std::string NMD::MULSA_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11478,7 +11465,7 @@ std::string NMD::MULSAQ_S_W_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
+    return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11502,7 +11489,7 @@ std::string NMD::MULT_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULT %s, %s, %s", ac, rs, rt);
+    return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11526,7 +11513,7 @@ std::string NMD::MULTU_DSP_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULTU %s, %s, %s", ac, rs, rt);
+    return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
 
 
@@ -11550,7 +11537,7 @@ std::string NMD::MULU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("MULU %s, %s, %s", rd, rs, rt);
+    return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11572,7 +11559,7 @@ std::string NMD::NEG_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("NEG.D %s, %s", ft, fs);
+    return img_format("NEG.D %s, %s", ft, fs);
 }
 
 
@@ -11594,7 +11581,7 @@ std::string NMD::NEG_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("NEG.S %s, %s", ft, fs);
+    return img_format("NEG.S %s, %s", ft, fs);
 }
 
 
@@ -11654,7 +11641,7 @@ std::string NMD::NOR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("NOR %s, %s, %s", rd, rs, rt);
+    return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11676,7 +11663,7 @@ std::string NMD::NOT_16_(uint64 instruction)
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("NOT %s, %s", rt3, rs3);
+    return img_format("NOT %s, %s", rt3, rs3);
 }
 
 
@@ -11698,7 +11685,7 @@ std::string NMD::OR_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
-    return img::format("OR %s, %s", rs3, rt3);
+    return img_format("OR %s, %s", rs3, rt3);
 }
 
 
@@ -11722,7 +11709,7 @@ std::string NMD::OR_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("OR %s, %s, %s", rd, rs, rt);
+    return img_format("OR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11746,7 +11733,7 @@ std::string NMD::ORI(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("ORI %s, %s, %s", rt, rs, u);
+    return img_format("ORI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -11771,7 +11758,7 @@ std::string NMD::PACKRL_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PACKRL.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11814,7 +11801,7 @@ std::string NMD::PICK_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PICK.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11839,7 +11826,7 @@ std::string NMD::PICK_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PICK.QB %s, %s, %s", rd, rs, rt);
+    return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -11862,7 +11849,7 @@ std::string NMD::PRECEQ_W_PHL(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEQ.W.PHL %s, %s", rt, rs);
+    return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
 
 
@@ -11885,7 +11872,7 @@ std::string NMD::PRECEQ_W_PHR(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEQ.W.PHR %s, %s", rt, rs);
+    return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
 
 
@@ -11908,7 +11895,7 @@ std::string NMD::PRECEQU_PH_QBLA(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEQU.PH.QBLA %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
 
 
@@ -11931,7 +11918,7 @@ std::string NMD::PRECEQU_PH_QBL(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEQU.PH.QBL %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
 
 
@@ -11954,7 +11941,7 @@ std::string NMD::PRECEQU_PH_QBRA(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEQU.PH.QBRA %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
 
 
@@ -11977,7 +11964,7 @@ std::string NMD::PRECEQU_PH_QBR(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEQU.PH.QBR %s, %s", rt, rs);
+    return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
 
 
@@ -12001,7 +11988,7 @@ std::string NMD::PRECEU_PH_QBLA(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEU.PH.QBLA %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
 
 
@@ -12024,7 +12011,7 @@ std::string NMD::PRECEU_PH_QBL(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEU.PH.QBL %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
 
 
@@ -12048,7 +12035,7 @@ std::string NMD::PRECEU_PH_QBRA(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEU.PH.QBRA %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
 
 
@@ -12071,7 +12058,7 @@ std::string NMD::PRECEU_PH_QBR(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PRECEU.PH.QBR %s, %s", rt, rs);
+    return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
 
 
@@ -12096,7 +12083,7 @@ std::string NMD::PRECR_QB_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12121,7 +12108,7 @@ std::string NMD::PRECR_SRA_PH_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
+    return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -12146,7 +12133,7 @@ std::string NMD::PRECR_SRA_R_PH_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
+    return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -12171,7 +12158,7 @@ std::string NMD::PRECRQ_PH_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12196,7 +12183,7 @@ std::string NMD::PRECRQ_QB_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12221,7 +12208,7 @@ std::string NMD::PRECRQ_RS_PH_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12246,7 +12233,7 @@ std::string NMD::PRECRQU_S_QB_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
+    return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12270,7 +12257,7 @@ std::string NMD::PREF_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PREF %s, %s(%s)", hint, s, rs);
+    return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
 
 
@@ -12294,7 +12281,7 @@ std::string NMD::PREF_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PREF %s, %s(%s)", hint, u, rs);
+    return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
 
 
@@ -12318,7 +12305,7 @@ std::string NMD::PREFE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("PREFE %s, %s(%s)", hint, s, rs);
+    return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
 
 
@@ -12342,7 +12329,7 @@ std::string NMD::PREPEND(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("PREPEND %s, %s, %s", rt, rs, sa);
+    return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -12363,7 +12350,7 @@ std::string NMD::RADDU_W_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("RADDU.W.QB %s, %s", rt, rs);
+    return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
 
 
@@ -12384,7 +12371,7 @@ std::string NMD::RDDSP(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string mask = IMMEDIATE(copy(mask_value));
 
-    return img::format("RDDSP %s, %s", rt, mask);
+    return img_format("RDDSP %s, %s", rt, mask);
 }
 
 
@@ -12408,7 +12395,7 @@ std::string NMD::RDHWR(uint64 instruction)
     std::string hs = CPR(copy(hs_value));
     std::string sel = IMMEDIATE(copy(sel_value));
 
-    return img::format("RDHWR %s, %s, %s", rt, hs, sel);
+    return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
 
 
@@ -12430,7 +12417,7 @@ std::string NMD::RDPGPR(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("RDPGPR %s, %s", rt, rs);
+    return img_format("RDPGPR %s, %s", rt, rs);
 }
 
 
@@ -12452,7 +12439,7 @@ std::string NMD::RECIP_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("RECIP.D %s, %s", ft, fs);
+    return img_format("RECIP.D %s, %s", ft, fs);
 }
 
 
@@ -12474,7 +12461,7 @@ std::string NMD::RECIP_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("RECIP.S %s, %s", ft, fs);
+    return img_format("RECIP.S %s, %s", ft, fs);
 }
 
 
@@ -12496,7 +12483,7 @@ std::string NMD::REPL_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = IMMEDIATE(copy(s_value));
 
-    return img::format("REPL.PH %s, %s", rt, s);
+    return img_format("REPL.PH %s, %s", rt, s);
 }
 
 
@@ -12518,7 +12505,7 @@ std::string NMD::REPL_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("REPL.QB %s, %s", rt, u);
+    return img_format("REPL.QB %s, %s", rt, u);
 }
 
 
@@ -12540,7 +12527,7 @@ std::string NMD::REPLV_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("REPLV.PH %s, %s", rt, rs);
+    return img_format("REPLV.PH %s, %s", rt, rs);
 }
 
 
@@ -12561,7 +12548,7 @@ std::string NMD::REPLV_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("REPLV.QB %s, %s", rt, rs);
+    return img_format("REPLV.QB %s, %s", rt, rs);
 }
 
 
@@ -12583,7 +12570,7 @@ std::string NMD::RESTORE_32_(uint64 instruction)
     uint64 gp_value = extract_gp_2(instruction);
 
     std::string u = IMMEDIATE(copy(u_value));
-    return img::format("RESTORE %s%s", u,
+    return img_format("RESTORE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12605,7 +12592,7 @@ std::string NMD::RESTORE_JRC_16_(uint64 instruction)
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
     std::string u = IMMEDIATE(copy(u_value));
-    return img::format("RESTORE.JRC %s%s", u,
+    return img_format("RESTORE.JRC %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
 
@@ -12628,7 +12615,7 @@ std::string NMD::RESTORE_JRC_32_(uint64 instruction)
     uint64 gp_value = extract_gp_2(instruction);
 
     std::string u = IMMEDIATE(copy(u_value));
-    return img::format("RESTORE.JRC %s%s", u,
+    return img_format("RESTORE.JRC %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12651,7 +12638,7 @@ std::string NMD::RESTOREF(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string count = IMMEDIATE(copy(count_value));
 
-    return img::format("RESTOREF %s, %s", u, count);
+    return img_format("RESTOREF %s, %s", u, count);
 }
 
 
@@ -12673,7 +12660,7 @@ std::string NMD::RINT_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("RINT.D %s, %s", ft, fs);
+    return img_format("RINT.D %s, %s", ft, fs);
 }
 
 
@@ -12695,7 +12682,7 @@ std::string NMD::RINT_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("RINT.S %s, %s", ft, fs);
+    return img_format("RINT.S %s, %s", ft, fs);
 }
 
 
@@ -12719,7 +12706,7 @@ std::string NMD::ROTR(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("ROTR %s, %s, %s", rt, rs, shift);
+    return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -12743,7 +12730,7 @@ std::string NMD::ROTRV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("ROTRV %s, %s, %s", rd, rs, rt);
+    return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -12771,7 +12758,7 @@ std::string NMD::ROTX(uint64 instruction)
     std::string shiftx = IMMEDIATE(copy(shiftx_value));
     std::string stripe = IMMEDIATE(copy(stripe_value));
 
-    return img::format("ROTX %s, %s, %s, %s, %s",
+    return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
 }
 
@@ -12794,7 +12781,7 @@ std::string NMD::ROUND_L_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("ROUND.L.D %s, %s", ft, fs);
+    return img_format("ROUND.L.D %s, %s", ft, fs);
 }
 
 
@@ -12816,7 +12803,7 @@ std::string NMD::ROUND_L_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("ROUND.L.S %s, %s", ft, fs);
+    return img_format("ROUND.L.S %s, %s", ft, fs);
 }
 
 
@@ -12838,7 +12825,7 @@ std::string NMD::ROUND_W_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("ROUND.W.D %s, %s", ft, fs);
+    return img_format("ROUND.W.D %s, %s", ft, fs);
 }
 
 
@@ -12860,7 +12847,7 @@ std::string NMD::ROUND_W_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("ROUND.W.S %s, %s", ft, fs);
+    return img_format("ROUND.W.S %s, %s", ft, fs);
 }
 
 
@@ -12882,7 +12869,7 @@ std::string NMD::RSQRT_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("RSQRT.D %s, %s", ft, fs);
+    return img_format("RSQRT.D %s, %s", ft, fs);
 }
 
 
@@ -12904,7 +12891,7 @@ std::string NMD::RSQRT_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("RSQRT.S %s, %s", ft, fs);
+    return img_format("RSQRT.S %s, %s", ft, fs);
 }
 
 
@@ -12925,7 +12912,7 @@ std::string NMD::SAVE_16_(uint64 instruction)
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
     std::string u = IMMEDIATE(copy(u_value));
-    return img::format("SAVE %s%s", u,
+    return img_format("SAVE %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
 
@@ -12948,7 +12935,7 @@ std::string NMD::SAVE_32_(uint64 instruction)
     uint64 gp_value = extract_gp_2(instruction);
 
     std::string u = IMMEDIATE(copy(u_value));
-    return img::format("SAVE %s%s", u,
+    return img_format("SAVE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
 
@@ -12971,7 +12958,7 @@ std::string NMD::SAVEF(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string count = IMMEDIATE(copy(count_value));
 
-    return img::format("SAVEF %s, %s", u, count);
+    return img_format("SAVEF %s, %s", u, count);
 }
 
 
@@ -12995,7 +12982,7 @@ std::string NMD::SB_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("SB %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SB %s, %s(%s)", rtz3, u, rs3);
 }
 
 
@@ -13017,7 +13004,7 @@ std::string NMD::SB_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SB %s, %s($%d)", rt, u, 28);
+    return img_format("SB %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -13041,7 +13028,7 @@ std::string NMD::SB_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SB %s, %s(%s)", rt, s, rs);
+    return img_format("SB %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13065,7 +13052,7 @@ std::string NMD::SB_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SB %s, %s(%s)", rt, u, rs);
+    return img_format("SB %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -13089,7 +13076,7 @@ std::string NMD::SBE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SBE %s, %s(%s)", rt, s, rs);
+    return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13113,7 +13100,7 @@ std::string NMD::SBX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SBX %s, %s(%s)", rd, rs, rt);
+    return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -13137,7 +13124,7 @@ std::string NMD::SC(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SC %s, %s(%s)", rt, s, rs);
+    return img_format("SC %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13161,7 +13148,7 @@ std::string NMD::SCD(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SCD %s, %s(%s)", rt, s, rs);
+    return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13185,7 +13172,7 @@ std::string NMD::SCDP(uint64 instruction)
     std::string ru = GPR(copy(ru_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SCDP %s, %s, (%s)", rt, ru, rs);
+    return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -13209,7 +13196,7 @@ std::string NMD::SCE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SCE %s, %s(%s)", rt, s, rs);
+    return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13233,7 +13220,7 @@ std::string NMD::SCWP(uint64 instruction)
     std::string ru = GPR(copy(ru_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SCWP %s, %s, (%s)", rt, ru, rs);
+    return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -13257,7 +13244,7 @@ std::string NMD::SCWPE(uint64 instruction)
     std::string ru = GPR(copy(ru_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SCWPE %s, %s, (%s)", rt, ru, rs);
+    return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
 
 
@@ -13279,7 +13266,7 @@ std::string NMD::SD_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SD %s, %s($%d)", rt, u, 28);
+    return img_format("SD %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -13303,7 +13290,7 @@ std::string NMD::SD_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SD %s, %s(%s)", rt, s, rs);
+    return img_format("SD %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13327,7 +13314,7 @@ std::string NMD::SD_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SD %s, %s(%s)", rt, u, rs);
+    return img_format("SD %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -13347,7 +13334,7 @@ std::string NMD::SDBBP_16_(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("SDBBP %s", code);
+    return img_format("SDBBP %s", code);
 }
 
 
@@ -13367,7 +13354,7 @@ std::string NMD::SDBBP_32_(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("SDBBP %s", code);
+    return img_format("SDBBP %s", code);
 }
 
 
@@ -13389,7 +13376,7 @@ std::string NMD::SDC1_GP_(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SDC1 %s, %s($%d)", ft, u, 28);
+    return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -13413,7 +13400,7 @@ std::string NMD::SDC1_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SDC1 %s, %s(%s)", ft, s, rs);
+    return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -13437,7 +13424,7 @@ std::string NMD::SDC1_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SDC1 %s, %s(%s)", ft, u, rs);
+    return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -13461,7 +13448,7 @@ std::string NMD::SDC1X(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SDC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -13485,7 +13472,7 @@ std::string NMD::SDC1XS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SDC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -13509,7 +13496,7 @@ std::string NMD::SDC2(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SDC2 %s, %s(%s)", cs, s, rs);
+    return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
 
 
@@ -13535,7 +13522,7 @@ std::string NMD::SDM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("SDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -13557,7 +13544,7 @@ std::string NMD::SDPC_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("SDPC %s, %s", rt, s);
+    return img_format("SDPC %s, %s", rt, s);
 }
 
 
@@ -13581,7 +13568,7 @@ std::string NMD::SDXS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SDXS %s, %s(%s)", rd, rs, rt);
+    return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -13605,7 +13592,7 @@ std::string NMD::SDX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SDX %s, %s(%s)", rd, rs, rt);
+    return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -13627,7 +13614,7 @@ std::string NMD::SEB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SEB %s, %s", rt, rs);
+    return img_format("SEB %s, %s", rt, rs);
 }
 
 
@@ -13649,7 +13636,7 @@ std::string NMD::SEH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SEH %s, %s", rt, rs);
+    return img_format("SEH %s, %s", rt, rs);
 }
 
 
@@ -13673,7 +13660,7 @@ std::string NMD::SEL_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SEL.D %s, %s, %s", fd, fs, ft);
+    return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13697,7 +13684,7 @@ std::string NMD::SEL_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SEL.S %s, %s, %s", fd, fs, ft);
+    return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13721,7 +13708,7 @@ std::string NMD::SELEQZ_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SELEQZ.D %s, %s, %s", fd, fs, ft);
+    return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13745,7 +13732,7 @@ std::string NMD::SELEQZ_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SELEQZ.S %s, %s, %s", fd, fs, ft);
+    return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13769,7 +13756,7 @@ std::string NMD::SELNEZ_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SELNEZ.D %s, %s, %s", fd, fs, ft);
+    return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13793,7 +13780,7 @@ std::string NMD::SELNEZ_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SELNEZ.S %s, %s, %s", fd, fs, ft);
+    return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -13817,7 +13804,7 @@ std::string NMD::SEQI(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SEQI %s, %s, %s", rt, rs, u);
+    return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -13841,7 +13828,7 @@ std::string NMD::SH_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("SH %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SH %s, %s(%s)", rtz3, u, rs3);
 }
 
 
@@ -13863,7 +13850,7 @@ std::string NMD::SH_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SH %s, %s($%d)", rt, u, 28);
+    return img_format("SH %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -13887,7 +13874,7 @@ std::string NMD::SH_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SH %s, %s(%s)", rt, s, rs);
+    return img_format("SH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13911,7 +13898,7 @@ std::string NMD::SH_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SH %s, %s(%s)", rt, u, rs);
+    return img_format("SH %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -13935,7 +13922,7 @@ std::string NMD::SHE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHE %s, %s(%s)", rt, s, rs);
+    return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -13957,7 +13944,7 @@ std::string NMD::SHILO(uint64 instruction)
     std::string shift = IMMEDIATE(copy(shift_value));
     std::string ac = AC(copy(ac_value));
 
-    return img::format("SHILO %s, %s", ac, shift);
+    return img_format("SHILO %s, %s", ac, shift);
 }
 
 
@@ -13979,7 +13966,7 @@ std::string NMD::SHILOV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string ac = AC(copy(ac_value));
 
-    return img::format("SHILOV %s, %s", ac, rs);
+    return img_format("SHILOV %s, %s", ac, rs);
 }
 
 
@@ -14003,7 +13990,7 @@ std::string NMD::SHLL_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHLL.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14027,7 +14014,7 @@ std::string NMD::SHLL_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHLL.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14052,7 +14039,7 @@ std::string NMD::SHLL_S_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14076,7 +14063,7 @@ std::string NMD::SHLL_S_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHLL_S.W %s, %s, %s", rt, rs, sa);
+    return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14101,7 +14088,7 @@ std::string NMD::SHLLV_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHLLV.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14125,7 +14112,7 @@ std::string NMD::SHLLV_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHLLV.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14150,7 +14137,7 @@ std::string NMD::SHLLV_S_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14174,7 +14161,7 @@ std::string NMD::SHLLV_S_W(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
+    return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14198,7 +14185,7 @@ std::string NMD::SHRA_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHRA.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14222,7 +14209,7 @@ std::string NMD::SHRA_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHRA.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14246,7 +14233,7 @@ std::string NMD::SHRA_R_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14270,7 +14257,7 @@ std::string NMD::SHRA_R_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14294,7 +14281,7 @@ std::string NMD::SHRA_R_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHRA_R.W %s, %s, %s", rt, rs, sa);
+    return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14318,7 +14305,7 @@ std::string NMD::SHRAV_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHRAV.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14342,7 +14329,7 @@ std::string NMD::SHRAV_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHRAV.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14366,7 +14353,7 @@ std::string NMD::SHRAV_R_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14390,7 +14377,7 @@ std::string NMD::SHRAV_R_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14414,7 +14401,7 @@ std::string NMD::SHRAV_R_W(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
+    return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14438,7 +14425,7 @@ std::string NMD::SHRL_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHRL.PH %s, %s, %s", rt, rs, sa);
+    return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14462,7 +14449,7 @@ std::string NMD::SHRL_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string sa = IMMEDIATE(copy(sa_value));
 
-    return img::format("SHRL.QB %s, %s, %s", rt, rs, sa);
+    return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
 
 
@@ -14487,7 +14474,7 @@ std::string NMD::SHRLV_PH(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHRLV.PH %s, %s, %s", rd, rt, rs);
+    return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14511,7 +14498,7 @@ std::string NMD::SHRLV_QB(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SHRLV.QB %s, %s, %s", rd, rt, rs);
+    return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
 
 
@@ -14535,7 +14522,7 @@ std::string NMD::SHX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SHX %s, %s(%s)", rd, rs, rt);
+    return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -14559,7 +14546,7 @@ std::string NMD::SHXS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SHXS %s, %s(%s)", rd, rs, rt);
+    return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -14579,7 +14566,7 @@ std::string NMD::SIGRIE(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("SIGRIE %s", code);
+    return img_format("SIGRIE %s", code);
 }
 
 
@@ -14603,7 +14590,7 @@ std::string NMD::SLL_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
-    return img::format("SLL %s, %s, %s", rt3, rs3, shift3);
+    return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
 }
 
 
@@ -14627,7 +14614,7 @@ std::string NMD::SLL_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("SLL %s, %s, %s", rt, rs, shift);
+    return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -14651,7 +14638,7 @@ std::string NMD::SLLV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SLLV %s, %s, %s", rd, rs, rt);
+    return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14675,7 +14662,7 @@ std::string NMD::SLT(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SLT %s, %s, %s", rd, rs, rt);
+    return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14699,7 +14686,7 @@ std::string NMD::SLTI(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SLTI %s, %s, %s", rt, rs, u);
+    return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -14723,7 +14710,7 @@ std::string NMD::SLTIU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SLTIU %s, %s, %s", rt, rs, u);
+    return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
 
 
@@ -14747,7 +14734,7 @@ std::string NMD::SLTU(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SLTU %s, %s, %s", rd, rs, rt);
+    return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14771,7 +14758,7 @@ std::string NMD::SOV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SOV %s, %s, %s", rd, rs, rt);
+    return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14791,7 +14778,7 @@ std::string NMD::SPECIAL2(uint64 instruction)
 
     std::string op = IMMEDIATE(copy(op_value));
 
-    return img::format("SPECIAL2 %s", op);
+    return img_format("SPECIAL2 %s", op);
 }
 
 
@@ -14813,7 +14800,7 @@ std::string NMD::SQRT_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("SQRT.D %s, %s", ft, fs);
+    return img_format("SQRT.D %s, %s", ft, fs);
 }
 
 
@@ -14835,7 +14822,7 @@ std::string NMD::SQRT_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("SQRT.S %s, %s", ft, fs);
+    return img_format("SQRT.S %s, %s", ft, fs);
 }
 
 
@@ -14859,7 +14846,7 @@ std::string NMD::SRA(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("SRA %s, %s, %s", rt, rs, shift);
+    return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -14883,7 +14870,7 @@ std::string NMD::SRAV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SRAV %s, %s, %s", rd, rs, rt);
+    return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14907,7 +14894,7 @@ std::string NMD::SRL_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
-    return img::format("SRL %s, %s, %s", rt3, rs3, shift3);
+    return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
 }
 
 
@@ -14931,7 +14918,7 @@ std::string NMD::SRL_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string shift = IMMEDIATE(copy(shift_value));
 
-    return img::format("SRL %s, %s, %s", rt, rs, shift);
+    return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
 
 
@@ -14955,7 +14942,7 @@ std::string NMD::SRLV(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SRLV %s, %s, %s", rd, rs, rt);
+    return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -14979,7 +14966,7 @@ std::string NMD::SUB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUB %s, %s, %s", rd, rs, rt);
+    return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15003,7 +14990,7 @@ std::string NMD::SUB_D(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SUB.D %s, %s, %s", fd, fs, ft);
+    return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -15027,7 +15014,7 @@ std::string NMD::SUB_S(uint64 instruction)
     std::string fs = FPR(copy(fs_value));
     std::string ft = FPR(copy(ft_value));
 
-    return img::format("SUB.S %s, %s, %s", fd, fs, ft);
+    return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
 
 
@@ -15051,7 +15038,7 @@ std::string NMD::SUBQ_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBQ.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15076,7 +15063,7 @@ std::string NMD::SUBQ_S_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15101,7 +15088,7 @@ std::string NMD::SUBQ_S_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15126,7 +15113,7 @@ std::string NMD::SUBQH_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBQH.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15151,7 +15138,7 @@ std::string NMD::SUBQH_R_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15176,7 +15163,7 @@ std::string NMD::SUBQH_R_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15201,7 +15188,7 @@ std::string NMD::SUBQH_W(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBQH.W %s, %s, %s", rd, rs, rt);
+    return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15225,7 +15212,7 @@ std::string NMD::SUBU_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
-    return img::format("SUBU %s, %s, %s", rd3, rs3, rt3);
+    return img_format("SUBU %s, %s, %s", rd3, rs3, rt3);
 }
 
 
@@ -15249,7 +15236,7 @@ std::string NMD::SUBU_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBU %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15273,7 +15260,7 @@ std::string NMD::SUBU_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBU.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15297,7 +15284,7 @@ std::string NMD::SUBU_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBU.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15322,7 +15309,7 @@ std::string NMD::SUBU_S_PH(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15347,7 +15334,7 @@ std::string NMD::SUBU_S_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15372,7 +15359,7 @@ std::string NMD::SUBUH_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBUH.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15397,7 +15384,7 @@ std::string NMD::SUBUH_R_QB(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
+    return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -15421,7 +15408,7 @@ std::string NMD::SW_16_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
-    return img::format("SW %s, %s(%s)", rtz3, u, rs3);
+    return img_format("SW %s, %s(%s)", rtz3, u, rs3);
 }
 
 
@@ -15445,7 +15432,7 @@ std::string NMD::SW_4X4_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
-    return img::format("SW %s, %s(%s)", rtz4, u, rs4);
+    return img_format("SW %s, %s(%s)", rtz4, u, rs4);
 }
 
 
@@ -15467,7 +15454,7 @@ std::string NMD::SW_GP16_(uint64 instruction)
     std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SW %s, %s($%d)", rtz3, u, 28);
+    return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
 
 
@@ -15489,7 +15476,7 @@ std::string NMD::SW_GP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SW %s, %s($%d)", rt, u, 28);
+    return img_format("SW %s, %s($%d)", rt, u, 28);
 }
 
 
@@ -15513,7 +15500,7 @@ std::string NMD::SW_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SW %s, %s(%s)", rt, s, rs);
+    return img_format("SW %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -15535,7 +15522,7 @@ std::string NMD::SW_SP_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SW %s, %s($%d)", rt, u, 29);
+    return img_format("SW %s, %s($%d)", rt, u, 29);
 }
 
 
@@ -15559,7 +15546,7 @@ std::string NMD::SW_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SW %s, %s(%s)", rt, u, rs);
+    return img_format("SW %s, %s(%s)", rt, u, rs);
 }
 
 
@@ -15581,7 +15568,7 @@ std::string NMD::SWC1_GP_(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("SWC1 %s, %s($%d)", ft, u, 28);
+    return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
 
 
@@ -15605,7 +15592,7 @@ std::string NMD::SWC1_S9_(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SWC1 %s, %s(%s)", ft, s, rs);
+    return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
 
 
@@ -15629,7 +15616,7 @@ std::string NMD::SWC1_U12_(uint64 instruction)
     std::string u = IMMEDIATE(copy(u_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SWC1 %s, %s(%s)", ft, u, rs);
+    return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
 
 
@@ -15653,7 +15640,7 @@ std::string NMD::SWC1X(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SWC1X %s, %s(%s)", ft, rs, rt);
+    return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -15677,7 +15664,7 @@ std::string NMD::SWC1XS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SWC1XS %s, %s(%s)", ft, rs, rt);
+    return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
 
 
@@ -15701,7 +15688,7 @@ std::string NMD::SWC2(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SWC2 %s, %s(%s)", cs, s, rs);
+    return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
 
 
@@ -15725,7 +15712,7 @@ std::string NMD::SWE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SWE %s, %s(%s)", rt, s, rs);
+    return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -15751,7 +15738,7 @@ std::string NMD::SWM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("SWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -15773,7 +15760,7 @@ std::string NMD::SWPC_48_(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string s = ADDRESS(encode_s_from_address(s_value), 6);
 
-    return img::format("SWPC %s, %s", rt, s);
+    return img_format("SWPC %s, %s", rt, s);
 }
 
 
@@ -15797,7 +15784,7 @@ std::string NMD::SWX(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SWX %s, %s(%s)", rd, rs, rt);
+    return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -15821,7 +15808,7 @@ std::string NMD::SWXS(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("SWXS %s, %s(%s)", rd, rs, rt);
+    return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
 
 
@@ -15841,7 +15828,7 @@ std::string NMD::SYNC(uint64 instruction)
 
     std::string stype = IMMEDIATE(copy(stype_value));
 
-    return img::format("SYNC %s", stype);
+    return img_format("SYNC %s", stype);
 }
 
 
@@ -15863,7 +15850,7 @@ std::string NMD::SYNCI(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SYNCI %s(%s)", s, rs);
+    return img_format("SYNCI %s(%s)", s, rs);
 }
 
 
@@ -15885,7 +15872,7 @@ std::string NMD::SYNCIE(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("SYNCIE %s(%s)", s, rs);
+    return img_format("SYNCIE %s(%s)", s, rs);
 }
 
 
@@ -15905,7 +15892,7 @@ std::string NMD::SYSCALL_16_(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("SYSCALL %s", code);
+    return img_format("SYSCALL %s", code);
 }
 
 
@@ -15923,7 +15910,7 @@ std::string NMD::SYSCALL_32_(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("SYSCALL %s", code);
+    return img_format("SYSCALL %s", code);
 }
 
 
@@ -15945,7 +15932,7 @@ std::string NMD::TEQ(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("TEQ %s, %s", rs, rt);
+    return img_format("TEQ %s, %s", rs, rt);
 }
 
 
@@ -16183,7 +16170,7 @@ std::string NMD::TNE(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("TNE %s, %s", rs, rt);
+    return img_format("TNE %s, %s", rs, rt);
 }
 
 
@@ -16205,7 +16192,7 @@ std::string NMD::TRUNC_L_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("TRUNC.L.D %s, %s", ft, fs);
+    return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
 
 
@@ -16227,7 +16214,7 @@ std::string NMD::TRUNC_L_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("TRUNC.L.S %s, %s", ft, fs);
+    return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
 
 
@@ -16249,7 +16236,7 @@ std::string NMD::TRUNC_W_D(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("TRUNC.W.D %s, %s", ft, fs);
+    return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
 
 
@@ -16271,7 +16258,7 @@ std::string NMD::TRUNC_W_S(uint64 instruction)
     std::string ft = FPR(copy(ft_value));
     std::string fs = FPR(copy(fs_value));
 
-    return img::format("TRUNC.W.S %s, %s", ft, fs);
+    return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
 
 
@@ -16297,7 +16284,7 @@ std::string NMD::UALDM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16321,7 +16308,7 @@ std::string NMD::UALH(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("UALH %s, %s(%s)", rt, s, rs);
+    return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -16347,7 +16334,7 @@ std::string NMD::UALWM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16373,7 +16360,7 @@ std::string NMD::UASDM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16397,7 +16384,7 @@ std::string NMD::UASH(uint64 instruction)
     std::string s = IMMEDIATE(copy(s_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("UASH %s, %s(%s)", rt, s, rs);
+    return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
 
 
@@ -16423,7 +16410,7 @@ std::string NMD::UASWM(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
-    return img::format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
+    return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
 }
 
 
@@ -16443,7 +16430,7 @@ std::string NMD::UDI(uint64 instruction)
 
     std::string op = IMMEDIATE(copy(op_value));
 
-    return img::format("UDI %s", op);
+    return img_format("UDI %s", op);
 }
 
 
@@ -16461,7 +16448,7 @@ std::string NMD::WAIT(uint64 instruction)
 
     std::string code = IMMEDIATE(copy(code_value));
 
-    return img::format("WAIT %s", code);
+    return img_format("WAIT %s", code);
 }
 
 
@@ -16483,7 +16470,7 @@ std::string NMD::WRDSP(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string mask = IMMEDIATE(copy(mask_value));
 
-    return img::format("WRDSP %s, %s", rt, mask);
+    return img_format("WRDSP %s, %s", rt, mask);
 }
 
 
@@ -16505,7 +16492,7 @@ std::string NMD::WRPGPR(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("WRPGPR %s, %s", rt, rs);
+    return img_format("WRPGPR %s, %s", rt, rs);
 }
 
 
@@ -16527,7 +16514,7 @@ std::string NMD::XOR_16_(uint64 instruction)
     std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
     std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
-    return img::format("XOR %s, %s", rs3, rt3);
+    return img_format("XOR %s, %s", rs3, rt3);
 }
 
 
@@ -16551,7 +16538,7 @@ std::string NMD::XOR_32_(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string rt = GPR(copy(rt_value));
 
-    return img::format("XOR %s, %s, %s", rd, rs, rt);
+    return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
 
 
@@ -16575,7 +16562,7 @@ std::string NMD::XORI(uint64 instruction)
     std::string rs = GPR(copy(rs_value));
     std::string u = IMMEDIATE(copy(u_value));
 
-    return img::format("XORI %s, %s, %s", rt, rs, u);
+    return img_format("XORI %s, %s, %s", rt, rs, u);
 }
 
 
@@ -16596,7 +16583,7 @@ std::string NMD::YIELD(uint64 instruction)
     std::string rt = GPR(copy(rt_value));
     std::string rs = GPR(copy(rs_value));
 
-    return img::format("YIELD %s, %s", rt, rs);
+    return img_format("YIELD %s, %s", rt, rs);
 }
 
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index a0a2225301..9fe0cc67da 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -29,11 +29,7 @@ typedef int64_t int64;
 typedef uint64_t uint64;
 typedef uint32_t uint32;
 typedef uint16_t uint16;
-
-namespace img
-{
-    typedef uint64_t address;
-}
+typedef uint64_t img_address;
 
 
 class NMD
@@ -70,7 +66,7 @@ public:
     };
 
 
-    NMD(img::address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
+    NMD(img_address pc, TABLE_ATTRIBUTE_TYPE requested_instruction_categories)
         : m_pc(pc)
         , m_requested_instruction_categories(requested_instruction_categories)
     {
@@ -81,7 +77,7 @@ public:
 
 private:
 
-    img::address           m_pc;
+    img_address           m_pc;
     TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
 
     typedef std::string(NMD:: *disassembly_function)(uint64 instruction);
-- 
2.25.1


