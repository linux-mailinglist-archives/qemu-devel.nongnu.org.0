Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB124078A0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:06:50 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3eb-0002Ub-1Y
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YS-0002Qn-IT
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:30 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YO-0005ce-TV
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:28 -0400
Received: by mail-lj1-x233.google.com with SMTP id o11so706052ljp.8
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qMycYKQP4HcNWkpkCW+qjMMp3vvgW5hq/1ItbJrV4ng=;
 b=lP0T/gRT+Qa5zuLq6qTqcbt8cSyGFyckwFwa46h3jLw2ISKYxWiEomi9Sx33XNk28w
 kEgWD6HEKEi1jmqHGuCQhuQGUeLxlVvXT1rF2bfEL9jdKP5Fufs1N+l/6z2mvabqT8Kh
 zZvgya8zqDhUdW+VvMzwVLYnVnYC4oM5eAQNIB0HhUG/bAiVCnqu/BIByQHUGmZ46mMQ
 ukH7Sw/QCDVPq0MNK0JRL9zjsqj+vWWMnc/X8d3PoKCJh8H2cMoJcF+ALsDe8v3T/U0U
 hpAhM7BivEqqEi6kiHqqYVHkFq75NoAGnp1oWeW98mcONu6qURaKAIgSKTVjrcKcKy5f
 4bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qMycYKQP4HcNWkpkCW+qjMMp3vvgW5hq/1ItbJrV4ng=;
 b=sP1I7m3S4ppzmnWTdiVTKbjfXSlNxzpugJ3FEszXoDQTU7NE4HOegFyc8l95eAx3Nh
 EAaxLFF0PJo/ulUAr2gpjumPYDN88gfwt2/QTitbPtaoJg0qzPrZtafDSPxPDnv067tH
 7SZpgOPvPVKPcNS1sEyIe6r4InArHn/KEfw5QT1vY6QYjVFZFSpzjxVbIklNe3iCfgM/
 2nYh+4kw2fui5MwvFiB7DOsLjItLLzvvpiI+U06Del+C4jJJhrl/ERAhJs2oeAr5G3Qu
 RzkDqUGb+qjNIeZ/lhKF5x35YyOwqqGx8WG4JRV42Nd4oJdrwJmmuOOctWWc6aVEamXe
 JBqQ==
X-Gm-Message-State: AOAM530BQrnehwQvAEjH1mxGfFqL0H0yUgNYI6T1nfdhlouUUQZ/Wyfv
 ZuH/wHk47b+phsUoLjtzSiLwFESLed1a0Wxs
X-Google-Smtp-Source: ABdhPJyzf8EF5udI7Bq4cpPo3phu6uz5jpsEngHpzrQLizF2n4NmKxg3LY8Uvk4PuujsB5TyIAi54g==
X-Received: by 2002:a05:651c:1b3:: with SMTP id
 c19mr2393404ljn.16.1631368823341; 
 Sat, 11 Sep 2021 07:00:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:23 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 04/16] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Sat, 11 Sep 2021 16:00:04 +0200
Message-Id: <20210911140016.834071-5-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bitmanipulation ISA extensions will be ratified as individual
small extension packages instead of a large B-extension.  The first
new instructions through the door (these have completed public review)
are Zb[abcs].

This adds new 'x-zba', 'x-zbb', 'x-zbc' and 'x-zbs' properties for
these in target/riscv/cpu.[ch].

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v3)

Changes in v3:
- Split off removal of 'x-b' property and 'ext_b' field into a separate
  patch to ensure bisectability.

 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579..ceb7e01810 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -587,6 +587,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
+    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
+    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
+    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
+    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..7c4cd8ea89 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -293,6 +293,10 @@ struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
+        bool ext_zba;
+        bool ext_zbb;
+        bool ext_zbc;
+        bool ext_zbs;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.25.1


