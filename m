Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862F5104D5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:04:10 +0200 (CEST)
Received: from localhost ([::1]:55466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njObg-0003ei-U7
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035f-7w
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5n-0003tI-Vq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso3005221pjj.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K818fpSFBQPvs73U35nRltr2XwiPqKbJCOKKmgfZ5DY=;
 b=zeVBaYdkqmSHyTZWafckHgewzYs4dW1cO5DUluw40Zsfzlv9UXeAJqbMgu/yA6jVhl
 QCY7TFi5lqL/akSgXQA+DiDxqbbzeWvjd0iyYznFVMm6GDX1JboJpyTV0v4fZ1O/tAm5
 1vKZ911B1Zohfgh8psjBNYAFn973P76U0jwYecXAUIH6MsRoBGWAkAOs4yU1ZirzDsTT
 S0CnTgGCwjobpwVZ/d0HbMmAoLZemTAh5RTkTX27ySkSUOJjzhK1HoE1Gte16eDseWNN
 c3cHIkzoB8AfXji/lQTahJeEzStLO0WTrFiZn/+xORy4EvZxFvp9JGdWvUujYHOzz0bM
 FevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K818fpSFBQPvs73U35nRltr2XwiPqKbJCOKKmgfZ5DY=;
 b=QGAUpXfat4h+tFCjQla1MhuuO1V6Xp2gBhUcM+BOmH6Qs9EBhtBU/f239WW8UvfLri
 DGrDTFs4O3xfWNat7DaBA1ZqcHvD0sjrclrdmF/RUMReOXFhE5FyHSqyk9N2+Qf/GM6L
 orXD0zwXI0uBeXdL5pHJXaijzwOLcfLdBCgMEV5PTATtcvXOOFT7gGT8T5s1KgU/A31G
 AdKFiX89SgPF6CLFzPSjrAKgD/D0UeRPwAFjo9EkrVFe7oosrtOYqOVTPg73aoLtpakj
 izTu8Z6AQQ2mH+uLovcqVvTq/DCa0dYL8Q8nh/BrRGo/qmOtW09YU1hEuZpPNOuI/GeV
 JmqQ==
X-Gm-Message-State: AOAM532mx0vL8epux5F+t+jFgX5BY21euZ73KPYmccYcjQNIMAa+aLFs
 Ri5tZDPOAmxcQGBTciF0/6o43A19ZVbDlA==
X-Google-Smtp-Source: ABdhPJyPqFrbz3tIJ/s3/wt8lN/Xdf/lmEJAMqOIE2GtXcYLjQMUPH8IixlWDA/+/k1PW08y4aEEzw==
X-Received: by 2002:a17:902:bf04:b0:149:c5a5:5323 with SMTP id
 bi4-20020a170902bf0400b00149c5a55323mr24490763plb.97.1650990670038; 
 Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/47] target/arm: Use tcg_constant for gen_srs
Date: Tue, 26 Apr 2022 09:30:23 -0700
Message-Id: <20220426163043.100432-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e4f3db26f6..8476f259fc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5137,12 +5137,10 @@ static void gen_srs(DisasContext *s,
     }
 
     addr = tcg_temp_new_i32();
-    tmp = tcg_const_i32(mode);
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    gen_helper_get_r13_banked(addr, cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_get_r13_banked(addr, cpu_env, tcg_constant_i32(mode));
     switch (amode) {
     case 0: /* DA */
         offset = -4;
@@ -5185,9 +5183,7 @@ static void gen_srs(DisasContext *s,
             abort();
         }
         tcg_gen_addi_i32(addr, addr, offset);
-        tmp = tcg_const_i32(mode);
-        gen_helper_set_r13_banked(cpu_env, tmp, addr);
-        tcg_temp_free_i32(tmp);
+        gen_helper_set_r13_banked(cpu_env, tcg_constant_i32(mode), addr);
     }
     tcg_temp_free_i32(addr);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
-- 
2.34.1


