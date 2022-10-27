Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8243260FD83
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:51:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo64e-0001rt-My; Thu, 27 Oct 2022 12:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo64Z-0001rY-7P
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:49:39 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo64X-0002WQ-SB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:49:39 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id z189so1694029vsb.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6iyPZgBe1iNrOkj3Tn5anzDtlrl3yPzW0hHihe0EGPM=;
 b=ECxWNsV0FtSHhvz6c0DnFrVuUI9MOzC8aDQY1tWUGjLhux5X7CTMq3Jlz3QbWsb1Uz
 5a44Bd+9mk93CGX0SrO3GyRYU4zf8gtgvCZr4dT/ApzBDdfbWzzPt9n/xOv2BPQXssDi
 +GMNWClzglZmDG/r7+FNSi8BUV9iZaHyL/QmvcGxciq7ruAzy/9Cq+VtjOAYK3sqSbFH
 QYMXBL5zY6L/0OGd5of6CGuxKkpGUTrMKUp0A6ib54G9ByCM5IQbCU151SXPjrG3Cd9r
 aj6JOAFVmqTHbQuB6QwwkWmrIHM7tahvYHJ/vYXSlCqMLzGt/TdkPbWZplRAanMFo//t
 wXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6iyPZgBe1iNrOkj3Tn5anzDtlrl3yPzW0hHihe0EGPM=;
 b=rL7Hdu4BWsnAYV728keqUyqocG6Py3o8/osVgbUmy9f+zQ5NdVau8D7ZqUPrp/aKhw
 SnKDZv8Ltqm75JnJqpnQybtMnP1tmQP+F8xKFWbhINoKEErULS4wL9V1clSDKm67/tor
 dffjviWH6uDs07dcZmRdBZ+rFv+3MoZvYXkVBlK4+83Vy6HiFG8ileM8A4DYmoapCl/t
 FhOcQOsrAsmk/7Ff56ZyIxqSkCCAyV/VE2ema0pLmeo2HTdcmHTQg8nvgiJpjT0N2GKS
 whH6gz0zxXa27vP8ZAyMEASpofFAtzHSdAz4zhMUXmguxdVy+qiLImGN4xQkCNNV0MhP
 FmZg==
X-Gm-Message-State: ACrzQf2DSHLcs3Rg+6yPL3R0yX2M2IhX66O4KY69gzvoP+s3L0SiqeRG
 J8LDJQSJlXoC7vCg66rFm75UYmUBF3ZkMA==
X-Google-Smtp-Source: AMsMyM4yMzwuZ8mGv2RdzC1qMz7NIaG6yHQGOes7mYpraDGEIDV+zyNhyVLSJszOYT5T4wAGpLZ1qA==
X-Received: by 2002:a17:902:e888:b0:186:a6be:1106 with SMTP id
 w8-20020a170902e88800b00186a6be1106mr22114793plg.150.1666889286771; 
 Thu, 27 Oct 2022 09:48:06 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:06 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/5] target/riscv: Typo fix in sstc() predicate
Date: Thu, 27 Oct 2022 22:17:39 +0530
Message-Id: <20221027164743.194265-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=apatel@ventanamicro.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We should use "&&" instead of "&" when checking hcounteren.TM and
henvcfg.STCE bits.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..716f9d960e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -838,7 +838,7 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
               get_field(env->henvcfg, HENVCFG_STCE))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
-- 
2.34.1


