Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79926463160
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:43:37 +0100 (CET)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0bo-0006ZT-J9
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:43:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WN-0006mN-Ur
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:37:59 -0500
Received: from [2a00:1450:4864:20::331] (port=43673
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WL-0000P8-M6
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:37:59 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so14442934wmc.2
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dP+9d3o+4iGiJYfpiZHLiWZnrSima8SPJ1WsmYW0nMk=;
 b=zeiBICkHMjLbjBhxK5vU9sulFdhiKJD7uuWpUXC4QRDEzjm8Fc6AZ28OpdXZxxo1k3
 +Xewkp9Nu3xewMxxpJrNS6ID6KHKHluPrUC9mH1B6fx08Oic/lz7RiQyCcG6s/XhSEJW
 tVc7Amrq4jWoCG0ivx9jz8vyCVsLGL2OZQ1Y6LJ3hG6bF5j/KlayEG5rATTTm+JcQjmo
 5uKbRPGBkI2fLRLN7oSLNm3Fh2CYgycBPBoVZoeeGWc2ZCrdZgonYedSVcDzwYSg86m7
 yEpSwpV8P+6yeCZIwOc4juV4mlsBrLqFGdu+bTqEMTYwyH0hmxBey7q/gQe1o6JDzVXz
 5lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dP+9d3o+4iGiJYfpiZHLiWZnrSima8SPJ1WsmYW0nMk=;
 b=4YJyVnKDJ5a6QNM0nooSKnTe5EyMwTlSkm2lpUfnJsD7bR6lCs8JGl2bq3VaUVMB1k
 usPpiyy0ElfgGd+1YeCH01rUOg+6f8/YXhHSUJBeAVNPFRyPyiXVl0UZUnSJGK3zHe/S
 JkJo38rhIqW+DegGQk3HcCBZ6JBaBSj1dWlyF0ArmSYAtbfSRtHOZbxwxeC1Kqm+bwz7
 F5WkJgW9CzgQxwVxnlpo8n0KLaCCUNwbU9epApG8/ntDthf1YIzz5G1GMxikM0KDUVUI
 XZGBF1c8mfY3u5RyqKG71rGpm77S4F0bz1UmdlvDK/xpKpDfx8MJ1AQOb0IGbWhB4M4M
 ABgw==
X-Gm-Message-State: AOAM531MhbIosk9ryn1wIK3awcu/FgfY7ZKqZZdDb//9l+GNgK1Fqa4R
 IPZKKojfkf8T7rwUigNcCbc7uvapGpfSgUykwu4=
X-Google-Smtp-Source: ABdhPJwqh6uMMSTORHrNhf8gJYdzptJacj5Esbr5R/KTB+ufY/6abnWh1Z/DpaEpEh92mykz7L1AJg==
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr3978165wml.49.1638268676339;
 Tue, 30 Nov 2021 02:37:56 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id m21sm16311280wrb.2.2021.11.30.02.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:37:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/m68k: Implement TRAPcc
Date: Tue, 30 Nov 2021 11:37:51 +0100
Message-Id: <20211130103752.72099-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130103752.72099-1-richard.henderson@linaro.org>
References: <20211130103752.72099-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h       |  2 ++
 target/m68k/cpu.c       |  1 +
 target/m68k/translate.c | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index a3423729ef..03f600f7e7 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -527,6 +527,8 @@ enum m68k_features {
     M68K_FEATURE_MOVEC,
     /* Unaligned data accesses (680[2346]0) */
     M68K_FEATURE_UNALIGNED_DATA,
+    /* TRAPCC insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_TRAPCC,
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c7aeb7da9c..5f778773d1 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -162,6 +162,7 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CHK2);
     m68k_set_feature(env, M68K_FEATURE_MSP);
     m68k_set_feature(env, M68K_FEATURE_UNALIGNED_DATA);
+    m68k_set_feature(env, M68K_FEATURE_TRAPCC);
 }
 
 /*
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 858ba761fc..cf29f35d91 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4879,6 +4879,26 @@ DISAS_INSN(trapv)
     do_trapcc(s, 9); /* VS */
 }
 
+DISAS_INSN(trapcc)
+{
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* trapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* trapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* trapcc (no operand) */
+        break;
+    default:
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+    do_trapcc(s, extract32(insn, 8, 4));
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6051,6 +6071,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
+    INSN(trapcc,    50f8, f0f8, TRAPCC);
     INSN(tpf,       51f8, fff8, CF_ISA_A);
 
     /* Branch instructions.  */
-- 
2.25.1


