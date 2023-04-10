Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7246DC899
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:35:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltXl-0000ar-Cy; Mon, 10 Apr 2023 11:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXi-0000Vb-Ne
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXh-0000nZ-1V
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:54 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso12916591pjc.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681140891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnXUaEENQ1jQIIP6iKAfC6khYvLIRe71lrXEP0Olkj4=;
 b=AyC1xutJVN2WpA3l2onnUy33e2QCFeI8zi7cr8YuRhlNn+XLPW55MXXKeg8h6JAljw
 d70+JEU/bDmY190ajZ3mZywW4yGjw37x12imDgTlrVcra3Nf81VsYVLm72dR5BxmGgnm
 GP0uoDVFIL5cB7MKOTZVWY8ZFOwwSWVkP0FNioRmgPhblFBb10xY5sS36M3iCJOEDaUz
 LGBY77WaxF4H+NqEbTnSzBjgx4yRWHde5Kp7h7N/8aNzNDV+b7V5tXy0lN0I7JRAC+EX
 M6zTTzTd4T25ZrrMsxa582vFy3IYdF2Nwb5Ylt/3NGb4TKVpeC4e7bIVGt99qSBtpyAJ
 B5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnXUaEENQ1jQIIP6iKAfC6khYvLIRe71lrXEP0Olkj4=;
 b=ZtZk5Yzcbwa/j3tTmu5FNAblplEwuVCcPWHQR4GigykMV3nh3YXHMGhobutthswbqJ
 qtlzQQLxN2xSwb+ns0nzR/FCSEAXRJq6Bp8GPJEb5zpS40Kzc1GGSToaQe9EZywubpPh
 I6ik+N4ZOINBF7HfydmKKZq3W1hHC1/6jIUh6VgGYLEUnUW0SE/B0zAmeyQvvaeONQnt
 FAsvBKRWf6kiG5TfV7Jd7k87f1Bs5/QptKkhEraQ3WR/hfTF0H6sZnNbElAgyv7vEvt+
 elr7ddWaOaQufFmnZFuoycc7Glqrsbkj/Og5Kw5duEr+UMuI2s8QT2NQCI/IXl4sE5Q3
 VEZQ==
X-Gm-Message-State: AAQBX9epWxOOZSXFLlRw/Qr2yoxLrKk8hZMjDVcTSxf6ibsOjWpwfrd7
 aq26lmnVkeZa2WaDRKox8muxwHPM5ifLMoVrTlU=
X-Google-Smtp-Source: AKy350YBI+U5SRewm+onur3jMIyy05jdGGaU9jnBvNfrtKPNL7tCbjDiXpzv+umvkC6s4FlJPPyv/A==
X-Received: by 2002:a17:903:244d:b0:1a1:aa68:7e61 with SMTP id
 l13-20020a170903244d00b001a1aa687e61mr15586536pls.33.1681140891508; 
 Mon, 10 Apr 2023 08:34:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:2e6b:e4d3:9526:71d6])
 by smtp.gmail.com with ESMTPSA id
 jj6-20020a170903048600b001a64e854553sm534402plb.159.2023.04.10.08.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 08:34:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 2/3] tcg/mips: Fix TCG_TARGET_CALL_RET_I128 for o32 abi
Date: Mon, 10 Apr 2023 08:34:47 -0700
Message-Id: <20230410153448.787498-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410153448.787498-1-richard.henderson@linaro.org>
References: <20230410153448.787498-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The return is by reference, not in 4 integer registers.

This error resulted in

  qemu-system-i386: tcg/mips/tcg-target.c.inc:140: \
    tcg_target_call_oarg_reg: Assertion `slot >= 0 && slot <= 1' failed.

Fixes: 5427a9a7604 ("tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 68b11e4d48..2431fc5353 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -84,13 +84,14 @@ typedef enum {
 #if _MIPS_SIM == _ABIO32
 # define TCG_TARGET_CALL_STACK_OFFSET 16
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_RET_I128     TCG_CALL_RET_BY_REF
 #else
 # define TCG_TARGET_CALL_STACK_OFFSET 0
 # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128     TCG_CALL_RET_NORMAL
 #endif
 #define TCG_TARGET_CALL_ARG_I32       TCG_CALL_ARG_NORMAL
 #define TCG_TARGET_CALL_ARG_I128      TCG_CALL_ARG_EVEN
-#define TCG_TARGET_CALL_RET_I128      TCG_CALL_RET_NORMAL
 
 /* MOVN/MOVZ instructions detection */
 #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
-- 
2.34.1


