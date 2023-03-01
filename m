Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80086A65F6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCev-0000uh-Am; Tue, 28 Feb 2023 21:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCei-0000TW-RI
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:24 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeh-000353-7V
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:24 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so11955147pjj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/m8reQ6d63n5J7x5SOdeVqARyO51vY+vuD9/Ai3rS/U=;
 b=UJ9bP594F+R6ihm63aQEqwakT24khgxs9zjuKjnl2UVdHwY0/mirCuu5Xb4T0O0spl
 AjfeAw3Ov2JeaDzrc4rCFNaRJB1NNndyqhunvcK1+pr2SGSIG4ZRpHvQt+jbfRdMKfb5
 U7sS2zkuqOY201wxnjRLgvgV6gYeDIUuQpux4JiSSDc7wk8fsSugSsW300Aa010RKUkO
 CsPfc9PQHxxufYUany4PzKLyvOQatsOWZdwUY5vexjyJudSIWiN7uuHgFeAnuv6y32bg
 R/rfkDAYrwA8z3mzjVOiquXP+VKm8ZHNIC/pWYIuDHXAXE9+pYJ5+XKoXKube3Cserqc
 CWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/m8reQ6d63n5J7x5SOdeVqARyO51vY+vuD9/Ai3rS/U=;
 b=1KTVf4C8Jlkd6IAXHn4xzg5OakwYHZM0yqdbcSt9XQWbcifpDwARqNILXho8W8UA/F
 Fd4iSvcOoeJZZp6SdpifCfqCyZwGkGn6YPq6hz4nXEZMgDn5cIxH/ZfifwbtG6MnBwMP
 n5T1WQjpgWcDEuJovkc8rGZaW3vKvLd+JhZhvY26ynOzFbjstyjYMLE/BVFJkI3qccSB
 wgSH7FNSi2tiBg8xjFFkHXnH5IHmMT6WcIkcrLvZhRwMzL17h4Atnq7BPT/IQ3g9bmup
 KVbMKSe4YFQOjZwimrTmFffo8KNC7cXbo2VgqSmc0j8nP50kqtBFHr5kzkCxPR6QgcQS
 jnYA==
X-Gm-Message-State: AO0yUKVeCQ8ZTVTzcAoBbmVuV5/emQZAsfiezN7aaemZzs6fKtVsfC5S
 DRh9UQgY5qqXGW4qYRyOBLA+k2K9r3nZsIz0pjw=
X-Google-Smtp-Source: AK7set+kcQzbYLZKdxBYJiqRGEnXMmcnioj+bD2Zc+yHI6zyY7JxWpDl3diOPFJ5t5ggtYJP9YiWFQ==
X-Received: by 2002:a17:90a:1a48:b0:239:ea16:5b13 with SMTP id
 8-20020a17090a1a4800b00239ea165b13mr3951428pjl.14.1677639442473; 
 Tue, 28 Feb 2023 18:57:22 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 21/62] target/riscv: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:02 -1000
Message-Id: <20230301025643.1227244-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-18-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 93b52b826c..9eb748a283 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,6 +34,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "sysemu/kvm.h"
 #include "kvm_riscv.h"
+#include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
 
@@ -533,10 +534,12 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     CPURISCVState *env = &cpu->env;
     RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
 
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+
     if (xl == MXL_RV32) {
-        env->pc = (int32_t)tb_pc(tb);
+        env->pc = (int32_t) tb->pc;
     } else {
-        env->pc = tb_pc(tb);
+        env->pc = tb->pc;
     }
 }
 
-- 
2.34.1


