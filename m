Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1425A8DB0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:53:29 +0200 (CEST)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTd8q-0002zc-Er
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4P-00073r-Eu
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4K-0002Sn-RM
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 i188-20020a1c3bc5000000b003a7b6ae4eb2so706508wma.4
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=U/h2PuXjGmHqeTevSKtXVEUhLbvpxvYx+D8DjCnF93A=;
 b=aZ2eXVYnP0GT4VRMHKspmAvo2o7RKWyg0XCUPZHTag0jRpDd94OUohCVq7rx4ey/dp
 T/qabEpYT8fT1MpZufzRuCeKiaq9vHf5dgz6FStMbr3MTTMFcGmOlfG2mUTYz1MY7gRV
 DohQL5CIrLXc6Sa6ytJeEyKQ250B8e4gtGK2IPfxM7Y4oika2HM3PUH1zioBOedjp8sp
 ZZUkH/nd2lrzxATzgEFlQOCsXVHN2Zwe8xs7P77nKFBPlCMg9v3/DOZFzuimCDO4JHjv
 7g/3BV4itrHhH9tyPP/np48k1GfpU1LBfyga0QXi7pAd/KdqO9jFHSaF/IgqN9Diw3sJ
 uC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=U/h2PuXjGmHqeTevSKtXVEUhLbvpxvYx+D8DjCnF93A=;
 b=s+kEie0bKspGJW6KXN0sdkEHcZm+tnsq8qG50T+ZSMYPunQlOMP8Xhd3a62FqIx7xr
 tKQz/qQeyiFiX1saPfPUwNkk077EYaAPZ36m/2W1vwVd8S/HdcVN2S9zAYIeux2Tb6JU
 stDYWlypDikMw9abipfbtHLZcv6qSMwSGIPxnV3loXi0GzGrprmam4AZeFF6jaBTCbL/
 sv12M/yV7kLw+wjLDqtXJNmXLnyxv5kJdyDwaSwfkKstFsdhMtZyz9s30JlgB/nuSU3w
 ADPEWE4ieIRso+z3iP7uLaL64+qIl6OWHu8iNLCUC8JpFTW/SKaOniq7W5yTQB8FyTSR
 /ZAg==
X-Gm-Message-State: ACgBeo3gRbm6crJsWXCgI2aFnzcsuo82zBOvGKnV9+vbGuUqNZcHCd69
 hrWkVzS29Fhxyan3doGUYG6Gm1Zp1asNhr5KU98=
X-Google-Smtp-Source: AA6agR6BmvZfOEg5Mca6YVRDLIdKk5+10k0HS45zDwRx/LwgHa6HA8TSV9fOg9Hs0pdTieU3ejEtfA==
X-Received: by 2002:a05:600c:35d4:b0:3a6:18ba:1585 with SMTP id
 r20-20020a05600c35d400b003a618ba1585mr4026091wmq.48.1662011327263; 
 Wed, 31 Aug 2022 22:48:47 -0700 (PDT)
Received: from localhost.localdomain ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0022533c4fa48sm13429938wrp.55.2022.08.31.22.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 22:48:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 1/4] target/avr: Support probe argument to tlb_fill
Date: Thu,  1 Sep 2022 06:48:40 +0100
Message-Id: <20220901054843.31646-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901054843.31646-1-richard.henderson@linaro.org>
References: <20220901054843.31646-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

While there are no target-specific nonfaulting probes,
generic code may grow some uses at some point.

Note that the attrs argument was incorrect -- it should have
been MEMTXATTRS_UNSPECIFIED. Just use the simpler interface.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c | 46 ++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index db76452f9a..82284f8997 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -102,38 +102,50 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
 {
-    int prot = 0;
-    MemTxAttrs attrs = {};
+    int prot, page_size = TARGET_PAGE_SIZE;
     uint32_t paddr;
 
     address &= TARGET_PAGE_MASK;
 
     if (mmu_idx == MMU_CODE_IDX) {
-        /* access to code in flash */
+        /* Access to code in flash. */
         paddr = OFFSET_CODE + address;
         prot = PAGE_READ | PAGE_EXEC;
-        if (paddr + TARGET_PAGE_SIZE > OFFSET_DATA) {
+        if (paddr >= OFFSET_DATA) {
+            /*
+             * This should not be possible via any architectural operations.
+             * There is certainly not an exception that we can deliver.
+             * Accept probing that might come from generic code.
+             */
+            if (probe) {
+                return false;
+            }
             error_report("execution left flash memory");
             abort();
         }
-    } else if (address < NUMBER_OF_CPU_REGISTERS + NUMBER_OF_IO_REGISTERS) {
-        /*
-         * access to CPU registers, exit and rebuilt this TB to use full access
-         * incase it touches specially handled registers like SREG or SP
-         */
-        AVRCPU *cpu = AVR_CPU(cs);
-        CPUAVRState *env = &cpu->env;
-        env->fullacc = 1;
-        cpu_loop_exit_restore(cs, retaddr);
     } else {
-        /* access to memory. nothing special */
+        /* Access to memory. */
         paddr = OFFSET_DATA + address;
         prot = PAGE_READ | PAGE_WRITE;
+        if (address < NUMBER_OF_CPU_REGISTERS + NUMBER_OF_IO_REGISTERS) {
+            /*
+             * Access to CPU registers, exit and rebuilt this TB to use
+             * full access in case it touches specially handled registers
+             * like SREG or SP.  For probing, set page_size = 1, in order
+             * to force tlb_fill to be called for the next access.
+             */
+            if (probe) {
+                page_size = 1;
+            } else {
+                AVRCPU *cpu = AVR_CPU(cs);
+                CPUAVRState *env = &cpu->env;
+                env->fullacc = 1;
+                cpu_loop_exit_restore(cs, retaddr);
+            }
+        }
     }
 
-    tlb_set_page_with_attrs(cs, address, paddr, attrs, prot,
-                            mmu_idx, TARGET_PAGE_SIZE);
-
+    tlb_set_page(cs, address, paddr, prot, mmu_idx, page_size);
     return true;
 }
 
-- 
2.34.1


