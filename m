Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972755AE650
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:14:38 +0200 (CEST)
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWXN-00066Q-Li
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWo-0000Ha-53
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:58 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWm-0003cm-MD
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:57 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e13so14677300wrm.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nVh1xXH3Saj+Yr5nLG8CgQIGecm00fAvyeGV47OTtj0=;
 b=XApaAhxuqVjsnpCPMH+8emtRkj2tbJ0e0g6cYkA/g0gdVs8zgJwJ7NoUDMv+HAg32G
 Yap7geWSr4OEBPcdloIIcembAY8qRS3e4lyXnThzQF5iF54cjDjR6DwWaQ7vwW09F9jl
 qFbDQx1mDKa4wjzTVtyo0haRqMp9a3QJ0jBG+ZAQ2xfBKtmuaWomDylvftTtoBu4GiwQ
 GS8cWAIMyT4vFmaQInZW3v8WEQUDwFGvl0yywHTQo22nonIZgNQ6VLnCZupvV3mRr4F8
 2ULApcAiaqDw10g69U6L8RgSTE8jBtU+P1DfkfAtmvi0nKbAs83AkSpx9qd1PU9IfL+M
 WikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nVh1xXH3Saj+Yr5nLG8CgQIGecm00fAvyeGV47OTtj0=;
 b=VwSKFVEro2eAjrFCjA8HS8rG/vee2h+pz51drQCSeg3Zmdw2skkUhD0YQ4UDqeS132
 7t1W9qhAkKTJdEijoNHyMa7uDkVjXcFagn0j3rzyThE3/qU4e1TvxZGjkwAPYXZrQNBU
 +2uBY6JDx1bAbPMBZvasTAqpLW4NNDq15cFEPsaxKSX94JuKw3b6rkVjx00Vh6e7fee1
 BWMIDXnjdGC4JFbv1nU9INd9KZxwgJ0QZITAnwZmMKGeu5WHZGCgvl+N5Ibt+ekwVfS4
 t+ylcp6DCah/mZec1uKQO03gS4CG63YMS3XlhERHXU9jS8T6hC8cGQEigGX5yRuEdfbp
 NXsQ==
X-Gm-Message-State: ACgBeo1d2jazeQ2MXnSwBFtk1U4Typ6UUKzhnQbkuD46vl3miUWQuci2
 qs7UjRAq+iSKQn+k2draTEhxESbPC6Canh+f
X-Google-Smtp-Source: AA6agR5NenMiRI4QHECe28Qz3vZME0FNNwRskEMNQKLtEUEIAm7BLAVNWkMZSkVaYVay9y+KlhrBwg==
X-Received: by 2002:adf:db85:0:b0:225:2d24:9455 with SMTP id
 u5-20020adfdb85000000b002252d249455mr27850689wri.711.1662458995164; 
 Tue, 06 Sep 2022 03:09:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 22/23] target/i386: Create gen_eip_cur
Date: Tue,  6 Sep 2022 11:09:31 +0100
Message-Id: <20220906100932.343523-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 97a5f7e432..39bcb7263b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -516,6 +516,11 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
+static TCGv gen_eip_cur(DisasContext *s)
+{
+    return tcg_constant_tl(s->base.pc_next - s->cs_base);
+}
+
 static void gen_jmp_im(DisasContext *s, target_ulong pc)
 {
     gen_op_jmp_v(tcg_constant_tl(pc));
@@ -6574,7 +6579,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                offsetof(CPUX86State, segs[R_CS].selector));
                 tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
                                  offsetof(CPUX86State, fpcs));
-                tcg_gen_st_tl(tcg_constant_tl(s->base.pc_next - s->cs_base),
+                tcg_gen_st_tl(gen_eip_cur(s),
                               cpu_env, offsetof(CPUX86State, fpip));
             }
         }
-- 
2.34.1


