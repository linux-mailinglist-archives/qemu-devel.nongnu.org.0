Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2D15EC915
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:08:31 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odD8I-0003Xw-EB
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBWH-0005UO-UX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:25:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBW2-0007RT-Ee
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:24:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so15302968wrm.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ICOJrCaCj9cyypnb7sgwStZZcWx3y8ZLrngrBB6RAFU=;
 b=qSrmH2UBqPGT3YtEKljR+7n1k28yT2fED4/Whs/vCufLDoNUyGR2oIWHc3iF6kxtwZ
 Rf9xybgycx5I2GGXrnIfEaM5kJ27o+t8ENJNXuhDR5i1jBff3sM0cjqZapc7l0/NWv6n
 yiP1gmijwk0D2UXxGGQ5OFCp0+pfAntQ6Ssqmbs+r1Z3MawYwRclGYKgi83oWCQWON9j
 ynEaFy0Ht2JCUvYTkL5L++MUyul44TYB6/pIVLZHVGkwRh6vZCEwEcqoNtia2ob4tnKJ
 OSkDYzpL2RfZ7weqMVIjGKxVOdRLPQipPI66BqdYGweZf4Siew6jqpHYfGouzsHl5pZA
 3urA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ICOJrCaCj9cyypnb7sgwStZZcWx3y8ZLrngrBB6RAFU=;
 b=df/Cz+W62YWIlp92XV0OnQHQJ9G8MY5+Uv75B2emVRip0j35NNxNzh/FKX7cP7tFH/
 ot4fpid++eYQh/YFuhX2O7RY9Q3yqgujGqg7McEK2BttbfkRKqYVk3ZXZ5AzO6UZZWqj
 Pz330R5SvJdBFYuy1ajCSB7BYbWZ/+r5vnQc0s1xR3FmJrsHUVS6cvyF00A7oQXHAvd+
 9rFvWI5jt9Yczq0L3fMlqNnEDavsQsZZu6LZkLjURuSYqMZm79oWJ32XDYDgeENxHABz
 gO3X2xMeT1R77Nk3xACwfaKuKG/vtNcnKA5MVu43SsdcUFfRA76JFOcM7QhZITrT6YoS
 ekag==
X-Gm-Message-State: ACrzQf0ffN/oUdgORY1RBKJxb376pz2vrS765CHa38WcSFWR4fjoMVdK
 eBfVRzXn6tRQJhVP1aFfV1Pk/g==
X-Google-Smtp-Source: AMsMyM78eAhXF2ahMqHq1PMcTmPHIebPxk1p3NIZidOuusykFalhDuQb+Ep6PMcUDHmQ/vd3Wzhlhw==
X-Received: by 2002:a5d:598f:0:b0:22a:f74d:ae24 with SMTP id
 n15-20020a5d598f000000b0022af74dae24mr17220870wri.544.1664288692690; 
 Tue, 27 Sep 2022 07:24:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003b486027c8asm14419123wmr.20.2022.09.27.07.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:24:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DFBC1FFBC;
 Tue, 27 Sep 2022 15:15:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH v3 15/15] accel/kvm: move kvm_update_guest_debug to inline stub
Date: Tue, 27 Sep 2022 15:15:04 +0100
Message-Id: <20220927141504.3886314-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/sysemu/kvm.h   | 16 ++++++++++++++++
 accel/kvm/kvm-all.c    |  6 ------
 accel/stubs/kvm-stub.c |  5 -----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6e1bd01725..790d35ef78 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -247,7 +247,23 @@ int kvm_on_sigbus(int code, void *addr);
 
 void kvm_flush_coalesced_mmio_buffer(void);
 
+/**
+ * kvm_update_guest_debug(): ensure KVM debug structures updated
+ * @cs: the CPUState for this cpu
+ * @reinject_trap: KVM trap injection control
+ *
+ * There are usually per-arch specifics which will be handled by
+ * calling down to kvm_arch_update_guest_debug after the generic
+ * fields have been set.
+ */
+#ifdef KVM_CAP_SET_GUEST_DEBUG
 int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
+#else
+static inline int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
+{
+    return -EINVAL;
+}
+#endif
 
 /* internal API */
 
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 6ebff6e5a6..423fb1936f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3395,12 +3395,6 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
     }
 }
 
-#else /* !KVM_CAP_SET_GUEST_DEBUG */
-
-static int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
-{
-    return -EINVAL;
-}
 #endif /* !KVM_CAP_SET_GUEST_DEBUG */
 
 static int kvm_set_signal_mask(CPUState *cpu, const sigset_t *sigset)
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 2d79333143..5d2dd8f351 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -46,11 +46,6 @@ int kvm_has_many_ioeventfds(void)
     return 0;
 }
 
-int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
-{
-    return -ENOSYS;
-}
-
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
 {
     return 1;
-- 
2.34.1


