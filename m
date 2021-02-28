Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447D232756E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:02:54 +0100 (CET)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGW1V-0005FI-9W
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPt-0005kx-Ft
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:01 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPi-0007lo-3V
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:01 -0500
Received: by mail-pg1-x533.google.com with SMTP id p21so10339005pgl.12
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1nE08dhMaE5XVBv3v7IRuYZmIZeZZ0rBWSjMoXgkIQ=;
 b=rP7XhgRgkA4+uZZcM8FeE04eXJkln/OiJufdc1c6+i+RwZVXyaF34XA97NuYnlJMpY
 5AQ9TTce/daVaJkQz6LjaW+7ewqVHqSHPbXPx9UA+PTDHGOgWKc0/yPC3S7UPA0AZOg1
 euR9dE+0E+jYcB7+oBIVZk9fPbmlcVVuyKKp8ROFB//bBM/HOhEQ0vinLJ7J84Mio2q1
 mcavoGT2jSzJwC48a/ZolgFRDloZQNZHyhIE9jFdkzy4eb5UoxASCwQoyaITmnU4vNbq
 sp+q16/ERJ2HqvAy1dgVbibvObnJncKDSroherex3nJXJStkz51udhD7bjOIFs9RM+qa
 +7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1nE08dhMaE5XVBv3v7IRuYZmIZeZZ0rBWSjMoXgkIQ=;
 b=Rn8Weq0ATBwNQlRRjfGfxxYUKD0EN+zgRku+L+mJ1ggPXdNLh/X8uHiJq7LVY/sXul
 xfoyb7BifxxXiUX57vl/TZX/mRsqdcKlSJBCkDlq0Fjo1RBEaxS/7dx4+whykxvf70sj
 z9k+avn9+VRSgLlFMte5qGUCxgbbYUQqfSRRoUDrnmX5O/biAtTmosFspqJ1xHljYX6m
 w9ENvZzqFWDfgS4Uds2MQGqM7CyAYeiBABr2tc4ytc8cRHhn0NEsiaZxLwR1T+w0RQ0X
 5D2DWdhdVbomOML1XMoVW1yuTNPfBIuFOT6kgw0DDP6DcfwyvL/1mRKrGj+GkPrgK/PX
 hXow==
X-Gm-Message-State: AOAM530UI6+uQ+hAN9hfRY6X+Qi88maqKNHGNtE7DdFXgVkh+xF02Pf6
 +SLBdJDv8agtRIqBOzY6zIvtbS47ff2Sjg==
X-Google-Smtp-Source: ABdhPJyNl1fDZEv02AzlsXCK7f2nRWsGfNFlJT3mi95ApmFl4l2lL509ElQvwDzduDWSHg76iRO3Cw==
X-Received: by 2002:a62:2c58:0:b029:1ee:1afa:432b with SMTP id
 s85-20020a622c580000b02901ee1afa432bmr12718906pfs.42.1614554628826; 
 Sun, 28 Feb 2021 15:23:48 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/50] target/i386: Assert !SVME for user-only
Date: Sun, 28 Feb 2021 15:23:01 -0800
Message-Id: <20210228232321.322053-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: cfontana@suse.de
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
index 42b96a2669..3779da9042 100644
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
@@ -7489,7 +7491,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xd8: /* VMRUN */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7504,7 +7506,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xd9: /* VMMCALL */
-            if (!(s->flags & HF_SVME_MASK)) {
+            if (!SVME(s)) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
@@ -7513,7 +7515,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xda: /* VMLOAD */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7525,7 +7527,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdb: /* VMSAVE */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7537,8 +7539,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdc: /* STGI */
-            if ((!(s->flags & HF_SVME_MASK)
-                   && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
@@ -7552,7 +7553,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdd: /* CLGI */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7564,8 +7565,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xde: /* SKINIT */
-            if ((!(s->flags & HF_SVME_MASK)
-                 && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
@@ -7575,7 +7575,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdf: /* INVLPGA */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -8510,6 +8510,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
+    g_assert(SVME(dc) == ((flags & HF_SVME_MASK) != 0));
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


