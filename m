Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72636F8AB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:49:22 +0200 (CEST)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQi1-0007lJ-7g
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU5-0007cH-FI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU3-0001Iy-LU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:57 -0400
Received: by mail-wm1-x32c.google.com with SMTP id k128so37547622wmk.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vz1LJCMv6JjuUN7yQ6ggOJnEC1TZC23JtEoNMy6u2go=;
 b=QE/iKHeo9GII4WN7i8C1a4toSu7n8MEWqX79Q5yVMKSeaYz6qZz3DJQwMR5J3YBUrt
 uiC/PLbZoJt0T4+FfGkOdOL+DBLg5aGwGE/knMW45gx2sTR3DDX5RmVpMVwJsDhJ+8QM
 plwQCf0GRBaCqDPjHC02bDFQqxk3OAbtYgiYSbRJ6CVRlUyKQGlxC568pFqDIc2Q+fge
 +uQKQKWKESN7FnLafLtkT+YPCh5TASV0Airyckm0EjFL4VlaQpY9G7Bt2TDRw8MO6w8e
 Wp/VWaHkPn2J6dTaSD1x7Tuo2Hmi27u3Kp9p1Fo4Wkd3qH8iU7ySuHvDVATAekzNok2u
 R5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vz1LJCMv6JjuUN7yQ6ggOJnEC1TZC23JtEoNMy6u2go=;
 b=fZqyp4Krun6WLP6Li3KpiO8b+wKPUiXNJGiDRs/7HSLe6w3pbs9EKTxwlGoWJcohBR
 vVo3VX4zKkrBwRrwhoym781Su/wkO6fFqLMUe3dmUd52h0rTYqXCOCSZLo4AS7/dQJJ5
 dpkPTMDfb6/H9/GlAUlHnwB6c9/PckZ8B24QuxMdrIVkozZZsIBd1E/K+g5b/Bq6FiAl
 odrapd58WzabShSYxNFN86LsyP/zzmScbRvaV3RcFZHLtHvNICPc8joFmDM3eHg2LeQy
 KtgX04wiewtE/z1WRg3c8kLjBdX9p8Cmj4plALq8PhWyLGuijw4vKtk8we4BE4MuIkKa
 vsCg==
X-Gm-Message-State: AOAM530iRQmDRGRUZROx3QY4cer18h0timiu6KUluECHUfNhJC+2z+/3
 nbUHVtHXMVGq1QS8Fvoo0PcjYuKl2FcB5BgW
X-Google-Smtp-Source: ABdhPJx7tRfwKSBnLejf+FJtpHJDoi6o04/6YUUK6lE5Ux7+k+GhxuAIXwF+iskwIAjgF+md/T9unw==
X-Received: by 2002:a1c:540b:: with SMTP id i11mr15937312wmb.40.1619778894001; 
 Fri, 30 Apr 2021 03:34:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/43] target/arm: Move TBFLAG_ANY bits to the bottom
Date: Fri, 30 Apr 2021 11:34:13 +0100
Message-Id: <20210430103437.4140-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Now that other bits have been moved out of tb->flags,
there's no point in filling from the top.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 15104e14409..5e0131be1a2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3405,15 +3405,15 @@ typedef ARMCPU ArchCPU;
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
-FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
-FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
-FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
-FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
+FIELD(TBFLAG_ANY, AARCH64_STATE, 0, 1)
+FIELD(TBFLAG_ANY, SS_ACTIVE, 1, 1)
+FIELD(TBFLAG_ANY, PSTATE__SS, 2, 1)      /* Not cached. */
+FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
+FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 /* Target EL if we take a floating-point-disabled exception */
-FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
+FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* For A-profile only, target EL for debug exceptions.  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
+FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
-- 
2.20.1


