Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBC36F3B9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:35:40 +0200 (CEST)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI4B-0005Zm-A2
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlV-0003EE-Qi
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:21 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:44862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl9-0007a8-4m
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:21 -0400
Received: by mail-pf1-x432.google.com with SMTP id m11so4195739pfc.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WLwfFICyGCDMWMxJirWXS2mvwpYV2dRQ+KP9fVeeh6c=;
 b=Ld8+sUbuBxFVwVBLdTSvXvJF2WGyYVVQI4rSnLkrPEoe8iinfOpmyE8WEswMciemmA
 eYK7h53cFU3OczsKpo64sOITMC0/BvFnH7338D0BebxpZxFPEGRUud1hrDU0qWMkAb44
 yzUvHBTwb6LbXckfMdypLOf/lsppqzgvvRoGnDRW/AfPeIT4nIWUCnKr/Uvr7p3tmXnH
 goVpRhVerQZmM39dJBYyzbilCeTUGhUTba1CogmHcyOV+nqrAlHVXPBtF1h6RurJoZQY
 gpbeJAAznN9LGxGKa4DETgjtnNIDaATFhxhL6kVvgz9n3oHjEmEcq4+wQmxq7O32siQL
 Lo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLwfFICyGCDMWMxJirWXS2mvwpYV2dRQ+KP9fVeeh6c=;
 b=ab8fE7BcrMLRp6dL9cum9ocuBIZokKYUhzXsp/pxSPsXzTkbIUPi5p18HJqwHB6kOM
 QhaCRyfYbvH7hv5uYEjgDdUEgzyp5ReImQ/M1sHULKxRFa1b9h1GigmSj2zhQXo+3uyv
 TOSRK3sZzdIP/x41e9SOqylKMB5S0FGcO06Q/MFLXlTcQviMUGym8nQAQ02gAwn9b51y
 PrZi9ktiC5uKdmH02rHxxilPtN2GlcKmafiQ6xIjVssdLqPgtvdBlWtLkpDTsDVtD8CH
 2oNwg64tIbWs1zGfFjGnS38B3mB9qwICYSSAGhpWf/z/bTjmn9o50GkC7876sCefRKPO
 JMpg==
X-Gm-Message-State: AOAM530ctGVvzRMrHt2Nuu9W9dHWQlVTJ97QUhYX38vGWqtY3nvimQ7T
 AcgQwrvn82YvrsWIYkvGE+x4jpeFpE1E8A==
X-Google-Smtp-Source: ABdhPJxCHeXWTQKbewlu0G8qMo3X2UVfU4i4usbxaGFzqoLAVCBkyhmzrrz9NDbrNv76EYN5dvLijA==
X-Received: by 2002:a63:190b:: with SMTP id z11mr2287503pgl.314.1619745357321; 
 Thu, 29 Apr 2021 18:15:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/30] target/ppc: Tidy exception vs exit_tb
Date: Thu, 29 Apr 2021 18:15:32 -0700
Message-Id: <20210430011543.1017113-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need to emit an exit_tb after an exception,
as the latter will exit via longjmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c018960ce9..fe3982e289 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3726,8 +3726,9 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
         } else if (sse & (CPU_SINGLE_STEP | CPU_BRANCH_STEP)) {
             uint32_t excp = gen_prep_dbgex(ctx);
             gen_exception(ctx, excp);
+        } else {
+            tcg_gen_exit_tb(NULL, 0);
         }
-        tcg_gen_exit_tb(NULL, 0);
     } else {
         tcg_gen_lookup_and_goto_ptr();
     }
-- 
2.25.1


