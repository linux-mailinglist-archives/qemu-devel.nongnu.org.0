Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CBC417125
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:46:39 +0200 (CEST)
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjf3-0004FS-RX
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKZ-0007rj-8g
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:27 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKX-0000a4-Pn
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:27 -0400
Received: by mail-ed1-x52e.google.com with SMTP id eg28so35035791edb.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=hPuqI9x5K8KX2dm98Tz6xf8Vijr6U0ypheChv2KcHc9s60ZXDAWVIAddTBKkjsgAgb
 fhNnHMDPbmrXqKjcjuqwKpSJk5yHKR9tPjmxM69QOYBBuWsAZcCrf6BITN1xlgGi9gsj
 g4l9tGnaQ09t2haxfV+aihet+AowqnABbLZBKna+jW+/pkVRnykjf47rxPi1dcUEO3hN
 d5qbZzDuo6PQGGrtFa8LcFmDK984vjjWcsiSZ2vaWAUvVpPSH51qPPMQqlAHSBpM6jKv
 HV8MFMtUvnLGhHXwrqeczRwmw0HKOhuY4K5eBX7J941Vhddc4ryU+SALMwPucI9T8gFm
 IhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=mKA0sAoKsM5El7c39mp/fynwGxdLOvx8iaIYNC59BhPrnYG91JBiMocIvg2Sg5oBXy
 KzcVAxzgjIAWlVCZEYYRnrfyRnZlRu2mr8i2v7rg2buz74Z6mR+PP6W2Om4p/vM7ylf2
 A4zEcdq/XGCYJa8RfD+fjyQJyREdYrGvixZpFkHZesaXvT6HOdCiaXMSf1ZjdmvvpRzr
 i6Dm4JOCcNgD82X3WMSfzlCXpAJUJJN0CM2TPPBIVLakKWOjW0pWq/Q51sdjNJEj0GaO
 8N8nUAQDwOR/b1ikdFbV5y4sf43V59jeLiU7aO4aZp7CaVHECVKlNXdXGx3y7esjWWto
 KcdA==
X-Gm-Message-State: AOAM530o0QCeIzAW4gXeOykaCBq4XRM2ArTgTJwLG9vb8ZmdUj3KMfh/
 /S3O35WAVxciHfNYdfTMX1aHaaR+9a4=
X-Google-Smtp-Source: ABdhPJy0qdKYNQgP/eOhWx06njUwNJ0/aK3RqAZcJZwaIZKNYed791Uo9MHU9N6e0IXOmej3oXCvkA==
X-Received: by 2002:a17:906:e20e:: with SMTP id
 gf14mr10751560ejb.244.1632482724582; 
 Fri, 24 Sep 2021 04:25:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/26] hw/i386/fw_cfg: Set SGX bits in feature control
 fw_cfg accordingly
Date: Fri, 24 Sep 2021 13:25:00 +0200
Message-Id: <20210924112509.25061-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
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



