Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441DD50BE6C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:15:49 +0200 (CEST)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwsm-0004mq-Cp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWx-0000y4-Tk
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWw-0007Gp-FB
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:15 -0400
Received: by mail-pf1-x430.google.com with SMTP id w16so2091250pfj.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i+pIlq3Zf7Ct4aEs80TxFQjBRjx+ntMdX+PCJRolBhs=;
 b=dlRi35B6+y8mOlotKTSTbLf5byMq1ZBN3LrwE8IS7agCTILK9bLEccNXxPTchb2HGu
 iUGTeS2GhBuhfoRMtIRnNNgWX+Ci+gTksi5KBmh2JXFGInos3Mo64PstH7srABnNkHdw
 iwm8C0NSHXoYZSJGL7IsYDXeTHGpdtIfMxvC8aRA548jCyluYN1UZd5c4PEVkuH3MgRJ
 DKjpUd8Kh9kFk1VEI1poFTB7iXNlBFF7Sikoy/FJgPALKbpGM5yZj2z0P5nkVyH2mFGv
 WnFrjkz7k4P5cN7qurMHAFim529vVBYVIxpKkGjTyRnUKPeXkkrCH1vbro5FXFv0BB/k
 ORaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i+pIlq3Zf7Ct4aEs80TxFQjBRjx+ntMdX+PCJRolBhs=;
 b=dgAV/u+K35O9zYbemIjPMF2QUJk3LizVCvD5ADuzoECy9bpYVwxHI4K4xtZWxfo/Rj
 76QTO8GLMoJsj9tjuUQazpHO97XsusbZS9pshkEs/P0xZnVFjFkd7dxuFAZsyzBq4LMe
 jsSrIWzID7GYi7fo7xwuQk+5tZ+f5qdpGHlmf6tdWZpH8R6hzkvkF8pp+5oi/uqNL7es
 9nJNfqiVOJQ4juxNvcRe4cCoIX0DZehw/yz/BmmreDmYXKdDujd5T5k6jcMYRBddAHJN
 G+gvL3oYqehIEVl6xVLw0ovnSv3HZmwxHuz1eVfFJ9esCW6XvptugScIKLS9RRE7SdX8
 67fg==
X-Gm-Message-State: AOAM531wfN4Fr/7JhMhe8Xewb2sVXyavwpcVdqftEOSyrx9+6ebQ6G4P
 Dm+qqp1DKXwixp5yN9zjX5jjxXQMO2KIFx/U
X-Google-Smtp-Source: ABdhPJz8ZszCS8kjUlQsXEACV7Pz3XgsaWQ139KgAa28A2A0V3wdxUg8oEUPBjVXRkTFqPjoa6IxWg==
X-Received: by 2002:a05:6a00:1988:b0:50a:4aad:bbea with SMTP id
 d8-20020a056a00198800b0050a4aadbbeamr5869030pfl.20.1650646393243; 
 Fri, 22 Apr 2022 09:53:13 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 18/68] target/nios2: Fix BRET instruction
Date: Fri, 22 Apr 2022 09:51:48 -0700
Message-Id: <20220422165238.1971496-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

We had failed to copy BSTATUS back to STATUS, and diagnose
supervisor-only.  The spec is light on the specifics of the
implementation of bret, but it is an easy assumption that
the restore into STATUS should work the same as eret.

Therefore, reuse the existing helper_eret.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-19-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 53699ee088..3694f2503b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -407,12 +407,22 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
     dc->base.is_jmp = DISAS_JUMP;
 }
 
-/* PC <- ba */
+/*
+ * status <- bstatus
+ * PC <- ba
+ */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_BA]);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- rA */
-- 
2.34.1


