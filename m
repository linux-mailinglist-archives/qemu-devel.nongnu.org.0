Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4B5F1CE9
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:43:27 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oediA-00044U-A5
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCR-0003KV-OX
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCO-000407-Os
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: by mail-qt1-x82a.google.com with SMTP id a20so4214976qtw.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZxnPbtNf26HivnzWiG2JJJc437W9NJfgOtqCGgFuB5c=;
 b=OFOjqLFsdymGmNSmOHBSZpu0pCOSf9CpmZZbaP1Ed9TOHZP3P+/EI69LWHySwaWRn9
 6nG/KLE/2GCXtdcNJADfK0hsJ6unZu1d6GttRa/ekdOYSHSTYNpPhDV6pkb7Dq2UNtcD
 KHG7XjXuwLhb/sCvwDZnNa7s9C2Z7zCuj4IWJaYgMwu7fzBMcti9eR1mPpxgCzgWWIzJ
 ZTODg6lxbrhPVQRTmuZOMDVFMc/YrPlbBgZhAvBA3kNyMaqB1k5rwObcMXliP8H1grjO
 zLsY3UnGgC1nS7kdjymV3XC8tYaOtIjWRnOl8Q5hK0zfdEYIB2Dp+MGmvjHNtWnRDkek
 oaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZxnPbtNf26HivnzWiG2JJJc437W9NJfgOtqCGgFuB5c=;
 b=D7py0mxq35K+NY5xdBS4PKb+PIUZmFxTr3LmUusIz+KD+G9UGFGPP885CXKzdREt0Z
 ns8ZFwfj+8yQcd5m/ch1ourctRtLLiMSNI3RXsbIOIon5wzEItLYo4BGpE/R73LgGmy1
 Y/qjojJWG+RtxTmqwAqlnSebB8V+OjVQQPeHcpEzBYUodsWfWmQudhfcBOXi4RN7ml+o
 8WAWQeBFjBterNm8Qx8JAvIQS48GaYVrrERRcWMdBmKBDg9LxS04waqg0kvlsFor9+FS
 N8CyuKguFarWIS8UNpCu6J1Gy+81ibiYAeD3Df88xT9Igoz8R6VG1t36OLaMh1MxH6RL
 WKCA==
X-Gm-Message-State: ACrzQf1mpGu0GgBQ/Tecg6fuyXVVnQZtHiVQaf40TLETKFykfHMmco3H
 snpjxewgpnO6uQonpb5AsEuvn8LAbZQhjwkA
X-Google-Smtp-Source: AMsMyM5NqfSKSvirboJ4aSRjCsHAYoUvAqb8GXgsInMMzxnxipmHFc+JMVhL5NbQDTzMdrrmjvqcFw==
X-Received: by 2002:ac8:5f87:0:b0:35c:bf66:f52e with SMTP id
 j7-20020ac85f87000000b0035cbf66f52emr10563738qta.93.1664633434687; 
 Sat, 01 Oct 2022 07:10:34 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 23/26] target/i386: Create eip_cur_tl
Date: Sat,  1 Oct 2022 07:09:32 -0700
Message-Id: <20221001140935.465607-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2e7b94700b..5b0dab8633 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -562,6 +562,11 @@ static TCGv eip_next_tl(DisasContext *s)
     return tcg_constant_tl(s->pc - s->cs_base);
 }
 
+static TCGv eip_cur_tl(DisasContext *s)
+{
+    return tcg_constant_tl(s->base.pc_next - s->cs_base);
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -6617,7 +6622,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                offsetof(CPUX86State, segs[R_CS].selector));
                 tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
                                  offsetof(CPUX86State, fpcs));
-                tcg_gen_st_tl(tcg_constant_tl(s->base.pc_next - s->cs_base),
+                tcg_gen_st_tl(eip_cur_tl(s),
                               cpu_env, offsetof(CPUX86State, fpip));
             }
         }
-- 
2.34.1


