Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF8C3895DB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:54:36 +0200 (CEST)
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRL1-0002BN-Dp
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyh-00046J-C5
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:31 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyS-0005jN-2z
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:31 -0400
Received: by mail-oi1-x230.google.com with SMTP id v22so14011044oic.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ISIsOoWcwTH4BDSJWMIHj/fX6z00Tw3LJoEr5p/Nk/Y=;
 b=YL5SJtM5SLj3V/NXuE/wB9iAay/5y0Wx8R2hSbf46JnpUvv83/T3zf3ceBDSXGFWM2
 81RTtkw1aEEuSdtedqp0K4MbnUr5tyAnm6t6iGh7CFwYyfALWDEHgtybqEX9xlfSNXQh
 aWSzX1bUxlJI1V2/I8QV5VY7CUW9FRzvokKMk2Dwz5sx3O8Z3Qn7XqkeE83wQ4HkMh+Z
 AECkcWtQOPl8C8Jld/zPydQRFcJ7Z04Wy0ZwZNWN6XteanNy3MpTZRSAxSYYvlTjAyje
 TqB0gVPznzvykPyB2X/Q1J6T4Mvn2kaJ278d5o+C/HeKja1m6nEBy2iK22DWHrYuFYQ/
 NmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ISIsOoWcwTH4BDSJWMIHj/fX6z00Tw3LJoEr5p/Nk/Y=;
 b=C5k8gj2xStkufjH0da1QzScQnXwa8aTfONoBiGDpZdUtq4FZm1w0LCOD/O9fpSiusj
 oW6DvkocsmFPl5DvgE6i8BRHeOFQ2YgDrdKCrDKzG7gEFVG7Z0GbD3A8nnWkw+2OYMBs
 6lpMqxyP0kzG0SCK7u1vaPaUKBe6TM+ByW6s3rKXxA8nLHh1UZT6F7l7DNXfFZMSk4F1
 wKzir9vM/KlgHfS/Ml/+wnWUndStIvbyQuGLtzlS1xritrssi5LWOWwCan9QXVvw9Mdt
 zDmXylQfrwQOGsbeyJTedxBLavd7AeiTYx9WSsZO85alrP/dMTZqquP3FgEw+wmyrsbO
 QXiQ==
X-Gm-Message-State: AOAM531IsTVuLfENb9fB7c6y1iaAs1wGJYSSHLlHzGhI/KUydYsHkwke
 Dw7Ir0VgrAGTQbw/ci/Xr1NfmfMJlVCvi0nd
X-Google-Smtp-Source: ABdhPJxysgRsmnXaR3hMUHa4mmFvS+eqvZcfKXjMaZrttE3RvvxbRWel0TtzSCMBqCrQ3LQ3Cl6JOA==
X-Received: by 2002:aca:1b15:: with SMTP id b21mr489787oib.155.1621449073268; 
 Wed, 19 May 2021 11:31:13 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/50] target/i386: Reduce DisasContext.override to int8_t
Date: Wed, 19 May 2021 13:30:21 -0500
Message-Id: <20210519183050.875453-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The range of values is -1 (none) to 5 (R_GS).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-22-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ca7f0a8cf4..44a28858aa 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -77,7 +77,7 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     /* current insn context */
-    int override; /* -1 if no override */
+    int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
     int prefix;
     MemOp aflag;
     MemOp dflag;
-- 
2.25.1


