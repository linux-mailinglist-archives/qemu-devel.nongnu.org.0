Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9102B649C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:50:33 +0100 (CET)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1NQ-0005Aa-Eb
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lg-0003QF-Q7
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:44 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Le-0001vd-IK
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 10so3326986wml.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qbgmkx0Ds80yl68jLC3K3LY6B17L2yWeDQHhhL2KqDw=;
 b=MmWcWEHcvtQyDG1TbUVoijLny4rpz8kjpI/xxkx1EKQUsI2gPQ2Qml7kvcmOMN9ASc
 MuG1dQHmYCcJ0LD0f9zEc/0WdmA0Nxljww56tGoiDIXhmctje9IedgGugqQPhyEtWg+/
 xeCqsKW3eBKSiE+BjkkaiACmc9MKtFN1EDa4Svo8LlEywKZMkS5NDrIR3TdBY+cIAnQW
 KqkAluzffan82OzQaggXfjOFG9ioCZKV78dSBfAQ3ElLN9HPsXlmKgphm4aiEIMl3QNJ
 wrVE5P0N0Yj3pHl1yLnhqYXNASdF6jfNfpif5TVarLPFFQ6bBWKK6DwQDt8m1wkIToWY
 v1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbgmkx0Ds80yl68jLC3K3LY6B17L2yWeDQHhhL2KqDw=;
 b=VpK0SYZMG4EUZI6oboMr0GrliWodR2hFgKjDtOMfKzLqHztIhBE7zNaguqoSyGfna2
 1YZWX5QMGLGn6weCsIgaU8JEVVH8vWqeS2UhW4bKrpWJhKEui6i+jwNnXzZONrmzVPLU
 8bukdcwW3pbLj/aYgpQvjiRGihwttoPoJHTiGxIM1OC/qmMgIf4w29RfEqNg0BbZzOv7
 47z0Wn6MzdZttNZ0p9F9r1xgRQeouCBP5v6EdUXqQqTCgz58T5Y+w25hNpbcMNUzXi8E
 frjkRYaaNoG+tNxgpGl/2Om6N3IriazGykt/QUJqoYrPMM3dWDI4Md6XCLZcCeSvLuj8
 dicA==
X-Gm-Message-State: AOAM532BrUiRjJQsMS+BouMmzgDKZa89KOuLJGy0Jgil33/DKuGcDmjL
 R5JdyMfy54AydvKiJa7Vsnupqmdc/GPBYQ==
X-Google-Smtp-Source: ABdhPJx+qjWiWZqAhRWa+ibZDFE5DUWnVkfacAFJFoT0CDHAJSBMEQeMX3etQhK6HxtEoZnVpvFxig==
X-Received: by 2002:a7b:ce0c:: with SMTP id m12mr4309136wmc.114.1605620920953; 
 Tue, 17 Nov 2020 05:48:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] target/openrisc: Remove dead code attempting to check "is
 timer disabled"
Date: Tue, 17 Nov 2020 13:48:29 +0000
Message-Id: <20201117134834.31731-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

In the mtspr helper we attempt to check for "is the timer disabled"
with "if (env->ttmr & TIMER_NONE)".  This is wrong because TIMER_NONE
is zero and the condition is always false (Coverity complains about
the dead code.)

The correct check would be to test whether the TTMR_M field in the
register is equal to TIMER_NONE instead.  However, the
cpu_openrisc_timer_update() function checks whether the timer is
enabled (it looks at cpu->env.is_counting, which is set to 0 via
cpu_openrisc_count_stop() when the TTMR_M field is set to
TIMER_NONE), so there's no need to check for "timer disabled" in the
target/openrisc code.  Instead, simply remove the dead code.

Fixes: Coverity CID 1005812
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Stafford Horne <shorne@gmail.com>
Message-id: 20201103114654.18540-1-peter.maydell@linaro.org
---
 target/openrisc/sys_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index d9fe6c59489..41390d046f6 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -176,9 +176,6 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
 
     case TO_SPR(10, 1): /* TTCR */
         cpu_openrisc_count_set(cpu, rb);
-        if (env->ttmr & TIMER_NONE) {
-            return;
-        }
         cpu_openrisc_timer_update(cpu);
         break;
 #endif
-- 
2.20.1


