Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E9A67552D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:02:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIr0R-0007RE-HD; Fri, 20 Jan 2023 08:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr0I-0007Mi-R1
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:00:22 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pIr0G-0006Hi-UZ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:00:22 -0500
Received: by mail-pl1-x629.google.com with SMTP id d3so5232109plr.10
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=l6ZB0DFwPcu0v18d1WUWdk00j0UwcY2hRLsDNJ9W4WQTug5eufdiXyZ9zZ4dcJkU1l
 +rsgtlyYCqq2Xqtkpa7dDFpOrZcT7Y2L1K0hBYkKuWqyjzx7Qv5+eNLQi61wb4Q/dbhs
 sx2cQ65piApC18YN6z/okQd1Cwkhoxokc5TOR5TMR6Gkot5G/HPqS1X3w8RRG6UE2Urc
 6D/TgdYEhWZpEFwgkoqNwc0b8+67B+paBvYxInLmLdpsdkArh+wURJ8suQFAajPfOZKU
 Q9GRijELNCUx2LbUerX4GfMVN6/zHROuxRHC7y0D/NHZkx15jPHFciKosFc3PVVUkl1U
 AZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=s27yP7zXEpDiUQsLOfj1eQTDReikG4QPuHXUr0W56karN8QB9vR02KfA6Zi0FUpu0a
 mNYCJBgxRqAjbo7WmB6lqRpwWKqbt4Na/+90j3EukjDS3XtPmFuQhpCBnQodxJhSrXyu
 OhSEcz44X9GbhwAz7zxDLTx7G8xLhF2alXo36cJbjIXWJjV+p2sfzvf0dAeAMEe4kZgW
 zapGGVeSUz0QqNSnkiSG+P6NDmgoApRkg+qtv54LpmXiGhDeFFMXcxQrBVUw25yVXRbU
 QsykalL04zjmH12I5zdfoaEpTqf2ckqz5Q2jH/GS+pRmh/NDbUploN9vpa+DJ49Rkw94
 m5GA==
X-Gm-Message-State: AFqh2krSwLNQq5XEikJaVWX0IYV7u9WgL7OYEHnTgDzCZ2AQEfB6YvtM
 yyO/BcS3928cLR9Fa7nfHG8W9A==
X-Google-Smtp-Source: AMrXdXuuyhIYUn+WjwQ1F1lApMhscds+yd4usswIglrlY4Yw2RGHSkCdCpIujSbGKcG+kppdUqRFLg==
X-Received: by 2002:a17:902:e5c9:b0:194:d0ad:53f0 with SMTP id
 u9-20020a170902e5c900b00194d0ad53f0mr7405861plf.9.1674219618781; 
 Fri, 20 Jan 2023 05:00:18 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170902e5c700b0017f72a430adsm7279610plf.71.2023.01.20.05.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 05:00:18 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/4] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
Date: Fri, 20 Jan 2023 18:29:49 +0530
Message-Id: <20230120125950.2246378-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120125950.2246378-1-apatel@ventanamicro.com>
References: <20230120125950.2246378-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The time CSR will wrap-around immediately after reaching UINT64_MAX
so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
in riscv_timer_write_timecmp().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/time_helper.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 4fb2a471a9..b654f91af9 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -72,6 +72,30 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
 
+    /*
+     * Sstc specification says the following about timer interrupt:
+     * "A supervisor timer interrupt becomes pending - as reflected in
+     * the STIP bit in the mip and sip registers - whenever time contains
+     * a value greater than or equal to stimecmp, treating the values
+     * as unsigned integers. Writes to stimecmp are guaranteed to be
+     * reflected in STIP eventually, but not necessarily immediately.
+     * The interrupt remains posted until stimecmp becomes greater
+     * than time - typically as a result of writing stimecmp."
+     *
+     * When timecmp = UINT64_MAX, the time CSR will eventually reach
+     * timecmp value but on next timer tick the time CSR will wrap-around
+     * and become zero which is less than UINT64_MAX. Now, the timer
+     * interrupt behaves like a level triggered interrupt so it will
+     * become 1 when time = timecmp = UINT64_MAX and next timer tick
+     * it will become 0 again because time = 0 < timecmp = UINT64_MAX.
+     *
+     * Based on above, we don't re-start the QEMU timer when timecmp
+     * equals UINT64_MAX.
+     */
+    if (timecmp == UINT64_MAX) {
+        return;
+    }
+
     /* otherwise, set up the future timer interrupt */
     diff = timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
-- 
2.34.1


