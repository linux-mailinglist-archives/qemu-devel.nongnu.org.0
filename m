Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5154AFFE1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:05:59 +0100 (CET)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHv66-0007BQ-4G
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:05:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuxb-0007Gj-R7
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:57:12 -0500
Received: from [2607:f8b0:4864:20::102b] (port=52033
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuxC-0008ON-Uw
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:48 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y9so3434105pjf.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wfdvIayZN4rEH4vTf0zIfKGoIUQlbNKVWZXJsjEqejw=;
 b=QJxyGbe5AbC/+N0iX/F96oXI7Fahc1+Ar2Ng3CkQGJ1lf3E8moQiMAz2wOsJtG3yqk
 d4UHJ1vCHoHMdwv3VIwH7hra4i8/X6QzJETVmE803kzovHKy9R25XfN1Xw8CR4P/ZDjp
 oJ0lS/+zPL9prizumU5mpDcBofizsGeylRAidJhbzDdIuw48VcXspZq4xLgLIeJLNm1p
 7LR1vVaT+hyWMoebHaRky+RFlij7q/vNl7FWmsFOxhzzjhfVPmwPj4wHKvZ44a1DAMzf
 SFTv7g6Vcj8Ik0NvqwTT4SjzBd8du4e6C6p9f4z/j4g7IoEVkj9Yk+JmS4Qb64kf5AsM
 QFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wfdvIayZN4rEH4vTf0zIfKGoIUQlbNKVWZXJsjEqejw=;
 b=jH46mhijKqJQTZ2UpdUSBoBKK3JLUxawGOQSe4vmN+rXsi136aL+hBhXoluJ4Jd4VO
 AnyyGZbAU3/l/N22ZwtqIKP45Mx7bVwZjVFM2MQ8Ts/8t/JqpuefsYe6VSrLtgL8PMd1
 tpZQLh7RPLf1wciwddiubKHdgPx8mnyEGsDs1TmJ+29qSW/BMIwHgy7AKB1oP5E/5que
 MCsvfBgkfNL2bOQPvnT/KFtXSpKQdJvbrNJY7vF0RXjMJFv2sv/j6mubiwnd1/EVQIt7
 c/esykf88Q5/fCOierKPwHWwlUn/82QnqnVR4fVeDFaPL97wwkdmEhfp4fbQ9kaEw2Zj
 NzPw==
X-Gm-Message-State: AOAM533jRf+tBUguxaKUqSzbZ1xbG5FHgHuh/LNIN+DechiohRS/YvZf
 iO9wgB7AY2frQ55jO2yum6oa5wELPMA=
X-Google-Smtp-Source: ABdhPJwTYj98zhDeXE6KyiMNLmlNM7gJsdXbahcFDmI4B6B/9CnD0e4uN3rTq0G0FuWwspCsrqt6zg==
X-Received: by 2002:a17:902:8c87:: with SMTP id
 t7mr4230721plo.170.1644443805593; 
 Wed, 09 Feb 2022 13:56:45 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id ot1sm7399170pjb.22.2022.02.09.13.56.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:56:45 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 14/15] hw/sparc: Restrict SPARCCPU type to target/ code
Date: Wed,  9 Feb 2022 22:54:45 +0100
Message-Id: <20220209215446.58402-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
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
 include/hw/sparc/sparc64.h | 4 +---
 target/sparc/cpu-qom.h     | 2 --
 target/sparc/cpu.h         | 4 ++--
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/hw/sparc/sparc64.h b/include/hw/sparc/sparc64.h
index 4ced36fb5a..605ae4448c 100644
--- a/include/hw/sparc/sparc64.h
+++ b/include/hw/sparc/sparc64.h
@@ -1,11 +1,9 @@
 #ifndef HW_SPARC_SPARC64_H
 #define HW_SPARC_SPARC64_H
 
-#include "target/sparc/cpu-qom.h"
-
 #define IVEC_MAX             0x40
 
-SPARCCPU *sparc64_cpu_devinit(const char *cpu_type, uint64_t prom_addr);
+ArchCPU *sparc64_cpu_devinit(const char *cpu_type, uint64_t prom_addr);
 
 void sparc64_cpu_set_ivec_irq(void *opaque, int irq, int level);
 
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index d5f90cffd4..36ffffcadd 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -29,8 +29,6 @@
 #define TYPE_SPARC_CPU "sparc-cpu"
 #endif
 
-typedef struct ArchCPU SPARCCPU;
-
 OBJECT_DECLARE_TYPE(ArchCPU, SPARCCPUClass,
                     SPARC_CPU)
 
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index abb38db674..8452a62ea8 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -556,14 +556,14 @@ struct CPUArchState {
  *
  * A SPARC CPU.
  */
-struct ArchCPU {
+typedef struct ArchCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
 
     CPUNegativeOffsetState neg;
     CPUSPARCState env;
-};
+} SPARCCPU;
 
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


