Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540696F5155
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:26:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pF-0007aM-HO; Wed, 03 May 2023 03:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oy-0006q3-R0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6or-0007IY-O7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso2601734f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098551; x=1685690551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tD1Kg9az3SEYAT8uhbHJ/nDc4/WVCLBzcTbsj3/miow=;
 b=DVgY34rgJxYaslc6UYS42svuYaj8iRe3MB58xQQvXLOMVMKs1nC+mUt51galv+/Xu2
 CO69d/jxYOO6YzqwKAituZuryDw1mMv7FnsvY1eKSKWLvwP2DgmnTZKIst6shwxTM/2g
 XxulYyBUNaU7s/zgsdB5vKCwzU1dlKTRHrjhcvYUiQznGAf+Kt8iW8ZAeoJkAt0K04zT
 0Ou+2kF6wbd4RM/Qh7rzQ9WcGKmzSokVfMJJYDS42xaLidBJ4jt0ou0kM2th8BkvJAys
 WBcOt8Bn0n273CgHPWt1ArzBk4iTXZ+xy0NiMY1I+TnljoRRmF+47WPX7ItCch2OlQ2m
 DLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098551; x=1685690551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tD1Kg9az3SEYAT8uhbHJ/nDc4/WVCLBzcTbsj3/miow=;
 b=YRkq26tYv+/SsiSSkKGKposyuQ4HQc4XM/CNyu57/E1xAIfPTtkaX56PzdXA9sOPHe
 +5ScXus6jC0h6iRzqCIhxBpOhgy0YhngHJCKymCWSMWUBud3fcHOtKIF5pyhCbm5+p+N
 Pof947D37Kbxd8U5rr5ceGE1ZlDkqM8Wy8tYIxMjGdPgyU1kD7pANWbRpOrrnWPll+vu
 tYcMqkjm5L5hlB095Dg+e4sKqcvNlnJeAtCuPrMhglA8Hd2nqJ9roQk1n5bUHLscYkGo
 1V8wjXTFBMwH2+GcY+p7vRffnBD1xX0zBiSbR4Jy4+B3csQ2CJRzbYYpAs7j3mirbmIY
 uNgg==
X-Gm-Message-State: AC+VfDxUUoigZnZdIg+W6FufYoNErZoOrzVoWKof84SsGlHM7HABem/R
 HzGQiAd3CcyTsq+PYHhxI5nrCFYBvj8Ci25g7EVY5g==
X-Google-Smtp-Source: ACHHUZ4MqIp9i/yu9BL7+5GqrxRjpB4NOEyEaZgtXYw0aZXBdKp7BzfJSiFyonul9+UQT5Yuxwugtg==
X-Received: by 2002:adf:f84b:0:b0:2ef:b7eb:8836 with SMTP id
 d11-20020adff84b000000b002efb7eb8836mr15469847wrq.4.1683098551146; 
 Wed, 03 May 2023 00:22:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 06/84] tcg: Widen tcg_gen_code pc_start argument to uint64_t
Date: Wed,  3 May 2023 08:20:57 +0100
Message-Id: <20230503072221.1746802-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7c6a613364..7d6df5eabe 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -852,7 +852,7 @@ void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start);
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start);
 
 void tb_target_set_jmp_target(const TranslationBlock *, int,
                               uintptr_t, uintptr_t);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 685e555754..b4e1e0e612 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5808,7 +5808,7 @@ int64_t tcg_cpu_exec_time(void)
 #endif
 
 
-int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
+int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
 {
 #ifdef CONFIG_PROFILER
     TCGProfile *prof = &s->prof;
-- 
2.34.1


