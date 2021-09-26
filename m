Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E2418CEA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:56:38 +0200 (CEST)
Received: from localhost ([::1]:35222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUd4Y-0002He-0V
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceB-0004go-N0
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:23 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceA-0006eH-9q
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id r23so21141795wra.6
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=UIUb7sadFgD6y+fxEmMOn2j4/DG7JfNdNLbPAn4weFjAjGdxF6vS4SyAJOsphHGkV5
 i3MPqpOvlWUdAqpDfwgMem4myfmoH2x5m61HPGOokvXo/r+02jtvxL9Ct20TB7UhECTq
 q/NhAi7VrKwmOrusvphzuLU4rmfSk30loxsS4I9CsE4kuE9S+SMHQ8vIjRIuwk+zgXQ6
 JujlKamU543yEFwTYX1MQgsGbV+2ND9xodKvK7q7NpA/CSgUoCZodxtS3vZi0z9fG3aQ
 cf+mwdsc4V7EzBHb43uW7yuumPQHjNIeoAvfrgBY9legGVeMzF9ypsOgVSRAQouAMvNq
 DZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iR+hhecIhVQbqLgRtJRf7TAYJMYyVJckrOxOor2tvDk=;
 b=1sUf0yC7JsvtWE6Ds5caLBZUA9R+YWF5Ze1eyauV3dLHIktTk9ME2llhcDgeABv2+U
 DYjQMUmiANCRrMlZ+xG8UZC06qH3Qv0MjLwZkztFDD2gAD+zcBzLCODGQN/K3Ce3NyeE
 wPRCo0RNMn50zJypIAgreDVdCxwMZ93K74n63V2F+sj6kr1pol7576fxCN5JSNy8BLSU
 bikHZ4C7QEy7jFmm3/GpZZ4kwHIznFfziBSqtlZhYPvSWhNisZveNMwj0QVgzL9UEINL
 u5r4nvxWqMf4t/7enuSWUytW1eYFxj2tdb006qvxikBN41aSaSvz+HBnwgwt85SQQ2va
 PXTQ==
X-Gm-Message-State: AOAM531ryEt29artRorjnQB6aIKtm2TrulDIHyOlYaXXjMfqJfG4pHu3
 X6Of3bIphhbxKpx+Fr2XARPLm1t6fWA=
X-Google-Smtp-Source: ABdhPJxyxdQVgGjMOqTZ71QJ47AdlF4Wx0l/CJfhjtQ42Jrj8/59+r+aM4Hu2gXjEIXTJ8kkQUTqBg==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr24916339wrb.237.1632695360794; 
 Sun, 26 Sep 2021 15:29:20 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 v20sm15048016wra.73.2021.09.26.15.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 26/40] target/mips: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 27 Sep 2021 00:27:02 +0200
Message-Id: <20210926222716.1732932-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e4..3639c03f8ea 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -128,6 +128,7 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_env_set_pc(&cpu->env, value);
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -172,6 +173,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
     return has_work;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 #include "cpu-defs.c.inc"
 
@@ -542,6 +544,7 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = mips_cpu_has_work,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
@@ -563,7 +566,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
-- 
2.31.1


