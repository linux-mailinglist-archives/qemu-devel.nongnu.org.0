Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C843E89C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 20:47:01 +0200 (CEST)
Received: from localhost ([::1]:59328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgAQV-0008Pf-88
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 14:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAOY-0007WN-DV
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:44:58 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAOJ-0002FX-Qz
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:44:58 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so5486356pjb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xUaMSkTBy7HnFxop844la5qi0uRA6k9UHy9ncF0Y1cs=;
 b=QRTzQxo9aLotFF7N1rVLasGGHoE+6aPXXHXpQe6XS8Gdijs4frgv7YYSs7M4FabwCb
 WAKF1++UjXDI/DwRf9Vg0lj51aPGYjnWHSHLUWX/buHT4olxIVW2K049AxxwAEJExXWz
 +Yxu/XEfkqjGo9hpEkUqlGwSAwG4/g18pCN2kmqZbOo8PcXIVW1GIGvYDALpgi8tFTBv
 +gIa5jXONtQ0I+WjhkJKgSRWpKROTqawG9+htwEmJmQVT/Ld89N/uRYQjiVe0kUTzoAT
 zKPaK9AHYrWxleqIdB3wV4GQ1d6v6foeW24yEEKsh8AV5XNlnF0oa+RVAZsAtvYllyF2
 gThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xUaMSkTBy7HnFxop844la5qi0uRA6k9UHy9ncF0Y1cs=;
 b=BsGjjhR8UHyewDAUlsFdVoYjRCpFNrqfyLG+0KjrlNIo4SGTidKaGRFrURZtb8UvMV
 tAhfq2LU4PY7em2f78tZpl/D8MYkxEYK4HWGpEI3fqV1N/M3DpgPReKjrFOIp7n9QZbJ
 qbfjW1UTAs9tE+E04g6BShWveoXoFkfeBXia59dH03RD8ZIRUeMoxLIJ2UFHGn5E5vuc
 A2dsVg+rNW32VPNXxIeQENPDas90VN8fwyewl/+LiAEjRBwfw+LunCWsMWMSJ2yj+Xu0
 cHdhj1j4bFIZVCNuvvaQ4FC5J2l2wCMW5Gej2yrq5sg8BQ+E5vYwpBN/cznD1LnEqKPx
 OacA==
X-Gm-Message-State: AOAM5325v/1a2dgs9NBBwSudOcV49B9rY3sJe5btGXV9RkKNK+fTCOta
 jMKESY4u2F7VaaLJJrERl+AOecsEJ/bvKg==
X-Google-Smtp-Source: ABdhPJzgZXdHrdYy0aBYaRfZtv7sOmxCM5aoQtMZbadwoFw1cIn/azrkokWIJemtNyU5dspWyLPe9Q==
X-Received: by 2002:a17:903:11c9:b0:13f:f28f:f77 with SMTP id
 q9-20020a17090311c900b0013ff28f0f77mr5451830plh.79.1635446682008; 
 Thu, 28 Oct 2021 11:44:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id mp16sm3800129pjb.1.2021.10.28.11.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 11:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Extend call args using the correct opcodes
Date: Thu, 28 Oct 2021 11:44:40 -0700
Message-Id: <20211028184440.1508585-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pretending that the source is i64 when it is in fact i32 is
incorrect; we have type-changing opcodes that must be used.
This bug trips up the subsequent change to the optimizer.

Fixes: 4f2331e5b67a
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This fixes a problem found in s390x host testing, and should
be considered patch 41.5/51 in

  [PATCH v4 00/51] tcg: optimize redundant sign extensions

just before 

  tcg/optimize: Stop forcing z_mask to "garbage" for 32-bit values


r~

---
 tcg/tcg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 024a22cf39..6332cdceca 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1508,11 +1508,11 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
         if (is_32bit) {
             TCGv_i64 temp = tcg_temp_new_i64();
-            TCGv_i64 orig = temp_tcgv_i64(args[i]);
+            TCGv_i32 orig = temp_tcgv_i32(args[i]);
             if (is_signed) {
-                tcg_gen_ext32s_i64(temp, orig);
+                tcg_gen_ext_i32_i64(temp, orig);
             } else {
-                tcg_gen_ext32u_i64(temp, orig);
+                tcg_gen_extu_i32_i64(temp, orig);
             }
             args[i] = tcgv_i64_temp(temp);
         }
-- 
2.25.1


