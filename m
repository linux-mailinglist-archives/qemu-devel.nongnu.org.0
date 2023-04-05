Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609D6D83B9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:31:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk61g-0005Wu-QE; Wed, 05 Apr 2023 12:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk61c-0005Tz-LM
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:30:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk61a-00050D-Ub
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:30:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id m2so36804613wrh.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680712217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrAcn5qN38B5YaoSS7J2RY/lmyONQENb+5lQU26NZ94=;
 b=ltah4l+p7FJg9oAXXwCVBTw0T1SM3CGmlUjbZnWSMo+SWFV02mqjr/KQ0SOeD1mHlo
 0fwAhWUy80/AAZfa6r0U2GiGZrIYk1eglek0E2nytTJwN1bnmj+yzSFwVKvh1PvEUpny
 MF9LCkH7wBWmM9aWOgcwUz4K+5zjltGVQ2EtPzJGP9UWF+VctR/sRiZZwUsabMgRg/jS
 t5kUbvD6v6PmbJ1beYmnS3+qDEj1EOcvKCK/wDvTWQjL96fdXiHcg9IWbqyD1mFVgQ0o
 Xke5O4fLv2nu9Y+mVedL7ITgOHXOPQyha5158IQ2/KU34Hg8y3y3ZIQ5PwrKsE06vH5E
 5sbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PrAcn5qN38B5YaoSS7J2RY/lmyONQENb+5lQU26NZ94=;
 b=ES7STtA49rakcApC6MioRJlLeYf8atbox/aQrxeD++og91O6Fp0Id05eWHbGznuU8A
 7ak8iFp46lJQZDVkMRtt3gMGmRNQW6lqVXiyvcoD461cN1f2fLGXRU0/aAUf0fMOVSCC
 TRxPMQYV2kD6iHYhuu9qVBES57NpjgfI28YjSn/gUdRC9miwHUhuQOwK9JBbX6z+DNNX
 UffHlNpx7dDKP3hxLuYpildXy7t0qUwJVyCum49Hlqm7DUM2w0d3DU2K+zr77Vrwiui/
 4cGwnlvSyIhFSvAHJiNi7gCAV+DShsB8LU31MbpFSwIrjOclq775nsK+ox9YXlndu9kj
 gSxg==
X-Gm-Message-State: AAQBX9ez3E9wGzbkCo5XMjBTdQ6LCQF7uOazh2ibtaEkNYIQeamKsenc
 L/Ajgl0oYwdFzFE15uUgDoyvYypUbBT4OO/xP7U=
X-Google-Smtp-Source: AKy350Y2yAbPetqipghkBmPJH5S/kDUXef+cfNvb+FySnoKcKAQS57QTIxv/gOkBb4n41gqOQPnE6g==
X-Received: by 2002:a05:6000:1364:b0:2ce:a7b3:1c73 with SMTP id
 q4-20020a056000136400b002cea7b31c73mr4244101wrz.21.1680712217198; 
 Wed, 05 Apr 2023 09:30:17 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 a5-20020adffb85000000b002c794495f6fsm15280822wrr.117.2023.04.05.09.30.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:30:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 2/2] accel/kvm: Declare kvm_arch_irqchip_create() in
 'sysemu/kvm_int.h'
Date: Wed,  5 Apr 2023 18:30:01 +0200
Message-Id: <20230405163001.98573-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405163001.98573-1-philmd@linaro.org>
References: <20230405163001.98573-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

kvm_arch_irqchip_create() is irrelevant for hardware device
models (files under the hw/ directory), it is meant for the
generic KVM code (files in accel/kvm/) and the target
implementation (files under target/ directory).

"sysemu/kvm.h" header is meant to contain the 'external' KVM
API. Move kvm_arch_irqchip_create() prototype declaration to
"sysemu/kvm_int.h" which should contain the KVM 'internal' API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/kvm.h     | 12 ------------
 include/sysemu/kvm_int.h | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 32e223a368..540f6f04a8 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -453,18 +453,6 @@ void kvm_cpu_synchronize_state(CPUState *cpu);
 
 void kvm_init_cpu_signals(CPUState *cpu);
 
-/**
- * kvm_arch_irqchip_create:
- * @KVMState: The KVMState pointer
- *
- * Allow architectures to create an in-kernel irq chip themselves.
- *
- * Returns: < 0: error
- *            0: irq chip was not created
- *          > 0: irq chip was created
- */
-int kvm_arch_irqchip_create(KVMState *s);
-
 /**
  * kvm_set_one_reg - set a register value in KVM via KVM_SET_ONE_REG ioctl
  * @id: The register ID
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index a641c974ea..4a46b661e2 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -140,4 +140,17 @@ void kvm_set_max_memslot_size(hwaddr max_slot_size);
  * Return: None.
  */
 void kvm_hwpoison_page_add(ram_addr_t ram_addr);
+
+/**
+ * kvm_arch_irqchip_create:
+ * @KVMState: The KVMState pointer
+ *
+ * Allow architectures to create an in-kernel irq chip themselves.
+ *
+ * Returns: < 0: error
+ *            0: irq chip was not created
+ *          > 0: irq chip was created
+ */
+int kvm_arch_irqchip_create(KVMState *s);
+
 #endif
-- 
2.38.1


