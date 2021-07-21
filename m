Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEBE3D0936
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:51:32 +0200 (CEST)
Received: from localhost ([::1]:36752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m664p-0001Te-A2
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vh-00051Z-DR
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vf-0005My-3w
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:04 -0400
Received: by mail-pl1-x632.google.com with SMTP id u3so481921plf.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+CojFzxCaThMHHcZRB87I08hMuveAHZO4gdu6ijvdyY=;
 b=Zm5KjuKa9mwqubGY4GN8W3JHfa+ZwAbHURW8OXplMyf/c92bqvSeO7NjNsuezc1vOL
 f6xoKEf+sW5FTA+BKrfpBIq5gGLdYakL3H1uD2wJ7jc5j2mR5IGxKw2q+T1F8FQZsjzl
 xQ/MHZyt041QTh7CRIfMT5mXMpTZWnm/YehBvQwJ62RE+lUBMyPlGDuvkkl//xkvx2XJ
 0/5O5c6tMlp1rdhEznC0eOjQjfhl6DsNxwKbTWGSwhdew16GVFuPe5+2whbAQtILaUEI
 ldu3QVvXA565ENSrk+thxUPFdAjJX82/im9o3waTWSjSGvoXMSItiDOswsZYLBaqzQgd
 gPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CojFzxCaThMHHcZRB87I08hMuveAHZO4gdu6ijvdyY=;
 b=M+sbf5Smb+cD9/EdPCIxnsOfLPtsnmiMGtTNcAayicLSyJAINwAZ2Cyn546rfMI1sP
 4OHdKttLmhs5NMIxBpaCM6nj1lyXRv2bH78HY06g+truxGQYBazwTaON2WhtbYxxVqwe
 g7rXVGdislqz5Rmt9skl3BbDfvWoYfL9qbsYopDuEX8su3p0f81h2M/E4uBwG9cl/g8k
 jeurn+p6RMpkNllIpgDD8Im+qYipTk/1PMGs25LhoVw5A1WnaptDTt8FfupUKQSfqa7w
 XMr+m+tg236a4A2TZVHihg7wOKCrws1uehy/1PSZ2713ZJ+x3xEQCkVgmIZdGYLM+jn0
 kCvw==
X-Gm-Message-State: AOAM533m5m6plywJ0//OcDYEhZWSyaiqGjqNmJIclSpzsh+UaN48f5be
 oY8EjsnfAnjiyPMHSGgUUMSm+tLphR8yuQ==
X-Google-Smtp-Source: ABdhPJytIrTbBWX4uaZg8cM4rwNQvgRKKEJenjEOQFFkyAJ0Ap5AEMC1uJgWJrKysBWcdZ3MunTQqw==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr10466407pjb.114.1626849721589; 
 Tue, 20 Jul 2021 23:42:01 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/23] target/avr: Drop checks for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:35 -1000
Message-Id: <20210721064155.645508-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 1111e08b83..0403470dd8 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1089,11 +1089,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -3011,17 +3007,10 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_movi_tl(cpu_pc, ctx->npc);
         /* fall through */
     case DISAS_LOOKUP:
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        }
-        /* fall through */
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_EXIT:
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


