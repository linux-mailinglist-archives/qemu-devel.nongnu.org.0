Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1E69697E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyDB-0006vJ-Rb; Tue, 14 Feb 2023 11:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCw-0006U4-Kf
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:08 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCu-00029e-UF
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:06 -0500
Received: by mail-pl1-x632.google.com with SMTP id m2so17587859plg.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5U6nLfif2wOhX5Oed2Osbgbcfi6KWrVp6W4p+qPIqc0=;
 b=s7Sbpvi1x4KFz8X1u42VgCuTs0I5lffWQgHWaT4+sLah1SSQOz8gy4IaTPyiFPkKqB
 ES5TfK2Te+d3wHfXGHPYPw9XaA2Zd9TY2r/4EJPdx8SHhA6hcPLuP3BGX0MuBg7YqMfx
 oSD/b/zT0R8pqdNXrVLrdzOpO7gCsVVEaXDb/uAS9qJFSeUok44l4xemhDBkZI1z/VGG
 9esjCx+yjORiES/rNGRrE/hEC95JFPpQl5efYL1BZe3mNsnSZmaDqibTCiJv6yahuk1Y
 ofjBwK1/BN4fqQzoR+rAiMfnUlR/lmE0wXZbBi6oeVwrj1rNfQnd0NFzSqjRSICMB0iJ
 LgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5U6nLfif2wOhX5Oed2Osbgbcfi6KWrVp6W4p+qPIqc0=;
 b=z8NvjZ0/jCzEM5fHK2v1lcfx3R6tQyQrdzeOSma73K1VB7XxnTxkMnhck/vRUx6jmA
 1tCQ0MVLR3KBiG7WQY8H2rLgv0/xo52hCVQWlddk/JzlWL8gYU73/c6bx4roIzTThL/s
 76Nd0gauCw5H2Y1ZxQprPztRgq7BHTgfRruN5FUZp3SoxLuiKsZywDfiQ9shmSUhHJOR
 5wiKTm/HmDb1Pp5dlPltMGuzx+kuitijCBKUyDFrWlkEnkSGTHeU37J9BSay8YdqTV4I
 qZ0MoleMy6Y8I/vkyLO/lDS8izEzrxH1d5hG8wYA50rGbkPd0wfQr2B6qaanbZAfrerh
 rQ2A==
X-Gm-Message-State: AO0yUKVhv5mmdZhyUc3JeFUaaZ+osjNFusLnuTGYQ+eK6o6Swz5cW2XT
 I115eiO4U7Uhf8w3uwWd/G5TwPrKfUNToOOSfJE=
X-Google-Smtp-Source: AK7set+x934TCRRnGKm88ZtLm7cU/NGvrmfcgDT+NqiRL32HD795RZpBd8fabbzYGbt9VKI6RUJSEg==
X-Received: by 2002:a05:6a21:3397:b0:bc:b98c:a8b3 with SMTP id
 yy23-20020a056a21339700b000bcb98ca8b3mr3401198pzb.32.1676392263607; 
 Tue, 14 Feb 2023 08:31:03 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/14] target/arm: Add name argument to
 output_vector_union_type
Date: Tue, 14 Feb 2023 06:30:42 -1000
Message-Id: <20230214163048.903964-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index ec61211949..166cb288cd 100644
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


