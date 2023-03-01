Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07606A6626
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:02:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCiu-0004qT-Pd; Tue, 28 Feb 2023 22:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCia-0002VL-Mu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:24 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiA-0004FW-5R
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:00:59 -0500
Received: by mail-pl1-x629.google.com with SMTP id u5so9170085plq.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLyl5UGS2NTjE853AbioryrnynNx5ZSmrZNEMK7i3to=;
 b=gBS7KTKG5LbTYteW0E3kqE5wsIeK6MMoK7yenzToH5mjSu16stb6rsUeKq0vnIFjci
 eiJx3Pteh0U8iES8LjrtvseexGiHy0Ps73Cn8loyCPfrZe/KA7oaG804JfCBrX44FeD3
 gqSINQ/ShHYpwWP5bUKXFYdDePek+r8BfvoZfg+nkBJaWE70En2kIJcXfQzNvnVvj0A9
 F6jp8jYFKmt9I0DpxSz1hS71fItyfu0/BVHv0LpgfRHr3sFoyvfPZ8NWucvTTIG+55CG
 wbYU8Ii6jjyQD448oFHh9/63uUK1sc/Bmxn3oeXSNx30jExUqujQzAXzJSiM7Ocaw9T6
 EG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLyl5UGS2NTjE853AbioryrnynNx5ZSmrZNEMK7i3to=;
 b=lyl8jQ7EOgWyFOG1xTZ6urb+XUBwVWU8KMXGzsXOYxRogYe260UmMdKX16bzPSeaNn
 2Ry6taxNIe9qRkPPZY6Sf0eTwVYpZyvJuzjOs5qGCclkmuPqoCl9/ktHkDFcqLjmPATp
 h6nMGHOjg8bTu1qpXaG8m4t8HqAJRBaUAr78FTq71tR6lThBGDtH8vhdAUgevUcv82k0
 l2UJajh2kWFXn04N+GuIpKQ6M1zIKtCic1BKeDtetDW2Es1wcZ6QpRRbkXin6Cro3YZM
 c0P2r+Vo3tNOMHiWrIO0IYEcyaL4B1NequX8IaDEywoWLKSGf6wKYbfEj7ZCrCLR9mdX
 0EKg==
X-Gm-Message-State: AO0yUKXxrWyCKt2FYaFZzqG8HGgKp/IA4wr6OdUhQZraLwLWMD7Aj1QG
 AhYa3P/3JqGNHcc6hLxvPUe+BkU4EV0dG2Rn/5o=
X-Google-Smtp-Source: AK7set+JD3gOLE7KrlJReTfBWN8EKfIBnlJFdM4weS/1bUHUaeCtgJ+44YFTger6TTJmqyg+WqzzlA==
X-Received: by 2002:a17:902:7594:b0:19c:b7da:fbdf with SMTP id
 j20-20020a170902759400b0019cb7dafbdfmr4726785pll.26.1677639656738; 
 Tue, 28 Feb 2023 19:00:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:00:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 41/62] tcg: Use tcg_constant_i32 in tcg_gen_io_start
Date: Tue, 28 Feb 2023 16:56:22 -1000
Message-Id: <20230301025643.1227244-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 166170b08e..5b1794188f 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -9,11 +9,9 @@ static TCGOp *icount_start_insn;
 
 static inline void gen_io_start(void)
 {
-    TCGv_i32 tmp = tcg_const_i32(1);
-    tcg_gen_st_i32(tmp, cpu_env,
+    tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
                    offsetof(ArchCPU, parent_obj.can_do_io) -
                    offsetof(ArchCPU, env));
-    tcg_temp_free_i32(tmp);
 }
 
 static inline void gen_tb_start(const TranslationBlock *tb)
-- 
2.34.1


