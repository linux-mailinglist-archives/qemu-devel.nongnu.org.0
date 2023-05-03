Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594486F5473
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:18:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8cg-00039w-UX; Wed, 03 May 2023 05:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cd-0002pM-7N
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:03 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cZ-0000Lg-Nr
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4000ec74aso1128305e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105478; x=1685697478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnbuAda1HDg+mB6KFTRsN6PGn/CEDFiT2f/X2hh0Sns=;
 b=VUC5w4cjKeJc1B27J+YmpdCgXgyEtAMYEQmCbJEk/v8PQn/oBBQc1tDTPFEIq+IySa
 caKAkBwES3iACXhuEmeDq3jI+bc9JLHtvY/LsyvrhbIw5tnFirv+FTvFR1wXPJTj3n28
 CC8uQKzEL7C52GAd4oz7F48kiPKmg5UZKatMBnDRJuoehAe17wI2eFxrFF8dtRADY/ka
 Isa49DiWESgfSpk3KJZ1AQ29AaMRFfHQmoGnMt1C9gFLYdiGyYNRumorhq9mbK5eKWrl
 GqOlwhJSv0FwxmjmRzN5kIDlx92yMjfgxeON1pHeGEzTSzlTFxp8Ls8ChmiopV6Camp5
 ev7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105478; x=1685697478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nnbuAda1HDg+mB6KFTRsN6PGn/CEDFiT2f/X2hh0Sns=;
 b=JqOVAgDFR383Y8tx/DOrlOJt3C7NnCwG1isPaoAiDik8QagrkWOt0xwHWtxDOlO52d
 zHN0zvff1pn99bcbElMesvxJh9QnbpAawOLhELHV8DhkMlJkzhgWJS4BktYRA5vkxPdw
 zWXEJpVELGi+t5KmgS0gwM6r2+q6vwzo5miXauiTWBr3bPwt+HnusSg0DyTYFXE+nWMA
 kszog3NlbW/UaSFWs1E8RK59l8yHeEbdsYTB+wr0nsQXpVSKQN8ZAGhx6jZpSmwcDvC9
 Ip/sETq28ginAvwvPcryQWfbYQLNm1A3ZWefftkzra5//i3nbJEAhv5Ifl6ID3/8AQhs
 /Sdg==
X-Gm-Message-State: AC+VfDxHyisID2lM9a1YjflHAwK++TX5tV4w+mwEG3YbzUktTYWYiCjE
 sCanrJ2Y6/AhmTmGtpaeFP9rqw==
X-Google-Smtp-Source: ACHHUZ6NJhHkHAP/QwRB+vKffoBw+LZhUkfRvoY7QJ45hxILf4Rkqs68U4gTYscGumEV644wCLVqYw==
X-Received: by 2002:a5d:44c4:0:b0:304:4460:11e7 with SMTP id
 z4-20020a5d44c4000000b00304446011e7mr13920851wrr.51.1683105478286; 
 Wed, 03 May 2023 02:17:58 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00304ae802f02sm16415808wrt.66.2023.05.03.02.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38EC11FFBF;
 Wed,  3 May 2023 10:17:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 02/10] trace-events: remove the remaining vcpu trace events
Date: Wed,  3 May 2023 10:17:48 +0100
Message-Id: <20230503091756.1453057-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091756.1453057-1-alex.bennee@linaro.org>
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

We rename cpu_reset and make it a normal watch point.

Message-Id: <20230420150009.1675181-3-alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - keep cpu_reset tracepoint
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


