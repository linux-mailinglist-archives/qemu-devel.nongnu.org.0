Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0C4A8CEC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:06:29 +0100 (CET)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiN7-0007pB-Uc
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:06:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhet-000358-7H
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:21:06 -0500
Received: from [2607:f8b0:4864:20::102d] (port=46901
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhep-0002d5-2i
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:40 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 oa14-20020a17090b1bce00b001b61aed4a03so3934160pjb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DAhWgX1CCDQgRZUZ9Tcvj63seo9f1XrB5as1gD0Wfjg=;
 b=OKWJWtg24ECQfs+zTcXNJLWT6vmAZnkH5v8TourcbFgPx3VZtbyrMdiL6K3KNiQcZv
 WHp9Jzq0WJMMuTi9PVgyFcPnFMhxX/J2EswoK6npggtcRUmFFgGNS3UNyfovCRnyn5w0
 8ziv1sWe4GsBCUB0f14mQL0AYW5v3NZ8+BxxnS3VZxDFIXle/nUF/Eu8AdBwFeWKWcOP
 AP9+wnjjqnuRXBWkkrrXPAGEkFeSKheKy+DztyPNYV5Qu+rMmISQAqewVqbgqAzYCOcg
 s9SWHO6fF0HihyCR63MPST6jWUM7Yn8P1NcXpyt+/SHLN0VubpVyW74orcrnpV6vJfiq
 AODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DAhWgX1CCDQgRZUZ9Tcvj63seo9f1XrB5as1gD0Wfjg=;
 b=vaUu6GHsPvzXcdLLGFkgbw7JyaQr6IneSMP13tR7T0vs4L02JI2FIdVd+d3hZ+w9Yr
 nQ3kSg32d6k8t0ScuiB3QqTqoIxuTjtBhUONS+A5r3CqwgLzgSm2zLkg5I4mzb0DnkDR
 +OVqO1HnRCa/fPzbUUG+1DGfetgZkmk1gxRKGwxZ1UAI1RcrOn2rrtHZuLSDhnrEcfaq
 msz/pb9TxCFRheaqvhB7bdW78iXLnZi3CywJBGVUawj/8Pc8V0jihBv21Og9ZsNxx+yi
 IxLLdrLEz2bALm+S+0RUkIXLydExKHqROxqVgbqblcCQFctbLqW3NtYa6kkL1LehRDUD
 3MDw==
X-Gm-Message-State: AOAM533cu1VCoIVmArPzNvD/RMICKRirzWgZ34/jJ4OF1AFabr8jdAmb
 KvhTBKpZAdTX7u1lH4TqFPTaVeHs704=
X-Google-Smtp-Source: ABdhPJzVVcj9vEfoGMK5BmTXH3ZMfXV5bQpjBXELIkDsvRmBSACC7i9/CDA3mwtDVmc3FGJm2Sc+jQ==
X-Received: by 2002:a17:902:e5cb:: with SMTP id
 u11mr36293152plf.146.1643916035243; 
 Thu, 03 Feb 2022 11:20:35 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z17sm14822200pgf.91.2022.02.03.11.20.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:34 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 17/21] misc: Add missing "sysemu/cpu-timers.h" include
Date: Thu,  3 Feb 2022 20:18:10 +0100
Message-Id: <20220203191814.45023-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-icount.c | 1 +
 accel/tcg/tcg-accel-ops-mttcg.c  | 1 +
 accel/tcg/tcg-accel-ops-rr.c     | 1 +
 accel/tcg/tcg-accel-ops.c        | 1 +
 include/exec/exec-all.h          | 1 -
 target/riscv/csr.c               | 1 +
 6 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index ea42d1d51b..bdaf2c943b 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 29632bd4c0..dc421c8fd7 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index bf59f53dbc..a805fb6bdd 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd..ea7dcad674 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -29,6 +29,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 35d8e93976..87df70fa8f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -24,7 +24,6 @@
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #endif
-#include "sysemu/cpu-timers.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e5f9d4ef93..a4db40769b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "sysemu/cpu-timers.h"
 
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
-- 
2.34.1


