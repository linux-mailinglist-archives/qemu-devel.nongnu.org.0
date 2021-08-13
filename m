Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43DD3EB60D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:24:05 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXAK-0007SE-Ql
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4i-0005zI-Rk
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4g-000190-N9
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f5so13211352wrm.13
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5MB/CWOu8y75nxH9S62qSbJCleKrqKA9mDnlY1X/YB4=;
 b=BeCjYGp55J77YtWl7Rg09vx2yRialAJFAhHOk8THvE1l88imoYWfHWnDLqV3K5Dhom
 pyMZjh2rWtHuJlUw11+fGCztVWft2UQYph078V//bs5hQHy7CN4eI2C/Y5OduCSZwuwG
 LJ/SCf0Bp2EXKZO43gVS2leGQ6T0rFuebBfs75x0rk+Wvm72esTVRcfYo/ZKVX3Vqd97
 n7XfJqbgzt9E8zvO49jBDsh9qJvFt6UTnDZkSBHuv8lhhA0u+/MRCILHZqVRyo4urYLx
 jlxeFo4Hi/R4N5Lj2Cvi+DvtMdWb1YoDDkh9T3ZN4jYVqio6bAPMYwMUCU7EM5StjxGg
 o/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5MB/CWOu8y75nxH9S62qSbJCleKrqKA9mDnlY1X/YB4=;
 b=k4Zv1KgXz9bTTsuaegeAaC2EGApXCUk2ePBDYHCutl6KdGx05dkrkqYKG4KX7U5+Vp
 iaqp6PE4TAL7T//JNUHAqYJCf2G73Hp0vo4zYC94EFZGOCcc/CT3AkOq/BFMzD8j9mfI
 0hmL6/w9Mf5xiajpWIgrFwoUZ9lRzPcuz9GglDEF4qtLqQZyu30a+tryqFznFOBkRmlU
 kJhTNwRhMHbU25cK7u1WLhbAMC20HlpNcFLfYkRCSd5B46Dz6yUhv1gnhWtFNAhAGKhz
 vaaNZxLA5QVS+fYhqwmle4/aGJjW00sFQnffYoUOi3VTrfY/WuGcEP1JM437EKhWeqlD
 PGsg==
X-Gm-Message-State: AOAM5310kUtNOmD3FDVNd8WBN7LCkKaswSzI5X92Ggo/cnRv8BNTzlad
 PvDZJf0URzbQe3FKA95dh8BkfsE4s1gCCQ==
X-Google-Smtp-Source: ABdhPJzdJtfLMDCsm4xosVNbD543Q26QRHkOPRZgABxq7KFwPcP7jquVFM6W3spyDFwtgIL+phCvSQ==
X-Received: by 2002:a5d:574d:: with SMTP id q13mr3169796wrw.425.1628860692396; 
 Fri, 13 Aug 2021 06:18:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/7] linux-user/aarch64: Set siginfo_t addr field for
 SIGTRAP signals
Date: Fri, 13 Aug 2021 14:18:03 +0100
Message-Id: <20210813131809.28655-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
to the PC where the breakpoint/singlestep trap occurred; this is
what the kernel does for this signal for this architecture.

Fixes: Coverity 1459154
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f0..5d8675944d9 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -148,6 +148,7 @@ void cpu_loop(CPUARMState *env)
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
             info.si_code = TARGET_TRAP_BRKPT;
+            info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_SEMIHOST:
-- 
2.20.1


