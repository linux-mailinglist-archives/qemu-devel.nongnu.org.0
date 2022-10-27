Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5260F469
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:04:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzjf-0007tD-7x; Thu, 27 Oct 2022 06:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjS-00078k-B3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:30 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjP-0004GF-2M
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:25 -0400
Received: by mail-oi1-x22e.google.com with SMTP id r187so1269409oia.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frs+W2o45yhX0BGjDiwQgjk/MyzDxe9aB6tmUVXaXnc=;
 b=Hp+yw86AcrWqTBhyTzK12oyevSFNr6K35CAcFznA3/ya2Rx8n/KmyYNyKfVeupegU2
 wAlEVC02S5fyfIfe1UZrgTrILfiXVny2xceQ6NZu8JClFAG+amJbjeWMsOcS94Sw/O+M
 HqlFkCon3LidSztiaXW0RZ5W0mbyiJeOfmlVyBogfJc4UMJoDxtBCI9ehsNyo8HMplzK
 AMtQL2dkNLz9UHVnbbyvO1f0qE4wJ8Z+iYEyrcpynrBfILFatx9PhopYSL2eZQP0y52R
 CxRCG40tRwy8q6PnRWzCjc9fOvKi1U5Gix3Okm85/NeemWoN40dNPuKfpZ8iZA8kRkCw
 COqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frs+W2o45yhX0BGjDiwQgjk/MyzDxe9aB6tmUVXaXnc=;
 b=rK9E2A4X3wm0SSdPWgcEJptfsENm46jkIt8+BAHWrbwBfWTcZlGrcapCVjLiaaYVMH
 8vR5m0H9X6tpr9IVGGYTj/sfUjNENtT0ia88MSws6Bl7huJVRTNcisf6ssTteGdakXkN
 BfSP3cICAD6gbQvJfF779oMEJfhXkVG1qaKws1em4bPWkiC5TilYAPDw0RhrcQT+12K0
 geN+5KD5qU9Ry68XhM4GiRo4zrLdopRWY9xGDv3+xJd3u2Oi6J+z0Gu3xb4O/zs0iKxB
 Rs316QlYNHq90Mp9dncbalEHQuyz0Bn5slP85M7IikyPXJBlVFj/CHWXl8tG7oy6k0Qh
 ynuA==
X-Gm-Message-State: ACrzQf3ATzCUvqJbSSG0DrqwFKh6/l395P+zTd2W0Lh/EzwcEKVMIXm4
 dfEv5y7nPgl9RNi5oqhQHIPH4/z4wv0EuurO
X-Google-Smtp-Source: AMsMyM7zs6SjSIiFllyQ+QygM5+CzwnewwChYkVwhoz9umHIahvRRjOZMMF9qGEOgcgtH2FBPVyYlw==
X-Received: by 2002:a17:90b:1a8a:b0:213:20c:a427 with SMTP id
 ng10-20020a17090b1a8a00b00213020ca427mr9349640pjb.9.1666864990620; 
 Thu, 27 Oct 2022 03:03:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a17090a2bcd00b0020a825fc912sm2354631pje.45.2022.10.27.03.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:03:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cfontana@suse.de
Subject: [PATCH v2 2/6] target/i386: Use cpu_unwind_state_data for tpr access
Date: Thu, 27 Oct 2022 21:02:50 +1100
Message-Id: <20221027100254.215253-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027100254.215253-1-richard.henderson@linaro.org>
References: <20221027100254.215253-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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


