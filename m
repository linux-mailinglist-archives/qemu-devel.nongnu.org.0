Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227952F2649
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:31:26 +0100 (CET)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9Sv-00039j-6k
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9JK-0001Zt-PZ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:34 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9JF-0002HW-KC
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:30 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y12so676249pji.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 18:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5HXgmt6k/G8n17p6GbhXA6B9PdJjhLw8veADH8tZoHg=;
 b=gL3moGeyO92ikwW+1bK67EMseK4g7Lgjy++B8dpDgw4guL+TcclAXkLMaz01lOPC3A
 EM0Bl/FYmAh9eHsJ2tTBRS9Nq7J/s9YWAg8/nOTbtFp16R1H8Mrjt/geeiXaASxPo3ig
 +WHW7SnAyXmafROB1ATeCSk6ZqIlH4BH8POQm6WZM+gSmzbUjqMec9R0fqZZwgfr+615
 xuO4XtPOnkqwqTTQm2VhAVfXtqMoc131CEx95bm8wy2OOlqA9d3lRx23vdROhzYvJJA2
 +Oyw5edTVPBFpmxg6cTzjNn0FKtssGoVAdYBWJDA9aepEM85JzBabWPmq3X86pgT+HvZ
 yCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5HXgmt6k/G8n17p6GbhXA6B9PdJjhLw8veADH8tZoHg=;
 b=P0Sy03m74CKcOFrNqhD1wraTKx4iCvAn+7x4f5ixD4Ec/ZL8q8sw6xsb7xwFOZC7Gm
 mcliY2xcVV7DYRrOkZRkIldp5/X54KT2WdTsAV1IBINLIFsei/sEtM1QSAvTXZdR3KU5
 1aaLCAO/IAIaXgw0k1+GEKbkwYm2qMgepUoXXiPfCO6PdlKduGy0hKHk8RuD9oUdlEJg
 PiIOTbcuYrtZZuoQij3gquCSyvJloL8COsGEJ9H25Tg68Xwk5YHRrqrWG298aMof2WOb
 imDLTmVYd8ybrryjYIKuapmkmrqBGDSzOtpQE7pzqLVzLy7MTnebs8jCeu00rx/8FxPv
 +Tsg==
X-Gm-Message-State: AOAM5312YqZ54hWlB9fn0IJM5I9N5ocHoX1Kv2Ihw1bmOdlS8c9IHvJw
 X5pfJG/C77NIhUKv3A7PHnTJlk3mlctuWUdT
X-Google-Smtp-Source: ABdhPJxPRFrxgXSHJPrfNjSGKFXOITRVz8cNBLqDuji8QqW5oGH6KIgnJIJAwKJVM0eHBal8Y3DHOA==
X-Received: by 2002:a17:90a:f48b:: with SMTP id
 bx11mr1960463pjb.48.1610418083591; 
 Mon, 11 Jan 2021 18:21:23 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:21:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 16/16] target/riscv: rvb: support and turn on B-extension
 from command line
Date: Tue, 12 Jan 2021 10:19:57 +0800
Message-Id: <20210112022001.20521-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8227d7aea9d..7379a0abc6c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -472,6 +472,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -542,6 +545,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6339e848192..d5271906db4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -282,6 +283,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


