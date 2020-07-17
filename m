Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65166223BE6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 15:05:56 +0200 (CEST)
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwQ3n-0003aL-Gg
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 09:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1jwPv5-00078Y-4a
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 08:56:55 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1jwPv2-00006T-Tl
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 08:56:54 -0400
Received: by mail-wr1-x441.google.com with SMTP id f18so11024193wrs.0
 for <qemu-devel@nongnu.org>; Fri, 17 Jul 2020 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvqpJaFuyIRbTlQ56yg7bf2cu3N5rkZU9juEgqCjboA=;
 b=RzY7I6aO82EFjGIny4SKRz4xMlG8+ySzK4rBpaqdDI55Bs67mKygVgBb/EK+RlNnax
 85YcpLLEkU4Myp9Ha3HbQo5aPqvNmN49jM5POh1pGfjPxk8TflOpT2PZdQ93NWw/a8wZ
 kA0jQQcJtE4HGig464Dhe/8KjLeLUgCa985xTRhDSwDpJxkRbBNolv/8ho/Pxr40NIMw
 td3EJFywL8CU4LSpi0pjgguROSMX0NveYMniP6G0NIzUjA0P6UnT3+cBzk3m1MqmM07J
 7t3mR4S2OkWVK4DTasmIyTgaHMmwZKxTSgcLcS6UyusEKNMtDrNgJg07DCx+DDaycd3B
 8STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvqpJaFuyIRbTlQ56yg7bf2cu3N5rkZU9juEgqCjboA=;
 b=jlDN9L37o4H97fph3yyZdIFcpQ91xDvlTRQkZO2QLQzrOHeFm1hNtFMRsW6L8iP+uz
 RhmwRAqxyw6/MxQXE/Djtecu2KmlQfffQ8t6LoFXl95l9QVADSO422LIB7GJdRUOknRc
 mquLVfsqXbqxonV/3q+uB5lrWLYqAtM15g2EniIBvUjlV8ZuAGIr7S+WNvnsV1Tir7gN
 ZI7gKKOJdSqNxr0/STIrOeD7aDGQa/gptY/zIO6RL0NeDFlGIShkU3ReKepTC+huWRak
 xvLFDiZwO7UPnhuXmb85OTzfJQvVmLX0DkPVG0+yYnmu+ZHpHfvz+kg6WGuMcOCyBDxM
 OlUg==
X-Gm-Message-State: AOAM531jHMm/gGkR9WQvOhkteWxSOSe7D37PdrolqtpZLGBvEVw/GXlS
 ZW7KqBFCUgshMz1+7fjuKErMqZ9F
X-Google-Smtp-Source: ABdhPJy2Dt9V8/HhVXtk9doRVo9Qzh0djv9OXJyILONhuYSPv3H/2cq/CyD/1PulzjEmGuvfhMsSGg==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr10022765wrj.273.1594990611165; 
 Fri, 17 Jul 2020 05:56:51 -0700 (PDT)
Received: from jondnuc.lan (IGLD-84-229-155-64.inter.net.il. [84.229.155.64])
 by smtp.gmail.com with ESMTPSA id
 g82sm13655710wma.37.2020.07.17.05.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 05:56:50 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] hyperv: Enable SCONTROL if SYNIC is enabled
Date: Fri, 17 Jul 2020 15:56:39 +0300
Message-Id: <20200717125639.1103876-2-arilou@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717125639.1103876-1-arilou@gmail.com>
References: <20200717125639.1103876-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on an analysis of the HyperV firmwares (Gen1 and Gen2) it seems
like the SCONTROL is not being set to the ENABLED state as like we have
thought.

Also from a test done by Vitaly Kuznetsov, running a nested HyperV it
was concluded that the first access to the SCONTROL MSR with a read
resulted with the value of 0x1, aka HV_SYNIC_CONTROL_ENABLE.

It's important to note that this diverges from the value states in the
HyperV TLFS of 0.

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 target/i386/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index b8455c89ed..6a62e8ae94 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1904,6 +1904,8 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
         int i;
+
+        env->msr_hv_synic_control = HV_SYNIC_ENABLE;
         for (i = 0; i < ARRAY_SIZE(env->msr_hv_synic_sint); i++) {
             env->msr_hv_synic_sint[i] = HV_SINT_MASKED;
         }
-- 
2.24.1


