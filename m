Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF15104E4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:07:17 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOei-0002IU-4F
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5v-00036Q-Bl
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5s-0003uF-M3
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:19 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d15so30708384pll.10
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0rp6VL6sGBeO43lHZ3pVwoan89wcSSiGWaAXpPEhCP4=;
 b=oLpSw5Ie0WSnhvJ+WoiFheYwZj5N+sRohmSqMQOWGRsjJDvUMqJFdBXXn0pFduIPcb
 M2RL5exjy6PbYiKRjKjmYeJsLnnoKXspfiMId61ckh0botDw5MAtI6GDvEIlOrV3IHBO
 +0RDrUvJwZNye4nsvwpfABECuQHm9ZMJG2CH+gTW5NtdRF1RwPL6BYZvf4vItRbK9C8r
 e4+aQsTYhpV4E1t82sfYDDE3ARABRszb5VyML/QuXvaCsTwmZKj5vmIjG9T7aNaGNoMb
 XzAk3SAzq6ijEcFE7blFc0jlH0mbf/NnoRyb4osLunFs6okQ5dBDktqVyVTbjoYbRA3F
 5JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rp6VL6sGBeO43lHZ3pVwoan89wcSSiGWaAXpPEhCP4=;
 b=cxh+Gdz49RvQhQYnBI9bHZ2Aq4da0PcbafpgCVFiBraiW+MWnnjqtZU7qdgJ3V436s
 OeFYp4ysocO8PA5x+Ok6+ArWNW1XLUOiOdxentH5JHRunVfLqfj33RWuxBcFcinbD+Is
 LH825TeWNA4d9HpKYbMOV4XY3Nb2GZricXRyJw12PUq02nYc8d6H2io6HtdkZ7I3Eblk
 /xcLsogHWcGnXDRxr2HfLfyiV0jg/J1pw8cVJIQ6z1loN4fl2elJg13pbHKC7pWxxJTL
 dH/TG/ZQHGC48l1nXv8O/aUAeZ4ELYxR0quNzVo7r2a+oLk8hmYimvZVn4gD+IbvUCwr
 tVbg==
X-Gm-Message-State: AOAM530vNS2506DT4EBreXPx1FaU5iN1+fwWSa/9Nrr2rNWXkmOJOG00
 O5vh0uUqmdZgRQlarqCJUrhJRsfvR9wEfg==
X-Google-Smtp-Source: ABdhPJx71F3M2f0KzOSQtEpM6MFV0irWLRKtB9Fd/kWKrUvyxOZNOuRNl4EOza/OtKsob7OafupFnQ==
X-Received: by 2002:a17:90b:3b46:b0:1d9:b14c:cc6d with SMTP id
 ot6-20020a17090b3b4600b001d9b14ccc6dmr4232600pjb.135.1650990672606; 
 Tue, 26 Apr 2022 09:31:12 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/47] target/arm: Use tcg_constant for v7m MRS, MSR
Date: Tue, 26 Apr 2022 09:30:26 -0700
Message-Id: <20220426163043.100432-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 target/arm/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cc540f2b47..b604a820c0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6369,8 +6369,8 @@ static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    tmp = tcg_const_i32(a->sysm);
-    gen_helper_v7m_mrs(tmp, cpu_env, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_mrs(tmp, cpu_env, tcg_constant_i32(a->sysm));
     store_reg(s, a->rd, tmp);
     return true;
 }
@@ -6382,10 +6382,9 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    addr = tcg_const_i32((a->mask << 10) | a->sysm);
+    addr = tcg_constant_i32((a->mask << 10) | a->sysm);
     reg = load_reg(s, a->rn);
     gen_helper_v7m_msr(cpu_env, addr, reg);
-    tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
     /* If we wrote to CONTROL, the EL might have changed */
     gen_rebuild_hflags(s, true);
-- 
2.34.1


