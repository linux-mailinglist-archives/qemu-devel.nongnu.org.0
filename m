Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70433F62C4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:36:25 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZPU-0002K8-P8
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKk-0000OU-Nu; Tue, 24 Aug 2021 12:31:30 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKj-0000GC-3L; Tue, 24 Aug 2021 12:31:30 -0400
Received: by mail-qt1-x834.google.com with SMTP id d2so17311112qto.6;
 Tue, 24 Aug 2021 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNq5gFZf6kQFD87J6oxmNiO5aTVHcQtkmSd4wiJrRYY=;
 b=NKUhk0oir9wYKrxmWqjNeK2FGZD4gLuC1iu4ckQrAlam4/+a6/8be64ausrAB3N7ht
 EiPG824Z5k1/LFzVREFcTqh0vY42K55ZxQnmzucoiie8V+bSf8NhGLUqV7qoslrKtc8s
 5hEsNmMYjLCr1plJZpyyCaWbMT4a0pIO1EGrhAmdHitKBJQMKoh8AfbQEbvb6Or2mT+Q
 c85UOLxG8F1uYa1V8Hkf2OiqlUCMn1qOUwVag+VP03vth+jl8o11BFsbelz1wmGOYHTz
 ibdaKMhR7Tgjr6n7fa4i448v7TMFJDfXmvgisL4LFKcpeQFoV+mvzT8V75ZUUKsynCiB
 Q4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNq5gFZf6kQFD87J6oxmNiO5aTVHcQtkmSd4wiJrRYY=;
 b=sWsHrfqIrE4JRoMHMx41gDmmO4/vTKsUgUh4z5Y4+EVWqUTFAI2aLod9XidT8B2ci5
 CHlbV5JR3HcNNLDFYO0ts+flJdUf3uuK5aB736BeR/ZjVKayI567X6Q2qI6csaNH67dI
 mklo7HDqSd8GhHcwCwsB1eQ5yFuTCpBMe9RKZvqr4tUkpUVSXVSv8SK9i3lLPbMX69ur
 k8LF5xerQGuzucCxYCDw7P22hOcgCHTuHFavhtCNUTM9Q6MCABL8cZ/THGEK4yw8WKgo
 13E0K/tu27f4WhQMH37LTWCWs81/u8FBRz+qSLYlDeH404ycPeHaNVOYe5yGFoiAifno
 0NoQ==
X-Gm-Message-State: AOAM530/aw0YQb8jCPaeBPM8iJGUNML7p330PeriTme4AwzFtRRt731O
 PQYUxW9fPyWVeNXWuFC5Kd4/ZKCjwf0=
X-Google-Smtp-Source: ABdhPJzWQy45BqrK/CUG4VdRfx3VFv3RzUFP935ubBXiI5MZPePkYme6+Y3DySIaHv08FVuS36SsfA==
X-Received: by 2002:ac8:7dc6:: with SMTP id c6mr35202417qte.25.1629822687569; 
 Tue, 24 Aug 2021 09:31:27 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/16] target/ppc/power8_pmu.c: handle overflow bits when
 PMU is running
Date: Tue, 24 Aug 2021 13:30:32 -0300
Message-Id: <20210824163032.394099-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
index d235cc2b53..e02986f18a 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -340,6 +340,30 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
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


