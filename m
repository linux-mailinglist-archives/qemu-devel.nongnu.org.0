Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8635ECA76
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:06:51 +0200 (CEST)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odE2k-0001gN-UZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDlu-000729-LM
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:49:27 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDls-0002LY-DQ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:49:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso9822418wma.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=p6WvLY1DdFqAItBhNcJerG2iDkIGFsH5MoIdSxHl50U=;
 b=MZdQ5iYZPnnxIcAYcHyfJL7BKoFiF8+QeKWomrVf0fFi6wXKYcHf+mJ/Tf6upv8V3q
 lPUtlyGegauuWCmdUQWIVCjd0Z/sgKTZPbeSRPMKeotn2WlxZv3jVTsUkU4IAnU8IGUz
 ynsZEf4Dyzef8UIugqZwDDtenB/yUEhs+/rCeT5llMByJohEHjIykHX0RYo/NW6v6e/y
 h0pFxLXRHkqlWBtCiscKkH7Y10mLR3n0wXaVDDjaUVIKkW8nfKldsJPjyBGMhG+0WxOo
 TNdnoRjdrT3wK4TU1CJNxMcfniIt8gqWpWvO0WjI+Gu+4CAe8wjdVxVUWXMSL7UbZQjp
 pjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=p6WvLY1DdFqAItBhNcJerG2iDkIGFsH5MoIdSxHl50U=;
 b=lvZVwJsw3AacQiJ/pvJPQHkFJa1mAjBAOrjh1o9+JRX5cYIn5TlO4vljcyoVVWwH6m
 fWd7tI4l0cLoKnaMNdm4q32g/tZoC/Eu87xgzKsQzT4xYZvzjc85QxyyfqYEAAkTu6cz
 grqDaiP+Ya0u1dcAm6v0Eb6N83ISL72attJE/KkeAoyiRi3bWeeP5vSdapqG9Gw6rDWs
 C6vOCkGhAoZAqgha/PhCVd9N89z+yRn9HRos3byZZcpSIrad4tFSYJ+Qat64apzNM6IA
 cOpd2av0pbHwe172B7ogV4vuy6i/gw2A+l1uo4+dgc2prWxxQ+mFaBXKK+BShpIhnKqL
 VP5g==
X-Gm-Message-State: ACrzQf3+QMlAAzxPo7ww9FXaSiDo/+kyUIZvigzu2Ku9IVQpt1TB7Ati
 kKt0CQUo+4GIDZykYFe8h0K5qg==
X-Google-Smtp-Source: AMsMyM5MUq29rQeC2of/U2oIRSaOctB705LB5LssuPQJMVK3xMrb+qSsm0pXXRVVxsWrhEQvVrHo4A==
X-Received: by 2002:a05:600c:348e:b0:3b4:a9f1:c240 with SMTP id
 a14-20020a05600c348e00b003b4a9f1c240mr3477564wmq.192.1664297362796; 
 Tue, 27 Sep 2022 09:49:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d40cd000000b00226f39d1a3esm2257118wrq.73.2022.09.27.09.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 09:49:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Date: Tue, 27 Sep 2022 17:49:20 +0100
Message-Id: <20220927164920.1502219-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d29..356199c9e25 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
-    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    do {
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+    } while (vmfd == -1 && errno == -EINTR);
     if (vmfd < 0) {
         goto err;
     }
-- 
2.25.1


