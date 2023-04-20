Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CD6E97D8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:01:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVlq-0003iZ-Uj; Thu, 20 Apr 2023 11:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVli-0003ah-HQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlg-00047M-4m
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so7758145e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002815; x=1684594815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qaSuTiuAyCSuCXfY55ffoyW7xvTS9JDADhViNRePirU=;
 b=QOquyBWdcgQam8dmHyjRGI2/Viwa5nGkClTRnjuc/sotcSeXj9u2Sy5+onN+zFjXvu
 WyrGoS/dnhpJEvmq+022SvqviStkuzpgw912yJdvOcPHvPTbe52jEp3kbF+VXDAdI7VB
 bz4zwQg66v0ogSdITzZncQRzSFW+s21iRmgxicBUDWL/6H6OnFvRNmvHCloSRPhN34Q8
 1lSk1O76ZP8p/0TTnWKp4udHj8yuPelnSUXJPOdHVAXpYSUs0DNsAlkMk1RIIPYckZC6
 r4Ngg60ggJszxt2/izS+bWxeCTX2ig1WqjnE+FlIc9utmirAxzXRzvTcpBlziyMJkQYT
 9wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002815; x=1684594815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qaSuTiuAyCSuCXfY55ffoyW7xvTS9JDADhViNRePirU=;
 b=TZG7Yu1+5KrT0Pug+h3AW9cvs4jpIPPE6A1DtEeSg/nIUrxzzjxj6QmNvt9fgj0sRO
 cbOVms86HjF98j5Qw6RmOVpqVvrLTjBTOhugdvwNqGRnFTxdm0K+TFiFvio3J33VK3Iy
 TykMwrWg1SJEOSNHVJaWg+ZnyoJKGpq2WjOKQSBttFoXLC1wT+yEtPVuF35KdHx9Y/67
 BJAgFC5/aX2FndMAYDDujiJZPsDkzpoRYxiGH66eeAC7vEh0hRLP3FydMTUGvhWgC82I
 8X5QZbWLJy+oAq7LB+NuCoI5vAjDsMvKnK9J3cehUucugkjxo5U81nqLlQ0zHECJ9NXl
 9Blw==
X-Gm-Message-State: AAQBX9fKoip1WKZits4Ynk+JMqbHGJnN5NZnBlFIZzbUW+MEJoiWICOa
 PFCv6Hv+FWT8G9znlnmoARtPEg==
X-Google-Smtp-Source: AKy350Yuc8Sic0pnW5pHGi9dyijTmyIU00GYBoVpn129Yxn+b66NlKRxWK6falvuFtdwSbrw7S6W3Q==
X-Received: by 2002:adf:ed07:0:b0:2f5:7079:599e with SMTP id
 a7-20020adfed07000000b002f57079599emr1456255wro.12.1682002814773; 
 Thu, 20 Apr 2023 08:00:14 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600010c400b002e45f6ffe63sm2185756wrx.26.2023.04.20.08.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5CFE1FFBF;
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
Subject: [PATCH 07/10] trace: remove control-vcpu.h
Date: Thu, 20 Apr 2023 16:00:06 +0100
Message-Id: <20230420150009.1675181-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Now we no longer have vcpu controlled trace events we can excise the
code that allows us to query its status.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 trace/control-vcpu.h          | 47 -----------------------------------
 trace/qmp.c                   |  2 +-
 scripts/tracetool/format/h.py |  5 +---
 3 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 trace/control-vcpu.h

diff --git a/trace/control-vcpu.h b/trace/control-vcpu.h
deleted file mode 100644
index 800fc5a219..0000000000
--- a/trace/control-vcpu.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- * Interface for configuring and controlling the state of tracing events.
- *
- * Copyright (C) 2011-2016 Lluís Vilanova <vilanova@ac.upc.edu>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef TRACE__CONTROL_VCPU_H
-#define TRACE__CONTROL_VCPU_H
-
-#include "control.h"
-#include "event-internal.h"
-#include "hw/core/cpu.h"
-
-/**
- * trace_event_get_vcpu_state:
- * @vcpu: Target vCPU.
- * @id: Event identifier name.
- *
- * Get the tracing state of an event (both static and dynamic) for the given
- * vCPU.
- *
- * If the event has the disabled property, the check will have no performance
- * impact.
- */
-#define trace_event_get_vcpu_state(vcpu, id)                            \
-    ((id ##_ENABLED) &&                                                 \
-     trace_event_get_vcpu_state_dynamic_by_vcpu_id(                     \
-         vcpu, _ ## id ## _EVENT.vcpu_id))
-
-#include "control-internal.h"
-
-static inline bool
-trace_event_get_vcpu_state_dynamic_by_vcpu_id(CPUState *vcpu,
-                                              uint32_t vcpu_id)
-{
-    /* it's on fast path, avoid consistency checks (asserts) */
-    if (unlikely(trace_events_enabled_count)) {
-        return test_bit(vcpu_id, vcpu->trace_dstate);
-    } else {
-        return false;
-    }
-}
-
-#endif
diff --git a/trace/qmp.c b/trace/qmp.c
index aa760f1fc4..3e3971c6a8 100644
--- a/trace/qmp.c
+++ b/trace/qmp.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-trace.h"
-#include "control-vcpu.h"
+#include "control.h"
 
 
 static bool check_events(bool ignore_unavailable, bool is_pattern,
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index 285d7b03a9..ea126b07ea 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -16,10 +16,7 @@
 
 
 def generate(events, backend, group):
-    if group == "root":
-        header = "trace/control-vcpu.h"
-    else:
-        header = "trace/control.h"
+    header = "trace/control.h"
 
     out('/* This file is autogenerated by tracetool, do not edit. */',
         '',
-- 
2.39.2


