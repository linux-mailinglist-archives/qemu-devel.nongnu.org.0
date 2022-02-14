Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014964B5A57
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:03:55 +0100 (CET)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgdd-0003LR-LY
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgB0-0000sr-Lv
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:34:18 -0500
Received: from [2607:f8b0:4864:20::1034] (port=35650
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgAj-0002gj-MP
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:34:18 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso30258pjg.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lt5xGKR3Z7vKxq8vzU4efggY71T1A412lzm5UN/xys0=;
 b=C7BhG91VkXebOeR7XQPXCs7Bkiko8wNDzd4yUUJio9PTkYJYBaEwSczVzp/RkpglBr
 Hr2+wF1T4X+edRCCoSs4yMQ3FycgWfplANEHBEzGKd3WhRM6STVs/mF3640o1QosA10M
 94eB2hnP4Dte0c4YERyqmson9DhuHkjBLfn8T5nPnsPKksMb5T27gaxijYajBJQKI7/K
 K2Z8sSwryeJkitwKhEvxM/rkj4gyh6K8IeAFmMvAIpq+1dcqj3qi5dYGbkTmVpL31Yd1
 qWGAX9QDt+qZukMNxXduTmc1v/UipsuDnul1BYOy0URM6xWB7A6IsXlSSmPGYF9yyNNO
 dLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lt5xGKR3Z7vKxq8vzU4efggY71T1A412lzm5UN/xys0=;
 b=neIdy/h0IvXgNmsMcV3mIpJzSzD0nH8ebHYHNfB12Rf8ViGRrlg6XTEkR3UlRHDeJx
 dtgp+pwMvQqafIpz30ft4lb9DZmUGN8Tfascq0Qk9MR6EMz0TIZGjURu7gi2XHye7Bgn
 ckNVDujcNOpCDbj8viQBgdLamKS1MAsVCeKg1n6GazxW1JZKeMKfL1F5A+eTo+EW4ZpU
 gaOConI7YqB4uJ/QR4ytKPuhyzKX6iiq0sM2coyq74lsf2ls20xcS5A4SzUx5ACFcumi
 QrUx//A97KM6WBfYpZs850Wl+DzuwjdAC9Liy9dNQhERSNoHa9naV2hfMyDJ5SJl1XnK
 m+jA==
X-Gm-Message-State: AOAM532A5gs4GDF31kE36KMNHlrFfWp8DX/XeBXQ4AwKS9RdLl1CwleY
 TxZAUR0RWiTft3ew1UkiKVySGsCvRCw=
X-Google-Smtp-Source: ABdhPJybbq7fEujExzLbwQ+BZ5u7d2bIOwSPCjROwPDN8OmFckt4LrgqnY52t/4pBvCkk+UQ00sPGg==
X-Received: by 2002:a17:902:e749:: with SMTP id p9mr196628plf.46.1644863607738; 
 Mon, 14 Feb 2022 10:33:27 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id fv9sm15160654pjb.7.2022.02.14.10.33.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:33:22 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 11/14] target: Use forward declared type instead of
 structure type
Date: Mon, 14 Feb 2022 19:31:41 +0100
Message-Id: <20220214183144.27402-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The CPU / CPU state are forward declared.

  $ git grep -E 'struct [A-Za-z]+CPU\ \*'
  target/arm/hvf_arm.h:16:void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
  target/openrisc/cpu.h:234:    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
  target/openrisc/cpu.h:238:    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,

  $ git grep -E 'struct CPU[A-Za-z]+State\ \*'
  target/mips/internal.h:137:    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
  target/mips/internal.h:139:    void (*helper_tlbwi)(struct CPUMIPSState *env);
  target/mips/internal.h:140:    void (*helper_tlbwr)(struct CPUMIPSState *env);
  target/mips/internal.h:141:    void (*helper_tlbp)(struct CPUMIPSState *env);
  target/mips/internal.h:142:    void (*helper_tlbr)(struct CPUMIPSState *env);
  target/mips/internal.h:143:    void (*helper_tlbinv)(struct CPUMIPSState *env);
  target/mips/internal.h:144:    void (*helper_tlbinvf)(struct CPUMIPSState *env);
  target/xtensa/cpu.h:347:    struct CPUXtensaState *env;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/hvf_arm.h   |  2 +-
 target/mips/internal.h | 14 +++++++-------
 target/openrisc/cpu.h  |  4 ++--
 target/xtensa/cpu.h    |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index ea238cff83..9a9d1a0bf5 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -13,6 +13,6 @@
 
 #include "cpu.h"
 
-void hvf_arm_set_cpu_features_from_host(struct ARMCPU *cpu);
+void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
 #endif
diff --git a/target/mips/internal.h b/target/mips/internal.h
index f705d6bfa6..ac6e03e2f2 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -134,14 +134,14 @@ struct r4k_tlb_t {
 struct CPUMIPSTLBContext {
     uint32_t nb_tlb;
     uint32_t tlb_in_use;
-    int (*map_address)(struct CPUMIPSState *env, hwaddr *physical, int *prot,
+    int (*map_address)(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, MMUAccessType access_type);
-    void (*helper_tlbwi)(struct CPUMIPSState *env);
-    void (*helper_tlbwr)(struct CPUMIPSState *env);
-    void (*helper_tlbp)(struct CPUMIPSState *env);
-    void (*helper_tlbr)(struct CPUMIPSState *env);
-    void (*helper_tlbinv)(struct CPUMIPSState *env);
-    void (*helper_tlbinvf)(struct CPUMIPSState *env);
+    void (*helper_tlbwi)(CPUMIPSState *env);
+    void (*helper_tlbwr)(CPUMIPSState *env);
+    void (*helper_tlbp)(CPUMIPSState *env);
+    void (*helper_tlbr)(CPUMIPSState *env);
+    void (*helper_tlbinv)(CPUMIPSState *env);
+    void (*helper_tlbinvf)(CPUMIPSState *env);
     union {
         struct {
             r4k_tlb_t tlb[MIPS_TLB_MAX];
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index ee069b080c..5711591520 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -231,11 +231,11 @@ typedef struct CPUOpenRISCTLBContext {
     OpenRISCTLBEntry itlb[TLB_SIZE];
     OpenRISCTLBEntry dtlb[TLB_SIZE];
 
-    int (*cpu_openrisc_map_address_code)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_code)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
-    int (*cpu_openrisc_map_address_data)(struct OpenRISCCPU *cpu,
+    int (*cpu_openrisc_map_address_data)(OpenRISCCPU *cpu,
                                          hwaddr *physical,
                                          int *prot,
                                          target_ulong address, int rw);
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 02143f2f77..f2165b17e2 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -344,7 +344,7 @@ typedef struct XtensaGdbRegmap {
 } XtensaGdbRegmap;
 
 typedef struct XtensaCcompareTimer {
-    struct CPUXtensaState *env;
+    CPUXtensaState *env;
     QEMUTimer *timer;
 } XtensaCcompareTimer;
 
-- 
2.34.1


