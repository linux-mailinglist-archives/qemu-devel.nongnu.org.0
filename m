Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295284E60A8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:51:30 +0100 (CET)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJBp-0004Ho-8H
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:51:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXIlS-0001mt-I6
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:24:14 -0400
Received: from [2a00:1450:4864:20::335] (port=55913
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXIlR-0004Ri-0p
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:24:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id n35so2229927wms.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iDFr0YP5Mms79TeI2MoVcdrFHJrt/G7S8FixrvBMWro=;
 b=Zzmyzd1tfucZiOegrHyA7biwJYWZ/xn3S4vZXir4Z8E+WQ6ek2UgZcT83rM1ayIphU
 r+P1Ly/F7DpCPd89/T4aR1kzjH/DLPanWfDvg2D1T9xlJM/BQkVTzILV17Ka/tk2nVcU
 rTSi0FGnDIwhEXLBjF+QUM9k9I4i19vMiFNqR3/ZEVdBsDaLBt3cifVIENPNjIECujQI
 kah9xyvoXHSpvH/LUWqpyWe8ASkjVZxPgEB3ffrEBLxs1adOul9eMEYeqiaxMAT9VV0F
 XgKwblVQX1uY5lQj1jZ5i8+fDh2owIs6Q2Co86owctxbjpzCgUAujKtP9Bp8aTlFTRJR
 1fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iDFr0YP5Mms79TeI2MoVcdrFHJrt/G7S8FixrvBMWro=;
 b=rIu/xGpuDrsnp61R5qSueCUb1dHhyvLRxBzOeAp4iq8zkdlJdF3jxZqTCBKr/vqJKR
 k8pIreNA+nLmU70uuwQD0kX4uvF2oH+0wIoTH8CxCZXvU0Ne2JcLnnH5LaHaZSza/7C8
 y7eKZw+rBtyEPCPePL7drDgcOEy5F3Ut00PSrMAUlD48/PuUdRxeRq9MCzFkHkv+RacE
 +wvX9a+G7SA/v1JbinXjfL08xQ1qyMpm+XRTL8G4+Uhxc0SDDO3sHs/t7a6MAVni4pMN
 x3/FEgBssRBxAK9hrA5tVJIXuuaJExq14SvxJ/FGJlPTx4OnqHTAz0tjB6bZoQQad1KD
 5Deg==
X-Gm-Message-State: AOAM533tkRGHvCAhj/URpPFAn9+jT/vQaSidh4cCOVrnjED8F1/EgLbk
 6LKB7JHcp/MDyiEBbqvOsMRnZT9Szkw=
X-Google-Smtp-Source: ABdhPJwYT64WQk+M7vc80OOti70jqwZ34Ob5TGxZTIz73MW3EADBYDi7PIhaoZfl3t8he+/tU2EZQQ==
X-Received: by 2002:a05:600c:4f43:b0:38c:b270:f9af with SMTP id
 m3-20020a05600c4f4300b0038cb270f9afmr13314535wmq.36.1648110238664; 
 Thu, 24 Mar 2022 01:23:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0038cba2f88c0sm6048470wms.26.2022.03.24.01.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 01:23:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: introduce CPU property to work around Windows
 reset bug
Date: Thu, 24 Mar 2022 09:23:46 +0100
Message-Id: <20220324082346.72180-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Vadim Rozenfeld <vrozenfe@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some versions of Windows hang on reboot if their TSC value is greater
than 2^54.  The calibration of the Hyper-V reference time overflows
and fails; as a result the processors' clock sources are out of sync.
As a workaround, reset the TSC to a small value.  Do not do this
unconditionally and require a special property to be set.

Reported-by: Vadim Rozenfeld <vrozenfe@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 10 ++++++++++
 target/i386/cpu.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ec3b50bf6e..9b29cea8c4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5931,6 +5931,15 @@ static void x86_cpu_reset(DeviceState *dev)
     env->xstate_bv = 0;
 
     env->pat = 0x0007040600070406ULL;
+
+    /*
+     * Some versions of Windows hang on reboot if their TSC value is greater
+     * than 2^54.  As a workaround, reset the TSC to a small value.  Do not use
+     * zero, KVM applies special heuristics for CPU startup when TSC is cleared.
+     */
+    if (cpu->tsc_clear_on_reset) {
+        env->tsc = 1;
+    }
     env->msr_ia32_misc_enable = MSR_IA32_MISC_ENABLE_DEFAULT;
     if (env->features[FEAT_1_ECX] & CPUID_EXT_MONITOR) {
         env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_MWAIT;
@@ -6957,6 +6966,7 @@ static Property x86_cpu_properties[] = {
                      false),
     DEFINE_PROP_BOOL("vmware-cpuid-freq", X86CPU, vmware_cpuid_freq, true),
     DEFINE_PROP_BOOL("tcg-cpuid", X86CPU, expose_tcg, true),
+    DEFINE_PROP_BOOL("tsc-clear-on-reset", X86CPU, tsc_clear_on_reset, true),
     DEFINE_PROP_BOOL("x-migrate-smi-count", X86CPU, migrate_smi_count,
                      true),
     /*
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e31e6bd8b8..66f7901729 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1864,6 +1864,9 @@ struct ArchCPU {
     /* Forcefully disable KVM PV features not exposed in guest CPUIDs */
     bool kvm_pv_enforce_cpuid;
 
+    /* Clear TSC on reset */
+    bool tsc_clear_on_reset;
+
     /* Number of physical address bits supported */
     uint32_t phys_bits;
 
-- 
2.35.1


