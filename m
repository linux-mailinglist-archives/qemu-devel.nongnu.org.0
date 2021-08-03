Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1E33DE50E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:24:43 +0200 (CEST)
Received: from localhost ([::1]:55096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlys-0003rN-H6
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpY-00031I-5t
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:04 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpU-00028g-Vq
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:03 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so3039576pjd.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JUJY8z2475zIBNarMLMPEdlHtKrQEQrNMuj/yYXL3iE=;
 b=ctXV514tAPd4jFdMd5DYKfmvZGCoo34cFW2FCs+gXVkbKze0CJeSw8q+8Rs5y+EK1n
 NKREFn8CHzBC26oGudXhiQej3Dv1VzfKwHzUr3ehKsYCewGlt0uH9qGRNVWPSfQdF1qv
 RTLqSFSUA4Q583wzDd3W458pqbObPUSSLiFTGnXRA57wgDL4zTkODt9qX7WWYn0Plq/9
 ssrbkdR1FQsaK2qcUW/y7kblC/UqZAWVa5Y2JuvQuPPjocAWfJsdRRUoxYbeUBKZjaLy
 fsGW0le73aWxJ0BjzuusVSNHGuzOGKexexfe09n2LC12R6VneFHbtKJaoNZSoqvVwp3o
 FB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JUJY8z2475zIBNarMLMPEdlHtKrQEQrNMuj/yYXL3iE=;
 b=O//XeO+L8nvP0XOMLwr4oWxCSDf7SBGViyY4e/w2ESLy8UsdWHBxlsG2xCRDkhkHtV
 DwJ89KGMuPgO9zS8EcIXq5DCjEHBtaSxXveOMSiAhhqBBmPe2JvR8KkpgoScZIotg6iH
 jzEmmo8spwt3aEHWo19PuwYfkRNo/1UhVZLqvn/jADQPPAP1od/I1sb8GeQJzYaSCOe4
 oFDZjdiQSHSOmmngmHpVSw63TxFv6uQtUCrDEt+5HJFHgPPFQ0//DXUui7SucPNHknL+
 xbIZwTwtoH7iOIpVDxRHwSDScp1NSMTG/BCMr2OouEVRppBsm2wzPI0W8n5PCpzVXjR4
 dPtg==
X-Gm-Message-State: AOAM531YLulU2qUpe9a4MF1riRYlKZhjp2OcGXGKSRrFJnSCE4I2DgfX
 SUyxv8NPXIr01mJumcHvrwDbXdO5i9OpgQ==
X-Google-Smtp-Source: ABdhPJx/ZGg2vp9lUb8qoGVluUN7Alvk9XD96/rlCQdbzscr3omsbfEZgisp2R86S5LU+lpfhcLgAw==
X-Received: by 2002:a17:90a:2ec3:: with SMTP id
 h3mr20716910pjs.125.1627964099803; 
 Mon, 02 Aug 2021 21:14:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/55] target/s390x: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:14:00 -1000
Message-Id: <20210803041443.55452-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.c             |  2 +-
 target/s390x/tcg/excp_helper.c | 28 +++++++++++++++-------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..9d8cfb37cd 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -267,12 +267,12 @@ static void s390_cpu_reset_full(DeviceState *dev)
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
     .tlb_fill = s390_cpu_tlb_fill,
+    .do_unaligned_access = s390x_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
-    .do_unaligned_access = s390x_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index a61917d04f..9cbe160f66 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -82,6 +82,21 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
     tcg_s390_data_exception(env, dxc, GETPC());
 }
 
+/*
+ * Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
+ * this is only for the atomic operations, for which we want to raise a
+ * specification exception.
+ */
+void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, uintptr_t retaddr)
+{
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
+    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
+}
+
 #if defined(CONFIG_USER_ONLY)
 
 void s390_cpu_do_interrupt(CPUState *cs)
@@ -602,19 +617,6 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
     }
 }
 
-/* Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
-   this is only for the atomic operations, for which we want to raise a
-   specification exception.  */
-void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr)
-{
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
-
-    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
-}
-
 static void QEMU_NORETURN monitor_event(CPUS390XState *env,
                                         uint64_t monitor_code,
                                         uint8_t monitor_class, uintptr_t ra)
-- 
2.25.1


