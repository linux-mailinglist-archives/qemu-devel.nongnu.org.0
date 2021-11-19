Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAD45768B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:40:18 +0100 (CET)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8o4-0008Ul-QV
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:40:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XG-0004De-Kz; Fri, 19 Nov 2021 13:22:55 -0500
Received: from [2607:f8b0:4864:20::935] (port=35798
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XF-0001pQ-A2; Fri, 19 Nov 2021 13:22:54 -0500
Received: by mail-ua1-x935.google.com with SMTP id l24so23072096uak.2;
 Fri, 19 Nov 2021 10:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2L9qzhDKWKMHtgUavZ3mwmOjVB3lseYWbTqOJdv+WZk=;
 b=nGah2GrJVSveESPVaIvv8rfgB1LLzVDb/tcM5/M/UdGznQ6CJhL88eOAc9b30dBfYh
 jUuCmtoBqzzeG/RmBvN8zuuOyno51iRvlobZ6HjQxta0K5ukniqJgzXu76pB8lVWbcS6
 ZZBzxz1HFQjWHhf/oj3nRvBT5URn4HGCnjb4BtG0xsWb5+wf7U11xwQthzd3BALUg62a
 +lK8wEfyCfkB70x4NwpGA5uEI1hFYiLGwUDNFK/araK72CSTPf1HD7drcVEnoNshrGZF
 DkNgdyN1uZarIIxOaQNkUW8h2eIift1/EauW4CZjNCeUD9ZJkkcJWGewkPtTkaBl2GPM
 YHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2L9qzhDKWKMHtgUavZ3mwmOjVB3lseYWbTqOJdv+WZk=;
 b=i4lmDo1ClzQdNqvZzhhIz0Hik9UaQZ0gp+SdSCqLnI07Dh57ctRPK3Die+MugkcsT9
 fYAOM/cbTyZV1CVRr5vGAE3u01TASVBOakYh3gI3DkiAx3hre5VV/odfqotjwhWAdoXt
 bj1r2IUtf/o6MZ4r2YhBySGaio61tcDH950PNzD1xbqogltbgEbYvyWPDjWy32zukWZm
 4TnOawSSEq8MYFq0GPEXNg3LWeaHlzDHmtZF7E7/k1iSus6TPnChbMzmENxr22sVadoi
 nMyRlPHM9iE+DdH0pREHERncStmqKFmS5DbdNx5fKPb1q1FYAf6bVWXfjc2HUkpVIanK
 WVQA==
X-Gm-Message-State: AOAM531+boa9yY3bSSWgAIPaaIkDh0GE04/3WdPPZZjXKRSB+EAVBNH6
 EqLqvy4g1UELvzbBnMh5yhiEPCiaBS9dJg==
X-Google-Smtp-Source: ABdhPJxq0u/sTjjWMl1GDfH4UI3wuaJraat+/cUf3BSKNYlal6RDPmtvwCYPCZcAh7icbCZ/SgJ2lg==
X-Received: by 2002:a05:6102:2924:: with SMTP id
 cz36mr96483766vsb.33.1637346172093; 
 Fri, 19 Nov 2021 10:22:52 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:22:51 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 07/10] target/ppc/power8-pmu.c: handle overflow
 bits when PMU is running
Date: Fri, 19 Nov 2021 15:22:13 -0300
Message-Id: <20211119182216.628676-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119182216.628676-1-danielhb413@gmail.com>
References: <20211119182216.628676-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/ppc/power8-pmu.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index ed7fd0c898..1dfe4bc930 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -285,15 +285,31 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
             start_cycle_count_session(env);
         }
     } else {
-        /*
-         * No change in MMCR0_FC state but, if the PMU is running and
-         * a change in one of the frozen counter bits is made, update
-         * the PMCs with the cycles counted so far.
-         */
         if (!curr_FC) {
+            bool cycles_updated = false;
+
+            /*
+             * No change in MMCR0_FC state but, if the PMU is running and
+             * a change in one of the frozen counter bits is made, update
+             * the PMCs with the cycles counted so far.
+             */
             if ((curr_value & MMCR0_FC14) != (value & MMCR0_FC14) ||
                 (curr_value & MMCR0_FC56) != (value & MMCR0_FC56)) {
                 pmu_update_cycles(env, curr_value);
+                cycles_updated = true;
+            }
+
+            /*
+             * If changes in the overflow bits were made, start a new
+             * cycle count session to restart the appropriate overflow
+             * timers.
+             */
+            if ((curr_value & MMCR0_PMC1CE) != (value & MMCR0_PMC1CE) ||
+                (curr_value & MMCR0_PMCjCE) != (value & MMCR0_PMCjCE)) {
+                if (!cycles_updated) {
+                    pmu_update_cycles(env, curr_value);
+                }
+                start_cycle_count_session(env);
             }
         }
     }
-- 
2.31.1


