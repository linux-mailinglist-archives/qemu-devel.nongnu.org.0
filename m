Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83F63D9AA7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:57:38 +0200 (CEST)
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uMj-0002Cm-SD
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCP-0003ub-Tj
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:57 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCO-0002OI-BV
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e5so4858329pld.6
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dn6B0Ee8lUtbxJq9t/+3kZTnEWW7d7P7paI/3Q/udV0=;
 b=DmjfpAlwhTHfZkB0b2PbeYLv9A1qxwmfH0J3Q5aFjtrSTQGgbaCbIMUZxqIH+XIaqn
 E3Hvb1HXCKkKroJfQ2SFXtOCttGDSKvsljNepkygkOozO6eELECbelIGCj4BS8wkFHy/
 I1oBHhJxrMBBIWXt0xeOfvrzj9HVHjGHGUSOMDQLS87AGuNka0KJl+JO+Ok0ZYhSqMtA
 t+XCcZGECSgFJ9wO0NB2FmXWunHZ72J/PD3wINt9GxExzya0fLgfab9hYg7+wVU5RFWG
 DZVGYNJS71VOv6mApzVYBGBzoQWTMHsKMBpPRD4PgtCUdGqukB0hxXQ1iqeE+jd3ZZ/w
 S5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dn6B0Ee8lUtbxJq9t/+3kZTnEWW7d7P7paI/3Q/udV0=;
 b=ougUhHjVP2Ha+iuTCmE1GPQ8anYAF0Hr6Et7GNWVI6g8gWh28v2TO5G7Dm5PLQK3ss
 UoTHZpVoA5kDIdDt4fNZzghJvjSNIrr74pV4J1qVKGA3Vk2b276p4GNz5/8y8lO0WRgS
 5augsh+vPoQEekQT4wtBg6AI1MNeQEvQAe9m/JO7iOxfZZf//4xbqHZhfRBodVGpJv7K
 xxqoO3XRVFIVQP5G/1h+4V7nUJhMDMy81mqWkuQpJ/wmV2/7dpF+IasTRomTqf9Ymd+W
 9q1sxD32pG+AzgmLQnXysaUkU4Tpq5IlvWqSgF8mgeRxqIfbWX0MRA7LDAbFX0X7Q/OV
 dtgA==
X-Gm-Message-State: AOAM530GRz83vIPD0a4AKB1nyodgEreDSYbhkrtZjiCrQ3CL0hwm9i/d
 fsk1auxBkGcf/PLgiivUMTpYlBkEIvmZgg==
X-Google-Smtp-Source: ABdhPJz5hE3JWFhsiFOYiMVK1Lw2Sc/HJrdFjSX65AsRKKkHXtnMnjPY4C9EtHA0l9sKRgjxrAFWXg==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id
 c8-20020a056a000ac8b0290320a6bb880dmr2269899pfl.41.1627519615116; 
 Wed, 28 Jul 2021 17:46:55 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/43] target/hppa: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:08 -1000
Message-Id: <20210729004647.282017-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 2 +-
 target/hppa/cpu.c          | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 82d8183821..5ce30fec8b 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -161,7 +161,7 @@ void cpu_loop(CPUHPPAState *env)
         case EXCP_UNALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
-            info.si_code = 0;
+            info.si_code = TARGET_BUS_ADRALN;
             info._sifields._sigfault._addr = env->cr[CR_IOR];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 2eace4ee12..55c0d81046 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -71,7 +71,6 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
     info->print_insn = print_insn_hppa;
 }
 
-#ifndef CONFIG_USER_ONLY
 static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                          MMUAccessType access_type,
                                          int mmu_idx, uintptr_t retaddr)
@@ -80,15 +79,18 @@ static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUHPPAState *env = &cpu->env;
 
     cs->exception_index = EXCP_UNALIGN;
+#ifdef CONFIG_USER_ONLY
+    env->cr[CR_IOR] = addr;
+#else
     if (env->psw & PSW_Q) {
         /* ??? Needs tweaking for hppa64.  */
         env->cr[CR_IOR] = addr;
         env->cr[CR_ISR] = addr >> 32;
     }
+#endif
 
     cpu_loop_exit_restore(cs, retaddr);
 }
-#endif /* CONFIG_USER_ONLY */
 
 static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
 {
@@ -146,10 +148,10 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .tlb_fill = hppa_cpu_tlb_fill,
+    .do_unaligned_access = hppa_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = hppa_cpu_do_interrupt,
-    .do_unaligned_access = hppa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.25.1


