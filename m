Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7D6EE86F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:44:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOXw-0002jr-O4; Tue, 25 Apr 2023 15:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXu-0002hR-3y
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:50 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOXs-0007Gy-Fj
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:49 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4efefbd2c5eso3441964e87.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451707; x=1685043707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=SikyR0KOVeHlbDjVhuVnKq+I3SYoofkrVkB/MxdgBixPU7skE4xZwI9AEVv+ml84Dj
 zmPahdno9MaepyydfnKZDCMlhn5sYK9ALE6c/B4szH0biVWZFDd4+TFTZV5qJDtZId3j
 3x5V5UhGcgpgstmRF2LRPAN+XzD6cjqXGKeUE5ZaLENnA+pa1g6oziJhBC0tnMGl9+MC
 F3N9T4hGq8apENCbb0w1S5YdeH3JzSUNPlHiqZlE6nv2ngSp84t8yOPdX26szWXy9mKZ
 UdACiem0u/nDJPwC2tNb5dW3mIwav14mWyf4iSpNaSRcXko8+Q9aXnRbXjeG7oJfKpPV
 cFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451707; x=1685043707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V5RMJ17ugwtLDyPRP13L9tNn+ld/75MDb1q/pfzv0DU=;
 b=g9w5zSs+e7DW51t0wkliiDb8VgiG7gs2GNQNTlSJxVU0pQ4L+AYAP6sIrlBihlxJfI
 hrLPQBYu5I82A7mWWKNMkR03vorFzEGj9WZyb3pmfISSHIT14TuBXOqgmN2fIuFZ86Gm
 u7khf/GN/1yceBXt6piRafDRvZT92f5cjXtPyd0jB5MaiGgBDC/VvErOSGxan51uyiJO
 s2crgn9uHprtDEO2TtGnOoRlWK6mmhLQz6QRVtG8LIf1v/MwQtYOUDZRU2TJYqS5lpy9
 22XCEubA0NKjDznlGaIVRQ3NvBbVGwu5KxHHGw6A89FL/lnZwVz/biNP+E7W8eR0OCRE
 pRiw==
X-Gm-Message-State: AC+VfDxCLULueTXsCgyi20l7n7rdr72V50/k9BHuaYwfenPbfGzkFHNE
 Vydqts9Ufp+dkvRY1m9lRcT0mDDnza9+KFo3gqXSAQ==
X-Google-Smtp-Source: ACHHUZ65WuZT/iXELzqPut4C6BmWOtwrsE9ExEmJ4155GlcCu4t1kFc7LC2K1Ozodidi1OVE+hdinQ==
X-Received: by 2002:ac2:4181:0:b0:4f0:441:71a4 with SMTP id
 z1-20020ac24181000000b004f0044171a4mr2767lfh.35.1682451707772; 
 Tue, 25 Apr 2023 12:41:47 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:41:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 50/57] tcg/s390x: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:39 +0100
Message-Id: <20230425193146.2106111-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 22f0206b5a..ddd9860a6a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1572,6 +1572,8 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     int disp;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1733,8 +1735,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1764,7 +1770,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    a_off = (a_bits >= s_bits ? 0 : s_mask - a_mask);
+    a_off = (a_mask >= s_mask ? 0 : s_mask - a_mask);
     tlb_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
     if (a_off == 0) {
         tgen_andi_risbg(s, TCG_REG_R0, addr_reg, tlb_mask);
@@ -1806,7 +1812,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->addrlo_reg = addr_reg;
 
         /* We are expecting a_bits to max out at 7, much lower than TMLL. */
-        tcg_debug_assert(a_bits < 16);
+        tcg_debug_assert(a_mask <= 0xffff);
         tcg_out_insn(s, RI, TMLL, addr_reg, a_mask);
 
         tcg_out16(s, RI_BRC | (7 << 4)); /* CC in {1,2,3} */
-- 
2.34.1


