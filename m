Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD482EE6AA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:21:48 +0100 (CET)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbn1-0006H1-TV
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgY-0000nv-O2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:06 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgX-0001Qv-3u
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:06 -0500
Received: by mail-pl1-x62a.google.com with SMTP id r4so4138876pls.11
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gV4erddw36/IIPMNTq7/TG+v9uQaJ4h6PGeY7YFnJXE=;
 b=MGdg3hW9mpqrANmVNloy8K1Y7iwoqp0r2s1vS9+Vri0F3szG0BMbplepxxRQJ5QcmZ
 lM6sBiblhbM2+Jn5ChYMW/G6OcyIxoUOB9JVuLcKDd9kyptWJhsjHnRSaTJhAlZ4Sm22
 hUWjIyv6Qnno4Gu2YIyS6XfB/655ZMMd2O2bkVhSjKAI4Vvreik/FRi7DLfyQV3peAQ/
 dDrF5kG7n02oNiC+uEhGV7cODwLuYXkrsBVCiYhq+kg4IABfDjN1xDONweIatlIybK/x
 ooJy3vq8waBEzEK7OwLZSH+tcbgMlaWVsKXnP3GIA/OuSHhbVjjPOsh3TYyImhFIgDPb
 lxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gV4erddw36/IIPMNTq7/TG+v9uQaJ4h6PGeY7YFnJXE=;
 b=Mdr4sz4wQ5KnjKCQZxv2fxRTXMMp49Adfix5ofRC2XTqjxx2pYdK8zypR86r1GJz1A
 1fJ1gaSI0YbRhuURlXc9/EjjCxnJ/3VVkEF89p5laCp9eNyVDz+a7XvTJFmlquPYniZS
 wDfgm6X4XhZ736kgHnU2BYCd1OhWZiNw5Y8/9xlsDrx18QAihoq5NBaaO+9Nqd9p4/Y+
 YdTKBYUbg0AuaRmkNtu1zru8qrUEFP9zv4NPYCoktKeratGZJSOrlGTl7QdDlMn3jVqb
 y7Q/UOWscoSHp7MY5V9GBo91lXAJUhxmpiHx7+JatadKB5d/ZLQuTO3X7sskro4u0kBB
 UTTQ==
X-Gm-Message-State: AOAM531JIuhvgPN64v1LeS9ZRtI474xDgkOAs+Cn89BGspXjkauxxDEw
 tvm+8oKzQNmUJzrOfVERgO5kUxn+lB1BjA==
X-Google-Smtp-Source: ABdhPJxDzOInBRVXBtQAiBXXHHt9Ls7m+d6W+HiybxW2Vt4v6d9n+ejjV483PV5uE+Qdt9Vq/KjfVQ==
X-Received: by 2002:a17:90b:46ca:: with SMTP id
 jx10mr183218pjb.208.1610050503123; 
 Thu, 07 Jan 2021 12:15:03 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/47] tcg: Do not flush icache for interpreter
Date: Thu,  7 Jan 2021 10:14:07 -1000
Message-Id: <20210107201448.1152301-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
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
index 95aacc8597..9bdc450196 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1078,7 +1078,9 @@ void tcg_prologue_init(TCGContext *s)
 #endif
 
     buf1 = s->code_ptr;
+#ifndef CONFIG_TCG_INTERPRETER
     flush_icache_range((uintptr_t)buf0, (uintptr_t)buf1);
+#endif
 
     /* Deduct the prologue from the buffer.  */
     prologue_size = tcg_current_code_size(s);
@@ -4324,8 +4326,10 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
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


