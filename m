Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675F66A27FC
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPP-0000M2-Am; Sat, 25 Feb 2023 03:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPJ-0000LO-QU
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:53 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPI-0004od-2h
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:53 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i10so1842054plr.9
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 00:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=EwAQUW0VRgrRYKGBQEn4bdic1J1dHdtG9wOjflv98go3fkM4Jl9KYzdKBlRX7CjQiA
 8UOOPk5sB8dA0JgJU0XFgkyHlxp7J6O7Aq8qUQEqaoHL27m3AKUIef6T7M3DA/71DjRy
 uDwKMSyegv2H5+s5zID2nBWNi5eZuq/cLPJ3bifqvUioXgzHi9sbasxPwa6T0Jm+da+e
 jgwwKuHLFHNGIlcT6eJF2dyyB3DHu2fYWLvba32/ZHyj4ioADDKqo0PEOf8JXtpS0LEs
 Ev0UbZjdyvVaC7dtd8tFs3FS3r4wHXe0Mcl/wH+lWZcrnHTrvxU7wFd/svnSsMwYWkSS
 qcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=bhMDXTa3SgkGuyVuPq26svMrqlUdC7op0Zug2TD32A1CfvodC+mH6gn+dGn9eK36i2
 KXOTexmlV//Wk2QFJORO6hp1M5OSqH/k37bgEFPR1hl6p9b0WGEt8/i7F1PRwG1T5FIm
 e8+gt4As5SHQQSMYzYRjpo96mbWehxWymslsHuz5H+5Kq3OqHbBhDDLyD/GhXp+/WIFw
 UJs/WQlQv6x6iJu0Kjo3mZbt5QLRnDb8CZaUvW40s6COH34QVQgoNeCamubPyMhm/+Ev
 fWmmFIM+5QGxY0efWGKyQKKcLGVCcFmUDP+cVVEOh5lCiKHGB5yM68tdJLIkxmWm9xvv
 3tkQ==
X-Gm-Message-State: AO0yUKUSWmPsFv7sEABZgot2iVm8dkci8TIMuE8KR9nrnHO8wqbtPTvl
 Zuansc02nXNFTvAUGHU6JE9D9fGoKjP4Et22/J0=
X-Google-Smtp-Source: AK7set8oW463JqvLM1/8EfjFP0sjYPK+OLcXioTCI48HPHZypdjKLf61Pa2z3UtPIPtdO+qh87rdmA==
X-Received: by 2002:a17:90b:268c:b0:234:4187:1acc with SMTP id
 pl12-20020a17090b268c00b0023441871accmr2417557pjb.19.1677315590742; 
 Sat, 25 Feb 2023 00:59:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.00.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 00:59:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/30] tcg: Adjust TCGContext.temps_in_use check
Date: Fri, 24 Feb 2023 22:59:16 -1000
Message-Id: <20230225085945.1798188-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Change the temps_in_use check to use assert not fprintf.
Move the assert for double-free before the check for count,
since that is the more immediate problem.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a4a3da6804..06209e6160 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1375,16 +1375,14 @@ void tcg_temp_free_internal(TCGTemp *ts)
         g_assert_not_reached();
     }
 
-#if defined(CONFIG_DEBUG_TCG)
-    s->temps_in_use--;
-    if (s->temps_in_use < 0) {
-        fprintf(stderr, "More temporaries freed than allocated!\n");
-    }
-#endif
-
     tcg_debug_assert(ts->temp_allocated != 0);
     ts->temp_allocated = 0;
 
+#if defined(CONFIG_DEBUG_TCG)
+    assert(s->temps_in_use > 0);
+    s->temps_in_use--;
+#endif
+
     idx = temp_idx(ts);
     k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
-- 
2.34.1


