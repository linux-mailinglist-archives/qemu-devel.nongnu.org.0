Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D483ED873
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:01:58 +0200 (CEST)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdBd-0005wa-Gu
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8c-0003Ek-Dt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8Z-00062G-Db
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso2332732wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t/udaJMwa5qZbLWXNvr9taHHSSvraZWWiRbg1Mycy2Y=;
 b=bhJDtEvxK+TjglUBdhkAzbtdaJ3JJRaEmp/woMuxnqpXmNdAvHNRqMLhQ4IZLR5eCY
 gGt4yc+CFtfeC8sVtc1vHnRK5KArpWPwYMA0WndyA/P59rr7EdBy7sl6z89CPHaSyY0F
 o2Qc2to8YuBHswWnHGBqS3PcV0KC1s03fkH1XQ22vi9zjHLVDfiy57C4iMtGhCjtgBmr
 bmjzjPBjX64Pt2Jznbl4MKULOauZMenwcE/kfgi/kHY/n+Yw0iIHSFLVOckjxsJ064bM
 i+okrdCmbsKCPwUomhPlVmG227QszlZrvnQ4R8zrP0AiuPY2GNVCDPNMR4XYB75OTEq1
 h7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t/udaJMwa5qZbLWXNvr9taHHSSvraZWWiRbg1Mycy2Y=;
 b=ECVkA4gRkVsbEM50p8oic7F0ayf7+mtj38ikb0V0xfieTMf7QA3rydS4y5653aEaT5
 8q0YBJ58hfrsaDNz4gxjqelrlm7vmgnIhqN4r5wUv2rViZYSJPM55MzZpLUIFmJ6okLA
 wlCRuv3DYvxFcQlzXR75ZCxCmzqFpmDHHQt8Jl4DZW8UGu/AW55FFKSIxwD+e297WFuc
 kHeejVGAwkjPetfGalYfQJLfjy2zNkOH2MLZVVZNk13/X6uOb/CKH1v3b3WebiPM3Smz
 N46YAOV1mN73f6GpPhCI3W5IexaK9Yc0HtcrMAz7OXPxnwObRR56QD4sRPxmadBBD1E3
 tO+A==
X-Gm-Message-State: AOAM532amSwYonP9BJA+vAtkWoJoQw+ePVJn5Jeog9HkzwHV7JJOMD0S
 aGrxy9vvp0jkxqe4lL6YnybSmw==
X-Google-Smtp-Source: ABdhPJzdwiAFezVvo+vnIJNWNUuAa3BJUby1f3maISL6Uqvuq8zELwJ9wwGLiraUMEozBa7jPjhg2Q==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr9047399wmc.41.1629122326081; 
 Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm11855631wrs.29.2021.08.16.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Avoid assertion trying to use KVM and
 multiple ASes
Date: Mon, 16 Aug 2021 14:58:41 +0100
Message-Id: <20210816135842.25302-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
References: <20210816135842.25302-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
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
---
 target/arm/cpu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd76588..4377f3211c8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1419,6 +1419,29 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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


