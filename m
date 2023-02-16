Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87C698C53
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:48:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7x-0004EM-7J; Thu, 16 Feb 2023 00:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7u-0004Dv-I8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:14 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7t-0005Qp-21
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:14 -0500
Received: by mail-pl1-x629.google.com with SMTP id k13so1038769plg.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lqIPx7LaEGobxbwlMI298ZSHYBP2+86sibEgBn2WTxE=;
 b=vt0WohoA1cAZZ+XkC0u19HfvsvcOeOwvfQuPhMqa4fKBtv87tJrMT3UIZg7O0bfk7v
 PApNxu0mLvZgKpdHbIwaUCpD7URts1YNxJ6GqDxD+7ul2MlOWxwC66uLvK8OuQW9tsGJ
 Jd1Fn7kvsFRNCTJU8uvNSwC7xYM1XhVxwNyPYXi8aqnWQvahOgXCnqS7U2ylTvP1yvOD
 aZwzTlTUJOedFIt+0VpXCQF6CNtFbjyRAb8gGd8fHVFct7/qSrWO49L0sxF6RmgdhXQv
 5KPnBpQfxfoZaRo6HvTuZXG5dNIGpu50jRwLWPxpdu+zDa8rBS/Vn6+fT157QzngzfGU
 tKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqIPx7LaEGobxbwlMI298ZSHYBP2+86sibEgBn2WTxE=;
 b=qeCAd1oMaP/8cUAIoTHVrhu/MeQlAMeEaV1GuwSzbTJImzxG/aRNZlNw18dF3M+mRW
 lYfeV9OZT6pX6llIWVDVSmGH3e1nSRgcVjUKKg/R0MUzzxdxZXIsIE1Tkx7gwtK26fW2
 SsA+jlXRED1IfyRz/Ldd2OtYpqAgUhjL2hov5AsNpgy5202M3Wws223ZpxtDoHuo098/
 ReaxkAXbFjTwfMy5NgatNtD6xKqvOR7MvcCST73Qus2rNznSikNNt421dl8dSfzC57zN
 LYz+4uq3I5PCnlogJwSVIuPy2OuGaT/Uy+hf6SGHEsH6u6wXjlpz2C/lnysTp0bVbPs3
 WFTg==
X-Gm-Message-State: AO0yUKVQg3H7iv6uRy7FX502bp5+L3w2IBU/Y+cFbvC52dOqUDNyWFKx
 tyc01VDm4ygMTtVyU854ucOMUOMtHQgR2FV/R9U=
X-Google-Smtp-Source: AK7set+GOexSRQIIIyYBwHPd2QT5OyIjIFBkaiDTrryqSEZCieE909BLhO9P48ufxsMPtxYovrRbYA==
X-Received: by 2002:a05:6a20:244a:b0:c3:2bec:2afe with SMTP id
 t10-20020a056a20244a00b000c32bec2afemr1218127pzc.11.1676526491491; 
 Wed, 15 Feb 2023 21:48:11 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 10/15] linux-user/sparc: Handle priviledged opcode trap
Date: Wed, 15 Feb 2023 19:45:11 -1000
Message-Id: <20230216054516.1267305-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
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

For the most part priviledged opcodes are ifdefed out of the
user-only sparc translator, which will then incorrectly produce
illegal opcode traps.  But there are some code paths that
properly raise TT_PRIV_INSN, so we must handle it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index a3edb353f6..61b6e81459 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -303,6 +303,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_ILL_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
+        case TT_PRIV_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.34.1


