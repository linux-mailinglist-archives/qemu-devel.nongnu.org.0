Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA8C3D0921
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:44:38 +0200 (CEST)
Received: from localhost ([::1]:49472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65y9-0007eS-UA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vk-00056P-Fx
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:08 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vi-0005Ri-RU
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n11so489009plc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pwrBjNjNNTyCMJtkAsuRpXBoHyTgIOoOTRWqB1Tn0SI=;
 b=zcovy3kufBWQ0yTqYFynM39cw8KgGmeuFocC4SFAWC/i/xc+5JuB7fw0yL464hiu94
 Hyecy8O0PHWzxR2nVbbXjVPvZcMPKmi5JeCIr3PlOhL6aFXKNod+NArRlMaqkElBbm2n
 m7OYn4jm5upzLCF/HTRpqZ6J2FTDjeXgn+PaVM2yjy0dquZEyGZ2lYm5WDDpxGduzdDk
 /4Lgh7YOCBVXAXR4FSGiY6D5QFn9kegyQnAmjRwBcdKvfUgxI3Yq3sN3EfL91m0/+VdF
 DEtYWqA6J5Op4saOqP2QRaTMIaDiMyG1wZbS9w8VXEsAjMdQYjgvW1LFdKN/Kc9DofdA
 8zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pwrBjNjNNTyCMJtkAsuRpXBoHyTgIOoOTRWqB1Tn0SI=;
 b=ITlDnsXHy+rcC3is+wplBYZtT/EmMVWuBDHVVGIYQXLTEQtG0AJTgV+5aNA3b1Bw++
 WXTUn+QcNXmI5E5q3YHWsuqOolWOe74RgzGo6CFCXIdTPi1cC68gJZwq7CwmvNAU/huD
 EuFKx8hI9NSIfDIRL4rtq6Ib9xtEIpXXNivc90NWd2MnBELm4rptnQaZ7kj3CsUwrG3a
 RBYAfDu06rYENZi44OWL4LYFiy5jxmuCRlMH3oJ9pxHdsWoCIf582IJQ00qsnHRGgHhw
 89tM6XN/I8B7IrNxiUYDIc1wsfQiPsyXS5TceQdM49AIUI5Ecpnsnposcf4GfHXMaZkK
 6wzA==
X-Gm-Message-State: AOAM531fPcfw3HvhOyOQgClwhwFJ1JgRnc4BnMGFncak5NqDjTJcPYIB
 mpE7Qfl3oa6I6c0a45KSpuhsjsVox7IGrw==
X-Google-Smtp-Source: ABdhPJwm4gDMYxmv/0xmJY+3OpxDYXygPZBmj7GiDz5BRlO9omSW4LizX+/moemjI+pLSQHutVDrEA==
X-Received: by 2002:a17:903:32c5:b029:12b:9107:8684 with SMTP id
 i5-20020a17090332c5b029012b91078684mr8504556plr.73.1626849725409; 
 Tue, 20 Jul 2021 23:42:05 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/23] target/hppa: Drop checks for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:39 -1000
Message-Id: <20210721064155.645508-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 target/hppa/translate.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b18150ef8d..9e0524efef 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -817,11 +817,7 @@ static void gen_goto_tb(DisasContext *ctx, int which,
     } else {
         copy_iaoq_entry(cpu_iaoq_f, f, cpu_iaoq_b);
         copy_iaoq_entry(cpu_iaoq_b, b, ctx->iaoq_n_var);
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -2349,11 +2345,7 @@ static bool do_rfi(DisasContext *ctx, bool rfi_r)
         gen_helper_rfi(cpu_env);
     }
     /* Exit the TB to recognize new interrupts.  */
-    if (ctx->base.singlestep_enabled) {
-        gen_excp_1(EXCP_DEBUG);
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 
     return nullify_end(ctx);
@@ -4277,10 +4269,9 @@ static void hppa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         nullify_save(ctx);
         /* FALLTHRU */
     case DISAS_IAQ_N_UPDATED:
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG);
-        } else if (is_jmp != DISAS_IAQ_N_STALE_EXIT) {
+        if (is_jmp != DISAS_IAQ_N_STALE_EXIT) {
             tcg_gen_lookup_and_goto_ptr();
+            break;
         }
         /* FALLTHRU */
     case DISAS_EXIT:
-- 
2.25.1


