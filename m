Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D393614056
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:03:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcqo-0005Nw-OH; Mon, 31 Oct 2022 18:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpw-00058U-4B
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:12 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpp-00012a-2Z
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:00:47 -0400
Received: by mail-il1-x136.google.com with SMTP id g13so6941682ile.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOdXzBtc2v5d4XikRWSfEnKvDOw4Q3NHgTEa+Mbf2Sc=;
 b=eSMFjYzy8mssJ+u6aKX3H1iEwaSFBU5ETndMtt3miwoyG8p28aliYJQi3wPrcA2ipv
 MqQFGfTdQEgB6SiCUwuafYQNn0sHIT0BpIa6JYneW8TxCl/Do/4yznt7104fu2pIwSAn
 U70sEzoUrAxWaDfO/m66fjJcrXkPfIX4mXOvvXm8yoTvdizI3sL/ZVrFo0TpybU7xQts
 0iey+FYijO2ZxTEgOwzFq8IuLKf8y+uqYsCN0PZ10WNphcuJM+Ou2Q+/vFBwPzvECS94
 qj40VmhNH5efpNXqGU9rA35iPcr2zMVaAaiEL/poQILcLJtNx13HdpGCDT+rjjNMHVFH
 CTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOdXzBtc2v5d4XikRWSfEnKvDOw4Q3NHgTEa+Mbf2Sc=;
 b=WH/lZu2ZQ/yI2zZYBir6WglD/34ucUhF/5cMNrrhAV0tkF074/CY4/HTFQmnTPD/jb
 F9LnhZkBI2Wxu6E4M+spqCdDzolZZV7MxE47jyUwMzDh+zv54grUYL4ur0YqMQhkQUay
 Okn2myYP63fFOIDY67RuHZTscVcUOQhY8LfrmbiG/DXrR0RbDG6t/ycjrYNr4XybGOfw
 N4jyPucY/Gbgwx88AiwNia4vALm+FdFgPXSEhl60uH5UzHVIGMQF2yzN1BoAgShAZOuR
 ZwBiUP2lNU6crS/EYWOEy+QYA3c6jazLoaS0Mw7oUa0FRp3nr3q741Ov0j9FaPVgpfy7
 6Yvw==
X-Gm-Message-State: ACrzQf31jtYEyZMpEaisJRPOzfcFxIXeDWy/NgzNP4JwpcffuqhS2YKS
 yrVfHyizkJ4ogby69cfn99AuHZ9GoxNz+Q==
X-Google-Smtp-Source: AMsMyM67bC8u4EOq/RIAi3ewXiM4ce/XtW1Sv9U+62wBmoEgAQMCR412Uyu7IW8XaGCs3MjHXdH4pQ==
X-Received: by 2002:a92:d4d1:0:b0:2fa:f0f:944 with SMTP id
 o17-20020a92d4d1000000b002fa0f0f0944mr8229579ilm.125.1667253643801; 
 Mon, 31 Oct 2022 15:00:43 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 d6-20020a926806000000b002f9537986f3sm2916853ilc.24.2022.10.31.15.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:00:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [PULL v2 06/13] target/i386: Use cpu_unwind_state_data for tpr access
Date: Tue,  1 Nov 2022 09:00:17 +1100
Message-Id: <20221031220020.414768-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031220020.414768-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
 <20221031220020.414768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Avoid cpu_restore_state, and modifying env->eip out from
underneath the translator with TARGET_TB_PCREL.  There is
some slight duplication from x86_restore_state_to_opc,
but it's just a few lines.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1269
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index b62a1e48e2..0ac2da066d 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -509,6 +509,27 @@ void cpu_x86_inject_mce(Monitor *mon, X86CPU *cpu, int bank,
     }
 }
 
+static inline target_ulong get_memio_eip(CPUX86State *env)
+{
+#ifdef CONFIG_TCG
+    uint64_t data[TARGET_INSN_START_WORDS];
+    CPUState *cs = env_cpu(env);
+
+    if (!cpu_unwind_state_data(cs, cs->mem_io_pc, data)) {
+        return env->eip;
+    }
+
+    /* Per x86_restore_state_to_opc. */
+    if (TARGET_TB_PCREL) {
+        return (env->eip & TARGET_PAGE_MASK) | data[0];
+    } else {
+        return data[0] - env->segs[R_CS].base;
+    }
+#else
+    qemu_build_not_reached();
+#endif
+}
+
 void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
 {
     X86CPU *cpu = env_archcpu(env);
@@ -519,9 +540,9 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
 
         cpu_interrupt(cs, CPU_INTERRUPT_TPR);
     } else if (tcg_enabled()) {
-        cpu_restore_state(cs, cs->mem_io_pc, false);
+        target_ulong eip = get_memio_eip(env);
 
-        apic_handle_tpr_access_report(cpu->apic_state, env->eip, access);
+        apic_handle_tpr_access_report(cpu->apic_state, eip, access);
     }
 }
 #endif /* !CONFIG_USER_ONLY */
-- 
2.34.1


