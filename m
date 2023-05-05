Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B29E6F8645
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:55:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxki-0003Mj-Ge; Fri, 05 May 2023 11:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkc-0003Iq-PP
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxka-0008D1-Cb
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315712406so104946965e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302018; x=1685894018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fP88xWRTq0YOoukl2eZvLZM8OkmfjfHbQrJlI+FEzEo=;
 b=UwtBDGfT0wbs+Trr1+c1inCCOobVWyJzt1y02qHV6NALVzEY05Co3EOEDcq8NizorT
 ACZwJRuW3O4KBb7wcrBc5oxOwJdYEggQaSRdTrJ/NSL7V64XY9RHi/6CSh8JLhWW1x9I
 aWpCkiavVxTlic4xJuP3h6t51yRgzQVXKlSHfLLiSjD4pkIb/ojmqYLhiyapxXMKYQw9
 LUtIc0XcR8xsIUfkEv3cyfHeFK6T2foljdtizEjBLYF4VSTex9U6gj0tXLppYpvQnGQ1
 A5aPf8Zx/G/MFqKK4YAd3Y11gonRbzi4wCQSpJF0B9gjXzqwN5Bk0eT0grnjR+Kud8eH
 /A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302018; x=1685894018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fP88xWRTq0YOoukl2eZvLZM8OkmfjfHbQrJlI+FEzEo=;
 b=SSlvPXAYCfvVofc7NRVW+aBqlBo/Vwemho5JAQTaaMFXwjiruAtq7BA57jTvbxt0HQ
 nnBbBWkXESiLiiiU/3rg+9McH0xlijWUXVmVrGsWIryxVBpi2xHtvP+fy+jFLzC48IpQ
 K7JD8oWJK1IqcTYrnqr2rgnkvSfE7LNFYR2W75cdFIFxZjETm9b8IuhZg79STrK6aR2/
 qUK1BUm60JKPENKYFKUvSArQjAJX4GlVOI8QkQFXltEQRhdf169I/t+rDNr9sFg8G0IG
 8ZyXpQA/+MaSEc1YkmiCCVChqM/9SseceXJJZzi/183MzuB1ylU0THuVCSd0AqWBgdaB
 8/tQ==
X-Gm-Message-State: AC+VfDwdJm4R1SO92pH23JOM07Wo7J+2MmESnFcG9BpwrDDBgVzarWpk
 GVvJgS0+tvESi8ucJK6bYCtQSQ==
X-Google-Smtp-Source: ACHHUZ4tafTL1vYsv+qkCFCePYhNZYkIwV1IJoKpONFqL2fIy1Jelan/J3MUZ/52OkO0UoPgu0ITLQ==
X-Received: by 2002:a7b:c398:0:b0:3f2:5be3:cd6b with SMTP id
 s24-20020a7bc398000000b003f25be3cd6bmr1696914wmj.3.1683302018198; 
 Fri, 05 May 2023 08:53:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a7bc40c000000b003f175b360e5sm8386081wmi.0.2023.05.05.08.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C85461FFBD;
 Fri,  5 May 2023 16:53:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/10] trace-events: remove the remaining vcpu trace events
Date: Fri,  5 May 2023 16:53:28 +0100
Message-Id: <20230505155336.137393-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

While these are all in helper functions being designated vcpu events
complicates the removal of the dynamic vcpu state code. TCG plugins
allow you to instrument vcpu_[init|exit|idle].

We rename cpu_reset and make it a normal trace point.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091756.1453057-3-alex.bennee@linaro.org>

---
v3
  - s/watch/trace/ in commit msg
---
 hw/core/cpu-common.c   |  4 ++--
 trace/control-target.c |  1 -
 trace/control.c        |  2 --
 hw/core/trace-events   |  3 +++
 trace-events           | 31 -------------------------------
 5 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 5ccc3837b6..951477a7fd 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -32,7 +32,7 @@
 #include "sysemu/tcg.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-#include "trace/trace-root.h"
+#include "trace.h"
 #include "qemu/plugin.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
@@ -113,7 +113,7 @@ void cpu_reset(CPUState *cpu)
 {
     device_cold_reset(DEVICE(cpu));
 
-    trace_guest_cpu_reset(cpu);
+    trace_cpu_reset(cpu->cpu_index);
 }
 
 static void cpu_common_reset_hold(Object *obj)
diff --git a/trace/control-target.c b/trace/control-target.c
index 232c97a4a1..c6132f243f 100644
--- a/trace/control-target.c
+++ b/trace/control-target.c
@@ -145,5 +145,4 @@ void trace_init_vcpu(CPUState *vcpu)
             }
         }
     }
-    trace_guest_cpu_enter(vcpu);
 }
diff --git a/trace/control.c b/trace/control.c
index 6c77cc6318..d24af91004 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -277,8 +277,6 @@ void trace_fini_vcpu(CPUState *vcpu)
     TraceEventIter iter;
     TraceEvent *ev;
 
-    trace_guest_cpu_exit(vcpu);
-
     trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (trace_event_is_vcpu(ev) &&
diff --git a/hw/core/trace-events b/hw/core/trace-events
index 56da55bd71..2cf085ac66 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -29,3 +29,6 @@ clock_set(const char *clk, uint64_t old, uint64_t new) "'%s', %"PRIu64"Hz->%"PRI
 clock_propagate(const char *clk) "'%s'"
 clock_update(const char *clk, const char *src, uint64_t hz, int cb) "'%s', src='%s', val=%"PRIu64"Hz cb=%d"
 clock_set_mul_div(const char *clk, uint32_t oldmul, uint32_t mul, uint32_t olddiv, uint32_t div) "'%s', mul: %u -> %u, div: %u -> %u"
+
+# cpu-common.c
+cpu_reset(int cpu_index) "%d"
diff --git a/trace-events b/trace-events
index 691c3533e4..dd318ed1af 100644
--- a/trace-events
+++ b/trace-events
@@ -54,34 +54,3 @@ qmp_job_resume(void *job) "job %p"
 qmp_job_complete(void *job) "job %p"
 qmp_job_finalize(void *job) "job %p"
 qmp_job_dismiss(void *job) "job %p"
-
-
-### Guest events, keep at bottom
-
-
-## vCPU
-
-# trace/control-target.c
-
-# Hot-plug a new virtual (guest) CPU
-#
-# Mode: user, softmmu
-# Targets: all
-vcpu guest_cpu_enter(void)
-
-# trace/control.c
-
-# Hot-unplug a virtual (guest) CPU
-#
-# Mode: user, softmmu
-# Targets: all
-vcpu guest_cpu_exit(void)
-
-# hw/core/cpu.c
-
-# Reset the state of a virtual (guest) CPU
-#
-# Mode: user, softmmu
-# Targets: all
-vcpu guest_cpu_reset(void)
-
-- 
2.39.2


