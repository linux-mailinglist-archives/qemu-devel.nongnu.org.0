Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14CD4B0647
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 07:29:38 +0100 (CET)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI2xV-0001Dt-Mc
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 01:29:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m9-0003cL-6b
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:17:58 -0500
Received: from [2607:f8b0:4864:20::1035] (port=41544
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m6-0001Qq-Od
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 01:17:52 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso4620289pjg.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 22:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60nuEGgulJM3JaNaNjaCkKMIpqE50/bKiRGitEwl5Aw=;
 b=AHBokYuwSqx+S6YzjFigBrcmrP2i1gGmjevKljFJKxMTjHhkoOyU3Go7/LI/Wrip9E
 d1cgBUapd4M52lglF3b3BOb4Szn+howM3dszyMW0F86mtAinh6HP3MWigkZH9y4jgpah
 0vjGwy7C3W+ZpjM5m3VhmVo5ZXpv69T5Abv92W1B2oA4bTv5JRjGiiplU16mgkUa9IKh
 M1KkOKzIEI/r3F898T3VTBsEaK0Ei78nMEqn6rXiwKLK2QY/4u1YbdC/0X/jFKvcimJ+
 UP7enLMT+3XtX5epb/B73paRp4qHSPQKdMqS10U7rg/iQAUZTfLaoLe3OZQUbR5jhGoZ
 Scgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60nuEGgulJM3JaNaNjaCkKMIpqE50/bKiRGitEwl5Aw=;
 b=Yrq2Y6c/GKzWLxl89s8S3xStN7YzqVeV14WU5vjZjSFkhH3j98ROX4XZT7HBtdnUm+
 eAGDge7nHo6a6/52klomll+YQAVbwj6SFjpT9zcRnXCJ6MdK8JgCh/XuWDRd2U+wzMMB
 jLv1P6K+WkTBW1d/SfunYAzSbufI41HaQIwzFu4o/OTh9tMoQtPApTWIv6Ex5LZoDZ6I
 qN5+gMfRIYGkLcl2n1OhZUMUraE2GTLAIBfZtc8QaIL77fIxO4IigdX0wM4ZMJSiqPsY
 kKm4RUVbWoacsx8kbz0z0X9FVlX46/5Xv1wbWZkZ491qUfWYhU1v1hJrPh2dhv5kLA49
 cmUA==
X-Gm-Message-State: AOAM5336YrPkjXeIwyTPks8lSmyKVt5bI2z53K9gOcuamxDPlsw2Uko2
 +0uSckNIh2D9RDk9dEMXAfIJmkQAZUZoYXa+
X-Google-Smtp-Source: ABdhPJzPMQ8zkFF98yaHZxC1yPMxU/iW0xAJaN3R4ideDEEme3Ny6OmeKXrJ5yG1c44hwXrnEpB/kQ==
X-Received: by 2002:a17:902:e851:: with SMTP id
 t17mr6077478plg.54.1644473868776; 
 Wed, 09 Feb 2022 22:17:48 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id q2sm23110266pfj.94.2022.02.09.22.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:17:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/3] hw/intc: Support 32/64-bit mtimecmp and mtime
 accesses in RISC-V ACLINT
Date: Thu, 10 Feb 2022 14:17:34 +0800
Message-Id: <20220210061737.1171-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210061737.1171-1-frank.chang@sifive.com>
References: <20220210061737.1171-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

RISC-V privilege spec defines that:

* In RV32, memory-mapped writes to mtimecmp modify only one 32-bit part
  of the register.
* For RV64, naturally aligned 64-bit memory accesses to the mtime and
  mtimecmp registers are additionally supported and are atomic.

It's possible to perform both 32/64-bit read/write accesses to both
mtimecmp and mtime registers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/riscv_aclint.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 3b598d8a7e..e7b103e83a 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -126,9 +126,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
-            /* timecmp_lo */
+            /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
             uint64_t timecmp = env->timecmp;
-            return timecmp & 0xFFFFFFFF;
+            return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
             uint64_t timecmp = env->timecmp;
@@ -139,8 +139,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
             return 0;
         }
     } else if (addr == mtimer->time_base) {
-        /* time_lo */
-        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
+        /* time_lo for RV32/RV64 or timecmp for RV64 */
+        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
+        return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
     } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
         return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
@@ -167,12 +168,17 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
-            /* timecmp_lo */
-            uint64_t timecmp_hi = env->timecmp >> 32;
-            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                timecmp_hi << 32 | (value & 0xFFFFFFFF),
-                mtimer->timebase_freq);
-            return;
+            if (size == 4) {
+                /* timecmp_lo for RV32/RV64 */
+                uint64_t timecmp_hi = env->timecmp >> 32;
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
+                    mtimer->timebase_freq);
+            } else {
+                /* timecmp for RV64 */
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                                                  value, mtimer->timebase_freq);
+            }
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
             uint64_t timecmp_lo = env->timecmp;
-- 
2.31.1


