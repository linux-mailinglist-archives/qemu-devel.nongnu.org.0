Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D784435FD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:47:19 +0100 (CET)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyoX-0003ko-Uy
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTV-0005pE-If
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:37 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTO-0004Du-6l
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:31 -0400
Received: by mail-qk1-x734.google.com with SMTP id br39so7352931qkb.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kgIAZfpBiG9Bp0aRLB9BDRfUW43JbXvDwVrmE2eY/v8=;
 b=QvBYPJ9eP9HDjBTYk4pWXVBzsgnGUrcMi64W9WJ3B0vUXOA9pUjmBUkPdKALZZpCuI
 jxpxXcUByY6iiWHiZ7K+Xfzz3P0l7mZb3UVeiAe+3VKWWrmYXVx2LmpRqX64YVRP/aAZ
 7T2qDEBLU/2p9cQI5flMXzVQc11kHXu7dTDmUiBLc7u71vGTcx0mpWeZBPZSwr9jmPcu
 FNeaE0vQdudI4YlHzak/K/bv3E3nVKFxHelBl7nLJI0eRHeplmu2Vl/EjhKa2FQEYTtA
 ia/qf4Y6LBuVMwaXKWjhH8nQarp7WybFtrr8Que6eZFbbt49iSlaZKfEHvSXMS8T+bRx
 0tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kgIAZfpBiG9Bp0aRLB9BDRfUW43JbXvDwVrmE2eY/v8=;
 b=199vet8K3ocbDvc+pLow8YIdaKKYEAgNMkvkYS+K5kvvqJO3MkXrzAgVXgxiUmkDd7
 hwuWK9yoAJrvRpFkgOYpa4mRbiN0mCcBPBrMyQ+FRisUkxpHU/e5L93ztH1GDWCbEqNm
 YnD8v/JqdrCZDsF37HEBsDTnVMZ2ACXpPzVuA9Eu68gjmgGBa3SzssAIIC5lrfk3P0Eq
 uIWq91G50kIARCTU2J0IBix77V/SJQSTamLflIfyd3bjVyMfzjo9rl0oy4ohIrrDYL0G
 v94kA7q3DXZ3ob3EswgJcrjYPQ4mKTu516D4vgzX3LPySmMUfrTumBQrDhr8YDbpTRR1
 f8HQ==
X-Gm-Message-State: AOAM532hbi+BDCUk0LLvIBiLMTD3ac/4o7K/dNiwbArOOlxjwj3FNZy0
 op7r3ea60n5tNKNiRliIfaYswTFDkrB0yA==
X-Google-Smtp-Source: ABdhPJz4Nb1BKzTYi7rTL2pukvdWpU01cRZoT5Y10lfVihPW5fBcFPI44JPhInXPchDoaZ4xmXabuw==
X-Received: by 2002:a37:b386:: with SMTP id
 c128mr30251021qkf.426.1635877525259; 
 Tue, 02 Nov 2021 11:25:25 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/12] target/arm: Introduce store_cpu_field_constant()
 helper
Date: Tue,  2 Nov 2021 14:25:14 -0400
Message-Id: <20211102182519.320319-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Similarly to the store_cpu_field() helper which takes a TCG
temporary, store its value to the CPUState, introduce the
store_cpu_field_constant() helper which store a constant to
CPUState (without using any TCG temporary).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 88f15df60e..17af8dc95a 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -70,6 +70,9 @@ static inline void store_cpu_offset(TCGv_i32 var, int offset)
 #define store_cpu_field(var, name) \
     store_cpu_offset(var, offsetof(CPUARMState, name))
 
+#define store_cpu_field_constant(val, name) \
+    tcg_gen_st_i32(tcg_constant_i32(val), cpu_env, offsetof(CPUARMState, name))
+
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
 {
-- 
2.25.1


