Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDDD51075D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:44:48 +0200 (CEST)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQB5-0007qz-RP
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmW-0002Ui-A5
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmR-0004LU-Jl
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so2838979pjb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oKKUu+zNBC8As9SImKOzVlpqPHOufT8qoTmRma0rBy0=;
 b=d7T+4Pp0rVCuo539R5J9OMM8kKFfGyUSxwDi7fhYiuQfpCAl3x/IWqyrH2W0kQjPTT
 j7HH4XpDqo165mXB+QlJv/ON/Zr/qlRr6JeLZlKx9Ov8Lzmvwsxlu6/mOT0FZjdPOh5s
 eZ/iwiLBR3dh+zdS2Bdj8q/OX/Tw/DMum9dtcx1tOsmdhRIRISnbZGlKGTl4ROrxKaFi
 SETDBKOMeoyAfRMAWJx9wV7qkhqMARam1Z+prxBe83sqCBotbYBegKIqldV1hBqGq8nH
 Nwe526OSUP5RZqIUOGDgnSb0YL6IBSmHGbHCro7UryWYBxRT/uK/i4yTLH/KeO5pFaXk
 VSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oKKUu+zNBC8As9SImKOzVlpqPHOufT8qoTmRma0rBy0=;
 b=UyXpLnK/tHEuYjYsKw1xGTm8g6zTGFMHYzRw4iXggIP3xaxaQLtAlqq8loIsAJp6IA
 brC1T5dXmM/H84AqNmr2rOYKjY2mUxaNBdlrPn9S9GOQ8N8GnyhBslkX7+XcCwKmQe6/
 EGz0GSVywBRealeyviC+i67tJbJz/93WE3esbFiL6u2Sgi+GwNmonH2WhLybBVdIG61u
 P2x9RtFC3ScZT55ZJ3yMUl0xQostIWWKDg+nbWE3p+qFecrw0MXMSSnCU0GEAK9tUg+G
 iXPjBEcD+s5JVUkODYamIDvb3dW8Tnvi+LI2T09F2MsRiDNKUEH01uTEnVZkLWNl563k
 uxTg==
X-Gm-Message-State: AOAM531HwuBxzrwKPuhc7/L/PDn5oXFWRok7wvoVoZouDbIO0GdVN8Gr
 2tBjuvl8QV59K8QC2QC5X2Sqr2HglVmTuA==
X-Google-Smtp-Source: ABdhPJxpksoJgO3GG9lqquCwetwPCiIL+Wu505HY2NHwSNctsdYvNyjF36O6UIdhMWbwvJyOgA3DqQ==
X-Received: by 2002:a17:902:eb8e:b0:15d:11f5:59e7 with SMTP id
 q14-20020a170902eb8e00b0015d11f559e7mr11972478plg.32.1650997156487; 
 Tue, 26 Apr 2022 11:19:16 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/68] target/nios2: Remove user-only nios2_cpu_do_interrupt
Date: Tue, 26 Apr 2022 11:18:08 -0700
Message-Id: <20220426181907.103691-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Since 78271684719, this function is unused for user-only,
when the TCGCPUOps.do_interrupt hook itself became system-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-10-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..678fd96c4e 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -30,14 +30,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void nios2_cpu_do_interrupt(CPUState *cs)
-{
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-    cs->exception_index = -1;
-    env->regs[R_EA] = env->regs[R_PC] + 4;
-}
-
 void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
                               MMUAccessType access_type,
                               bool maperr, uintptr_t retaddr)
-- 
2.34.1


