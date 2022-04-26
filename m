Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC85103C2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:42:28 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOGh-0007IC-9e
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0002wv-E2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5X-0003mV-T1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:58 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n8so30814383plh.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UpI9KtHjI2y+VxbrhOzZiAV+X/liueOjiOpxfheumgg=;
 b=rJH562I0NeWGBilQUAR3ime4sl1zlnB8QJIwH/aRq4HMQViONrsvmzcdAoB5P4ywGt
 h12H8MRq23lYONbFYjUTH3Qb/Ddst3LRixicno1ZMBU6Vg+YrDFkaHuSUcZaWo6kAUWX
 VRg0cJvHyu231rfRsqaUNK1Pgqa+ZIMM6uDSFZ/4YRDfmv1Nj9w5htUKKlIPZxA0BXcM
 0dzuRpUiokrlLNCGRlSEdfqYj3UGAzimNZ2Sro0xDvxVTcKusjhguXtJlDzBRiIANg5a
 QGp/wqt2qn/UCBlEqPrjjAB/1j2URruGzRHRDSt3poderiYBpY06AGP4XL5ERuJmrs0I
 m9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpI9KtHjI2y+VxbrhOzZiAV+X/liueOjiOpxfheumgg=;
 b=QsM7CXCSTN/I86XB/qNczGQnP3itCkBHEm+xWL//X2jG984uC5hr8Ur2BQ0DaERM8Z
 h6q+YaseemhuMVpFbp6AM8FfNVY1w5c7Pgn03on2qikXPrULrwOUws+rtRx0SYJEjGPj
 GhXsgYcUl/GRqg0TY7BXj4KczkkosmdO9DJB4O6XTrZEVGUfrKnmSUAo7E6OcKoUFmZc
 LuJCp1+KydxyM8b+gu7t8xvuJoW+WnRxrpL5TBgTJ4PUj4u822hpbwb4nuC20x8S9ICb
 T9eCzb4ZyPKMdAn3T8n37BKLlhP4vkSQcGft3yL2ax273qLd+/DoXB3/PgW6Yh6I23nN
 W3fQ==
X-Gm-Message-State: AOAM530oipn7dTCpNTnSh16EKKNnnPtP/emzWr4ohE893vj0gZOSLOns
 /RJ1yGNThaAkZ4QUrQLozYfP67qI5Or8kw==
X-Google-Smtp-Source: ABdhPJyN7ocmJefCvLAsUmCFp5bEnDahtryLisN15kxcefEFd7msiKh9SGUP0StT3xO17tOxOHGicA==
X-Received: by 2002:a17:903:22c6:b0:15d:45d8:8f8a with SMTP id
 y6-20020a17090322c600b0015d45d88f8amr1532634plg.31.1650990651888; 
 Tue, 26 Apr 2022 09:30:51 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/47] target/arm: Use tcg_constant in disas_exc
Date: Tue, 26 Apr 2022 09:30:03 -0700
Message-Id: <20220426163043.100432-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5d1bccaf46..68e3b5c1f8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2015,7 +2015,6 @@ static void disas_exc(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 21, 3);
     int op2_ll = extract32(insn, 0, 5);
     int imm16 = extract32(insn, 5, 16);
-    TCGv_i32 tmp;
 
     switch (opc) {
     case 0:
@@ -2050,9 +2049,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
                 break;
             }
             gen_a64_set_pc_im(s->pc_curr);
-            tmp = tcg_const_i32(syn_aa64_smc(imm16));
-            gen_helper_pre_smc(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
+            gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa64_smc(imm16)));
             gen_ss_advance(s);
             gen_exception_insn(s, s->base.pc_next, EXCP_SMC,
                                syn_aa64_smc(imm16), 3);
-- 
2.34.1


