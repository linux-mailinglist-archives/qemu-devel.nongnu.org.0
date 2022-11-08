Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C862119B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOBY-0006dB-OW; Tue, 08 Nov 2022 07:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOBI-0006Uh-8L
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:20 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOBF-0005rE-Df
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:19 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1322d768ba7so16131725fac.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 04:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=I0fQvR35NsBac/lA5tB9dg7ivIGVXG/70tNbsPHc459HqX4D6Uz1+gjUX7JM5wvbuz
 SorCh1LHylLoRNjgHtCVYasAEaZkGBfv/rEaBqZU2IWXR/tHCoGbxD9Z70pMXEa5rrna
 /NLEOLbXrgQRaq5BciETJf59KE6PwbYDvJHDOSg0EMRLXS20IVNHHVai0So/CbObWqxu
 FFTCWNPgMgf2yehyUZbm8zECIRR1lVlLxpmdhLVPcASIQJwINAoh3K3S/ArWSMiuBqXs
 o0usyWyVfrZm23TfvYhFPSPndtGm5Jhjpb+na4XLp0HIRvDL16C2ug/0X+zgpOaD84xT
 Fg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6GWMr4kgqdcL841ipfLZDMDmhXesxTjEaat87znEVA=;
 b=mPkf/tMMC4FGUsqo6kkpUvvNc79lGsPu3gwS3RpkqzcaGOuSKh3S81YjDrLnZWlUfe
 zOskmw6JeB4jNf376e4qxsKWCGTJUJi6sHOvdwifIHeHeHCI60eOWKJuTNDrCKYlflzl
 IAX3c/YnKkvC9JtCMzOjkLdJ8bmIDa02zz+aeZn4ywbH0DGpbSt3ioUrBKwNiAJwArum
 qS4KTFqUpPI4pAftXsf+9ksVe4rAPncorQvtKLAuJ+LZA38X57sTBAihwJrA7zyk0OtF
 xZTj3iDOjZBkXasvcP2VE4fnE+e6xmNBOBLc0DXOyEMCvvlHz4ApBgtsfy08btHPYzTs
 a7SA==
X-Gm-Message-State: ACrzQf1NqeuL/kBfOYnLfKIk83FeYcv2kRc5MWhTQNpPY+ZLM8FU082K
 o5MthdTm6T0xekmMprtNI+FPcw==
X-Google-Smtp-Source: AMsMyM41Rg1WOvW6s84W2IAblnX816c2VOs+Ps4mc0GoFwlkddZeOH0A8M26q/eqH1iH/4LCNoJcfg==
X-Received: by 2002:a05:6870:b526:b0:13a:e945:dad4 with SMTP id
 v38-20020a056870b52600b0013ae945dad4mr33517421oap.12.1667912295000; 
 Tue, 08 Nov 2022 04:58:15 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:58:14 -0800 (PST)
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
Subject: [PATCH v2 4/5] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
Date: Tue,  8 Nov 2022 18:27:02 +0530
Message-Id: <20221108125703.1463577-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=apatel@ventanamicro.com; helo=mail-oa1-x2b.google.com
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


