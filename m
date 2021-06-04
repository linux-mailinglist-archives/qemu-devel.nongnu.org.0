Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1900239BE18
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:08:38 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDJF-0006Ed-6n
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkV-0007vL-P3
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkU-00026G-49
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so977393wmq.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4Fg0Dja58X/pwaq0v8JkFhBHTMRtUReJTqk/3Hcw8E=;
 b=KBtW9owH4oqFDsQ/ei+FxAtn2PrZgaswjzShvdAI7I0dp6QEtTxRD4DwztT4zDlSYQ
 Fjs5coHf8Mf9grFOGpEik+zSUxyEWM14uFaNm69PGvKWG6IJikWrPA5FIcdveg+ZuEbn
 huO1IUDLKKjdrDsCAipIWlbARm9YkpsQwvVlrG9RIPMicT46QRQkKoEqRAc7pWFLY+6z
 SfoEHoedVc/tpdaa/sPonq/8Bk3Z7qkvxYDnydVBM+sAE2QS9LjY+y3NNohpFJjBLqVv
 SASzyHTlOnl0lSQ2O//o7js9vT0arieHEwYbRcychxMMYxtF36GETfFheMUN6m94HQId
 jdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D4Fg0Dja58X/pwaq0v8JkFhBHTMRtUReJTqk/3Hcw8E=;
 b=YZngKqTyCBsvbLzIil0V/QGVh2tsT4vxgytavZe8LxIHCaJTC4i6cKWirBaEshwIxs
 K5A3U2fSALP1XnxFfIylbOCgKd5X31gt5lOJOEefr+yxfpzGf8cHXAkiH1/KMkbGT+Ej
 GsEV+7+KcQ7s5V13m0n+CXgo++/pN3iuGIJEDxpM1BUGzbU9QB6MIShgTET/zntkbW38
 ZOVllWsOOJt6JgIqj8yl6S73a1tRUuoDMVYwAafAGk+jXNbOhB8s67GSQxbAWFY4lyJ9
 tzDhbflqGw/Bi+zEvrj6pnwqBJ1bLMD2ADm4oZ7VRmBdhJt8umhIc/e2bAgbI2nt2oIq
 DncQ==
X-Gm-Message-State: AOAM532srcy40JmUKnQj2RvqgXThKVdPabnfNiw4IeUOMhQOgWmgpYmR
 OZ5QGNsQumvwzwOgu0eXuYZloA==
X-Google-Smtp-Source: ABdhPJzTUA6ppXOxACHc3JrYgxJJ1Fw9ae5mjC3r3XBuQMsjkOVjhyKS1JM/gPBBU3DA/Un+33Bn8A==
X-Received: by 2002:a7b:c5d3:: with SMTP id n19mr4593580wmk.68.1622824360689; 
 Fri, 04 Jun 2021 09:32:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w11sm7439148wrv.89.2021.06.04.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2F7F1FFDC;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 68/99] target/arm: move kvm post init initialization to
 kvm cpu accel
Date: Fri,  4 Jun 2021 16:52:41 +0100
Message-Id: <20210604155312.15902-69-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c         | 4 ----
 target/arm/kvm/kvm-cpu.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0ecbfa060c..003e58d8ee 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -778,10 +778,6 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
     }
 
-    if (kvm_enabled()) {
-        kvm_arm_add_vcpu_properties(obj);
-    }
-
 #ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
         cpu_isar_feature(aa64_mte, cpu)) {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index 5fbb127e61..9f65010c0c 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -63,6 +63,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
      * the same interface as non-KVM CPUs.
      */
     qdev_init_gpio_in(DEVICE(cs), arm_cpu_kvm_set_irq, 4);
+    kvm_arm_add_vcpu_properties(OBJECT(cs));
 }
 
 static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
-- 
2.20.1


