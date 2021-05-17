Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DCB382B97
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:57:40 +0200 (CEST)
Received: from localhost ([::1]:49762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libsR-0005mm-Dm
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqT-0003JW-Vl
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqR-0002j8-6Q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so2022061wmg.3
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dFXoUEWPzoILClpIHpT3WuY+4eNYczJvqbaeCiygkAQ=;
 b=aYc9tMpgd2Hx82qy/uj9bIkDk/75UOFg9bs9o+/WTFuWZzGrcNrcCq7lp+/1qbhbqd
 VVN97vHw8NLGY6GjOvzsliL2E4AThNZvCx9I/BkA0UbDU78YrIOz56rTpLnLLcLQlVnn
 tWZOX5ZETc5kgJ+H1tqFrXf7gjVJ4xDulvdSiMUp8A3A+jlRdBzm5SMELPdGVflAI7gg
 9Ut7B8fQCYP5kJQcgnic2vltWRPfMkqGaerMHvl/MqUZvH678FX96pFIAH+zDeDue+ul
 9nB/2Ben/qIJixz2EKamocCVojvGIUsnVp0T1hllrZ0lqudUx5jvvaXsQ2aguVXwM0mC
 CmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dFXoUEWPzoILClpIHpT3WuY+4eNYczJvqbaeCiygkAQ=;
 b=MWXKovyJHsg233YcHbPfnRth/CZUWpDuUKyZ6WmBOg5xWBW9iw9ykGUSKqmR0OHrOD
 T9MGPAXa/HHvSVZnG9YqN56AWYEjLUdeY7WwRPCQoRctIoUHlReYrWbgc46xNuRub7en
 Jh5Vm1+btjkiRR5bSjssRG5x3BT9ULaNTHsAGOL/63wanb4kOf6VIU/cf9wVB8QQnPNN
 XJhmZE4ZDIxvfE9fm+OOT+r5IsWId0IDBxWVJ/0sfuPbLPMfzC56YvGLNyCmBFeJXarX
 88p3iqyJj2pug6nSSadvOmm/+DOjFXFM10aQ4fQUgXckkMCMuwhlcB8jNKAAkgs91HFB
 vFsw==
X-Gm-Message-State: AOAM531GQXQpFaMF+vo0rllEp2Co5IKhy2KonqSOw/z6CdA9n8uBMFSA
 ZkKTuPo3Hl6kuaIhj9BoGFtxtABBrOVZRg==
X-Google-Smtp-Source: ABdhPJyWQ1M1TDLpKAh7EYEf6Gc3XuZRUqhoaCRTgebcaunaggqw5DDVTZc0pkHZD77Nvo4glIHqRQ==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr36039379wml.188.1621252532967; 
 Mon, 17 May 2021 04:55:32 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m9sm10224259wrs.36.2021.05.17.04.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:55:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/15] accel/kvm: Add more stubs
Date: Mon, 17 May 2021 13:55:11 +0200
Message-Id: <20210517115525.1088693-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to make softmmu/cpus.c not target-specific, we need to
add two more KVM stubs, to avoid:

  /usr/bin/ld: libcommon.fa.p/softmmu_cpus.c.o: in function `cpu_thread_is_idle':
  softmmu/cpus.c:85: undefined reference to `kvm_halt_in_kernel_allowed'
  /usr/bin/ld: libcommon.fa.p/softmmu_cpus.c.o: in function `cpu_check_are_resettable':
  include/sysemu/hw_accel.h:28: undefined reference to `kvm_cpu_check_are_resettable'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/kvm-stub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5b1d00a2224..6bda6c8c925 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -20,6 +20,7 @@
 KVMState *kvm_state;
 bool kvm_kernel_irqchip;
 bool kvm_async_interrupts_allowed;
+bool kvm_halt_in_kernel_allowed;
 bool kvm_eventfds_allowed;
 bool kvm_irqfds_allowed;
 bool kvm_resamplefds_allowed;
@@ -147,4 +148,10 @@ bool kvm_arm_supports_user_irq(void)
 {
     return false;
 }
+
+bool kvm_cpu_check_are_resettable(void)
+{
+    g_assert_not_reached();
+}
+
 #endif
-- 
2.26.3


