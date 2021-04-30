Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9536F399
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:27:10 +0200 (CEST)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHvx-00043v-7I
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlF-0002s4-Um
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:05 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl2-0007WF-3N
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:05 -0400
Received: by mail-pl1-x631.google.com with SMTP id s15so7323302plg.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4VcD0HXsANNijrzBkXm424aZmwDpF4g6Adk9HJA2tSo=;
 b=ctn207bSfrzmA32Jl+1chgNcjdlBWFq+WjDG6+LXzs8pEpYodfQvRlZUajmwqFitKn
 tBb3lx3jpzv4G59wb7Cmmo/KZ507CIHeSfTtIiRNROMv9ZRnUnAY01kKggQOF4SMzAK0
 pcI7B+m87wnC3nrPltrLaYZL1m8+/PyBLCeYi3FuhiDCdalJYw2kRbX+rEaADmuVqIk5
 3TMSA9C2Qnl3GwxFP1/ug4E4C9GmkzHmYp0ZueYt+ZM5vNlttXeBCXSpoDtX/9c8XHIj
 JwZx+fdGs6GtXxhhLMkT5MjOlSHub6Ya2KDpUwe7V2uqA8n1QnjvgQGb244Z6o2eBrGE
 sNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4VcD0HXsANNijrzBkXm424aZmwDpF4g6Adk9HJA2tSo=;
 b=PmHPDGQfYFst1ISLw7HUP7SVTVxt0lYRwmLxGXlDSt+4yNvPC2nOD9F7qDjs4vCxED
 iQ8g8Jp7uscH1QUW2eql7404x3/BvGyewDwL1u1hqAe3GDALbgJBjLlKH4tFXvmEJDoS
 +pPzafo1ua68MwR8+7aKti39zmWVGxyh4ivtiDGjgFXE64/XKRxpwxeGKTGc4jb3ocOi
 rDz0lQjVGCcsuvSiPHA2tJaykto41XgZfx3XfXgtuC2zQi8uos+sTnL19RKrus6Y3zeg
 TOGmEWtQmCFw83o73U90FROWYd4QJ7hsMBGY4ATFZ9qoB9VQZkjZHB8f4jHNs23ZOpIr
 hZDQ==
X-Gm-Message-State: AOAM531tCmp21fZCjSOPSQmNyBFNtD/+eD5KgO58foCxcSbjUEfu25+a
 drUk9gP5aT+TVR5VG0g1Iutp2cnNHSJijw==
X-Google-Smtp-Source: ABdhPJzQ/JTBgEYXkoRjmfrR+2TwricHQiT5/yHj6MY1n1gImGHvOySjpl7Ua/oPUWEN9+mOTh3Q6A==
X-Received: by 2002:a17:90b:958:: with SMTP id
 dw24mr12001633pjb.185.1619745350172; 
 Thu, 29 Apr 2021 18:15:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/30] target/ppc: Remove special case for POWERPC_SYSCALL
Date: Thu, 29 Apr 2021 18:15:21 -0700
Message-Id: <20210430011543.1017113-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since POWERPC_SYSCALL is raised by gen_exception_err,
we will have also set DISAS_NORETURN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 3607cc12f3..b26b6964a7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8079,7 +8079,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->exception != POWERPC_SYSCALL &&
                  ctx->exception != POWERPC_EXCP_TRAP &&
                  ctx->exception != POWERPC_EXCP_BRANCH &&
                  ctx->base.is_jmp != DISAS_NORETURN)) {
-- 
2.25.1


