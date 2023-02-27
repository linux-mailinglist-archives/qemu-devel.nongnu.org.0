Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDF86A43A2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:03:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5i-0005ft-J8; Mon, 27 Feb 2023 09:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5U-0005YE-0Z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5Q-0007ls-AY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q16so6355546wrw.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dyOSqHs1vt2kt+dP0iK9GebMvSPiNAmBiWh+egaSUqo=;
 b=xatNRMwvWjy/uGgrBVDh5KVFZjhCFNn+ojsaEin6g8dbamJ7I1qhinKPwE2GXrZGJA
 Ucadwv6mhbu95gj4xZgCPQDqfNM/u9vjzKAAv1hYY/SXuzQ7uAXWj0cgXJvGiH2UQKpQ
 LYPTltYnMCAXaINmezsyEasjy7BcKLW3MbKE9xMuESXZnjwXLcL1RF3cmYIjh0+Lo+kj
 KRdgDxYrk7zdxeNYpkJZ/Rq96z6KJW53DDU2YZI7ilTdB5+enFWMlTYZlw2EACpbQfm4
 iSmhmxaEeXGa/YEfZjFRAilkgri7nsXHe2R3wcRzS8xsX/Djn6NZEhPz6rUfMb64xd2I
 7Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyOSqHs1vt2kt+dP0iK9GebMvSPiNAmBiWh+egaSUqo=;
 b=lvI7uw+B91xhpm8V7I8Idai6e30u6wIWYtD8pWSMxUoC8a8OKYntqbu2EaWHeLUKbo
 MNeWdU8VoGYnxFeR2pWCKnAoSOKpLcFQJDo4Kbct0zrw0xJnHmZo/sT1ovRO7RnvlW6X
 F4XEJXkgR5E72+UFu8L99v8JTekFreY0SOT87dk0dQ+Sow+V50Jtc2hTxj0bJbFbsv5Q
 SQ7zohC5LzUYm12kpHcu40r+Xg6yYfQfkOmJDKPQzQLYuJ6y1URp9PQwksrw1xs9mCQE
 3FjtUGVKk2jv9a/JZjdBQQZT2qs4qAQ9uxS6on9HCGt3WwHH+rsJA1teMKVIoir7MDnD
 QeoA==
X-Gm-Message-State: AO0yUKVOW3dK/rI0grSznvgNT0O0nlVVA8QTimJaB1+EERuu/pzA8jVK
 ujNbGKO+8oSnEemWTlhShr+jS3iV3Druq+uR
X-Google-Smtp-Source: AK7set8tEr1pe0SipgN1UCJmtQ0spHBzYvLpqi7Kbb7FF+ULIRqBmMSI3l7IeCMm1DFnwWOfL7IDeA==
X-Received: by 2002:a5d:4905:0:b0:2c6:e7f6:49af with SMTP id
 x5-20020a5d4905000000b002c6e7f649afmr17919688wrq.27.1677506558758; 
 Mon, 27 Feb 2023 06:02:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a5d524b000000b002c573a6216fsm7030812wrc.37.2023.02.27.06.02.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:02:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 014/126] target/loongarch/cpu: Restrict "memory.h" header to
 sysemu
Date: Mon, 27 Feb 2023 15:00:21 +0100
Message-Id: <20230227140213.35084-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Missed in 0093b9a5ee ("target/loongarch: Adjust functions
and structure to support user-mode") while cleaning commit
f84a2aacf5 ("target/loongarch: Add LoongArch IOCSR instruction").

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221217172907.8364-4-philmd@linaro.org>
---
 target/loongarch/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 3882e970b4..d60693fafe 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -12,7 +12,9 @@
 #include "fpu/softfloat-types.h"
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
+#ifndef CONFIG_USER_ONLY
 #include "exec/memory.h"
+#endif
 #include "cpu-csr.h"
 
 #define IOCSRF_TEMP             0
-- 
2.38.1


