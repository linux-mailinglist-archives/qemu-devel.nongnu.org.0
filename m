Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3D160D94F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:30:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVul-0005O5-Kg; Tue, 25 Oct 2022 22:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuj-0005NS-On
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:05 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVui-0001Ja-7v
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id u6so12668124plq.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWBF5zhKRiXyn9OVB8QHNYB94/Bgwx0Q3fh3y9juC7M=;
 b=UeBSWv3ObyL4/hrShsrQTQ6FM/f1u9NltLcVFD5ODfWmBS6pYl5hWKftiPGj0JR2t0
 5uMlbmNptmD70zGeLN8BZR/nMS6KYVq5mc18yiPVHI+/+npgQVv4jOAOBuAwZNuKJ0cZ
 M6fJr1xqTtIiis0SQdrXQpkxLITgr6KGhLD00Nq2s9mEZJf83vWB0fhuTt/KePPuKS7E
 rhS8ElWGS9/49u3Ks8sCpEITUo3LtXEAfp21M+F2nkofUlx62yFvcjtrA8H/T+WdXo5g
 EF7zY+PVIUG3FKnN7nx7POiBymyIaAgtSlet47D57IqdicZu+dBxQh8y1Hp1eV4z+4hA
 Tr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWBF5zhKRiXyn9OVB8QHNYB94/Bgwx0Q3fh3y9juC7M=;
 b=odnapIZIn7+Hv3mxuWA/9GolRTPs0NMaNVVvSry2rPVFvQs87+6PXNpTVWUwIPrFXr
 9L98xFUayfTCZvpq/Icy7+7Mg4r81uLhcde6v8/l+ofVdk+/USA3EFW9kNKGwltGuj4Q
 tNFN7gdbUEjGxJrqII7//cWpMmm1Up5JPFaeXZqa4/0I7pqKR9V+W1/eKDfWCMnPqbj8
 Nx+zuCbENzxbu3uhch+AmPVm4femIqfA9OUsrUUPZvFcg8HMd1SKwYcuZIQNz+P4jxjn
 eaFZbYREVSafIqPvrqEb0B/dbG0oZoVr0UsEq8ryAFBTtn6qnsHBTrYaqnWjtWRGDwQ8
 pC0w==
X-Gm-Message-State: ACrzQf2NKEo6ceBNnssWYD3YP99RNeljznlP2LesaqvR0wXwF97G10L6
 CaDgrXdDWTX9ka3rGsW8otqIarEIvVSOaoyo
X-Google-Smtp-Source: AMsMyM5T2PB5u1m+qa8x9fsUpeMGQ1Dh5jrov3fdmXU04LyAbW8u6CIZYwN/PttE+SX1YfyHKMKP5Q==
X-Received: by 2002:a17:90b:1643:b0:20c:c7c7:d598 with SMTP id
 il3-20020a17090b164300b0020cc7c7d598mr1505017pjb.97.1666750382948; 
 Tue, 25 Oct 2022 19:13:02 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:13:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 36/47] target/mips: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:05 +1000
Message-Id: <20221026021116.1988449-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/tcg-internal.h | 3 +++
 target/mips/cpu.c              | 1 +
 target/mips/tcg/translate.c    | 8 ++++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 1d27fa2ff9..aef032c48d 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -21,6 +21,9 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 G_NORETURN void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                              MMUAccessType access_type, int mmu_idx,
                                              uintptr_t retaddr);
+void mips_restore_state_to_opc(CPUState *cs,
+                               const TranslationBlock *tb,
+                               const uint64_t *data);
 
 const char *mips_exception_name(int32_t exception);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index da58eb8892..e997c1b9cb 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -538,6 +538,7 @@ static const struct SysemuCPUOps mips_sysemu_ops = {
 static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
+    .restore_state_to_opc = mips_restore_state_to_opc,
 
 #if !defined(CONFIG_USER_ONLY)
     .tlb_fill = mips_cpu_tlb_fill,
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c3f92ea652..2f2d707a12 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16229,9 +16229,13 @@ void mips_tcg_init(void)
     }
 }
 
-void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
-                          target_ulong *data)
+void mips_restore_state_to_opc(CPUState *cs,
+                               const TranslationBlock *tb,
+                               const uint64_t *data)
 {
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
     env->active_tc.PC = data[0];
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= data[1];
-- 
2.34.1


