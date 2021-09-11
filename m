Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988E4079C1
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:08:37 +0200 (CEST)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6UW-0006ca-27
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IG-0007tp-4D
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:56 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IC-0002vQ-Oe
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id s24so3423803wmh.4
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J5rx4TkBW8G8gScO08U1pK8zY4A0mljSOlfasCw3q/k=;
 b=k6VhsEObtW/eX1GKZLHDUNac/HBrZsJQ0P311Ff3m5Nu3tXNGRusuk6iUAvTOubjLp
 BXzF4zEZ2LAv+Fz/ajGZ39N+fdHKp3tqgUQ9eJocMlYmbOKsWf2bCJho9lNX2WhmFU+0
 blwopjB8G9m5cH9FyWf+11GRHluhNst0PsgOSDTxDiZq1LiqPMVT1RroSN17pD/NrMTz
 yoN3uPEhvoFuRC5ccvyQETTWsTehBeQkKXVX0DUuFnlnw6eBYt4Mb7U5z/6C8Ab25qxS
 QPc5n9YtjmhYgKdF2fWkq+rHaT+Aa3qOHlqqNkB1e+4qkf3dgp2V5cmkiPLyFk220HdU
 jmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J5rx4TkBW8G8gScO08U1pK8zY4A0mljSOlfasCw3q/k=;
 b=avGC6NUp/wpqUyuf3wS1r8j3ds9sb5Cv8PBUuFCh1PBi2+98ZjegzGceCentwNXbR/
 zEVKlFub8yvGaFHopZP8OGjmSi2MK/Swdl30i+RGDNt9HiA1QSf5wXzhKiFmtvhNkpZU
 4C44D1phbFYV+88YnFD87s6Cmm034tXkoykHq4ubVbh6qUhFtGokxQs95j08HZMEO4Cu
 NkPqWkrkBHWrLGjbyz/4Ic7a3qn83ypg1r4ix6udUNFcuPgjigG9XiYvX4fugAiIQZsV
 X39cNBGst4U6x/utuNExY5qMfiXGiPGOEIk7R/PKBv6JKKEPdh9cQICDqOU/99kA7aXE
 weBw==
X-Gm-Message-State: AOAM533uoYSd1+EVfLMpfSRenJkdli+n49SksFH6OngH2kC8MX2MI1V3
 E3SH0oNBy7PqlsCttCwv3djKcsm1Emw=
X-Google-Smtp-Source: ABdhPJymL6EMN40D6kLo2zJWlowyX7kndrLw0tRcyocVrkVXHfRmoXmcELNTi9POM7LpOEzMR4yODg==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr3443877wme.119.1631379351224; 
 Sat, 11 Sep 2021 09:55:51 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id r129sm1979396wmr.7.2021.09.11.09.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/24] target/nios2: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:25 +0200
Message-Id: <20210911165434.531552-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 5e37defef80..947bb09bc1e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -127,6 +127,7 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     ncc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -140,7 +141,7 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
-
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -219,10 +220,10 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


