Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE633C17A7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:00:38 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XO9-00039S-JO
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5E-0001e7-2w
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:04 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X59-0008BP-V2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:03 -0400
Received: by mail-pg1-x530.google.com with SMTP id y4so4108770pgl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3KB/Tkz24jiJG0J6xu6GsoVxf3biKKstX86Aezy0Ms=;
 b=dwTGiom+JG/AgfPo6PBVvS/BCXvoL1e3cqVikT+WsjsvvxJamoujvFkO38o4U7lrOG
 cL2fSYg8P75w3CVGx3dw7TprMbah8/g6Vdw9L4UPOWtFveuPirqTb/sAJxS/qyYDIOsE
 senLoC3T/4ihDke8oWxP7MSxZMhsDhymZORl3MdqJ/1Y5LCxSwxHljWThh3rhDezo1z2
 9VC0XWB/ZhNbF5nKulOYYDWWn8yst3YYl3dqIXLx0bkCog6oOYVdZKsuiylzpqWcM68f
 cgiS31KfDDe1sqWcV8NInoVNo97JMMdYT0Jee2axmY+c29BC3sk0e248xQEQkf4sjvtL
 e16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3KB/Tkz24jiJG0J6xu6GsoVxf3biKKstX86Aezy0Ms=;
 b=Yz+iEuLjVqH0VWnLf9x9nrMn8dW+8G+ep6r6QIf4uGz9FyyIlaEDKWZbsHxNuGTMOd
 l0G20BE3pEx2HPh8KXIIo/NMrmBgg1MAC7oySaqIxnaC9o50IdrtuXzQlg4wkhPhv4Io
 oohIybgNJyU6hkiCYkC8vIwYX1FaVTaQFw467KkGt12S8qqHsvgTlVEzbCihhwwCR2i7
 Ph+qYoxAE8tksj0uJQjYBK9ku10KbypTH7OqyOB5Ts8viIKCCgb7F7qpealFCXjCi1fO
 /UqcQ1inga/gr4vUj1eYSNsQeT9XA9wiFq+HKUjM1RubrpIbXRVPR7hvN6Sw1SJgdzHb
 /5TQ==
X-Gm-Message-State: AOAM532Ru0E8p4/NE6rOtsxIpn7vrZdbRto48fGr/bUpaI0XmcLaIXm7
 N0l+lvlToDibdW44YVFVIwbDZfk/Z8oDoQ==
X-Google-Smtp-Source: ABdhPJzytR9KCUmtAk49+iDAMWByTvdiCwciYPAzXtUN36V/kGS6rM9MmVJfXD+vcPII+GUdABmjAw==
X-Received: by 2002:a63:f955:: with SMTP id q21mr33357852pgk.448.1625762455389; 
 Thu, 08 Jul 2021 09:40:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/28] target/avr: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:30 -0700
Message-Id: <20210708164050.711967-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Single stepping is not the only reason not to use goto_tb.
If goto_tb is disallowed, and single-stepping is not enabled,
then use tcg_gen_lookup_and_goto_tb to indirectly chain.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index c06ce45bc7..8237a03c23 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1083,14 +1083,17 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
     const TranslationBlock *tb = ctx->base.tb;
 
-    if (!ctx->base.singlestep_enabled) {
+    if (translator_use_goto_tb(&ctx->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        gen_helper_debug(cpu_env);
-        tcg_gen_exit_tb(NULL, 0);
+        if (ctx->base.singlestep_enabled) {
+            gen_helper_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
+        }
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.25.1


