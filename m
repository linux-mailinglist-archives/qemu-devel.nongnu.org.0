Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104F6F8641
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:54:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxkj-0003Ni-8N; Fri, 05 May 2023 11:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkg-0003Lx-EI
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:46 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puxkc-0008DM-TJ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:53:45 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f58125b957so1830044f8f.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683302020; x=1685894020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1RBvNRxHMYjEfv4JVTGObYYyuKugl6KdBGJDsp6ges=;
 b=oiBMe+8We6L9xfrUCZ7fmzVcMqfeRwcfRJg3gYxiAwT9srzPx7jbPPCfUs8+cuwM09
 M1JDXPIVWxZR8K9jdQEiZoSNlzI3zSCezOKP/dUtHNrKCdyMLzBL8qFNVYTAhghaC8MD
 SvpeU0Swn3SJ/j9Sp5drNVhaNiezE98z906r9Wh5tCj9Ef86N5eYbwfIfbncciUg2Qct
 y/sD+37qa829yu0R2263PhnWAXgn5b/Bb1og8ESWEAd6f/mdAtp0kzqBLYyiw7Y5C77K
 TlI4mjVXEnWAbn+SvVj+b4ymgJ2WD0jLWcdrsOPDS78oQ5rxnNK6sYE85mlA3El7d5GI
 tyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302020; x=1685894020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/1RBvNRxHMYjEfv4JVTGObYYyuKugl6KdBGJDsp6ges=;
 b=QXVs1ocgSno3JEnSJ1ezH+02TGIn4qSXwyAEIXYupUY8q1rNapktddmrKrOrPptP/R
 jSS4efgJakvEWRAlMyagqthadMfMVaVsj5P5+sDcajsQ1z8QWsS+ZS2BnX3PXnEmnCt2
 l1vp5y84ySaX7WER9ywAodzC1MekDq+fMiJ7VYwpM/uO4+ILGnYPEI8QoUBK6hX7WNCq
 Zw4QryZ9SOXnQ5Fc0JttzkFPfuM8BVNCWw0lb1WyE6PSjXNJ0q+JZPaZiFCoRpbePKNQ
 5SleHxjPupGL5+JniiT+YW97Zdxt/D5mSjzcGOkFRb9hXPD7XBtrnt3JtmUKKi8yBwr1
 VaYA==
X-Gm-Message-State: AC+VfDypXq0hny3ESJTSgsiq/Go8ouD2vqlIGJi6yaZRMrxqlQPdNq7G
 kmOxvntT7pFPQRYACwQZTKg5VQ==
X-Google-Smtp-Source: ACHHUZ6V793N7HvWgwn7mhGBqCAO5el6/oeP9xYQ5LwEiR2tBG+g6kiPnvcmAZ21ZhmYTvDUzjBi3A==
X-Received: by 2002:a5d:510a:0:b0:304:79c1:725d with SMTP id
 s10-20020a5d510a000000b0030479c1725dmr1761366wrt.45.1683302020521; 
 Fri, 05 May 2023 08:53:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e7-20020adfe387000000b003064088a94fsm2763988wrm.16.2023.05.05.08.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 08:53:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C3261FFC2;
 Fri,  5 May 2023 16:53:37 +0100 (BST)
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
Subject: [PATCH v3 07/10] trace: remove control-vcpu.h
Date: Fri,  5 May 2023 16:53:33 +0100
Message-Id: <20230505155336.137393-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505155336.137393-1-alex.bennee@linaro.org>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Message-Id: <20230420150009.1675181-8-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230503091756.1453057-8-alex.bennee@linaro.org>
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


