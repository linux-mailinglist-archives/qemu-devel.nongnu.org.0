Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16DD62DF73
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovgdd-0000T5-ST; Thu, 17 Nov 2022 10:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovgda-0000SL-AX; Thu, 17 Nov 2022 10:17:10 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovgdY-0004qN-J0; Thu, 17 Nov 2022 10:17:10 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14263779059so1675762fac.1; 
 Thu, 17 Nov 2022 07:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KW8qyJw9+BwOequ/igbnYDwU1KGG6p1xzQ1NgHCaNuc=;
 b=TSlFcnwYpWBmu4kOam4qitvnZQopmWBjcJcFRhV3SX0wL1aykxVb+Sd7NjBxL6jRQ+
 G7CTmQ6JaCFjsLvUH5ab18OgLynr6QQnzetBYzVMRMXHZQhHXte1e+9kjLVCL+ZTE3d/
 LhCO/BXLcrOR5VnZKKIDGJ/K8lcotgZvhEN00x0d1vtR9NYqxzaPJ4dtq8dCmt2S4IYa
 JbxuZOfTxYI7IahORwZwLLfWG07548qYmm8kxnJpYgGsFV+qhVZxDhrx77G7hvUWGzbU
 sMmzSp2izrXyG2B3XAurE5grbrzutYWQ6Qi4CO8wosxXWqNF1jbQR28PPsiIWEPkjqSO
 iw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KW8qyJw9+BwOequ/igbnYDwU1KGG6p1xzQ1NgHCaNuc=;
 b=ftwdCU+HPjhruTe8ywK4I/LTsCvDSlIUG0plhnapRHOH2q35OaDf4cLzlb2ou8fzFw
 ZRjuPtU3y9BR/J4lbw45PjVjcCuRvboBWoV4NZMRrS/1mLISjpGbzaCr5qk5hV6vvAcI
 PouKm9w+GQH3GDJqKprfqwOz6DOk8LvuzAv0wHvI0rORTUdGV4hKgMrJLqOAWptd4g6t
 d0mdr2SUCYXklK+Fg0dOwNooOn4EUg/rJaOEqUXAQwCcJXcAetCtjTUQCUPTFIlrDywV
 at1WMRzodi3CX01emzy+nXtprXdaiROpQrQ8UxX47lyKv1vl0j6+PR1/X2aRDn2UIjoS
 7AJg==
X-Gm-Message-State: ANoB5pmSZXmOa8Z69km1ipbkiSrtQPGKsSgjXKzsduDVFu2c5+fyYHtP
 oH13MgAKZhHcKhm75a//EypsuOxvBxw=
X-Google-Smtp-Source: AA0mqf6Yznt0xY3BuqOmSSEuNv2dWX4g0t1utF99ffRuZ8MW900sjxPfBE2ussXxwmp5Scs5clMt1w==
X-Received: by 2002:a05:6870:c34f:b0:13b:96fc:18c1 with SMTP id
 e15-20020a056870c34f00b0013b96fc18c1mr4541684oak.291.1668698226846; 
 Thu, 17 Nov 2022 07:17:06 -0800 (PST)
Received: from balboa.ibmuc.com ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a9d630b000000b0066da36d2c45sm430328otk.22.2022.11.17.07.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 07:17:06 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Kowshik Jois B S <kowsjois@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 1/1] target/ppc: Fix build warnings when building with
 'disable-tcg'
Date: Thu, 17 Nov 2022 12:16:57 -0300
Message-Id: <20221117151657.182061-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117151657.182061-1-danielhb413@gmail.com>
References: <20221117151657.182061-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Vaibhav Jain <vaibhav@linux.ibm.com>

Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
target is failing due to following build warnings:

<snip>
 ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
 7018 | static void ppc_restore_state_to_opc(CPUState *cs,
<snip>

Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
they are only defined if qemu is compiled with '--enable-tcg'

Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
Fixes: 53ae2aeb94 ("target/ppc: Implement hashstp and hashchkp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
Message-Id: <20221116131743.658708-1-vaibhav@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c    | 2 ++
 target/ppc/excp_helper.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 32e94153d1..cbf0081374 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
     return cpu->env.nip;
 }
 
+#ifdef CONFIG_TCG
 static void ppc_restore_state_to_opc(CPUState *cs,
                                      const TranslationBlock *tb,
                                      const uint64_t *data)
@@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
 
     cpu->env.nip = data[0];
 }
+#endif /* CONFIG_TCG */
 
 static bool ppc_cpu_has_work(CPUState *cs)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a05a2ed595..94adcb766b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
 #endif
 #endif
 
+#ifdef CONFIG_TCG
 static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
 {
     const uint16_t c = 0xfffc;
@@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
 HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
 HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
 HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
+#endif /* CONFIG_TCG */
 
 #if !defined(CONFIG_USER_ONLY)
 
-- 
2.38.1


