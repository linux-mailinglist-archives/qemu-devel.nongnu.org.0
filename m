Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE476EE887
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:48:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOS8-0006AV-Cs; Tue, 25 Apr 2023 15:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORh-0005Tp-JF
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:25 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORP-0005Lp-Ec
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:25 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so26825484e87.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451304; x=1685043304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eK0NEMONjmg/1ucpaSNt26amgB3shibpw1tARmPQjiE=;
 b=JAGwvaafapQwmMsl+A0SFwjFn3gsSFSfYOWnUb3D7UsviPVpuhCvdkNJ6UTlTfHX/8
 /AQMXamibfOmKon7evVEWelZMa7kzv7WRavTmhs2nzKbLTtsbQNoxt+4TAtUrCPE3WUH
 Rb95VAhzQ83X+JFR6kQaBcIeTNSNPQ71hXj616XLUqs9oyUjwlelwMFC/QDEpM5C2DUr
 YwyjeVf4zVUbecdM7ski4KztZXetMOC+9QUKoKSuVEXqo+IEjOhF4i7bSrjkjLufPss3
 m8vxBsmh+oxF3e7omK5GOXUuEnu5x+Gb+9lU/pNF5tMzFlKVNqJANLcm5lKxGud+38UX
 PWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451304; x=1685043304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eK0NEMONjmg/1ucpaSNt26amgB3shibpw1tARmPQjiE=;
 b=RxRMCe90aWw2Bs2Xk46pZIZLTZjDBlCzMu4ijig7WbzU9gF0cdPiO+VZQfXhRqDMgp
 iC3pueAAe8Bil8FadhHX9sqUgjr3+RvOYewP2qmRE+3HkOPo16Qj/aHsL7DWFHgdxl8W
 +2GP6ubpq9LRZ9J74aFJa8Xnx6uNmGdNBrNMDpy0ejN3UTGvIegauMulaylATUQz9d3p
 x1msQ7ZcrIyoxY3TG45kOhTkgft+KHnkUY7QPKefArsUa43v75jtwEJpJufrXSPfc4uQ
 hqDww3pgwDr/LxkqXAM05AQw8l7qirbCUsrISb7Yis7PqB3Pn4MeXZVsTfyisL8N7ofV
 bjgQ==
X-Gm-Message-State: AAQBX9c2vxpW6rcJnB/pSLMpf9uTJXY8uMFnI6+XXlBoqmYf8J2sJWBk
 3KdgcEFkA6unEA7JiEzAEW6dDncNWLexeQjoh2Ns0g==
X-Google-Smtp-Source: AKy350YbaeHKjfb5Y4U8/Hdu6CEVshiFTJrHjJBJ25nQUPqma0TZk3muie7Wv2MacL9JfR9GvLsWbQ==
X-Received: by 2002:a2e:aaa3:0:b0:2a8:ea1f:428c with SMTP id
 bj35-20020a2eaaa3000000b002a8ea1f428cmr4079149ljb.23.1682451303827; 
 Tue, 25 Apr 2023 12:35:03 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 35/57] accel/tcg: Remove helper_unaligned_{ld,st}
Date: Tue, 25 Apr 2023 20:31:24 +0100
Message-Id: <20230425193146.2106111-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These functions are now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  6 ------
 accel/tcg/user-exec.c  | 10 ----------
 2 files changed, 16 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 64f48e6990..7dd57013e9 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -60,10 +60,4 @@ void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 void helper_st16_mmu(CPUArchState *env, target_ulong addr, Int128 val,
                      MemOpIdx oi, uintptr_t retaddr);
 
-#ifdef CONFIG_USER_ONLY
-
-G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
-G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
-
-#endif /* CONFIG_USER_ONLY */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 98a24fc308..b6b9112118 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,16 +889,6 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
-}
-
-void helper_unaligned_st(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
-}
-
 static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-- 
2.34.1


