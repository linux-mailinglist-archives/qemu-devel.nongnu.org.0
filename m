Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B806967E941
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSa-0006MK-EO; Fri, 27 Jan 2023 10:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSU-0006JX-8q
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:06 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSQ-0007eU-GA
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id q8so3675875wmo.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ywqj05UIg3deHK3wVqj9WoSaWiZ3oE7Ec+4/n7JA1s=;
 b=Mp/VxvNbrTud0uPK6XiOgp1O24LiHNx5JpZvdntYF19EZ7D05iBgsRocJF6rvnltu/
 IQO6+pZA7hr+JWnqCx+HH3ZcNYK1bnaH+lwPDWxXMdyW2Xa6ET5q9VVHFNdZjSr5gHWk
 FuPjLNnF2G4CMVVxEy8MgHfd20xfLLDFzkcSvBX74icFfiewHa55DZiojFlSGvhbZyvY
 NZV9e1SYdFSWjLmbWchV/LcvCG9sihrwNgBqwyKp+efwndyoeTbVGlFSRKeJy5SLn5FC
 MCBsaGp85SUjIW7AReu7omNLaJlSk8oFsd6LynejNFIDBxWPkSI9OLulG3SglLLZZxio
 Fg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ywqj05UIg3deHK3wVqj9WoSaWiZ3oE7Ec+4/n7JA1s=;
 b=FqL47L/ECACLoLiA4cgerkjF2tthCDVanaEuJ5/nXvjYnTovdrNkBvjzgaEZQ6EVAm
 hCeMASAn4TFYOWHUPhD0KleXBp7gWcXDKs8A5FOurT6PZQVUUfE9EpmONdIsD4oW9ROS
 2qF7EMd97d+IlQIdYrsmM6VCTrVVy9k7d7MT29z6lubUCSIiu096o/AUDFfloRDwZq/E
 GclQzgu+tPQX1/pyuSdnq+RQt7aPy4ohPlB7kQz/2FZyZZm/0a2spcejAqt/4wtYZHFB
 YsywjOQtaGCJix9nBW/SuJdLsXmOLYs1vtuPZ8FnlziKS4wIhYz+q64qFWf4fM55Ywtv
 EgYA==
X-Gm-Message-State: AFqh2kqEelDXXaJ2xj8IOQ9/ugA48sOQ7aY0sK5wPFD5IyNmY15E0b1Y
 wpjUVx03Ej1qx5q1AKTfea0WIA==
X-Google-Smtp-Source: AMrXdXtWCmF4+HftbHumXFJQdxVCrhlup0cBDuG202o2que5J8DyWfdH9HYh4ojM++qs44GxNW1hzw==
X-Received: by 2002:a05:600c:1c9d:b0:3da:db4:6105 with SMTP id
 k29-20020a05600c1c9d00b003da0db46105mr40540319wms.37.1674832561473; 
 Fri, 27 Jan 2023 07:16:01 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:01 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 07/16] target/arm/kvm: Select RME VM type for the scratch
 VM
Date: Fri, 27 Jan 2023 15:07:20 +0000
Message-Id: <20230127150727.612594-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Although the VM type does not affect values probed from the scratch vCPU
at the moment, it could later. Ensure we specify the right type when
creating the temporary VM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Does the PA size need changing as well?
---
 target/arm/kvm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index fcddead4fe..d8655d9041 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -70,6 +70,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
     int max_vm_pa_size;
+    int vm_type;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -79,8 +80,10 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
+
+    vm_type = kvm_arm_rme_vm_type(MACHINE(qdev_get_machine()));
     do {
-        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, vm_type | max_vm_pa_size);
     } while (vmfd == -1 && errno == EINTR);
     if (vmfd < 0) {
         goto err;
-- 
2.39.0


