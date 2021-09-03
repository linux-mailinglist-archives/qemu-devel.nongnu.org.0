Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5888B400084
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:26:16 +0200 (CEST)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Cx-0006Wr-DX
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91Y-0001yY-L9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:28 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mM91T-0003bf-RK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:14:28 -0400
Received: by mail-lf1-x12b.google.com with SMTP id l10so11694535lfg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZI0NUZRO7vu+9LyPmqcshPjbI4d0gEmRAaBgXSjJvo=;
 b=HGiX3k1mr7XUm7fUfsQ9UEfQFLi/lBr81Nmk/IjFvq/4kOHbstO22gZtVqKDXuKN5o
 k+/iMi2icwippGhiGZ3pPS2TaEdOm+oA45Dg0ezAsGwbwtDy77UMTdDjsukzdPnL1eM5
 wNOHSY+tSM+bV2N8KxYHVxK9k3PJh2xyS+gKOpx1BtaE9ogsWP6oyK9eaRGFB9FNcQn8
 l0TPlKOAjxccPr67LQua/4tmv7sUFKYRdFqtKHPHgv5JAOAqOfaTM0OGyvsCH4VcTNXQ
 vViGPZK1nkjj2spv1jk9u/tlccWX058B5UTyF+cboVCwb7BU2iSsh7KXQ59LuGcQEK+g
 1NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZI0NUZRO7vu+9LyPmqcshPjbI4d0gEmRAaBgXSjJvo=;
 b=OwJxw3Qk7WiQa7FOWHdCvD+5KkEntNurpEs53KbiORL4hxcF+AkHzuosN1fl43KDCz
 t2N1mGaqk4WcovAw7LtgbRfDi2nVRqTsvRljssJB5LdiajidjrGhKXVTCWvBmaUBdafj
 P+QHenz/Jahrot0n69B2Jb0gmtQCCw65YJn23Oh92tk73n6LGFgq/iTWy/pPc6hgx5ok
 mXPlx49KFoWyy7noLB7gdNbkafQSFdQCqICM0A1jYmi22EO4iTG9cO+q50dIWwnxR+vP
 5O2GDYO6bisgDSFoMeQRjc9JGVwu/ghjzJ1dpnzDKAD6kg6ujzWY61FprSVevaVBM2xZ
 2yzQ==
X-Gm-Message-State: AOAM530vXBJVYJfCECaspclugW5sGQ8WChQMv7J8L06i26mq5FuaGQSy
 sa5EnvBKtbjpRDj1N9yL4W4moQbtuD97id/lrFE=
X-Google-Smtp-Source: ABdhPJxj2m6hKEr12igLciVC0JdZMr0gAyIe8pgqAtPVeg3As69cj1G34bV4gt5u/MVTsF9yAcYn6w==
X-Received: by 2002:a05:6512:39cd:: with SMTP id
 k13mr2792207lfu.258.1630674860676; 
 Fri, 03 Sep 2021 06:14:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id n5sm577995ljj.97.2021.09.03.06.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:14:20 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Fri,  3 Sep 2021 15:14:04 +0200
Message-Id: <20210903131417.2248471-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
References: <20210903131417.2248471-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
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
 Kito Cheng <kito.cheng@sifive.com>,
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
---

(no changes since v3)

Changes in v3:
- Split off removal of 'x-b' property and 'ext_b' field into a separate
  patch to ensure bisectability.

 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..c7bc1f9f44 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -585,6 +585,10 @@ static Property riscv_cpu_properties[] = {
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


