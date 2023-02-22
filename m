Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E434369FF71
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:28:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWB-0000Le-RH; Wed, 22 Feb 2023 18:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWA-0000LB-3Q
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:22 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyW8-0005I3-Hf
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:21 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i3so341425plg.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=AsZWuPRm+AS+Vx9QFESxFbomSIzH/ykPDeJcmaz1cX6hQWfNtkKFpyQWa6O2ybuWJx
 apygoguTakSshsT123lyhhRGb8cEA8CMYDHb5YG4zZfPn/KOYlB/ichhzEMmydMRj1ho
 zgJguHNQSGs7UWAUAJapF3Rgs05XkiWXDpyLrgetqkvK36q02g+5YTA+BtFEeXMp+R+E
 4pmSc43Kv2NmEpkkcPVRA7UAFldEb8kLdgculBE9F2NErPmVy4vAuctYAXTsKRPMuS2e
 tv8InUghL03KnyAjZAUhJw2e3vly0xHsrIvm02kcih3cGglL1o8Pp2jjjoqNDEWoqdXU
 +Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=RG6glVuMJBwnRdxjHOuBzgArTKOe2xUegbZD7hfOjswi5Gd0hJW7YttXJncrNg+S6R
 P6nXTMFCnBUlTAOQ/bHMXd65SP/rjywhRahGNUdoCI1Lb7OdxtAReyQyvsowOFO7HjRK
 hlAhnuwybxGCUGDtppg0+47eaGjBU8qeQLG0SnszYEFiO6ouPoLY/db2btqYUan8klrH
 NxhmFQ9tBrUmXFYG+EBApVEJhiIEenEQ37OaqJnb0ToKtayrIyCJdPZJmaIIz8BFkmwN
 tB0DiQ3ItNsdU7dLuII+7SdqmxS1ipYLhPO4TilLbTXbAXCwC81GocojsRjAbS635h9q
 UfOg==
X-Gm-Message-State: AO0yUKWvvrlW58dmcuwoqP/n9nTLXIBQvFztumuy0kPsBIFVjaNz8AES
 MYiiW0+q5JXmZ4ygiav7Drr+QecnaMB12dOp1/c=
X-Google-Smtp-Source: AK7set/wdSlxjKqarnxOTSc5HGi0De2c9mhJOY223m5NjJ8S6tYj72F9Id+OD1gpMYh6DIKo5FVCpw==
X-Received: by 2002:a17:90a:1e:b0:236:70e6:ef08 with SMTP id
 30-20020a17090a001e00b0023670e6ef08mr9135382pja.49.1677108439251; 
 Wed, 22 Feb 2023 15:27:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/28] tcg: Adjust TCGContext.temps_in_use check
Date: Wed, 22 Feb 2023 13:26:48 -1000
Message-Id: <20230222232715.15034-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
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


