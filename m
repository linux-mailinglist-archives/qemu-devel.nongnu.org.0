Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A5260D937
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:21:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtm-0004vR-2z; Tue, 25 Oct 2022 22:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtk-0004ug-EO
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:04 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVti-0001An-P0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:04 -0400
Received: by mail-pl1-x635.google.com with SMTP id c2so4483223plz.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UKwi413u+Gz3fnOU9fgpeM4vpnF89V9H4chc4H5gVA=;
 b=MiporuYqgLH6k/A8C0OoRjmhno8z1WI3ieu6lrDfImXr3wbX1FLs215L7mkfiVkvZA
 6T56kzHVe26Ggg4J+y0ePkHDIsd95/WFbjWsq0wrFYCW3X4OHcoEIYIaI3yKdp1PIpJD
 mWUBA+EYQC5DzKAEK5Vz5/av3Dd3vVPXUzB0U6bVseH11ayRjSG0UIO8WJtwLjCGfrRO
 kDT+pJVIv8Fpzc6ax41o75jxJy9UuIdfBZkKGOCH+2LhnbyQkEAxnpu+MzMUNXOBal8c
 5afTABT2FcTGW1rYo91O+z5LET72qzXonNIPDzDQp9lyWqEfMZZi70RU8wxdfMJ6PGOb
 U7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UKwi413u+Gz3fnOU9fgpeM4vpnF89V9H4chc4H5gVA=;
 b=ADzyB0n5crqcfDkiQ83OxLLfmP+gfMESUlhdfpLGUpl7gl88FcqxgR/WGG2F5Ca+zr
 YxYeNQcuguGWDkEZovLCC00/V5JF8sCs1I//NXzlRLMvE4Fs1JgLe2xuyoxRBzj8iPb2
 nbvJyksr6LcwDO9dZ6DO2tn7NkBHb0L3lI+9a8aasr3n3lvShqizu8jLf+3rr2pKIhnx
 QPdJv8mdjAzB/pCVsY8os0DPOigM9uMAWANvp1tOUm6pfWe/DATubGHSxKJGq2gxNyni
 0eeuk+rH+G0NZvhFkvMMVaMLjtrT8pEI9pyQdkx2hZsUrk/bMEqaHFv603bd0n/MNcxI
 5ZJQ==
X-Gm-Message-State: ACrzQf03lXyiKLW+Q46PUEfoK3wUWr01U/fPgwgwoSm5icMCk24xLOcL
 Exn5vDeRq+okxVG3VF0LfJVymBLwnQ9XRPnn
X-Google-Smtp-Source: AMsMyM5uy2j1fB+P2S1XDlJcyeh/RIHxZeGJRdDnmSfJAhT1DryoVXhm1kSHj27Vy3SaXViD1V8Tig==
X-Received: by 2002:a17:903:22c1:b0:185:5276:92e5 with SMTP id
 y1-20020a17090322c100b00185527692e5mr41556117plg.134.1666750321462; 
 Tue, 25 Oct 2022 19:12:01 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 13/47] accel/tcg: Drop cpu_get_tb_cpu_state from
 TARGET_HAS_PRECISE_SMC
Date: Wed, 26 Oct 2022 12:10:42 +1000
Message-Id: <20221026021116.1988449-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The results of the calls to cpu_get_tb_cpu_state,
current_{pc,cs_base,flags}, are not used.
In tb_invalidate_phys_page, use bool for current_tb_modified.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 66c1900ae6..9af5cb49e0 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -502,23 +502,13 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     int n;
 #ifdef TARGET_HAS_PRECISE_SMC
     CPUState *cpu = current_cpu;
-    CPUArchState *env = NULL;
     bool current_tb_not_found = retaddr != 0;
     bool current_tb_modified = false;
     TranslationBlock *current_tb = NULL;
-    target_ulong current_pc = 0;
-    target_ulong current_cs_base = 0;
-    uint32_t current_flags = 0;
 #endif /* TARGET_HAS_PRECISE_SMC */
 
     assert_page_locked(p);
 
-#if defined(TARGET_HAS_PRECISE_SMC)
-    if (cpu != NULL) {
-        env = cpu->env_ptr;
-    }
-#endif
-
     /*
      * We remove all the TBs in the range [start, end[.
      * XXX: see if in some cases it could be faster to invalidate all the code
@@ -554,8 +544,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
                  */
                 current_tb_modified = true;
                 cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
-                cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
-                                     &current_flags);
             }
 #endif /* TARGET_HAS_PRECISE_SMC */
             tb_phys_invalidate__locked(tb);
@@ -679,11 +667,7 @@ bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #ifdef TARGET_HAS_PRECISE_SMC
     TranslationBlock *current_tb = NULL;
     CPUState *cpu = current_cpu;
-    CPUArchState *env = NULL;
-    int current_tb_modified = 0;
-    target_ulong current_pc = 0;
-    target_ulong current_cs_base = 0;
-    uint32_t current_flags = 0;
+    bool current_tb_modified = false;
 #endif
 
     assert_memory_lock();
@@ -698,9 +682,6 @@ bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
     if (p->first_tb && pc != 0) {
         current_tb = tcg_tb_lookup(pc);
     }
-    if (cpu != NULL) {
-        env = cpu->env_ptr;
-    }
 #endif
     assert_page_locked(p);
     PAGE_FOR_EACH_TB(p, tb, n) {
@@ -713,10 +694,8 @@ bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
              * after the current PC, but it would require a specialized
              * function to partially restore the CPU state.
              */
-            current_tb_modified = 1;
+            current_tb_modified = true;
             cpu_restore_state_from_tb(cpu, current_tb, pc, true);
-            cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
-                                 &current_flags);
         }
 #endif /* TARGET_HAS_PRECISE_SMC */
         tb_phys_invalidate(tb, addr);
-- 
2.34.1


