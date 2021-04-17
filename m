Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069D363201
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:43:52 +0200 (CEST)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqr9-0001ID-Aa
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpZ-0007t8-SF
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpY-0008CW-27
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:13 -0400
Received: by mail-wm1-x32c.google.com with SMTP id k128so16030100wmk.4
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IAZoteJHBoKPc9HxfjcxRcYAAmgdep69zycNRvL7CZk=;
 b=akPuLYc8y86JRQhtgA3Gz0LLwkC0/ohC1gFaB8yzTwy94dagdltBgVhpqwEf3vj/Gj
 tdM7OQNhy53vu1W7cWxubOV21ahXVuTnDnGANcTK3vJkamVZuDOwE1c+kpVi8i2UzRrd
 pmJTne5Mh10z09yUUzYKXqF6OzGveLGzeaJTfiHwpQTaeF7005v5ahj+TSd2vm9VuKHk
 C8BdQkDVMwEiKHBvHc47D1oZvyjZS8zSFF6EXx8Qx7Qz/Kd6m3lSEL0y5k3kwdECDjYl
 8Vb6Pz6lZ1Nq181gXIGPCiAJwED/lcidDhUywSuVVZQ7w9waoqFgyER9NfQCObD3hIjX
 9vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IAZoteJHBoKPc9HxfjcxRcYAAmgdep69zycNRvL7CZk=;
 b=mLMBwSLWh5F3rhSy33E7aFIQTfUK9MSGvKByDrDknu4qu/Es45Lp7tp21i5ATI7m+T
 znRRZS8OAeKrVfa27e2ojUi9mn6X4DDYyqBVYjd/QBzH/zkf7d5Md32GmItNbKp2bYgI
 5MQvkuT+yhw9pQrl54AGsBbTCRF9F/mIZ/3jPqFfHMOnSa3qQbqKLC4P0YN3cRYv2Axz
 3+Q+j6C90v+qwHVSKVYKC6xn3lCbbTunFD/n6mxZHZIplXM/lHIJabw01h/SQddz/2/z
 d4HZikpCGpWXsS5eduZyONb/+RGqc8CfFy0lURQVRZn6GIuzb+aZ727kLOP39deEwAhy
 JnjA==
X-Gm-Message-State: AOAM532HMcGhKUOfi3wcoEXNe8amIvR5iWlUWTn5gnmDMQ8VzdULuCkU
 c9Tk3oquvdfU6rhdq0+OJ9wD1Y3nJIk8GNwi
X-Google-Smtp-Source: ABdhPJwVGIgvuewwBDrIyCvjS+vC2nATn9c5wSlBR6kN3+s5r1OeuCUgC/qirpixL5Rf8gvishMJFg==
X-Received: by 2002:a1c:b002:: with SMTP id z2mr13697928wme.121.1618688530869; 
 Sat, 17 Apr 2021 12:42:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] hw/arm/armsse: Give SSE-300 its own Property array
Date: Sat, 17 Apr 2021 20:42:02 +0100
Message-Id: <20210417194205.17057-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSE-300 currently shares the SSE-200 Property array. This is
bad principally because the default values of the CPU0_FPU
and CPU0_DSP properties disable the FPU and DSP on the CPU.
That is correct for the SSE-200 but not the SSE-300.
Give the SSE-300 its own Property array with the correct
SSE-300 specific settings:
 * SSE-300 has only one CPU, so no CPU1* properties
 * SSE-300 CPU has FPU and DSP

Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210415182353.8173-1-peter.maydell@linaro.org
---
 hw/arm/armsse.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index e5aeb9e485f..170dea8632d 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -84,7 +84,7 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-static Property armsse_properties[] = {
+static Property sse200_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
@@ -97,6 +97,17 @@ static Property armsse_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+static Property sse300_properties[] = {
+    DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
+    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
+    DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
+    DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
+    DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static const ARMSSEDeviceInfo iotkit_devices[] = {
     {
         .name = "timer0",
@@ -519,7 +530,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = true,
         .has_cpu_pwrctrl = false,
         .has_sse_counter = false,
-        .props = armsse_properties,
+        .props = sse200_properties,
         .devinfo = sse200_devices,
         .irq_is_common = sse200_irq_is_common,
     },
@@ -537,7 +548,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = true,
         .has_cpu_pwrctrl = true,
         .has_sse_counter = true,
-        .props = armsse_properties,
+        .props = sse300_properties,
         .devinfo = sse300_devices,
         .irq_is_common = sse300_irq_is_common,
     },
-- 
2.20.1


