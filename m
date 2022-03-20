Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA04E1C7D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:09:03 +0100 (CET)
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVy73-0005m5-Tn
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:09:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyi-0005Ku-1E
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:27 -0400
Received: from [2607:f8b0:4864:20::636] (port=41781
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxye-000664-Cy
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:23 -0400
Received: by mail-pl1-x636.google.com with SMTP id j13so901464plj.8
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1T8UqtoVKD4QHw3Ob4yOhcSZMQMSY9kekR+Tew5Lo84=;
 b=q9iBdsM4EkbRro7Ic5JxuoOFhU41ia3MxslqdAMcbe6uJVTW2P1nMtP8Lb8aOIHfZV
 xHh/sj6qm/EqqigIp8kfFUQuKN4IBN1qbU2lFyXnXi4YgddSPGKrWzY95Tlc+xkqZNgm
 I1GckOyZ2VwJ48uPa1uglBYV8YYn6wCSDhwR4JCkkG9g3MebXaf3tK6jUmSjwun346dh
 mZ0Z7a8rLPWz8yvh9tQReKcSYdRo0w/0C5rL43LVoH73O45g5jPE7u5iFgTXdS918HzF
 s1EBusfaR60U+dv0+Xq+q/4Bg6bIzjO2Ivl3tytiREquz39Ho5iJeh8WqKKGzTGiRA9l
 Dxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1T8UqtoVKD4QHw3Ob4yOhcSZMQMSY9kekR+Tew5Lo84=;
 b=jQR0OszJorXxrHEcP+kDRK/SYC9rLUNQMHeDBKH1SVHPaz4Bwbs+PVgKCLUlXPiVkI
 PJf4C/RX4VHnQtnzZ58TH29FD9+6ZPrGHWhwv9CfibKTp9JA4MtJ2eIMD+eRtOmd4HUt
 x/Fz+7aYyWGdZu1pHgZYscvyuJoF7fwuhIHauptnIqyqNLaeN+/2UB/eI8kqcVZiEAIA
 l7ur3vjb5/rNI1S4OO3KaKr3fm+9HwPdTuwv0O2QnHD1q/w0J28ULbJdcFUhirPgELcd
 kdFzxcOMNCV+wKphKd9i78ozIEUAj/OpXfYZrKjLAQ6s7Ck4tpKrf3v9bUTuaR2tlcd5
 qfWg==
X-Gm-Message-State: AOAM530SSQp/B2CANLk2J6heO2IyTkcDovfjIweoPnKRQrcCZcx/z3c+
 JT2/17FTWLAwBNa9JokuJLxJFDfVe2K8gQ==
X-Google-Smtp-Source: ABdhPJw2wwE6sDc36fmS+h/0yO3YbiweZcFgkQtzEmPDb2N0RD38LT5zVTT/+rBgP5eCPRfP0du0kQ==
X-Received: by 2002:a17:90a:1197:b0:1bf:65ff:f542 with SMTP id
 e23-20020a17090a119700b001bf65fff542mr31718143pja.5.1647792015024; 
 Sun, 20 Mar 2022 09:00:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] linux-user/nios2: Drop syscall 0 "workaround"
Date: Sun, 20 Mar 2022 09:00:04 -0700
Message-Id: <20220320160009.2665152-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320160009.2665152-1-richard.henderson@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no documentation for what the problem was.

Fixes: a0a839b65b6 ("nios2: Add usermode binaries emulation")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index a3acaa92ca..ac71f4ee47 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -48,10 +48,6 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
-                if (env->regs[2] == 0) {    /* FIXME: syscall 0 workaround */
-                    ret = 0;
-                }
-
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-- 
2.25.1


