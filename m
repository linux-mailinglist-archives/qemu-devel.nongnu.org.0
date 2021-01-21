Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE82FDFB3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:55:46 +0100 (CET)
Received: from localhost ([::1]:33938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Q8P-0001fk-TZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Q7S-0001FC-Uq
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:54:46 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Q7R-0000s7-3m
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:54:46 -0500
Received: by mail-pj1-x1035.google.com with SMTP id cq1so660954pjb.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 18:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PZZtDCwjS2Ce0HCMyjrEnjDzfGR/6vbA2heqxMwMXc=;
 b=JMLuuCaIBJdfjhp6USA9w1foDx36Ph+g3chQSKsHrpbcfkS/LspSuotdqMS21mKm/H
 Ek4ilx7s+15a0UIjbP2nRwn3I7fUOz5qiJ5pHLesyFRe2ZQF4mPD95L7EILENg1sinZc
 bkorUxl8t0AT+0zPgTTmbpAMo+uSefdtugdaaGwmX6wDA30+np0K7i6AyiPPEVG+eEGS
 h8XiP2mgMA5CqHL9ARyiox4Eq8CfC8MOknUQAO2FZakw9huF1XEt9qCvTOQZZz/MDUOQ
 BdN7S0y7lCQmlk4YpRGilrod8FxNFwAQm3iwAzIfpTwRQVK8W1XZjIHYl6PBzn2E/hob
 RVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PZZtDCwjS2Ce0HCMyjrEnjDzfGR/6vbA2heqxMwMXc=;
 b=DUHDNjQ6njOO92JXAf+/9UjAVc2qHTBfr/k18qnqnvBEzkrWcNtOvNhAr+ZjMoSQqn
 kPWQDwriDhHcC6vLW6FiFdcKVhRQ19ih0XuR/0LhInnnCtTEYHpoXh+aumvsGWJbcMXo
 16KnFkdADQ+amavPd15Q3lG6uB3NxxY9XG+Pkc8UceA09EZ09c9Y8GR6YCmwwoc2n4Vb
 5wsp86z2Jx0ATEj0br1kwajuZJgCVH0ufspjBpEYBFkdEjhYy03ktK43PmpNOHLTDCop
 8BVTu7LhA2ySD4V+fuo68nYJOdo6C7FJbERePuanSVW0fROZM0BkP/UHtPy+AehWaXBe
 Cd5w==
X-Gm-Message-State: AOAM533dzQO2LyEGT3osKsXwQ6rikCCFkJhEvINgw73Wl99iZISou0PF
 zv1RpS3wWpcQFdU7rVzvmemC9/x2MPFr1Q==
X-Google-Smtp-Source: ABdhPJzSlxqZCl6e7ethIrq7mdLdVHYAsyKIL4W25csLz5VgIqaDxYxygFU7Dbq2TpNzYMUIaCebrw==
X-Received: by 2002:a17:90a:520e:: with SMTP id
 v14mr9021981pjh.233.1611197683234; 
 Wed, 20 Jan 2021 18:54:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b7sm3563500pff.96.2021.01.20.18.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 18:54:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Increase the static number of temporaries
Date: Wed, 20 Jan 2021 16:54:39 -1000
Message-Id: <20210121025439.1120405-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This isn't a total or permanent solution to the problem of running
out of temporaries, but it puts off the issue for a bit.

Make the assert in tcg_temp_alloc unconditional.  If we do run out
of temps, this can fail much later as a weird SIGSEGV, due to the
buffer overrun of the temp array.

Remove the inlines from tcg_temp_alloc and tcg_global_alloc.

Buglink: https://bugs.launchpad.net/bugs/1912065
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

There are more bugs that need fixing in order to actually make
the dynamic allocation scheme work.  Rather than keep this bug
pending longer, hack around it and make the SEGV an ABRT.

r~

---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index c5a9d65d5f..0187de1352 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -275,7 +275,7 @@ typedef struct TCGPool {
 
 #define TCG_POOL_CHUNK_SIZE 32768
 
-#define TCG_MAX_TEMPS 512
+#define TCG_MAX_TEMPS 1024
 #define TCG_MAX_INSNS 512
 
 /* when the size of the arguments of a called function is smaller than
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8f8badb61c..5110f6f39c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1204,14 +1204,14 @@ void tcg_func_start(TCGContext *s)
     QSIMPLEQ_INIT(&s->labels);
 }
 
-static inline TCGTemp *tcg_temp_alloc(TCGContext *s)
+static TCGTemp *tcg_temp_alloc(TCGContext *s)
 {
     int n = s->nb_temps++;
-    tcg_debug_assert(n < TCG_MAX_TEMPS);
+    g_assert(n < TCG_MAX_TEMPS);
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
 
-static inline TCGTemp *tcg_global_alloc(TCGContext *s)
+static TCGTemp *tcg_global_alloc(TCGContext *s)
 {
     TCGTemp *ts;
 
-- 
2.25.1


