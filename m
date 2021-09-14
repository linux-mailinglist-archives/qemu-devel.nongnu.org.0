Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7B40A223
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:42:06 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwWT-0006Sk-Us
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6s-0001rw-FF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:38 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6f-0007td-Ix
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:34 -0400
Received: by mail-pg1-x535.google.com with SMTP id k24so11000176pgh.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enaLGbWvNUeIQNl3JSOugT8ZMiXLFPXRZRQVmjGvuVU=;
 b=nZV4qQjcrTTgWIMOCaIlEVD4r6C/V6WH42nq8ma7kmQT926xX0ce6O8VFEC5gReLH4
 m83klnE66kgawdBAhBOMLYDvSqckrBg+Lo6TT5AVeC27bq5BztpN9XjLg5WfDLgAf+0f
 sWvKJmmzBfCZ+50xextlJqWYpW6CfsXi4+SkK97n+vmwV7xoRR4uqjfMztGZh7tPPtcN
 16IYF8F5pWlZGIgc+9aGXTUxNXx/KC/dTy/zYphJv/SVe5z15sjD7hvbVkhMPp1AAAv3
 Cz/3DV/gVFjpGdNHKkvf60rLfa/MCfGwKtA6tKLLjeaklDDEU54z6iY9ctfta1YGwyR6
 LIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enaLGbWvNUeIQNl3JSOugT8ZMiXLFPXRZRQVmjGvuVU=;
 b=B7DQ5VmiKsEr9ceDLh5SyRajl5N7VHDRiSCnfi0hcyjXopL4rrb26y99y6ezwN92Xb
 p3gcQkHqSjYlxMa9GVccklYlyD+xI4CfIaPdHQepDqvezLOK+u182rTTRPLQFTEiJYqO
 czVElx6DrAHBRKliX4qJU2ELnaL3AtHpQyqAGS6s8Q7HA3Uffk0Ed0oDVDlX0B8zsniV
 0evvnPEAGugCzV2VMx5cEUXL/pithYLja0KjOOUPYxlyztnxF/kjpJyAR2z6CV5Awyrc
 wNhpJ8rnjfRpKuj4fHhTJy+l4QvJfSzJ3bpButwtm2dWdjC1BMrAsHsuk2hHlN0A18dx
 LzSA==
X-Gm-Message-State: AOAM530wtw+7GTlrySo/15qw30ZIMLlVEixAdXuxMYYHm00KAFSfqH+c
 VLUI94OCHBGWcJg/pfP/EcVDPVlNe9UxNw==
X-Google-Smtp-Source: ABdhPJxMNHvmT1wSxmQtVeLxc54J8dRvOUJaaWV1VMSmPiIZDCmrG8Rq92daihx4Jr9IIxUBNzZrIQ==
X-Received: by 2002:a63:204a:: with SMTP id r10mr13202528pgm.365.1631578523345; 
 Mon, 13 Sep 2021 17:15:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/44] tcg/arm: Remove fallback definition of __ARM_ARCH
Date: Mon, 13 Sep 2021 17:14:47 -0700
Message-Id: <20210914001456.793490-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GCC since 4.8 provides the definition and we now require 7.5.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index d113b7f8db..18bb16c784 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -26,25 +26,6 @@
 #ifndef ARM_TCG_TARGET_H
 #define ARM_TCG_TARGET_H
 
-/* The __ARM_ARCH define is provided by gcc 4.8.  Construct it otherwise.  */
-#ifndef __ARM_ARCH
-# if defined(__ARM_ARCH_7__) || defined(__ARM_ARCH_7A__) \
-     || defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) \
-     || defined(__ARM_ARCH_7EM__)
-#  define __ARM_ARCH 7
-# elif defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) \
-       || defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__) \
-       || defined(__ARM_ARCH_6K__) || defined(__ARM_ARCH_6T2__)
-#  define __ARM_ARCH 6
-# elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5E__) \
-       || defined(__ARM_ARCH_5T__) || defined(__ARM_ARCH_5TE__) \
-       || defined(__ARM_ARCH_5TEJ__)
-#  define __ARM_ARCH 5
-# else
-#  define __ARM_ARCH 4
-# endif
-#endif
-
 extern int arm_arch;
 
 #if defined(__ARM_ARCH_5T__) \
-- 
2.25.1


