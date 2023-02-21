Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE769D860
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:21:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGM-0001cw-J2; Mon, 20 Feb 2023 21:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGE-0001bj-2u
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:06 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGC-00084w-8H
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:05 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 i1-20020a17090ad34100b00234463de251so3140723pjx.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LhVgV9owJZbBsi1PlfoOSjvvO0vG/eElRpr1Mn0cSM=;
 b=qEH/jBGMT8DA7uZFBN9gp4cryW6fRT4nQWTMLETuC5W4zvEUtmqVqVbTAa8kd2nWij
 M2gN5gvKox6EQUrzijCKdesjYLrR/NNjQFMD+FDSSbwbQyhcZqGLifcgQtOsNbDV+PRI
 0jp6jaUm97LWiSfMjsH9u9feobKI4RIA79qskRyOzIaOkJzrGov7lWQjrCnr0Ymfofav
 mDl86/9/9fuV/FfxjN+deUAHF7KHaSY8ICENzgFJtDYd6MWfqbU6PTy/ilHagfDPXCTQ
 qQ8RXFlu/0SsDUyFo3YBwEiHGrQEKgPm+gqQEXG3u65s8zUyoIwzmUVfZQA7HhUz5Pxf
 i1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4LhVgV9owJZbBsi1PlfoOSjvvO0vG/eElRpr1Mn0cSM=;
 b=rSQwAZJQp7MWhFTsmgzBc00Z4fynUPRWSJco0jcAiPMtyUZkRdhWjPdG24ZBA8RaVJ
 OstIZQflx9JEVR322iWPti4XJJjBk1bYF4ijGkXe+RcGUAxgkeriCRzERsMRmeQYgaDr
 sUkGM2TYihZq4LFVFKNbhxJS2/gfyGPBUpbNUQjzLweXvLgt4wnX7laquyDHyaRrC84A
 6OTOCueWv4gxZR1Q7JcEeaidBR27dUY2gwT3EGJ72gcDVI/Qevlv1F0iT5+LwHp3MM2t
 rbonPwJDQfzwpBePnbnHBbRD0Qr1l8QoKJv0V8pz76Hn2OwW1LL39sWdD2pkJBeOiW1o
 DLlg==
X-Gm-Message-State: AO0yUKWqxtvtyE655jiYflyfP2iircxk7jzL6NhmKO1hdzVsyOs53Raj
 7MXeRjefI9r1T6pII2BHet183/pcwLGX5pOqS5U=
X-Google-Smtp-Source: AK7set+i6/lTZHeUwG06kZHNNJ6zC6TyaqpjDm4ps2FSrAI7lm71xng5NCrnJechupIRF4QQr+9iSw==
X-Received: by 2002:a17:903:24e:b0:19a:b2ee:cf41 with SMTP id
 j14-20020a170903024e00b0019ab2eecf41mr3241982plh.59.1676946002630; 
 Mon, 20 Feb 2023 18:20:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Date: Mon, 20 Feb 2023 16:19:42 -1000
Message-Id: <20230221021951.453601-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Rather than increment base_reg and num, compute num
from the change to base_reg at the end.  Clean up some
nearby comments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 811833d8de..070ba20d99 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -277,32 +277,35 @@ static void output_vector_union_type(GString *s, int reg_width)
     g_string_append(s, "</union>");
 }
 
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
-    int i, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
+    int reg_width = cpu->sve_max_vq * 128;
+    int base_reg = orig_base_reg;
+    int i;
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
+    /* Create the vector union type. */
     output_vector_union_type(s, reg_width);
 
-    /* Finally the sve prefix type */
+    /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
                            reg_width / 8);
 
-    /* Then define each register in parts for each vq */
+    /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
         g_string_append_printf(s,
                                "<reg name=\"z%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svev\"/>",
                                i, reg_width, base_reg++);
-        info->num++;
     }
+
     /* fpscr & status registers */
     g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
@@ -310,27 +313,29 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
                            " type=\"int\"/>", base_reg++);
-    info->num += 2;
 
+    /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
                                i, cpu->sve_max_vq * 16, base_reg++);
-        info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
                            cpu->sve_max_vq * 16, base_reg++);
+
+    /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
                            " regnum=\"%d\" type=\"int\"/>",
                            base_reg++);
-    info->num += 2;
-    g_string_append_printf(s, "</feature>");
-    info->desc = g_string_free(s, false);
 
+    g_string_append_printf(s, "</feature>");
+
+    info->desc = g_string_free(s, false);
+    info->num = base_reg - orig_base_reg;
     return info->num;
 }
-- 
2.34.1


