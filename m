Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCF6F512B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:21:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bj-0004RZ-1V; Wed, 03 May 2023 03:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6as-0008Uo-Tg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aO-0005cK-Qa
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:08:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315735514so10784685e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTISKKo85DNTfZp4wzvl7urwXJJu/e57aqD8BfD1Ntg=;
 b=cwYHKyOqCC/FeIYGsRxsOxWonMyLlX8UX1ALVk7mWEW9vpJi9ueDnlLMZ7dFFRnWT9
 aC5RBdSq7pT4QXtyYxjgAldqdiBXb3aNBtPSaMRjZ6/bUdvOA7aEWNsBqVJmyHxinszA
 q6Ps8usC5QSzlF8+aCibu2SlGu4IRbnKvCojmDYRsVQblUDlqnmChvhJF0BvRyF3yzkY
 RkWmnxW68S2x0hWi1hmYMPMeNXk2f+Yaz+QtsHLxPBEml89BWwOgxc5O7fY1Q1rIcdoZ
 BArXIkPIclf1/NelPO8ZaHQjae9zlqvZSc/Zc9GfJ302cA/nVG2vBUkuC0GUBEv1adyZ
 OAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTISKKo85DNTfZp4wzvl7urwXJJu/e57aqD8BfD1Ntg=;
 b=EbR0ZzXqDlvNYTOy/hoFq2P/dVzl6BZdWZQ7L0QHGzTmsFsMThdxEy8LaI3VojDxQE
 /96ln6fUX+nPQn071opx4SFC03gSFmYVkLR+F94/BGja4fTUe7fqQ8mNu/kK4K4EJ7uh
 6JJCviRl81klIl6nvy2CHPQYGhtRFoBvKTP53+n3L1Jtw+kIDNCCaLshXCBbwwvMhnVn
 yw7HW3dhXkzckA/sWwYb6UNIkaJMmEWg2y4UFtztDpi7E+jojm8ERDbFIVra/BS1Tf0X
 VIpnBCuOJs24tao3fKpAFjj4wYDFxKUC8kiGPj5u36i32qaFe1hYO8tItz+CkEJDCnXp
 YWiQ==
X-Gm-Message-State: AC+VfDxuZfE946BI7UQrHNLYaKewkfHoxv/QpPecWtoX1Od4sdl9grWQ
 EFOXj9cmdicki8FtS2yzeC2+kAWYBpJ/FdYlSdi5+A==
X-Google-Smtp-Source: ACHHUZ4+CkD/vwQ4s0wc+Af/jKib0yooKA8jtensAybGaoTgV73pLN9PH7FZ9aYKzwi/I54g6ozUOQ==
X-Received: by 2002:a5d:56ca:0:b0:303:daff:f1a3 with SMTP id
 m10-20020a5d56ca000000b00303dafff1a3mr786450wrw.1.1683097645455; 
 Wed, 03 May 2023 00:07:25 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 37/57] tcg/loongarch64: Support softmmu unaligned accesses
Date: Wed,  3 May 2023 08:06:36 +0100
Message-Id: <20230503070656.1746170-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Test the final byte of an unaligned access.
Use BSTRINS.D to clear the range of bits, rather than AND.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index ccc13ffdb4..20cb21b264 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -848,7 +848,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
     int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-    tcg_target_long compare_mask;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -872,14 +871,20 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
                offsetof(CPUTLBEntry, addend));
 
-    /* We don't support unaligned accesses.  */
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
     if (a_bits < s_bits) {
-        a_bits = s_bits;
+        unsigned a_mask = (1u << a_bits) - 1;
+        unsigned s_mask = (1u << s_bits) - 1;
+        tcg_out_addi(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg, s_mask - a_mask);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg);
     }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
+    tcg_out_opc_bstrins_d(s, TCG_REG_TMP1, TCG_REG_ZERO,
+                          a_bits, TARGET_PAGE_BITS - 1);
 
     /* Compare masked address with the TLB entry.  */
     ldst->label_ptr[0] = s->code_ptr;
-- 
2.34.1


