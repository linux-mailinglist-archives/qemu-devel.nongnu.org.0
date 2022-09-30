Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332CA5F0ADC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 13:45:30 +0200 (CEST)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeESJ-0005P0-PR
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 07:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeELe-0002Fo-H0
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 07:38:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeELc-0002kD-P0
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 07:38:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id n10so6403190wrw.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+4aLiqQ8KIdEY41na51qPEkuVYOkht+mGBrTF+/kit8=;
 b=vRRh/bEAqiVtM18ZODiv3g6JpS1zfJwcjGOo06AuehB4ry1q17OUfSChfoow7Pejn0
 lP3N0PCxCDNe2ucj7ZCrQ0zHVIEXwzpGjBPqRmg0iR8sEJer3qWU25DJLKMrhq7PIc++
 f/BMacGnWdHziSEFT1RsTC27y4ZHnvTrXEmA+RCVBUtdQcyya30SaEPtlN+wKWhkzYJ0
 WbKUdHnN63ZegrG+eA4GHxTLYRF1Mb8BxkBohrup4KI/Jnn0KLso6FSptP72XoI9fDwV
 OLEmb1VD8PFNklasHYZY12yhpGYbYFi8c6B6rJpZWjbxSBQfw9Th1tfvpJrt0mHeYu3m
 JN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+4aLiqQ8KIdEY41na51qPEkuVYOkht+mGBrTF+/kit8=;
 b=gl6dkT4odxjMxSJUWWGRdT8hgAWyTbpVDPqvbPognO4FoINDHDIIi267hs+g4rhCCS
 0qhdEIHx9Mxp2ENgAMGALkd5l9GCdT8BXU+56f9jO7FVHZCKpp3Enes/FK2hnFbuEybC
 1Iwd9/4dlcYvI5B4wT14HugxS0nTihN2oZbMYKz9GyCuj9h+imRP2a+fnl2s8jd2dNWO
 gp0koY2plgCM7DMLORbD/ETPDHtAW1V2O551g5WcwkLWbGVhkDyy2E7PNdycpUV0Rfj8
 jnW78MB+uCPuqrnfEAr1YrQKK8+8BmMvUXC+sA2qFYz2hysXdD8Keg7z4hMJyhxoEo/q
 1n+A==
X-Gm-Message-State: ACrzQf1x7Lsvd4PtzHhpcRglE/xly2+I4mesY9s4++uTTgbF/hzvZKFq
 rAH2WklzaONlwTE/4B96OMewAQ==
X-Google-Smtp-Source: AMsMyM4+4+iZXqjUq5PQGIxjsWPa6QystvKm6Ri2cF/2Ff2lUnoUGxxo6WdhdGN8fxS9rAz83tQLEw==
X-Received: by 2002:a5d:584e:0:b0:22b:724:11c0 with SMTP id
 i14-20020a5d584e000000b0022b072411c0mr5287048wrf.225.1664537907088; 
 Fri, 30 Sep 2022 04:38:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4ac9000000b0021badf3cb26sm2150008wrs.63.2022.09.30.04.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 04:38:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Date: Fri, 30 Sep 2022 12:38:24 +0100
Message-Id: <20220930113824.1933293-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

v2: correctly check for -1 and errno is EINTR...
v3: really correctly check errno. This time for sure!
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d29..1e4de9b42e3 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
-    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    do {
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    } while (vmfd == -1 && errno == EINTR);
     if (vmfd < 0) {
         goto err;
     }
-- 
2.25.1


