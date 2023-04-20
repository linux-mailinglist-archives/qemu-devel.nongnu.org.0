Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD56E97D6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:01:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVlq-0003an-5g; Thu, 20 Apr 2023 11:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlf-0003aK-2V
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVld-00045m-1K
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:14 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f17edbc15eso7191255e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002811; x=1684594811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfqPP/aIIIJD+g7lcqooxH2SGvq/IoBd6dFlJw1/MhY=;
 b=M5agqMM9+FEqotz3oloW5qYAjjEGS9SWvBTkrY3sHeiEOXU4cbiEXPO6mRHjOREpT4
 jMSxeKw2Z1HU0pcSGrdbsJ+6glOJz17kDVxCL27BNxtQS/TsMfbE3CDQpjKq5NvHvJin
 t4+AuiAR7nim+wgNOcve0omTifomQ9j8C4yZ21NPvd0S4tv114QVeswAA+Q3EmyT2Ccs
 /f53PzQ8gNOYuwHKFxx6RLjQlz8U7UhKopFx+m2+T5wo3ZGOsVPPPk3RMZH+nBiiUbaH
 Ab514jrjM3MyCjxS9UyFX1CPo9TKunkEiTlXaKd4mKx82orWv6RZbLnZvTc33z+0LaLO
 c6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002811; x=1684594811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfqPP/aIIIJD+g7lcqooxH2SGvq/IoBd6dFlJw1/MhY=;
 b=N7/9EaStXoGn88LXr+gB64I3SrTxdtxDJzpwxt8Z8pOu36+fqis4ELfG6kQJmcaH9r
 iVm6TTSFb3ODA7X9oo0LcNfJkIwaIirNCg4UFBsAUWRS4SF81ukHJAIo9uiujBEhGeRN
 fn6aIGEpw5CEvMK7y5yLkO29YsJjOyyMEVjnUBoH1EilFYZKlSnuJKF+RzCfKfinKidB
 dsW1/8Yum5mGBXb2zb9sJwHZsb6T/ADqXJU/iakTMo/dSk+t+cQAAJi6I2M1soEpMAOY
 dTv9Bcw0AXieYJXbPCfbNeXuQCpNw1mcvpLbvmhUxSerYi5ijEh9zqoqgTB/8FQu4ECR
 zkPQ==
X-Gm-Message-State: AAQBX9fflTqaIybHLG3fEX5p2soJGew8dl8aEiuJtmsugiWEBhQ5VwwP
 hDFnJEnuI4O+QiJYuzBmbrQr5Q==
X-Google-Smtp-Source: AKy350Z2nEdkEb3KrSt/JM3+ZshCuPu7ATG9+u0kkJhrcU1oYtTpNVRt5+6306Wabx5V35SGWeHgWw==
X-Received: by 2002:a5d:4c49:0:b0:2fb:f93f:b96 with SMTP id
 n9-20020a5d4c49000000b002fbf93f0b96mr1616098wrt.31.1682002811369; 
 Thu, 20 Apr 2023 08:00:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003f17131952fsm2271778wmg.29.2023.04.20.08.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51B5D1FFBB;
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
Subject: [PATCH 03/10] trace: remove vcpu_id from the TraceEvent structure
Date: Thu, 20 Apr 2023 16:00:02 +0100
Message-Id: <20230420150009.1675181-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

This does involve temporarily stubbing out some helper functions
before we excise the rest of the code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 trace/control-internal.h      |  4 ++--
 trace/event-internal.h        |  2 --
 trace/control.c               | 10 ----------
 scripts/tracetool/format/c.py |  6 ------
 scripts/tracetool/format/h.py | 11 +----------
 5 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/trace/control-internal.h b/trace/control-internal.h
index 8b2b50a7cf..0178121720 100644
--- a/trace/control-internal.h
+++ b/trace/control-internal.h
@@ -27,12 +27,12 @@ static inline uint32_t trace_event_get_id(TraceEvent *ev)
 
 static inline uint32_t trace_event_get_vcpu_id(TraceEvent *ev)
 {
-    return ev->vcpu_id;
+    return 0;
 }
 
 static inline bool trace_event_is_vcpu(TraceEvent *ev)
 {
-    return ev->vcpu_id != TRACE_VCPU_EVENT_NONE;
+    return false;
 }
 
 static inline const char * trace_event_get_name(TraceEvent *ev)
diff --git a/trace/event-internal.h b/trace/event-internal.h
index f63500b37e..0c24e01b52 100644
--- a/trace/event-internal.h
+++ b/trace/event-internal.h
@@ -19,7 +19,6 @@
 /**
  * TraceEvent:
  * @id: Unique event identifier.
- * @vcpu_id: Unique per-vCPU event identifier.
  * @name: Event name.
  * @sstate: Static tracing state.
  * @dstate: Dynamic tracing state
@@ -33,7 +32,6 @@
  */
 typedef struct TraceEvent {
     uint32_t id;
-    uint32_t vcpu_id;
     const char * name;
     const bool sstate;
     uint16_t *dstate;
diff --git a/trace/control.c b/trace/control.c
index d24af91004..5dfb609954 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -68,16 +68,6 @@ void trace_event_register_group(TraceEvent **events)
     size_t i;
     for (i = 0; events[i] != NULL; i++) {
         events[i]->id = next_id++;
-        if (events[i]->vcpu_id == TRACE_VCPU_EVENT_NONE) {
-            continue;
-        }
-
-        if (likely(next_vcpu_id < CPU_TRACE_DSTATE_MAX_EVENTS)) {
-            events[i]->vcpu_id = next_vcpu_id++;
-        } else {
-            warn_report("too many vcpu trace events; dropping '%s'",
-                        events[i]->name);
-        }
     }
     event_groups = g_renew(TraceEventGroup, event_groups, nevent_groups + 1);
     event_groups[nevent_groups].events = events;
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.py
index c390c1844a..69edf0d588 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -32,19 +32,13 @@ def generate(events, backend, group):
         out('uint16_t %s;' % e.api(e.QEMU_DSTATE))
 
     for e in events:
-        if "vcpu" in e.properties:
-            vcpu_id = 0
-        else:
-            vcpu_id = "TRACE_VCPU_EVENT_NONE"
         out('TraceEvent %(event)s = {',
             '    .id = 0,',
-            '    .vcpu_id = %(vcpu_id)s,',
             '    .name = \"%(name)s\",',
             '    .sstate = %(sstate)s,',
             '    .dstate = &%(dstate)s ',
             '};',
             event = e.api(e.QEMU_EVENT),
-            vcpu_id = vcpu_id,
             name = e.name,
             sstate = "TRACE_%s_ENABLED" % e.name.upper(),
             dstate = e.api(e.QEMU_DSTATE))
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index e94f0be7da..285d7b03a9 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -74,16 +74,7 @@ def generate(events, backend, group):
 
         out('}')
 
-        # tracer wrapper with checks (per-vCPU tracing)
-        if "vcpu" in e.properties:
-            trace_cpu = next(iter(e.args))[1]
-            cond = "trace_event_get_vcpu_state(%(cpu)s,"\
-                   " TRACE_%(id)s)"\
-                   % dict(
-                       cpu=trace_cpu,
-                       id=e.name.upper())
-        else:
-            cond = "true"
+        cond = "true"
 
         out('',
             'static inline void %(api)s(%(args)s)',
-- 
2.39.2


