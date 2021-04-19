Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1FF364B29
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:33:15 +0200 (CEST)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaa2-00084R-4y
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQT-00078y-34
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:21 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQR-0002Vc-8Y
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:20 -0400
Received: by mail-qt1-x82a.google.com with SMTP id 18so13706091qtz.6
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=87tkM79RXw2jAAFt1MoYIFV/bLOV6oXFWJrSZPGm2LM=;
 b=edXaEMdnEfrQiDIGGFkCDj6B/uOHLXyjh3cn+94Puev9fJjPnsexowWGeHTX98T1jz
 6/L+jVl3BRQFKmN2azuG+hs3sRYWfjQiTW2SQUWyd/bdWp7zjhKUvSEtVwudfZXyRHMJ
 /qjg2udccDL054YRjoMUI3O/Gaf38Y/l7IsiVih6wUyy631Umx4Ku28Ptx9wGsbb93Mj
 U0Ban8frjBkf8Qz9L2V1xGwJCuv5qaj0tkL3EM432L4OWr9bwmLtPKWycYcRnDuME0t0
 mNdEMnaege+GWO1BWWffhliY3bfghY9K2w0nVlCdfy2kS7V+r5GxnuhchexFkbfJ98nu
 fsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87tkM79RXw2jAAFt1MoYIFV/bLOV6oXFWJrSZPGm2LM=;
 b=I0pTT30i/5z4i1oLls8iVRRd6+9wLfiBHpiE7SGmDAaWfT1WhVc+XvUBruLQu4CoXt
 Gd8ndQX/ajdgW5zaX/ubsX+BlHGXV3ZRnazmGghfzMUr0wKTWPxvajsOWnwn/tsgEcDe
 UUlS+BZ/+ldZZxLYTflZWULbEmJ0Nv4VmB5HZ/LGquBsQekyCdNuPnyVNHsRFwnCgOkz
 1umLb/lYnmtZGlq7WAoIz3Etty0geG8kXVT+/t9sGYR5kgH/NP+HIFO6GP+9iNtvYjjH
 aFHL1MBbhViUklNMl3/9DmNRwO0JvT70LLkLyNW5TNXXDJzNKy0iWnqFyiQ72PmpSanj
 e/gA==
X-Gm-Message-State: AOAM5301FEq1OvZRVBRfBFgz0p8g84O7nS/j/dofOMliPz3CmzNWggn7
 neXxVV1qglTAbUwiEx0fGGR2DfEO7nqVkcHZ
X-Google-Smtp-Source: ABdhPJy/83fuubaP3AuLLwvnUEv7jwfsoauGAdxA08N/yWTjWypZTXqwTir0wSBL009lBpTG83XJag==
X-Received: by 2002:a05:622a:148f:: with SMTP id
 t15mr13760684qtx.191.1618863798329; 
 Mon, 19 Apr 2021 13:23:18 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/31] target/arm: Move TBFLAG_ANY bits to the bottom
Date: Mon, 19 Apr 2021 13:22:35 -0700
Message-Id: <20210419202257.161730-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that other bits have been moved out of tb->flags,
there's no point in filling from the top.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


