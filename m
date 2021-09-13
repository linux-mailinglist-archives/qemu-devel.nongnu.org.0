Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48481409886
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:15:14 +0200 (CEST)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPobv-0004e2-51
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYl-0000oU-JN
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYi-00085W-Ru
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:11:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so7432931wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yR6/d1fmgWVmWz0dJq82TlR2uLKkG1hd+bNE4R+MmmQ=;
 b=oI5PrN3uWUJVlANxGXDWpTr4352CauISQNkMA2HHMzr/FlV3ggnTHmvNrmKu59zNfp
 VYv6NpV2S5QQgDDcRhdEGiaRXCkqbTCLvMMIBaD7LcyYnP8Z93URUayEv7DyP44SsKO1
 3gZjAp8DU9FkF6U1mEfvHbTXAIhmn6I/uvaLR6JkOm4vFfukN5+PTvKkl/+6svX80ckz
 sCro+Gnfq9JfPf0F+O/I8PQbqEPZim4eRJmYeTsZBWnlHssT0wXXih0IkKw1giUShLWx
 vxw5W/SgbRGCZXaWx3I/9UGj9ZzORADt4Cp2qNXe29EjqWXLu6vw7+GvwrW3Zl2a65LA
 4LYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yR6/d1fmgWVmWz0dJq82TlR2uLKkG1hd+bNE4R+MmmQ=;
 b=7apYANrNSSmec+LmbDM8ZZ3iZM58bA5cUyHh5ebhgNyQEwLAhj1Tw5JCyhSAUxZAKg
 sxcJUUTgHGaxJvCyL2H7ib4penUd6+KMlijQ6EqAhIToCHuSGfH3wGkwAwXQAtxho1Wo
 YgbCU1uuBa6N1cwxstKj0uSavSwg/hbHlTNTA4ozypuwZ4CZ4EhcRhQ3ES2VOjHVoUM1
 4cmy1MOVGZv7vlUN4HkpMVg8CJoWGSUeO4m3aEVtHzzr1mpJ29TKVLWISE8r3PZVmz8L
 pdw3RmupABRnwVtBvDtEjAs8Bfpnzlr0/dU88k9kCBmEIG1gQ8KKS3oy+sKGO8K3i/Io
 SJ3w==
X-Gm-Message-State: AOAM531X+bm5i9fIibslrEt2AvbBTNn1KactqmNYAQjCK9kUb/jN1p/X
 2MoCslfayUjuZLhSLrWf7AjLbk9Sm5Y7Bg==
X-Google-Smtp-Source: ABdhPJz46CLbd8cNYejElKD6wQwNukeOWYiY2Lg9ddU6Q6voZNaYXffTBrFmraUbhM8pOuRGZ7+djg==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr10822954wmi.24.1631549511444; 
 Mon, 13 Sep 2021 09:11:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] hw/arm/virt: KVM: Probe for KVM_CAP_ARM_VM_IPA_SIZE when
 creating scratch VM
Date: Mon, 13 Sep 2021 17:11:28 +0100
Message-Id: <20210913161144.12347-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Marc Zyngier <maz@kernel.org>

Although we probe for the IPA limits imposed by KVM (and the hardware)
when computing the memory map, we still use the old style '0' when
creating a scratch VM in kvm_arm_create_scratch_host_vcpu().

On systems that are severely IPA challenged (such as the Apple M1),
this results in a failure as KVM cannot use the default 40bit that
'0' represents.

Instead, probe for the extension and use the reported IPA limit
if available.

Cc: Andrew Jones <drjones@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20210822144441.1290891-2-maz@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5d55de1a493..94b970bbf9b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -70,12 +70,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
                                       struct kvm_vcpu_init *init)
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
+    int max_vm_pa_size;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
         goto err;
     }
-    vmfd = ioctl(kvmfd, KVM_CREATE_VM, 0);
+    max_vm_pa_size = ioctl(kvmfd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE);
+    if (max_vm_pa_size < 0) {
+        max_vm_pa_size = 0;
+    }
+    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
     if (vmfd < 0) {
         goto err;
     }
-- 
2.20.1


