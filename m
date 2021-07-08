Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9583C17E9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:15:29 +0200 (CEST)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XcW-0003kM-3C
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5O-00022R-5J
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:14 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5H-0008G4-JQ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:13 -0400
Received: by mail-pl1-x635.google.com with SMTP id p17so2764158plf.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlb9t26eUmvNmKvxgmiWrSkxF75bfUaFnwmdpAxQL3Q=;
 b=zFLyndVYC8LAF9uPjszS8M4KZEOcr3gGmSkz1Qi5wtwNhJyvnFbecqdezaTvwyOuYk
 tlYAGC3FNhlT/4Apfnl1jNCO2GDwEfplAzlcRIy86dL6Q7HKmuUA6L+PUj8NOOjl8QC7
 q2g2xt6SKDv/ojLUL8URP6P3yGrFmTR/0LLwdVYJkB9sGuFmwJEEJ64M3PL3CWWMyWPk
 0hvSd0YBK4l6BWGJLECup8TJAaQVa7Z9up8VPfAeEUIQTe3RRmYEI4x9PHWcX+BnThCt
 d9EPgBHBXHBgWOphGCYynxTRII9W2jCEL1vFVoTxJhXWBXIukXLYQez5WOePWb7eEdUB
 m2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlb9t26eUmvNmKvxgmiWrSkxF75bfUaFnwmdpAxQL3Q=;
 b=CGzN84Xw15B3dTVXOPfUvWHmTzArqzf+EsdOlLMcsEne6/OEQgC9hy14eEfAj0et5R
 YmQWyjfA5oKCmGC7ljGBlSyGTQ1ga9Z4ST9Azy/352QjkmI+faZp8aGGq0tckij12hOW
 W7zzIyYCxT55ZBjx9UaTF7uyDrQ9kw0cxPjiX4NuJehMusf3Gz/FEdNM519c2AC+JG2V
 xBhGJqxuetV0CFXBbp6qZHJsuP7DAMTakszF0MyJGqdSfCGbaUHDeyo8SsqpKtXJz7yx
 6AHD3Y3eCGt7DfIbMZreB8BFDNEO19CLndvdL+qkmKmcrijfVG+2hBYHm8HVmMWgPq7g
 FnNA==
X-Gm-Message-State: AOAM533JA3P/pr6s8gQ+sWdNZhDZB0b1Hj9RX7BzXSsDlZixmwgQdMG1
 bJLCC0o3RgefE6/FO26D5kMJq6P3KbUBDw==
X-Google-Smtp-Source: ABdhPJwv0EwQgglDSQMBeJSL0E7Avk6vmInIRskVhxHp0ZUTKhkRvxaVZEo0H32Ivt96HcdL8Y6pNw==
X-Received: by 2002:a17:90a:6001:: with SMTP id y1mr5634634pji.5.1625762466219; 
 Thu, 08 Jul 2021 09:41:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/28] target/tricore: Use tcg_gen_lookup_and_goto_ptr
Date: Thu,  8 Jul 2021 09:40:49 -0700
Message-Id: <20210708164050.711967-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The non-single-step case of gen_goto_tb may use
tcg_gen_lookup_and_goto_ptr to indirectly chain.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 09465ea013..865020754d 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3243,8 +3243,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         gen_save_pc(dest);
         if (ctx->base.singlestep_enabled) {
             generate_qemu_excp(ctx, EXCP_DEBUG);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
-        tcg_gen_exit_tb(NULL, 0);
     }
 }
 
-- 
2.25.1


