Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C8691FE6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:38:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTaA-0005MC-24; Fri, 10 Feb 2023 08:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa8-0005Lr-9F
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:52 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa6-0007VJ-Qf
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:52 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-16dcb07b805so115463fac.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ch4tWbu/JEzS1aaa3hvTm3XFuLQMoauAdXK/obqwH4c=;
 b=Hm99JznsjHTlkAou+Q1NA4+hV3NuCbAdqBLVSRitHUNEfXhkMofX0d81pzqqUAg/to
 EPG4vvNk620EsQ1z9WN3vjoMBfcp01dOLT5IHm47vF90x4PIUjZC7o/HZjAHR0O5j9ar
 J/300vHDW4HYZhtmWrCbhMEY+zZQI/G36XJo/2y1/+OyuYqOsfoyg3TDDo3X23D3Rnak
 dy9AR036oCM4UuywDSVssWLjbvpODLW2KjRAqQeZmgD5An5/bT1Xpo6ATs1FugY1NCVS
 Ko5px2MuopCG320qN82DA+L6KJWRU96IAUmGNRN96VN8PWjghb3zOedAwjBPNiVuEfSc
 VOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ch4tWbu/JEzS1aaa3hvTm3XFuLQMoauAdXK/obqwH4c=;
 b=dmMu96xygbJjbtbO1FApN6PxfWpxg2j7qjfZeU+hJtECYetQ+QbNAWnwlJY+NXQfHE
 FXL5ser7pdnYNLK0/0TBuvkw2vyME2jP4mPnqQPftm9SjTGZVtLuP6C/Eoi97RwYzqw5
 Dotvx57cPXHpxKmAzAvSOtI8u0cVqMpcQlBf5wpIWQ0S1lKg0cO5x/uGEnfcoirgUk2v
 nqLL7CnVcdHmeNRkcevYPj53kHUsomeXiuq9QoELTWyy8T/1kcF9L3xIskkCwvn7NmeO
 yLgDuJCqXQko2aMjPJz8E7pi/argZGzXYC3r2Fkbb+durkVaap4Hp0//e7+6/na8KfCu
 PbGg==
X-Gm-Message-State: AO0yUKX/pG65+V6/BGC4hHG8AOPTrgVHy3u1+mh1Ubrnbelam/FEBWHJ
 Uo+uwGdjyVdxZMEToL5c+HPv3mhYxZFLg70t
X-Google-Smtp-Source: AK7set9y4omY1TklJrtcV7cRygUcCzjRjXqN8sOpt32QTBDGyLBRixjPZpftdhJXmoL2cGC66FvjMg==
X-Received: by 2002:a05:6871:1c4:b0:163:79c9:124a with SMTP id
 q4-20020a05687101c400b0016379c9124amr7507534oad.51.1676036209382; 
 Fri, 10 Feb 2023 05:36:49 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:48 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 04/11] target/riscv: introduce riscv_cpu_cfg()
Date: Fri, 10 Feb 2023 10:36:28 -0300
Message-Id: <20230210133635.589647-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6509ffa951..00a464c9c4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -654,6 +654,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
+static inline RISCVCPUConfig riscv_cpu_cfg(CPURISCVState *env)
+{
+    return env_archcpu(env)->cfg;
+}
+
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-- 
2.39.1


