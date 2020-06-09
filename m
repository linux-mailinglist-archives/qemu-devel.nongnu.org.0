Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FC61F47DC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 22:14:46 +0200 (CEST)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jikdx-0005kf-IO
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 16:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jikZ7-0007Vb-5J
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 16:09:45 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jikZ6-0005aI-4t
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 16:09:44 -0400
Received: by mail-pl1-x641.google.com with SMTP id y18so17417plr.4
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMbQhssouUvEnYpKM8BJ1rWl4q0BOBlTa248+fa3MEA=;
 b=FOMrvHJrOFSJ+/V6jlfepp24K34u2dT1Y3Ao4CiNA7GTTNvDUWqQ9tsJ3FG+TV5De8
 Z/Xlqaa6+3XV237J5yLXl5w7NpAMBzlL5bMrvqWeHeuZoQvjDukKmFQGoUFWF6z2a/ao
 VHMKOhypwPlZSOJKd3oMKdMBxJApD+Jk2eZj0J+e8V22RG4zbzZSmtadWcZqAhGe/wCv
 M9tL1NQ810u6sH5bW0uPrAmd2tJrMdyGCFfUSAsKG9Y9hq6jUM3Aa90dvewsLNTFS5EJ
 tYVquQRJoxJu8cVpHV2J0oUv5/yD3yRUiMTSmtUm4UvxX9LTzsoX3wAhGSiS1tYG+d7q
 OhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMbQhssouUvEnYpKM8BJ1rWl4q0BOBlTa248+fa3MEA=;
 b=J1QniRRkAApzrfaxutYEw9Tjk8pViZ44J0dntoWgmgxJueM9q+qYsfjpkIhJXe3QJN
 J560cie5N2QAVsgSSMGno7Urm+TNalYe7sTiWkHXw9w6iKwDFFS6F5PiXwfVD77MHSaz
 st0HntH8htlQ/49P2du3ghWNyauv+lpfGkYprkQHhYjOGTOAnLCW2jQVTCN/VpZqfLt6
 4karAjYNkO3X3c07iubhEd298JZ5sq6zF4npLReBRnZAcRtlqvr4uObk9/vL/+LqLSJq
 SpV8noojaIUpOZxpAUobAaOVa/WdHxDlg0u/hXhLL3HEmr5uEJE9Ca5rY63pMxiwGiMq
 oEAw==
X-Gm-Message-State: AOAM532IPkFuoak0YW4SQaGJEH06uSIEtoSw/AXUt8mRhHoVdAEwWNMK
 lF0xwnWv7iDkARPSt3Nuz3N+6A41YYIWmw==
X-Google-Smtp-Source: ABdhPJzxlvdrBCnUEM7RPIO3vWT52v7eeiJzh6mCaIf7QVxvfIcuwLWBeWH2CVUQ9Bp1f1X4uyV3zg==
X-Received: by 2002:a17:90a:df82:: with SMTP id
 p2mr6707823pjv.217.1591733382355; 
 Tue, 09 Jun 2020 13:09:42 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1d09:cef2:3b1f:abce])
 by smtp.gmail.com with ESMTPSA id n19sm10523374pfu.194.2020.06.09.13.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 13:09:41 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] cputlb: destroy CPUTLB with tlb_destroy
Date: Tue,  9 Jun 2020 16:07:29 -0400
Message-Id: <20200609200738.445-5-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609200738.445-1-robert.foley@linaro.org>
References: <20200609200738.445-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=robert.foley@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, peter.puhov@linaro.org,
 alex.bennee@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

I was after adding qemu_spin_destroy calls, but while at
it I noticed that we are leaking some memory.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c      | 15 +++++++++++++++
 exec.c                  |  1 +
 include/exec/exec-all.h |  8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index eb2cf9de5e..1e815357c7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -270,6 +270,21 @@ void tlb_init(CPUState *cpu)
     }
 }
 
+void tlb_destroy(CPUState *cpu)
+{
+    CPUArchState *env = cpu->env_ptr;
+    int i;
+
+    qemu_spin_destroy(&env_tlb(env)->c.lock);
+    for (i = 0; i < NB_MMU_MODES; i++) {
+        CPUTLBDesc *desc = &env_tlb(env)->d[i];
+        CPUTLBDescFast *fast = &env_tlb(env)->f[i];
+
+        g_free(fast->table);
+        g_free(desc->iotlb);
+    }
+}
+
 /* flush_all_helper: run fn across all cpus
  *
  * If the wait flag is set then the src cpu's helper will be queued as
diff --git a/exec.c b/exec.c
index be4be2df3a..79211fb23d 100644
--- a/exec.c
+++ b/exec.c
@@ -892,6 +892,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    tlb_destroy(cpu);
     cpu_list_remove(cpu);
 
     if (cc->vmsd != NULL) {
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 8792bea07a..3cf88272df 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -124,6 +124,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
  * @cpu: CPU whose TLB should be initialized
  */
 void tlb_init(CPUState *cpu);
+/**
+ * tlb_destroy - destroy a CPU's TLB
+ * @cpu: CPU whose TLB should be destroyed
+ */
+void tlb_destroy(CPUState *cpu);
 /**
  * tlb_flush_page:
  * @cpu: CPU whose TLB should be flushed
@@ -284,6 +289,9 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
 static inline void tlb_init(CPUState *cpu)
 {
 }
+static inline void tlb_destroy(CPUState *cpu)
+{
+}
 static inline void tlb_flush_page(CPUState *cpu, target_ulong addr)
 {
 }
-- 
2.17.1


