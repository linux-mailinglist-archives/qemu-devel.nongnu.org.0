Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F037C3BC9CB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:26:36 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iHj-0005OR-Tq
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htt-0000r8-FH
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hto-0002HH-Qt
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so1280600wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h26JCKiODGRB2hjkr2CRxRVz06FHkAd+nK2kSLVhu8M=;
 b=Wd37fgESi4nmy1+w7TgfWXxnIvVuH0gUUNmskX5H29jyhEMfN3vJuPevGoJUy5vmbS
 tdhEr3WzJGm/qC4BwvdY5+s+zBWJwc8yN59VJXqtNMRTineN7YhA8MpivyFdV3YMCOEP
 09Gyhadln3MmqwXhqIrhRj+LvD/LmmXXVWpERf+xq37AFh6s9RRmTiLDvN07+6yLWNAR
 0yNxNfXKU4c+YPdQ1HVp3QXR+IJwumYhbOA3Lfz1vImJomrp6Y1WkDbowqLMm0TVTZ2c
 IYygrDOFBT7t+58SdtcKPVH/7PplWu4dDReHJuIxXFUCYo6P/UKtYMWn9WF07tIhCJei
 0stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h26JCKiODGRB2hjkr2CRxRVz06FHkAd+nK2kSLVhu8M=;
 b=BuMQ3+bLkpTBe/2KubEqWASaRij3JmbCgZcriLxt9hClJr3FJZrOE6xQD41WOOoDNL
 o667Bl+iHXxf4ebv7ytuJRi7ZuqSmTz9urDB87Osz8fStbflT38vYLtZ3u8zuYQ/7Bth
 q2G8byhllIxPCNxWEJT7ZiXdmJxHhp6GSvJ14GLdZSd/o2s2tiEzt3MSgtTsHTN0tOCF
 GWql9NvI8+GnroMEJe6ZgRwAwd4kR/1dFdydIQc1pcoac93GPu6Q4qSdHEENzOECKQDM
 0NaTs3U7NXwy2XNOU2jG2TuAkodJ8YhOSvmwm6JIW2PooIWyL/INv2nOIb+d1rzbEAl2
 XI/Q==
X-Gm-Message-State: AOAM530fh8nUMX828S/+CLmo9q6cYnt8RbuquExYlV7fVrGix95BMDYz
 Y2m3u+OXC8DcC7UpjgMqI0OC07uOdmE=
X-Google-Smtp-Source: ABdhPJwgB4+2wdN4jjTnbS7O68Nxw5XSUoHKFTDA4022jUBKeLvlr3hWpC0vKxKcwCRizoiNPQyeFA==
X-Received: by 2002:a05:600c:3783:: with SMTP id
 o3mr3874106wmr.123.1625565711149; 
 Tue, 06 Jul 2021 03:01:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/40] target/i386: Observe XSAVE state area offsets
Date: Tue,  6 Jul 2021 12:01:14 +0200
Message-Id: <20210706100141.303960-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Rather than relying on the X86XSaveArea structure definition directly,
the routines that manipulate the XSAVE state area should observe the
offsets declared in the x86_ext_save_areas array.

Currently the offsets declared in the array are derived from the
structure definition, resulting in no functional change.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210705104632.2902400-7-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/xsave_helper.c | 262 ++++++++++++++++++++++++++++---------
 1 file changed, 200 insertions(+), 62 deletions(-)

diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
index b16c6ac0fe..ac61a96344 100644
--- a/target/i386/xsave_helper.c
+++ b/target/i386/xsave_helper.c
@@ -9,13 +9,20 @@
 void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 {
     CPUX86State *env = &cpu->env;
-    X86XSaveArea *xsave = buf;
-    uint16_t cwd, swd, twd;
+    const ExtSaveArea *e, *f;
     int i;
 
-    assert(buflen >= sizeof(*xsave));
+    X86LegacyXSaveArea *legacy;
+    X86XSaveHeader *header;
+    uint16_t cwd, swd, twd;
+
+    memset(buf, 0, buflen);
+
+    e = &x86_ext_save_areas[XSTATE_FP_BIT];
+
+    legacy = buf + e->offset;
+    header = buf + e->offset + sizeof(*legacy);
 
-    memset(xsave, 0, buflen);
     twd = 0;
     swd = env->fpus & ~(7 << 11);
     swd |= (env->fpstt & 7) << 11;
@@ -23,91 +30,222 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
     for (i = 0; i < 8; ++i) {
         twd |= (!env->fptags[i]) << i;
     }
-    xsave->legacy.fcw = cwd;
-    xsave->legacy.fsw = swd;
-    xsave->legacy.ftw = twd;
-    xsave->legacy.fpop = env->fpop;
-    xsave->legacy.fpip = env->fpip;
-    xsave->legacy.fpdp = env->fpdp;
-    memcpy(&xsave->legacy.fpregs, env->fpregs,
-            sizeof env->fpregs);
-    xsave->legacy.mxcsr = env->mxcsr;
-    xsave->header.xstate_bv = env->xstate_bv;
-    memcpy(&xsave->bndreg_state.bnd_regs, env->bnd_regs,
-            sizeof env->bnd_regs);
-    xsave->bndcsr_state.bndcsr = env->bndcs_regs;
-    memcpy(&xsave->opmask_state.opmask_regs, env->opmask_regs,
-            sizeof env->opmask_regs);
+    legacy->fcw = cwd;
+    legacy->fsw = swd;
+    legacy->ftw = twd;
+    legacy->fpop = env->fpop;
+    legacy->fpip = env->fpip;
+    legacy->fpdp = env->fpdp;
+    memcpy(&legacy->fpregs, env->fpregs,
+           sizeof(env->fpregs));
+    legacy->mxcsr = env->mxcsr;
 
     for (i = 0; i < CPU_NB_REGS; i++) {
-        uint8_t *xmm = xsave->legacy.xmm_regs[i];
-        uint8_t *ymmh = xsave->avx_state.ymmh[i];
-        uint8_t *zmmh = xsave->zmm_hi256_state.zmm_hi256[i];
+        uint8_t *xmm = legacy->xmm_regs[i];
+
         stq_p(xmm,     env->xmm_regs[i].ZMM_Q(0));
-        stq_p(xmm+8,   env->xmm_regs[i].ZMM_Q(1));
-        stq_p(ymmh,    env->xmm_regs[i].ZMM_Q(2));
-        stq_p(ymmh+8,  env->xmm_regs[i].ZMM_Q(3));
-        stq_p(zmmh,    env->xmm_regs[i].ZMM_Q(4));
-        stq_p(zmmh+8,  env->xmm_regs[i].ZMM_Q(5));
-        stq_p(zmmh+16, env->xmm_regs[i].ZMM_Q(6));
-        stq_p(zmmh+24, env->xmm_regs[i].ZMM_Q(7));
+        stq_p(xmm + 8, env->xmm_regs[i].ZMM_Q(1));
+    }
+
+    header->xstate_bv = env->xstate_bv;
+
+    e = &x86_ext_save_areas[XSTATE_YMM_BIT];
+    if (e->size && e->offset) {
+        XSaveAVX *avx;
+
+        avx = buf + e->offset;
+
+        for (i = 0; i < CPU_NB_REGS; i++) {
+            uint8_t *ymmh = avx->ymmh[i];
+
+            stq_p(ymmh,     env->xmm_regs[i].ZMM_Q(2));
+            stq_p(ymmh + 8, env->xmm_regs[i].ZMM_Q(3));
+        }
+    }
+
+    e = &x86_ext_save_areas[XSTATE_BNDREGS_BIT];
+    if (e->size && e->offset) {
+        XSaveBNDREG *bndreg;
+        XSaveBNDCSR *bndcsr;
+
+        f = &x86_ext_save_areas[XSTATE_BNDCSR_BIT];
+        assert(f->size);
+        assert(f->offset);
+
+        bndreg = buf + e->offset;
+        bndcsr = buf + f->offset;
+
+        memcpy(&bndreg->bnd_regs, env->bnd_regs,
+               sizeof(env->bnd_regs));
+        bndcsr->bndcsr = env->bndcs_regs;
+    }
+
+    e = &x86_ext_save_areas[XSTATE_OPMASK_BIT];
+    if (e->size && e->offset) {
+        XSaveOpmask *opmask;
+        XSaveZMM_Hi256 *zmm_hi256;
+#ifdef TARGET_X86_64
+        XSaveHi16_ZMM *hi16_zmm;
+#endif
+
+        f = &x86_ext_save_areas[XSTATE_ZMM_Hi256_BIT];
+        assert(f->size);
+        assert(f->offset);
+
+        opmask = buf + e->offset;
+        zmm_hi256 = buf + f->offset;
+
+        memcpy(&opmask->opmask_regs, env->opmask_regs,
+               sizeof(env->opmask_regs));
+
+        for (i = 0; i < CPU_NB_REGS; i++) {
+            uint8_t *zmmh = zmm_hi256->zmm_hi256[i];
+
+            stq_p(zmmh,      env->xmm_regs[i].ZMM_Q(4));
+            stq_p(zmmh + 8,  env->xmm_regs[i].ZMM_Q(5));
+            stq_p(zmmh + 16, env->xmm_regs[i].ZMM_Q(6));
+            stq_p(zmmh + 24, env->xmm_regs[i].ZMM_Q(7));
+        }
+
+#ifdef TARGET_X86_64
+        f = &x86_ext_save_areas[XSTATE_Hi16_ZMM_BIT];
+        assert(f->size);
+        assert(f->offset);
+
+        hi16_zmm = buf + f->offset;
+
+        memcpy(&hi16_zmm->hi16_zmm, &env->xmm_regs[16],
+               16 * sizeof(env->xmm_regs[16]));
+#endif
     }
 
 #ifdef TARGET_X86_64
-    memcpy(&xsave->hi16_zmm_state.hi16_zmm, &env->xmm_regs[16],
-            16 * sizeof env->xmm_regs[16]);
-    memcpy(&xsave->pkru_state, &env->pkru, sizeof env->pkru);
+    e = &x86_ext_save_areas[XSTATE_PKRU_BIT];
+    if (e->size && e->offset) {
+        XSavePKRU *pkru = buf + e->offset;
+
+        memcpy(pkru, &env->pkru, sizeof(env->pkru));
+    }
 #endif
 }
 
 void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
 {
     CPUX86State *env = &cpu->env;
-    const X86XSaveArea *xsave = buf;
+    const ExtSaveArea *e, *f, *g;
     int i;
+
+    const X86LegacyXSaveArea *legacy;
+    const X86XSaveHeader *header;
     uint16_t cwd, swd, twd;
 
-    assert(buflen >= sizeof(*xsave));
+    e = &x86_ext_save_areas[XSTATE_FP_BIT];
 
-    cwd = xsave->legacy.fcw;
-    swd = xsave->legacy.fsw;
-    twd = xsave->legacy.ftw;
-    env->fpop = xsave->legacy.fpop;
+    legacy = buf + e->offset;
+    header = buf + e->offset + sizeof(*legacy);
+
+    cwd = legacy->fcw;
+    swd = legacy->fsw;
+    twd = legacy->ftw;
+    env->fpop = legacy->fpop;
     env->fpstt = (swd >> 11) & 7;
     env->fpus = swd;
     env->fpuc = cwd;
     for (i = 0; i < 8; ++i) {
         env->fptags[i] = !((twd >> i) & 1);
     }
-    env->fpip = xsave->legacy.fpip;
-    env->fpdp = xsave->legacy.fpdp;
-    env->mxcsr = xsave->legacy.mxcsr;
-    memcpy(env->fpregs, &xsave->legacy.fpregs,
-            sizeof env->fpregs);
-    env->xstate_bv = xsave->header.xstate_bv;
-    memcpy(env->bnd_regs, &xsave->bndreg_state.bnd_regs,
-            sizeof env->bnd_regs);
-    env->bndcs_regs = xsave->bndcsr_state.bndcsr;
-    memcpy(env->opmask_regs, &xsave->opmask_state.opmask_regs,
-            sizeof env->opmask_regs);
+    env->fpip = legacy->fpip;
+    env->fpdp = legacy->fpdp;
+    env->mxcsr = legacy->mxcsr;
+    memcpy(env->fpregs, &legacy->fpregs,
+           sizeof(env->fpregs));
 
     for (i = 0; i < CPU_NB_REGS; i++) {
-        const uint8_t *xmm = xsave->legacy.xmm_regs[i];
-        const uint8_t *ymmh = xsave->avx_state.ymmh[i];
-        const uint8_t *zmmh = xsave->zmm_hi256_state.zmm_hi256[i];
+        const uint8_t *xmm = legacy->xmm_regs[i];
+
         env->xmm_regs[i].ZMM_Q(0) = ldq_p(xmm);
-        env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm+8);
-        env->xmm_regs[i].ZMM_Q(2) = ldq_p(ymmh);
-        env->xmm_regs[i].ZMM_Q(3) = ldq_p(ymmh+8);
-        env->xmm_regs[i].ZMM_Q(4) = ldq_p(zmmh);
-        env->xmm_regs[i].ZMM_Q(5) = ldq_p(zmmh+8);
-        env->xmm_regs[i].ZMM_Q(6) = ldq_p(zmmh+16);
-        env->xmm_regs[i].ZMM_Q(7) = ldq_p(zmmh+24);
+        env->xmm_regs[i].ZMM_Q(1) = ldq_p(xmm + 8);
+    }
+
+    env->xstate_bv = header->xstate_bv;
+
+    e = &x86_ext_save_areas[XSTATE_YMM_BIT];
+    if (e->size && e->offset) {
+        const XSaveAVX *avx;
+
+        avx = buf + e->offset;
+        for (i = 0; i < CPU_NB_REGS; i++) {
+            const uint8_t *ymmh = avx->ymmh[i];
+
+            env->xmm_regs[i].ZMM_Q(2) = ldq_p(ymmh);
+            env->xmm_regs[i].ZMM_Q(3) = ldq_p(ymmh + 8);
+        }
+    }
+
+    e = &x86_ext_save_areas[XSTATE_BNDREGS_BIT];
+    if (e->size && e->offset) {
+        const XSaveBNDREG *bndreg;
+        const XSaveBNDCSR *bndcsr;
+
+        f = &x86_ext_save_areas[XSTATE_BNDCSR_BIT];
+        assert(f->size);
+        assert(f->offset);
+
+        bndreg = buf + e->offset;
+        bndcsr = buf + f->offset;
+
+        memcpy(env->bnd_regs, &bndreg->bnd_regs,
+               sizeof(env->bnd_regs));
+        env->bndcs_regs = bndcsr->bndcsr;
+    }
+
+    e = &x86_ext_save_areas[XSTATE_OPMASK_BIT];
+    if (e->size && e->offset) {
+        const XSaveOpmask *opmask;
+        const XSaveZMM_Hi256 *zmm_hi256;
+#ifdef TARGET_X86_64
+        const XSaveHi16_ZMM *hi16_zmm;
+#endif
+
+        f = &x86_ext_save_areas[XSTATE_ZMM_Hi256_BIT];
+        assert(f->size);
+        assert(f->offset);
+
+        g = &x86_ext_save_areas[XSTATE_Hi16_ZMM_BIT];
+        assert(g->size);
+        assert(g->offset);
+
+        opmask = buf + e->offset;
+        zmm_hi256 = buf + f->offset;
+#ifdef TARGET_X86_64
+        hi16_zmm = buf + g->offset;
+#endif
+
+        memcpy(env->opmask_regs, &opmask->opmask_regs,
+               sizeof(env->opmask_regs));
+
+        for (i = 0; i < CPU_NB_REGS; i++) {
+            const uint8_t *zmmh = zmm_hi256->zmm_hi256[i];
+
+            env->xmm_regs[i].ZMM_Q(4) = ldq_p(zmmh);
+            env->xmm_regs[i].ZMM_Q(5) = ldq_p(zmmh + 8);
+            env->xmm_regs[i].ZMM_Q(6) = ldq_p(zmmh + 16);
+            env->xmm_regs[i].ZMM_Q(7) = ldq_p(zmmh + 24);
+        }
+
+#ifdef TARGET_X86_64
+        memcpy(&env->xmm_regs[16], &hi16_zmm->hi16_zmm,
+               16 * sizeof(env->xmm_regs[16]));
+#endif
     }
 
 #ifdef TARGET_X86_64
-    memcpy(&env->xmm_regs[16], &xsave->hi16_zmm_state.hi16_zmm,
-           16 * sizeof env->xmm_regs[16]);
-    memcpy(&env->pkru, &xsave->pkru_state, sizeof env->pkru);
+    e = &x86_ext_save_areas[XSTATE_PKRU_BIT];
+    if (e->size && e->offset) {
+        const XSavePKRU *pkru;
+
+        pkru = buf + e->offset;
+        memcpy(&env->pkru, pkru, sizeof(env->pkru));
+    }
 #endif
 }
-- 
2.31.1



