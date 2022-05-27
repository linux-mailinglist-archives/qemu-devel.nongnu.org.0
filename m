Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21417536631
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:55:30 +0200 (CEST)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudFJ-00011l-7a
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8J-0001JE-G2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8H-0005O7-RC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id v15so4356157pgk.11
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8QVHsssV/N9S00mQXjYBPgFpjBb96NXM+kaVdZ/lRE=;
 b=e+X6FO9nsM/ng4sW2GgTM449USgBSDm4fD5KpBwjTFcq8hwLN9cGSCXPV2t13uOIJB
 gmn+0mnpg2MMmLv3qO8eKJpqJp2WbkOV2YqTdg56xmb8HdhMMiF90fD0PknJoWbs+SmQ
 2lAXySzh2nz6aLF5/88uSpoochFb0KQRGqagE+JSdy+NOACHGYfuEp32e+vE8+UXnSbL
 Coq5OmOghwMRvETwVWPZ3jQ3euyP6DNzdgRGCQNkDc5Fyu/JfUKjrVwcIq8ER4CnR9iE
 OJX6pNZx+oJDzS3jPn2R9byhb2pFuNk/81NCj9KUsoySngT8KQb/zSRwtu1GiuUr6dD5
 qp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8QVHsssV/N9S00mQXjYBPgFpjBb96NXM+kaVdZ/lRE=;
 b=7eCvQzgPiE+m+4+lRdgyr1dREdKCeVmdDkJY/YbQ7jQ5aV/NknXIiMSoj4z0hrX7gs
 RdEzRb7CvVgxrlc5gIWpizwRJxzxjOEhK94RpdBZBXGmD0DJLDbEfZGHHSxCBLjCP9mN
 3YYBJ23pi5Tp0/JYg3p1OhBGP5lJf+EX5NHi6xAo8/oHc5DK/joIDvA2ZFoIyHAWYld4
 7vUrVgK8oQGQbO1y/qwtKyxUc3+H+OCDPwBtLNhn43JwuZw48AGF3vWhavFAiu/766xT
 4XMfcMWM/Jj8E8qRKOBAKvnch2CiBclwrphi73OxthHwSshTwULoJjNfxBkBdill9uK7
 TEDg==
X-Gm-Message-State: AOAM532DkHALw2jAw9jjb8FBGwP4BKavadtqgUSOACfPIwFnYq6RXvKy
 nSgk2KpPMHuEJEInRmmrgFqB3BuWpOAq+g==
X-Google-Smtp-Source: ABdhPJxNxKGlLU6LZcC0w1PyjbFdPsJKLKHQolJ0s7i8fkiH2ZktF88RkJUbrzvm5P/L9S4fYvCM8A==
X-Received: by 2002:a05:6a00:22c3:b0:518:6a98:b06 with SMTP id
 f3-20020a056a0022c300b005186a980b06mr38627405pfj.3.1653670092519; 
 Fri, 27 May 2022 09:48:12 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 04/17] linux-user/m68k: Handle EXCP_TRAP1 through
 EXCP_TRAP15
Date: Fri, 27 May 2022 09:47:54 -0700
Message-Id: <20220527164807.135038-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are raised by guest instructions, and should not
fall through into the default abort case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 56417f7401..12e5d9cd53 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -75,7 +75,11 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP, env->pc);
+            break;
         case EXCP_DEBUG:
+        case EXCP_TRAP15:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
-- 
2.34.1


