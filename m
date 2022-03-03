Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1222F4CC60A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:32:53 +0100 (CET)
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrC0-0005Ki-5d
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvs-00024v-E1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:12 -0500
Received: from [2607:f8b0:4864:20::434] (port=40778
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvm-0007U3-Qk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:12 -0500
Received: by mail-pf1-x434.google.com with SMTP id z15so5545203pfe.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ho2jnp9wAsj5SBP8tX6ESXDweHDs0USlRJ9dHfy8f/A=;
 b=CTNxQqXtZxYoa4O2xPlaWOr5/h3yNMD9m9fAzXA+HjI2ColhGP2jIE4AW+ZAIaTi11
 MxbNRzEIegS+1jzkiIuEZENqLrysUTsvTv1ZtQDs4o0vrvy4S/bwtawfXRoCb7frUFD1
 a5urOOnYjgQvZsW372g+JdzWHP/XIUCkoYTVPpDnD4gdZCrsO3hw3mnN+rNqhlWrizYC
 CYySVIJ3xkvOa+NUC8G2hqsIVlEcrTxC+0X3iNQ6xLYgH8THTuqcBflF8qmjDNnl3v0T
 kfn/VYJXpZQaQKTPqJ+DVEDH0SBmWUafE/cabL8lu0jFkygwvctHqlaxwiVQP89hgHxO
 KTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ho2jnp9wAsj5SBP8tX6ESXDweHDs0USlRJ9dHfy8f/A=;
 b=4lCxZdxFwliQFjgTFLh+vHPbxoVCl33eUOiLMYeLRMabsDqmdIrTxAM8rsH3AMk7Ft
 N1jqK0VtCPHhG3YEA6NtfCEdYkbSyePbnEE2Uchp21+gMWCXiT0E4jjkvjiOpVw74NR2
 tYAdycqAWvEYge5QdE8uLNgCBH5ipMUE6SxvTtA0sYu5nxCjuVc0DeosMpQfCAbksaLL
 rWu5sqgQ7YJJVxHvgZ7C/VvfIy37uoLHC4USKELW19+fYOrkhnOq8EXqNh7p2xTkFCBb
 rZv1DF+AZO7uUCzBEATq6sbOGA7eMIXS8dXTVerrM3Lso/D2UVdiy7YHJC5mRFO0OD8j
 vWJA==
X-Gm-Message-State: AOAM531VrZ+dEglCE9IcrZiTEWYJ8+uQi3W3RsG0ppf9lysBbjHzVaQE
 ftIpthz/2YR7nil01gQDp8eDTkka+/oZaA==
X-Google-Smtp-Source: ABdhPJxfdhZ720W3SuYvzW9VDMAL2+RY2hUTiUrfI3vqZI4XEcdrB7a16bchptiFeg85K/6SuAFlCg==
X-Received: by 2002:a65:48c8:0:b0:375:9c2b:ad33 with SMTP id
 o8-20020a6548c8000000b003759c2bad33mr30638842pgs.232.1646334965563; 
 Thu, 03 Mar 2022 11:16:05 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:16:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] tcg/riscv: Support TCG_TARGET_SIGNED_ADDR32
Date: Thu,  3 Mar 2022 09:15:50 -1000
Message-Id: <20220303191551.466631-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303191551.466631-1-richard.henderson@linaro.org>
References: <20220303191551.466631-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All RV64 32-bit operations sign-extend the output, so we are easily
able to keep TCG_TYPE_I32 values sign-extended in host registers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-sa32.h | 6 +++++-
 tcg/riscv/tcg-target.c.inc  | 8 ++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/riscv/tcg-target-sa32.h b/tcg/riscv/tcg-target-sa32.h
index cb185b1526..703467b37a 100644
--- a/tcg/riscv/tcg-target-sa32.h
+++ b/tcg/riscv/tcg-target-sa32.h
@@ -1 +1,5 @@
-#define TCG_TARGET_SIGNED_ADDR32 0
+/*
+ * Do not set TCG_TARGET_SIGNED_ADDR32 for RV32;
+ * TCG expects this to only be set for 64-bit hosts.
+ */
+#define TCG_TARGET_SIGNED_ADDR32  (__riscv_xlen == 64)
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 6409d9c3d5..c999711494 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -951,10 +951,6 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
-        addrl = TCG_REG_TMP0;
-    }
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
 }
 
@@ -1175,7 +1171,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
@@ -1247,7 +1243,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
     }
-- 
2.25.1


