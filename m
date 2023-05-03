Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7426F51D9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:38:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qO-0002zw-5m; Wed, 03 May 2023 03:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qA-00024d-IJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q7-0001Wx-HA
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3063208beedso2483367f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098630; x=1685690630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QpkVDc0n2hV0IwtkfWmzIufy63Y5sWugy7edECMzL4=;
 b=AvVuynoTX3BBN8Na8zKNMoTccfRpq/aEbEmJu8XfAdEkqQIGkQxbR2nNwrS3/YlKAP
 xqVSQ6Ph+VRUUYVgeoWWn/nJoeUwJATDLjg4uW0sRB+1KNpdKg+kidBYA4/lfXL+2nfB
 VyMAmuQIy38a3TR5ITa397IQZ3BKSdwnTrgfgz5WtsFXar1pbR9/35rnJmB7Sw8BmyKl
 mL7ilQhyyL+5LsTUxmIYdj+uUWmzUSvLYkSt8s0M38u1mcoLw2h85CzqpQIVcdsB7H7y
 1a48uHl6DKFcrKYdnw4tT0g6WNRxTS85AxJhEwJMiAnJOgK8K2ccqmRAcdGJkCzsM9iL
 dyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098630; x=1685690630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QpkVDc0n2hV0IwtkfWmzIufy63Y5sWugy7edECMzL4=;
 b=QgE77V4LRwpyfUG7CTtZAta1ahypip9OgN70+o5EXs0AE8eO/UpXYwKLlIcL4o3F0L
 bZtFUEj0bOOtdyYKVn2063pRsrNU1YDns5J50l8UdcILUo4QtVgfj66xnZFSh/t9I4Lx
 +GUOcLJeXliBoYPIlEHvXdnxAA/IX+TW14+rUYj5eU+SyoxXfOjei9QIS+6KrqIrsMEM
 PClRQ2DYN8xXGS2PIqasmNFgKKowt0F0wC1FPR3flbJdYJRkY2d2fn3Zrdzu7nnRPrEH
 8lDMiV4fOJMTDoJrfnAj+3dPHiOzAphJG4oSdXxry4Kn61K7ODpyWNwk4DXqK9Me+Kfo
 JXZA==
X-Gm-Message-State: AC+VfDwKLT88pso/NNfqznkSxpWTK0Kv9+A//kiZCidkCLCzidwqkk2U
 KIyrgghqLlaadK1Tv2c7BcIeM1+MXSJbW/W3xQfFEA==
X-Google-Smtp-Source: ACHHUZ7EwlTt+ioBhVN4b/killPKJzai9fbF2xDl6TE8WKGYoFylWlHGVxzZv5OAsj/Xm5btCiT8AA==
X-Received: by 2002:a5d:668c:0:b0:306:2b0f:5d48 with SMTP id
 l12-20020a5d668c000000b003062b0f5d48mr7601619wru.26.1683098630682; 
 Wed, 03 May 2023 00:23:50 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 22/84] tcg/aarch64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:29 +0100
Message-Id: <20230503072331.1747057-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

All uses replaced with TCGContext.addr_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index fa1e5fb4ec..c68d863c50 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1662,7 +1662,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addr_reg, MemOpIdx oi,
                                            bool is_ld)
 {
-    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGType addr_type = s->addr_type;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
     MemOp atom_u, s_bits;
@@ -1707,7 +1707,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, 3502, ADD, 1, TCG_REG_X1, TCG_REG_X1, TCG_REG_X0);
 
     /* Load the tlb comparator into X0, and the fast path addend into X1.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_X0, TCG_REG_X1,
+    tcg_out_ld(s, addr_type, TCG_REG_X0, TCG_REG_X1,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
                      : offsetof(CPUTLBEntry, addr_write));
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_X1, TCG_REG_X1,
@@ -1721,18 +1721,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     if (a_mask >= s_mask) {
         x3 = addr_reg;
     } else {
-        tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
+        tcg_out_insn(s, 3401, ADDI, addr_type,
                      TCG_REG_X3, addr_reg, s_mask - a_mask);
         x3 = TCG_REG_X3;
     }
     compare_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
 
     /* Store the page mask part of the address into X3.  */
-    tcg_out_logicali(s, I3404_ANDI, TARGET_LONG_BITS == 64,
-                     TCG_REG_X3, x3, compare_mask);
+    tcg_out_logicali(s, I3404_ANDI, addr_type, TCG_REG_X3, x3, compare_mask);
 
     /* Perform the address comparison. */
-    tcg_out_cmp(s, TARGET_LONG_BITS == 64, TCG_REG_X0, TCG_REG_X3, 0);
+    tcg_out_cmp(s, addr_type, TCG_REG_X0, TCG_REG_X3, 0);
 
     /* If not equal, we jump to the slow path. */
     ldst->label_ptr[0] = s->code_ptr;
-- 
2.34.1


