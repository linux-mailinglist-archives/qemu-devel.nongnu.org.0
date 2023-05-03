Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189576F5190
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:31:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rE-0004PW-SP; Wed, 03 May 2023 03:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qA-00024D-I5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q8-0001ey-Bo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11746855e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098631; x=1685690631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l6Yx62NXOphoTBTFn8jCo5HjGuRMg7Gzi022kcOoqxM=;
 b=QN+mvxmsW4TWb187IpxpAhDgR1Q2Ftnwbu/5leR3liEv1Qedo+41tXg/VN6lWfZmSy
 kbe77d0gjMoHZOsnhyzsQUZcdnZYvguEV+CcR/eHRjT6wm1HpHDoD36vq/7qAWoe+RDX
 yrG1y+k3+abJrmXePu5JR+o6NN/9wmFbKnkN85oD2sNH3vYAFGvfiIXrckb8fVIlKkhT
 geNJXx6XeEc3d5Avz2fwbqyK3WoKQ48QDbmVcL4NB2oyji15fmQ6w3YN+mrUivC8PKVF
 2Jdm37xfVu2GTxKVIokzXM/Zm5/CEHNxUUQv/tP39tiDBcS16CIqdpjFSdq1ZVR25EBu
 Flgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098631; x=1685690631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l6Yx62NXOphoTBTFn8jCo5HjGuRMg7Gzi022kcOoqxM=;
 b=BfzChMGhAFOBN7gzdvj/HWLfcLKUMzdwv6qKl5U2i86UCHcCatPWbejMSUaPqplZce
 e8+w/0SZaoeRjUonX/X0urm1DeImB3Zon10QaCZg6aRsVhoCLthKCxLqjHqM9roDtzc/
 CLwwpLFXxygf4HbczmdsCX2RdF7H2KSlGPRxwE4Wg+XCIn4k5QSacoBnlQP9K+tLJgYh
 Qb6NBZX1svWDBbRQQTvCJxLCytXFEnHesi6Mj9m++HLaB04j3xVwMKa1Y6V5Ebx5kT+b
 RWr/2n4v3+OqV6C+46h/Gq9ycxRaQnuaZ543VHCqkBTzLaDFkv/J24S39fX/mvQC7yuS
 z0UA==
X-Gm-Message-State: AC+VfDzgk2QILvu8rme4A3177kHE+Ji5DV1xeIgp8aj/5qiyv6a5OEcq
 5g10zgHNWhnimo0bmaNcWcU02ougUvBk+JWDgbqmxQ==
X-Google-Smtp-Source: ACHHUZ766HYRvy8M0mep0mrK99fzMrEVPnztwWEfXpwdE9wr2iE0OtpCTHSqP7sEMzGLC5aV1PQx8A==
X-Received: by 2002:adf:fa06:0:b0:2f6:661:c03c with SMTP id
 m6-20020adffa06000000b002f60661c03cmr682333wrr.28.1683098631516; 
 Wed, 03 May 2023 00:23:51 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 23/84] tcg/loongarch64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:30 +0100
Message-Id: <20230503072331.1747057-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
 tcg/loongarch64/tcg-target.c.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index ea5f2a8f00..2e2428bc30 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -845,6 +845,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addr_reg, MemOpIdx oi,
                                            bool is_ld)
 {
+    TCGType addr_type = s->addr_type;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
     MemOp a_bits, atom_u;
@@ -876,7 +877,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
 
     /* Load the tlb comparator and the addend.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+    tcg_out_ld(s, addr_type, TCG_REG_TMP0, TCG_REG_TMP2,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
                      : offsetof(CPUTLBEntry, addr_write));
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
@@ -890,9 +891,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     if (a_bits < s_bits) {
         unsigned a_mask = (1u << a_bits) - 1;
         unsigned s_mask = (1u << s_bits) - 1;
-        tcg_out_addi(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg, s_mask - a_mask);
+        tcg_out_addi(s, addr_type, TCG_REG_TMP1, addr_reg, s_mask - a_mask);
     } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_TMP1, addr_reg);
+        tcg_out_mov(s, addr_type, TCG_REG_TMP1, addr_reg);
     }
     tcg_out_opc_bstrins_d(s, TCG_REG_TMP1, TCG_REG_ZERO,
                           a_bits, TARGET_PAGE_BITS - 1);
@@ -925,7 +926,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     h->index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
 #endif
 
-    if (TARGET_LONG_BITS == 32) {
+    if (addr_type == TCG_TYPE_I32) {
         h->base = TCG_REG_TMP0;
         tcg_out_ext32u(s, h->base, addr_reg);
     } else {
-- 
2.34.1


