Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC616EBE91
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:22:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWpT-0004Fq-Sn; Sun, 23 Apr 2023 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWpG-0004DC-Aj
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp8-0003Fq-1N
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2fa36231b1cso1949050f8f.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245200; x=1684837200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzmKpePtCVIxaEGtijl//AGdn8x8IEnPM9t3RxcYnKE=;
 b=EwZPICIqTbAzxRyqPJpbeAognFXInPBfIsKQIDlL4/5X3xfcxsPxDKOUJg7izmxbwf
 in30zf/nagfnig8fZ5WuC4pInKexbEh7/kGIcxrPFlcIQlY9Y3vMNuDHrPDxb9N9U073
 GuHDjNhmgDMgucu0oCnr1aOHf5+fYhDcYngbUKEd5PAjroPgMYTh0KkMvXu5rV27JqMC
 PYu3D77HTqrnv2O7/XBwSN2JU5Bxuhy8eiaWTg2FnJeCc7qzUy+sWn4JYNsSy7HxWvqs
 oCi4YzMY0pjkxJ8Z7FvK7Qsunoa9WYJPryjiDb/QkpUJV+F7GTjce92cDy/Q2GoN4snU
 juyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245200; x=1684837200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzmKpePtCVIxaEGtijl//AGdn8x8IEnPM9t3RxcYnKE=;
 b=W2XNAejuarYZoBeATgd0+2DZelT54tL+pW40ld3ugHp+1AW4cn8iFVuVpBokbN/I5h
 smOUP2qo3/GH8NOOVZ68IbH5Zd4mtUIPb2UQT6uA5Zy7GjI1CxWLs63vGdfYKrfNP0A9
 3EskXyKV5uqm8SRUQkDOIe0IFFK4q5oEkaBL5qJ0zlVGRGrnzCbmWu39MfS4kB/JZgoQ
 Cyov+n+BYG6J+sGCsa7nFzMjJ45DuXKNIxvCOL/e6FLEtuFX+BYuHPlsANsCFra4qzpX
 fHsxI087RpDcNxG4A9bq3lA2B5ujqX4R/g/5azVAj3fKbT7Owz7XWL+yhgOr3/YIFlDP
 xB5A==
X-Gm-Message-State: AAQBX9czmWhwVbLOgDglY+QXd7HT7wXrIoURiW4+PBt0cZe9nBl0voaJ
 GjVtkR9rC09BqI0dNsGPgg1ugB/bq6l5IMLHZoUhhg==
X-Google-Smtp-Source: AKy350YuEQ0CSIrUfVVSYcHLv1GvjK8huD5+FdDYdBsIHjO7FTKJ53Ap9fXQsnmc1AsTqcIJBUd7kg==
X-Received: by 2002:adf:e0cb:0:b0:2ee:c42e:a54e with SMTP id
 m11-20020adfe0cb000000b002eec42ea54emr7665545wri.50.1682245200345; 
 Sun, 23 Apr 2023 03:20:00 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:20:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 15/15] tcg/riscv: Conditionalize tcg_out_exts_i32_i64
Date: Sun, 23 Apr 2023 11:19:50 +0100
Message-Id: <20230423101950.817899-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
References: <20230423101950.817899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

Since TCG_TYPE_I32 values are kept sign-extended in registers, via "w"
instructions, we don't need to extend if the register matches.
This is already relied upon by comparisons.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 328cbc0ad6..266fe1433d 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -609,7 +609,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
-- 
2.34.1


