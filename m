Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0F3AF932
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:20:39 +0200 (CEST)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTDa-0003Bl-7s
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBv-0000To-3h
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:55 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBt-0005sP-1p
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:54 -0400
Received: by mail-pg1-x52c.google.com with SMTP id y14so3972154pgs.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHsyqcYhDcvH4VyWNUvcKr7ulIJabCuia+q5kv3FL14=;
 b=ESLGfeBc9qteQD54IAeGwWLLlWvZw1WQQDkymFDVwBsu4ORoQ4hZERoyAoX/mN0eCD
 0zfax6mpGXwh/iXH7i0LYWVl5vfn1WDNiPy4KLOdE7Zs7Bx5L+SNCGpy0A4FaucXgrNp
 GiLHm/LgrrpBKNHQEQwgPo64kb1ciAAf+B0Bo8DN3dOp5UH4RR4tDUahcQu5WZaAJBZs
 8osU0QQDSQOPSteqfxZqeuvfk8hVtZn9xx6GZlKjJflEou/suRDtUanOzdiTCFpKaQoE
 i8n+H+2z3EPsRcTNzf3N2Ky333ATCGKz6fMNUkqbCXhwD4TS+p+LKg3SwwsCuFmvwAw0
 R44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHsyqcYhDcvH4VyWNUvcKr7ulIJabCuia+q5kv3FL14=;
 b=bXcgPUPDW9ZwJ0uSiNhhp4fWdoJyWEovD/o5G+fTeBBD5tqWBsQqDOeRhDEY5/6mFu
 7wFH55pPV6LyoADEMqeNTyTnFfkSozBQGJWDfDpKfxAIXX6GJ5xDdFSOlOkz+yfcSR18
 Y89DjEuRu60hH4zMnlHF7sawbt3rpX1Y2y8OSW8A0jYsgvTK22wscauBZHlilLzXD0ZQ
 ctQrGi586gpQsVm/FOKyRndroxG7vyv9Jh9UFkHsD5pQS/11Hm/VoWRHm907AUugDgez
 fVkF2Pk9+B31VyUxO5Ig6OHYasLvfznNatBuV54QlJFnWqTJb0sMoSKtjXkkSCB28CLc
 uCsA==
X-Gm-Message-State: AOAM530ds48yhBKkgd9S3Bo9KMImiBcTWx56lWrFoHWL1yglDgpAixkf
 KyAxl2PailFDE8WXm++B63oWN5KQIbPQHQ==
X-Google-Smtp-Source: ABdhPJzzUwrnrJBHY3ClRsfWd+6kfwik8gd8RZrFnYkAV4IT3Dj7Jo23+G9MnMg7POpFG6F973SEdA==
X-Received: by 2002:a63:2208:: with SMTP id i8mr824350pgi.71.1624317531842;
 Mon, 21 Jun 2021 16:18:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/29] tcg/i386: Support bswap flags
Date: Mon, 21 Jun 2021 16:18:22 -0700
Message-Id: <20210621231849.1871164-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Retain the current rorw bswap16 expansion for the zero-in/zero-out case.
Otherwise, perform a wider bswap plus a right-shift or extend.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 34113388ef..98d924b91a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2421,10 +2421,28 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     OP_32_64(bswap16):
-        tcg_out_rolw_8(s, a0);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            if (rexw) {
+                tcg_out_bswap64(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR + rexw, a0, 48);
+            } else {
+                tcg_out_bswap32(s, a0);
+                tcg_out_shifti(s, SHIFT_SAR, a0, 16);
+            }
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_bswap32(s, a0);
+            tcg_out_shifti(s, SHIFT_SHR, a0, 16);
+        } else {
+            tcg_out_rolw_8(s, a0);
+        }
         break;
     OP_32_64(bswap32):
         tcg_out_bswap32(s, a0);
+        if (rexw && (a2 & TCG_BSWAP_OS)) {
+            tcg_out_ext32s(s, a0, a0);
+        }
         break;
 
     OP_32_64(neg):
-- 
2.25.1


