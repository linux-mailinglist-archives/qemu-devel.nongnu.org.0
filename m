Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB0C69697F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD2-0006ZW-4n; Tue, 14 Feb 2023 11:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCs-0006RX-TS
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:02 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCq-00027S-Mm
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:02 -0500
Received: by mail-pg1-x52b.google.com with SMTP id e1so5759751pgg.9
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Grnio/H04PPuIGiRb3nIsuzzYqUqwsUO7rkz9vUiKr8=;
 b=KR5SR2gMQ2Q4nPkyvqJSrcqclkF32K46fkHwU5XrT1mC/jHjg56ECTqpH4qCKp2N2h
 Ja11as9yTO1ir0YTUd7+IUgxkDCr97ao/trMNVYvDx/Suq77DcAubp+zoTwM+V/OD1xc
 /Pest5Non4iwpkWRjW57gb8U9QtqLiMcj4Q0kurid2KCRoNjF0Zy7KWHM2hc8+16srXi
 SPhcx/fGl9DdR+5J4wg0J4X01P2R05AanV5racMvcZOvAMzu/wZwdtsmo6VsMOfrlAnG
 k5+OKna+IUCcYiPay/0miHFUKa69ftRD43BS7nM5f2LfL+055pbocRd9oLjBMS18c3J/
 3S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Grnio/H04PPuIGiRb3nIsuzzYqUqwsUO7rkz9vUiKr8=;
 b=hsdJQx/655ctonPzsu5g2+FNHMZA5ke07g4oD1OpNzEdbNQ1sp084D+NpYQHPZrdDM
 AE3Yi3zrD1yb1XnVkE+exmsPpCzLoWq8YT/l2r0R9YePOaSXOUSit1mT+a5O3q9WNl9y
 6SutrylmFjJp593rnBEzrrSsX2dP1Cr7UoQiTbDrbuluH22u2H33iu0nWPM3TDA33hyp
 eF+1IMvVj+yDuWH/g+wxSgivzlpkt5OICrgfW8eXY1wpgKR4M9X90oiMDKShaIz9lPBU
 pRLYHECIF/rvfA0XkROWlQ+V4UMYNz2zRNLV9Wz0HEVnyMaw5+1oCxEmSL9lGc7oUfRM
 E8ww==
X-Gm-Message-State: AO0yUKUVtUBeJYexEv7B3BOabHjVvuIJktGW38d72tWRkVpsAdqLdTtx
 Ok2bCVbu/l9hycjYkAH32DAgKPsq2TI8fIfUtrU=
X-Google-Smtp-Source: AK7set+HNYfch3EBYOfoQjPd0j2fcXaRxVclSuAVJgG8vD67DBBZ4Yy+IIf/pVhfU1l7lUGoBc7YDA==
X-Received: by 2002:aa7:9842:0:b0:594:15fd:895e with SMTP id
 n2-20020aa79842000000b0059415fd895emr2277535pfq.31.1676392257746; 
 Tue, 14 Feb 2023 08:30:57 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/14] target/arm: Split out output_vector_union_type
Date: Tue, 14 Feb 2023 06:30:38 -1000
Message-Id: <20230214163048.903964-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

Create a subroutine for creating the union of unions
of the various type sizes that a vector may contain.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 83 +++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 59fb5465d5..811833d8de 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,44 +210,39 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-struct TypeSize {
-    const char *gdb_type;
-    short size;
-    char sz, suffix;
-};
-
-static const struct TypeSize vec_lanes[] = {
-    /* quads */
-    { "uint128", 128, 'q', 'u' },
-    { "int128", 128, 'q', 's' },
-    /* 64 bit */
-    { "ieee_double", 64, 'd', 'f' },
-    { "uint64", 64, 'd', 'u' },
-    { "int64", 64, 'd', 's' },
-    /* 32 bit */
-    { "ieee_single", 32, 's', 'f' },
-    { "uint32", 32, 's', 'u' },
-    { "int32", 32, 's', 's' },
-    /* 16 bit */
-    { "ieee_half", 16, 'h', 'f' },
-    { "uint16", 16, 'h', 'u' },
-    { "int16", 16, 'h', 's' },
-    /* bytes */
-    { "uint8", 8, 'b', 'u' },
-    { "int8", 8, 'b', 's' },
-};
-
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+static void output_vector_union_type(GString *s, int reg_width)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    struct TypeSize {
+        const char *gdb_type;
+        short size;
+        char sz, suffix;
+    };
+
+    static const struct TypeSize vec_lanes[] = {
+        /* quads */
+        { "uint128", 128, 'q', 'u' },
+        { "int128", 128, 'q', 's' },
+        /* 64 bit */
+        { "ieee_double", 64, 'd', 'f' },
+        { "uint64", 64, 'd', 'u' },
+        { "int64", 64, 'd', 's' },
+        /* 32 bit */
+        { "ieee_single", 32, 's', 'f' },
+        { "uint32", 32, 's', 'u' },
+        { "int32", 32, 's', 's' },
+        /* 16 bit */
+        { "ieee_half", 16, 'h', 'f' },
+        { "uint16", 16, 'h', 'u' },
+        { "int16", 16, 'h', 's' },
+        /* bytes */
+        { "uint8", 8, 'b', 'u' },
+        { "int8", 8, 'b', 's' },
+    };
+
+    static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+
     g_autoptr(GString) ts = g_string_new("");
-    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+    int i, j, bits;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
@@ -263,7 +258,6 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
      * 8 bits.
      */
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
         g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
@@ -277,11 +271,24 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     /* And now the final union of unions */
     g_string_append(s, "<union id=\"svev\">");
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
         g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
                                suf[i], suf[i]);
     }
     g_string_append(s, "</union>");
+}
+
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    GString *s = g_string_new(NULL);
+    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
+    int i, reg_width = (cpu->sve_max_vq * 128);
+    info->num = 0;
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+
+    output_vector_union_type(s, reg_width);
 
     /* Finally the sve prefix type */
     g_string_append_printf(s,
-- 
2.34.1


