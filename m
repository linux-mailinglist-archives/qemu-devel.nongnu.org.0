Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5634F612FD6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNXJ-0001dW-PX; Mon, 31 Oct 2022 01:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXF-0001c1-E6
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:34 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXD-0003qb-DX
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:33 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 a13-20020a9d6e8d000000b00668d65fc44fso6223054otr.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8ag8A++CsvWQPICCIPv2YWYP7CkxoK0jspe/zfPQ5Q=;
 b=c+dNSuQ/KuZEPIMBtk8TS2j5ASI3EKjYRhEPweq6GOUL0YYGWWoYh5y1Am+pBiZP+f
 yMgMsPov5UkiSTKmeUZGfQNmAHZD/dFqfbHGuwAh8uYYcyqFa3pzz6ikWDIusGZgkN5a
 dUItcWaDJAuh6gOBWd8Zu9OCclKHqafdeZ/yBh+MH/6YX3FnozUbM3jgK+Do6UZOiDBL
 PM0g2NSuu78J4XYaN6AXPSKDK/E/ZcSZyNsV5zFa6hLR7auZOyTB//H4UDUbRcvzYl7D
 TQ3AeSEuLhWZGdaquf26rzyf84HoDu/QTOKhITK3Kg8CvHbIJzNKxN3tX/CPnEw+QL1l
 a8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8ag8A++CsvWQPICCIPv2YWYP7CkxoK0jspe/zfPQ5Q=;
 b=Ln4h8z5Vu9E+1oBb5ZqhNQIoz29/LUXI8UqVRYq4feT8249mcDNpZhznKPPRD1r1lZ
 0nyA/J6BISMqlKZlhFi5XQvo+AEVff/t4A+K3ZaaRIYIi/Nch9LF4ymuB6P9d6U4STpq
 fCjmS1KmBfo+fIt3kv5BW2xooXTNWKFzAr+VRkiPsKE3CUQR+VCUx+hu4JxopG86j/mu
 cwO0Wowpiqi0tQsUxrTt+lcpEhYVLRPFVG776Oz+orMfPSrBaoXz5Hkm2TT5/pE4BU4M
 GD05I49Fzq1T2MUPmytKVv8edGMAW6Rt2HsnQ6wkDT0chWWFeTf6dpywaRq4x77rWyWc
 x+5A==
X-Gm-Message-State: ACrzQf0hirkB3l20DL1ngvMkpsqixaU/OE5upBXlH8bzll9MtGAuuu44
 dWSzjH/4sxoh/kvGfbtxOT7aTHqPJOf3HQ==
X-Google-Smtp-Source: AMsMyM5Dq0D1ujYhUBPrXHEBf0+aCH5dkbOrU3J37mQhba1WhNkQeWjgyt1H2ISgYCAoKnXkOk9aTw==
X-Received: by 2002:a9d:64d9:0:b0:662:2e67:730a with SMTP id
 n25-20020a9d64d9000000b006622e67730amr6030793otl.369.1667194830276; 
 Sun, 30 Oct 2022 22:40:30 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>
Subject: [PULL 06/11] target/i386: Use cpu_unwind_state_data for tpr access
Date: Mon, 31 Oct 2022 16:39:43 +1100
Message-Id: <20221031053948.3408-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avoid cpu_restore_state, and modifying env->eip out from
underneath the translator with TARGET_TB_PCREL.  There is
some slight duplication from x86_restore_state_to_opc,
but it's just a few lines.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1269
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index b62a1e48e2..2cd1756f1a 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -509,6 +509,23 @@ void cpu_x86_inject_mce(Monitor *mon, X86CPU *cpu, int bank,
     }
 }
 
+static target_ulong get_memio_eip(CPUX86State *env)
+{
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
+}
+
 void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
 {
     X86CPU *cpu = env_archcpu(env);
@@ -519,9 +536,9 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
 
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


