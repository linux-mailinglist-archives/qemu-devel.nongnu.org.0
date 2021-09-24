Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD02416F69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:46:25 +0200 (CEST)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThmi-0004Oe-KZ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThg3-0003Co-10
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThg1-0006KZ-L3
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id r23so155370wra.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUe+1tkOVnIH977cfWQkm6Ao8Hfy7tcpnU7MaXPzIOo=;
 b=NOXtP4tivCAS91rDMAhwcVwUZzXzzbkSv+QjKJ53FeSn9Xi9BrrohzeIoOe083Auhf
 Rovu2J9tDQUgFTnOnJA0A8JS1Fh/vbSmLlgh8Z6CRoWsxqQF4+8H1ulArWxRhjbzp2RO
 BQr3FSkNYMVbFsYi+maJfwF0AV6r609/wpE1pmr8/O12OrMonO2p+PPNi1i3/d0RKyfM
 8CvbEpYFwGLhhiS/TXF9BgXuMB1W3XMYVD6QgCr6i5t55wCHcvQ59GkoVaTDg7NjiSAk
 txaVcnhdtpKICqfoPxSdrKU6Cy0xajhMTjXKVO4I3Zj1rA0oKTlfrfRkFZR+Gyw6el64
 a/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vUe+1tkOVnIH977cfWQkm6Ao8Hfy7tcpnU7MaXPzIOo=;
 b=1iAouwbhP8lQKYQrs3SFoFxwfAlc1eVfXxUE4XqPty2Wq5QbqhljBMeP/MPzrqNivF
 pU+4+MrI7V3EVdlu1sHGWlizOQyvssGX2/en+/WNE+1n8TXW47kDQk5+DfSkl7S0iteb
 72AhESn3kVTDt8sNIvygFqZ2x40ddPjdHt2fA7iipV4pec8quCR+u41BbDVBmyyl4c0T
 HqtNCtGDCHit8O3Sa/xrKHcotELVDhgHbgpJjh6+YdUew6Sd0ziy3QT2mq/4GkR7Z5Wc
 b2q+jADsSavGmqOlD/YBLuhVvLvCR5p47CJLZMwv/7FGldt2bqamfvA0iKBo7j44SQmz
 4sDw==
X-Gm-Message-State: AOAM531szITLPoxunV3jE2tBwBo7mwk2sO/NCzlm4hXSfBONpTLOk6EY
 DDAyHq4Nn9/zG9wtObv8M+uQjKYhnhs=
X-Google-Smtp-Source: ABdhPJxAfed0bikX3dT1RihVvD06PW1q4E6qZ3w02UQIER2y5HHf+TNjB7gg0sCIGuc2E7m2Gcfnug==
X-Received: by 2002:a5d:4538:: with SMTP id j24mr10277773wra.348.1632476367315; 
 Fri, 24 Sep 2021 02:39:27 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n19sm1326723wms.47.2021.09.24.02.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/40] accel/whpx: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:15 +0200
Message-Id: <20210924093847.1014331-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


