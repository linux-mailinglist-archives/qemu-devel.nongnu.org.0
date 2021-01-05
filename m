Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086C2EB184
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:40:11 +0100 (CET)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqJW-0001nJ-AN
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq09-0002Fo-9M
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:09 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq01-0006Qi-Jq
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:07 -0500
Received: by mail-pg1-x533.google.com with SMTP id v19so255043pgj.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNa3juN30sBbMGsW4bu1mvrrXIbWt9bpEcnE51uKtNA=;
 b=cftMLHpdS9X6G84jy/FqciZTdu1cuomAirdWqNYDhwQL+3acq975VoZFlitNBRglQ5
 mn/eLmW57v2WoLmJfQY/jQkEOvQUqky3X0pLDzb/NAz1MayZ+WJTK/799D4+p6e54XtR
 4EZt/bnf++jFL4R4Mzb5qxJsZjo6f01dudYinjwPdWCIrfUEhyfpeQkfoa2b4B91/TL8
 cNpZVBGyfH2a+AZvtmqgLxuAG/m8aNYb2fvNtt3lybsTVQDduiNeh0Q7eeMi4KtUPfcG
 6JPubMhV70qmIVdbz+HWa1xnZ/U2olMeiV/m+KNF1D6J2ufeDYWDuwglCJlo2HvuJFs5
 5pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kNa3juN30sBbMGsW4bu1mvrrXIbWt9bpEcnE51uKtNA=;
 b=W6pcoAegUySeYxm9j1/As0I5czXbPFB5aSOdO411M+F2LZMsxbUgwKMfR1evSvAyyp
 R6F0N7gzNApwglZLQoO5q+HfI0/+R0zc6fpSf8jVl8FXy0QOpDr6rZ0t/lRQD9NONLjN
 ZdWGyeX/v7qkAc4OqYHfv9kytlRAOYumJgtgklSXkvWT0e/sYfuyAloGIDTl9yDjjn+n
 beufOL2ENyb3Ugooj51lMESe4r3jsegTzcn05hFl+o9C64BIBQf/9IMqG9r1Kd118XcS
 J5edy9r8hou/ZzhQLS2A/fyPmmfWVBQkJLMtyo8QAgGefOtLWro8hfqhvu0cz+2DeTU6
 Rjdg==
X-Gm-Message-State: AOAM532VzQ4TIt6SL6vBDJ5Lpo7F9wKjTYHfa2LnChbOgDXIjXLbzyCk
 qGI0o537yR9npUB/f5FW+bUlYR2n3lE5BQ==
X-Google-Smtp-Source: ABdhPJzzbQ7sNc8IL/NBONumAC2Vw8hDz2tqGRM0jfq08J7Vey1l14caJNuGCTzZrj6/u11DT7q2OA==
X-Received: by 2002:a62:b415:0:b029:1a6:8b06:68f4 with SMTP id
 h21-20020a62b4150000b02901a68b0668f4mr193965pfn.43.1609867199868; 
 Tue, 05 Jan 2021 09:19:59 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:19:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/43] tcg: Do not flush icache for interpreter
Date: Tue,  5 Jan 2021 07:19:08 -1000
Message-Id: <20210105171950.415486-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is currently a no-op within tci/tcg-target.h, but
is about to be moved to a more generic location.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 829d4296e0..df2857dc88 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1077,7 +1077,9 @@ void tcg_prologue_init(TCGContext *s)
 #endif
 
     buf1 = s->code_ptr;
+#ifndef CONFIG_TCG_INTERPRETER
     flush_icache_range((uintptr_t)buf0, (uintptr_t)buf1);
+#endif
 
     /* Deduct the prologue from the buffer.  */
     prologue_size = tcg_current_code_size(s);
@@ -4323,8 +4325,10 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         return -2;
     }
 
+#ifndef CONFIG_TCG_INTERPRETER
     /* flush instruction cache */
     flush_icache_range((uintptr_t)s->code_buf, (uintptr_t)s->code_ptr);
+#endif
 
     return tcg_current_code_size(s);
 }
-- 
2.25.1


