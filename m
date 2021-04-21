Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E610366458
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:23:37 +0200 (CEST)
Received: from localhost ([::1]:41384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4Om-0002Yj-Cx
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GV-0007TE-3O
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:15:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GS-0003O3-JC
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:15:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id w10so28539305pgh.5
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BwZRS5GJWG/wYNy5H36IQKvFFYR9qB+pAAXqNNytdRg=;
 b=lQ2nJGS+aeExzgGvCfFOs9bwLmT+xqwY6IjoWZJXLZR97YCUAevXG9DwpgUXidltvo
 zlDCVcHIyqgvC1ADHQWfCSk9Mtph/3dZmFbvr8StJLTV8biqymf4SsBh1UBCnJofRU7c
 VU2RhiLUaBaUl3zE0t5djWsVRhwfZ00OKO6nULqm7Fyh/HESO36/A6TJ3f7h5TvDrnai
 ko4f+tqQIV/zEoF9oisHNcxnZOWVX4buNRIvNFhs2b/I1THiBNFtsqK8gr39RggYrqA8
 a88316INulvQZg+MBaJjE7DwAktyuSnZwR8DzKo8rG9YkeperIjp9AW/1Fh9PDjsgzH1
 bNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BwZRS5GJWG/wYNy5H36IQKvFFYR9qB+pAAXqNNytdRg=;
 b=E69OuPPuQ+YMGi3MaNMcir3LCI2rk0e8F+7dJq3GJFMRJ9nY4qeH5RmIp7JefOETbW
 1JPceb4RdCybUGd7/DQKRtyEO5ztCGrRVFartnYVdypW42Bgiqblr7pl7Rzp7OWsgjWw
 UskJThIyVwAsvbhb6hLYxZwTSvzIPZQjn9Oh6nqq75YvEhgBJb7L6K4c3YFd4o9I5WtH
 shAoWkiQTC9loffsSLRtqK4fz9bg9f5CTnhrCcBVzjl/+8hE+P6bYg8gNkOGYdbImuZ3
 dCTo309L7Lfqy5aQ5ouQ04eC4T4/mh8nMnbpWwsr80L8DNNg7Dac9YgbOSeO6xmaW911
 JfsA==
X-Gm-Message-State: AOAM530mQmgWPOZ2ljPmFwXhoiGdcmimmaYkwpjj8JL7JnBxPG3d3pYn
 gQj2+Q6yc/JTGfIHVEBM4z+P3O14FKC4Wwsd
X-Google-Smtp-Source: ABdhPJw+9gkKS8ZYJMZsOK4WKn86W161R3Stm7JR9lngbLxrQdpT9IwB9GKgnUXlTpB3phlFZ9EJ1Q==
X-Received: by 2002:a17:90a:7893:: with SMTP id
 x19mr8989185pjk.3.1618978499176; 
 Tue, 20 Apr 2021 21:14:59 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:58 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 16/17] target/riscv: rvb: support and turn on B-extension
 from command line
Date: Wed, 21 Apr 2021 12:13:58 +0800
Message-Id: <20210421041400.22243-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b6..8464a152d14 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -473,6 +473,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -543,6 +546,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba8..97073bb8e27 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -288,6 +289,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


