Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEBB6F8FDC
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:25:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCFg-0003ua-Ei; Sat, 06 May 2023 03:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFe-0003tO-3k
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFb-0004Kg-Vg
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:41 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so17360625e9.2
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357758; x=1685949758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkgYs/pHlLvep4nhbNf+04epzdD+G5zrqDmAy5YX7Hk=;
 b=xQTMA052TkRs05J0PuuQVEP3+FPs7wxhMPgVK9OkpkmWOZZhCbvQ56xoiKxMNCxmFo
 o7u2FaFx0MCKAbqxpWeF4SvzZMnyOq1JxKfGTYf2h5/qEjWRgds1/JkTKysPZDK3Yhls
 CsISa4QY7I2IAhwBANV9GJTLOZ2Glii+bsDXjbhfyu6+B3+G9n3guEr/5Y/KFn4+zgGz
 CAuHCsw0Q3A5k9hUZww75av17ZaIAfmZB2hbswCtI5cze8ADkv4sUJ4r6NOK+w27zSm+
 G4t5VH+Z0xhbFxhKDREIwwGlTmiWlJsGnop+fsALAt1Sla+lN667t/zX2aop8JANMmAO
 a/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357758; x=1685949758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkgYs/pHlLvep4nhbNf+04epzdD+G5zrqDmAy5YX7Hk=;
 b=S2m211gs5dqCCRu98ykyPQy2SJ7ba+nEnoYm5r0I2szyR37lYGm9cXgHPMuFoGwZh3
 tm1tbYXPT5RXqZFgZHJKYazxaLw7p6JNj5LmlKUuY9Aa47NOUa9nY2FNnL/osksq6pYB
 u8ZhiylE2p6eYDS36MOPe2G0WINl59D9w7UfM4vXHFLCkEvaGtjDoUtMGHWZePMZL6ru
 mEIIfN73r3+0HULi8Hj+E9bDGaPonSNfbRtaKAQ/XbOndYXWWTWa6GjQD+iswJCS+qK/
 0YXNJ//6t8xMLxGHeIpF1kB6pUHTLzui50GjYS2e4v8GjERSQzQUeCy3//I0yyVYHgix
 uiQg==
X-Gm-Message-State: AC+VfDxA6zf6IQUXotVEkLim+Xa7IlRGGXKjv1JzUdVmyNMJC5GWbbtY
 5MmWZKLWAEw3leDm3uLEl29TsxEfUgizhyaW6jVZjw==
X-Google-Smtp-Source: ACHHUZ4p58Hg4KiwQRJBGeTc/UHy0xW/diElxva+USKuqRfgS+JTLzqnKTsshD76K35UfuiCv2uioA==
X-Received: by 2002:a7b:c8c6:0:b0:3f1:979f:a736 with SMTP id
 f6-20020a7bc8c6000000b003f1979fa736mr2557796wml.34.1683357758623; 
 Sat, 06 May 2023 00:22:38 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 02/30] tcg/i386: Use indexed addressing for softmmu fast
 path
Date: Sat,  6 May 2023 08:22:07 +0100
Message-Id: <20230506072235.597467-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Since tcg_out_{ld,st}_helper_args, the slow path no longer requires
the address argument to be set up by the tlb load sequence.  Use a
plain load for the addend and indexed addressing with the original
input address register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 237b154194..8752968af2 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1837,7 +1837,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
     } else {
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
         tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
                      (uintptr_t)l->raddr);
@@ -1910,7 +1911,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
     } else {
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
         tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                     tcg_target_call_iarg_regs[2], l->datalo_reg);
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
@@ -2083,16 +2085,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
                          TCG_REG_L1, TCG_REG_L0, cmp_ofs);
 
-    /*
-     * Prepare for both the fast path add of the tlb addend, and the slow
-     * path function argument setup.
-     */
-    *h = (HostAddress) {
-        .base = TCG_REG_L1,
-        .index = -1
-    };
-    tcg_out_mov(s, ttype, h->base, addrlo);
-
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
     ldst->label_ptr[0] = s->code_ptr;
@@ -2109,10 +2101,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     /* TLB Hit.  */
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
+               offsetof(CPUTLBEntry, addend));
 
-    /* add addend(TCG_REG_L0), TCG_REG_L1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, h->base, TCG_REG_L0,
-                         offsetof(CPUTLBEntry, addend));
+    *h = (HostAddress) {
+        .base = addrlo,
+        .index = TCG_REG_L0,
+    };
 #else
     if (a_bits) {
         ldst = new_ldst_label(s);
-- 
2.34.1


