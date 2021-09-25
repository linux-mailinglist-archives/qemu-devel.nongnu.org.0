Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056644182EA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:54:18 +0200 (CEST)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU94D-0001ym-1o
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91w-00080c-9f
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91u-0005Hg-Dw
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id r23so11138388wra.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUe+1tkOVnIH977cfWQkm6Ao8Hfy7tcpnU7MaXPzIOo=;
 b=cFTB3ESmBa5g++Km+6ljTw3n59qd039s9/U8dSV75WKTWjWrlSBq/wvuxMw0Xh11e2
 D7297Z5rdev4+PL3pACGaECHoHpiHCjTADkvK7CfHisYMAkMiCkz/pBO2c5Q9oHeCoIo
 8DP+r+l0f+DrUHNrLsKVf6ZQHh7vhRgVn1Nldc7Iqta3XOK4Vw/QoPvBQ6vwbF3u1cFD
 umR4MtQYqwNjBinnZUaMK9U2A3FaWmDLWZyqBifbu/Nq9uzIRQzhbvXJ18YEEnHUWP6o
 zEpKsVmoui9pfiOjJssVoJ/8USPU9q/IWX41rP9DuzeOuz96GN/ZwGbZaxFU8XwYHvZ6
 OE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vUe+1tkOVnIH977cfWQkm6Ao8Hfy7tcpnU7MaXPzIOo=;
 b=Zz/fUGcKaaTMMU11fEy2qzVb6NOYryqpVuc580Ny+awaZIUsO8H/ra57CW6Wr1l+eJ
 CVWt+KRmp7FpEOmwOS9y2pPBhxBoNr+wMGvhWSZCdIuALNtevoa+ZhOGEPS4+Xc/ybcJ
 EJVtqRlZS9mNcU8IsNn9YLYGnVEhDQLEFg90HJAc0r3SEJFkpr4TR4N9wZJ/FAlXissF
 pWK7bEz4GwrC9j+pzePHhew0uwjI4bu6budStN652mxIhzZrxqfBK0M0s7IrI35MzfSK
 nNLPP3ETicDpbrZjG+30poMtLyhwUWSosYLw54U9k+7rRHSjHDqkJKF13JdvgvRzF+6f
 u0IA==
X-Gm-Message-State: AOAM532TI+e6Wy/FAguR8s6EBHqSlZKecFbteJn+CjquNPTtVhzTIoyJ
 9BN3f6vukPppjqSlVoq9mP/+1V+YUko=
X-Google-Smtp-Source: ABdhPJxxzqfA7U9gvO6Wda5hURrjK93Ypdbdqy38aYqWnFSE9un1DgeSJk1R2QB8av3101pB1lxjtA==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr17630544wrs.179.1632581512924; 
 Sat, 25 Sep 2021 07:51:52 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z5sm17832274wmp.26.2021.09.25.07.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/40] accel/whpx: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:45 +0200
Message-Id: <20210925145118.1361230-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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


