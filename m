Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B186E97DB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:02:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVlr-0003kR-Rh; Thu, 20 Apr 2023 11:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlk-0003dB-6r
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVle-00046H-4s
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f0a80b686eso5049405e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002813; x=1684594813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaYFv/GATacnspxitZxXqy32DjO2LBrHottpHojCTUU=;
 b=fab1SFaKzW2HOaakn+2mXg5jcNE5tsUQ//PQY+SBl3xlP5qFyr5sYDhh5+5q/I926A
 ArZL0sR+CrrwKb4pT6nXc9ojPszq0sSVe7I0HtFEevTpGp+Lc9o3Kgisfsl/DtUrP05p
 SuKmfrcj1hyCAP5yUyyu4k3YCpaMLn2lKyRhgTSZXcUHYSnUDZPFugQF+bNOp1sbn+NG
 OgHrvC5KtJR0/rjJrZjAQ1AaFkZOQcWUFnzCDJurEvVV5++w2uGM5aFvbjnF/uN5Frh+
 hLtqd5FZmqPJ5hikvt3L2sU2QJ8qe3yej+DWdJgvAoHHl97jXXnNcx7kBjW9v/eczDVD
 z6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002813; x=1684594813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaYFv/GATacnspxitZxXqy32DjO2LBrHottpHojCTUU=;
 b=GuCoX2g+OiO8aVTYa7zKY4Ovcs6M6Vnkju6ToAxZcJTfB3PcMx9xxZEyhz5Za2fc87
 wlRL5qhGWtOitRLM3ZnR2jjLwvl0ouvkS62Hxox2L8AlqhCzilR/hUsFd6TSOPU6WEUe
 3Tntrsz/goWbvSEv3A838rjFfeOITZzAM2O2EwpFQ5sQxtsPyvzWaWr75sn4PUwNJvBI
 cLmrf34/lholocbtpzjksuZ2jzgPIB7TRIA6RerYsCj5kb4WgxSZswmYLTFmf8K78TUE
 GDtwOIkj/3WninBD/BwagU85CqLUD+HegXZrNQN+YTxVhrflLgDkoAQ+wEPOt/sFaVv+
 cvbA==
X-Gm-Message-State: AAQBX9dMMLXcVtFoYNiV5LCxxFx/2tKWFKY1ukV8h71SFiRV+PWInchB
 Yw2OI446KsFrEj8JZ4IYThS98Q==
X-Google-Smtp-Source: AKy350Ywow0Mh/pEwvTzr+jJ74Rlesehe+6MKmp1UfYvJ8+R8D3xNDIOVamLZIBRmNWXMex6LTDv2A==
X-Received: by 2002:a5d:4488:0:b0:2ee:e47e:9014 with SMTP id
 j8-20020a5d4488000000b002eee47e9014mr1639487wrq.1.1682002812695; 
 Thu, 20 Apr 2023 08:00:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe947000000b003011baf89b3sm2176230wrn.40.2023.04.20.08.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E8431FFBA;
 Thu, 20 Apr 2023 16:00:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 02/10] trace-events: remove the remaining vcpu trace events
Date: Thu, 20 Apr 2023 16:00:01 +0100
Message-Id: <20230420150009.1675181-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/cpu-common.c   |  2 --
 trace/control-target.c |  1 -
 trace/control.c        |  2 --
 trace-events           | 31 -------------------------------
 4 files changed, 36 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 5ccc3837b6..8373a500d2 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -112,8 +112,6 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 void cpu_reset(CPUState *cpu)
 {
     device_cold_reset(DEVICE(cpu));
-
-    trace_guest_cpu_reset(cpu);
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


