Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F271592A72
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:49:29 +0200 (CEST)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUqm-0007zy-Jp
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZX-00017o-Rc
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:39 -0400
Received: from mail-eopbgr50098.outbound.protection.outlook.com
 ([40.107.5.98]:11086 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZV-0001Au-Su
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0UQgjeuuPQ5rinVMouw8AlHUaB9EmGPm9xyeOFb4NsB4MFPgZce9BVirFWeh5sfpICl+/oaosjXIPZXB8yE79D8kUMKx8GHr+t9Jej3JgEG+nDVDatCQIfyK9GCWuLodPulJU6zt4WNTQNPBlNOIAkhp9rRnx26CdfJ3Ne4rOdQUta6YdcLm7QPqu7Y3zLkTCbXdPl81HvK3cUIS9jVNWV2JdOTQML2EyzUEA2OtYZIHPFrls+8RJWck4hhKy2ZYCtCP7Oil9u6vSFvbtBW2KAtr+03GZ15p8jNi6szM1FxSas5SgX7Hsh9pQXNexB8M0OECITeI6hW8Wvox4DtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaES7A8kAWzkTdZNDYyI84C4VLeHa+Bvwj3BlYBBBdc=;
 b=cjndF54TiE13YOaqi1tepIboOcnuWu7zFEA2vVWqG4Hf27ir2nZZjPPSHTLM56qkqi/apMdI9Jf0Ump2Av5Gt0+VTypsl3w5oDUO3ArFOyp6gWa97a+3xPt20MMLa+7HpkG77vyivHZt47bT0CFMprVUumRxQIjUeQ8zBqBFae4euIx30sywn3kAaec1lOAEX0Bl8ju4gLWDr1dsnsoiim5T2GT9CNhvyAdmzMoHN5biT8Qb72f/1fJunTMZw3lOdMWdlEp7R/WLDPQri6r6SEKhejLTc7B2cJLLKvFQI+arVKaMA+v+lGVN6vkJ4+vFcLANvd3sgLup3wFywD4BPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaES7A8kAWzkTdZNDYyI84C4VLeHa+Bvwj3BlYBBBdc=;
 b=b9jR/aSGOFygiRwDoG9TCZYmwFUf6tJIKyTOI1dvSnQrp0SPZ/k+FXKlhBZWKKxcGIHous+2GgFyY6kHFfyX1ffKQvBXJAWoLpZWAzi7BNKJyo6ZZOhA+MvGlOV54P70tElgadIXLlNZTGdt+sErTpQzuQLI1zymJ8m+lkfz2S0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DU0PR03MB9152.eurprd03.prod.outlook.com (2603:10a6:10:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 07:31:31 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:31:31 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 15/20] disas/nanomips: Replace exception handling
Date: Mon, 15 Aug 2022 09:26:24 +0200
Message-Id: <20220815072629.12865-16-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 62e9d9cd-56f8-4cf5-2f32-08da7e902ca4
X-MS-TrafficTypeDiagnostic: DU0PR03MB9152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Dvvmy+IIK/PMtx0oPbQ1k9U46gXGoqcxmyuzBzDOe3L7HuL8HnHbv+TV05/A9SH13EeioGKDWvoZrfYOnOxIq9UM1tJGBDfvqiNdwNwHnoMxlf6pg+KdnkSHYh+U/Pi3lL5GGRUWSwD52L7ezTnQnf+2ye3VxFfVTuv23V53UdbEGekpdbxQZdXBzWSqSPnnbz9K0xQGT07PhjQv2Msfsd56ZuqUy9DMvNr7pcoqL+lZCNXIDkJuAYktNM57lnvHHlBZM8xfW386SAG8CYB4n0l0KzPS+YxsBkcGqDez9IjsVUUE6pQQSfnQkoBUiiIX7/jM44zhCyzVstKhi2lfcD5GDO/1N8jySQv/jO+sqaKPhIKxt7KObc/lhLR7W2Mln22+IZNn2BTba6kGdxqRDRIrpmyxr03v7Oe3IVvxEiwzw8kp4r8iKQ5tiRwT8v7WlJE07MYnyvYkW0aiZFuhNNsrCRcmqu/yfeuxHB38pg1tut+f6tY6HxTEnaK2VTIzQLobChBCZ8n4wpgp0KuE5yBBSXgUGUre5fA4HfTsD7AbBuoDlwbQ8J3ObfbI0i86FkNG5BzrX2HHRJKvVQWeiPBlgd7YZkpjfdQXiKkIk27GiKhPvfQLuAqXP7O2AaqJPNVvm07CTDWp0h/haf96jHnTQE0e8szSO3FS8NIQ/dykR2EsZcSf4eOOaxBh7uL3zlK4WD2rwLaMfpRNlfOl2KNxyG/QZQ7mkxPyh/AHDLxUMPD/6dNFrdj5iVIpzr7M6y5yhjh7UQ9Ysk/QURBo8/W21zPamSAkihK961GPcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(396003)(136003)(346002)(366004)(52116002)(1076003)(8936002)(5660300002)(44832011)(2906002)(26005)(86362001)(41300700001)(66476007)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(107886003)(6916009)(38350700002)(6486002)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xxIsVttx/5QUTYF8zO8MsX3EwG/JqvxrWQFPD9XqTU+SYXWRVPKnXTPywwG1?=
 =?us-ascii?Q?VChlgII5fjWjfp/1odyR9X4TVaTxVZ5P6r8ggxlq6VBhoY1psz2+PPjDjb7n?=
 =?us-ascii?Q?1UaaYa+RuIX5dk6bVsEm1KgWWgwJnpcaxschBBI6al0/8vQqbXsQaw9dK9fA?=
 =?us-ascii?Q?a3FifZVuujQ+4yxvFF5IfPKClj6wTssqK/HAU6zAd9IZA9bNjaIsDgiOycNx?=
 =?us-ascii?Q?OggqMTAsN996dtsMyyRSlLZSj28dIL9x5p8HgGtI35qn4Kb6SdGx7nZKWXKk?=
 =?us-ascii?Q?5TZjq6AQtnp5YFz5NbIk4MyuDuPIrp90i74jSKn0ezs5vVtfyV0I0as5+c1a?=
 =?us-ascii?Q?PItQZVXuHZcIs6nnl6q2xwhhPxRJ5jKgap6hQ4OAdr41NNw74ej159j/R8w0?=
 =?us-ascii?Q?9QaY4HVVzzaYH1I288Ri8ju9xMyalSi9voUR9J8eHHr4xuafi57oG3PAu0qv?=
 =?us-ascii?Q?nnsgYoEzDm94kYiIBEtz1CsTcfzYD7r5N4tpMWLMSroqsXm2U6kUvy1LijhA?=
 =?us-ascii?Q?7lRlVIbAlBZHkeuRAUtE0BPPucy7AIxaHVl2qExErvh6NpmksIVcT8kZRVme?=
 =?us-ascii?Q?RQShhEX76UyIKvwvzokcVMUxRYLzhiM9TrOgxntZGRCqiXSmL8CzVyPJrk6o?=
 =?us-ascii?Q?bqukL1Rq+sOQV7Ekn2T2BRQ4sEyflK3pFwgJjP6FyD3YRZy1Ml6ErPcT3s5e?=
 =?us-ascii?Q?5HdzVvzu0Nt2z+GPm18PgQyxJXm9UvryqnIDSJ7XGAT88V7ygDGw4J7QnMFf?=
 =?us-ascii?Q?lVYgtIjQu59dFoJg7Q67y7EL6usDpONZWnNhbdEKYFFCwaTANjrMWP0fJb4u?=
 =?us-ascii?Q?e46pDLpZA/pkRO6+613O/aRerwzEjDXAramRBIK0X6xrbcZg0oDD0+zAiNhT?=
 =?us-ascii?Q?I7vevmu81XBllgCyEgGcUOJEoND3Q0oL/ejXWgRsd5QDNMVvfP7Fk06HS4ON?=
 =?us-ascii?Q?kSJe2690KdmH2ce4f3uDs2/vA1rTzzuz5gb7RWmhPHmatlM2U8ConLFRuuxq?=
 =?us-ascii?Q?2s4BpamIwN1CewVSIp7o3WNM0Jy+iMX0/IpUfroRM9qICBJwWqoSZLxivlAE?=
 =?us-ascii?Q?ZT5i/gcpOeSordAHqUw9uRqtLUzRwK+FbrfFLvBVNglt48P8bmzDNw0oyINA?=
 =?us-ascii?Q?Iiamiy4Yco80clqpFzIoRbp5bpsv1fIySUHJhTYNpo5Q3RD55zGNgWdF4qxl?=
 =?us-ascii?Q?qiliTJdvoFBIqvTpKwQw/7+kuVjY7GUqsRw5dHX8ICSGimGiUncfgQ3KLOy8?=
 =?us-ascii?Q?sNG6NWU/2y5fRd9vIx6QUi3TynN6p1btRr06aMklSsckYRB4y4Rm7L3YzFFV?=
 =?us-ascii?Q?be39dNapwYrse8yN2j9oaQ9x0Vnrg/aoKLUxmaRWGUtyyzuER/PJeptZi7CH?=
 =?us-ascii?Q?DT5XqfudTo7QFES9YHeypjsMriKu7WBHtJX2w9DJ+5YS47hgPaFTAQsapsFd?=
 =?us-ascii?Q?MitpFQNgHoyudJUIcEUSTm+1bZa+w5VRhNGZzHNiW7tbZCqdk9gTDiJIG1Oy?=
 =?us-ascii?Q?bYXYyHI5xxnVJjnbex6zgparuusqQjIMAYeSwNzRSGx4JiGn7We02RlKmGQ9?=
 =?us-ascii?Q?5ITUWkJ/doUzmGKvEFATp5imJ2u4HOS6qoI4bparrt3zj3CnhycL3p31kPOK?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e9d9cd-56f8-4cf5-2f32-08da7e902ca4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:31:31.6944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6GvJKJcB7nWBdxpVo0HtFA8cdHrjuXNh8iRl+5gThGPIPFjD8xe8j24U+Uy2TspxX34IVeqSYc8x4YtP65NOuNVYX3SLkLe0HZWhlXY7ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9152
Received-SPF: pass client-ip=40.107.5.98;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
error.The goal was to maintain the same output as it was.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 135 +++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 66 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 769368a984..a8cd878809 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -31,7 +31,6 @@
 #include "disas/dis-asm.h"
 
 #include <string.h>
-#include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>
 
@@ -90,6 +89,8 @@ struct Pool {
 
 static img_address           m_pc;
 static TABLE_ATTRIBUTE_TYPE   m_requested_instruction_categories;
+static struct disassemble_info *disassm_info;
+static jmp_buf j_buf;
 
 static const char *img_format(const char *format, ...)
 {
@@ -133,10 +134,13 @@ static uint64 renumber_registers(uint64 index, uint64 *register_list,
         return register_list[index];
     }
 
-    throw std::runtime_error(img_format(
-                   "Invalid register mapping index %" PRIu64
-                   ", size of list = %zu",
-                   index, register_list_size));
+    const char *err = img_format(
+                      "Invalid register mapping index %" PRIu64
+                      ", size of list = %zu",
+                      index, register_list_size);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }
 
 
@@ -513,8 +517,11 @@ static const char *GPR(uint64 reg)
         return gpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid GPR register index %" PRIu64,
-                                         reg));
+    const char *err = img_format("Invalid GPR register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }
 
 
@@ -548,8 +555,11 @@ static const char *FPR(uint64 reg)
         return fpr_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid FPR register index %" PRIu64,
-                                         reg));
+    const char *err = img_format("Invalid FPR register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }
 
 
@@ -563,8 +573,11 @@ static const char *AC(uint64 reg)
         return ac_reg[reg];
     }
 
-    throw std::runtime_error(img_format("Invalid AC register index %" PRIu64,
-                                         reg));
+    const char *err = img_format("Invalid AC register index %" PRIu64,
+                                 reg);
+    (*disassm_info->fprintf_func)(disassm_info->stream, "%s", err);
+    free((char *)err);
+    siglongjmp(j_buf, 1);
 }
 
 
@@ -628,67 +641,50 @@ static int Disassemble(const uint16 *data, char *dis,
                        TABLE_ENTRY_TYPE & type, const Pool *table,
                        int table_size)
 {
-    try
-    {
-        for (int i = 0; i < table_size; i++) {
-            uint64 op_code = extract_op_code_value(data,
-                                 table[i].instructions_size);
-            if ((op_code & table[i].mask) == table[i].value) {
-                /* possible match */
-                conditional_function cond = table[i].condition;
-                if ((cond == 0) || (cond)(op_code)) {
-                    try
-                    {
-                        if (table[i].type == pool) {
-                            return Disassemble(data, dis, type,
-                                               table[i].next_table,
-                                               table[i].next_table_size);
-                        } else if ((table[i].type == instruction) ||
-                                   (table[i].type == call_instruction) ||
-                                   (table[i].type == branch_instruction) ||
-                                   (table[i].type == return_instruction)) {
-                            if ((table[i].attributes != 0) &&
-                                (m_requested_instruction_categories &
-                                 table[i].attributes) == 0) {
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
-                            const char *dis_str = dis_fn(op_code);
-                            strcpy(dis, dis_str);
-                            free((char *)dis_str);
-                            return table[i].instructions_size;
-                        } else {
-                            strcpy(dis, "reserved instruction");
-                            return -2;
-                        }
+    for (int i = 0; i < table_size; i++) {
+        uint64 op_code = extract_op_code_value(data,
+                             table[i].instructions_size);
+        if ((op_code & table[i].mask) == table[i].value) {
+            /* possible match */
+            conditional_function cond = table[i].condition;
+            if ((cond == 0) || (cond)(op_code)) {
+                if (table[i].type == pool) {
+                    return Disassemble(data, dis, type,
+                                       table[i].next_table,
+                                       table[i].next_table_size);
+                } else if ((table[i].type == instruction) ||
+                           (table[i].type == call_instruction) ||
+                           (table[i].type == branch_instruction) ||
+                           (table[i].type == return_instruction)) {
+                    if ((table[i].attributes != 0) &&
+                        (m_requested_instruction_categories &
+                         table[i].attributes) == 0) {
+                        /*
+                         * failed due to instruction having
+                         * an ASE attribute and the requested version
+                         * not having that attribute
+                         */
+                        strcpy(dis, "ASE attribute mismatch");
+                        return -5;
                     }
-                    catch (std::runtime_error & e)
-                    {
-                        strcpy(dis, e.what());
-                        return -3;          /* runtime error */
+                    disassembly_function dis_fn = table[i].disassembly;
+                    if (dis_fn == 0) {
+                        strcpy(dis,
+                        "disassembler failure - bad table entry");
+                        return -6;
                     }
+                    type = table[i].type;
+                    const char *dis_str = dis_fn(op_code);
+                    strcpy(dis, dis_str);
+                    free((char *)dis_str);
+                    return table[i].instructions_size;
+                } else {
+                    strcpy(dis, "reserved instruction");
+                    return -2;
                 }
             }
         }
     }
-    catch (std::exception & e)
-    {
-        strcpy(dis, e.what());
-        return -4;          /* runtime error */
-    }
-
     strcpy(dis, "failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
@@ -22817,6 +22813,7 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
     info->insn_type = dis_nonbranch;
     info->target = 0;
     info->target2 = 0;
+    disassm_info = info;
 
     status = (*info->read_memory_func)(memaddr, buffer, 2, info);
     if (status != 0) {
@@ -22866,6 +22863,12 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
         (*info->fprintf_func)(info->stream, "     ");
     }
 
+    /* Handle runtime errors. */
+    if (sigsetjmp(j_buf, 0) != 0) {
+        info->insn_type = dis_noninsn;
+        return insn3 ? 6 : insn2 ? 4 : 2;
+    }
+
     int length = nanomips_dis(buf, memaddr, insn1, insn2, insn3);
 
     /* FIXME: Should probably use a hash table on the major opcode here.  */
-- 
2.25.1


