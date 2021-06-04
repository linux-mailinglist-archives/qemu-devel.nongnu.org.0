Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A339BFC9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:38:53 +0200 (CEST)
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEia-000586-IP
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf8-00078x-J0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:20 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf1-0000w8-5t
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:18 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so6373742pjq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ngf2a8fv1Pxh8onF7826WEkLyZRw0BsqH4cjJDshQJU=;
 b=BahkTYL1TmTbSJ1Hw+9ZHrpEuEz+dk/FBSy7UFPf4Ju0MmqMtyl3f8PCODsMH0FQSl
 KGazJk5CnEsFvgZ8zOK+7RVrOxdL0ZAlb7WcLVwA3BnHfoMR/LOgfFWvOQ3NfHgMvl5U
 RW+iy81HSL2M2XOGaVL0vN2onu0eezid9AKNt7K3fNIJfjJ6+Tj+jYwMv8IPrD8ieXP0
 RVctKCSZNOBkII4qRH04c1885cMdpRbR52UN2cCA+sgKQtFLZZe5xyF3nVthyxxqdhRh
 Wwsm+52rJss8J/9ASxumb/VY8k73gnAZh0revyqwcsXS16JFWEIbQJgcV1Z4RsxSD8W3
 EUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ngf2a8fv1Pxh8onF7826WEkLyZRw0BsqH4cjJDshQJU=;
 b=sqQaK0ikuEaHGTsPOikfeBhsU+RzD+rjAs74G2LR90Uefbt8dIFouSbvqX/VH5J63B
 j2z5OY6LRrGgC7qO88uD/iK/XW7ga6hD7i5lxkC2atcUkD30XvR4DW7tXLasBzmoQOhO
 WawThb1U9cZy2mtWWszasDfB8gmjn+TJxCFpN1KT21MZ/kEm+rZ2zbu7DAMcHSGHh7Bc
 DZE7hXF1SLs5nnJnQvv36PEYM84whEDYGSr3yI/0A2JNZUy8gF+02VDKuCdEtzeqhIZe
 +yB2Ar502um7CBd6JwNA89+80O0ABnle4J3K0G/6jpEUIAp+sUzieizFizhOaCZcFnrq
 bvBQ==
X-Gm-Message-State: AOAM532ZsY5vrfUZobUDds44yUEm4VDqRc3ZWw0doZYUxI00LGJbBezI
 hw4zew6EPBfjB1Oyd0ZsU8vhM7jOZ3yL1w==
X-Google-Smtp-Source: ABdhPJzlaMgE7+UYRETb9xRBxXsb2qeETAfddjF8x8R5k7OTi1oxPD7GRyjA3CflvxZzewg+5+rLTw==
X-Received: by 2002:a17:90a:bd05:: with SMTP id
 y5mr18753053pjr.213.1622831708298; 
 Fri, 04 Jun 2021 11:35:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m2sm2620578pgu.85.2021.06.04.11.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:35:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Remove fprintf from disas_simd_mod_imm
Date: Fri,  4 Jun 2021 11:35:05 -0700
Message-Id: <20210604183506.916654-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604183506.916654-1-richard.henderson@linaro.org>
References: <20210604183506.916654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default of this switch is truly unreachable.
The switch selector is 3 bits, and all 8 cases are present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2477b55c53..9bb15ca618 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8291,7 +8291,6 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         }
         break;
     default:
-        fprintf(stderr, "%s: cmode_3_1: %x\n", __func__, cmode_3_1);
         g_assert_not_reached();
     }
 
-- 
2.25.1


