Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCEC50A4DC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:58:44 +0200 (CEST)
Received: from localhost ([::1]:40362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZCd-0006vw-SR
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd1-0005R4-30
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:34706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcx-00077Q-AK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:52 -0400
Received: by mail-il1-x133.google.com with SMTP id r11so3269099ila.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7BYWPqh7sPffzPeApLBqryy8kqd21hiyG0fC6JPYfUo=;
 b=umyF8GDEB2+BwFRj7VtwDRWyXt4XCh3ieUfk3MNqTUomPfuasi+oSuLOv5LJWDTHjq
 ZJfQxzq52tHYhbDxLFRcFkV6GY4HgeiqBsvUSSj22SQ/6XwdslsAL216LPkJixFrBucp
 dIUDhvFMblGN8PtAzfY3TkJ+xxBqEyKm/XeRI7iq7LX6ttwHgPm1PkhYrY9FyZUDJJjm
 yGzL5Wlj0doCJQ3UHmO9/B6gdhIWiaG/0TgWP9+rbbs4hI1N4GEpN52DZBZTH25vPBnh
 1P5QI0IJhUJ1/INR9VtPcyrdkD7jdKaRbpntdbZmTXTfdzCV3JtFUAP9j9TB9WbpGmJz
 kBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7BYWPqh7sPffzPeApLBqryy8kqd21hiyG0fC6JPYfUo=;
 b=1QjfzdkgCMkZWfSbfOusgNyZMRdyZScZg92Yjl6AXKFPgo68PfdJfViRXEscvMYSSK
 /WuuPyFbwDyOan6lbSvEiPRKkpn/1RdMUmyDM5TZA9xL/ow0LCkwP/G9pakZqEm9LjxV
 q6scNVy6wRrrgsCK3B6AnqsF2umu+9/l5XCRQt4gC25pziLp525nMFWYMA2eXfXBuXzn
 ynhUL5N4SZy4XoCRyYYLTZXTAzN+uaoXLiEPd2NKthUdFxkNWk0HhjtD/6J8WQ8gQozw
 3mvYyox9DvRLhxAlhvvi6R3Y7VXGkmTO05sGqRWzJgdRUWBgrlrQ/cJkL2OLYlsicso0
 sI8g==
X-Gm-Message-State: AOAM531j934VE/oigogRH+33IW8Rw13kNbHjswSY4dGpFqcvscnwDUKL
 B24K3iGfO6wgb0mb2jhrw8X1mQFDOV8JVQ==
X-Google-Smtp-Source: ABdhPJy9YvWaQ6nviq2496RXbOwjRw4Ps+MlwbJ7SpiNOiBOhfbmRmqYyirulbfx1CWINir3Q8pIeg==
X-Received: by 2002:a92:ce05:0:b0:2cd:6e4b:e456 with SMTP id
 b5-20020a92ce05000000b002cd6e4be456mr17329ilo.7.1650554510225; 
 Thu, 21 Apr 2022 08:21:50 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 47/64] target/nios2: Enable unaligned traps for system mode
Date: Thu, 21 Apr 2022 08:17:18 -0700
Message-Id: <20220421151735.31996-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x133.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unaligned traps are optional, but required with an mmu.
Turn them on always, because the fallback behaviour undefined.

Enable alignment checks in the config file.
Unwind the guest pc properly from do_unaligned_access.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/nios2-softmmu.mak | 1 +
 target/nios2/helper.c             | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 9a372f0717..1e93b54cd1 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1 +1,2 @@
 TARGET_ARCH=nios2
+TARGET_ALIGNED_ONLY=y
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index c5a2dd65b1..2e9fea4a01 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -241,8 +241,8 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
-    helper_raise_exception(env, EXCP_UNALIGN);
+    cs->exception_index = EXCP_UNALIGN;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.34.1


