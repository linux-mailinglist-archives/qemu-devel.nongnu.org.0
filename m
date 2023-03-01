Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732196A65DE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:57:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeI-0007tm-DZ; Tue, 28 Feb 2023 21:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeF-0007t2-Vl
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:56 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeE-00031u-6x
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:55 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so11897612pjg.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilPb2IEFR711A5JMA2FRDN9ckTYJ8eccF+1dWUeK1z0=;
 b=xVz0pabBbL0D98xS/Ydtu/9f9aL8UJtiKZU+p4c/Q217u9A6HQ+jFRDI9ExME3Oa5S
 SUW8IaTR/yqMQIWbpaozYTZ0XgG/i/t0rPsFe7AWMnkOyfRszbso9cGIrh3lKc2GJRHX
 aeXSvJXqcmXm2afil6Ye1ReU8uRVVp/Y8154u6Iz/frS+bsT5xleYPRvR1hZriZpFDhe
 0KH0RMJgFvD8mApO9rPcHZ0rlVtdW4B6Vi8NC6n7XwQdxN6o6lV91tL1cTxGpyd0C69U
 sOxii3BT8i33LDQCLJ1VoebFe5iUa92V1Wdz0aqPXyut/Z3j2UqwvH6PbvFFvAcmIted
 oa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilPb2IEFR711A5JMA2FRDN9ckTYJ8eccF+1dWUeK1z0=;
 b=dBtTT6eWARjNAJHECyqaIAcD4qqQ82Dr07xRfTiAYI8iQYGZB/f01+PGp0Q56ifTo3
 7OF8uacqrhTLbhoC1uGMAERej7BiIqVxjLeIyb/FKiu0HJREddHiIaVjsfW8gPwMBA7b
 yM7ROYRd879zRcu3K0pigj5fXc7K1GpvEaxNalwsAYENahH4OamVxBM8eTMiBOQUXVax
 D7hxmj0HtOpWGkSVpVGomxC6oGGIWP9jmHXu5vPa1ZeJ66CDMb5ODowPIHlystPbYXsJ
 WGcTx+arjz922YIx0GKSyIHAX/QTzlGrlQtHYJhRgLu+EsFpge7WVb+nIsDExRzdSOeN
 GdUg==
X-Gm-Message-State: AO0yUKUae+nUW1uT+/XLNtcZVImFZoV1gvr5AdOxTdEB/RncrVHYgkQ+
 hOKX3gxhSpWAiBnD4BLBjD8soYO7C8TvAgqFCD0=
X-Google-Smtp-Source: AK7set843eUzRC/4Q0jAy1AIAXaieOpanAdeadUMJpvx34rSQ8X0/39e6rTR8deTGHHyAgAuznuVBg==
X-Received: by 2002:a17:902:f544:b0:19d:74c:78e4 with SMTP id
 h4-20020a170902f54400b0019d074c78e4mr5783445plf.55.1677639412956; 
 Tue, 28 Feb 2023 18:56:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 04/62] accel/tcg: Add 'size' param to probe_access_full
Date: Tue, 28 Feb 2023 16:55:45 -1000
Message-Id: <20230301025643.1227244-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Change to match the recent change to probe_access_flags.
All existing callers updated to supply 0, so no change in behaviour.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h              | 2 +-
 accel/tcg/cputlb.c                   | 4 ++--
 target/arm/ptw.c                     | 2 +-
 target/arm/tcg/mte_helper.c          | 4 ++--
 target/arm/tcg/sve_helper.c          | 2 +-
 target/arm/tcg/translate-a64.c       | 2 +-
 target/i386/tcg/sysemu/excp_helper.c | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 165b050872..b631832e17 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -475,7 +475,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
  * and must be consumed or copied immediately, before any further
  * access or changes to TLB @mmu_idx.
  */
-int probe_access_full(CPUArchState *env, target_ulong addr,
+int probe_access_full(CPUArchState *env, target_ulong addr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool nonfault, void **phost,
                       CPUTLBEntryFull **pfull, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index fc27e34457..008ae7a66d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1589,12 +1589,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
-int probe_access_full(CPUArchState *env, target_ulong addr,
+int probe_access_full(CPUArchState *env, target_ulong addr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool nonfault, void **phost, CPUTLBEntryFull **pfull,
                       uintptr_t retaddr)
 {
-    int flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
+    int flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
                                       nonfault, phost, pfull, retaddr);
 
     /* Handle clean RAM pages.  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cf3f2fd703..8541ef56d6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -259,7 +259,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         int flags;
 
         env->tlb_fi = fi;
-        flags = probe_access_full(env, addr, MMU_DATA_LOAD,
+        flags = probe_access_full(env, addr, 0, MMU_DATA_LOAD,
                                   arm_to_core_mmu_idx(s2_mmu_idx),
                                   true, &ptw->out_host, &full, 0);
         env->tlb_fi = NULL;
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 98bcf59c22..fee3c7eb96 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -118,7 +118,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * valid.  Indicate to probe_access_flags no-fault, then assert that
      * we received a valid page.
      */
-    flags = probe_access_full(env, ptr, ptr_access, ptr_mmu_idx,
+    flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
                               ra == 0, &host, &full, ra);
     assert(!(flags & TLB_INVALID_MASK));
 
@@ -154,7 +154,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      */
     in_page = -(ptr | TARGET_PAGE_MASK);
     if (unlikely(ptr_size > in_page)) {
-        flags |= probe_access_full(env, ptr + in_page, ptr_access,
+        flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
                                    ptr_mmu_idx, ra == 0, &host, &full, ra);
         assert(!(flags & TLB_INVALID_MASK));
     }
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 51909c44ac..9a8951afa4 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5356,7 +5356,7 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
                                &info->host, retaddr);
 #else
     CPUTLBEntryFull *full;
-    flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
+    flags = probe_access_full(env, addr, 0, access_type, mmu_idx, nofault,
                               &info->host, &full, retaddr);
 #endif
     info->flags = flags;
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index da9f877476..67e9c4ee79 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -14651,7 +14651,7 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
      * that the TLB entry must be present and valid, and thus this
      * access will never raise an exception.
      */
-    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
+    flags = probe_access_full(env, addr, 0, MMU_INST_FETCH, mmu_idx,
                               false, &host, &full, 0);
     assert(!(flags & TLB_INVALID_MASK));
 
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 55bd1194d3..e87f90dbe3 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -64,7 +64,7 @@ static bool ptw_translate(PTETranslate *inout, hwaddr addr)
     int flags;
 
     inout->gaddr = addr;
-    flags = probe_access_full(inout->env, addr, MMU_DATA_STORE,
+    flags = probe_access_full(inout->env, addr, 0, MMU_DATA_STORE,
                               inout->ptw_idx, true, &inout->haddr, &full, 0);
 
     if (unlikely(flags & TLB_INVALID_MASK)) {
@@ -428,7 +428,7 @@ do_check_protect_pse36:
         CPUTLBEntryFull *full;
         int flags, nested_page_size;
 
-        flags = probe_access_full(env, paddr, access_type,
+        flags = probe_access_full(env, paddr, 0, access_type,
                                   MMU_NESTED_IDX, true,
                                   &pte_trans.haddr, &full, 0);
         if (unlikely(flags & TLB_INVALID_MASK)) {
-- 
2.34.1


