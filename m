Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640DE382BB9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:04:24 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libyx-0000V7-7Z
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librK-0004Si-RZ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librJ-0003CQ-8V
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d11so6073942wrw.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L0W+6Vm5qV+IHP9AnHmUXACYLiu+ypqABP540bBo9bI=;
 b=p7aCRUuiIQqNZEL/KM6qm+hMp6V/k7IJr2dwRFxI74sCv1KXT6RZd25oxWTPHqAJgp
 UFuZt7jAtfOJGfPxkpUCkDAEoYyyevkGfLfP5tZ4CKGeoC4eKHoaYfdWDHeFeR3/mxGZ
 HZLbY8cjDupY2O4mQ4g+LDqsedap9zIB26i9cXKjsTCdnJuo0SleqBlsJAp8v3CQkSXt
 5+xqEw+nDZy6kNOJm1hE8F+M7W6T567rH3MxE30xeAkoRR/2N2caK4tEDgY613vHi0FS
 O/YyPmpvsIbhYKC6qQqO/P4oATdAzAnJeNzANnIT6Qg4ueRg9F0i7X2vgN6sDFOPCmZ1
 Vm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L0W+6Vm5qV+IHP9AnHmUXACYLiu+ypqABP540bBo9bI=;
 b=Hc3CLywucdMydgG9Ne5i9nR6Z5NdLJpa+l4jrQ4IxyY8/HY0qTKXdwVvnyNOl0rFIL
 ZRNHl4PEHO3ZuOEzS+siarBwVKEGtz8XXF9o03+T9wkZKcMlncZ1zOGXJIe+w68UvOQE
 txnglzDl4gWsPsIiklwiPYCA1F23dBaCsMhBhMQfwHOfdFXoqCr1K1BRlxMlMX5kaHH9
 zifgjra1TBJdDoOBcuuRxhV0lM2BTqQA0jibDRfdrwUtOMiHl6gGvkimCo0EZZ/Nui8V
 nRmUJZwKILk1kf+ohnIy5LUrCLhQyyHZ/rE1/tGmSbPW9XUd3Qt/KfxdygHHLo0GpPzM
 JRsw==
X-Gm-Message-State: AOAM531GhHpQiqNWcMUhUxhgURY95CqdOVQRIxUVR6oihD5imSExTz9R
 u9ti75IVaOioRwj5s8y4MTXKmjudZ+aHhw==
X-Google-Smtp-Source: ABdhPJwYt+25OYRCGoVeScVAETWF3UjbAA+Dbj9Dq+/tdMxB3LOCZTCP3Jmk2/3eTBSyscywk9gq2A==
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr39863228wrw.263.1621252585741; 
 Mon, 17 May 2021 04:56:25 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id g66sm14216444wma.11.2021.05.17.04.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/15] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
Date: Mon, 17 May 2021 13:55:21 +0200
Message-Id: <20210517115525.1088693-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_address_space_init() and cpu_reloading_memory_map() don't
have to be target specific. Remove this limitation to be able
to build softmmu/cpus.c once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-common.h | 23 +++++++++++++++++++++++
 include/exec/exec-all.h   | 25 -------------------------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index ccabed4003a..a4fb6813206 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -68,6 +68,28 @@ void qemu_ram_unset_migratable(RAMBlock *rb);
 size_t qemu_ram_pagesize(RAMBlock *block);
 size_t qemu_ram_pagesize_largest(void);
 
+/**
+ * cpu_address_space_init:
+ * @cpu: CPU to add this address space to
+ * @asidx: integer index of this address space
+ * @prefix: prefix to be used as name of address space
+ * @mr: the root memory region of address space
+ *
+ * Add the specified address space to the CPU's cpu_ases list.
+ * The address space added with @asidx 0 is the one used for the
+ * convenience pointer cpu->as.
+ * The target-specific code which registers ASes is responsible
+ * for defining what semantics address space 0, 1, 2, etc have.
+ *
+ * Before the first call to this function, the caller must set
+ * cpu->num_ases to the total number of address spaces it needs
+ * to support.
+ *
+ * Note that with KVM only one address space is supported.
+ */
+void cpu_address_space_init(CPUState *cpu, int asidx,
+                            const char *prefix, MemoryRegion *mr);
+
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
 static inline void cpu_physical_memory_read(hwaddr addr,
@@ -80,6 +102,7 @@ static inline void cpu_physical_memory_write(hwaddr addr,
 {
     cpu_physical_memory_rw(addr, (void *)buf, len, true);
 }
+void cpu_reloading_memory_map(void);
 void *cpu_physical_memory_map(hwaddr addr,
                               hwaddr *plen,
                               bool is_write);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f6..781ee62f395 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -84,31 +84,6 @@ static inline bool cpu_loop_exit_requested(CPUState *cpu)
     return (int32_t)qatomic_read(&cpu_neg(cpu)->icount_decr.u32) < 0;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-void cpu_reloading_memory_map(void);
-/**
- * cpu_address_space_init:
- * @cpu: CPU to add this address space to
- * @asidx: integer index of this address space
- * @prefix: prefix to be used as name of address space
- * @mr: the root memory region of address space
- *
- * Add the specified address space to the CPU's cpu_ases list.
- * The address space added with @asidx 0 is the one used for the
- * convenience pointer cpu->as.
- * The target-specific code which registers ASes is responsible
- * for defining what semantics address space 0, 1, 2, etc have.
- *
- * Before the first call to this function, the caller must set
- * cpu->num_ases to the total number of address spaces it needs
- * to support.
- *
- * Note that with KVM only one address space is supported.
- */
-void cpu_address_space_init(CPUState *cpu, int asidx,
-                            const char *prefix, MemoryRegion *mr);
-#endif
-
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* cputlb.c */
 /**
-- 
2.26.3


