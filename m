Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701193B93FB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:32:38 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyyg9-0001bi-GP
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZd-0004QJ-St
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:54 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZU-0008Cp-2E
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:53 -0400
Received: by mail-pj1-x102a.google.com with SMTP id n11so4484626pjo.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dzNhtHE9m5XdMcEWBRnySR9gbMAPjCgqzhKLirKjfi4=;
 b=uWVlZtQK5bcbJRvJkDvc1IE7dZh1VDMbsl+qLfXeunWzjksfmghbsiQbXqJzFC7t4A
 ZJGwPIURZKOSIc3YhGhhJ+Ew8+/g/pOkKKppLCsP0K7LMCvybPcSmBJDc1jSfkzX9Sy9
 YuKNb0cKquxY1CTTQFbmZrTW1mXUgr8TZtwtDjsYYuU7uKWrAItm+tlPTckAL8X89mLt
 du+cbI5dEq7EpNBQavzl1An2UXCzcTbSvMlrGcGNUyKu0fFE3qaZEVE+0Go59Oi8Knou
 jUqBU/QJnA2gQ4sQCBuj69d7JTytjHQ/0cVhb31NUMldjdSWnxrr7yGyTl3697xszZW/
 a6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzNhtHE9m5XdMcEWBRnySR9gbMAPjCgqzhKLirKjfi4=;
 b=EddaFW5JUT/kQlmRybSa3a1bnZBkCRmGStjDiAc+5dJcSmThIgNC8GhYqkb/6ymIlb
 +ZVLvKnxRD/kVkXw21tScUyUOK49XZoOXgCE59XM6aIniaDzTI09bWsqBpx1LnJQi7uG
 k6c3l9POJoNfOuCyaporSKcyR5zOG7ZwWcESslm6eAZVPD998X0MJeQLer7/c/JNnKoe
 wSaEZ7REDTjDCeW/MJ9VlZpyKxZveFDTZgMX8zCZvy6Tz2FdQfKqksIsEB/nBnXJIs01
 kiTCAaB9BjDzPCDamWbHGx3xGv+44RBL24XBVhfIK++tVZljovWrh55Wgha1kW9wBuqQ
 pezg==
X-Gm-Message-State: AOAM533Eogr7LpQ/G/whY/UoyhUrrBWjqEP7m5eF77h6F/aDikKV+92l
 1OyOMYyC6k+jOpPoeNHV9pjSKwq2KflSvg==
X-Google-Smtp-Source: ABdhPJx7VKzo1x46lH4wFXaJ1lviGpim6jKgK7WWHwSz9KWWbcT3OszvxFVJraaEGXB5rBYA5aSv3A==
X-Received: by 2002:a17:90b:4a90:: with SMTP id
 lp16mr238826pjb.137.1625153142842; 
 Thu, 01 Jul 2021 08:25:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
Date: Thu,  1 Jul 2021 08:25:27 -0700
Message-Id: <20210701152537.3330420-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The space reserved for CF_COUNT_MASK was overly large.
Reduce to free up cflags bits and eliminate an extra test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 4 +++-
 accel/tcg/translate-all.c | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 754f4130c9..dfe82ed19c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -492,7 +492,9 @@ struct TranslationBlock {
     target_ulong cs_base; /* CS base for this block */
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
-#define CF_COUNT_MASK  0x00007fff
+
+/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
+#define CF_COUNT_MASK  0x000001ff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
 #define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
 #define CF_USE_ICOUNT  0x00020000
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7929a7e320..d0177d772d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1435,9 +1435,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
     }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
+    QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
+
     if (cpu->singlestep_enabled || singlestep) {
         max_insns = 1;
     }
-- 
2.25.1


