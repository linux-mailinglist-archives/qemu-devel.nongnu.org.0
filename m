Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B93CF13F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:22:10 +0200 (CEST)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eSX-0006FA-7f
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOf-0006Pz-HC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:09 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOd-0003Kr-Uj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:09 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bt15so12768583pjb.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8NOqQ/0TvCdkNluzWUj4pUQUbt/7JktmnpikxlNXDw=;
 b=ANKr35ZZgq9L7ePZbC78F5MX69Lu4G3cxTc4WoL/46Df2rREz/SkWckkdXrtSU1u97
 wYeZ5cyidOEotNWNbysXwiBMa6gDrs2imn8tP3gZgO9TE8FQA3H/Q1ACLSlGyIJOtcEY
 C1XAqcIXOItan/6iJc82gk8R2jaWBAlZXG2lAo7ACltwLOKWbG1XEHolrnwsFd5ETrUk
 VEdfPH0ypcZwY0LcQBqSk+aWDNXSEVcnN3GlvAfnLGZ5qOVTowopo2nLZaO8UPgO20VW
 LypF7znDKLZpr5NwQRASdEP7dCm5ZPesO2sFZ7zjRtnNLhoKLRUZtmtUQzfIh/ALI+61
 uWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8NOqQ/0TvCdkNluzWUj4pUQUbt/7JktmnpikxlNXDw=;
 b=PQZaj8pOd6cZ4eaXn0Vg/JjgxRq1r4Xe9I3WQJaMhBqnE96ZgQzkQNKao67FNs1B6f
 GDy8NF3w274KRVZOCz6YZ0BCR91ZejF0upxoQdoPPtHlRFPzoWVFCBr40y43kVazipY5
 d+wXubfKfWpqggB/NgkgRTrUWZk8dFB187xbry/Eq4QezceMgW7hdrZmO7Dz/zhDf9Ym
 G7FSryogrEvJGpTYoOhfgDAFJyHvawMubsB5op83621VQa7zFKdbOG/Pj8CGkjQZsU1+
 AJ0Vfattz6UWWSCEhfPJEIEC4P0jOolmPGkBJWTtrJ9snu2wxgHehhCxdvkpXgBmEhRt
 e9uA==
X-Gm-Message-State: AOAM530aWqUimWj2Yp9Rx7CSc0H8IZe4PLj4lhj9m3fZ6LmtFI5mh1XN
 xEAMYlg7DSQRQ6lYZ+DWuYfFO9+/UIlPnw==
X-Google-Smtp-Source: ABdhPJxGyNdvEXdYbmGy7RangO2NFqdxjg2a0t0t4pnm0HqB7XIuOIYcZhXmF1tIpxEcSbw/MKVhcw==
X-Received: by 2002:a17:90a:b78d:: with SMTP id
 m13mr22013576pjr.60.1626743886715; 
 Mon, 19 Jul 2021 18:18:06 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 02/15] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Mon, 19 Jul 2021 15:17:47 -1000
Message-Id: <20210720011800.483966-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly have more than a simple member read here,
with stuff not necessarily exposed to exec/exec-all.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210717221851.2124573-3-richard.henderson@linaro.org>
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


