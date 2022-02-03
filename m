Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC34A8CF5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:09:44 +0100 (CET)
Received: from localhost ([::1]:44742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiQJ-0005W7-Rr
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhf4-00035P-Kl
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:21:13 -0500
Received: from [2607:f8b0:4864:20::102a] (port=44714
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhf2-0002dq-Am
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 y5-20020a17090aca8500b001b8127e3d3aso3941507pjt.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=985euxmFHnl3qICip4SKX2brlsgOFAR3iQs3qGSRI3M=;
 b=nDrzIi5DPDj2kdzN2d4WkF6Yz05dB7VTKkAw9NhfWih1+Q6FzZ5kMHpOwgTnh9tC7K
 qWgocaWSeiU2BxqrKc5TCkD/resGbvO1u7DyW4U3WFkFELmkUdci7Dwsf1WUDwsuMqBa
 ezjQc2FDqvT/wlGAaC+EJjhnXCu/wS5iT1FIPjTcAFm1bqbtz9i6jDQvA6G1T5S1TLtk
 iSSFF8KPr5CG/2ocwCxRR3toBpReIzb0aQbYFr87ZCAzyHW7PcLs6JWY42eZVjE0ShTI
 Q1lu4TIiui1GhSn8n8LFDbe6iK7mM7FCA6t74U7PwBbddmpzAbmwXQW2WaEBTKiRlHi7
 qLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=985euxmFHnl3qICip4SKX2brlsgOFAR3iQs3qGSRI3M=;
 b=N/5ZhLpKTLjbpVKJB4k4rtcUeCCnEZX9Ula/R9+sIzxExRsbVKidYb1RQP/kOVsgSv
 kyfZjWgYYzGRsEa7gR49xOgJ4lF0/qmowYf0obvieXbJ9AO0dk5c79GYE/Um+CBhy6rN
 dzTQgSy0y8Ekyez0aJIpKAMySBmWlPmkt+C5507nuW/xWqOrLDU7je4c1Tw2bD4ahxQT
 zxqR0OThXIv5sSoRPBm7qa2/ULAjEg2oPuyx7O+Qd6djrrKXg9P7+2QJDKMB8/kJvHU3
 wNBnBwOHQBwlvWtrRqFUjuWprLZr5bJLAAms2cuPvdeuxC87Tp2YZ7unUxrM4CdyshSk
 6FYA==
X-Gm-Message-State: AOAM532EgYYCDai+YL7KIAepsA4xy80Rb3a2IUYN09YZ9kLr0+q+xs8x
 EEYeW+DRqaUVUW22TqaKLzxXdU4UpUw=
X-Google-Smtp-Source: ABdhPJxfWUDcdsiKG+Z3iNiEoGHD8hHanp/oDptq2apXtYfPbas23+Pmlhw0P7YvzVfNlh6JoDV6fg==
X-Received: by 2002:a17:902:a418:: with SMTP id
 p24mr11286948plq.171.1643916051059; 
 Thu, 03 Feb 2022 11:20:51 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y15sm30262731pfi.87.2022.02.03.11.20.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 19/21] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
Date: Thu,  3 Feb 2022 20:18:12 +0100
Message-Id: <20220203191814.45023-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

cpu_address_space_init() and cpu_reloading_memory_map() are
target-agnostic, but are declared in "exec/exec-all.h" which
contains target-specific declarations. Any target-agnostic
source including "exec/exec-all.h" becomes target-specific and
we have to compile it N times for the N targets built.  In order
to avoid that, move the declarations to "exec/cpu-common.h" which
only contains target-agnostic declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-common.h | 23 +++++++++++++++++++++++
 include/exec/exec-all.h   | 25 -------------------------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 8031ebc680..7f7b5943c7 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -90,6 +90,28 @@ void qemu_ram_unset_migratable(RAMBlock *rb);
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
@@ -102,6 +124,7 @@ static inline void cpu_physical_memory_write(hwaddr addr,
 {
     cpu_physical_memory_rw(addr, (void *)buf, len, true);
 }
+void cpu_reloading_memory_map(void);
 void *cpu_physical_memory_map(hwaddr addr,
                               hwaddr *plen,
                               bool is_write);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 87df70fa8f..199fd49e5d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -82,31 +82,6 @@ static inline bool cpu_loop_exit_requested(CPUState *cpu)
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
2.34.1


