Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735BC3CC6A0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:24:34 +0200 (CEST)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sjZ-0001lF-6v
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seC-0006sS-3m
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4se8-0001yz-3T
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so11583186pju.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g6WC/1OFwmMEJWjhaux71v3WymnN3hUDPV/lnz7IXaA=;
 b=yT3ibeQmsaMWNd8m8STIiuyLKvQWRz66pufl9VG6X7+extxDVqGBPc9ik8G8cFIgIB
 OmIac1BklWmPx3dEvY5yzZ63c5kek2cYQNC9TrSwcGWnF2eGgbO9dodIp/i3w5GFjCxL
 vfxn4WhC0zn0KAzsojESJ2pmS8/0zBHeNdKXJe4BJ6pDV3nOuz7WLh0wSRs1qctAPOHK
 Zesbv8jVhk2lFDMj6UT6i+QmLWpKc084piKfYJK6OGNnv4UwNq5MoocC85ZB4ggGS1P/
 7gSYiwUSL2XzuswnfMGHU5EccyQhIVgkOnjIFL2+AGEClQ+Bhb4gtwi8VkeAQx883MRR
 2McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g6WC/1OFwmMEJWjhaux71v3WymnN3hUDPV/lnz7IXaA=;
 b=MlSG0UDXgs5+mz187hMJ876zddrrYuZ59+Z14nVBeB3wtTqIgZqMPaXdKeUOSiypqJ
 KxJ0Woo/doUcKjFftSs7GN2kSfBLU1NW3QJEqqLWNH2hMQNcPFwZzgCNYoDsVe4CyxMU
 ZYr4JW4Azlzs2gh4dp0F9r+cfx0RH4j6Got/JaiJ1h8+H7UF5x8w65o+IYrKHJjkaj3y
 LWCfhh2Oh5kbfEJ++V6nISH80GnkRapFBYNQ+o0hszJYdyTqyzhW9eHaQjevpQqC//Xm
 yhrormkTXDJCGDRpWKXvYWNs9ULeMmK6LnFUlMt0choHPLRt/kj8oZOgevDd6R7gah0n
 Rdiw==
X-Gm-Message-State: AOAM532STJ71KbukrhGcbNFruV9Px7i7CwAn92BggLzNrDxNRiU+LufL
 u7vz5DNMClIfaoHsbFlj69kGDLngZJvorw==
X-Google-Smtp-Source: ABdhPJx5x3CcPJ6V9aVhMHz+/OZnbTM/EwaV4vZxYaozoKVL2zFQKqCYmDFUp9LkPfDteAfir09EtQ==
X-Received: by 2002:a17:90a:5b0f:: with SMTP id
 o15mr22919550pji.34.1626560334083; 
 Sat, 17 Jul 2021 15:18:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Sat, 17 Jul 2021 15:18:40 -0700
Message-Id: <20210717221851.2124573-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly have more than a simple member read here,
with stuff not necessarily exposed to exec/exec-all.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 5 +----
 accel/tcg/cpu-exec.c    | 5 +++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dfe82ed19c..ae7603ca75 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -565,10 +565,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-static inline uint32_t curr_cflags(CPUState *cpu)
-{
-    return cpu->tcg_cflags;
-}
+uint32_t curr_cflags(CPUState *cpu);
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e22bcb99f7..ef4214d893 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -145,6 +145,11 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+uint32_t curr_cflags(CPUState *cpu)
+{
+    return cpu->tcg_cflags;
+}
+
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           target_ulong cs_base,
-- 
2.25.1


