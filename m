Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D73BC96E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:22:04 +0200 (CEST)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iDL-0003pV-Dh
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htr-0000lP-6Q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htm-0002Fg-2I
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id w13so13163117wmc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InVZ8IiIw0iRk9bXE80zEbxFF9vVoh/T2t00rLx4awA=;
 b=rSqIDFcKM0LWC9IsBs1eZiYM55Idj601G4VhRiNBFObgtgjns6YjtyMJclvuShczCS
 rVW740FIrje9W7/eGvOcl7kneSYZE+8WcFWNXTXDk05X5SeknqI/nmmnhzp21Hoxxf0p
 ZRKBnHcsJxLP2/8tSNwk7J/5vWxS5XDC2bgtoEEHbC1bD+3VOO5fPIZl1TMFnXQAnfEn
 rJRSF6w2jpdHaTIGgYYV7875lr3uTLOp7rg/i8Fws17HwwgEtZvNA+Re0kSnzy6EjGHz
 jvk07Dr4n9cfNpU8/4EO+B3cs5uL4rr/1n8OuCPs957q8KMZ/dbfLRaZP9tZlC7kUNxB
 x/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=InVZ8IiIw0iRk9bXE80zEbxFF9vVoh/T2t00rLx4awA=;
 b=KMgUXeamevreHjdxpK/Y2k0ySyF1v4lCcaRE9UDJyb9XMWcVUaao1TREb/NC0oHJ4W
 jH9dvuG3SqRFLLqc+jBG8kkgYXIAAxMKta2hP8R6PIfAMST9zv649fXKqjXSATLkU9ub
 mxdnddFRLhjUBFV4cyibGJeJJ6lo6UQKJZBXLYrN7ScuSpWavG//T86kqIqlpORRQ2Qr
 /EN5UYSlP8zE+bIreBUnrTzEbIgZrXorqHDx97ND58pO5z4GUVEYfLc6WFa16Kl5WcMc
 QGgNct5O6pbrQojCfvpiuwGvhlGPCjQM5WrFEou6fYG1bOvnOC+fok4bNwpxHjXB13r/
 j1vQ==
X-Gm-Message-State: AOAM531uFOiHqbDcwil+GTSwaOBJD5QS9+ScFZzbJj7a40omYkfIBPF/
 mbPBDh7sfZoff/CmcanZZylQ7g1DOIk=
X-Google-Smtp-Source: ABdhPJxRXctQbUMKqAvk2MmZj7qNsN77fA2C0ewoek0B7q2cLvh0ogJCc1WCBW+BZNeD0xKBqhT+0g==
X-Received: by 2002:a1c:ac87:: with SMTP id v129mr3964548wme.45.1625565708652; 
 Tue, 06 Jul 2021 03:01:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/40] target/i386: Consolidate the X86XSaveArea offset checks
Date: Tue,  6 Jul 2021 12:01:10 +0200
Message-Id: <20210706100141.303960-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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

Rather than having similar but different checks in cpu.h and kvm.c,
move them all to cpu.h.
Message-Id: <20210705104632.2902400-3-david.edmondson@oracle.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h     | 22 +++++++++++++++-------
 target/i386/kvm/kvm.c | 39 ---------------------------------------
 2 files changed, 15 insertions(+), 46 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index aedb8f2e01..6590ad6391 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1341,21 +1341,29 @@ typedef struct X86XSaveArea {
     XSavePKRU pkru_state;
 } X86XSaveArea;
 
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
+
 typedef enum TPRAccess {
     TPR_ACCESS_READ,
     TPR_ACCESS_WRITE,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 04e4ec063f..3ab1d71775 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2466,45 +2466,6 @@ static int kvm_put_fpu(X86CPU *cpu)
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_FPU, &fpu);
 }
 
-#define XSAVE_FCW_FSW     0
-#define XSAVE_FTW_FOP     1
-#define XSAVE_CWD_RIP     2
-#define XSAVE_CWD_RDP     4
-#define XSAVE_MXCSR       6
-#define XSAVE_ST_SPACE    8
-#define XSAVE_XMM_SPACE   40
-#define XSAVE_XSTATE_BV   128
-#define XSAVE_YMMH_SPACE  144
-#define XSAVE_BNDREGS     240
-#define XSAVE_BNDCSR      256
-#define XSAVE_OPMASK      272
-#define XSAVE_ZMM_Hi256   288
-#define XSAVE_Hi16_ZMM    416
-#define XSAVE_PKRU        672
-
-#define XSAVE_BYTE_OFFSET(word_offset) \
-    ((word_offset) * sizeof_field(struct kvm_xsave, region[0]))
-
-#define ASSERT_OFFSET(word_offset, field) \
-    QEMU_BUILD_BUG_ON(XSAVE_BYTE_OFFSET(word_offset) != \
-                      offsetof(X86XSaveArea, field))
-
-ASSERT_OFFSET(XSAVE_FCW_FSW, legacy.fcw);
-ASSERT_OFFSET(XSAVE_FTW_FOP, legacy.ftw);
-ASSERT_OFFSET(XSAVE_CWD_RIP, legacy.fpip);
-ASSERT_OFFSET(XSAVE_CWD_RDP, legacy.fpdp);
-ASSERT_OFFSET(XSAVE_MXCSR, legacy.mxcsr);
-ASSERT_OFFSET(XSAVE_ST_SPACE, legacy.fpregs);
-ASSERT_OFFSET(XSAVE_XMM_SPACE, legacy.xmm_regs);
-ASSERT_OFFSET(XSAVE_XSTATE_BV, header.xstate_bv);
-ASSERT_OFFSET(XSAVE_YMMH_SPACE, avx_state);
-ASSERT_OFFSET(XSAVE_BNDREGS, bndreg_state);
-ASSERT_OFFSET(XSAVE_BNDCSR, bndcsr_state);
-ASSERT_OFFSET(XSAVE_OPMASK, opmask_state);
-ASSERT_OFFSET(XSAVE_ZMM_Hi256, zmm_hi256_state);
-ASSERT_OFFSET(XSAVE_Hi16_ZMM, hi16_zmm_state);
-ASSERT_OFFSET(XSAVE_PKRU, pkru_state);
-
 static int kvm_put_xsave(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
-- 
2.31.1



