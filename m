Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51AD3C17D2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:11:12 +0200 (CEST)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XYN-0000nb-Tb
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5H-0001qY-KR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:07 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5D-0008Db-1X
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:07 -0400
Received: by mail-pl1-x636.google.com with SMTP id x16so2419658plg.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGijMJQVEM12PQG7khoLYEEx6Kld5VypBBc7yQ7jwvM=;
 b=zpG+YmfWzszMP9OByCdDeB2WdSQdLuh9f+6ljZ3+DdzpWtnjMbOgQiTZCnkajblU/y
 xV/8QxHGCpj89Lx3gLoClB6FDawSejhI7VI3Sjn6LVtQ0mINWmuV38moG/tj7+jwE61u
 zOPIrG5/3Y+fDKEDIxSn/G3Bzrv7/uiFgH67f8K3NP/zJahgvwi+9ssrZSOYby5u4Yrw
 MIzD+FpMFK69CuoX/f58fvc/2ACiecqb5MZ3ruuQlmDmfBexH727ABXBfr6HBU413uS5
 82pZn+VR3meRVfobufxzsI6VLSpY+BQnHb68UXAUUD6aBkYhEFFhomINTdv23Szy4GGB
 eSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGijMJQVEM12PQG7khoLYEEx6Kld5VypBBc7yQ7jwvM=;
 b=YAn/fnnTSwG0iwhM0XRxduaHJt5MG4Y4DVSOHC/s7MfLV87Sku4fz7eWYx1awyFx6R
 dtL+XbrBSIICZd76PyAgmLRptkUWb5DSlP/GuRYgBFgD7cNXGUpuUrCaaNgJuTfZiXi2
 dsiGl6GyAJ9GCnyJtVHDJOgp3AzaNc1Dyorsf+jZWTED7VgcHBi2XnAW7b6JF84yg+Y4
 MvLA4Z37ktVO3LkBQzv3hnY5ox326U0a9xA+B1arK1th3HinrYHyAhfgIK5TOb1zHsPs
 /7h/9qMPOuRF9jjOg7pGRBb0vPavJKQOxia4OVFcuqBEz+FGHTHrD9GT72HDC+Ua4rrl
 xvaw==
X-Gm-Message-State: AOAM532Xax2bTe7zeKxartD1hBVcmYXhfGgAI1CQVol7u5DREtxdqOCL
 OAMHtkXibd9utoGMJbEYJHxjHfxuPYVccg==
X-Google-Smtp-Source: ABdhPJwdqNYCjh1CoTPfPwO4ppqzBRyE0UMHW90L0g4qEG9NkZe1AuAtveTSWKsLgHRReS3RDF7cjA==
X-Received: by 2002:a17:90b:3584:: with SMTP id
 mm4mr3497983pjb.22.1625762461719; 
 Thu, 08 Jul 2021 09:41:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/28] target/ppc: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:41 -0700
Message-Id: <20210708164050.711967-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81ea..0fb09f2301 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4302,15 +4302,7 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    if (unlikely(ctx->singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (ctx->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return translator_use_goto_tb(&ctx->base, dest);
 }
 
 static void gen_lookup_and_goto_ptr(DisasContext *ctx)
-- 
2.25.1


