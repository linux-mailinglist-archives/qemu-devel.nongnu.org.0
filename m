Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D33ADD40
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 07:32:19 +0200 (CEST)
Received: from localhost ([::1]:57332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luq4B-00019s-0p
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 01:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxy-00072r-H0
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:54 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxt-00088T-KY
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:54 -0400
Received: by mail-pf1-x433.google.com with SMTP id g192so3389263pfb.6
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 22:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tK/+Hz+jguD/DmBbj1fKqabLd+FiOnfaK8a7Km7K6/I=;
 b=FZNFSP+dfei2aV+JvPV9d9rsjDtFKRYPrV/umuTNc4DnbMPnC0iY+9NS1yHNKhOA99
 uUmIY0gEbe9DIL9+gbdVHVHPyV0wlw7+oGpos9HLX4ZR8T7qmjz787JYTR62RaQhvsxs
 KttEvYAzD8RxSZ7leI/m3wjuBu5mu3nESCUyMTJgyJVYikWe6Fedoz9ymcLqyIXcvYMq
 wGuY0c5RnL9Zf3JzHCSs7I3284ol2HkPfrqx359CmZZsb6YMxOGi+9sGYqdJ8GZOh97g
 nITmGGTRSS8vBfa83cJi9yxk5RYVCGO1XB0wXwTK70zdp0azjtgVxqM8osl6e0A+0Lh3
 hG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tK/+Hz+jguD/DmBbj1fKqabLd+FiOnfaK8a7Km7K6/I=;
 b=GnVGE0Q74JNY8jV7HGU3/4qfhJySwReE4htA9OW6iDhHZXU0hZp987hARvZ0mgSucV
 JVEq1/Uhax5wLsZB0X/ZcnxuIOs9lrYEcXduwnRM89YP8le87yNnUyBMVXyeYNJdbSeJ
 6dw7WqiTghZ3asgD6xXBEllLcqFjuXXssehePMLIZP/cQ4GolaRvFastWL6lsup2R77S
 AjHjfrRkPKgemRu/q+ohVYXgIke/QzKaCUmFCwc2kOdtkaFTR4t6t1XBJdzn4XLeDVgc
 JoVNBHMkaXSAcOSjXxnog7HrLwdbSfVG+wKQr6TqJVsM4r59XAF3mAgVOha09V9xDt9P
 B6nw==
X-Gm-Message-State: AOAM53134mst+aX1KH6pTq1nEzK/DIcs06tXFE9PJIv6UVPqqZX/3Dak
 sCKzQB4I09wsxrElHCcrSGgB0XYf2cp1jA==
X-Google-Smtp-Source: ABdhPJynoNiuovWj8ZJkBFcZcZG00Qro4EQDTOq5d7+UV9quPYdvBqGFWBXGG/OJebk1ZyZoIskJPA==
X-Received: by 2002:a05:6a00:26c6:b029:2f5:358c:6761 with SMTP id
 p6-20020a056a0026c6b02902f5358c6761mr13330929pfw.50.1624166748397; 
 Sat, 19 Jun 2021 22:25:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm11409741pfh.103.2021.06.19.22.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 22:25:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] target/nios2: Remove assignment to env in
 handle_instruction
Date: Sat, 19 Jun 2021 22:25:42 -0700
Message-Id: <20210620052543.1315091-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620052543.1315091-1-richard.henderson@linaro.org>
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Direct assignments to env during translation do not work.

As it happens, the only way we can get here is if env->pc
is already set to dc->pc.  We will trap on the first insn
we execute anywhere on the page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e2c8151193..ce4a4c40aa 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -740,14 +740,15 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     uint32_t code;
     uint8_t op;
     const Nios2Instruction *instr;
+
 #if defined(CONFIG_USER_ONLY)
     /* FIXME: Is this needed ? */
     if (dc->pc >= 0x1000 && dc->pc < 0x2000) {
-        env->regs[R_PC] = dc->pc;
         t_gen_helper_raise_exception(dc, 0xaa);
         return;
     }
 #endif
+
     code = cpu_ldl_code(env, dc->pc);
     op = get_opcode(code);
 
-- 
2.25.1


