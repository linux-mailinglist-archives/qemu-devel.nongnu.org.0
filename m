Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA272C04C6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:44:52 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAH4-0005zJ-G1
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFh-0004Dx-LS
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFc-0002eQ-Ae
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:25 -0500
Received: by mail-wr1-x441.google.com with SMTP id z7so2449585wrn.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=60shXaWLqPtiw2PDg/2z7RXNgbXvTsuPrfA/VmL6lhA=;
 b=I7CbLDZ+B4mrKiI8Ld3AAJhjqj5NS3nX4HomQd3RUZkcqbpYuqwHPJtVdVcyzKT3K9
 w+jXIkE4QmeFM6YgrXhkKRMnwkL4C08QGt5OUgSFD+wc52SRT1vXl6s9zIOqI2sqEPP/
 jzjOJFBezn4hPC1uxuLc0Ux2SJpv6CZrPnn4/ZqTTEF9A7dpYfm7qgn2LPwVAK/KjEXK
 khamHwqX9Hr/dvbo5xNHwlI7Xz69j3hSVjQvNNjetpfDiCmXgI1/NbNvTA0T/lwZJ4+v
 HDEtfAzphXvVRFLPEGnXVXy7jvKV5AUKRjjoBcAhvPL6Cb4jcOG/teJv7VUol6L9cjET
 rn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60shXaWLqPtiw2PDg/2z7RXNgbXvTsuPrfA/VmL6lhA=;
 b=TDIEbWRlDS5r6AW3nqF3BDWSLcwLUgE3I/YZRd6pVfw1ZBcaQ+C/+cYfEMyR8pX3o8
 WCzLtMOIF1Jglx0Q/48L/xB5w1E4REq1EOSOt9pGHXzfBEoutv1CCH/dGUxL06cvCvDR
 tEZBDdRhFaF+lZUs0Ztn0Cv2WYG9foUJIcH67ldgL7er4U9D3v/PSHRSyJWrBdXe+NPQ
 EzFM6yxxPSJMCpBVuKMu+wgf6O6NttlWqcZv8wbbkbNtO3vofuLyvNLc0Rd7EyidnU3W
 3IbBv1uopIxK9WDSRLF3qMVhPLOW6BrseHvb06HwTVpiIZj+kfA1Sfjl0wUTJKrMTA9v
 MlxQ==
X-Gm-Message-State: AOAM533JMFliHxu6i/ES9sOQkwO4uvGeIDiwZ3KG7miX85Qphk8Lv/VH
 LReigUZZOTS8YxPp0PcK/LA8n7nTEJjtZQ==
X-Google-Smtp-Source: ABdhPJz8LDSwXpEzj2g8vlsxwflishAiyFebFLJf5Vqhz7lvXCXOPK9bTRhPkPI+ka+dPIKSLfL0Sg==
X-Received: by 2002:adf:de12:: with SMTP id b18mr31383111wrm.187.1606131798672; 
 Mon, 23 Nov 2020 03:43:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] target/arm: fix stage 2 page-walks in 32-bit emulation
Date: Mon, 23 Nov 2020 11:42:52 +0000
Message-Id: <20201123114315.13372-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Using a target unsigned long would limit the Input Address to a LPAE
page-walk to 32 bits on AArch32 and 64 bits on AArch64. This is okay
for stage 1 or on AArch64, but it is insufficient for stage 2 on
AArch32. In that later case, the Input Address can have up to 40 bits.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201118150414.18360-1-remi@remlab.net
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11b0803df72..38cd35c0492 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -40,7 +40,7 @@
 
 #ifndef CONFIG_USER_ONLY
 
-static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
@@ -10988,7 +10988,7 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
  * @fi: set to fault info if the translation fails
  * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
-static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
+static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
-- 
2.20.1


