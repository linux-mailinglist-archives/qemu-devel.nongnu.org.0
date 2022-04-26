Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC25108DB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:20:46 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQju-0003Ko-2K
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpx-0001r0-Gk
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpv-0005QQ-VK
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:57 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so3318892pjf.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtZqSMWwTH4bx7pviC4q7DdFYgGahnZ3eKlGOA25mWs=;
 b=MMp+XOBYzZwfNLBZo+x0xBr5LJ2oUwNH8xKjtkmyKWP5YGpDsi+wKET7GVlsRDzmI3
 6faLq/8eP+bbAcddcRd/gOs7q7CYJlV7bPFdS8HLwXDejuEELBewzyc2mNzNBl8E3Mfe
 i3bumTuu5lrmfQcV8vdEjYnECX9hZLEIKs0a5+OGcgADIT9yYaoQGcYJY5bM7v4bWjSP
 PSrLvFVcWBoxX1t6zjACMUoOSVuISdd8+bOaIvELNnR4r8YB8RDYKBWLorKlhaMOyizd
 rk6obj3IQdq4u3gm4L8+mqR5ittPc06C4tk3WzxKNPJ7jDgw+gQywfDUnL/58FkJA3Rq
 ARTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtZqSMWwTH4bx7pviC4q7DdFYgGahnZ3eKlGOA25mWs=;
 b=OwILA8SE9OQokMUXxfgnmXJwvTX3FuHhK57+M/WwSxPtEyzE86GVx0StdpTSPQjEYK
 23kXxOM50hUOoaNg0ZCJPbtjMlzriZdM/+jsvnWiYjyUZVLxvRyiKJn/Kz5sxkkUWAmP
 MKAAKuu2A20fIOnDTW0CD1oHQWtcoFWi0AG10yHOIMiD1bTeKwYbyIcoSVdli2zP69UU
 wXx//RvATTnTRJ9AEVi345+r0+XTRWjcfUb4QZ7NHP0/ZmsoUfDvKP8da4D9SXm/hSB+
 COEOk/7Xj4ol1s4Xh/IqZBOZKcz+XWjZZfg1b/OI8AcPEdMAdQz0GKeKb77jRxLDsy++
 w1QQ==
X-Gm-Message-State: AOAM530r090HwvoVAwKSvA2FsmqKz9HuAl21AqSyCYbarHjfoD0kEFQE
 UE/O+bRaYnaZ6BX86Wg+JTVvd6iNwOUs/Q==
X-Google-Smtp-Source: ABdhPJwb/nVS9ZDHmlWaZQ+YYc7Xabd7vKH7rzcDBdsZOq3ROjVUaYnbvwzE+EZURr3VJElq3QRJzw==
X-Received: by 2002:a17:902:ea4f:b0:158:5013:1403 with SMTP id
 r15-20020a170902ea4f00b0015850131403mr24511855plg.75.1650997374681; 
 Tue, 26 Apr 2022 11:22:54 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/68] target/nios2: Drop CR_STATUS_EH from tb->flags
Date: Tue, 26 Apr 2022 11:18:49 -0700
Message-Id: <20220426181907.103691-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's nothing about EH that affects translation,
so there's no need to include it in tb->flags.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-47-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 4d63006ffe..477a661f17 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -272,7 +272,7 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = env->ctrl[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U);
+    *flags = env->ctrl[CR_STATUS] & CR_STATUS_U;
 }
 
 #endif /* NIOS2_CPU_H */
-- 
2.34.1


