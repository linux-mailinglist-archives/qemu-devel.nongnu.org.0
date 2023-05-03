Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879E6F547B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:19:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8cl-0003nH-O8; Wed, 03 May 2023 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cf-00037v-Tq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cd-0000Me-8v
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30644c18072so202516f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105481; x=1685697481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0xmDVAIv0XD4yi7vmosoJPR2UzMLoDsipcZ6y9UWA8=;
 b=KsPt7by+E7mfN4KvGnGlKmQjn+sBIvTGZnjVCFkDFPGs7bPHVZVQng2hhEtAAewZ1x
 iml+RaBoUkWouOs01zTFz/4qidPMmFd1FHk3Lkodo5bwONIivBmT7dciIBoEwRNcYhJW
 4r0ea07TjUqZdvliL2G66AVU9wdztPXJyzqRzVpLqKoi7Va3JOdl51HL0uba1AYWRoSZ
 ERvkwaFnWuJ+zuXBoMs8pqNWdrYVR5xh9jwXKP6jG5cCag0t3Z7J+/x9ihBZLjQoDP64
 g13t9WkjGx6IPDXD3gVYuefpnVRGa/FJ0rYlCXoPggxM+ImL5U0QXr5XNOtSD14G4P0W
 stiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105481; x=1685697481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0xmDVAIv0XD4yi7vmosoJPR2UzMLoDsipcZ6y9UWA8=;
 b=ZQhOBFjyJ4swLc7BWWGMWAjz8tCgOS46ovsm/J2zhUba4a8BrDV/J6VNCUmr7Sd7Qq
 RRtzsOiKDqff4Oz7tUcKWnqP32F2P9sNi0US1L8T2+vXh3MsIv0Q1QOloQ6N2F5VtKWK
 rjnkCO3JiI9Wcd4UKrCYZvO15w9t1pBRsrJFYcxb/rhTtYCbi3bqc4ZqaCVRnkjNMYJt
 Yk1rFpAhiAmusqSuSxkOUKC3QAZ7ClcOEFXu+j0Wp1ZItYT82Y57iVDYhNyhg10kc7mI
 UbuuD3MFonLrUNP+xBM1hsOGs/LnflVtwqPBAmVmHs8jSX3jIpZGlr9ejCJX/TXQ+obq
 iVUA==
X-Gm-Message-State: AC+VfDzMpTeEek2OurCb2YIYjFkBxC23JqVJ3UTHd60T5oPUT/ULCTiP
 UyLhbmRMkd2iLI22wYgxR0fj7w==
X-Google-Smtp-Source: ACHHUZ5xndH5W3t0cqYXG4CbUY5/HcSZyXZ2FOZP+GP0GVRUGUkcs4U5MIr1e0RKF/5DYK0vAup1eg==
X-Received: by 2002:a5d:4d90:0:b0:305:e8db:37df with SMTP id
 b16-20020a5d4d90000000b00305e8db37dfmr9850355wru.22.1683105481339; 
 Wed, 03 May 2023 02:18:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b0030630de6fbdsm6384679wru.13.2023.05.03.02.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D051F1FFC4;
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
Subject: [PATCH v2 07/10] trace: remove control-vcpu.h
Date: Wed,  3 May 2023 10:17:53 +0100
Message-Id: <20230503091756.1453057-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091756.1453057-1-alex.bennee@linaro.org>
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


