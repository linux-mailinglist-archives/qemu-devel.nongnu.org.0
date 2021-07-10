Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CB3C355F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:55:21 +0200 (CEST)
Received: from localhost ([::1]:38006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FK4-000411-Iz
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exe-00067W-Q3
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:10 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exd-0002SO-0L
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b12so11678695pfv.6
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mkAz14ohKaEU7KoR8ytu+L59auoxHOiI3rwm13ILEcE=;
 b=EFDs7r0yNiH3qWFi4usGTVsVaukeRn8UfBj6eMIAPrPZcUSdr/q9ggTcurYUzuMByd
 aJ4/oSAs1bf2y/F0qPQRG4gu8TzWklI4jKqey+MgtSy/qOFU8bh0ibCDJoq/9+qaOp42
 sTkOxbKxE2jBsiv4JL/z9m0x7AVeWyrvbDPbcGb/EBjLyW93JWn8ZVO2XC7w/LuzxOKZ
 wo02nyYjIE5He3Cz8LaRhVf2nuNzb72tpHQiYZI1OXV3HnJmUphjmqaR7b75qvpNoTYK
 4G+ujTlkgrRqtRvd6MzJ3M4vaifrs0ntgpY+HAp9EBb78gu8YZPoJhOZBHeKrM3PksDY
 odOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkAz14ohKaEU7KoR8ytu+L59auoxHOiI3rwm13ILEcE=;
 b=jD78lz5V17yqQtrrPwIvlmfFC2cZP+qosaUQxhpi0Wn23UKv6qCXyX6bcM5RbetkIK
 8slImD8I4C2vVxdnFkxiA6sGcmW+VCzZ3ChaQPJLgi6YrpwUgYCv5z9g2RTXQkbl47s+
 ntbbTB90K9DLYaxzAh5SaxyH4EvsLMmx8Ub2qSifI9XxFM2is2HBuuIO3iGYgeVry123
 0s1rBZ+IOe9vrRpaKx2GkPP4pHigPDVTRofMA4YPV/gFz77m5d718baEARRwS+kXkR2b
 LmqYErnhtAo9Gd4T8Dm0QmpMhmU6e1utqKrlqaVvVjRTaGDrS8NEhJ3lqBDDKUbhEIhD
 iSxw==
X-Gm-Message-State: AOAM531kzQERixMFNZGBvJXxZZawaLucnB7e2aN+FfgVKONxV8McMCvE
 Zn5KvL+HMCBNq/9SFgwfaSOhXvo+Bq9GhQ==
X-Google-Smtp-Source: ABdhPJwSBUGX92TO6jBzb3DFiWRV+1fdpgr8Xmhcjrrx/VPTcZnM2x5M5iWXFI7q36Tv1rJv9+yfew==
X-Received: by 2002:a65:6283:: with SMTP id f3mr14640614pgv.370.1625931127693; 
 Sat, 10 Jul 2021 08:32:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/41] tcg: Fix prologue disassembly
Date: Sat, 10 Jul 2021 08:31:36 -0700
Message-Id: <20210710153143.1320521-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

In tcg_region_prologue_set, we reset TCGContext.code_gen_ptr.
So do that after we've used it to dump the prologue contents.

Fixes: b0a0794a0f16
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4dd4084419..ed86a70b79 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -752,8 +752,6 @@ void tcg_prologue_init(TCGContext *s)
                         (uintptr_t)s->code_buf, prologue_size);
 #endif
 
-    tcg_region_prologue_set(s);
-
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
         FILE *logfile = qemu_log_lock();
@@ -795,6 +793,8 @@ void tcg_prologue_init(TCGContext *s)
         tcg_debug_assert(tcg_code_gen_epilogue != NULL);
     }
 #endif
+
+    tcg_region_prologue_set(s);
 }
 
 void tcg_func_start(TCGContext *s)
-- 
2.25.1


