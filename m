Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF4C3BC939
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:38 +0200 (CEST)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i4D-0005oy-Rn
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hts-0000no-FI
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htn-0002GH-PR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id l5so8616825wrv.7
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEcKjaiMM/JbrRRCkkOFDlxCVuzGIDf8YRNE5Qoe0Kc=;
 b=ZubbF25w7asDQaUUD/8QCZbJqIx5sZPCSdw5Z/h+ZKsCkrvQtg14vxA0WpNW4LczER
 8U9B++8eG8m3CX27JjORTEMfSYGW/DXdpJnXZkkKzygVCi3/VEBlqzBuegnhXb5f6i63
 dQOoARCMo2p41ZMf0NCT/h9yO3apEuCscVkdxoD5oxpBReq8wsCzW2QRs3lEa5stgFVe
 I+sBQFiW8ZbL+f8Wh/SrlC2agTi8wequlE3v3SHvWOQjdsrSuFJbYdeOULv3gKr5Suf7
 UXv65T0kZHDR+USz+uK0Li0XcRthfdHKIJbHPuVV3fmJoasad5Y+2sazKZEndbrxuG9A
 CR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iEcKjaiMM/JbrRRCkkOFDlxCVuzGIDf8YRNE5Qoe0Kc=;
 b=anxCMl+Ge7Kd6JSxHdgniR7MSliSIbr6vSs96PFVr7fpRyFtkoWmvUKFIvR+cFuBGY
 Z79l4w9l+kYa/Nbs5HzRVmVpILGnTsCTdagrtZr2CYRL104CnIsEEcKK0phsfrpZ61qp
 PipMVXpsMubjTMuy8ygMEmibnrGA9hj787y8l6fH/6EIL6L7vbhonMdelQpHrPgLZ/10
 cpIRHuiZRQWm/qZ+/sl1nstg9hI0IMWd+F0cqSPxCXzpOhpYDSmKGZm3+ul60G8DiDKF
 jk+ntV8ydxM0+a/+tPUP2XxztNR5xIfNxQFoJHBSte/rohUw2tyKJzFwP3YOL5gnNF6J
 /Erw==
X-Gm-Message-State: AOAM533sM3X6a5ay3ueJzhp7qzop++uYh2DFLyFEaWflOfcPHGHemcyM
 zb+zIWOpb6wgyhXiY5PjC0uwvORWcEI=
X-Google-Smtp-Source: ABdhPJwApq6Q8k5/PCuJIGEY5zNl7Tj2Z3ITP/wLZYtDolSPRLju6bLf/BCxI6hVvtXtzgUhbmj61w==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr20280366wrz.188.1625565710443; 
 Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/40] target/i386: Make x86_ext_save_areas visible outside
 cpu.c
Date: Tue,  6 Jul 2021 12:01:13 +0200
Message-Id: <20210706100141.303960-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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

Provide visibility of the x86_ext_save_areas array and associated type
outside of cpu.c.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210705104632.2902400-6-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 7 +------
 target/i386/cpu.h | 9 +++++++++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d8f3ab3192..13caa0de50 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1304,12 +1304,7 @@ static const X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
 };
 #undef REGISTER
 
-typedef struct ExtSaveArea {
-    uint32_t feature, bits;
-    uint32_t offset, size;
-} ExtSaveArea;
-
-static const ExtSaveArea x86_ext_save_areas[] = {
+const ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_FP_BIT] = {
         /* x87 FP state component is always enabled if XSAVE is supported */
         .feature = FEAT_1_ECX, .bits = CPUID_EXT_XSAVE,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ada2941c6e..c9c0a34330 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1370,6 +1370,15 @@ QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFF
 QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
 QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
 
+typedef struct ExtSaveArea {
+    uint32_t feature, bits;
+    uint32_t offset, size;
+} ExtSaveArea;
+
+#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
+
+extern const ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
+
 typedef enum TPRAccess {
     TPR_ACCESS_READ,
     TPR_ACCESS_WRITE,
-- 
2.31.1



