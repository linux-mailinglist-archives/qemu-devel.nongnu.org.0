Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D604006D9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:43:44 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG2I-0007yZ-6s
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFr5-0003X5-Pi; Fri, 03 Sep 2021 16:32:07 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:43668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFr4-0001sf-6F; Fri, 03 Sep 2021 16:32:07 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id z2so357345qvl.10;
 Fri, 03 Sep 2021 13:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WP7X4XG7rxEZfLDRdeGQ1Uzwycs/WMNPGsBGEOxFNek=;
 b=LgoUh/4e43QkoIjh2vEUgM9PumyZ47YaqVjnHexNbR8tisRkc+K+wLAoLCgxzk3BEt
 ndmIU9PvVE4I+rqfv2LvByinkI4i4N3EILg+AkYS3RKDnss6atxa63UEilQnIJID9Iba
 3lchdQyb8H6RwZIMSHUULRy1Q5D1R2u1qhCZL042+jgNgk8DGtqIKYbiJlIhV0z7JfKd
 Scn+VYSr6a1F/038wQPP3V9zspRRxqbFHFcoICurAYzYCT9HpGrC2+ww97wWoC64otOL
 6dFjAL1z7O06QiwA11MEk1hCtwHr7D+1dj8H/Ix3Y1QqnW/9qVQKYlLDD3Ah2+KCSGSe
 JwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WP7X4XG7rxEZfLDRdeGQ1Uzwycs/WMNPGsBGEOxFNek=;
 b=KTIxutcyd4YIWi/xWEj/7sUtOSJnMHYGGh69pBojiQjLluS8Vmn9IESfztT6LcroEf
 FtQ0J/2YuqmAa1ww+E04p6F9aTmps/aaOzLEKkWPzeQeHWzpddZ1ZCpC/nBau/cK0uOm
 5fZXdudl8hVV03g4nCC9CkuQjuhpLnm+yQpMSp//3cjzAp5QLSmzNYCxQJYXLMJ2oxLt
 xWIJIqolpnWIKcVByXHGgcf8rWkp8CNM3CEERFA2IfEqT6G8+cAtYEE64zguw2ejcHMu
 iA2mb34KTf+BxRoopT693DDe7iPHCwvolhQFHjJje6bROH9cIVGnfLAVKD9hSewI48cb
 403g==
X-Gm-Message-State: AOAM531iLieOY+QjmYJDd367actppkxZa0lOcwnCrW3U3233qxU3X6GR
 d/QW5ApmTvzvQy6QQdnZgQXLaHKBkW8=
X-Google-Smtp-Source: ABdhPJw6O6z8yzMeVDmOJH1zMtFTrzf1mIp97iVggdJKDClFiZGzhfO20IN563xy63IVW7ud70Vf9A==
X-Received: by 2002:ad4:4982:: with SMTP id t2mr664550qvx.46.1630701124821;
 Fri, 03 Sep 2021 13:32:04 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:32:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/15] target/ppc/power8_pmu.c: handle overflow bits when
 PMU is running
Date: Fri,  3 Sep 2021 17:31:16 -0300
Message-Id: <20210903203116.80628-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up until this moment we were assuming that the counter negative
enabled bits, PMC1CE and PMCjCE, would never be changed when the
PMU is already started.

Turns out that there is no such restriction in the PowerISA v3.1,
and software can enable/disable overflow conditions of the counters
at any time.

To support this scenario, track the overflow bits state when a
write in MMCR0 is made in which the run state of the PMU (MMCR0_FC
bit) didn't change and, if some overflow bit were changed in the
middle of a cycle count session, restart it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8_pmu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 9707f6e3cf..c9b096f0de 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -345,6 +345,30 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
         } else {
             start_cycle_count_session(env);
         }
+    } else {
+        /*
+         * No change in MMCR0_FC state, but if the PMU is running and
+         * a change in the counter negative overflow bits is made,
+         * we need to restart a new cycle count session to restart
+         * the appropriate overflow timers.
+         */
+        if (curr_FC) {
+            return;
+        }
+
+        bool pmc1ce_curr = curr_value & MMCR0_PMC1CE;
+        bool pmc1ce_new  = value & MMCR0_PMC1CE;
+        bool pmcjce_curr = curr_value & MMCR0_PMCjCE;
+        bool pmcjce_new  = value & MMCR0_PMCjCE;
+
+        if (pmc1ce_curr == pmc1ce_new && pmcjce_curr == pmcjce_new) {
+            return;
+        }
+
+        /* Update the counter with the events counted so far */
+        update_cycles_PMCs(env);
+
+        start_cycle_count_session(env);
     }
 }
 
-- 
2.31.1


