Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA285F455A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:21:58 +0200 (CEST)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofio1-0007lO-MM
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq7-0001JP-Ty
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq3-0001pn-7B
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id a10so8947329wrm.12
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=b0sEFTUmJhxsrwZtNY2dwzSSYrDaPd1jMbAkb2SEAj0=;
 b=vIu7p2D4/PA+O48mA3YTJjk3rwfNYUqK0kafegq6m8TaT3o7XQFOyP0Tinz7SLTV1y
 0lQjyHkjAJKcnrULbAEMUhB1W3vHkz5YlSyHjHGMrykMNSTZULApTT3cRPTIPslkajAt
 H3CS15n8h6ORbA05inrC5PEnPEDk5bsD+1nFQW5h/nq88j19yeyk1Qt98LWLScg8RLje
 z8XKqXfvT77rSY92NxULi8wq+BqrQ7GAhZyysyhCBJh1zMcPOX+B00Ii298DZ09WgQal
 IC12YbM/cv1vh+jkTkB8pkaZc9s3BYknWgmEw84jn1BNTfNKPgb81zUenqLxoNXuhM8e
 UiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=b0sEFTUmJhxsrwZtNY2dwzSSYrDaPd1jMbAkb2SEAj0=;
 b=v2t3Kmv+JccywGzMFv9BfQb2aV1fSPQt2l4iXQKzT6KIMl+wGau56UT0ibecHhGFK3
 wTMwc7snoCKrnBNBNllxjPhdOlSZdctUwtBfAmvSmeJkFlNy1HpyjMVkgNXvufAhx08U
 mJW01N6NoH3qutMQqqjp7ZCxFKOLdmaPTWEI6eQma2rsRDYCHs4jhNJh2fZBAfYrCq73
 /HFVt3HcUnRA7MCTdU/ICBQJtWbM/hH7Fl9WYKhBp24y/GfEGUUiPliLMqFjqKUHKZQW
 e1LaYbRQutBheAnsNcyho1N53yXkYJp87OnoRKsbQsYIvynfpPNKXQyylsPzD84j4r2a
 nw3Q==
X-Gm-Message-State: ACrzQf2iNu7CvqOBFSNOAzOcYorV3IeKO8OF3dB1EMfhInN9+8a85Spy
 L++23QKgdX6msNSIlzFE2304Kg==
X-Google-Smtp-Source: AMsMyM6LpEOaNdWuHo+1ALxMdHCazPOJF5Ba6dP5BMdxx7Ft0Nh6nIfdHrXXmpTFGzCL1MKYnz91vQ==
X-Received: by 2002:a5d:47c2:0:b0:22e:4911:6925 with SMTP id
 o2-20020a5d47c2000000b0022e49116925mr3277651wrc.403.1664889596606; 
 Tue, 04 Oct 2022 06:19:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a05600c349600b003b33de17577sm14808748wmq.13.2022.10.04.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B07E61FFE1;
 Tue,  4 Oct 2022 14:01:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PULL 46/54] accel/kvm: move kvm_update_guest_debug to inline stub
Date: Tue,  4 Oct 2022 14:01:30 +0100
Message-Id: <20221004130138.2299307-47-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
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
Message-Id: <20220929114231.583801-47-alex.bennee@linaro.org>

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


