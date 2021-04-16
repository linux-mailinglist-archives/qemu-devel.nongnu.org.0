Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD099362847
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:07:38 +0200 (CEST)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXToX-0002TZ-VN
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThc-0003Ty-Pb
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:28 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThK-0004HZ-Rj
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j21-20020a17090ae615b02901505b998b45so1587728pjy.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4Ye/q/NQMpivvWde1aRm1kTY6gKWaOpl13EHd3UchY=;
 b=eGtD80B8SK/We0er8fyLcUX+80k4fRcPW5KyDxgoy6/UtBfHUcCuJqqyhq+pDOFzi6
 NtuKh0R+dfzaQYm8LrT34QtVrVITxW5TiyPQ2Kp9kv5hbvN5hTSBQDcTRD0AqSmyUo+T
 Eg0/UIrifYor0ubm5kya0auCbZ9MjS8nGBXEa26CfKRYNqxF+8UVZg70LwxjNPil1eh2
 lGexOP/8biV9sYqGDkn2Bnem1F5kb01U3dLsCu6di/49V5D85vjraapvrO3PjrFjYWDA
 DuJ0uKahxL006xcnN5ZcdtPXNdRxjUHhriNvs6jzDHF66BKtvDI+pAgoxXQVb94YV2Cg
 W9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4Ye/q/NQMpivvWde1aRm1kTY6gKWaOpl13EHd3UchY=;
 b=PIs541IsWvFRbvCPfcukmQFGt0lNwROnkQy/frwrkACajJBW5k8XLcFF5eLLuQglov
 xrKj7D7ukLVGpbKyD7N6QtWbdQ2RbX3GpStw2HjKYCjOfLgKlH5Fq4yKeViQm3ffh7yl
 Nac31jymSlL0g7dY52DP7T16ug413eazGftL3RZxWDHxo5oJBnHTjtcbOqRw7cd1cIZ0
 3nh9c+vwPEp5I/eJCoEGoTDiPzCoMxHLBix/+MB2ZW8Z9phxBiXRc/2QzSANJ4dXgiFD
 wsS9CzicrsWAvVS1f5lSV4oBO+5fBl+X+f/APcjlTgNlI6KLuk8ZsKfXfos83/P5/NML
 Tv6Q==
X-Gm-Message-State: AOAM532xb1I9pbQz5dQQHamJM8Hyn6tUljkmS3FFpldiDSa7I/WNKvyR
 PakP6ZC4Ja8fV+z/nGWPYrp6VK+tbyUpHg==
X-Google-Smtp-Source: ABdhPJytNY/fEgnzrR5y1yAA4+SFAN4Q6afTYcN5ib1WGBieRGzNfFEvlPkEWHYDvJwK3KLxwbx/3Q==
X-Received: by 2002:a17:90a:9503:: with SMTP id
 t3mr10141909pjo.220.1618599608167; 
 Fri, 16 Apr 2021 12:00:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/30] target/arm: Move TBFLAG_ANY bits to the bottom
Date: Fri, 16 Apr 2021 11:59:37 -0700
Message-Id: <20210416185959.1520974-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that other bits have been moved out of tb->flags,
there's no point in filling from the top.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 15104e1440..5e0131be1a 100644
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
2.25.1


