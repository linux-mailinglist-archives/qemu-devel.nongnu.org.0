Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85984037D2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:26:06 +0200 (CEST)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNumL-00063c-Vq
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRu-0006kV-Qt
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRr-00034w-DV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1071629wmi.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=B4Q+ikA36ht5pIYGDG584KoDMDRt66i7fPbri/PbCM9LMbzXW2nhHpQWxyLXAqHToQ
 Mct0dLt7yLrFrdTnWfouDCP76bi+rlbz9L3mLd0VtOy31/JWxfiljt4CSFh2/g6BIfLx
 qF9FqFjkaAfeEhwkjnsSkkg/5nNhcWcjzi1imJsWFH/WdQME7dbWf2CGuVzuTlu7g1H6
 6IOqqJ0VxdRG16ZBFe0LOnI7wB1wRHt61oiabBoIpLkhWsQOj4iDrz1XcNbY1kqnlSF5
 1iWirUUYV2t9hzWLGroCvcYs79937kzffMg72/xH+H425Qs+JFMXT2CQLhly6XnK6QpW
 hOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=ShlsSyor/692l8lrPjrM+Y1R7i8hCUUfx6YDawyS7ZB/b9ZaVm4tEaEtihVVLC6VKv
 2FKGC0GT872pSjI4hvKkC7y+a3yTTPxLK2mFGFRitLs0cOXe7c+yLZMqrU0JTGXXMhYe
 /GgYH7bXCDiUI3gsN/dd4qFDY+CmNGjcOYTAUSXej9B2Vwy528lhK8d83P3t5GCVtz8M
 giF5IpQvL6pneAgTfaF8NOPW1saEWTasvlXIIY9mMTSN1I+uLd8IstWK6DuzWU4i8WZs
 SJS1VfesymMa+3erhHJ7Og7i9zRpFibkBB0Tgv/FPTJlTWwA5MQzAQVPlEz4CAUd7wXR
 J0sw==
X-Gm-Message-State: AOAM53256Sdr6zi4Mw1elJPpefMiLX1Z5XvvXQdAKntmU7BzLK8X6HWC
 6zGwnFnN4Ge+/EjDpM/PUigRZFlSr8g=
X-Google-Smtp-Source: ABdhPJz4f4Eb5h0Jy9fPsRxbBUKeRwSkpQuXgZ/Q4wejD0F/Y/RyrkAYVANTToUDiX6D4XQ1XUFdZA==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr2808344wmd.54.1631095494112; 
 Wed, 08 Sep 2021 03:04:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 25/43] hw/i386/fw_cfg: Set SGX bits in feature control
 fw_cfg accordingly
Date: Wed,  8 Sep 2021 12:04:08 +0200
Message-Id: <20210908100426.264356-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
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
 hw/i386/fw_cfg.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 4e68d5dea4..f6d036dfbe 100644
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
 
@@ -174,6 +174,14 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
         feature_control_bits |= FEATURE_CONTROL_LMCE;
     }
 
+    cpu_x86_cpuid(env, 0x7, 0, &unused, &ebx, &ecx, &unused);
+    if (ebx & CPUID_7_0_EBX_SGX) {
+        feature_control_bits |= FEATURE_CONTROL_SGX;
+    }
+    if (ecx & CPUID_7_0_ECX_SGX_LC) {
+        feature_control_bits |= FEATURE_CONTROL_SGX_LC;
+    }
+
     if (!feature_control_bits) {
         return;
     }
-- 
2.31.1



