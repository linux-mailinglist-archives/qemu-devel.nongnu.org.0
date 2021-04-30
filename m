Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FEE36F3AE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:30:48 +0200 (CEST)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHzT-00084q-Ja
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlI-0002yk-WE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl5-0007Wq-7I
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id n6so1574692pfv.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YW6DwxqU5VNxXS27VotK2HOgdC1z8tUYOO4XDsjF6GM=;
 b=m+EFKGXtdfSaQsnwR1ioFH7mavQiNB3ojoFI5cTc78qG4g5uw/rHnp1YFBVCo7syLp
 hL+ITn2DsMEpnQFfrtOpWNyI8fDdN08COzH6lYHiwLA7BONNj9d3r+JXXW9Wnn/nE+z2
 78D5W8KmljGBJEyk+7nTYlE7YjMQBzqJUGbTe0MFs811zQx8h4MXY5nSR4nIoROjV5tQ
 MfTgEgwOHjWsYHjtPb+Dg/NciglNoUCT2JVZ+YxzW8uuHtIFskJ0EinRmZtEJXdiL/Rd
 lSXk1gCGQGLYm2cupSIeWaICdsuhBlxRQ7+ZfB4Xqcefsk8/a65zMaBCCaoJOWB1RIYz
 GbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YW6DwxqU5VNxXS27VotK2HOgdC1z8tUYOO4XDsjF6GM=;
 b=Bz/YrOMIHl6duMLPb+i6VjUKj+Z2ylzZB7VFujGKBtZU4/WJ9j6LaUt8CPBCNMk6t5
 b2GpA70M4eKnkEasyIOhTkAYHPW65GPjRLcSyDSQFTF/0EH8BP8Y5iQPGpnEtHJrQuQM
 wMKPpkblnV7WdPYEGRtJMj2IaAgC15wnV1cKz5x04ayCLxjgGyiV9M6h6wn8E9XfapSO
 9wy4+T+wCw6zG/jojlXaBqm8hVP8iD33LjWYqhfLVUs2rPogXBmNlKEHqqniHCV04HhM
 /0hG22y1JZ+8RVrf/AQf2hFFqxYIUp040CUhfNsb9d+dUHiDeRl5/VoDzn8ok5SmnVXk
 leLg==
X-Gm-Message-State: AOAM532nT7Si3AaxTS0zxXDcBL1fizEAwxfY94u/Mv9+XhiVFBmoUIy8
 xqvYvgr8OER6bBy8cPcRHIM61TUwo32vrw==
X-Google-Smtp-Source: ABdhPJxNxd0Y7IVxjzyhqygHgM+oVe/GUg/jRSff8/nHsrHv81w06PkkaLrekJvz3q+8mEDZTZh++Q==
X-Received: by 2002:a65:60d8:: with SMTP id r24mr2386645pgv.226.1619745350779; 
 Thu, 29 Apr 2021 18:15:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/30] target/ppc: Remove special case for POWERPC_EXCP_TRAP
Date: Thu, 29 Apr 2021 18:15:22 -0700
Message-Id: <20210430011543.1017113-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Since POWERPC_EXCP_TRAP is raised by gen_exception_err,
we will have also set DISAS_NORETURN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b26b6964a7..5efa4d6566 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8079,7 +8079,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
                  (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
-                 ctx->exception != POWERPC_EXCP_TRAP &&
                  ctx->exception != POWERPC_EXCP_BRANCH &&
                  ctx->base.is_jmp != DISAS_NORETURN)) {
         uint32_t excp = gen_prep_dbgex(ctx);
-- 
2.25.1


