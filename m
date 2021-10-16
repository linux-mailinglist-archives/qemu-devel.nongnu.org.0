Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF5430431
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:29:12 +0200 (CEST)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboQh-0004yy-U1
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDX-0008M4-TO
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDQ-0001w9-7h
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:34 -0400
Received: by mail-pl1-x629.google.com with SMTP id f21so8500186plb.3
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jQKQj7yC7oasjm6gEezfZCoepcbFAh4lW7SLWUNzRbc=;
 b=Vw6QthaW/7gFnrlZHvJy3leedJSKJF4c8amcOpQAjUXv/j7ojMPTfsy1si9IkWWXen
 lS3vqyMlX4l8Rn9b0UhM0hWGAH2+0Bhv4yh51ZzCRd9L4rB8NldnkQZbImJh00bRB4LY
 k3MWNhnH5MCmmsLh7OydQHOpSVVFZiumeZ/ROxZzngcb3Pspff/g3MnDgobn1O1ipHtU
 SsUvmcL9yenEQC63Qw/Ezwia9tH4JlChsiI3LoIYFwgjfme/dqDia60IhDSX95u5ywF/
 nxQFzkIsipAPLA9HNR9IHe1Exy/SepYjLTiaRpxC2XJ71qHrAksKOUuaqn9IWgsMPCW9
 d51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jQKQj7yC7oasjm6gEezfZCoepcbFAh4lW7SLWUNzRbc=;
 b=bzhbQuC62Ef/Z6bngYkG42rspOSm+TVhof/zD4YfSJV8/N2QjJdlaBgppdyxQg4qS7
 nYhrd0hmV0OKh7jhvw5jT68UZDrbG5mxjU7yiZ+5uTHL3kDiyme7xHEyJYWJpGl9Ogqm
 Qwy+ObFrbwUEaJSZbT7UWcMsghMcTg9fcvjdznu4hhQvVZGedJk3r15deAgJmhHn//n9
 d5GiCOWztwuB4cneEwLfHds6vcB+8a2DZT2ySkuJQo6OTeA3s3es4251TZbT3jJjjtjW
 xHTr4wwr5DxmOWRoRPmbe43LblB1h7vXTuOonVi1+SITe5wsu92p7PL2CFm4b1vPyMaC
 JU8A==
X-Gm-Message-State: AOAM530SJa7tPEHWeGTLW0Wvhk2vUQFEe03rSVJsuiu/6GtdLAD+zGVJ
 9rQHqXN3Dla7AA3b4lRR+ti1HBUl9pw20A==
X-Google-Smtp-Source: ABdhPJyw9ZuPn8elYArksqCRm7PFOyaRzMjNgJTe7TYjSofFpqJsQQ1vCXPwt2h7oMTtgpYVJ6zVpA==
X-Received: by 2002:a17:903:2c2:b029:101:9c88:d928 with SMTP id
 s2-20020a17090302c2b02901019c88d928mr17554990plk.62.1634408124067; 
 Sat, 16 Oct 2021 11:15:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] target/i386: Check CF_NO_GOTO_TB for dc->jmp_opt
Date: Sat, 16 Oct 2021 11:14:58 -0700
Message-Id: <20211016181514.3165661-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

We were using singlestep_enabled as a proxy for whether
translator_use_goto_tb would always return false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a46be75b00..c8d919bc3f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8556,6 +8556,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUX86State *env = cpu->env_ptr;
     uint32_t flags = dc->base.tb->flags;
+    uint32_t cflags = tb_cflags(dc->base.tb);
     int cpl = (flags >> HF_CPL_SHIFT) & 3;
     int iopl = (flags >> IOPL_SHIFT) & 3;
 
@@ -8593,14 +8594,14 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
-    dc->jmp_opt = !(dc->base.singlestep_enabled ||
+    dc->jmp_opt = !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
     /*
      * If jmp_opt, we want to handle each string instruction individually.
      * For icount also disable repz optimization so that each iteration
      * is accounted separately.
      */
-    dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
+    dc->repz_opt = !dc->jmp_opt && !(cflags & CF_USE_ICOUNT);
 
     dc->T0 = tcg_temp_new();
     dc->T1 = tcg_temp_new();
-- 
2.25.1


