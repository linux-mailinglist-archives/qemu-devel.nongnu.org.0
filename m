Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F336F8B3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:54:32 +0200 (CEST)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQn1-0005UX-Ff
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUC-0007mU-8d
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU8-0001Lh-Da
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:03 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso137988wmc.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ryF9vI2/O0RAnXW5HYdjAy7sWkmeRezyz+rPnbZz7Qg=;
 b=NwzDxJGIVVLmWV+v3/dKFfFfbOF6HcYjmIf1bTuHZL/za/ff+qpj36FK7R09QvLJy6
 DaQvtwxwWxKdVcdT+5JHL8nJND7EPtRw48a8G85hgo3BytXULDeweC2yWH5Xfj9l7Czd
 pOypd6P0EuVrfb9hm34qeUkMKCMHfEUssi548+fCu0qkUuTRp2GvCudk1bpHmyzpqbd9
 GNgF1V7n9U8pyX34vLA+Y1bBLr9SMmLOgE64t7NthGfBCt+RKpADDvRKgv+DjWRl7Fiv
 r56iSylXGWKNBHbEDC1Bae9OaV4XO5Scdi1WYCoNMjQeuLkCRze/5PR+3FNmbEnElG2N
 Ugig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryF9vI2/O0RAnXW5HYdjAy7sWkmeRezyz+rPnbZz7Qg=;
 b=sZZ2EVfdWQ3lPnoH3tvQsIaza/2Y9fqA/O4petqN9M1gVJUMTfhaq4rP8veqDuZRP2
 7aW8nC7wU9BSXSptoQCoCMZK0rDb3fz9izy59CscdZj5i2aAnCVQnX321zlVAFDPkTHx
 kwhGFUTEnI5LMd5jvN/2kFtkqkfbtpBSrQSoMZ6/a30zvokPW0yBod/jbFYWFwyKhwhV
 lHntV1mOmabN+cpbfnbDLRkAgQqhJNgZutAO2zgooxc5Idi2Y62O9wzEaHbVwNCt3Net
 9TzND6uH1KJM73wAsovlM/zsrtp3BHhXOWIipIEGrVyuZYduaxT2ACTXt0+JNXxa8goz
 Lncg==
X-Gm-Message-State: AOAM5310MK2/MY4MkdaSL5XStJ1LR2BMsydwrlGGxW+obdI1jPCb7PIr
 taGRJDL77X+nV1Bu1pRmuCD8R5i2bStdY7dS
X-Google-Smtp-Source: ABdhPJzjj8oJZax3o8wNgimmi3g8jFqOyfqxzU2wtFs6fyivykm5pacMW4m1Qhbd6UaJc0osjoylSQ==
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr16123751wmo.168.1619778898979; 
 Fri, 30 Apr 2021 03:34:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/43] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Fri, 30 Apr 2021 11:34:20 +0100
Message-Id: <20210430103437.4140-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4b0dba9e778..f5a214e35e5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6936,7 +6936,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7092,7 +7092,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
-- 
2.20.1


