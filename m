Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05792592A66
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:39:29 +0200 (CEST)
Received: from localhost ([::1]:43714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUh6-00071w-0h
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXm-0008Oj-9S
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:29:55 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:37263 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXj-0000jI-Sh
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:29:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyvFWgmv3//I3EseurvEPSVg9vxYkJvp5bh+0m4azRid0I5Xiwt+Dw6a8+ozL4cjiAarAB4ZzVrs9CSwc+uhc5a2VPQS1INfeqhaK071OpwoXzLz+39lGaTVjyx61+h3XWtbBSn5ktXQTTe/r+DYq96L2kyWc5DmbUsl9x2Wld9h5xHWCKOTQpG8NRHo96njv7uzwXkGy0eZiNAFpRn/fcp+joZROLGzs+3Tjhd5DiIPs1nN9i4j5ELwiCNzGIHAZ8DVLP/o24COOUNXDh7LSOU3uazWIoVhkRnKiRSRYC43M7Ylu4Z2yjcrTVkO5Cukgh12tDYwEqI4zJ9SD2Kj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQfCSJsHsYrANhzCQk80tLAUfKqg2MA8KG18UVMpRQk=;
 b=PnpAHJ2IP8qtu8C9dP6yFqUmb+2xJs3Bfcs+MfouQN9m3EQXdOihOCiTpmvv9VowIq0eXBNKVl6yOBgcoB0JxEc0Fvii1vwBt6d0Ljc++gAuxsdhFxTCqMrU3iYt4DfVB5vr1dTQhoqjXt4PQ4mXSzCI0CDinyZuhz/wuHollTi1e3ZvHp3PGDHXMpBhJ/Qo2p+cPbJfObQ81//caMipnbiafXQoyO3EJLrnE2HsmBs4CoQTmgBq1ANjAiIqc0J2BCfmcnH6kMW45cvJ+8LlFvA0hAbSxs+TUvXArHFkf3GU7Vaw41weBh+eiK6rtG6fHoww05N7k7ackk/wBh7lzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQfCSJsHsYrANhzCQk80tLAUfKqg2MA8KG18UVMpRQk=;
 b=UR7cbWmAya/T31d4QG0S2jVkbOw2X0x0IqhQ6QAD/aJEwdTQQdgQ+2Wxk6wEUe2lD5yGm78OcM2gqfR/a3+kNpn0smTPaeNP+uuGMM8f6MVvSkRXbxRj4QLNMqN0zhu/4U5uq6Wx9BF0c38TMHOYZfeSTNobQBxEPRwwIuwwUG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM0PR03MB4515.eurprd03.prod.outlook.com (2603:10a6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 07:29:43 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:29:43 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 09/20] disas/nanomips: Move typedefs etc to nanomips.cpp
Date: Mon, 15 Aug 2022 09:26:18 +0200
Message-Id: <20220815072629.12865-10-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: db78d62e-dbc2-4976-562e-08da7e8febf2
X-MS-TrafficTypeDiagnostic: AM0PR03MB4515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5FnuUfKj1wWSSsgGH2+tUf1k1K+dBchXrCrGZk0QHfHZcHZuBxPSHpRbMckWnTZxmOozD9auA91uECcQecbnSAw2GPmiJ08/w+XT9JIQfBl+MZyXIjZwsoeVaMctHb9Yzwgyv/lcuEF/Ivl4DocUM1JKBwgaGo7X1sYlBOGN7JzrucvO+ONjqkNqtjwpjWOY72oQP5fvItCGnYLd6wJtQ5Bve/Pt4CqyhYzxLi7ivwE+fLPUlL6jYx3lG0j7V1tMOU+RvZZlw1dTHKSC6XQFeQBgdA9OP8cmXW7OMFUwWaGSdQhKSCpalm3HfiKEvYdCtDs8t8gz5zlRW/Wf4fNS1qP33mp1Zu9jBK9D73NvgXr2DBU4c71bmu0Gy92rxn43PDYidjaGx7AlAwBHrOxSToZLKtJ8sADSP0a/fDI4L5fA+aCb+WlhRmct9IedSIlnvQv4V4ywbs6LfAnHvD/PCq8SHl7qiMClCM20Aktg7gQVzU+3seOHllRk2KQyzQQZJm2qL7uzdzNOVsuKI3tDgdM+IshYkGpBu8LU1H8mIGNgWXE4mxwpdTle2Hg4iK7X0IjG7hQeYm+K6zegIWzHieJUIxclT/oJvnNYqMPFEnZ7/jYY6705LDxCAbfwLWj5GhM78ahqpEQjfxumvb099+o/1gIoW7LI4P9p6E9sFLtIvYlGPCVhd9/iIBb+buN45xY6zkoV5O2vBE6OiVOBnqdyR2TZnHP8d1AA/os6hiG8mQvLjDpMYwkm3Cgl9zpFglVdXd81rXKxaKz/38gkOTIutgn4sYwJEugUFNYA0FA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39830400003)(366004)(136003)(346002)(376002)(396003)(86362001)(107886003)(186003)(1076003)(2616005)(38350700002)(83380400001)(38100700002)(5660300002)(8936002)(36756003)(66556008)(66476007)(8676002)(4326008)(66946007)(2906002)(44832011)(478600001)(41300700001)(52116002)(26005)(6512007)(6506007)(6666004)(6486002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AHliaVupNE2CcYFoEZmx+MRdmRQAABl0UJJ4bT1O45Q2KQ4yvVHcYzEibU0B?=
 =?us-ascii?Q?jDwxxp6t/Z53bJVqW2kNUJQToElgPjDf336r7kmOwRCEVNd+8z4WkFw9JhlV?=
 =?us-ascii?Q?s51rbK5cdadJZM5eKDc4QTSQF9NbX5qdxppMTEms5YzldoQQtgGCpCriXLM5?=
 =?us-ascii?Q?cCLY4xmh6SlLLDNuglEeQ9wPeu7gjChMetyQvQw2ptVhon+Uq7CKZ6SdXmrJ?=
 =?us-ascii?Q?kiCZ+X7sLL+34h6OlhjcK4l5Z4zx9Wc/Ui3s/hMDoqz3zCoYtYlpU5AUiZ76?=
 =?us-ascii?Q?/84yIlWY9qrbuXA9Pvw++39FB37YYOkR3v7akwocZtooIKdwDgWAwdAusidp?=
 =?us-ascii?Q?Byci8DLFSRmimP0SCvqu3GWTQIqcRSW53YYTuFvU3N7gIWUXpJzbop0r/HB3?=
 =?us-ascii?Q?pjTLkZI85KrlmRgJW9l+eVjMA84BpybheJehyIjJHYYl7aCgEoieEkyR4/FK?=
 =?us-ascii?Q?a2kJaVKD8JpeaxIf/01M69u1RqraLfJ5FozoNO9ALG/yNGSxEgYlW9ym9w3v?=
 =?us-ascii?Q?PsBMMUtCnRG7kmYb2ObqcjcysORqmMXvb/1iibya5ox6BjtHfec2yRyYipY7?=
 =?us-ascii?Q?AcZkxFswV5OH+d2d/xQpkJxPyaS8BgQ5+p5V3/Jssl0IMBsbbTIynFYMVqf6?=
 =?us-ascii?Q?lcGUiSbwkEYzPYG8R+GUvf0LO90+7d7+i9h1B7FGU0WDsNsv9nYoqrAoD4yF?=
 =?us-ascii?Q?w/6nznlehL6w6F8Ypj809zCicQSrR07lIcW6u51c66yVHHkMRLa1EfThh1B9?=
 =?us-ascii?Q?YxmOJfDti6bC4C+w6tc2yTqFR23XFBN7Su9bY2x4DNbMqC7DPx5mj32vIgoK?=
 =?us-ascii?Q?S1XrVAbZvA700Dx2C/L5Pq4y5ELSctgWlzs7bwuifYuMKhHtx3NCKUHl04sF?=
 =?us-ascii?Q?HNsDHy+euUCO/xtuCcJmTWGfAjtbQyfI6DXpLL5X1tePhYQq4ujfwB7avH8a?=
 =?us-ascii?Q?zSLkXdwEaJCFnWPCykmVw9V/yv3MvvmA+/r8pdTdW/cqOjINhAyn5mrnAUYv?=
 =?us-ascii?Q?nQVFGVlBAq2o86hzcT5uTFEya+6kj9i8UmgcarPc1Dj0jfc22Lv5URoAOVz9?=
 =?us-ascii?Q?6YfOt4J4Swm8Mb6cO0BvcnClVphe5mxaivVGHRZJgyh4FbS+T0o4q9dFI4hL?=
 =?us-ascii?Q?qzlGG+Q46Rgqve+y2Z7Xdv/V4yMM9aInKRKR2v/oBePR7rC8keEtzNAS2C/i?=
 =?us-ascii?Q?sVNg0QQYAU3so2EdvhIYYa9HIzGPcTl84cgFrQf0eg/Hu1B+sRbYyGUoVa43?=
 =?us-ascii?Q?CPoxtYIK45731RGWTaolcWPgQCXm4rs6pNO2W/x2Q/er4aAyIyl4hbRKB1wf?=
 =?us-ascii?Q?f6nPrqQSsXkLLb3eJ+oI34/SwBHoR8Tsq3BzcVrzyEROmhZbZ9QFh65rzMn/?=
 =?us-ascii?Q?cRycmDHj2NOghiUyPeactWfvG0usbbq0iStzzyndSs9tqilZHhRXKlfYtR2L?=
 =?us-ascii?Q?hgWeggVUm2o0fPAAaGdGtQQoxipyyQJxRGnFAO6DMFy6BqaQmIm8wOaJH6nK?=
 =?us-ascii?Q?AUVN4Lzqkd4o205T7vFAmxPptoseBI1sGASk0qUjbSm5zza8AxqSnVDPCMvR?=
 =?us-ascii?Q?wzxsHn8m2fyxca0DTbbJuK3BKxJV9Ws0RlBTHeJbXxpKT2Sbln4VMoLvHFA5?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db78d62e-dbc2-4976-562e-08da7e8febf2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:29:43.1234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT7DsnVeKxg9VEDweAuIfSJaG970PZ5VmKf1Ao9HGcmJYw9riGe8nX6LgS+G3ofzYeIwnrXbckwoMY9t+gFtWVOzGAiBaxfhtjo2Jybtvw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4515
Received-SPF: pass client-ip=40.107.21.137;
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

The following is moved from the nanomips.h to nanomips.cpp file:
- #include line
- typedefs
- enums
- definition of the Pool struct.
Header file nanomips.h will be deleted to be consistent with the rest of
the disas/ code.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 53 +++++++++++++++++++++++++++++++++++++++++++++-
 disas/nanomips.h   | 51 --------------------------------------------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index be6705d0c3..cab53f482b 100644
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
+typedef bool(*conditional_function)(uint64 instruction);
+typedef std::string(*disassembly_function)(uint64 instruction);
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
+
 
 #define IMGASSERTONCE(test)
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index fb832619e1..b3186971ee 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -23,57 +23,6 @@
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
-typedef bool(*conditional_function)(uint64 instruction);
-typedef std::string(*disassembly_function)(uint64 instruction);
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
 
 
 #endif
-- 
2.25.1


