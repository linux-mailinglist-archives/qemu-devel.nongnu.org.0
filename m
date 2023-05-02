Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689826F438B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:17:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoua-0003lV-I1; Tue, 02 May 2023 08:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouW-0003kT-J9
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouO-0002zw-8J
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:12 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so2255405f8f.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029702; x=1685621702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VLjSO2tP92uiS72acB9fU4Fq4iGZuuT37nE07/dO9r4=;
 b=zPQFgk6ZQGrHHQ35ZncgD1OjMCKWVE7LiruFNzSvSECkT1zMnJk0LI0Rpv7ZeNvFUB
 VX+C4IsYSNihnRtJGLGAaLbPBAaueA3XgCNaIW+bTt2X1TFEox5pvXSwPqbfQYbmxyg6
 iyN8Ilp4vpP3xEDB5mXzH/huI2zJUJIE3k+SP1YYksbC7BzJBlDMYhukhfcQEKBus8kw
 Z9ggMsTNbjkoYYn6iW7SGV/9re5Tf3ukCOkRplN2usxj+8icoRjfeFY7qIs5TCeUluj5
 6VFM2GIuqLIN8y4sV2hZt3criY8VLoXZHnQw2WzILoyUBQJfHPXq3b9qEWZOnBGjxILo
 DC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029702; x=1685621702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLjSO2tP92uiS72acB9fU4Fq4iGZuuT37nE07/dO9r4=;
 b=esaFW6hAl67DN5iz8T67uWFkWMowGgIRJIvBCbvUVDCdeqLfDPRZUf0UYWeTD+PAZm
 /ux5FZvIjX363EJRx20C+W5gGMGLROTg9r9/B2RMWNjrP/IEHIfuQdSUqRuoAMSbxrJx
 hfJyBrjUTovtYvbYWYF5SAXzX78zfnK2t+q9zAx8c6FfQaVGYNNsEJyZfO6uBYh6QAdj
 pyiFx98MnQqNnUOW3wYUnbAoJDAF9DDBWNuJlA9KaH8TlVPiqJqAGLnsZNBy24Cz28A9
 MIpZpPErm/hV4uQho0Fvem1uNVC31Ofi2+UH7cKv6ZvbuVQXe9lhQA9RjYQORpIZw3D4
 8idA==
X-Gm-Message-State: AC+VfDy4ADKgW8sqcR7I4adZUafHP81yQn9sydtn6R0F74lAEYNnKEqz
 ucfFE99uZxg+A4YS02TjaM1Xp0+JQEZVAYL3nfg=
X-Google-Smtp-Source: ACHHUZ6OQVee+u7clVBdlgaVhYbwQoBrIuYR9dPYA+2/Gje1rp31oiWRDmLB6564q94nGDcjUEMHkA==
X-Received: by 2002:adf:ed03:0:b0:2ff:321c:dc8c with SMTP id
 a3-20020adfed03000000b002ff321cdc8cmr11210823wro.63.1683029702531; 
 Tue, 02 May 2023 05:15:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/35] target/arm: Extract TCG -cpu max code into a function
Date: Tue,  2 May 2023 13:14:27 +0100
Message-Id: <20230502121459.2422303-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Fabiano Rosas <farosas@suse.de>

Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
-cpu max configuration. We'll need that to be able to restrict this
code to a TCG-only config in the next patches.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-id: 20230426180013.14814-4-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fb5e1b69db4..e9161522b8f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1178,27 +1178,17 @@ static void aarch64_host_initfn(Object *obj)
 #endif
 }
 
-/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
- * otherwise, a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
  * this only needs to handle 64 bits.
  */
-static void aarch64_max_initfn(Object *obj)
+static void aarch64_max_tcg_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
     uint32_t u;
 
-    if (kvm_enabled() || hvf_enabled()) {
-        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
-        aarch64_host_initfn(obj);
-        return;
-    }
-
-    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-
-    aarch64_a57_initfn(obj);
-
     /*
      * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
      * one and try to apply errata workarounds or use impdef features we
@@ -1367,6 +1357,20 @@ static void aarch64_max_initfn(Object *obj)
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
+static void aarch64_max_initfn(Object *obj)
+{
+    if (kvm_enabled() || hvf_enabled()) {
+        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
+        aarch64_host_initfn(obj);
+        return;
+    }
+
+    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
+
+    aarch64_a57_initfn(obj);
+    aarch64_max_tcg_initfn(obj);
+}
+
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
-- 
2.34.1


