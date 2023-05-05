Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337726F8AFE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:28:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vJ-0000fA-BV; Fri, 05 May 2023 17:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vD-0000eF-ST
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vC-0004R5-9Z
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso1503628f8f.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321897; x=1685913897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v0deTbEGbpLLBkwrVJC8/AKUmMSe9YNlMldt/k2nv5E=;
 b=Klmm+Xgd3YDrAU7VCfZMyG7dkTB4ZasKyhx0bf/9SqWa7oImHc3WVKls6IXTT++cKe
 2gcPl685cTOusq+98+SbSnc9lFLydMvZcChikF89cw7ULgteZaP4PIfJe4NtTwwb89Cc
 7h6+wpPKzObT4y730Ru5LjXMyh6lo5zm1Ux2ojLR1jK3MFuDUVP//j+LBO2sobKUfXm9
 5PKO5wZwHAvozef+CgidKtyKEEA2pVlQmMMxcqcZMsOsjsMYJRIZ8eNqv9RXCNWP6vO9
 k65qcVPmy6MvYNG4USbVMC+8YqDL4B+ry2Yeg/fuPEl5gkpKhpvbcNIUAKkuDiLAQ2Ty
 28vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321897; x=1685913897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0deTbEGbpLLBkwrVJC8/AKUmMSe9YNlMldt/k2nv5E=;
 b=c0bL+ImYTwykh6m7eBisKcOzAvnlzX5Kwr2A1NJ/YRiiPm1FIGJSPhxDjM5IrpK+6T
 zpV4M5wFZhwhw6FbEgpSfWWxPw9oRUIB85/+C96WLGTlGke5XWmsNEaSPa6cbpboLqOH
 wUMOiZoMS9E5ZbVCOE8dIwnNpd6Not50Ty/a0gmsmrLEjS16jlyFuXRlUQjiiLyEy7av
 jxSbRN5iEa6gyG4ITior+FFclvjkFkCH+T/krlVG3JMxnK+xC+LUPeTKCY6dvHpYR099
 /NunFdGCiuhrETgMYLfLqCRzv2MnUe83clwZgVbMV5UINhyOjNk9GIfwQLvzarNb6Got
 97Ug==
X-Gm-Message-State: AC+VfDw1ZWTXskuRUqHHiA5CLC9AXaswrAncTt7PT7/8fBAJZCpVxM0D
 vPgvggc1697sw7Op7OsfX4P8u3uDcM+c8cWoBaQd+g==
X-Google-Smtp-Source: ACHHUZ6jrP47d2gJrYYYFR1yalB0uxVOoky2VJLOst68/qLdljrEXyTh3I0ZcBHMwqP3opzmqpZNJw==
X-Received: by 2002:a5d:48cc:0:b0:304:adbe:ea9d with SMTP id
 p12-20020a5d48cc000000b00304adbeea9dmr2436798wrs.30.1683321896898; 
 Fri, 05 May 2023 14:24:56 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/42] target/hppa: Use MO_ALIGN for system UNALIGN()
Date: Fri,  5 May 2023 22:24:19 +0100
Message-Id: <20230505212447.374546-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 6a3154ebc6..59e4688bfa 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -271,7 +271,7 @@ typedef struct DisasContext {
 #ifdef CONFIG_USER_ONLY
 #define UNALIGN(C)  (C)->unalign
 #else
-#define UNALIGN(C)  0
+#define UNALIGN(C)  MO_ALIGN
 #endif
 
 /* Note that ssm/rsm instructions number PSW_W and PSW_E differently.  */
-- 
2.34.1


