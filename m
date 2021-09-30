Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EAF41DCD1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:59:41 +0200 (CEST)
Received: from localhost ([::1]:59582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxX8-0001iY-Hi
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVxV8-000861-F7
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:57:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVxV6-0000fY-Tg
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 10:57:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id s21so10555211wra.7
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SLl+6KMGyZnuJoBHqNhfBpYJZ/p9qSf5AH2j1qqgT7c=;
 b=Elq57thxE9+jBD2WzCYXOmK9U4emQaw7aXY1C5lnTe94GIXv3Wf99GGrF2+Jsyil/B
 eYhXfmzlXX82/Ido0DuzcpEpFIfHQLhC4uu+KErXAzVtglO6FPN+9/IqCYp9Tp6I3Nlp
 pmzpW+pvNNYKlodn3ldLAE0LmH7QDsui3q5O2feIRpKFCDFXERkygfs6gMPB1S6J3pqO
 LGaLoK3qk3KHke7b6tRYZ+ohq8xPHZf8cObfXm972qEvu1qeqU4VbAkdzMQoWz3cV5Ii
 ve0Le5XEwdU+EYPDTXLNeF8cEin1Mhd6ykQbHZQPxTUV9zmWmBNroLwozv8x/WoJccj2
 Nr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SLl+6KMGyZnuJoBHqNhfBpYJZ/p9qSf5AH2j1qqgT7c=;
 b=C1NanX84+l95fJ5yjkc+o115KcM7eW/8RZDlyCq/CwqpHF48pPC5Fn1fDm9FfXGhOt
 sTnlYCfADOfHEkGT2uIqVJglmV+2O/DkYXFzUwM6741jMw01bY8qV9aNkQ3iZDjlDVzc
 /cJagP02H02vEaPol2H9cvmOt/4wxCctCM35g1vIx89RAbC374srPhBAr8AbeqF5YT+P
 wOlvq38AEuu+lptuDTXbU6bUXYKuET6fF0WeV0ICO0+UgDtS9SIt3yOmKPjOW16es2Gp
 FqZZDgfqn11GZ9vFtDkhsNm43MvQZGuye/4ZYGX+1qnQBpxHvrEbjfJ12ZW/uZNYVfsR
 pW6A==
X-Gm-Message-State: AOAM531ZZSJESJ0IjZEVlIoe8gNr15oXmwaWzCfUUtsZUkgmkABtRq/B
 Y2g6lWnjCacvCV29EZZnr+8YbC5pu1E=
X-Google-Smtp-Source: ABdhPJy0WCrlywIihD4sgMnAgG7oUcwpeVZxb0sojv3+uA4khuEFp/SbYzMhaOIIjkikKjWTU3zboA==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr6612270wrx.372.1633013851593; 
 Thu, 30 Sep 2021 07:57:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z7sm4961256wmi.12.2021.09.30.07.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:57:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/33] hw/i386/fw_cfg: Set SGX bits in feature control
 fw_cfg accordingly
Date: Thu, 30 Sep 2021 16:57:22 +0200
Message-Id: <20210930145722.184577-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930145722.184577-1-pbonzini@redhat.com>
References: <20210930145722.184577-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Request SGX an SGX Launch Control to be enabled in FEATURE_CONTROL
when the features are exposed to the guest. Our design is the SGX
Launch Control bit will be unconditionally set in FEATURE_CONTROL,
which is unlike host bios.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-17-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/fw_cfg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 4e68d5dea4..a283785a8d 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -159,7 +159,7 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
 {
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
     CPUX86State *env = &cpu->env;
-    uint32_t unused, ecx, edx;
+    uint32_t unused, ebx, ecx, edx;
     uint64_t feature_control_bits = 0;
     uint64_t *val;
 
@@ -174,6 +174,16 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
         feature_control_bits |= FEATURE_CONTROL_LMCE;
     }
 
+    if (env->cpuid_level >= 7) {
+        cpu_x86_cpuid(env, 0x7, 0, &unused, &ebx, &ecx, &unused);
+        if (ebx & CPUID_7_0_EBX_SGX) {
+            feature_control_bits |= FEATURE_CONTROL_SGX;
+        }
+        if (ecx & CPUID_7_0_ECX_SGX_LC) {
+            feature_control_bits |= FEATURE_CONTROL_SGX_LC;
+        }
+    }
+
     if (!feature_control_bits) {
         return;
     }
-- 
2.31.1

