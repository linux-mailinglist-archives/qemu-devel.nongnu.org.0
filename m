Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7142F346199
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:37:27 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi9u-0001yV-6M
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOi00-0006Za-Ee
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzq-0007Bs-Ma
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z2so20995611wrl.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=040Av6eKFFO8DY7RlEdIpWKnOUZEmCANS3COgK9hh4Y=;
 b=gIL5o7Vf/LBG9a/6NzcNDX2YbQrKuySVagISYCn+KV5KNBLEluyouRTpEw3oLFAxF4
 RFASvFYG9jbEgNtlWHCRn0lGI25LMlrvo1SyFWh7CZtJPxy3jgWNBkr5goF8FEcDmDBe
 F8bJdkdbv2jH92Cccm0M49ahumcKKHQOtK51f6WXI871u6Ousa5RbsC978uW7hQrZPyR
 HckHfvslR+q0OY2i04BUirNvaAri7XKPLQjCJfj5rs+MQ/6XqysU4PINGExk0bkcdouQ
 yVbqRyHtR9DnT4Ga0zjuMJeKDbcZdoKXB++cFNNCbpp+gy/A7z45DN5VHWU/MkWGDx2H
 J07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=040Av6eKFFO8DY7RlEdIpWKnOUZEmCANS3COgK9hh4Y=;
 b=F9na5XJFCwVjJW7/1aC8aVC4rFxGyFrWgGVdFxDCpBXc2VRE2P85p0HqwMEBBzQCLb
 v2AWvhube8+b00JK73T9AQ48H23+8WkQmtsWQfANplxPG9W7jndjVmKnUke9pjKokKmG
 ISb3lRbXbJWnBAmkqKZULpG6Mj6EWLVZL9NvWiawZPDQ33S9POtuRaj+SLPxnf6ootWi
 toMNAiqLIR9Wg1dxsAgZ0ZcvKOL7RVoRoEKK/dCoblAaAvDqtGnru4ATOdqpx0W0uMzp
 M+eAQUuAqmH3wSGl6XdYbhdfPMjcsNfSQL4UKaTq/zCiC/5ysHGIhOtyMH/oEvZUFD0+
 y61Q==
X-Gm-Message-State: AOAM531MyY4J19MlsVxMd0iDmAEEvEaRX8CN1iQ+TUXmuq3hl7Vj1qm2
 L3Zbg/5OSf4VGXeVBSfEPE92hyqRdqPgduOb
X-Google-Smtp-Source: ABdhPJyd3RjAlSawSKzwz/L6zdLjeH/ExLij+P87sI9mpLHtZpE8rL4k6pmASGeb8btajDLj9EBaBA==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr4350216wrp.345.1616509620404; 
 Tue, 23 Mar 2021 07:27:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a131sm2861292wmc.48.2021.03.23.07.26.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:27:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] target/arm: Set ARMMMUFaultInfo.level in user-only
 arm_cpu_tlb_fill
Date: Tue, 23 Mar 2021 14:26:53 +0000
Message-Id: <20210323142653.3538-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323142653.3538-1-peter.maydell@linaro.org>
References: <20210323142653.3538-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Pretend the fault always happens at page table level 3.

Failure to set this leaves level = 0, which is impossible for
ARMFault_Permission, and produces an invalid syndrome, which
reaches g_assert_not_reached in cpu_loop.

Fixes: 8db94ab4e5db ("linux-user/aarch64: Pass syndrome to EXC_*_ABORT")
Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210320000606.1788699-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tlb_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 9609333cbdf..3107f9823ef 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -163,6 +163,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         fi.type = ARMFault_Translation;
     }
+    fi.level = 3;
 
     /* now we have a real cpu fault */
     cpu_restore_state(cs, retaddr, true);
-- 
2.20.1


