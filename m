Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586EF4128B3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:14:52 +0200 (CEST)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRYp-0001Bd-EA
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6p-0003xb-S8
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6o-0002Ms-AQ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id d21so33518594wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hcdc/mmIgCeyUTMws35ZeDR0xT8KVD3mt7/D2pvFUfg=;
 b=CD2PjDJ8GcdKi8ZMyxoeNrbQGOTaH2d0ott90B+x+izyIp/GjSRg2oAfGWRQxAawjY
 8AbOSza92y33EHanVFNqZZdzFlQa6k8mo9CmeuuiPKpotL1GRRRO/W/2ib63iGFJhsRu
 2rAFLkY/HTw+aZ8TR6Kzy6IiS4EIokNtymzUFTMS3m1+haHpNhPWYjPKPClT2/juwRF7
 zUgmwkPrb+wSWkusUhM/OX9AKsFX0tceja1WY8tilYZTsTsOXtQe5aNP+C8rzWvVZRqG
 h+0MtmhPH10hYs2Kb629KLU5wGVnpnNx2vWF823o2MaIHhO97obyu6WTQUfTIj5HLfJF
 RkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hcdc/mmIgCeyUTMws35ZeDR0xT8KVD3mt7/D2pvFUfg=;
 b=WAdSS9PEq6Z2TMKAIRWIQIUL2l4NEQEodvUj01Pfn/qGYKV73ldSbUG8AcLFPpsSrB
 PRSUqb1o3qqcpSXSI7/WGlWUKL/Gtm4UFo7mw7HfE2GiZ2KjZBZ7X0Ed1FidhpR3sJIg
 LR1a6zE/d+xenRNPMgqtgfwm0it48V8ZQQzCgBtGw8UcZIMducoFSDksxtohxZsPXH6Q
 OmeciQB0h8ZWajcVgm1efipvxVZU6pshmT1S8K4fu8a5GUb359eYynhmpocKSYw7RCPO
 yb2WZCor4DRs42jzfMdzE2/B2+DvshfLF7diHfBD06jrgErP684bMOMvwIj/uKUaTw1M
 +Rmw==
X-Gm-Message-State: AOAM533x4MrBaJhTN+y0dtjp2MgZXboCK+7LENRzJCvq7f/An9Sqw1aK
 qhSJePc0S4wE2eIbMd6WKoN6qyMRcjg=
X-Google-Smtp-Source: ABdhPJyU42dfyyv9jAFR2QokFLy8Pbwkteyy9lIVEemHSD0pyQmT2ZhSj27sRquhYGT9xocKKPwrIA==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr7033782wri.355.1632174352951; 
 Mon, 20 Sep 2021 14:45:52 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f19sm704360wmf.11.2021.09.20.14.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/31] target/hppa: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:30 +0200
Message-Id: <20210920214447.2998623-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bfc..be940ae2246 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
@@ -147,6 +149,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = hppa_cpu_has_work,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
@@ -163,7 +166,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
-- 
2.31.1


