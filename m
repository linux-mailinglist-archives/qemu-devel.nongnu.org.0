Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE16F4297
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:21:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3j-0000fk-Me; Tue, 02 May 2023 07:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3e-0000dW-LX
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3c-0003FZ-QE
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so21756245e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026428; x=1685618428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGVAM5f/fVkyzn3zO3fNGB1yt+oMwQWHTxZuqdKZ/tI=;
 b=MMvkvteQQtaDubChUo5EHNTqGPea+2/tARF/OyghVSyZcor4/jTVxpzAarvntgRO0C
 Cb80cAcRUrXer4fXRYOu3UIlA38MEQHa/KiscEP5Boy2O0lF37LOZZw41O565DdxRwhw
 tm29W0TC+WmUliLlcnXLgzfWMCFPkfC9CYDsJ6PtHwtV2c5NhoJ4ULqZUQzEe+Xzok5w
 VpiklY9tgNeGKlbVo8KjTcBO6ShCOR7+hNI4U9V/cP8+fussGJZLusI3EU5KlD6vWdaQ
 72FYYvwJspEiUTCLyuTjyvLgRtbmVNVtEsl23Tl3yiK1OMm6I5Kk3qbAZrMpAa4mvyLb
 ViMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026428; x=1685618428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGVAM5f/fVkyzn3zO3fNGB1yt+oMwQWHTxZuqdKZ/tI=;
 b=BLuQWl1LYsw+GHRHtpVetuWnfJz0uLJY9EEPeSCEJ/LPAbBKs1rL3yB4PYe+ifBOZt
 yGYY5XGsZkQP3RojF8TkqJ6lavPLZ1+sAzP6ehW2plTLA83pphRr9iWZ9TP56JoVwt9x
 Yn5luitmEeOYv15abeVq72f95BdHFuizeAid14RFVvI8buVKoJJCDXRhf9WDZ5Txqxgx
 ae69eAAsiEjvwUoGpN9QT/Tyw1bwiZAfZ8vdw3UNRx+gNSRW+vbtF3/xiIMF1Iky3a0L
 cB26FzzPlZetkWaihN6fJHfl1M8ItGx9JEk0sfxkVsTMdj+3+0pUqdAqANLiW6Vn0u0K
 OV6A==
X-Gm-Message-State: AC+VfDyaNH/S+4/YewY/tclmW2u3PbcYbz1Xz9jWz9Av3QKKpiRoRLjB
 Dp0TgZlBEqh9/YEmB7/t5qaO5C33t7qp0K5roaeHzw==
X-Google-Smtp-Source: ACHHUZ6/a57Uk6tNoLLl1C7nSGuCik5HcUEUGsjY5QsDz3A7CcLPgPXHfht+QlNS0Htq/k0ho5BPRw==
X-Received: by 2002:a7b:c5c6:0:b0:3f1:9acf:8682 with SMTP id
 n6-20020a7bc5c6000000b003f19acf8682mr11421281wmk.17.1683026428208; 
 Tue, 02 May 2023 04:20:28 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [PULL 06/12] tcg: Add tcg_gen_gvec_rotrs
Date: Tue,  2 May 2023 12:20:17 +0100
Message-Id: <20230502112023.776823-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

Add tcg expander and helper functions for rotate right
vector with scalar operand.

Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Message-Id: <20230428144757.57530-10-lawrence.hunter@codethink.co.uk>
[rth: Split out of larger patch; mask rotation count.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h |  2 ++
 tcg/tcg-op-gvec.c         | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 6d58683171..a8183bfeab 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -371,6 +371,8 @@ void tcg_gen_gvec_sars(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_rotls(unsigned vece, uint32_t dofs, uint32_t aofs,
                         TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
+void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz);
 
 /*
  * Perform vector shift by vector element, modulo the element size.
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 9c14908a46..f51bcaa87b 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -3353,6 +3353,17 @@ void tcg_gen_gvec_rotls(unsigned vece, uint32_t dofs, uint32_t aofs,
     do_gvec_shifts(vece, dofs, aofs, shift, oprsz, maxsz, &g);
 }
 
+void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                        TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
+{
+    TCGv_i32 tmp = tcg_temp_ebb_new_i32();
+
+    tcg_gen_neg_i32(tmp, shift);
+    tcg_gen_andi_i32(tmp, tmp, (8 << vece) - 1);
+    tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
+    tcg_temp_free_i32(tmp);
+}
+
 /*
  * Expand D = A << (B % element bits)
  *
-- 
2.34.1


