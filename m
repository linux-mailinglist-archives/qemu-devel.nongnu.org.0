Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19F5EA792
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:45:16 +0200 (CEST)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoQ7-00043M-Py
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoI0-0007QP-G6
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:36:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ocoHx-0005HN-Af
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:36:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c192-20020a1c35c9000000b003b51339d350so5105235wma.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=32Qjyb7u8FfjYe0CuySFLQoFDnmi7EIBx8CauNR3+IQ=;
 b=MFc0hMZ5VBGWRTwknGOwpuzKeR3pmdTsEoGaU5R9iz7v2ZaRGogWZp3knqcvDUV8d2
 TYI0V1O9UuDYbsXli38qNubRy8m8wu15pcDRr5gnhV8RKpfKjP53RCFG54zyFD7jWi/5
 b0wySMl8YFWuZzIj040vab61fYk08BgflF8ZIOGoy+R0kTjmIlXZClNQ4JkiT6Ws5mhp
 L3V7gSg1tmMbiz4ugZe2JSuvGcVdeIZ/wCeUuYSbgseFz+qHxacZvCx1aaVMdoMWgm8l
 O3LKLHiCMk64ZeY/bJIExZMpVLDErfq2s2wb6A5A3UC1Du1qtsKpvOUQx2VI0TsVDTaE
 wh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=32Qjyb7u8FfjYe0CuySFLQoFDnmi7EIBx8CauNR3+IQ=;
 b=RjEBPiGPCLETfxmug297wHKZsjrrNSmN7Y3YjOmI73gIq9kBBooLbCoKw3vQ+AQdRC
 rF97g8K1D8Heua6vGrc3ITsPkH4IPUgc4zi0yPXMJfKJaVY1aFjNQDnukso1rORCTumP
 tbeqAnow0vuS7P5hQXsgQTjimS5oZBphgePLB6rdpiO4TJsCf+/LObQWVCrlr6CmVbu+
 h0Lf5nE85RjbDZ+7BFrt748gN5kINnPsETuF0r4Xbj3NAjKHIDAZxQbygD9GpBQUxDUX
 jRo5pHVyBb9JV78MtIaMF3Dmue5eh0jK8zdtOqfygUbxoE/iGcM1b2x3Ezfh8g1MmIXZ
 Wrrg==
X-Gm-Message-State: ACrzQf0IQbHjRGP9O1vnaMm/2a3A34WyCPCB6+8Y5bHm04CZw+3FbMF/
 evNBSCUPY5udUZHY/yqBOnmvCQ==
X-Google-Smtp-Source: AMsMyM4O6LrGO1FVjjr7/IFpS1Dru0Gz+OSlX30FIZbrxkvPkHL3/KbfzgML8sujRt8mGTv0P3sYdA==
X-Received: by 2002:a05:600c:1d2a:b0:3b4:6e31:92da with SMTP id
 l42-20020a05600c1d2a00b003b46e3192damr21315738wms.103.1664199407021; 
 Mon, 26 Sep 2022 06:36:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d40cf000000b00228fa832b7asm14206102wrq.52.2022.09.26.06.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:36:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Date: Mon, 26 Sep 2022 14:36:44 +0100
Message-Id: <20220926133644.1345269-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
there is no pending signal to be taken. In commit 94ccff13382055
we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
generic KVM code. Adopt the same approach for the use of the
ioctl in the Arm-specific KVM code (where we use it to create a
scratch VM for probing for various things).

For more information, see the mailing list thread:
https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/

Reported-by: Vitaly Chikunov <vt@altlinux.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The view in the thread seems to be that this is a kernel bug (because
in QEMU's case there shouldn't be a signal to be delivered at this
point because of our signal handling strategy); so I've adopted the
same "just retry-on-EINTR for this specific ioctl" approach that
commit 94ccff13 did, rather than, for instance, something wider like
"make kvm_ioctl() and friends always retry on EINTR".
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d29..2982d216176 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
-    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    do {
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    } while (vmfd == -EINTR);
     if (vmfd < 0) {
         goto err;
     }
-- 
2.25.1


