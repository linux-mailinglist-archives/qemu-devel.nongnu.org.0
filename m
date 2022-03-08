Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E64D168F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:45:48 +0100 (CET)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYHj-0005z1-GD
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:45:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7j-0007r8-PZ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:28 -0500
Received: from [2a00:1450:4864:20::630] (port=35551
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7d-00060i-31
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:24 -0500
Received: by mail-ej1-x630.google.com with SMTP id yy13so29693658ejb.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yK1iPgBOChG8+hzv52v/XhSx1JapCghzdUpCduUGz48=;
 b=adwCdaj2g20wZUxxK3LkrR+rfnzoqtcviiP4+jd7UaT0jPTcX/+EaAiqT+qLwEbrJD
 9gYLXO+AmK6ziBlZyXKlxQWG0RtL0MFkuQ4Cfbi1qoqHJE87JvU33Q3NLKyEJLZOX2S9
 jWzsr1niyEhfcBsHlb8IfEXYnmZE0ey4ZMxLOJkK85hYTd90BqwovLzNDyFTJbUF5y+I
 kBZK9TZTx8RntPge/3d3Bui4inGEliDrlw2V8eJMXrQkmRkOvniRlNBtfqGqr8Z445ic
 MioVWNKqOaZGkkYOyEi76b9V6UOTwq92zTvXJjEsm+4W1C4gg3n3ONleqRZqOsYgrfXH
 Md9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yK1iPgBOChG8+hzv52v/XhSx1JapCghzdUpCduUGz48=;
 b=xNa6QshL/+Ex1e89u7FUnuArRvsPftM1WRVcG2m8gElMAyQXddAfVKGigtVdAuS9+U
 rBaRtsMeVteUYXlZItv2VO5o+yse6Yb5axaPWDytnwyu/H0BSS9qMnQiV7aEkCE9h3+v
 R11rPSw6uyoVl5/rMelzgc97MYIlsaaC2cFfyu7MQ3Jpa9kSW6YXuCDOmqORxXuAlBzX
 nEfWBzEIAmkiY3vGY7oLYKrXi8+0oDBDC4J4m1YxV3cAPQqSOqcnxF84fCJ+6eot0iNa
 yNV9lH3eIvwSyLyZtwwr/r3Ww6mVLwukc4VDVtgTh2OCiBRgL8mdSZeFSx5xm/SkGMyr
 ihxw==
X-Gm-Message-State: AOAM530f87QJfYQ1VmkAQ/AjYPNrCyXoTzVOe/Ua1mOQJlkhV/RzBh0y
 MiPZuzGOqyoHrNLUD9QRFfvuOyr5R4w=
X-Google-Smtp-Source: ABdhPJyBmnAWG1f5oND0kRPMTQwDB5amAsLLLWgwnq4gJpGg0bPkDIduCVG0MUWKOahfU+4Q/l+6GA==
X-Received: by 2002:a17:906:2811:b0:6ce:eacf:5210 with SMTP id
 r17-20020a170906281100b006ceeacf5210mr13480151ejc.618.1646739318854; 
 Tue, 08 Mar 2022 03:35:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/22] x86: add support for KVM_CAP_XSAVE2 and AMX state
 migration
Date: Tue,  8 Mar 2022 12:34:41 +0100
Message-Id: <20220308113445.859669-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Yang Zhong <yang.zhong@intel.com>, Zeng Guang <guang.zeng@intel.com>,
 Wei Wang <wei.w.wang@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

When dynamic xfeatures (e.g. AMX) are used by the guest, the xsave
area would be larger than 4KB. KVM_GET_XSAVE2 and KVM_SET_XSAVE
under KVM_CAP_XSAVE2 works with a xsave buffer larger than 4KB.
Always use the new ioctls under KVM_CAP_XSAVE2 when KVM supports it.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Zeng Guang <guang.zeng@intel.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-7-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h          |  4 ++++
 target/i386/kvm/kvm.c      | 42 ++++++++++++++++++++++++--------------
 target/i386/xsave_helper.c | 28 +++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 925d0129e2..8c850e74b8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1527,6 +1527,10 @@ typedef struct CPUX86State {
     uint64_t opmask_regs[NB_OPMASK_REGS];
     YMMReg zmmh_regs[CPU_NB_REGS];
     ZMMReg hi16_zmm_regs[CPU_NB_REGS];
+#ifdef TARGET_X86_64
+    uint8_t xtilecfg[64];
+    uint8_t xtiledata[8192];
+#endif
 
     /* sysenter registers */
     uint32_t sysenter_cs;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 385c5f8ed3..0fbdeacbb7 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -123,6 +123,7 @@ static uint32_t num_architectural_pmu_gp_counters;
 static uint32_t num_architectural_pmu_fixed_counters;
 
 static int has_xsave;
+static int has_xsave2;
 static int has_xcrs;
 static int has_pit_state2;
 static int has_sregs2;
@@ -1586,6 +1587,26 @@ static Error *invtsc_mig_blocker;
 
 #define KVM_MAX_CPUID_ENTRIES  100
 
+static void kvm_init_xsave(CPUX86State *env)
+{
+    if (has_xsave2) {
+        env->xsave_buf_len = QEMU_ALIGN_UP(has_xsave2, 4096);
+    } else if (has_xsave) {
+        env->xsave_buf_len = sizeof(struct kvm_xsave);
+    } else {
+        return;
+    }
+
+    env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
+    memset(env->xsave_buf, 0, env->xsave_buf_len);
+    /*
+     * The allocated storage must be large enough for all of the
+     * possible XSAVE state components.
+     */
+    assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX) <=
+           env->xsave_buf_len);
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     struct {
@@ -1615,6 +1636,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     cpuid_i = 0;
 
+    has_xsave2 = kvm_check_extension(cs->kvm_state, KVM_CAP_XSAVE2);
+
     r = kvm_arch_set_tsc_khz(cs);
     if (r < 0) {
         return r;
@@ -2004,19 +2027,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (r) {
         goto fail;
     }
-
-    if (has_xsave) {
-        env->xsave_buf_len = sizeof(struct kvm_xsave);
-        env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
-        memset(env->xsave_buf, 0, env->xsave_buf_len);
-
-        /*
-         * The allocated storage must be large enough for all of the
-         * possible XSAVE state components.
-         */
-        assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX)
-               <= env->xsave_buf_len);
-    }
+    kvm_init_xsave(env);
 
     max_nested_state_len = kvm_max_nested_state_length();
     if (max_nested_state_len > 0) {
@@ -3320,13 +3331,14 @@ static int kvm_get_xsave(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
     void *xsave = env->xsave_buf;
-    int ret;
+    int type, ret;
 
     if (!has_xsave) {
         return kvm_get_fpu(cpu);
     }
 
-    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE, xsave);
+    type = has_xsave2 ? KVM_GET_XSAVE2 : KVM_GET_XSAVE;
+    ret = kvm_vcpu_ioctl(CPU(cpu), type, xsave);
     if (ret < 0) {
         return ret;
     }
diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
index ac61a96344..996e9f3bfe 100644
--- a/target/i386/xsave_helper.c
+++ b/target/i386/xsave_helper.c
@@ -126,6 +126,20 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 
         memcpy(pkru, &env->pkru, sizeof(env->pkru));
     }
+
+    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
+    if (e->size && e->offset) {
+        XSaveXTILECFG *tilecfg = buf + e->offset;
+
+        memcpy(tilecfg, &env->xtilecfg, sizeof(env->xtilecfg));
+    }
+
+    e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
+    if (e->size && e->offset && buflen >= e->size + e->offset) {
+        XSaveXTILEDATA *tiledata = buf + e->offset;
+
+        memcpy(tiledata, &env->xtiledata, sizeof(env->xtiledata));
+    }
 #endif
 }
 
@@ -247,5 +261,19 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
         pkru = buf + e->offset;
         memcpy(&env->pkru, pkru, sizeof(env->pkru));
     }
+
+    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
+    if (e->size && e->offset) {
+        const XSaveXTILECFG *tilecfg = buf + e->offset;
+
+        memcpy(&env->xtilecfg, tilecfg, sizeof(env->xtilecfg));
+    }
+
+    e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
+    if (e->size && e->offset && buflen >= e->size + e->offset) {
+        const XSaveXTILEDATA *tiledata = buf + e->offset;
+
+        memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
+    }
 #endif
 }
-- 
2.35.1



