Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A35090C7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:54:09 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGOu-0003PP-2a
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFod-00011Y-1e
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:39 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhFob-00039m-Bo
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:16:38 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso2931933pjk.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NiAO0R4c7i4ovsHyPxGnks5Yw6jFgOhVnzHqFoHT3+s=;
 b=ZQsJfO5fUHNalzzl8LcFiDGoomrTT4gimbk1DqgEogr88NZ5ngb7BmYMDu/D9sZbhB
 tjAXD5eBpFmVjJ4qSBTYh+exwV9KjRwNZZLFNfrO23jUKfp8FzraYERZP9RivhtPzRVp
 8JlcBOmWu1hV2RVlkuhWDjOf8pIq8N+PGnUvijVqxpQ3E8O/hdu5s6NKtAlVxblQYQgu
 plYl6AYLPP6E7EsxuO9Ech49PI1fL1GFEuxg+YruzDEvg9gQjN5MjZ14Ib6JXA8Ee+sk
 upo9nF0ufDwqJEzKXBM4juwf/KKTzaO3ltmJMWq70USN57awexcWShq43/0kYh1qD3eK
 AhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiAO0R4c7i4ovsHyPxGnks5Yw6jFgOhVnzHqFoHT3+s=;
 b=YP3hGlmTV2aI5glprzC7W3pIDKxcRek0Vqt52hKv1zTxDIPAOH71UgMzXKf4Q/w+oo
 jXabfT3SQnaqYeiFGDvC22lRh0gqf6XljYNk9bIUYr+Q0gH1OG75c7n5PVK4Gky2dJe3
 S/BcOU938y9M7nCBNnN698lJ43GyfEBnoNG1cJXV2sgkoXBvSPwuxz9VgIliowJg/WA1
 LCFCNDqRaKKjui3uIzDZcdtg7qrguAxSZLqNkSqyghhBmWy8RiGImDelPb78W8o++m3+
 k1uiclA7l/CZFvrOImNBrNfqjJ6gIFh0vWQZV2H5gYNTgaqccy8waADqMuef6Wsd5Qw7
 fsww==
X-Gm-Message-State: AOAM531XPyKyzIZYj3D5KgtfJPMxiHv7MNkezyxZANLTNPWYINXkSNKB
 yi8tuB7aLYqaETYwqZi5QAu6Pe6lV6rtCQ==
X-Google-Smtp-Source: ABdhPJwpvuDoiJ+xLRiBGz9kI/MXYMfg3jpCHTuOVXJLbkQ8tod1wCan5KIs+zYvVgIu/5gw6aXqUQ==
X-Received: by 2002:a17:902:a710:b0:156:5650:f94a with SMTP id
 w16-20020a170902a71000b001565650f94amr21486046plq.86.1650482196089; 
 Wed, 20 Apr 2022 12:16:36 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b0050612d0fe01sm20599200pfo.2.2022.04.20.12.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:16:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] Don't include sysemu/tcg.h if it is not necessary
Date: Wed, 20 Apr 2022 12:16:31 -0700
Message-Id: <20220420191634.1402437-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420191634.1402437-1-richard.henderson@linaro.org>
References: <20220420191634.1402437-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This header only defines the tcg_allowed variable and the tcg_enabled()
function - which are not required in many files that include this
header. Drop the #include statement there.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220315144107.1012530-1-thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/hmp.c                  | 1 -
 accel/tcg/tcg-accel-ops-icount.c | 1 -
 bsd-user/main.c                  | 1 -
 hw/virtio/vhost.c                | 1 -
 linux-user/main.c                | 1 -
 monitor/misc.c                   | 1 -
 target/arm/helper.c              | 1 -
 target/s390x/cpu_models_sysemu.c | 1 -
 target/s390x/helper.c            | 1 -
 9 files changed, 9 deletions(-)

diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
index d2ea352655..bb67941420 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -4,7 +4,6 @@
 #include "qapi/qapi-commands-machine.h"
 #include "exec/exec-all.h"
 #include "monitor/monitor.h"
-#include "sysemu/tcg.h"
 
 static void hmp_tcg_register(void)
 {
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 6436cd9349..24520ea112 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 88d347d05e..e274dd92d7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -27,7 +27,6 @@
 #include "qemu-common.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
-#include "sysemu/tcg.h"
 #include "qemu-version.h"
 #include <machine/trap.h>
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e55ac32bf3..2bc72c27c5 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -26,7 +26,6 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file-types.h"
 #include "sysemu/dma.h"
-#include "sysemu/tcg.h"
 #include "trace.h"
 
 /* enabled until disconnected backend stabilizes */
diff --git a/linux-user/main.c b/linux-user/main.c
index fbc9bcfd5f..f1711b82ec 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -21,7 +21,6 @@
 #include "qemu-common.h"
 #include "qemu/units.h"
 #include "qemu/accel.h"
-#include "sysemu/tcg.h"
 #include "qemu-version.h"
 #include <sys/syscall.h>
 #include <sys/resource.h>
diff --git a/monitor/misc.c b/monitor/misc.c
index b0fc0e5843..ebd49e13b6 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -48,7 +48,6 @@
 #include "qapi/util.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
 #include "sysemu/tpm.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50d287f289..d7715c911a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -27,7 +27,6 @@
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
-#include "sysemu/tcg.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
index 05c3ccaaff..d8a141a023 100644
--- a/target/s390x/cpu_models_sysemu.c
+++ b/target/s390x/cpu_models_sysemu.c
@@ -15,7 +15,6 @@
 #include "s390x-internal.h"
 #include "kvm/kvm_s390x.h"
 #include "sysemu/kvm.h"
-#include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qapi/qmp/qerror.h"
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 6e35473c7f..473c8e51b0 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -27,7 +27,6 @@
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "sysemu/tcg.h"
 
 void s390x_tod_timer(void *opaque)
 {
-- 
2.34.1


