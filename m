Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434BC4C58F5
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:13:06 +0100 (CET)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO93Z-0008Jj-Ca
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vd-000340-TV
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:55 -0500
Received: from [2607:f8b0:4864:20::1035] (port=39788
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8vP-0007TQ-V9
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:53 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso11717421pju.4
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnX70N9tXw0gNkaxVpbBV0ft/4s+qVkI6Ltte/X6Qzk=;
 b=aj1SjNEomV/3nhrTPlxp8PkeAnz9lrO5gD6Q3AtyVkJkm46v86v/Vf+mf97XP+hw2B
 EnnwpcrLyhfhvff5Ik6cmKjeTWDl9vNdOE5j2jPFQt31/c/NF7XWBvqA3C7h3OJFIM9/
 d+edb2NPyuXBOnbSwwcAWOoX4xRdBmC1JIwFuIr78nfKudamt1mPwP+VfibfopOORZIq
 LXDxGQ4vZlNKQfsyetotovilgni2EA0wE8LGvGFlR2SHbYeD12JCDXUYhHcpiB5Z+gK4
 o1C05mf7zPQPAP+2xjF3RVnQrioErIz0zxZXdR4ls80iYuH1W6pXtFmNhppz6z7ZOmVY
 bw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnX70N9tXw0gNkaxVpbBV0ft/4s+qVkI6Ltte/X6Qzk=;
 b=oU6Scwr/xDwneHS8EdNsEXCaIMuTL6uf56HqyXTPGtl/GtXXldrMvJxO9eirlZUAfa
 5fo3Bgwqbkt9MZ5+gyDg2gtZrTnFV9stxc8jmr7Jq06qPDtavcYjyuOWwGW8fqCP10ml
 ijXSGobZNKjZ6T3ZjyuY+RcvNLg+LRimSHInzCpE6mtCZNw1dGZEo+WO+S8Uhat1+q7C
 IYb38CFecdxsQ8hHetNm5dcUOitalxW0lDT1GTzKVcqU2yqs6n/fzUCTWsEK1iaDuVHQ
 wlSx07ukaznUJlYWiPS2JWw3F+UlSSGcwJaSLodQH2Mvglo+K0Wqqid/cjJwl0LeR0dc
 7Ctw==
X-Gm-Message-State: AOAM533AZ587t2AQBtDyOxMPbt5JYATonOjBidevoljxe6VtLaCCaWJe
 5CpXzO1iocsPAkFCdI4gcYPDbR2nE6L7AQ2N
X-Google-Smtp-Source: ABdhPJy6bIBK9GPv4XF7N+ajN158S+SipQflo5QkYP+ZD0EEKugi3EkGvNL73vgvBXajqb8GHTDvFg==
X-Received: by 2002:a17:903:4115:b0:151:34d0:6717 with SMTP id
 r21-20020a170903411500b0015134d06717mr9315148pld.169.1645927468509; 
 Sat, 26 Feb 2022 18:04:28 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32
Date: Sat, 26 Feb 2022 16:04:13 -1000
Message-Id: <20220227020413.11741-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227020413.11741-1-richard.henderson@linaro.org>
References: <20220227020413.11741-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All 32-bit LoongArch operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Cc: WANG Xuerui <git@xen0n.name>
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


