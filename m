Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E108700D93
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 19:03:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxWA9-0001CW-3Y; Fri, 12 May 2023 13:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA2-0001Ai-Bh
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:02:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxWA0-0002Ai-Ke
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:02:29 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f423521b10so47667635e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 10:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683910945; x=1686502945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zSeckB/DU/ftoxKs9zBa0uYqulCiNpn9zBPfGQQqV0Y=;
 b=RlOsSVfcNLRYGCxjhQmpNDzp+tByx80LezNUtv8G7omXcCeNcpgwb/ZOpAf1uqb8z5
 tuw95c+90zr5z1fZD0Ih8MA8FrZZPLl0cJKSy+mufJ++/xEgeF/m5mGlraFMhRN3+pIV
 axX8N6XvnQsxvgBJvSpGRK5FVB5iW2LcFfqHwoxSk40kTstwRV8kgD5BfNWzpwLOakyw
 lbwa0beBtrwvFNyOBdlwgQ7yNsKbJJb5XT8WUx4lFiCZfTICXvh0R3+YJsFrSKxPZUJc
 p5qm9Tbgg38Ec4u4Q8o6EjtBmI3nExk8dNZogMX3WxH6v8V04nltBVQYunTpuKbXOOCB
 gUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683910945; x=1686502945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSeckB/DU/ftoxKs9zBa0uYqulCiNpn9zBPfGQQqV0Y=;
 b=OgUl88oY09UHt3O+MVuz6ors6gnDi8ZRfWbaLfup7ib4x8FODNr94IuRCn8fQFjAfj
 pF74Kz0UisLe7IUgVcv+aa55oKFHuOReP0p2Q02sAmdaOoNVOjpzQVkqTKvv3TiqnmKI
 uVW9716/DphR8A2dgcS8ZS9CjO4eOHoSz6L76i9SPDTLPjnpBNXJ/V4NkAigD4wRTq2Z
 9gy9xftANiaHN16cRoEVAHYZbvY3l9d0dDsPvwfIHTXgr1YlGAXhXnzebisknrKF3i6X
 wdX+9JrC/tCGsc26MKC4+zf7QeK8PtEt2XAe5QLe2t8JR8GWMEHPiSs0BeuADT6u7+1H
 x+jQ==
X-Gm-Message-State: AC+VfDx6DCBTMHfMs9WO1JH2r+D3S4ZocJHf1DHXpOvrnxw9ooRyLdiO
 JpGKXQweH0MQmUXao7UOSRcZRUAkfGC6Z33OyZE=
X-Google-Smtp-Source: ACHHUZ4qpvMAzFtZB+L+bcH8QLbmX3UCP2/SeYnyIllLF7uq7WDjV+MWwBZqjbG9rmf0rpbJtok11g==
X-Received: by 2002:a05:600c:3787:b0:3f4:2bcd:5a6e with SMTP id
 o7-20020a05600c378700b003f42bcd5a6emr8770251wmr.30.1683910945703; 
 Fri, 12 May 2023 10:02:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm3521004wmg.20.2023.05.12.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 10:02:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Saturate L2CTLR_EL1 core count field rather
 than overflowing
Date: Fri, 12 May 2023 18:02:22 +0100
Message-Id: <20230512170223.3801643-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512170223.3801643-1-peter.maydell@linaro.org>
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

The IMPDEF sysreg L2CTLR_EL1 found on the Cortex-A35, A53, A57, A72
and which we (arguably dubiously) also provide in '-cpu max' has a
2 bit field for the number of processors in the cluster. On real
hardware this must be sufficient because it can only be configured
with up to 4 CPUs in the cluster. However on QEMU if the board code
does not explicitly configure the code into clusters with the right
CPU count we default to "give the value assuming that all CPUs in
the system are in a single cluster", which might be too big to fit
in the field.

Instead of just overflowing this 2-bit field, saturate to 3 (meaning
"4 CPUs", so at least we don't overwrite other fields in the register.
It's unlikely that any guest code really cares about the value in
this field; at least, if it does it probably also wants the system
to be more closely matching real hardware, i.e. not to have more
than 4 CPUs.

This issue has been present since the L2CTLR was first added in
commit 377a44ec8f2fac5b back in 2014. It was only noticed because
Coverity complains (CID 1509227) that the shift might overflow 32 bits
and inadvertently sign extend into the top half of the 64 bit value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cortex-regs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/cortex-regs.c b/target/arm/cortex-regs.c
index 17708480e75..ae817b08ddf 100644
--- a/target/arm/cortex-regs.c
+++ b/target/arm/cortex-regs.c
@@ -15,8 +15,15 @@ static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
 
-    /* Number of cores is in [25:24]; otherwise we RAZ */
-    return (cpu->core_count - 1) << 24;
+    /*
+     * Number of cores is in [25:24]; otherwise we RAZ.
+     * If the board didn't configure the CPUs into clusters,
+     * we default to "all CPUs in one cluster", which might be
+     * more than the 4 that the hardware permits and which is
+     * all you can report in this two-bit field. Saturate to
+     * 0b11 (== 4 CPUs) rather than overflowing the field.
+     */
+    return MIN(cpu->core_count - 1, 3) << 24;
 }
 
 static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
-- 
2.34.1


