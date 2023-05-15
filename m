Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A0703063
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:44:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZK3-0005W7-Bj; Mon, 15 May 2023 10:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJt-00050X-P4
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:01 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJl-0005zV-46
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:01 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so20442189b3a.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161412; x=1686753412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ls4ciHximYxj1CuBwfXZE8IEsihukuIHW0VGJUoZUDc=;
 b=s9b23tw5Hjb9D3k/SgxA9PWPSUn1Uq/Y+OPy5FITo4uY3j7eyLYna+N0GXKHXO5hsq
 SjuS9ASrqHbV/Da0a2GpmPQlmK8C7+UwkvMrU3OxhRlZUrMU6WBiFMrtKnWjodSUpx7Y
 ToKio7hJq3NWTD0tViL74D+evDEz3aAj1Z91xc7HVp2083RtcyXrg8MkGavOec1e/HMY
 XS2IarbNJCMUCaGJ4k32qnhVeT2OY7Lh1jCZDrwc06dC+ucaxoFa45bM339K+ouuAGWG
 eMh0IuaLOun+JPTZ3k8SIeX71rZ+a+g9wXZCaFoVYB6rGUVp4fWk/VaK4aiB4c6o438D
 sjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161412; x=1686753412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ls4ciHximYxj1CuBwfXZE8IEsihukuIHW0VGJUoZUDc=;
 b=b1LwHsgPJjYtnTPr+Yt+G4dFIwW4XMVcrwJPSLt8xUWeHKR6gUHipd3ML8XmUYU2O7
 kzANDVFi12/P+BymtjCO12A3EltHH/2yuWHHJ2OWIOMMtMoVTEEkZCdSNAY0Yr/onBnp
 MB+lCepsQeO4ptzY148VX09WS+DMy88gFpbb3OX7kFPpCt0MR/Uk4w6OEOefx5KDPNZv
 gvDRwPm5hdEzpmS9rMoztDkdjXmw/6Bo1qrxd10ygfgSQLsB6RIE4vWjG6zn+uxxASMB
 8uXHsVxj6YqPOitE3OwG5mWWYfv+H/0npOxEJtwE7YpAvdT/sTGJLzP4TT+sbFlHKe5k
 XF/g==
X-Gm-Message-State: AC+VfDzx4CZmiACxpQhPbRjRtdDx5+uvsVRsp41ryTU6UV7p7bScNv3O
 AvYzR47W1Dx3gmioEu3FriQbPOLTU2XyPTfWPQw=
X-Google-Smtp-Source: ACHHUZ7iR5YzjZs6D7OCZP2hp0xvzgZ+kSslWn6CfuwFtZMAe859CtClDqKhVb1IULXnIQ6WpuYp5Q==
X-Received: by 2002:a17:902:f54c:b0:1ac:3b69:bb9c with SMTP id
 h12-20020a170902f54c00b001ac3b69bb9cmr41573964plf.28.1684161411742; 
 Mon, 15 May 2023 07:36:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 43/54] tcg/loongarch64: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:02 -0700
Message-Id: <20230515143313.734053-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d26174dde5..07d35f92fa 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -826,6 +826,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -845,7 +846,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits;
+
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_bits = h->aa.align;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1


