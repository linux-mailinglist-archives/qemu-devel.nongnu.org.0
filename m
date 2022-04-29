Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18FF51546C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 21:27:19 +0200 (CEST)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkWGs-0005w6-KP
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 15:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkWFv-0004wB-Ql; Fri, 29 Apr 2022 15:26:19 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkWFu-0000uH-0Y; Fri, 29 Apr 2022 15:26:19 -0400
Received: by mail-ej1-x634.google.com with SMTP id k23so17250726ejd.3;
 Fri, 29 Apr 2022 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LN0NHFUWiLxmhtMTb4AhBBywzfab/H+3ZjJpkGQ8Kkw=;
 b=iVIfE0d4fNPYVFWVScTs3fjLCliIfIUFe4LUDMr8gSPkx1WVkT8RYop8n9tn4Sm6er
 NG/CFOPMV4N80x5SmR5uVumCpkJODnv4lbSWw9lOHSJyEeurz1vcY/bKQS3VZNGSed9i
 S7anfAHjaa0lE2vgCIR3SgvNhu9hPQ4813/hgzKUMI7WgckowQT2Kp0h1smaeLW+vKs9
 ZCRSzaeBEjUTSpivvQ0Sf94284WsrAlegNUhEH2EwulrGYqPamkmYtID/B5VluyPiAi3
 5ZvUOhLYZL4bua58NSFxiDvgpi98VCLY0s5bVzSn8TBnZQd+2e79CJsGIpAoEepGMfre
 bXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LN0NHFUWiLxmhtMTb4AhBBywzfab/H+3ZjJpkGQ8Kkw=;
 b=PDU1DJ4FcD2GIhEa8MLCb+GwAEY7L5x6xrmKHsOoV0FcRq7j6DHB/X+LZ6in/I9f0Y
 uOMkbhPY4v75nnRlpPWnJKTSK9LL5Wdf6c1GnFqzIDarxfPwKw6BZqVlNcpKHm3CzGB3
 JT0HrZ1/hzECYwaIFsxgx5I9iuwd6kzN5g+9kzHyHtyb2SMrXct0uDwMl42Na4klNgWM
 mAxKd4UkDQWZEFGF4IuLy+ZmY7mv61TMOccZHaLEXsExnsjF0HjAw9CYc/Z3oBtr6Oyl
 IWyTV63klNUZcdr7dovEPP+s+2W4LU1CwbAEEdk+Y+/9Sh3Rc3N4GoXe8dre8TID6Vve
 V7jw==
X-Gm-Message-State: AOAM530viScTSp1brai0yuvpSP8LiRIoYkhHZ5kTmOKFrYqGJhzCX9kX
 pfAUdZoiZOG0A1oWEfhIR9ONE+rzsPbbYw==
X-Google-Smtp-Source: ABdhPJzlH8D55IN8eTVmbGUYp2IshKd+5+P9A3w1k7EfSm+P7VIn/B8oaPjWsTJHG3Zu6ET0NTcHRg==
X-Received: by 2002:a17:906:cf84:b0:6f3:a3d8:365f with SMTP id
 um4-20020a170906cf8400b006f3a3d8365fmr798505ejb.242.1651260375650; 
 Fri, 29 Apr 2022 12:26:15 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ia5-20020a170907a06500b006f3ef214dffsm906432ejc.101.2022.04.29.12.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:26:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: do not consult nonexistent host leaves
Date: Fri, 29 Apr 2022 21:26:14 +0200
Message-Id: <20220429192614.362579-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-stable@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When cache_info_passthrough is requested, QEMU passes the host values
of the cache information CPUID leaves down to the guest.  However,
it blindly assumes that the CPUID leaf exists on the host, and this
cannot be guaranteed: for example, KVM has recently started to
synthesize AMD leaves up to 0x80000021 in order to provide accurate
CPU bug information to guests.

Querying a nonexistent host leaf fills the output arguments of
host_cpuid with data that (albeit deterministic) is nonsensical
as cache information, namely the data in the highest Intel CPUID
leaf.  If said highest leaf is not ECX-dependent, this can even
cause an infinite loop when kvm_arch_init_vcpu prepares the input
to KVM_SET_CPUID2.  The infinite loop is only terminated by an
abort() when the array gets full.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 99343be926..c5461f7c0b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5022,6 +5022,37 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     return r;
 }
 
+static void x86_cpu_get_cache_cpuid(uint32_t func, uint32_t index,
+                                    uint32_t *eax, uint32_t *ebx,
+                                    uint32_t *ecx, uint32_t *edx)
+{
+    uint32_t level, unused;
+
+    /* Only return valid host leaves.  */
+    switch (func) {
+    case 2:
+    case 4:
+        host_cpuid(0, 0, &level, &unused, &unused, &unused);
+        break;
+    case 0x80000005:
+    case 0x80000006:
+    case 0x8000001d:
+        host_cpuid(0x80000000, 0, &level, &unused, &unused, &unused);
+        break;
+    default:
+        return;
+    }
+
+    if (func > level) {
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+    } else {
+        host_cpuid(func, index, eax, ebx, ecx, edx);
+    }
+}
+
 /*
  * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
  */
@@ -5280,7 +5311,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 2:
         /* cache info: needed for Pentium Pro compatibility */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, 0, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
             break;
         } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
             *eax = *ebx = *ecx = *edx = 0;
@@ -5300,7 +5331,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 4:
         /* cache info: needed for Core compatibility */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, count, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
             /* QEMU gives out its own APIC IDs, never pass down bits 31..26.  */
             *eax &= ~0xFC000000;
             if ((*eax & 31) && cs->nr_cores > 1) {
@@ -5702,7 +5733,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0x80000005:
         /* cache info (L1 cache) */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, 0, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
             break;
         }
         *eax = (L1_DTLB_2M_ASSOC << 24) | (L1_DTLB_2M_ENTRIES << 16) |
@@ -5715,7 +5746,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0x80000006:
         /* cache info (L2 cache) */
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, 0, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, 0, eax, ebx, ecx, edx);
             break;
         }
         *eax = (AMD_ENC_ASSOC(L2_DTLB_2M_ASSOC) << 28) |
@@ -5775,7 +5806,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     case 0x8000001D:
         *eax = 0;
         if (cpu->cache_info_passthrough) {
-            host_cpuid(index, count, eax, ebx, ecx, edx);
+            x86_cpu_get_cache_cpuid(index, count, eax, ebx, ecx, edx);
             break;
         }
         switch (count) {
-- 
2.35.1


