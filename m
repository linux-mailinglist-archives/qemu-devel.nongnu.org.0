Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B902B7907
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:46:58 +0100 (CET)
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ7B-0004Al-Mk
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIu1-0002jp-Cz
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:33:21 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItx-0004uz-S2
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:33:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id r6so672312pjd.1
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MgJNQhLt/SKFFCYwY2lhOXrS0IzY7NOkAfWFLkGpiVU=;
 b=LxydiKLQ/HeaeImgKvSp1Iyw9CXOpcLHye+GZ4Fi8AJnBhtjxj1Nf4RWFjYvCS83mB
 JtX5K2uAOcaVRInFdg5T403WxyhPVBpXW7HB4Mvl+wew8Dol8uzcSoLH+DQZrHIvPErd
 KNhLN+ki7xvR2LjBpV9KIIYLRBwQ6H0mGhjCq5thJ90aQs1FoxxxcsnEZG0AWnVZTML3
 aMeYkvSMsd2wOgq3QO9k98Df+l+L2eTrrAIJRC4xfwvdQ22VWXXtLDGpE+qtXfJkqqxJ
 FJgSwBM81XRtb7E4pmnRIM21akUJGau4o7SZAFNc3cKJQIwiDtqvihO928kPeC6N2H/S
 FyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MgJNQhLt/SKFFCYwY2lhOXrS0IzY7NOkAfWFLkGpiVU=;
 b=ktxOe8X7rAXL7u5pH6Y54mAgtJbwhS+K3RlbTnUYR0x6d/cWcJ9goQHObxtK09U1Nn
 lJg35OvgrRpapJZvxkK7rn8pNmxqhPaxtvxMa+pcqKNadlChtsgaO4Ll/hY9FLo1Fd/V
 8wGwNFnM2ajMWnAFJTqj0uZMkL7UQ3efSWCUayqDxBbALFi13eRrodECC/0thYHxxgHE
 +LKV0BLA5lEVKHi0ZXRfj0XAPLEP/qkr5dWSP/+Feec9Kz5AGVwDYTHrbQ0qEV5GQuPZ
 imAuSQ9mPU5U1XZLtd6NeG3kVIWFsf6tYOBPOvA/QzDyjmO8b1KjPPeUjgpPlwWc0GRR
 95qQ==
X-Gm-Message-State: AOAM533d7UBtRNI09gYcYkByANujw1sj04ozSBMR9uSnen+sqik4uWc/
 rJDYef1z932w0qAEYvGtdZfhrUFe2Acm9NGveDQ=
X-Google-Smtp-Source: ABdhPJzCu1wvW/c/by5tkKkFUntMC+WVL3kKH5gk0Ieg0/vFRT5M3J4oYVPVsMSKxU/q0MThlNfKfQ==
X-Received: by 2002:a17:90a:de89:: with SMTP id
 n9mr3050085pjv.224.1605688396444; 
 Wed, 18 Nov 2020 00:33:16 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:33:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 15/15] target/riscv: rvb: support and turn on B-extension from
 command line
Date: Wed, 18 Nov 2020 16:29:53 +0800
Message-Id: <20201118083044.13992-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0bbfd7f4574..bc29e118c6d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -515,6 +518,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, true),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de4705bb578..c1c77c58a87 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,6 +66,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -278,6 +279,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


