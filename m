Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1ED3F75BC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:19:00 +0200 (CEST)
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsnz-0004bP-8C
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZO-0001xw-AV
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZM-0002mH-Mn
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so889901wrh.10
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGi0bWCeq/OP3YpAAxkkS4YY/6sTdDEW0wWYiNmbwc0=;
 b=NHShqhkWKxeojDokfjMcOnQNrwDQj1qUbx6Fg5I0CFy20f6rb9wssebtWNKPSUpKS2
 dqp3YoDzR+U/LQER6FldQ2/+jad6tW3t9uvaUN0evstXcFIYUG4w06410enB1su0TQDP
 GgmHCQj4jaRwByyHG70LX4yO8hXWB9oTK6Nj+vIhRiY2hckjS2e8d1K2WPU/Yhune+R/
 WLQOlONA8FdDTgVDqMlZs10EHXAMaVoK/Za0SbkDF7zaj5uaVEo9oYUCAU/Rz1BdvkLX
 Wv54nQ3ZlVDE2LU0L7/CVhO3O6sl3VVs6PWybeov+Cg54bVH3daKfCLgD6qSPpGLoIj7
 mI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VGi0bWCeq/OP3YpAAxkkS4YY/6sTdDEW0wWYiNmbwc0=;
 b=jTTYEWfmp2EVfQSThHaMdzQAnS/Vy6n1u1k9XylRdpaekcYcmi0EKRVXx3KTrlYOmr
 IWuS2PbJMAJgLPBSgJQEmd2DVIrUSaHBCkmsiWYRw0yt8M211U+6lXZj32QrEfOgaal9
 CoGdJqxBTAIQ71fVUtbDApbt9T3qQZkDAiFZw+A5QssviILTywhxD7IhUCTDnQU6f7p0
 shCszzymqG8JaDJoXexNRhfwyd3eAxOSJo4Ery/5stThH7RPIFfDYKthYj4MnAw+GFl0
 G5OCjYXX0ULJTIuMoNvWR/wAyHxfxw7Ax601uxzZJkPjue9hXl8NA9ve9c3lb0ablmJr
 v/OQ==
X-Gm-Message-State: AOAM531n7lb0pc4fdRr5fVZyUqX/ocnej2de6mwbBKsck+cGzmgNVkam
 LEhShA+3o43xY1ObNGmFyz3por44sYI=
X-Google-Smtp-Source: ABdhPJyoHCAqsos/lvjrTY8qjOxpn4mGWvcZh2tqDlqkvTXX5Wl0IrVRLF3AMbDtUErPgfXprGPnXg==
X-Received: by 2002:adf:a45b:: with SMTP id e27mr14360403wra.222.1629896631003; 
 Wed, 25 Aug 2021 06:03:51 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 e26sm8143278wrc.6.2021.08.25.06.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/28] target/mips: Inline gen_helper_0e0i()
Date: Wed, 25 Aug 2021 15:02:04 +0200
Message-Id: <20210825130211.1542338-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_helper_0e0i() is one-line long and is only used twice:
simply inline it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-7-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index db7fc75d937..c515a337ebc 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1213,10 +1213,6 @@ TCGv_i64 fpu_f64[32];
 
 #include "exec/gen-icount.h"
 
-#define gen_helper_0e0i(name, arg) do {                           \
-    gen_helper_##name(cpu_env, tcg_constant_i32(arg));            \
-    } while (0)
-
 #define gen_helper_0e1i(name, arg1, arg2) do {                    \
     gen_helper_##name(cpu_env, arg1, tcg_constant_i32(arg2));     \
     } while (0)
@@ -1378,7 +1374,7 @@ void generate_exception_err(DisasContext *ctx, int excp, int err)
 
 void generate_exception(DisasContext *ctx, int excp)
 {
-    gen_helper_0e0i(raise_exception, excp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 void generate_exception_end(DisasContext *ctx, int excp)
@@ -14188,7 +14184,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         MIPS_INVAL("PMON / selsl");
         gen_reserved_instruction(ctx);
 #else
-        gen_helper_0e0i(pmon, sa);
+        gen_helper_pmon(cpu_env, tcg_constant_i32(sa));
 #endif
         break;
     case OPC_SYSCALL:
-- 
2.31.1


