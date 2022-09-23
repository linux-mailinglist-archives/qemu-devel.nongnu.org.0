Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE71D5E7B39
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:58:24 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obiG7-00073h-HL
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsq-0006QI-4Y
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsn-0007VT-AM
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t7so20173896wrm.10
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9bX1U7fCCWCM+RDd/fzqQav05Uxy455tmNKKT/hfAUQ=;
 b=rWEgCWnUdgamXStSyyzCw0RZPP/GBIXNbLE2tfhMqzjfhtI7L1aC0NQ/7Xj4kV/zbI
 dFugSZKhhBYQZyPeaOzMR+tcnQu0J7JnQ6QM+cijrBCjHIYURZPdtr6vYxqQ7aV7NZT4
 cSNi75VYK2qZ7B61anc2O32zV1ijU/WPVI/luNzP8KwXwIXvzdAwewZIxedLFuQ6ggJG
 44lr5gjkvGCfGmPsoImiAc6jmbrZ5gr8+wE6+5dzjkgreMLrP90+Z3gIyi6hvfqk/3mo
 a9np/YKtVH6dqdYRRCbJhaCG+Gevj4AYKQ1YG4o/8xBU5oE446lNBJjl3+g6GN5PrLB0
 xo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9bX1U7fCCWCM+RDd/fzqQav05Uxy455tmNKKT/hfAUQ=;
 b=VzHbJqA57fAgSNVWgVopRRwYR4jXe9iCp2hypMw1lzqbnI2zEUmlECDjkOnxDFQ76U
 a1yk4bh9rSQUaxuY45Mw899L+NfWvx0+1yGNIIkN336n13fSqqT3QTm6eESjJYfoXhBm
 4EiO1spSnK1URBNXgvcyRUgaBkMx45AJxRiJcGiD4rNhlvQo7Gd10R/2R23NX7n/i8Ss
 RwfY+Ho4Sa1cXy3GhQEo3xOoF9ALTVhZpqIwlhGjhALMJF/af0cy+mKfMp4+3xpiAh3H
 IPhUqDWyPzixWw2uuMTvYs8gwWdNBGZ6QuvevGrNfyRQiWkt/g5h+FRf1gkkJixJYvbo
 JHHQ==
X-Gm-Message-State: ACrzQf0I+LxFpT/K8IwGxTyL6tRqdn+dcHhnAqVTLI7k/Pvd/LqfQFMY
 /tNHyKQc/c5Fqurb5xFngqo2HI9nEjbb4g==
X-Google-Smtp-Source: AMsMyM52L4HLXMAxKJOLO4QxENItqfX7QEeWqusWCB4cxbKsmjhyZVHykt5AbazPwlKdfNdbeCG0Yg==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr5057563wrr.26.1663936455843; 
 Fri, 23 Sep 2022 05:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003b486027c8asm2504555wmr.20.2022.09.23.05.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 05:34:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/3] target/arm: Mark registers which call pmu_op_start() as
 ARM_CP_IO
Date: Fri, 23 Sep 2022 13:34:10 +0100
Message-Id: <20220923123412.1214041-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923123412.1214041-1-peter.maydell@linaro.org>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In commit 01765386a888 we made some system register write functions
call pmu_op_start()/pmu_op_finish(). This means that they now touch
timers, so for icount to work these registers must have the ARM_CP_IO
flag set.

This fixes a bug where when icount is enabled a guest that touches
MDCR_EL3, MDCR_EL2, PMCNTENSET_EL0 or PMCNTENCLR_EL0 would cause
QEMU to print an error message and exit, for example:

[    2.495971] TCP: Hash tables configured (established 1024 bind 1024)
[    2.496213] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    2.496386] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    2.496917] NET: Registered protocol family 1
qemu-system-aarch64: Bad icount read

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a57d2e1d60..7c7ba328d6d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1927,12 +1927,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
      * or PL0_RO as appropriate and then check PMUSERENR in the helper fn.
      */
     { .name = "PMCNTENSET", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_ALIAS,
+      .access = PL0_RW, .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenset_write,
       .accessfn = pmreg_access,
       .raw_writefn = raw_write },
-    { .name = "PMCNTENSET_EL0", .state = ARM_CP_STATE_AA64,
+    { .name = "PMCNTENSET_EL0", .state = ARM_CP_STATE_AA64, .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 1,
       .access = PL0_RW, .accessfn = pmreg_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten), .resetvalue = 0,
@@ -1942,11 +1942,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .accessfn = pmreg_access,
       .writefn = pmcntenclr_write,
-      .type = ARM_CP_ALIAS },
+      .type = ARM_CP_ALIAS | ARM_CP_IO },
     { .name = "PMCNTENCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 2,
       .access = PL0_RW, .accessfn = pmreg_access,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
@@ -5130,7 +5130,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
       .resetvalue = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
-    { .name = "SDCR", .type = ARM_CP_ALIAS,
+    { .name = "SDCR", .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = sdcr_write,
@@ -7837,7 +7837,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
          */
         ARMCPRegInfo mdcr_el2 = {
-            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
+            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH, .type = ARM_CP_IO,
             .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
             .writefn = mdcr_el2_write,
             .access = PL2_RW, .resetvalue = pmu_num_counters(env),
-- 
2.25.1


