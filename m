Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F5481C48
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 13:59:39 +0100 (CET)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2v1u-0004I2-8P
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 07:59:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufr-0003gh-Hy
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:51 -0500
Received: from [2607:f8b0:4864:20::536] (port=34672
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufp-0003Sh-Vt
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:51 -0500
Received: by mail-pg1-x536.google.com with SMTP id g22so21346737pgn.1
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szxG0zC+dinkde1NF2ex/5I2Wd5dXXIcK9MoqYV/l2c=;
 b=KTrZzzqAUw1HcQ9IhOVIIvpTsnp2cQ8JZ3UupQNTDXXreJ7gvoAEjV0b+SltybBAqB
 hdHDYCCp9Tt29RpXMTY4TVGkHswdyZUh+Q33VvVqP267IFzMTZyh615OLYJShSPGUuA6
 O7KjR+hloc2Lcltu5IhJtvKm78Cz9F7bJ4t+4OLKKdqkxO5mllUFin9Q0ssnrhYQf37U
 a0hqLJ/7j/h0BxXj1T5HgR0afzK5pg0zZJI5LzW0VrTDvlGxshC36c4io70AYVGfQZLp
 JxOxrLukLQBtCC8J/TrUOiXOxGlnkt0HPjx2hHSGZD4S1I9XJRmYotz7Hklt2rieJTpW
 1Gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szxG0zC+dinkde1NF2ex/5I2Wd5dXXIcK9MoqYV/l2c=;
 b=3bNpyqENma1EnFx3GGFADrjbmAHD7NV1KR5VdJYb1YYzKdq0SAaQxZ0LaEvpmVk71F
 WxcPOksNnzVOIW5LfAO271L/frbB7qLEUaID/SYoXNyupu6AcnZ4GsU5/Ihe5K0e7UxI
 0u46VGDnomkfAzoufEp3Ib3CZjfWmO7dJWWqgEGmuNFbnmRTzhSqqLRdu1VS2AJHe36+
 B6xj3bxbJjRLMS9l7jclpgrPF7z0rGhc66Iz1sKUTup8Ib/h4FttEB13uPfp52fCe+XU
 sg2A2yYGmO4I6htQNKYw0LM1wqUTZiHDKJu6hXo+6uGtZa+qjF8BOeIrjPtZRBC8epUr
 nmCw==
X-Gm-Message-State: AOAM531QJXa9AiLBMfVMn4HeH1fyqJITybyrQWWDGZpRlq0lxTl9dSik
 h5CSt03ojy2Nqvab6aLmGoElAg==
X-Google-Smtp-Source: ABdhPJw6UM0m9sArf6qCEyiyO3wJInQb6JF89Js4HOvqP/t0+pBwc6sysknGtpl2SEhORYXho80IbQ==
X-Received: by 2002:aa7:9482:0:b0:4ba:d167:ffec with SMTP id
 z2-20020aa79482000000b004bad167ffecmr31122893pfk.57.1640867808489; 
 Thu, 30 Dec 2021 04:36:48 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:47 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 17/23] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Thu, 30 Dec 2021 18:05:33 +0530
Message-Id: <20211230123539.52786-18-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9ad26035e1..1ae9e15b27 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -463,6 +463,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -691,6 +695,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 82272f99fd..0b24c4324b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -362,6 +362,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


