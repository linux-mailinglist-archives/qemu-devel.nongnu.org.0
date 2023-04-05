Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6756D7994
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:20:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0EY-00082I-82; Wed, 05 Apr 2023 06:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0EV-0007xa-Jc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0ET-0003Kx-FL
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:19:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso23401489wms.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAVav4ABEpIiF2Ib5SEI8jHJn5J3YAuyzrKJBGzco1s=;
 b=hHxXSS6O9+86vT2m6d0DTc+hiT8gaRNGAVM+7W9qw5K7dcdKYYbh0E7lvSzpkYn368
 fOMNZZP/1e+qRYjuveniW+hqJPeXRIDEN0l73ChMXeJHLmaPOblTjTKGwBGBBShSS3FY
 MjxZ0uY781JiDGIyrZ2Wmf9jZfbEMqhXfcJrGMdfGEFfNJ40NRBoRK/JRBa+tS5fdI92
 eU/ZF0jqD4wzOX6Sr/86Q1BA8EHQgHGTKipyyzmSWtpcvo657D+2/e3mC0kuVQ+XljSH
 s07gbWhPjhP4utq/Kj/s6MnBKF2BXRP7AOXf6kw6C44JcSBNEeM091V355Hm/Q/Y0H3V
 Xa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RAVav4ABEpIiF2Ib5SEI8jHJn5J3YAuyzrKJBGzco1s=;
 b=OUngUbJGNQXtVf3JTT69r4npclrbK1pErGx5SRVnX72d6YC0VcRZDYGjFpc8ZgxFgR
 isUNcLtG+pCHmWtns74SEoqpGcRVQW/2nJLYoPCzWqrULg08gccy/+oixrtO3ZGp05Zj
 Ku3UhkGi24jI0JHYfeQfw3IjqUb2uXCOwkThoffiG+vF2TSbQJ4tC+1sSLcASgaFL1hw
 l2usIzNHvKZ0mMSBjC0gX1I9dR1m3vv/PGxPZzrFm3m9+W4AUdLTp1yPPgZ2YdgWbnLc
 /dN3E01h8+i9u6FOLBezArN1MDHTKqGYg+0VJGrKF4993jwqR68e8QKhfcFTaiLxY/BT
 tVqw==
X-Gm-Message-State: AAQBX9f65xkT+v+V1QvfxWq+sgp8lOQ7oTrpmlFs53Qa+2OC73CetsXq
 M+DGAZ8hmClInOqp/yZIrGXD1hCwtjYnwDe/fMM=
X-Google-Smtp-Source: AKy350Zr65D5G7Y2SXbNR//LfCiPeKcYs21bo5zZhAXH6JQLmNB2HwLRUfAeUMYH/5tXslpZRuo8zQ==
X-Received: by 2002:a05:600c:28f:b0:3ea:bc08:b63e with SMTP id
 15-20020a05600c028f00b003eabc08b63emr4378808wmk.2.1680689951840; 
 Wed, 05 Apr 2023 03:19:11 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b003ede06f3178sm1730449wma.31.2023.04.05.03.19.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 08/14] accel: Move HAX hThread to accelerator context
Date: Wed,  5 Apr 2023 12:18:05 +0200
Message-Id: <20230405101811.76663-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

hThread variable is only used by the HAX accelerator,
so move it to the accelerator specific context.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h           | 1 -
 target/i386/hax/hax-i386.h      | 3 +++
 target/i386/hax/hax-accel-ops.c | 2 +-
 target/i386/hax/hax-all.c       | 2 +-
 target/i386/hax/hax-windows.c   | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 173f47d24e..8d27861ed5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -334,7 +334,6 @@ struct CPUState {
 
     struct QemuThread *thread;
 #ifdef _WIN32
-    HANDLE hThread;
     QemuSemaphore sem;
 #endif
     int thread_id;
diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
index d11d43e857..15d16772db 100644
--- a/target/i386/hax/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -27,6 +27,9 @@ typedef HANDLE hax_fd;
 extern struct hax_state hax_global;
 
 typedef struct AccelvCPUState {
+#ifdef _WIN32
+    HANDLE hThread;
+#endif
     hax_fd fd;
     int vcpu_id;
     struct hax_tunnel *tunnel;
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index a8512efcd5..5031096760 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -73,7 +73,7 @@ static void hax_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
     assert(cpu->accel);
 #ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
+    cpu->accel->hThread = qemu_thread_get_handle(cpu->thread);
 #endif
 }
 
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index a55b18f353..c9ccc411e9 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -206,7 +206,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     hax_close_fd(vcpu->fd);
     hax_global.vm->vcpus[vcpu->vcpu_id] = NULL;
 #ifdef _WIN32
-    CloseHandle(cpu->hThread);
+    CloseHandle(vcpu->hThread);
 #endif
     g_free(vcpu);
     cpu->accel = NULL;
diff --git a/target/i386/hax/hax-windows.c b/target/i386/hax/hax-windows.c
index 08ec93a256..b907953321 100644
--- a/target/i386/hax/hax-windows.c
+++ b/target/i386/hax/hax-windows.c
@@ -476,7 +476,7 @@ void hax_kick_vcpu_thread(CPUState *cpu)
      */
     cpu->exit_request = 1;
     if (!qemu_cpu_is_self(cpu)) {
-        if (!QueueUserAPC(dummy_apc_func, cpu->hThread, 0)) {
+        if (!QueueUserAPC(dummy_apc_func, cpu->accel->hThread, 0)) {
             fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
                     __func__, GetLastError());
             exit(1);
-- 
2.38.1


