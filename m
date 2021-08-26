Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FE3F8CFF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:28:38 +0200 (CEST)
Received: from localhost ([::1]:33140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJB7-0007cE-PQ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn3-0006HO-RP
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn0-0000A1-QF
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id m2so2278533wmm.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=w1lM3vqV5okUE9T6DhKfRE8omMvOKtC88cuKzp6Ad2E=;
 b=fsz46aCISqkm34s4kXMogxdq/nzEccC+7OV695llEyfY4MCneKePSRJIzwR8kLTOks
 axiLM3XRTnxuVY0VpZBNoWJiNjQfGPLtxXrg3xmy6bkZNtMmO5XSExZf1tdu06v3RFLu
 AvAW2sopAKXfCX+M3sN0yjADwyeExj9d2TaNLOro3OGNyXB2NGM8f67277EcGddJ5pTf
 Ra0B3m5sQeTBV4pNPKLediVmQUdLQ6atZvJi3YR5WWN7ZpuYN+nYPfcPmPedOj88QNp5
 NXYvJcboOaR30MEv/pSRGfc3GDcJgP4l0MOhXSbyiXj+2cqFz3xYr0WTP5L7T2ZKB7Y+
 7+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1lM3vqV5okUE9T6DhKfRE8omMvOKtC88cuKzp6Ad2E=;
 b=rlkH/0lvRGMVP2m5DPuHDbhskKZFlTyXvEOoIe49SHbT66OzIo+mu7uxJf1y6C0DcH
 l0XzNO6xORaA34ndXRbMNaDOM2KBW5dEuvjx2G0ZVimyxB+GAuz+v0QzygZnEXTSwvh3
 SzLJsVPASJvNL9sjPIfFrD858Vas9V5sirgJHswpnwxmC8Q1aRENytf7wSgg7qud/NtO
 lMZTHGdh1jJEjCwwx2BWC4Uv91/CYVtJ4kbfx6oUcXVRPrxcl+JAI3YPtMfY2G0yxS+T
 iXOIQ0HhZuwlG588jcA9WWI8p9HdPAxC3IqwBIKTajhNENKLsRXQF7etAXoVX6EZTkuJ
 Bkbw==
X-Gm-Message-State: AOAM533ijZX3V6ifpRGXdN3JpOo8GbJvmBuPX2sangTpPKQeBdOtZ+B8
 Q6MSMn4PJXjRTxJFi+IyD+pF/A/nzVM8yw==
X-Google-Smtp-Source: ABdhPJwjMLzDRdx3H/L/4MFMbwz7PdpaG22BZtN0XpYLFc73gFM8OtcM01ZI6epvRYzOGqJdgFhbDg==
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr15371306wmk.80.1629997421465; 
 Thu, 26 Aug 2021 10:03:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/37] target/arm: Avoid assertion trying to use KVM and
 multiple ASes
Date: Thu, 26 Aug 2021 18:03:01 +0100
Message-Id: <20210826170307.27733-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM cannot support multiple address spaces per CPU; if you try to
create more than one then cpu_address_space_init() will assert.

In the Arm CPU realize function, detect the configurations which
would cause us to need more than one AS, and cleanly fail the
realize rather than blundering on into the assertion. This
turns this:
  $ qemu-system-aarch64  -enable-kvm -display none -cpu max -machine raspi3b
  qemu-system-aarch64: ../../softmmu/physmem.c:747: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
  Aborted

into:
  $ qemu-system-aarch64  -enable-kvm -display none -machine raspi3b
  qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled

and this:
  $ qemu-system-aarch64  -enable-kvm -display none -machine mps3-an524
  qemu-system-aarch64: ../../softmmu/physmem.c:747: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
  Aborted

into:
  $ qemu-system-aarch64  -enable-kvm -display none -machine mps3-an524
  qemu-system-aarch64: Cannot enable KVM when using an M-profile guest CPU

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/528
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210816135842.25302-3-peter.maydell@linaro.org
---
 target/arm/cpu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a82e39dd97f..d631c4683c4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1422,6 +1422,29 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+    if (kvm_enabled()) {
+        /*
+         * Catch all the cases which might cause us to create more than one
+         * address space for the CPU (otherwise we will assert() later in
+         * cpu_address_space_init()).
+         */
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            error_setg(errp,
+                       "Cannot enable KVM when using an M-profile guest CPU");
+            return;
+        }
+        if (cpu->has_el3) {
+            error_setg(errp,
+                       "Cannot enable KVM when guest CPU has EL3 enabled");
+            return;
+        }
+        if (cpu->tag_memory) {
+            error_setg(errp,
+                       "Cannot enable KVM when guest CPUs has MTE enabled");
+            return;
+        }
+    }
+
     {
         uint64_t scale;
 
-- 
2.20.1


