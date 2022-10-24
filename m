Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45B60AC09
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:02:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTJ-0003d6-JM; Mon, 24 Oct 2022 09:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxTB-0003WS-Ba
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:21 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxT7-0004Ah-HZ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:20 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so12986038pji.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=frs+W2o45yhX0BGjDiwQgjk/MyzDxe9aB6tmUVXaXnc=;
 b=GL89LzGxw3vwUBek27SLSl4T8sEFR3afmAlQ1CBFCaYK6IksyynvNb+EoMLBFAT0Gi
 k1MIo/dwoV03jRfO46XllepsGV1DpIO8CSYFBhnMNgn8QyBz0gnIDEd2jtCu7ygb1+v3
 pU50r+wbkgZAcAvJiY6offrmw/AvRg+5kewDmSAITCiJy6mrvbUOe5HhZ6uK6F+YlMZ3
 K3WLHkEbgfSH0pLZiBbMqps42jVq9e8sYP9kGWrLzg2/U8vPY6Hw3yA9KEzIEKs23Klj
 rtHfpr3SpiqvQ759TEiki9Rtt+iCidT/PDSp0rfwKJTmdwO8fiM9WkptWow8wt30x4Qx
 NCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frs+W2o45yhX0BGjDiwQgjk/MyzDxe9aB6tmUVXaXnc=;
 b=n+WaB4FGNxrtRKWu9xdWciGbD82Z3ASzEoOGv9eHfY3wU01D8PP5BVmQv3S0pHpybl
 kZXFEf8QGOcDUS648AcLN0Dh3ryphheOXty1P0NTeZynYFjRmYLJ4XprAf6rkcZFhOVS
 dft9+/rfwjrken/GuX3jBn4ItKfSQGlGaL6aJO9lavUGDlsD3+be6DG2dK8DzP48Yapx
 wAufapFIgoJsdFAuzvBU2lLO7cWuKf4fm5ynsy3O4FFCqfldEH4FOqWlkl5Hocu5MSNY
 dkPAZ2HQp7CcFNFtJlI4zL3MpBn+7F47dwPARdozvX0osIvzVsmlIXCZIrE3eTq4bdd/
 wbtw==
X-Gm-Message-State: ACrzQf06yft66NhCH6Xe507VPyHzQJSqNFSGNn8MpDjGCGiQied9+8wj
 3km22zPYKgXl5U2f+wkTEWnYT/9rrDs/qQ==
X-Google-Smtp-Source: AMsMyM4CfHz86hhjU7b1Z3U7KkDep9YjJ/fZo7kHAUvGWREy5QjDm6ogSB5oGbsXkQs+GuWmUThqWQ==
X-Received: by 2002:a17:902:d183:b0:186:8d50:75bb with SMTP id
 m3-20020a170902d18300b001868d5075bbmr11435218plb.159.1666617971770; 
 Mon, 24 Oct 2022 06:26:11 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/29] target/i386: Use cpu_unwind_state_data for tpr access
Date: Mon, 24 Oct 2022 23:24:55 +1000
Message-Id: <20221024132459.3229709-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


