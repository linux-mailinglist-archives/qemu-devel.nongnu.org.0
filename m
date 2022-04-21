Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF750A583
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:33:11 +0200 (CEST)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZjy-0006Uq-A4
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcx-0005R1-FJ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcv-000771-VD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:51 -0400
Received: by mail-il1-x136.google.com with SMTP id i8so3251459ila.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YY5PG1tu/+nZOuQaOTMq7AvychoPpeLt3DavtA6KJ8=;
 b=ibyCRXQRAjC8rbOjom3Mh/UDrS9kXcjjoT6Du04aW/QVRwI6vc1b3WeGr8aX8B/RKI
 b9w596mIG1KekQba6E6BphHjbS/Q7kaug8/n8njefrnwsYh0DOFv0sVTeFtYviyqFzoo
 AXth5vaWEJLdq+k4Ar5KzadFBBzIJohc9zD+ZXf6UgTkUK1gvrsGcMTQTCVWRvMlzVJx
 76nqFP5/E/3VKjk5jI+ev94ZnyReQaT4cXs2mzPK9fFagHRhR2JD/ru1uUBy1I2tzmUR
 gThCsYs9V5oA8lBb2RXUIl4djU0tfmPnAOiNlK2YF1T42RNo/5vkG96FPAUjLc3mNmDa
 R5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YY5PG1tu/+nZOuQaOTMq7AvychoPpeLt3DavtA6KJ8=;
 b=0KPKwjVALTaRUf5dJngEqMJou1Joe7HzKu7DEzENE8Bi6GK6B7/B0PuzEQpPKqUvSE
 FE3FCyK1KHSaIvkfSgkv1Inucpssa98JR8oEUs/Ik+SDGOV162/tKMjP7hHweEiT95h1
 fgNLUkBMrx4QGu6rp3n6IeSLGaucYgC6dYHkygPlNJVTXhnjtEvkyseAoGzHF4Kc+7CC
 7tBkIdN5tacOc5dHNLdmX92dJi4dlwTaVDnaT9kNMZHP7UFbvBjGnySc3rm0NaO4KpkF
 J/E6vLP7fC5o0uZLNN6Px0mVm1sC3r9L5OFSI6sMQooCl7zFyRYBT0LzaQ5fqn9vOwft
 0fIw==
X-Gm-Message-State: AOAM53108bUsNAyD52CPKD/ugk0YPmjuLuuxtoWe1mVGucGkWAcGIFGZ
 3kecEQIhJ9mY5JdCnQlVUCzbbRlQBk3a4Q==
X-Google-Smtp-Source: ABdhPJyDjFEFGT7NXTRm8IiTDUO0awVQL4GDkL4hho7AtEjC634Bj72wTfC+4ZYmryL/Xo3lvJ/EyA==
X-Received: by 2002:a92:8e06:0:b0:2c7:a8f8:3c5d with SMTP id
 c6-20020a928e06000000b002c7a8f83c5dmr77715ild.107.1650554508957; 
 Thu, 21 Apr 2022 08:21:48 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 46/64] target/nios2: Drop CR_STATUS_EH from tb->flags
Date: Thu, 21 Apr 2022 08:17:17 -0700
Message-Id: <20220421151735.31996-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
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
---
 target/nios2/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2ce76af457..6417e9bbfc 100644
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


