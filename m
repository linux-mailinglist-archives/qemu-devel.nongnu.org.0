Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58292F7C84
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:26:48 +0100 (CET)
Received: from localhost ([::1]:50868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0P7n-00021T-OB
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Ozz-00059P-6w
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:43 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Ozx-0002JK-3D
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id h17so7141241wmq.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hLZqIajkzEU/c6xTrzrj0aRppNL63M3pKJrQ+36KQfM=;
 b=oBnPKmepx1QARKHePO3lKcGt++ogSRSGjIWUGy9NHzDe2kuNi4fup2+433FgrZR1NT
 ajEul0PcBNbfWdl6ACMVJ1wgL6L8Hwxu8dOsUW/jDcA72AXfOVYIjfvTU3Oxl62jIUag
 a9OB7F404h4WcI54fA78QCRCBnA25OamU1MNMnMQLsj13W62i35fm0Kwpz5aGj2jCNrC
 7twJzmH0qwLlLkhngaUGzEKh8NocAU4Y3HXZtw1O1hwl56sSorZZ1rAV1l6hpp3XjtLF
 dHoRku+xY5lqT7xT4QfsSU/E+3yOr5XlbMo4sEQfVuaiH42KPl07I1TgCUyDiiWxzmBD
 nkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hLZqIajkzEU/c6xTrzrj0aRppNL63M3pKJrQ+36KQfM=;
 b=NIaNxuukHA0GHfFnaqn1BwdulvSi36HlTNJTR+2Wz02008gfrW5fi42PUIpAKhZtaj
 gr7Ar3aiFLYlWmCPEsy/KuYpYa9x2Fb80aLtwzLzC6AQ4ajd3mEpJ2TGGnxp9+ifvjZm
 k/20CIKnoaUqdIz28fbgFaT8nXrRexBmGKWoc0dpPhwwSTl2Ag41K724OaJ8btNX/HZT
 0sQ7Tw5qYg8lGzuT1gBz/GD+aq4vsFZUe1wDBZiXtFr/izFhTk/vIBgmWcPNLSjm/1nf
 7Vu5cmQVHDofBc0MsTxyiNfyxAPGf7lPz4vHFp1XIvT22hUlYR0I1dONdlVr243x6U6b
 8/TA==
X-Gm-Message-State: AOAM533jH1DwlTv+3U9hdhZ7PR2NAGxdLzqtqjrWP3xHYsixZirV29vf
 Oz8lq46ZKmAxRIc7PCtaRVMRfg==
X-Google-Smtp-Source: ABdhPJxr/HWWqQ65gmiRPBanhh3bP1uEE0yUA8GQkrFuZxim32hCUDylcPYzYyfsC6PrFd3Dy4R/zA==
X-Received: by 2002:a7b:c395:: with SMTP id s21mr6786112wmj.97.1610716719626; 
 Fri, 15 Jan 2021 05:18:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r20sm17140997wrg.66.2021.01.15.05.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:18:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3EDFA1FFAA;
 Fri, 15 Jan 2021 13:08:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve layout
 for registers
Date: Fri, 15 Jan 2021 13:08:19 +0000
Message-Id: <20210115130828.23968-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Luis Machado <luis.machado@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While GDB can work with any XML description given to it there is
special handling for SVE registers on the GDB side which makes the
users life a little better. The changes aren't that major and all the
registers save the $vg reported the same. All that changes is:

  - report org.gnu.gdb.aarch64.sve
  - use gdb nomenclature for names and types
  - minor re-ordering of the types to match reference
  - re-enable ieee_half (as we know gdb supports it now)
  - $vg is now a 64 bit int
  - check $vN and $zN aliasing in test

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Machado <luis.machado@linaro.org>
Message-Id: <20210108224256.2321-11-alex.bennee@linaro.org>

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 866595b4f1..a8fff2a3d0 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] = {
     { "uint128", 128, 'q', 'u' },
     { "int128", 128, 'q', 's' },
     /* 64 bit */
+    { "ieee_double", 64, 'd', 'f' },
     { "uint64", 64, 'd', 'u' },
     { "int64", 64, 'd', 's' },
-    { "ieee_double", 64, 'd', 'f' },
     /* 32 bit */
+    { "ieee_single", 32, 's', 'f' },
     { "uint32", 32, 's', 'u' },
     { "int32", 32, 's', 's' },
-    { "ieee_single", 32, 's', 'f' },
     /* 16 bit */
+    { "ieee_half", 16, 'h', 'f' },
     { "uint16", 16, 'h', 'u' },
     { "int16", 16, 'h', 's' },
-    /*
-     * TODO: currently there is no reliable way of telling
-     * if the remote gdb actually understands ieee_half so
-     * we don't expose it in the target description for now.
-     * { "ieee_half", 16, 'h', 'f' },
-     */
     /* bytes */
     { "uint8", 8, 'b', 'u' },
     { "int8", 8, 'b', 's' },
@@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     g_autoptr(GString) ts = g_string_new("");
-    int i, bits, reg_width = (cpu->sve_max_vq * 128);
+    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
     info->num = 0;
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
         int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "vq%d%c%c", count,
-                        vec_lanes[i].sz, vec_lanes[i].suffix);
+        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
         g_string_append_printf(s,
                                "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
                                ts->str, vec_lanes[i].gdb_type, count);
@@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
-    for (bits = 128; bits >= 8; bits /= 2) {
-        int count = reg_width / bits;
-        g_string_append_printf(s, "<union id=\"vq%dn\">", count);
-        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-            if (vec_lanes[i].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%d%c%c\"/>",
-                                       vec_lanes[i].suffix,
-                                       count,
-                                       vec_lanes[i].sz, vec_lanes[i].suffix);
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
+        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
+            if (vec_lanes[j].size == bits) {
+                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
+                                       vec_lanes[j].suffix,
+                                       vec_lanes[j].sz, vec_lanes[j].suffix);
             }
         }
         g_string_append(s, "</union>");
     }
     /* And now the final union of unions */
-    g_string_append(s, "<union id=\"vq\">");
-    for (bits = 128; bits >= 8; bits /= 2) {
-        int count = reg_width / bits;
-        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-            if (vec_lanes[i].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%dn\"/>",
-                                       vec_lanes[i].sz, count);
-                break;
-            }
-        }
+    g_string_append(s, "<union id=\"svev\">");
+    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
+        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
+                               suf[i], suf[i]);
     }
     g_string_append(s, "</union>");
 
+    /* Finally the sve prefix type */
+    g_string_append_printf(s,
+                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
+                           reg_width / 8);
+
     /* Then define each register in parts for each vq */
     for (i = 0; i < 32; i++) {
         g_string_append_printf(s,
                                "<reg name=\"z%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"vq\"/>",
+                               " regnum=\"%d\" type=\"svev\"/>",
                                i, reg_width, base_reg++);
         info->num++;
     }
@@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
                            " regnum=\"%d\" group=\"float\""
                            " type=\"int\"/>", base_reg++);
     info->num += 2;
-    /*
-     * Predicate registers aren't so big they are worth splitting up
-     * but we do need to define a type to hold the array of quad
-     * references.
-     */
-    g_string_append_printf(s,
-                           "<vector id=\"vqp\" type=\"uint16\" count=\"%d\"/>",
-                           cpu->sve_max_vq);
+
     for (i = 0; i < 16; i++) {
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"vqp\"/>",
+                               " regnum=\"%d\" type=\"svep\"/>",
                                i, cpu->sve_max_vq * 16, base_reg++);
         info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
-                           " type=\"vqp\"/>",
+                           " type=\"svep\"/>",
                            cpu->sve_max_vq * 16, base_reg++);
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
-                           " regnum=\"%d\" group=\"vector\""
-                           " type=\"uint32\"/>",
+                           " regnum=\"%d\" type=\"int\"/>",
                            base_reg++);
     info->num += 2;
     g_string_append_printf(s, "</feature>");
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5ab3f5ace3..8a492465d6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
         int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
-        return gdb_get_reg32(buf, vq * 2);
+        return gdb_get_reg64(buf, vq * 2);
     }
     default:
         /* gdbstub asked for something out our range */
diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
index 972cf73c31..b9ef169c1a 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
         except gdb.error:
             report(False, "checking zregs (out of range)")
 
+        # Check the aliased V registers are set and GDB has correctly
+        # created them for us having recognised and handled SVE.
+        try:
+            for i in range(0, 16):
+                val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
+                val_v = gdb.parse_and_eval("$v0.b.u[%d]" % i)
+                report(int(val_z) == int(val_v),
+                       "v0.b.u[%d] == z0.b.u[%d]" % (i, i))
+        except gdb.error:
+            report(False, "checking vregs (out of range)")
+
 
 def run_test():
     "Run through the tests one by one"
-- 
2.20.1


