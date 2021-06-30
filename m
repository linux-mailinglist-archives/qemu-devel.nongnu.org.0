Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558DE3B88D8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:59:08 +0200 (CEST)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfQR-0007V0-94
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0t-0005W1-3x
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:43 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0o-00024I-H6
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:42 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so4949695pjb.0
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pff8c+CXaZuYQN3AC9HgnBb8y6h8lxovDgoF+viWASM=;
 b=RUck+Moxk5bH3lg6sK9LjSOnLcST6ee635ckGnNir+1HW6yM6NWBMQ+BSm2HVdgWiG
 ged+KzAZ70Ipi7b+IVa07cMv9LV4Fnv6lONyAoJve+vNTKlUFiC+U9fkxAj2ZKUqZe/l
 dcw9zS/w2EOKLOvG2QpAiMz2tAEiEsTBdmZfOLuuFxBH4hjLOJhHiDicaIfWBUxpkXae
 U+LbFQEemHKmTqNIQ0pOiJngbkPARVdY7bk/Tt54sXks6avz+cGZLP2YEunTJx+2GZJ/
 UHu0Jobxe6lFAoaU4CRJIFjOiuQBdhx08CMS38oON3UkYMRExRSibLKwDBceazNZPIMn
 ZZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pff8c+CXaZuYQN3AC9HgnBb8y6h8lxovDgoF+viWASM=;
 b=KktUGcBZy26iw29c5KZe+0Tk9fguKA684wFt35KTO0zaDjEJmTBLwhMlc6NEFq2tI5
 7ggjjP0aID5yodo2uuQtxjzwACmelLQelSCqKCWJh0rxw2MIJv5RxLEriIqpaHr++hdv
 nEYIwdv+hC6TiAlxgu01Gb+dqtKMlSWgiGH9hBa1Zaz71ACeOMB/s6C0OiVsrhjBAyOI
 iBcPyMuMpx38jwt0vDsepudMedBpvxyG7eg5C6rYuDdO6k42eTskjmK2DtPkjrHEG91w
 TbkJ/aJbgkJLAucd/UEs2xkNFQa/Yqvt/wT+UwXWAMjd8UDQRaf5DctEfca2jiCBTpOB
 YEeg==
X-Gm-Message-State: AOAM533x5cfEYsmddpgGkWgHwOkqyA/Go5MEn1X1i3lxKkYC7fug0ot1
 x5F+V6D6lNT8wCEqM0EjS9y1p7vWM5ENYg==
X-Google-Smtp-Source: ABdhPJyTebglw65L6Yvk9kOonE6yUwOrbw6nyk+rGrzIbtlJSrCwjCrn8RxdvHcGZKSEPmyu85GE0g==
X-Received: by 2002:a17:902:b082:b029:113:e50d:c404 with SMTP id
 p2-20020a170902b082b0290113e50dc404mr32923002plr.5.1625077957259; 
 Wed, 30 Jun 2021 11:32:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/28] target/mips: Fix missing else in gen_goto_tb
Date: Wed, 30 Jun 2021 11:32:14 -0700
Message-Id: <20210630183226.3290849-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not emit dead code for the singlestep_enabled case,
after having exited the TB with a debug exception.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 52ae88b777..17e79f3de3 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5030,8 +5030,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         if (ctx->base.singlestep_enabled) {
             save_cpu_state(ctx, 0);
             gen_helper_raise_exception_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
-        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
-- 
2.25.1


