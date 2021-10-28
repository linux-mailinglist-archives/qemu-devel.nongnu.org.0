Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076AA43D9C4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 05:18:20 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvvn-0007br-3X
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 23:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPj-0001Zx-Qu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:12 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvPe-0006Da-9M
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:45:10 -0400
Received: by mail-pf1-x42e.google.com with SMTP id b1so1056562pfm.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94vBg5DwrKjzYyc2SPZ2xHl0Qntly4eUJLdtjM2QYhE=;
 b=ATuWS3DGawUUtmsQetDTyR8Yfw3ScuEY9K3FeXWKm4pXDcQtgZKe/52h6HKsjOyTkU
 HMJAKW83W+oKG3aQVgjpMh3HG5FOUJ0FLdZ62mcLAy/b+WSAtszXP8/TpfctEGtAUJYP
 8nSWQ0N4C21VUfeuYRt8dGH82jF6IVrjb7b83EqT/Mo7vuUs9zq/LvbPDCWXf4rrxq3D
 kKAFhzNg8neV7Rgb9+4xPIA5jBjvRrpdtFKgBtNPFXV8eFUI73Jy+3eUu2paX7EfzC9l
 nCBkkp4Qg09LUQS4XqkIkz0S/B8R1wWXq8PX4HIa49dT7TdcDrB7j5xa1chYBP22LIt4
 mexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94vBg5DwrKjzYyc2SPZ2xHl0Qntly4eUJLdtjM2QYhE=;
 b=Ucf18btM05E0Jh91LwvLONrk4LT5Q0VWnuR5dsgPxI6I/1//HG6/+l+B6JASt/E73Z
 ortoll73NqJAHSw4jI/8ECJXMAdXqMUr6e7fuRI+xUDuN/gRjUFiW9Rv7/XOiSyvFK+G
 RIxiBWXYCcDsuTBBeoN5e50Z8NH2gE3s31oTqNVbvJXdwZwgyKifNx+Qvxf7GKohzy0m
 FMFRQ+ORhCdR13s2+0jNFcH4ClhRYD51IvRDPjpqI3gnCAiy5vNfTGixPc9mb38jlOUh
 i5cCYT61SiflrSGezid//npQODajV7R++Br8QmfWLVeB/qSoRLLWeVDCDGrem1FFx8jg
 OEAA==
X-Gm-Message-State: AOAM530Ioldk4QrDwkkDUfEfVUHhAhWK2EOs74jJgUwAKiEt0U1mnd8C
 H9Sf5oB4Cf9fStDNZa3OriTNTedwBxfrSA==
X-Google-Smtp-Source: ABdhPJwlOpSSvPS0VhFoU/fMm6RIoeEfXTSvpi+XYqlWppHeU33sbMu/gRVt5IODndj8jw2SneKqUg==
X-Received: by 2002:a05:6a00:1309:b0:44d:4d1e:c930 with SMTP id
 j9-20020a056a00130900b0044d4d1ec930mr1471858pfu.65.1635389105078; 
 Wed, 27 Oct 2021 19:45:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z8sm995907pgc.53.2021.10.27.19.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:45:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/56] tcg/optimize: Use fold_xi_to_x for mul
Date: Wed, 27 Oct 2021 19:41:24 -0700
Message-Id: <20211028024131.1492790-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the identity function for low-part multiply.

Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 6d795954f2..907049fb06 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1461,7 +1461,8 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
 static bool fold_mul(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
-        fold_xi_to_i(ctx, op, 0)) {
+        fold_xi_to_i(ctx, op, 0) ||
+        fold_xi_to_x(ctx, op, 1)) {
         return true;
     }
     return false;
-- 
2.25.1


