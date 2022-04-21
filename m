Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD1509E6F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:22:28 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUtI-0006OF-2J
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpo-0002g2-L1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:52 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpm-0003Q0-LF
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:52 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so3203081wms.0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MEtor4j+P9zV/cCDr31gN48wrx6xOJygpWmwTKMQDwk=;
 b=V+xylE735e+Mbe6ZBvaUKQJv1i9wA3UBx+FbQfh7PU5RmY0z79rASvlg79cQovQgAM
 /KiR0QCpaSceW/w/qrNqXVhYJUrqRnvFTV3GLt17wbNNsOIxqTGWW1x7puYFG2ENJyGr
 QMCOuS1tLkSFlYg0Ify40oIPh50d1rI0pMR0kgMTV4Wn48ihAhj4nuFNd/27mNflAL2w
 W2yP4CS+XQzO6ZHBnOFRKRZol44q6B4kTrLmuUTAayWflDAepeJMvyROC3QHG+NzF2br
 +Qdn+hXoNoJhWUQGqMXN78mTa2sN8bmBJAwwfF1lqVYOqdLchX2itLE5wknzvrgx/ndh
 VHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MEtor4j+P9zV/cCDr31gN48wrx6xOJygpWmwTKMQDwk=;
 b=BBW8jkdm40ObAgviGcwxcDH/Hx+eltzCRdVebNGcenhf8gzGt7svQEf7jlqUspegoV
 OUoirrvWpwTVV1kZtYVC+NyB01x2ZaP2UXU7iC6baan31NfQAY0oV/xeQ1jf6QhVJIKV
 RLkK9+N6bRNTK8C2iCrkWhiot8Vvin0qkDiHadyuax7aX0BGxnYbs2XKo6L200H4VEbr
 jkAwP6eAGKrsVLOMZrF+/c9nn7TcVHqd7Rh+a9AWfj8Lbjw/UStrkj79Uls7gTlMv5xE
 iYlIrhzhcm6wiKg7c1JyPvE0u+RAv1C7Yf6CgHDvKCaV2dHSRvyAmiAbGpWlls2D2do9
 odCA==
X-Gm-Message-State: AOAM531hp07AajJePupq//D47sjkB9t0UILWg02NmbyqW16+J9VUYNAd
 x+FVxER+iaQFbrukV4wIQ07KT//m9yWkQQ==
X-Google-Smtp-Source: ABdhPJxjYxx3TBxba0QB1XJhkPG0FH2SMKs1gyPWRrfx+LznTt9UQv+dI4yQcVGpvfgiBIxW3y2RNQ==
X-Received: by 2002:a05:600c:1552:b0:38e:c7a4:f056 with SMTP id
 f18-20020a05600c155200b0038ec7a4f056mr8169781wmg.183.1650539928956; 
 Thu, 21 Apr 2022 04:18:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/31] hw/arm/virt: Check for attempt to use TrustZone with KVM
 or HVF
Date: Thu, 21 Apr 2022 12:18:16 +0100
Message-Id: <20220421111846.2011565-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not possible to provide the guest with the Security extensions
(TrustZone) when using KVM or HVF, because the hardware
virtualization extensions don't permit running EL3 guest code.
However, we weren't checking for this combination, with the result
that QEMU would assert if you tried it:

$ qemu-system-aarch64 -enable-kvm -machine virt,secure=on -cpu host -display none
Unexpected error in object_property_find_err() at ../../qom/object.c:1304:
qemu-system-aarch64: Property 'host-arm-cpu.secure-memory' not found
Aborted

Check for this combination of options and report an error, in the
same way we already do for attempts to give a KVM or HVF guest the
Virtualization or MTE extensions. Now we will report:

qemu-system-aarch64: mach-virt: KVM does not support providing Security extensions (TrustZone) to the guest CPU

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/961
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404155301.566542-1-peter.maydell@linaro.org
---
 hw/arm/virt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9284f7d28e6..bb6a2484d81 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2048,6 +2048,13 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "Security extensions (TrustZone) to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
+        exit(1);
+    }
+
     if (vms->virt && (kvm_enabled() || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
-- 
2.25.1


