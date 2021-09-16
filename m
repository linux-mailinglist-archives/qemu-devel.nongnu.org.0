Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB740DE51
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:44:17 +0200 (CEST)
Received: from localhost ([::1]:40720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtYe-0000TK-2d
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLS-0001JW-17
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:39 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLN-0002PZ-CP
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:37 -0400
Received: by mail-pj1-x1032.google.com with SMTP id v19so4815356pjh.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ujtoHmWANpUUSk4HPJATTFV4O1b/xtgCUsvKjJvcGw=;
 b=d2H+8HhrodxXptlwYf4BGIzvlTvUJt5pysQDsX9FuJ7KV06wzYhoDw2n+9ufcam4ob
 otBUXg1egQBBS0utDdMjWcUIJFy6Jp3OqT7eK/VPv76cB34Wp3BV4dDN9kOpqxTE3q0y
 mh0WLoaXkdr/NE8mewtE6OwLrACbVhALdNTXiRNk9k8O19ieV6KsCyvZ0uVI+73YXG24
 mSyJI4b5C3ijQ3X2xjrpiUxllFveMzJhxb/ktb/JLMzby7UvgFEKjBht62Y0mkqs8sSK
 9QXlhczxraqW+Cpc4VN4cVj9Lh3oaUpg9EktSaMHMLXEY+TL/b0Ko9Xe2TnrBEh7noEv
 f5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ujtoHmWANpUUSk4HPJATTFV4O1b/xtgCUsvKjJvcGw=;
 b=A47gQUgEmuwsVUFKnZe9S4AV0P8s7JsfDgf73CcRGn52qWn6b9v7xbkMQXwqV7S6qH
 RsH6CcvF6hY7LhgQE0M5ECWtpFhRQyJ7xIEjktpus0UOU4GqsW1+x6PRFMLrtlYOwM0x
 TH01mKtJeC346dpaZJfJ466mtgm/1tQv7vIQj6g4a4VLcREdFl0ji4Qfttqkm4sEGjXa
 NkTi85Bda2xvW/V+ilMqxv1rSBVPRkQa07DAv1+cxDpCruwOoTLxe2vwfxurT+HZGZGY
 3fuxa51xxSb2b8/HWn1T84Q5fJzvPjNMdW6CL+lpea/GGDkO5qWKhAR1tan87I4R0FJe
 +F3w==
X-Gm-Message-State: AOAM530whb8NoKz6PHiT1ORzGvwoXc9bKgopi/iZ/f033LdYzX3ZcOhr
 LnBLH1IN5oALGwT+j0eCtycnITh/o/g4/A==
X-Google-Smtp-Source: ABdhPJwr4rwSwkpmzP16VwAbZAo19koHNHw9/jte9OUzw1glE0WEnehebC32I1xVqCDK294VMlF4lw==
X-Received: by 2002:a17:90a:7f01:: with SMTP id
 k1mr6813591pjl.156.1631806230843; 
 Thu, 16 Sep 2021 08:30:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/35] accel/whpx: Implement AccelOpsClass::has_work()
Date: Thu, 16 Sep 2021 08:29:57 -0700
Message-Id: <20210916153025.1944763-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Implement WHPX has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-7-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/cpus.c                    | 4 +---
 target/i386/whpx/whpx-accel-ops.c | 6 ++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 3db7bd4eb4..6bce52ce56 100644
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
index 6bc47c5309..1f9c6d52c2 100644
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
2.25.1


