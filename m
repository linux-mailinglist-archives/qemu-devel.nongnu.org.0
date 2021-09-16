Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA75F40DE47
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:40:32 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtV1-000129-OY
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLZ-0001Q2-IC
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:46 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLR-0002Ui-DY
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:44 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so6334303pjb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePy6aN6lFva1+oLoEnr79Yb8aPoSMIJ8GBwpmOsa/Yg=;
 b=zM61HbEkl1c783RInvmFY7x5NS3QLwdH0K05kzTFWbwzhedwGSt86lrY8eaOfJtHmt
 S0QlgAg/kjW0E4DFwi+n1rcg0GbZ3LATp5karnfKDubX3st6XZbdQHzOys53C/O/YneE
 Tde12SaNrqiPLqb0LofT4jnIzpFtu/fv90w6TxUVkA7KuMKwgpO60EBWtU36kiriEycV
 RR+OGfYLIaHwkiqq3DAP2633nNkv3nvnEGsADHUktWcRVHnD2ZNf8aqWvmpDI+d8fqla
 4Fi9Y8m+51r/n3bgD86UWr6AJBZPgojwOg3AQB80Y+jM9c0jyphFxshn5wi9RqbbiFM4
 sxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ePy6aN6lFva1+oLoEnr79Yb8aPoSMIJ8GBwpmOsa/Yg=;
 b=wEfLN3la72BwYrSnrC7Ef4GKW169yNJLjLuiealypMGj9L5SxRj/uOtMHyz0afy4Wc
 behi4mKIp0bJ7tkgi/j0j2jYokrf8VzQrJwAJynXda0dDvE012zplwZZbgWlvJP6sZ0k
 ADa8mx9NI4N+sYrzqrPNztif3xXyWqB0sBBqUkREluXqQP1jqPkjz842/LxafGXIE/Vx
 +jTlYjFongUo6wBLV2KesDFUc+gBWDWSALgKvoPUoVI35eAam1GdtIhvXhqQ8NyRN4DI
 keFYZx4ONlJvZn1VAvXsWyhHeSBx74olO2oNf0OC6ZNazFEaB+UpfZgmjMM5axUQyFn7
 PSsQ==
X-Gm-Message-State: AOAM533dN32CRCNJ+joDr1Y2qdwujPCu8A2Immwr2v5n0jnHRtvli3rM
 VOjJp6aD50Kwt7fY+nBDPseXdzxu2XtQwg==
X-Google-Smtp-Source: ABdhPJyxGaznb3O46qykn/DiYMW2e4MtkftaOSr6EyirSNlczSv+3JRw3eigazXuk7Cg55kgm5haKw==
X-Received: by 2002:a17:902:8ec5:b0:13a:2789:cbb0 with SMTP id
 x5-20020a1709028ec500b0013a2789cbb0mr5274397plo.60.1631806235961; 
 Thu, 16 Sep 2021 08:30:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/35] target/hppa: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:04 -0700
Message-Id: <20210916153025.1944763-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-14-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bf..be940ae224 100644
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
2.25.1


