Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5C5B5AC4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:01:16 +0200 (CEST)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXj3r-0004Mn-I1
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXibx-0007YD-LS
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:27 -0400
Received: from mail-eopbgr60137.outbound.protection.outlook.com
 ([40.107.6.137]:3867 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXibv-0006XE-Ue
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivCgWFlpFBMviG1kkafr7v0BcjjMGktCr2zuHtK8pumC9TmSsLnlMpcr63IgVjUa29j75pmhzJsm+r+zpnzHEh93cdy/K2RaeqnU/Iyz/uYBUMiGdcNIMGQapqSJ2x10eSCLqGe1HAsCbIQooSt2XvggbypZQGXl+t3OP27tzESSFV4RVMTVo57SMwWEGrgPuSJvOp6uL70PGO960snfTlcF+7HRtO+RJ9E5TGB5728iG5z7tjlyYhyAe/jNw70cb5CsO+crueiyOsHBLbumTe52edLytfk0UZfTfoUEulntG3AtaPr2Tbjyh3JecprvrUMlwJLwO3xakSdy9zwQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0mMFLdwjvvJ7iEv/azxSSN0sv3dqttk1cTguc11cu0=;
 b=MNS6TBB9nzUfC5VW9yf8pzqyfPQbqnm+ksFBfJ4SBUZzTYIjtpzoRelT/ejyEswcu4Ddpb72qRW2d07EPmMsL6ts+OnPListpG7QmOO+KHTtpCYFysIAFo0uq3T9Tp188cll1QqWQObUeQ4/McGiMzbB2NnktWqNRC5DxX9UXU/MDz0uTMZx4cEIUMefHtyvMgxmbbeopG17jO6mN5T62bf3E0ob4XM45M9/n4mGyQdMrsfF6Q1NtfvyzH4jgAy1n17xzitxPG6ZWZjvZk225PIoB3T2qx2R2goyTmGmAz0gMQVCyl9yhwIcFhbU1XZT9MImngUrNdzsCjBfePm37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0mMFLdwjvvJ7iEv/azxSSN0sv3dqttk1cTguc11cu0=;
 b=huB1Vp9+UqRqiVE6XJ31WyhySVTiQDIw9qvkYg1T9fMYfYv87K+oyPiqAI5YqD3Zo/KIlwtW6wNBnKdpf+PevxH1ozclnZwrJ1nWFSzoUKQrvboICNekdwPKL82j6r/fLchUsFdTQwD06aPBs7DoPv8uyvQl5M5iNVN3vOWpVl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DB4PR03MB9481.eurprd03.prod.outlook.com (2603:10a6:10:3f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:32:17 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:32:17 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 21/24] disas/nanomips: Replace exception handling
Date: Mon, 12 Sep 2022 14:26:32 +0200
Message-Id: <20220912122635.74032-22-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|DB4PR03MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: dccb2e8c-5e43-45a8-3036-08da94bad430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B3s0SqSQr/XFjawz3OXzu1RmE+nmzwy9hwBibSsXyRCGn7pF51LQGyGafGsJZ/nbJsono8QB6QS4aoMlvQmTFqOxDreC7pXf4+YCgyMArqe4FCfRMQzOMrXa8u8Axna0M5Ey96qeqvcZ9hox5l2pRBQXmNSzOMcTlAfZ/3TxLZxccmC81aiQ5QJ1bEe0UYt4e1Dmlb60p7SmqJ0mCJkg3GptexhLyNQI+4MIZ45tYkmEDSHzmf7NznDPzu7Zh5xNLdKy87NBFNZ9o+4Zj+DIgjWp+TTIbm1/J9HKMjvNw70LuYxzWr5wI1RG0Pka2t1tBqrkkQwbcsSZVUeCwgr/eAqNzQOihxwe7OCKi+liKZlmLt89rhnFVz/leTBUdZHhGPRwcDGTUNBNklvO/J1e6hKqRMOGupPT12AleGbE7tBL7/LJB1sRZ9t7nQxch9j9uaKKkqMr8QGVNtFTXqyqPxWpdhK1pcTU7jS4oty0vX0eevi9vton/3zvAZO6qmKMK094/zWZIRa3RVl6I5xuScKj1vl6dNMrUCOZWQtE62Ifo+b0TCKppPqbvMqIhitKqukZYzJVqzLla3wUbpjb8SH6rF7lGYrvt1jI8cYdTOtkhEudCwhmUrnlPwceZAjZ5kNrxk5cLype21ge6SJSrJt4HCtnpg3KXQvbNC1l2c2jaDD/bT18s2+m/6gJPA698N6gpL9mMPbelALnX6I78FStFDXUvEO3JaNm7As2rbwiBR4k1k/GH4eE10WaDcM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39830400003)(376002)(346002)(366004)(396003)(38100700002)(26005)(36756003)(6512007)(41300700001)(83380400001)(107886003)(6666004)(2906002)(52116002)(8936002)(2616005)(44832011)(1076003)(186003)(6506007)(5660300002)(86362001)(66556008)(66946007)(66476007)(8676002)(6486002)(4326008)(38350700002)(6916009)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KEXf20L3WJ7+8UgtFyzPH72M0V6vW/iD+y/ITGo7JB3a6F///NbMWtYvXdfH?=
 =?us-ascii?Q?Ye0Iquwng/ST2DGwuisg3oCUQqOJC5VeT3NCN8IsbayHHHNXqoFs56j7uj2l?=
 =?us-ascii?Q?GdHdi9cCcnQ8D5Ah7DD+Fy2JAdi0zyPvR5lEiyQ6aHvPed2HPQQQGGthCuMi?=
 =?us-ascii?Q?/0RDNFDb4kKFBJSdogvtFdu3fQeFMGiQbQaQ+aLGsadLXtDRbSHzFuZLZV4N?=
 =?us-ascii?Q?PNcdDWitNOvroYqiAAWtllhzXtHfSbJuw+KRRpx6nnW4vuQRlgIpQ1/xG2sw?=
 =?us-ascii?Q?9f40YR4dH1yU0RMKcj36MS7tRmH4CcybxHkmnPkbhC4XjyRwKHaHIcI/Oist?=
 =?us-ascii?Q?w98ZwMQZkmuK4S4J7gFXvOJsrynQ4+gKqrJdezopROBaPHOi2kPzBXbh+198?=
 =?us-ascii?Q?ZdBCOk+6BeXpRWcggJTUBUDsmxDiS4f2l5sE19Qnvw2/AFWRUpMaoZPKxI3B?=
 =?us-ascii?Q?i5wx9Pcy8O6jrpmxmwYV7Mprt0Ys6qrswHUouOiOgYN7wiqTcuCWUfSvm22k?=
 =?us-ascii?Q?/LNjlLxUnVuqXLucbtthe8mWPCTtuGfll4H8qAsST1HaR3+Pzg1J1tyKi1/X?=
 =?us-ascii?Q?UnU856qaoPtm1swqad2DPHIDmEYt33EU4d7mT0Yu/7chBDHsIt9+4Dz+ibQO?=
 =?us-ascii?Q?4L7rDTwCZ9BtJq1O8POvG/6j5f2hSs+zm+R5LYWI7z6QQt+HemmLf1KKNFKP?=
 =?us-ascii?Q?RzdWox7lTB3tVJhr2fYatu1vfu7GsKK0L7zeP8YznRxyOzcPhyTm8k0bynWx?=
 =?us-ascii?Q?tFoYmOLzfakXWO2XUTnIf7weQ4fzCpv39Hf7LnS06jB5N310sbcjFe+3AAqV?=
 =?us-ascii?Q?DzoHLHDnnfmcg6K55ptMDxdV/diRUm9ZN+FnMqsAmLIt9Fvsmz8lkl/xw4fK?=
 =?us-ascii?Q?yzuOcCSgaQOOlVgczHBJEAtfT/eF/EETBWqlA3Qt5py6u3E2RYj4H44v6JXL?=
 =?us-ascii?Q?iy3kaSFIFCQONAIANFucWHWF7w8/KmimS/VqQPa0Ti94ff/1RQ1SszIpWc6T?=
 =?us-ascii?Q?cPNSMco6Buyv5RWlfByxX1LJelPjjZWF8Y64+8qkZIdVeTwHDcFdFQAVPyHC?=
 =?us-ascii?Q?bZaVDrabinPslYWbTznh/9KAHaU8PgRKSOSkjhguBLSeZH0fRtvFqNwoNtCW?=
 =?us-ascii?Q?b1weYQqisPNLciumCEXzuKSQ/0KgXGjrLN9nXrdAMf7pnjwLL1gnO44TBsvZ?=
 =?us-ascii?Q?nOECImC+fbP8llOg0gablZnS11soEJ0Wtwy7zA1Fgcuza+nqrECayEYqsPvR?=
 =?us-ascii?Q?NBRzZOpZ+Llu8mDOKpnThKIq9M7KSi8vHpRQ4/VpsLqAkzEL6ellv/e1erox?=
 =?us-ascii?Q?h1jQWuzioA5Rp8MZkqcCpA5WJa4r3SVq6QcQw9UEsR1exliWCclzGLIMCrwj?=
 =?us-ascii?Q?RcWKclp1nN15sNT/DprWbXRgtadqevXzjqF3haZHrshbxIy9pByi2xqMmlgy?=
 =?us-ascii?Q?c486ag8zTggefA1QtTrJ6Q6tYC04hHdbUWR/EqgEqqIGnW9eOJ2eW3WM9hqK?=
 =?us-ascii?Q?7Yhw+bytukjydAIiHf7FE4NkX3O+zaMXPi/agv4wCDUymAwcXplW87Lj+NDz?=
 =?us-ascii?Q?KWsZeUsxEc6ANRCSIOfhcDkryPDM5UmmnNMHfMKeM82whTtzXEjlJmg4rz+0?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dccb2e8c-5e43-45a8-3036-08da94bad430
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:32:17.2352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCbfXOrjZ1KyG3NxvllCzfAT0ZINAaVMccNSCw77r1loGJ5qsnwLS7/CIQ3a91tAF5rRzht+55feJi4e9T4SIoqWSc4soMzHbm9Jn/Hu91A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9481
Received-SPF: pass client-ip=40.107.6.137;
 envelope-from=Milica.Lazarevic@Syrmia.com;
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

Since there's no support for exception handling in C, the try-catch
blocks have been deleted, and throw clauses are replaced. When a runtime
error happens, we're printing out the error message. Disassembling of
the current instruction interrupts. This behavior is achieved by adding
sigsetjmp() to discard further disassembling after the error message
prints and by adding the siglongjmp() function to imitate throwing an
error. The goal was to maintain the same output as it was.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 100 ++++++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 55 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 077dfe0dea..0121d5da61 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -31,7 +31,6 @@
 #include "disas/dis-asm.h"
 
 #include <string.h>
-#include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>
 
@@ -133,10 +132,9 @@ static uint64 renumber_registers(uint64 index, uint64 *register_list,
         return register_list[index];
     }
 
-    throw std::runtime_error(img_format(
-                   "Invalid register mapping index %" PRIu64
-                   ", size of list = %zu",
-                   index, register_list_size));
+    info->fprintf_func(info->stream, "Invalid register mapping index %" PRIu64
+                       ", size of list = %zu", index, register_list_size);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -466,8 +464,9 @@ static const char *GPR(uint64 reg, Dis_info *info)
         return gpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid GPR register index %" PRIu64,
-                                         reg));
+    info->fprintf_func(info->stream, "Invalid GPR register index %" PRIu64,
+                       reg);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -503,8 +502,9 @@ static const char *FPR(uint64 reg, Dis_info *info)
         return fpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid FPR register index %" PRIu64,
-                                         reg));
+    info->fprintf_func(info->stream, "Invalid FPR register index %" PRIu64,
+                       reg);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -518,8 +518,9 @@ static const char *AC(uint64 reg, Dis_info *info)
         return ac_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid AC register index %" PRIu64,
-                                         reg));
+    info->fprintf_func(info->stream, "Invalid AC register index %" PRIu64,
+                       reg);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -562,55 +563,38 @@ static int Disassemble(const uint16 *data, char **dis,
                      TABLE_ENTRY_TYPE & type, const Pool *table,
                      int table_size, Dis_info *info)
 {
-    try
-    {
-        for (int i = 0; i < table_size; i++) {
-            uint64 op_code = extract_op_code_value(data,
-                                 table[i].instructions_size);
-            if ((op_code & table[i].mask) == table[i].value) {
-                /* possible match */
-                conditional_function cond = table[i].condition;
-                if ((cond == NULL) || cond(op_code)) {
-                    try
-                    {
-                        if (table[i].type == pool) {
-                            return Disassemble(data, dis, type,
-                                               table[i].next_table,
-                                               table[i].next_table_size,
-                                               info);
-                        } else if ((table[i].type == instruction) ||
-                                   (table[i].type == call_instruction) ||
-                                   (table[i].type == branch_instruction) ||
-                                   (table[i].type == return_instruction)) {
-                            disassembly_function dis_fn = table[i].disassembly;
-                            if (dis_fn == 0) {
-                                *dis = g_strdup(
-                                    "disassembler failure - bad table entry");
-                                return -6;
-                            }
-                            type = table[i].type;
-                            *dis = dis_fn(op_code, info);
-                            return table[i].instructions_size;
-                        } else {
-                            *dis = g_strdup("reserved instruction");
-                            return -2;
-                        }
-                    }
-                    catch (std::runtime_error & e)
-                    {
-                        *dis = g_strdup(e.what());
-                        return -3;          /* runtime error */
+    for (int i = 0; i < table_size; i++) {
+        uint64 op_code = extract_op_code_value(data,
+                             table[i].instructions_size);
+        if ((op_code & table[i].mask) == table[i].value) {
+            /* possible match */
+            conditional_function cond = table[i].condition;
+            if ((cond == NULL) || cond(op_code)) {
+                if (table[i].type == pool) {
+                    return Disassemble(data, dis, type,
+                                       table[i].next_table,
+                                       table[i].next_table_size,
+                                       info);
+                } else if ((table[i].type == instruction) ||
+                           (table[i].type == call_instruction) ||
+                           (table[i].type == branch_instruction) ||
+                           (table[i].type == return_instruction)) {
+                    disassembly_function dis_fn = table[i].disassembly;
+                    if (dis_fn == 0) {
+                        *dis = g_strdup(
+                            "disassembler failure - bad table entry");
+                        return -6;
                     }
+                    type = table[i].type;
+                    *dis = dis_fn(op_code, info);
+                    return table[i].instructions_size;
+                } else {
+                    *dis = g_strdup("reserved instruction");
+                    return -2;
                 }
             }
         }
     }
-    catch (std::exception & e)
-    {
-        *dis = g_strdup(e.what());
-        return -4;          /* runtime error */
-    }
-
     *dis = g_strdup("failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
@@ -22004,6 +21988,12 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }
 
+    /* Handle runtime errors. */
+    if (sigsetjmp(disassm_info.buf, 0) != 0) {
+        info->insn_type = dis_noninsn;
+        return insn3 ? 6 : insn2 ? 4 : 2;
+    }
+
     int length = nanomips_dis(&buf, &disassm_info, insn1, insn2, insn3);
 
     /* FIXME: Should probably use a hash table on the major opcode here.  */
-- 
2.25.1


