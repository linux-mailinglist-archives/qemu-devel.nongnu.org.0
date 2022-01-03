Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98E483740
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:57:13 +0100 (CET)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4SW9-0005vZ-2S
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSx-0007P3-0i; Mon, 03 Jan 2022 13:53:55 -0500
Received: from [2607:f8b0:4864:20::829] (port=34511
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4SSv-0006HA-Dp; Mon, 03 Jan 2022 13:53:54 -0500
Received: by mail-qt1-x829.google.com with SMTP id o17so31362652qtk.1;
 Mon, 03 Jan 2022 10:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nCT71zI72wxQPD4PqNomjBs8jlq7eptbrq0e8moFsqs=;
 b=XzBSa5xNtDFpj9U6IGOq433G9h7ShA1RQARSbtzmWKg4YjcQgZkiH7AejP157hXFQP
 geGkf2aj4T+55x88roFT9BgDxGM510Rmd9xTdBiPxkVYktgebord8byWiX8JMoR78e3J
 MDg0ue+qM7k3z5dAGUQQHomcHOt0BkUPMnFxZVJ4r6mPYjpMMBcJyAXTiR8BOuh4mQL1
 VoyA1GZGe8GYf/sFbfbVdeEmtkijTfu9YvtvdQHO5bC+NqTfhHChfZvHPN32UfGqaUGv
 xKfkqkpANhribCu2t7dabUKNhWrsukpdm+9bv8VFbEhHCmMO64TMvsUgK2bXzBrKxq5s
 xiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCT71zI72wxQPD4PqNomjBs8jlq7eptbrq0e8moFsqs=;
 b=MrALbKUDmPXb2coxaYOaPKTsZiWA9jK3NzHUQEQyoutctCIiO1zwy4iD6/NogwCuIA
 JVQPigVpOvmIJCjXrekq7hHAS9N+bG2KOLNou0HZCo30TmRD6aocBBf9Y5OzkPWYN8wQ
 ae3vA9QpDGX1eAylbbDcfs7CT0ZFNJ/Zt8H5VDEFoDCisw/cHOleirV2jcp7W6RYTlZ/
 +6dAO2pdLD/XLJZeOTrB9MEZhCQYFPd1xwqMjk+MkroxEZCot5OlGMFMgad9TMn3YBFF
 oMd4SoV4cCYElbpXSCQblE+qVBS01Ye4GCFhVEUhtEeH+i4YdB7DMieJj5m9zwSdCHbu
 GJHw==
X-Gm-Message-State: AOAM533rd+j5bVWKgfrfFhLKE0fQBemkftvmn71TZ+02umc0DreLWnSs
 LuVZgcRnEBEGL2Kr0MPAAAlH9Ohc0NY=
X-Google-Smtp-Source: ABdhPJxIiwslfeAisLTSKKG6Dn7htWhTdFCm4ENgvkq3y0fXa/GUwa36wXeli2yYg8oRqlwzWPSf6Q==
X-Received: by 2002:ac8:57d1:: with SMTP id w17mr38665498qta.658.1641236032310; 
 Mon, 03 Jan 2022 10:53:52 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id w9sm29002867qko.71.2022.01.03.10.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 10:53:52 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] target/ppc: keep ins_cnt/cyc_cnt cleared if MMCR0_FC
 is set
Date: Mon,  3 Jan 2022 15:53:31 -0300
Message-Id: <20220103185332.117878-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103185332.117878-1-danielhb413@gmail.com>
References: <20220103185332.117878-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pmu_update_summaries() is not considering the case where the PMU can be
turned off (i.e. stop counting all events) if MMCR0_FC is set,
regardless of the other frozen counter bits state. This use case was
covered in the late pmc_get_event(), via the also gone pmc_is_inactive(),
that would return an invalid event if MMCR0_FC was set.

This use case is exercised by the back_to_back_ebbs_test Linux kernel
selftests [1]. As it is today, after enabling EBB exceptions, the test
will report an additional event-based branch being taken and will fail.
Other tests, such as cycles_test.c, will report additional cycles being
calculated in the counters because we're not freezing the PMU quick
enough.

Fix pmu_update_summaries() by keeping env->ins_cnt and env->cyc_cnt
cleared when MMCR0_FC is set.

[1] tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 7fc7d91109..73713ca2a3 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -40,6 +40,10 @@ void pmu_update_summaries(CPUPPCState *env)
     int ins_cnt = 0;
     int cyc_cnt = 0;
 
+    if (mmcr0 & MMCR0_FC) {
+        goto hflags_calc;
+    }
+
     if (!(mmcr0 & MMCR0_FC14) && mmcr1 != 0) {
         target_ulong sel;
 
@@ -71,6 +75,7 @@ void pmu_update_summaries(CPUPPCState *env)
     ins_cnt |= !(mmcr0 & MMCR0_FC56) << 5;
     cyc_cnt |= !(mmcr0 & MMCR0_FC56) << 6;
 
+ hflags_calc:
     env->pmc_ins_cnt = ins_cnt;
     env->pmc_cyc_cnt = cyc_cnt;
     env->hflags = deposit32(env->hflags, HFLAGS_INSN_CNT, 1, ins_cnt != 0);
-- 
2.33.1


