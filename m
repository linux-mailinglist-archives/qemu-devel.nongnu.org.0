Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0EA4CC7E6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:22:03 +0100 (CET)
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPste-0007Bj-60
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:22:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsZ5-0006FY-8V
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:49 -0500
Received: from [2607:f8b0:4864:20::633] (port=46937
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYu-0004Ox-T8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id bd1so5844389plb.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KnojlxdJvLZ10xztEz7NOsevcqMVQEVsVSU9aLxpzTg=;
 b=DCaVZasdPQz2EBo3aBRp2UaE52zHtsG0FYX9v0HPKWPLD/DYcQNu3UhyEYLRbxalRt
 ruTjNDquWUHD7zxCTGFY9Dw5E82Cklg8uByt48UPD5B0Sb80ibeHRWchmsY/sTPUBxta
 HApTKBzjtQSw2F1Sn46OvjMLujhDUP/wvphpG0HATy1p6lxeoGkgvTdUETSkttKRwEIE
 eXswFaqYKdPVP1MXLB8Ygh5Qg/AvTy2FtNbxQq1WX7j8M2jFnNXd3VSkZQIeeAxPDkwo
 +SjprWlvFSPfOz0lzh9YuCDXQT27jfeTUorcH9HY9WpMnGxYlGa0XQ+9WwNH+BLZ2rKd
 AYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KnojlxdJvLZ10xztEz7NOsevcqMVQEVsVSU9aLxpzTg=;
 b=BsQ2UcQLLo57Ox/Uf191RsyNzoaBoEeSgVjRridPOnmOO+nF3kk+Pt7MelvnkA+yRO
 PGAt6jGpjY0V2yKCKPCASg+TQwBdSGqcatjfoZiDBnD4FfKcAzSWfmg2SixunhlMqsNQ
 VnTjpKeiERWwcXt9RbQWgJqb/MFh7vWyjxsSLv49+N2wWl5Zsglxalqk4rO+pRfzfUuj
 sLABDaP/8M3cA1LGGC54NCrRFyePIQY+/EfGijXMxbuo8xw3Mq+/J4ebK27UX6gs+1h4
 YV7ExVK8RFgLwpSLtGcixXribPRCt9hhh/s3zt3DbM6/vcKeiey/rjrZymNcTNSZn1vM
 iuCg==
X-Gm-Message-State: AOAM532XKppl7bz10mBObsP/mmkGpvr5LLMG8Y8xvvvJpO4Cf2XbK6c0
 U7yGNaaT7lq+16021QmqYZlciS6Nxw8njA==
X-Google-Smtp-Source: ABdhPJwBq2+ejwdpHQP0dAdvcRZGqJBXlnNdhfMd8sD3n1W98KndUVncv8CNJTxB2npzlLY5bEuWBw==
X-Received: by 2002:a17:903:110d:b0:14d:ca16:2c7 with SMTP id
 n13-20020a170903110d00b0014dca1602c7mr38243566plh.68.1646341232442; 
 Thu, 03 Mar 2022 13:00:32 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 10:59:44 -1000
Message-Id: <20220303205944.469445-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All 32-bit LoongArch operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Cc: WANG Xuerui <git@xen0n.name>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-sa32.h |  2 +-
 tcg/loongarch64/tcg-target.c.inc  | 15 ++++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-sa32.h b/tcg/loongarch64/tcg-target-sa32.h
index cb185b1526..aaffd777bf 100644
--- a/tcg/loongarch64/tcg-target-sa32.h
+++ b/tcg/loongarch64/tcg-target-sa32.h
@@ -1 +1 @@
-#define TCG_TARGET_SIGNED_ADDR32 0
+#define TCG_TARGET_SIGNED_ADDR32 1
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a3debf6da7..425f6629ca 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -880,8 +880,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_fail_alignment(s, l);
 }
 
-#endif /* CONFIG_SOFTMMU */
-
 /*
  * `ext32u` the address register into the temp register given,
  * if target is 32-bit, no-op otherwise.
@@ -891,12 +889,13 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
                                           TCGReg addr, TCGReg tmp)
 {
-    if (TARGET_LONG_BITS == 32) {
+    if (TARGET_LONG_BITS == 32 && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, tmp, addr);
         return tmp;
     }
     return addr;
 }
+#endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
                                    TCGReg rk, MemOp opc, TCGType type)
@@ -944,8 +943,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
     tcg_insn_unit *label_ptr[1];
 #else
     unsigned a_bits;
-#endif
     TCGReg base;
+#endif
 
     data_regl = *args++;
     addr_regl = *args++;
@@ -954,8 +953,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
 
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, data_regl, base, TCG_REG_TMP2, opc, type);
+    tcg_out_qemu_ld_indexed(s, data_regl, addr_regl, TCG_REG_TMP2, opc, type);
     add_qemu_ldst_label(s, 1, oi, type,
                         data_regl, addr_regl,
                         s->code_ptr, label_ptr);
@@ -1004,8 +1002,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
     tcg_insn_unit *label_ptr[1];
 #else
     unsigned a_bits;
-#endif
     TCGReg base;
+#endif
 
     data_regl = *args++;
     addr_regl = *args++;
@@ -1014,8 +1012,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
 
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
-    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
+    tcg_out_qemu_st_indexed(s, data_regl, addr_regl, TCG_REG_TMP2, opc);
     add_qemu_ldst_label(s, 0, oi,
                         0, /* type param is unused for stores */
                         data_regl, addr_regl,
-- 
2.25.1


