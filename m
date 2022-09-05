Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBE5AD07F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:47:35 +0200 (CEST)
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9de-0006rU-GO
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8x7-0006Mf-Td
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:41 -0400
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114]:64833 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8x4-0002dU-Nk
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:03:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io1lN26IIaUhZNSzWUl8UagLWviJ73WvANgoD1FTjbDo2N8Ycsf1COoxxOT6nHYW19jerKsFBM8RY3sqFxrXm5NHGtOUfR8+qJsx1ZL0twPyKZOgeBVQ8Ph9xncpe4D/fI9fpNS9/Tp19yupVtuGrl5URx1wvYkbokAG5e/2ds3b/8HqvxQAcFl9n64YbPJ45L3B0kUdo2TDbfTU2WaMJjU1B/9V6ofWscauIUFEMVBiN36bQuiLuv/bbp48JrjL59waqbwZrZuSkM8CMoKLM2AiTE3vYtpeXSVl96OhElYORQ5MFpjvoI3kOaO2835Ll35qmW5KcHWPCgDDbxtcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td3BdzREWJR2hkGhQEytt7dh5qQSrLw2unjuK0T3XME=;
 b=d0vG/53UJ+fIAMtFl1+4IDii/F/HW2erQzwYLbuAmTOr6+6s3hVlvEs2HtMEccjLi7owMzAoj6knztuyfz4nzKY9PXPFz/k1VNVP74gfniRh/MG2k3GUGBILZGTli+yZ6jg8QAssivi/mUEo1pgWAdraO+K3uGTyYgwTE+nHlkt9gt5T8+JSTmtxsI4TFPx/BAz4VSV9nzRfitbLNjiSYpriSwJRwr9ldFq72meRVmrdLvBv1t7llw8Ln5GZCTb4NNsJxGdGgsoxrwHHhTdVwWISCrBLuTvR76qCNHMrbuWWMNpfrUDy9twcPedUV9IJdpzeuolER2sc65+7oIfURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td3BdzREWJR2hkGhQEytt7dh5qQSrLw2unjuK0T3XME=;
 b=wsUEd1KQZS4iapS2G7JSCFWhgD9ZiUQIzZT7aZBNiln8thzk+rGFaxWpdKOWe+xoUmav6ass5Srvp26Y5AtVpGt/heRr3JvsZw69rZBNl9SEUoFKybh8syY0CWNofaUmysBjvuqd7EW0EPKByi0xlcX7Qxq6eOAt7Fnz0+xSaeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VI1PR03MB3871.eurprd03.prod.outlook.com (2603:10a6:803:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:03:27 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:03:27 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 16/20] disas/nanomips: Replace exception handling
Date: Mon,  5 Sep 2022 11:55:18 +0200
Message-Id: <20220905095522.66941-17-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7275c0-8854-4a2a-1b79-08da8f25e0bd
X-MS-TrafficTypeDiagnostic: VI1PR03MB3871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VqeXWNu9PlwZM4V32KRSJL8DPcBPt3YLNWJ/y1d7MhmdXs5W/EYKd9iHj9Jv2bpB+RYay5/PJww82LnEhhrNKIhl7aeMdh4licLDtHRC+nSY7XiUGPNuQRN3bsGcVeaUh1w1LEqSNSa0o9uylHASWoxXANfr+izuDK8yFPFln7urLsQHnp1ZtO5QCf3WoRb+ECkNlCghaVnGnIOWxISwOqes5MW3kxpHXpOtuxczP6ILFPc09ayFdZphwe5ETI/7xIebGnfmiEJWCPW8kOvA/F4470A0J2VJ5ZsRAeB7IFijNrQS04KOmvTD863ZitYx/GwTWWf5RUTPt4eUcsqQnDZ3ZNO64JEJoreh6yIfetT5W+UCtspRStnSLjGPmpVTQikav/HMfqMqWgYglMAGdBVAHFkLcYREJPSoryTsNMAxrGrYQpRB9MfiSdt6Wghf5BiSwa80qqq3lZEt747XqmO+fZ/nG3d9CuPppFsExqUoEiOaR+8czkn6QI+9SSvmQatbWexJLHfXuSRdJ0NzPDzzD5muh/3wzws8tSqZhM77B8J95xvKP+alv45ZE5ib8gbpbNI7K4GqDJtjN3CQhELUxYjxoLkqBMtdf67vjgBPhbNvWubjLcerVbOhp5RobQNhg4/4kObcsipm4mUL5+KfZRh34ZFO7o8E8/rWTSFuFrBnE+hoWeCvJ13IbRn8q3rEiQ3ckrgj1mqNVgMe/eTxo78NgjdSmSg82L0nxzB0jYsS9engZeg3TvK9PYKApt8jkO2jhEICtU+ZrZNNLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39830400003)(376002)(1076003)(186003)(478600001)(41300700001)(6506007)(107886003)(6666004)(52116002)(86362001)(2616005)(6486002)(38350700002)(6512007)(83380400001)(38100700002)(316002)(26005)(6916009)(8936002)(2906002)(8676002)(4326008)(66946007)(66476007)(36756003)(66556008)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wz042PWUPLYM3SiUFhBNWyVN691/CPg747CNTMmjb0E6a273ETWHyRc9DcuM?=
 =?us-ascii?Q?A3C/mySdiZUBel9Lho3T8Kq4dvFZMCkjdhe/oP3CI3DiwE+68AVxO4ZaqUHb?=
 =?us-ascii?Q?OxWnVtqpQ2FyP837ZMOxRcdKf1WBvSKXojgXS0ANQvN2rn2fZO7K7YMY2KEJ?=
 =?us-ascii?Q?zHLI7PPlG1mgO1QvyF5NRBLbjG5Sz8DsZtkMIKZ5FEFd41OKI174RRZ7k1wo?=
 =?us-ascii?Q?69TWE+ItNm4vg61UHsWzPXbn/Eku0LNqPNsmgEVmxg3EmZoTIEa75R8ym/Pp?=
 =?us-ascii?Q?lmMyF8uvUmyYtSdtJnt3MuZhabveeu2G10pJxfLXlXRohlrEvAwLrENr1rHy?=
 =?us-ascii?Q?/8i7Z/dGsiOC44ojUjKwGrny6ajDIWZYhvIhvLIh+TAbwm0YuJoYtqeTtDfx?=
 =?us-ascii?Q?HxQPTeVDRUL9Tnzd4+8oNe4RtA5SgD8O/coyXqS9dgxNzUmcCJhtwjP4AmS4?=
 =?us-ascii?Q?FfiForot3/qAK6j5KJyyuQFhV8V86Z2ICjSy//hPoGssThjcZp8KvQ6kcG7p?=
 =?us-ascii?Q?/BH6HW7gMXTfVVLU7WzY4AxYSodpRiVeU5ZoHwYPQ9JYcY0mmZzkWVt8rrQe?=
 =?us-ascii?Q?39la8kqH0tjRwlAzLNVL7L0CwEyzmiHz/CsYBi1HfavNnzNSamSzz8KHRyq/?=
 =?us-ascii?Q?Y8dhtqPdww+YcwAD8uIjtz3PMz06RFB16MreOpJHmTHQXfckaU5vpgpabwDF?=
 =?us-ascii?Q?lcn5T93ffvSwMohYQ/PK7TbqHZSLGC58IoQI+XpymvQ/e3s4iHGl0rvNPaTN?=
 =?us-ascii?Q?MjeYdWTo7F00CE5uh8WsyEazoihzcb10Uz/m5k8K3oM45r1cAU6AGl0OdKI5?=
 =?us-ascii?Q?rJzEbxIRqfa+BhE/0x76a++ExjICJebcq/EyOR5kIqEMsvJVCZ1MJzOvRT1H?=
 =?us-ascii?Q?sLlyqh56WSrfMpvitxO3IwG/TiVKqkGrlco/x57fwof6sLhEwMXw4QirxDxj?=
 =?us-ascii?Q?SY1sDf7TQffJ47G5GdMCZwTY0Oxt9f5M252S5OyvzvjLZJIUiqxzWVNbqqVL?=
 =?us-ascii?Q?qRLcalc8+o9mrsdEFDuZ1Id3KJLhY3v4ZUuOXXqEFz9d1hFXXnUcY6c5i//h?=
 =?us-ascii?Q?WEMVI25086PMN3V3mBuNv0FF5Bye9eyTRO2Hy0U+z2+7Ou0fyhrIZp72Q0lo?=
 =?us-ascii?Q?XqOxAn0xN+a6zBP10Jbfo5UnyY1lNtqi+7/b/rJ8ilNihpDPVzjoJCvo86vU?=
 =?us-ascii?Q?k1xW2APz4gj02m3TG8gPu6YKqWdAFgMZLddi+0AmXoFiqHcZBVjd5dL0ScVP?=
 =?us-ascii?Q?epQ5fPx4+Z1fY4C3o8uYABLwJUUYkQ6fmqfIX9SJoCevAGkQcKQGALmkN2lJ?=
 =?us-ascii?Q?vB/GBu3fCfLdqmQQ4VnS3m04MJarMonMXs8MMxbtUiZQfoYuXnLfp/O3h9D1?=
 =?us-ascii?Q?67C7lWD748DkbifTy4fjjrK4AvAxDIilm7sLhaaa9K99tPQv3o/KAWR7oxCP?=
 =?us-ascii?Q?ixq/LbwUHr825MG8+booxz4XeJJjG7F6jwL/mFIDyPcaILdE/Ts5Hu2LgZIA?=
 =?us-ascii?Q?Et5OK93bBYpXx/sOZ6bB8d4bc0xZnyAZ7FMNvH9/udhenxFNKEi1JGbqnjbm?=
 =?us-ascii?Q?qaqr92YGq23c39oHQwjXgE0bi/QnOmPbAADiUmoi+2sdGbxuC6WRydPzyING?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7275c0-8854-4a2a-1b79-08da8f25e0bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:03:27.4960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4vaSIffJBaQbC2tuT7rCLU5RO5TC+ThZH7ySpXcEkHTeaBwhRm5esVz55jae+Jio6pyVDGAaJGng3QSplKop4vf16mDlftYrG7r6wG/VW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3871
Received-SPF: pass client-ip=40.107.20.114;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
 disas/nanomips.cpp | 126 ++++++++++++++++++++++-----------------------
 1 file changed, 61 insertions(+), 65 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 5142f307fc..a8295ebfa8 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -31,7 +31,6 @@
 #include "disas/dis-asm.h"
 
 #include <string.h>
-#include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>
 
@@ -134,10 +133,12 @@ static uint64 renumber_registers(uint64 index, uint64 *register_list,
         return register_list[index];
     }
 
-    throw std::runtime_error(img_format(
-                   "Invalid register mapping index %" PRIu64
-                   ", size of list = %zu",
-                   index, register_list_size));
+    g_autofree char *err = img_format(
+                      "Invalid register mapping index %" PRIu64
+                      ", size of list = %zu",
+                      index, register_list_size);
+    info->fprintf_func(info->stream, "%s", err);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -514,8 +515,10 @@ static const char *GPR(uint64 reg, struct Dis_info *info)
         return gpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid GPR register index %" PRIu64,
-                                         reg));
+    g_autofree char *err = img_format("Invalid GPR register index %" PRIu64,
+                                 reg);
+    info->fprintf_func(info->stream, "%s", err);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -553,8 +556,10 @@ static const char *FPR(uint64 reg, struct Dis_info *info)
         return fpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid FPR register index %" PRIu64,
-                                         reg));
+    g_autofree const char *err = img_format(
+        "Invalid FPR register index %" PRIu64, reg);
+    info->fprintf_func(info->stream, "%s", err);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -568,8 +573,10 @@ static const char *AC(uint64 reg, struct Dis_info *info)
         return ac_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid AC register index %" PRIu64,
-                                         reg));
+    const char *err = img_format("Invalid AC register index %" PRIu64,
+                                 reg);
+    info->fprintf_func(info->stream, "%s", err);
+    siglongjmp(info->buf, 1);
 }
 
 
@@ -631,65 +638,48 @@ static int Disassemble(const uint16 *data, char *dis,
                        TABLE_ENTRY_TYPE & type, const Pool *table,
                        int table_size, struct Dis_info *info)
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
-                                               table[i].next_table_size, info);
-                        } else if ((table[i].type == instruction) ||
-                                   (table[i].type == call_instruction) ||
-                                   (table[i].type == branch_instruction) ||
-                                   (table[i].type == return_instruction)) {
-                            if ((table[i].attributes != 0) &&
-                                (ALL_ATTRIBUTES & table[i].attributes) == 0) {
-                                /*
-                                 * failed due to instruction having
-                                 * an ASE attribute and the requested version
-                                 * not having that attribute
-                                 */
-                                strcpy(dis, "ASE attribute mismatch");
-                                return -5;
-                            }
-                            disassembly_function dis_fn = table[i].disassembly;
-                            if (dis_fn == 0) {
-                                strcpy(dis,
-                                "disassembler failure - bad table entry");
-                                return -6;
-                            }
-                            type = table[i].type;
-                            g_autofree char *dis_str = dis_fn(op_code, info);
-                            strcpy(dis, dis_str);
-                            return table[i].instructions_size;
-                        } else {
-                            strcpy(dis, "reserved instruction");
-                            return -2;
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
+                                       table[i].next_table_size, info);
+                } else if ((table[i].type == instruction) ||
+                           (table[i].type == call_instruction) ||
+                           (table[i].type == branch_instruction) ||
+                           (table[i].type == return_instruction)) {
+                        if ((table[i].attributes != 0) &&
+                            (ALL_ATTRIBUTES & table[i].attributes) == 0) {
+                            /*
+                             * failed due to instruction having
+                             * an ASE attribute and the requested version
+                             * not having that attribute
+                             */
+                            strcpy(dis, "ASE attribute mismatch");
+                            return -5;
                         }
-                    }
-                    catch (std::runtime_error & e)
-                    {
-                        strcpy(dis, e.what());
-                        return -3;          /* runtime error */
+                        disassembly_function dis_fn = table[i].disassembly;
+                        if (dis_fn == 0) {
+                            strcpy(dis,
+                            "disassembler failure - bad table entry");
+                            return -6;
+                        }
+                        type = table[i].type;
+                        g_autofree char *dis_str = dis_fn(op_code, info);
+                        strcpy(dis, dis_str);
+                        return table[i].instructions_size;
+                    } else {
+                        strcpy(dis, "reserved instruction");
+                        return -2;
                     }
                 }
             }
         }
-    }
-    catch (std::exception & e)
-    {
-        strcpy(dis, e.what());
-        return -4;          /* runtime error */
-    }
-
     strcpy(dis, "failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
@@ -22333,6 +22323,12 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }
 
+    /* Handle runtime errors. */
+    if (sigsetjmp(disassm_info.buf, 0) != 0) {
+        info->insn_type = dis_noninsn;
+        return insn3 ? 6 : insn2 ? 4 : 2;
+    }
+
     int length = nanomips_dis(buf, &disassm_info, insn1, insn2, insn3);
 
     /* FIXME: Should probably use a hash table on the major opcode here.  */
-- 
2.25.1


