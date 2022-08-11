Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D45905D4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:26:17 +0200 (CEST)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBwm-0001NV-NI
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0006rC-Uq
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnH-0000un-W4
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id h13so22075246wrf.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=7JOOvNmtI1acCNeUuTnyvZig9bTiBz+pPJfNeB7v0uo=;
 b=gCQaMIR1nw1BU1oWukn9ljVoNP6sS45rgkDjS5xN/khnizeQDFQUx+gvSqoIYjE+fi
 XoK5/OjTEjObUCDEm1r3wZ17sfs6Xr0yciNKjFf5ZPwXPdfOvAMx5fg7jdfYP/UIa63q
 Pb9P68PyIzXBG25/64Nym/D7y1sKxyfkUIlvxQ1Ggw8+LSDAuDwMTtnR7i3kaEjC7ISi
 GEkFUVFUTsNwIkGk9KRfcL0C2qjb9WvyJs+Fi3hG0GbnFnJfq8VcCAxWegTp9ortwhCL
 rWv6Kn+qyZyDffZh+GT5ZNC7CZnd5i6JYVGMNZrptt4Fk740QQ3kbUCc5FnmKOmz8uzo
 ZgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=7JOOvNmtI1acCNeUuTnyvZig9bTiBz+pPJfNeB7v0uo=;
 b=KoeV/Y0s2Bz1Y1PlBuYoovge38SCSnUMo4QrvrQKIrpcuZGl5O1DU21ojWzHkW8hve
 KovRsxGjisPa/vtwYPBDLkwQxQGvlyKyVzKa5YKoMLO/yt8jyv9znRX1XO5xfKvojm9+
 NgtqMSr7E/SAhLxR9g28ZKNEpuC/+tPtUmWvBkz+0EaYV1/pC8EZxXwKZULykuF0RIPO
 42NXrdm0b6rpy5zoPOEC8qq9AQNPiUb6Ta1BLZNJXvVEpn1zgyavsLxOo8vHrsjOELst
 DCvEgJfynhVyxXnRX53jeqhwEsdD730OPHnOPHhLdS9MUuyiPmAw6mN4tCPXYTCxI4kH
 6uOw==
X-Gm-Message-State: ACgBeo0Gb+Ocqux2p0cijZg5vGest5uEuFqlkxOjt9Tybx1d3Y1pGt58
 I1kyKQa2EW62iKwooj6FhcFxVluvx+D9vw==
X-Google-Smtp-Source: AA6agR4Z4GNQkKPx2618+Yx3uJ2OnJlyDGED3dqvxlo+cVGz5iUU0CvbIGstgsag2xp8k1LXRWiBpQ==
X-Received: by 2002:a5d:6102:0:b0:220:6382:eab1 with SMTP id
 v2-20020a5d6102000000b002206382eab1mr2932wrt.539.1660238186480; 
 Thu, 11 Aug 2022 10:16:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/10] target/arm: Detect overflow when calculating next PMU
 interrupt
Date: Thu, 11 Aug 2022 18:16:15 +0100
Message-Id: <20220811171619.1154755-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In pmccntr_op_finish() and pmevcntr_op_finish() we calculate the next
point at which we will get an overflow and need to fire the PMU
interrupt or set the overflow flag.  We do this by calculating the
number of nanoseconds to the overflow event and then adding it to
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).  However, we don't check
whether that signed addition overflows, which can happen if the next
PMU interrupt would happen massively far in the future (250 years or
more).

Since QEMU assumes that "when the QEMU_CLOCK_VIRTUAL rolls over" is
"never", the sensible behaviour in this situation is simply to not
try to set the timer if it would be beyond that point.  Detect the
overflow, and skip setting the timer in that case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 434885d024a..b7a420981f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1227,10 +1227,13 @@ static void pmccntr_op_finish(CPUARMState *env)
         int64_t overflow_in = cycles_ns_per(remaining_cycles);
 
         if (overflow_in > 0) {
-            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                overflow_in;
-            ARMCPU *cpu = env_archcpu(env);
-            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            int64_t overflow_at;
+
+            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                                overflow_in, &overflow_at)) {
+                ARMCPU *cpu = env_archcpu(env);
+                timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            }
         }
 #endif
 
@@ -1275,10 +1278,13 @@ static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
         int64_t overflow_in = pm_events[event_idx].ns_per_count(delta);
 
         if (overflow_in > 0) {
-            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                overflow_in;
-            ARMCPU *cpu = env_archcpu(env);
-            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            int64_t overflow_at;
+
+            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                                 overflow_in, &overflow_at)) {
+                ARMCPU *cpu = env_archcpu(env);
+                timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            }
         }
 #endif
 
-- 
2.25.1


