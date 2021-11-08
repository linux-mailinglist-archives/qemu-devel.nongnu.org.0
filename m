Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C3449ED7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:57:21 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDZo-0004tH-AV
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDUD-0001P2-LS; Mon, 08 Nov 2021 17:51:33 -0500
Received: from [2607:f8b0:4864:20::235] (port=40565
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDUB-0000KI-Pl; Mon, 08 Nov 2021 17:51:33 -0500
Received: by mail-oi1-x235.google.com with SMTP id bk14so7268337oib.7;
 Mon, 08 Nov 2021 14:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2L9qzhDKWKMHtgUavZ3mwmOjVB3lseYWbTqOJdv+WZk=;
 b=i4jAj5TGqJx59GSBRjo4neCJ3YOQpyuNUAgR+fgu/Hr8r9k0JIR5Yxu6XBv1KHgPrm
 GFxynGcV7JyYbYPYLOxQ9zSGNoBbqMzmm2DOnXyg8eqbRFTVX/ZZ5Bp2P+ZDT8GPodju
 BwUJsPJMOuIq6G2SG/EB0KEModiidTwPxovH24jZidjCefMYWJHhBYwi4CGhlpUeYgeM
 uUcWXgwrgSfm+KIDsZQclnhOzp5lZEX8/t2bKMELCOPLQqRqOVFR0ccNbjZB23v/m799
 jtnm3IP1hH7fXZ5fhXs26SVi3QXe72zdL/NDyEGRHgky55aZpbQFHUDHf4q8V3q8N43G
 pilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2L9qzhDKWKMHtgUavZ3mwmOjVB3lseYWbTqOJdv+WZk=;
 b=QXGbvx8Ueg4yWAfspvYootimK4F2i7ksdGjxw3CFORtcEhcw3OVHTZbV0S5+xvVK86
 cfH6NxnVcu2isQqhQMsJJpwrs34orQWv15mW4u9s5pCfin2nPSUg0tVOebVhXY5yngFa
 n7zxvth31BfbUfNpMN3zENu/p8EeruRtn/EoYHR3r45IbOz2RpkVaKgY4PDsgvmqU8Ve
 8UNKley6fzwXfqzSQ34kLkRXkMC21JAcbPAh9AgvwV+66K1dE0C7l4ct45SKIObLF6PK
 ykySt2shlNE7A0l0UrHj2CYn9Ifu2DTQwrPP+WOzCJRdo39K9E0X/QVQ4yvJpM2Fc2qB
 toGw==
X-Gm-Message-State: AOAM533NdiABGjkHn3UbCZHTwmrsCoZ2Xj0D2Y4NNbylgbF7Rj096xT+
 mz330xXHgtYpVqwmra1CvxGbbZ5VZQ0=
X-Google-Smtp-Source: ABdhPJyRiNWYtLMTGR6ciWY/xdTqEUqjT3LIOyXztgGqsyTjvZ3PuFEYEfIK7QW5w7KVsj3w68z/Cw==
X-Received: by 2002:a54:4707:: with SMTP id k7mr1586412oik.163.1636411890388; 
 Mon, 08 Nov 2021 14:51:30 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id h3sm6487249oih.23.2021.11.08.14.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 14:51:30 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/10] target/ppc/power8-pmu.c: handle overflow bits when
 PMU is running
Date: Mon,  8 Nov 2021 19:50:44 -0300
Message-Id: <20211108225047.1733607-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108225047.1733607-1-danielhb413@gmail.com>
References: <20211108225047.1733607-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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


