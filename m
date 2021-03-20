Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45203342949
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 01:08:19 +0100 (CET)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNPA9-0001rC-U1
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 20:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNP8C-0001Im-Oa
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 20:06:16 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNP88-0007Y1-0f
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 20:06:16 -0400
Received: by mail-oi1-x22a.google.com with SMTP id l79so6592331oib.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 17:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=50D/9t9mW9UHwUGC/sHHaB7xF9nAx1NkJISt8YSPxJs=;
 b=zyEPRp0pisRS6EH80TkrjGT1bVL6QRFo5XEp4th3BPHuelE4MoK8sLDNYhlp5SKznP
 Yp0xRERT8QloMU1h3uIAxOlN9Fc6WROxX8RGNsJ+4BOl78ka+wMSb2iMLLUQ3Y7NIRSD
 bcYpQcF6gBXeWc+nrNQQx5pm3wJobNmaYOGvG8ygqxgJpGfsW6iaC98+9LxvoMec83f8
 M12cRm8C5XRx2AQDJwgu74C9JUeatOiUiIL+8xmdP08qyyxNUL5WZh0SF23wJAgxo+F8
 XRwWmzoa3q8ALAIOvn16UxXBEHcMFpIvElkoS4IEpIfXZe32vwDTWzqaibaCljDSZWoP
 eDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=50D/9t9mW9UHwUGC/sHHaB7xF9nAx1NkJISt8YSPxJs=;
 b=AyIRc8UR3mOYAGEQUO76jVp1h30B0y80PldlVTWHR1CSUYOht/CXFbOEwOX70vHurM
 XRI7vxgyN54eSl9gc+ILyDOiCRm8BxAQgAShAc46BRUYg5DW53c+b8v2z/aYxDt4o4J6
 VjmNjLkQbwZFqEt4oJ7hALisekP+WE+HKfOVk4+q7GmYdoa1bdbKn/aojAmdouQweM2h
 PffQNaccb55L9VL54YjgZ+z+u/XU7FvJjdTWNOno7k62DotKdyQw1n+gaxDScnmqtCG3
 40E2+s/ef9PVS70C4/91RRVoNtqV+dlYKfKT28aCa8Lsr/40rQ+yzjq3A7M8+VJsDybl
 Wl2g==
X-Gm-Message-State: AOAM530Z05g/2rfUr/Uj7sZ7ouUa0VyW9xLD8Ez92fG9Ggo9xX2uEjkQ
 ffi7oAVwxM0+Y9lT9iliq7C32nCGFQCJ5/yS
X-Google-Smtp-Source: ABdhPJxHSo9iszYzgntgaA+V7ftmsWQHL3ZQ/PcE3jcYqreI8vzur+WkuWKQNJ8TDRfh58rbvsgq3w==
X-Received: by 2002:aca:4c52:: with SMTP id z79mr2783411oia.125.1616198769606; 
 Fri, 19 Mar 2021 17:06:09 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k24sm1609953oic.51.2021.03.19.17.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 17:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0] target/arm: Set ARMMMUFaultInfo.level in user-only
 arm_cpu_tlb_fill
Date: Fri, 19 Mar 2021 18:06:06 -0600
Message-Id: <20210320000606.1788699-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: peter.maydell@linaro.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pretend the fault always happens at page table level 3.

Failure to set this leaves level = 0, which is impossible for
ARMFault_Permission, and produces an invalid syndrome, which
reaches g_assert_not_reached in cpu_loop.

Fixes: 8db94ab4e5db ("linux-user/aarch64: Pass syndrome to EXC_*_ABORT")
Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tlb_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 9609333cbd..3107f9823e 100644
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
2.25.1


