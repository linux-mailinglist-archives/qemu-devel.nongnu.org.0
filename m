Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D5C30E315
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:09:16 +0100 (CET)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NWd-0004J6-Kd
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOQ-0007LD-FX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:47 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOI-0001ZC-SB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:46 -0500
Received: by mail-pj1-x102d.google.com with SMTP id e9so248904pjj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=cfs6F6dclOVA/7vKUzDqj1TRDzL9GxXsIHtiF+nvq2eWW6urRS94RYJdI0Gu2K3cri
 l0rk0tHbgeCxohxe64LJxh4FNjoTT1VUsybdQVIi/cM2lbiPXdwwb+JYTu3La8xx0XGe
 YRrMhLWWRK4GwuTXqaouOrccUh7PFRqSkSeO1t0REHNb3Jh+yvYBwYqfpOhILkqgvlTt
 NWLmyx0wzabhXqDfpdx8KQ8j1We89OxFODyx0ZaWajcK5ELRRHcU64uuAa64TTkyRIMh
 lwLcBZ48NYALbWx9ogFsoY1AaLMdkk+vVfSv4Pj9LV5Ft7UlsqyYNKKYMjBqxDgoY90W
 hklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=lnbhLTeIDq47lX66trFp6TnMOXEPZe/8nPTvxHtZahd/QUZNSo45XYKHHboRGQABHF
 EmIYb0gI65zmC1SLkBYt7cBGLM118/yUt0AKAxHYNr8/l5oQs2ack/J3D7hOnCR64Lzy
 LPBPB5V6LNB3F6c8jeDwzniuSm4JJWCExQkJRLkGx6pGWk8tYIMvd9zxYsqMTS3lICba
 YBnLxkMaB8iA8k6thQUiCrE4oP/SDAXo3PifpLYXLGOoJYpmewi9xlXan0fTgOxLaB5K
 2xuv/hWxyUXg1NwYdR3pvRk2L3wXhkqL5CMNn+BtvU6CJ2Gw0s8IwuW+jRNdaSHJpBvf
 qAzg==
X-Gm-Message-State: AOAM531z/n/wiUrtmIgVge1c8sTpXmvEsZ4ipuJo91HqeqTFJpeciTBO
 zSKotaIJwxgwWzR0WRvbeSULqs94ltlnYlVn
X-Google-Smtp-Source: ABdhPJxeIUTtCe+VUmgTmQm6UhvBMdrMYgKwxw/hK4LMnmgNPePHr+tw448yxWjBkBwIYkOTLUZbZQ==
X-Received: by 2002:a17:90a:4088:: with SMTP id
 l8mr4490214pjg.106.1612378835122; 
 Wed, 03 Feb 2021 11:00:35 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/31] linux-user: Fix guest_addr_valid vs reserved_va
Date: Wed,  3 Feb 2021 08:59:49 -1000
Message-Id: <20210203190010.759771-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
use -R <reserved_va> to restrict the memory address of the guest.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 4e6ef3d542..e62f4fba00 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
-#define guest_addr_valid(x) (1)
-#else
-#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
-#endif
+static inline bool guest_addr_valid(abi_ulong x)
+{
+    return x <= GUEST_ADDR_MAX;
+}
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-- 
2.25.1


