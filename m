Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00D6EC521
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqozq-0004Uc-TE; Mon, 24 Apr 2023 01:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxu-00063i-JO
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox6-0004SD-39
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:18 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so63435815e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=OAj6GX7mCKtoLQ7ZQ2n69KRgT1R41mubfR5kqKBABUgRb0dxXq1O5JhtuvvHx57jl1
 /cPuK6vu8xoWCSU73Z9YqkYXufaDnMRTjkEK52zbfe0uUmZueMLMWgL0yJf8zuhiR1Cv
 ojdNEQXGq1grXC7mQYPdCryrJzUGZFP6aG7O9R7PhYDCtfYPspGYbmnXgWzENnYaN8yg
 o/hAaTKa+jRu74ubghrNbxOo/s19PXul8F6zGftuW9wVgjcgEMfPWwCVVHoxYyWDJCH+
 DW4R0edTNzqH9ezfxGvVScSzdTTPmyQM7kA7AAQs6jQ6rVrNzx0prI0naX9RWLHXi9cZ
 ycMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314885; x=1684906885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=X2N1H9YgN9mgZ3cwsSzJll2LtELZYoBn0kv3+47iKWM5NK4FmT9LNDRMoguuhWZONy
 ZdstrBqUpMgB1+XO/s3qzBD18h3afFMfDFRJLDA9t8QfKD8ZHKngLD4LlDNa5sJUYUOX
 GLfgXvnDp1Q0sPWk4tyiRguEuQxDfkx7vnD/fXs6fhaPPbaW29dkScbnMyK6fjUsWjf3
 Wbz4rxFSLjPoqti5df+uKWQm8wpvdFytJaI41X2RyARWSOjuHIUd7iBmdcne+Ez+V0UG
 /4LN1/GEQW2drknYkIAFzHx3jBUK4bGlOq1kjYschU18Mpvd8PW8VLMn+/T0BlzGSMCV
 1SqA==
X-Gm-Message-State: AAQBX9fIMpl1sZbrABMAS35uB9mThlWX6Al4ciifzKM0aarCFuk9yu2t
 c7tuGoLe9RcL+2l07gIUexcozcSz37uwOd1SoM3MPg==
X-Google-Smtp-Source: AKy350YsGgoNJ+3HJHv9J2Vg7M7rn8Xxa0aBMvSgL2bFcCjXeasKFZ8KzTLi0c8pAXYXr4mk/TotWQ==
X-Received: by 2002:adf:f70b:0:b0:2f9:eeab:4eb0 with SMTP id
 r11-20020adff70b000000b002f9eeab4eb0mr7857678wrp.34.1682314884919; 
 Sun, 23 Apr 2023 22:41:24 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 32/57] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld
 data return
Date: Mon, 24 Apr 2023 06:40:40 +0100
Message-Id: <20230424054105.1579315-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4f477d539c..dbe4bf96b9 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1


