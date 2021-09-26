Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0AB418B6D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:30:55 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcfe-00058d-7o
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcck-0000r9-Bc
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:54 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcci-0005VH-Se
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:54 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u18so46529052wrg.5
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUe+1tkOVnIH977cfWQkm6Ao8Hfy7tcpnU7MaXPzIOo=;
 b=osZOzyl570nMTzc8yw2awwxE1MsWORyofZqC0UxcPWtKnIgde5fIzu34dWWxCNJwvE
 Rms1Ye+bCnucVMv3AhpxbmoX5QiBgzEBruq4TqHiOoA/0FcbKyAVRlRc3RDO0bsZOXKq
 yfrsF/W4PUHj9YSH8+sI13YxLZ6VHpYml0riV/jNTGo5n/+szgrBEJSfQN7vVoRfRkmt
 hd+X6iAti6UhsgU3zNzCFi9AzQFVmV7LUtOgiPKv+KBjPspkLV9yKxgJeWfh6Sc456dn
 f9AQGWsmLTvAzPcTso4tQxfNJHrmkXjyJWnBwcmTSvxtQPAk9ozWSfWlzj7pANKdXc1R
 u9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vUe+1tkOVnIH977cfWQkm6Ao8Hfy7tcpnU7MaXPzIOo=;
 b=ECpDkop960UowhXr+TQ/8OkngmWYGTiPCFjzCaeOwdyb7EM6M0hLCfzW77CoFCU0Xa
 uwrHVM65SJj2/6Us+l1f7pBX+gjWb2qR5DWRyYnRF5LE8opFgVMwRvAFTmegm5iNntQM
 R6w8WRNYoY3I76dG5RiJL1QbE/LAU+9b/a0uznfpJqL/pYPhM/OTNR1Fj4Cn2jFfOYdv
 6FiIHSVt+gxT4AjxQ4S1yGdJjr6ycAgwRwvyTot2smdCNpB6CeSBSLhe21pjCZm6m3jy
 l1WrFEKKBYX3GxImoBk5DGPMD2vwv8+AhePOPNSRV151PgoE9kwhOYArxez2ZicZNJBg
 pKGg==
X-Gm-Message-State: AOAM530cI1SFdZOiP9oGyFSWGQw7qnNQHsv3QyfpNiuh9spjjcdyC5bn
 vfh91YKsLQCwfUnQPsTz+vrsSxMqWkA=
X-Google-Smtp-Source: ABdhPJy2nDIc0bOSLZ9gSs8fB14NnUc66qIdOVI14E0smbIfjaQodDfkxrlvklf1xotUCP2kx6TGOg==
X-Received: by 2002:adf:e649:: with SMTP id b9mr24756235wrn.309.1632695271540; 
 Sun, 26 Sep 2021 15:27:51 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o3sm15552836wra.52.2021.09.26.15.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/40] accel/whpx: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:43 +0200
Message-Id: <20210926222716.1732932-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement WHPX has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c                    | 4 +---
 target/i386/whpx/whpx-accel-ops.c | 6 ++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index c9f54a09989..5ffa02f9cef 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -41,7 +41,6 @@
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-timers.h"
-#include "sysemu/whpx.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
 #include "trace.h"
@@ -89,8 +88,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
     if (cpu_is_stopped(cpu)) {
         return true;
     }
-    if (!cpu->halted || cpu_has_work(cpu) ||
-        whpx_apic_in_platform()) {
+    if (!cpu->halted || cpu_has_work(cpu)) {
         return false;
     }
     return true;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 6bc47c53098..1f9c6d52c27 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -83,6 +83,11 @@ static void whpx_kick_vcpu_thread(CPUState *cpu)
     }
 }
 
+static bool whpx_cpu_has_work(CPUState *cpu)
+{
+    return whpx_apic_in_platform();
+}
+
 static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
     ops->synchronize_state = whpx_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = whpx_cpu_synchronize_pre_loadvm;
+    ops->has_work = whpx_cpu_has_work;
 }
 
 static const TypeInfo whpx_accel_ops_type = {
-- 
2.31.1


