Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED36B2E45
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWs-0004Wx-M3; Thu, 09 Mar 2023 15:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWq-0004Vl-4J
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:20 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWo-0000jt-Lb
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:19 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so7428174pjh.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SgJ/9QuJ1M4aqjHzRmv9hMTF7eQoV62F2sJ7R2iDy1U=;
 b=bzH3GF142qlUJPPWrczbcX38MdX3tNmP3svf4vEpaQjQV/16X6WAlcVMjAOdI6p58q
 V9Vyse0RpEMwREVZPryTS5SReBVLIMz5mZqnrGsMogmmZVp+58DKciAh48FVq7icCJS+
 TbGUNNUwxWMM7k5akiQ9G4cJ/6cfkO4TWZXb9fyycl2lqxvZ+WJtKm1C6OrPHwnARQHc
 khJLfRwN8RQ87bRD7muR3wjD5GioVcjQLvpm/1pIitkERXJvZ5vBLbkB57Kahr0oaXZp
 Na9PHHP36u7YLM9/Kl8vGyMeAiFXUf4Ncf54HmlU51cLO7BM97aHupjFFdztD8bwpA1e
 uXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SgJ/9QuJ1M4aqjHzRmv9hMTF7eQoV62F2sJ7R2iDy1U=;
 b=tbg7+B9r42eNY6T51I4R+OrC+PxrfLoEG3k6eV97ngcoZ/NDmLZJ/EWRNN3rgGwZV7
 TtI/tl4P6mZNiOQIsG/jNZuqBuaTBkz6voneatGVLumcIHdHcI9FijtqJBAasoUwy4q2
 bRTwB0FK5aMMFxVX1bpp6CpsDRA4HD7CRtAmUNbTcyqYZ+WC/xAWeuU/uwS9ZsEfqqnV
 r7xYKhZLf0xYnMDmsOuLYJglnfmV8DHqhvgR0O7xO8XGK6sgE9TU9OvssJ66hVExt+iR
 mzGaz2S2l70oa98XnBrmPgofN4kShnmxyk6lygbpbKaMV+4pP0P6UqFk+/E0nnZjQjtC
 rEEw==
X-Gm-Message-State: AO0yUKWQ8mluWj8x2vAPV/bMhArGWzeBFIe1BLHSKkI++T8dHPj2JFQP
 sYVzIougZll/ystdyuepxqv0Tv7tj4p7ar+7k8Y=
X-Google-Smtp-Source: AK7set+Uf68dIN20d2m0zN7ME6fnqFXNGP6L+/ThblnWYoksZx1MkHz21llVtvuEJhRGknqoNsvJRA==
X-Received: by 2002:a17:90b:1bc6:b0:234:106a:3490 with SMTP id
 oa6-20020a17090b1bc600b00234106a3490mr23043602pjb.40.1678392377872; 
 Thu, 09 Mar 2023 12:06:17 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 29/91] target/openrisc: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:48 -0800
Message-Id: <20230309200550.3878088-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-15-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/openrisc/cpu-param.h b/target/openrisc/cpu-param.h
index 73be699f36..3f08207485 100644
--- a/target/openrisc/cpu-param.h
+++ b/target/openrisc/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 13
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 3
 
 #endif
-- 
2.34.1


