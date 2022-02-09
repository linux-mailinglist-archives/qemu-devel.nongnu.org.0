Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3604AFFFA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:16:50 +0100 (CET)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvGb-0002XM-7H
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:16:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuxd-0007HY-6C
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:57:13 -0500
Received: from [2607:f8b0:4864:20::431] (port=39812
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuxV-0008PO-5P
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:57:12 -0500
Received: by mail-pf1-x431.google.com with SMTP id r19so6748831pfh.6
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXBbohT5DpNOtupUCDmW7tyAHJaQAJL39tzOlvtcajc=;
 b=OYE8wuf5zHyrnTdIoB2I7Wq3QqJmeZMdobQebv8CD2zgOxOUkiPsRbBuDZhInmdQP+
 PZSZWZ/UE5pktpC+gw1f27hy+H5slQkNLMA+A3P5ofAdj0O9c4rJ5+6j2m6oGAy5e1vZ
 8kMww070NGS1v11BhsHeJnW/CGUVUSt6V8Ft1QMBaAWhMfS4MtjkoXdIZdca4FVRmNxQ
 TPoYHa1wscsdLxZtjMkR84EAihyLA+x6nmHxIK1oluuSn7B+IPG/JD6+VH4cS2NWElmz
 wLVwO4yPr0qdJOja+6nCNm8ESmYW5ocQ0gm8VIkgWq9u10dcxxBbrcVnW0te5WJSoDAB
 0Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CXBbohT5DpNOtupUCDmW7tyAHJaQAJL39tzOlvtcajc=;
 b=ewKGAX+L8TAzODvE1o3hipgMsndlORHI86JSQsBr6cWyAPvUAIQehCHvUct1N5fKTn
 8NcDcwNC728Jq6hZN38VZQ3RUvdMURB81Ez4bHPFrylwWpECAPM5PICRkSUxPn0vmBo9
 du7x8MivTfNZVsPbg0s2JiYw6bxz4n0ParqYjjmOo0Ux/tYjs4TocyMJA9NBna44aUOK
 X5uhzjMak2HaaqDpg99m7YWYKo69W2sFsTDTBIwuDuwcIdX32uiHm/03vlsngKI9tOpg
 HfyGw5jY9xe/z/QQ2a7GLwBFJ/tE+XB3z1MJNdtY77U4ei3+OhXLEhf3i2e2QweBPgY4
 ieSA==
X-Gm-Message-State: AOAM532AvwbVIhRXqehuehYWHVrVEKRr+eUDDhqVlrH+rE9f0DLyjzn/
 xfpasxdzP+/gH/j9KpVMhLvwnqhRbAg=
X-Google-Smtp-Source: ABdhPJwDDYMioTE1PEDd59lcNXaGjkTZah/V1LuQAstDjTXHA1jaR+wCeo0J7iWJ72duYkdsthU4LA==
X-Received: by 2002:a63:4641:: with SMTP id v1mr124492pgk.283.1644443813852;
 Wed, 09 Feb 2022 13:56:53 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 30sm14716844pgq.39.2022.02.09.13.56.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:56:53 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 15/15] hw/sh4: Restrict SuperHCPU type to target/ code
Date: Wed,  9 Feb 2022 22:54:46 +0100
Message-Id: <20220209215446.58402-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sh4/sh.h  | 3 +--
 target/sh4/cpu-qom.h | 2 --
 target/sh4/cpu.h     | 4 ++--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
index ec716cdd45..a4245399d5 100644
--- a/include/hw/sh4/sh.h
+++ b/include/hw/sh4/sh.h
@@ -28,7 +28,6 @@
 #define QEMU_HW_SH_H
 
 #include "hw/sh4/sh_intc.h"
-#include "target/sh4/cpu-qom.h"
 
 #define A7ADDR(x) ((x) & 0x1fffffff)
 #define P4ADDR(x) ((x) | 0xe0000000)
@@ -36,7 +35,7 @@
 /* sh7750.c */
 struct SH7750State;
 
-struct SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem);
+struct SH7750State *sh7750_init(ArchCPU *cpu, MemoryRegion *sysmem);
 
 typedef struct {
     /* The callback will be triggered if any of the designated lines change */
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index 64be55a924..d186ad40fa 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -29,8 +29,6 @@
 #define TYPE_SH7751R_CPU SUPERH_CPU_TYPE_NAME("sh7751r")
 #define TYPE_SH7785_CPU  SUPERH_CPU_TYPE_NAME("sh7785")
 
-typedef struct ArchCPU SuperHCPU;
-
 OBJECT_DECLARE_TYPE(ArchCPU, SuperHCPUClass,
                     SUPERH_CPU)
 
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index c72a30edfd..8e49163fb3 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -195,14 +195,14 @@ typedef struct CPUArchState {
  *
  * A SuperH CPU.
  */
-struct ArchCPU {
+typedef struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
 
     CPUNegativeOffsetState neg;
     CPUSH4State env;
-};
+} SuperHCPU;
 
 
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-- 
2.34.1


