Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEAB6A4D51
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl81-0007D4-1p; Mon, 27 Feb 2023 16:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7z-0007CL-6S
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:47 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7x-0004IQ-Ih
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so11497085pjb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOAolGlh8kDAOh/uhG+3SdQD/T+2gl27uDkMfKRTxeI=;
 b=jdfw+yjb66AmeaUVtJIDV4D+TptUoyq7/qKtaSDpXwdLzKgDXAPjUCqv94lwxJcUwL
 /8FZiCE92rXtt/PwP5XFmQ/z0adG4B7uSQFiW9/jYHRcqjBAZVUvl/HUNp1q9oiw1PvT
 NzZ1UZyAvl59Jq/jt2oZzfF+ytcuMdbur6APmPMbjgieL5DHRPw8Dfagi5q7Je8HUs4Z
 x/qXdolSYfPk+/6VgAqflxYQ1wRKPtL1EfbPDLCPmtx+gwCmls1+JgpmH9TWqlOQZfNL
 u6kGZQDZ3OVM4JDXCRH4BD7ScGcdzj8cuyr9KJnX5gTbvuxxp1Uf60Lw5lpXSj3ramN3
 TlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOAolGlh8kDAOh/uhG+3SdQD/T+2gl27uDkMfKRTxeI=;
 b=neG/QvtocI4BaZNt1V+Wjm95Q2Tl9UOp+JHSwgPVPX73l6Z29L+HxH1oQoCW1zY0c1
 Ujxm1PeRV9RAVKnTHhxuEKMm/VOdOsYN3/njUmWYyPogmneidhTHNOECtZdlYIRpXD59
 NuXdH7EGyyCEQqWXvH/a9saJjo44W7bZlkp+OtJzlvWwXwToqLMoeIKzUDxLfgANR4sa
 5JQA4yxsNlI+U1rjnxgh4My1RlhEiF+hkfncn++NlfEJDn2QFq98hKeLqMJOpg/3nO/O
 cHAnfQjOIT+CpQkRWZ6zhQXAabshkjwmM39iDfeys84lhBctLYu4c0DcO1Ckca8NxVyu
 VSEA==
X-Gm-Message-State: AO0yUKVvplIgnsw8di2Ydvx02FTPwif5Y8lOeT/mLuUKkfOFfj4yjY27
 qIneju9QvLvW6b5hAT1t1r9AEm4XJZg8bGRoARE=
X-Google-Smtp-Source: AK7set/VAV3tqBPCZnCV53E8SY5LCvI5d1bq5buRUr+FSjEFxNKUlgaVcMsVGECOtpY01sIsM6J0pQ==
X-Received: by 2002:a05:6a20:6a10:b0:cb:a09e:6941 with SMTP id
 p16-20020a056a206a1000b000cba09e6941mr964501pzk.61.1677533624770; 
 Mon, 27 Feb 2023 13:33:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 08/14] target/arm: Add name argument to
 output_vector_union_type
Date: Mon, 27 Feb 2023 11:33:23 -1000
Message-Id: <20230227213329.793795-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

This will make the function usable between SVE and SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index d0e1305f6f..36166bf81e 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,7 +210,8 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void output_vector_union_type(GString *s, int reg_width)
+static void output_vector_union_type(GString *s, int reg_width,
+                                     const char *name)
 {
     struct TypeSize {
         const char *gdb_type;
@@ -240,39 +241,38 @@ static void output_vector_union_type(GString *s, int reg_width)
     };
 
     static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-
-    g_autoptr(GString) ts = g_string_new("");
     int i, j, bits;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
         g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
+                               "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
+                               name, vec_lanes[i].sz, vec_lanes[i].suffix,
+                               vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
     }
+
     /*
      * Now define a union for each size group containing unsigned and
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
+        g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
-                                       vec_lanes[j].suffix,
+                g_string_append_printf(s, "<field name=\"%c\" type=\"%s%c%c\"/>",
+                                       vec_lanes[j].suffix, name,
                                        vec_lanes[j].sz, vec_lanes[j].suffix);
             }
         }
         g_string_append(s, "</union>");
     }
+
     /* And now the final union of unions */
-    g_string_append(s, "<union id=\"svev\">");
+    g_string_append_printf(s, "<union id=\"%s\">", name);
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
-                               suf[i], suf[i]);
+        g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
+                               suf[i], name, suf[i]);
     }
     g_string_append(s, "</union>");
 }
@@ -292,7 +292,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
     /* Create the vector union type. */
-    output_vector_union_type(s, reg_width);
+    output_vector_union_type(s, reg_width, "svev");
 
     /* Create the predicate vector type. */
     g_string_append_printf(s,
-- 
2.34.1


