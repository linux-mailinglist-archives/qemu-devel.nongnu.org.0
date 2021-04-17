Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9336936320F
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:48:21 +0200 (CEST)
Received: from localhost ([::1]:50268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqvU-0006Yy-LO
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpd-0007yO-6v
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpa-0008DQ-5X
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id r7so17942269wrm.1
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uRd4G6zXJmrKRNM9MFZAOKSesHEb4XI8oeHJ2++RWXE=;
 b=xDM3I2PjjUlwm8ktPC4sOfMYbZleTjX5OVLylB55cWvt/x5b3Zi6QTH9OKm5NK0XcW
 71/lnD/bK3bZdeFUNPXChPqTVd/UW8jkl+9InX5BLrLy7/VDK634tBUc39gYp5X0GtId
 d0PrBI/9MiGkWXP2peoQNEW2Q6xy85+vYhhkDwIH1pfu1aMonzotb3FBduY0iIyUG1qK
 lX3oLETVMpvaK/5hRfdzGWo+6z+Woh5wJQr4EZXk/ugl7jlNgPHvdrhKtL8fhBd+pkUy
 fN9TR0aczU74UevQDMHaZ+q2iion8fnEZi0M1WL953aVFydoZ5KtmydzFS6wTRwPuL3l
 xzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uRd4G6zXJmrKRNM9MFZAOKSesHEb4XI8oeHJ2++RWXE=;
 b=mlmB6oGAan3QtDhEyTbRIuuz31yje1fPi3lGQmwI7KELjz4Q7h7cdmosZN2+2+UaBe
 Yv4rteQlS1zoPVmJDn2kC5j/bgtdIS9wPsE0GkG2lhBeVsyxPAuvAKsqW4s45ObymEBn
 xkB3QDe90/iaIarbEcR0A9GdsWkf2yGCAJ14Np75RWDMiuLDmTf586AS1pUnhptMQraA
 wiKofm8LylfuxdPJnbp4zeho++8rEJQw6bb0IhKX+GwaOGQRn1J2wuOAdbZ6u2ycaoAT
 UL6nyxXESCpftvVtKW8NHN/OmsvMxY09VNi1/4EX15MP7rCcejlpg5rLjiHkoAdPe0sv
 0d+g==
X-Gm-Message-State: AOAM532ZiLNOmE2kJAFOFDAnoD3rpgX+/NWdmolJyWmLVm3SaSzhP2kW
 x/Qy0K7rWjEpl6jX28CSSRrq37X45MlAJ/EY
X-Google-Smtp-Source: ABdhPJwqsJUKYSxAvMltak/Rh9db+hi/IxKNdLDKtOx84CrFZKKndJaqeAAzCNPeHbBuYnzQIUzbfg==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr5416745wrw.280.1618688532870; 
 Sat, 17 Apr 2021 12:42:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] accel/tcg: avoid re-translating one-shot instructions
Date: Sat, 17 Apr 2021 20:42:05 +0100
Message-Id: <20210417194205.17057-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

By definition a single instruction is capable of being an IO
instruction. This avoids a problem of triggering a cpu_io_recompile on
a non-recorded translation which then fails because it expects
tcg_tb_lookup() to succeed unconditionally. The normal use case
requires a TB to be able to resolve machine state.

The other users of tcg_tb_lookup() are able to tolerate a missing TB
if the machine state has been resolved by other means - which in the
single-shot case is always true because machine state is synced at the
start of a block.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210415162454.22056-1-alex.bennee@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ba6ab09790e..b12d0898d0a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     if (phys_pc == -1) {
         /* Generate a one-shot TB with 1 insn in it */
-        cflags = (cflags & ~CF_COUNT_MASK) | 1;
+        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
     }
 
     max_insns = cflags & CF_COUNT_MASK;
-- 
2.20.1


