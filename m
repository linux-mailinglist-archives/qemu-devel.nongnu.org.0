Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347A578896
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:38:46 +0200 (CEST)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUhh-0007WL-3w
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURz-0007Y8-AG; Mon, 18 Jul 2022 13:22:31 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:40880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURw-0001jX-KQ; Mon, 18 Jul 2022 13:22:30 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 z12-20020a056830128c00b0061c8168d3faso7941659otp.7; 
 Mon, 18 Jul 2022 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+zE054l+MqhuQhW7ZhFxFOtodBT53aNohUvmHGyfeo=;
 b=KoXakQM2AEwpOqk2tDjJ4kqO3X2cNlsWnvsSTOMQWcgNDCtgERzEdW2fnF7GLzVnFr
 I3rwhGQMNUJeL+N3Pr8XwTl0Qvl2sfoi2grnYboM3kufOgG/tbBbP+9/zdnj5Z4+MDPz
 Ktdsmo7m6OtQSPy+gj+QctzEYi4yG8NIbnpWssvbwO67MRdXh2ui7bTarCJSAHECPb/H
 Muqsc1buo9SnWdg3bpkP2CxfYt7nbFb0BEEMeAXSVzsLi9nzRtXhWUt4rUUSZ+jDIKN5
 NeHDGB74abjOu3I+CeZXi7G7UFiuXyZ2mL5kaTTHbv9RQLvOt+7CJqyfYafOxo+1QjyD
 jmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+zE054l+MqhuQhW7ZhFxFOtodBT53aNohUvmHGyfeo=;
 b=SuyHcAR92+nAFRhKJWBnKjs7kvwzcb2aGiKefvo70ZcYpVZ0Yp4pkZJe0PdWhWXGFf
 aUjyC05hUyrtxTd5w+tlkUt9kU9Aj0s0/HpGvYkdkF3EwB00QjMk+l7//RnVmfj1cFNh
 vgcrwPc4FKPIwHqvmtlZ5X7Xdgn3wp1dAuzWlGMfIcOPT0zyMXKnydBJnFSshUfIt3zt
 KjutqZXhsj3Mb1HPQn4uqb2/0+ZyUuKESemkUyxHPwOYii4cYch6iCnNEadR7Uhd0JOR
 KYKQItdFu5/Iwt8y7mIgWnKOTQev/10dK0kY1jBshj6QIS5/Vb16+PTC/s8hnN02hkaq
 u7YQ==
X-Gm-Message-State: AJIora/5aV6ItmkOkgW5yrRRO8FW4xaqPiZLf+lku7myLk0leFeVXXS+
 DKX8YcB/hY2BtVFxPs6Rqrvg3+JimuA=
X-Google-Smtp-Source: AGRyM1u3rQoHC9ZNrQH9OMMQolNWPElpLJgRSBjOBBL8lCR0sl0nnosRoWmlLkegAXuQwbD8CstM3Q==
X-Received: by 2002:a9d:6d17:0:b0:61c:b016:bd32 with SMTP id
 o23-20020a9d6d17000000b0061cb016bd32mr387600otp.74.1658164945955; 
 Mon, 18 Jul 2022 10:22:25 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 05/30] ppc: Remove unused irq_inputs
Date: Mon, 18 Jul 2022 14:21:43 -0300
Message-Id: <20220718172208.1247624-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220705145814.461723-6-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h      | 1 -
 target/ppc/cpu_init.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7aaff9dcc5..9b8d001f1c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1184,7 +1184,6 @@ struct CPUArchState {
      * by recent Book3s compatible CPUs (POWER7 and newer).
      */
     uint32_t irq_input_state;
-    void **irq_inputs;
 
     target_ulong excp_vectors[POWERPC_EXCP_NB]; /* Exception vectors */
     target_ulong excp_prefix;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 86ad28466a..769031375d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6678,7 +6678,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
 #if !defined(CONFIG_USER_ONLY)
     int i;
 
-    env->irq_inputs = NULL;
     /* Set all exception vectors to an invalid address */
     for (i = 0; i < POWERPC_EXCP_NB; i++) {
         env->excp_vectors[i] = (target_ulong)(-1ULL);
@@ -6808,10 +6807,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
         /* Pre-compute some useful values */
         env->tlb_per_way = env->nb_tlb / env->nb_ways;
     }
-    if (env->irq_inputs == NULL) {
-        warn_report("no internal IRQ controller registered."
-                    " Attempt QEMU to crash very soon !");
-    }
 #endif
     if (env->check_pow == NULL) {
         warn_report("no power management check handler registered."
-- 
2.36.1


