Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A04339A7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:03:35 +0200 (CEST)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqeM-0006bS-97
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpye-0008Fx-PA; Tue, 19 Oct 2021 10:20:28 -0400
Received: from mail-dm6nam10on2083.outbound.protection.outlook.com
 ([40.107.93.83]:29965 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpyc-00083V-RT; Tue, 19 Oct 2021 10:20:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MY3YgZCTA4UZ2PyC3QznGV8QFUZYFl4+osyPCnw8AQqMILezWGV1LUS89Acdv6fhJYUBnrnguv8Ex7HpKa9IioNQUqn8yncWvoCTZFfWFDCETBMtsRxhiNtCHTnu194o3jfAFeQoOG8GrzTgQdZ+esk/m296F5FnKl1em4v7pNhDwxQCC2kxlI1fDZehrvK2vfLIV23GYV6tQduYEudmgpPSb8eusXq8fXrRcy4ZlSX43gcPx1dsDJ8VzLJKIuuaotmJuhg95EHdlHGoz8oLgfMFcD5udioc7KTl9iknHaBG/Wbf8zfeDjdlJWrdCGJcIBlyjfeghp0TgixC9KAOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZneDv9v/wgTpdLKFiCQyDzLIEnp4jb7OieCyJfWdLYU=;
 b=ed8x8/d+JpChQDfmUc3dvew8F3pkj5l2Y6muX7O+OJs7DqAsKt8hz19skVEa/pzaXrxLu0sP/JafsD12deGwrYjid6vvcsWYIcOIsk9mKcOmbJrG79iBLI4akFIBL0Rz6R/afH0i5tuZ28MhfXaohkG9r1W0cSq1KQqohZwOqVyM0s7gHx/ppPN1LYOlzLDr9uInMlZ7SvzZzBEOSO+RyjsSlcyhYAdwy5uYsFTqqyF3Pb5h3f+Vn+eFyZRQeVggiIR/gHgk3sVFkh94EhB7NyAuBHwS8ngZx6Gwshy26jfMixO7ghHPNX87ktq1oriT/TBVRLE8fHz1u6I5+UgKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZneDv9v/wgTpdLKFiCQyDzLIEnp4jb7OieCyJfWdLYU=;
 b=DkCPEFzSV+c7Al0Dwo3s/U1PIZ9+sCfz7lo/wcEWIEGJ85ghGuopIn19FTNzejNY2ZFbGvV1qljN7C5PKe+m0WopA5G0YJynW8Q+jfQ5lgtLqjZh2ZH3aGp+LwKBNV8HIWRANkyyh7bPGEhhqd8aCdojHNPGtAkoQWYbe966fL4=
Received: from BN9PR03CA0936.namprd03.prod.outlook.com (2603:10b6:408:108::11)
 by MWHPR12MB1199.namprd12.prod.outlook.com (2603:10b6:300:10::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:20:20 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::9a) by BN9PR03CA0936.outlook.office365.com
 (2603:10b6:408:108::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:20:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:20:20 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:20:19 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: [PATCH 24/64] tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
Date: Tue, 19 Oct 2021 09:09:04 -0500
Message-ID: <20211019140944.152419-25-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a0c0e23-d304-4e5a-602e-08d9930b953e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1199:
X-Microsoft-Antispam-PRVS: <MWHPR12MB11990ACBF1AD8A19D868611E95BD9@MWHPR12MB1199.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t5tlf4I8wV0fJ1z+JH68boV+RWeqXWz/RiUt8WYbZoY+KHAT5dahATxDI+aMFmyW11JlUAN0K8zhsR37qDfYFUkBJAxn8H8uVl27wWPVcFl080oJxn7GCYaFe7w5kwiaUhqWZ4iml5hd+gbaupu/PctUr0zwO0ASvprEdFOZGgbOH9IVkETXSXiKwPPJSvJ8x08xmdNEXPV3K58emKsyOYhQk7f7RkywBw1+SK1OqKZFAfLqMoabXyjaCMj7vWIaPGK1MKh1WFJkmFvdqhrdygP5z3Jzd5+BvLr27YSHgmTNKEAmBmRGk4xwe7VRgcmJA1tVa+zN0Ip16TjS/Lhdn3+9apVizlkOfqW8qShEpierlfV92Iue0X9kwxiVyNIPs9/gRBM+ur+qPqPblnxXP5WqwbWXPKNJ7kzn7SnQOf6571jAUkasdQsHFml+t3OJfIZ3SLlnTmjKi405guIOuvT733jC6/jL57tQncioaYhFO5wOz8KW3+0mSWYNQcDzU41Yr/+bnbQPUaArUzg38MDTTr7J5am9A1yUXF6oWbEWW9bAl9nsAgx33z+s88jdg0IHBFrgOb0/8/XDjYK5xmO7kvKQxCYbbkpfiDOuX2PdipGzgFL3zHQdGr1EiV46Mfq/k9GvbrBZVVlHb/dvx6BSUCPIK5oHMp2AmUFNJgtGkOivpHGo5YwcSY9zq6vYlBP2QH5KIWQ9zPIIZWsSzgUa7i/nNIRAvkiN5IdBCIw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(426003)(26005)(336012)(47076005)(36860700001)(16526019)(8676002)(36756003)(82310400003)(186003)(316002)(2616005)(5660300002)(4326008)(1076003)(8936002)(83380400001)(70206006)(6666004)(70586007)(2906002)(356005)(44832011)(508600001)(6916009)(86362001)(54906003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:20:20.6993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0c0e23-d304-4e5a-602e-08d9930b953e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1199
Received-SPF: softfail client-ip=40.107.93.83;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

We should not be aligning the offset in temp_allocate_frame,
because the odd offset produces an aligned address in the end.
Instead, pass the logical offset into tcg_set_frame and add
the stack bias last.

Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
(cherry picked from commit 9defd1bdfb0f2ddb3ca9863e39577f3a9929d58c)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tcg/sparc/tcg-target.c.inc | 16 ++++++++++------
 tcg/tcg.c                  |  9 +++------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 3d50f985c6..c046d1cc60 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -987,14 +987,18 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 {
     int tmp_buf_size, frame_size;
 
-    /* The TCG temp buffer is at the top of the frame, immediately
-       below the frame pointer.  */
+    /*
+     * The TCG temp buffer is at the top of the frame, immediately
+     * below the frame pointer.  Use the logical (aligned) offset here;
+     * the stack bias is applied in temp_allocate_frame().
+     */
     tmp_buf_size = CPU_TEMP_BUF_NLONGS * (int)sizeof(long);
-    tcg_set_frame(s, TCG_REG_I6, TCG_TARGET_STACK_BIAS - tmp_buf_size,
-                  tmp_buf_size);
+    tcg_set_frame(s, TCG_REG_I6, -tmp_buf_size, tmp_buf_size);
 
-    /* TCG_TARGET_CALL_STACK_OFFSET includes the stack bias, but is
-       otherwise the minimal frame usable by callees.  */
+    /*
+     * TCG_TARGET_CALL_STACK_OFFSET includes the stack bias, but is
+     * otherwise the minimal frame usable by callees.
+     */
     frame_size = TCG_TARGET_CALL_STACK_OFFSET - TCG_TARGET_STACK_BIAS;
     frame_size += TCG_STATIC_CALL_ARGS_SIZE + tmp_buf_size;
     frame_size += TCG_TARGET_STACK_ALIGN - 1;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1fbe0b686d..a9cf55531e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3489,17 +3489,14 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-#if !(defined(__sparc__) && TCG_TARGET_REG_BITS == 64)
-    /* Sparc64 stack is accessed with offset of 2047 */
-    s->current_frame_offset = (s->current_frame_offset +
-                               (tcg_target_long)sizeof(tcg_target_long) - 1) &
-        ~(sizeof(tcg_target_long) - 1);
-#endif
     if (s->current_frame_offset + (tcg_target_long)sizeof(tcg_target_long) >
         s->frame_end) {
         tcg_abort();
     }
     ts->mem_offset = s->current_frame_offset;
+#if defined(__sparc__)
+    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+#endif
     ts->mem_base = s->frame_temp;
     ts->mem_allocated = 1;
     s->current_frame_offset += sizeof(tcg_target_long);
-- 
2.25.1


