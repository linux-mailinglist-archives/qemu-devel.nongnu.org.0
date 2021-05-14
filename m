Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B036380D00
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:29:33 +0200 (CEST)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZkp-00045u-Ln
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW9-00063F-81
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:21 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW1-000778-0A
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:21 -0400
Received: by mail-qk1-x734.google.com with SMTP id a2so29009121qkh.11
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrfxTZRA7qN0Z5drn+/sSV4gRDlNsw1/Au2ePe0MFvM=;
 b=kPsGusZI0jEQc/C99bqGL21nspwtrSTNyBlb7fWbldxOfkNaYD3u5yrsSyst70mRXU
 UJG0dKEchRCZNFUIYs8e16O+VYplMDHI8MsR+pb4RgAsYjxUeCZMcFkl3kRc8UcXNkPD
 ms5DczeGz/S73jIezxAFamzODFqGjzOiIjQ5aq5lCCf58ULJTY3OuK+Gw5nVbzKwiiax
 WlKUir73cO0bPLwYOyY8vxg4NK2LYpgjwHP3+f8cpzTXlICIsBslT5IRRpVWFo5vND+M
 CVxlfNw0nRIBaV6slun6gL9MBd2Cxle8gizqx6SsErtXqyqdCoHLoy0M74tQoF4CiUyJ
 aOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrfxTZRA7qN0Z5drn+/sSV4gRDlNsw1/Au2ePe0MFvM=;
 b=EqjXZMMn61UTmlJV+dT6dTtwnap3KxwhYn8AI0AViv71/7UHlW3Aw+G/TOPhxVxjo+
 HP3fiVdW67jNi2Xq1xMIKE8qgmlPQOtAGNKj0/MxJOXBsxMcpvWaLvdTHdO+FFVNAh2t
 Wf2alUgn1ekVwBCCH/KOProgykk0ae/Me5AWXcAAwUi4Ryg4v6S+yu54HEoFeFe6dVc4
 c25acIztZ2CZ55G929WYqhv1qIipdpZFiRFhrYFmn/NW/YegWNZ8oes1vc7TwLvXiLJ+
 YNafqscp8QF05z+lwNZliqP0jFUvU2OMvSSRj29ggY9XTZtxdDKQ8oG5xCW/ztkjSxd8
 xg+w==
X-Gm-Message-State: AOAM532njypQ2jg50s35Y5tquqUCgI+vs/5saYRiRdFKsi8ZwOq+P2jN
 h3atsZUS2Kqfmf4HYEYvrgxxcHbkF6MYpwlDRAI=
X-Google-Smtp-Source: ABdhPJyZZnyeyOLnvd3DsFpg0I2iqPJL+V50Nyb0uSH2dCO8kLsqcyW2FwPpBRcl+PvzDdVV7oVYXg==
X-Received: by 2002:a05:620a:22c3:: with SMTP id
 o3mr44645236qki.220.1621005251707; 
 Fri, 14 May 2021 08:14:11 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/50] target/i386: Assert !SVME for user-only
Date: Fri, 14 May 2021 10:13:22 -0500
Message-Id: <20210514151342.384376-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the VMM instructions are already disabled for
user-only, by being usable only from ring 0.

The spec is intentionally loose for VMMCALL, allowing
the VMM to define syscalls for user-only.  However,
linux does not do so; VMMCALL is illegal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a510dd10b1..f58e0f480a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -138,10 +138,12 @@ typedef struct DisasContext {
 #define PE(S)     true
 #define CPL(S)    3
 #define IOPL(S)   0
+#define SVME(S)   false
 #else
 #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
 #define CPL(S)    ((S)->cpl)
 #define IOPL(S)   ((S)->iopl)
+#define SVME(S)   (((S)->flags & HF_SVME_MASK) != 0)
 #endif
 #if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
 #define VM86(S)   false
@@ -7495,7 +7497,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xd8: /* VMRUN */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7510,7 +7512,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xd9: /* VMMCALL */
-            if (!(s->flags & HF_SVME_MASK)) {
+            if (!SVME(s)) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
@@ -7519,7 +7521,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xda: /* VMLOAD */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7531,7 +7533,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdb: /* VMSAVE */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7543,8 +7545,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdc: /* STGI */
-            if ((!(s->flags & HF_SVME_MASK)
-                   && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
@@ -7558,7 +7559,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdd: /* CLGI */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7570,8 +7571,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xde: /* SKINIT */
-            if ((!(s->flags & HF_SVME_MASK)
-                 && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
@@ -7581,7 +7581,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdf: /* INVLPGA */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -8516,6 +8516,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
+    g_assert(SVME(dc) == ((flags & HF_SVME_MASK) != 0));
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


