Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EFC5FA035
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:30:47 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtnp-0002u6-TL
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtko-0005oF-Ds
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkm-0005XH-Pr
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bu30so17295310wrb.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GXBLlnfCbK3K6UlIWvoHPFAcHN/A5jeDtX9d+QOJHH0=;
 b=FctTs9fd/TRuiu2EB/SYDzawPDcyGgFO7brVj8JdQTOD4BR27JkKTL2+KNY98rQjxG
 4hflGFKiLArFDMUcW16Z7+amnPL70bE9wIe1vhTVaRQlaiR8NLgtnoopP7YFNLg5hzwU
 nfC/XjU0h2TQhU1w63l1E+1YdQfT+B4C8Ea7s9+h9DjBRip+VbVxFHH94eat++BkrgZB
 sfJihg2RdoEn/rJgqDN/VRMmXS+9hxpFbeBttDTEBc1ap6WkjBOqiuXt5JsgsgELbTXE
 TFaQ7RBfpenqHbMAe0wbaBOuvCAcHPjUxRc5aWX2Opxbo5yd/BzY/Idv+l4JrpaX39Ij
 l3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GXBLlnfCbK3K6UlIWvoHPFAcHN/A5jeDtX9d+QOJHH0=;
 b=Rk/6FqoCrlsKvNySv2ZZlCTZcgzRDfPoJ0u/Y2nSF1A2eTarejXul9l5iVGVnwl/xC
 7MV2JAXiY66XSwlGkuG8MSC1QfPGdYTx1ZKQ0l7XUTS/K338IHIMzP7jXvZOVlbfPQEB
 rGzXZW7YPxGNnql6tesJaY8D+uKKn5WYMN54frS9ypUPVr6sQLbsmuqOOOSA3Z1fPKaZ
 27nLp0z/rcL6wZXJ51xfWulv/NEuFOy8owagDSzqLlCzbvmDE9qi57eVK+EdEGlrhzMT
 f3MJ6En6Jzt2pPK6xlY6D2pTFPuJBRVlBeJX7I7fIS70+2vWeDMd0mZnRjovTeiix6k0
 na7A==
X-Gm-Message-State: ACrzQf0ToDKOulcb7L+RjTG9D7k5MoJeV9rsX5QxpR311hNF7kw1LFkI
 LV8fkOcwY7ASZj/hI8yT9zXutDE9oNCW1A==
X-Google-Smtp-Source: AMsMyM4azehWzXA4vzmyHui7qOwehi1FsVgTb/NxbLjOSzR8yTee9P+Oqq7YsG+4xuPgHFEjkOYRyg==
X-Received: by 2002:a05:6000:1862:b0:230:fc9a:813b with SMTP id
 d2-20020a056000186200b00230fc9a813bmr1553564wri.552.1665412054462; 
 Mon, 10 Oct 2022 07:27:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
Date: Mon, 10 Oct 2022 15:27:03 +0100
Message-Id: <20221010142730.502083-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Reviewed-by: Vitaly Chikunov <vt@altlinux.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Message-id: 20220930113824.1933293-1-peter.maydell@linaro.org
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


