Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA8460D00
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:09:26 +0100 (CET)
Received: from localhost ([::1]:59118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrX2j-0001Mh-Sb
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:09:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyB-0000pM-SG
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:44 -0500
Received: from [2607:f8b0:4864:20::1030] (port=33465
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxy-0008Re-Si
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so10846434pjj.0
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbSDlUb46Zy7F0MfwTJOq6CpMFSbzyMialZNGzKfRZA=;
 b=IA/Ak0bEBmMP9YoXWPAj5sHaOr6nuS9idqhXwYLCoFPPtDjA7DBTzV2rrEDy5kK7xu
 4WoanpCDHIw7/JasTbQEt8QqvLJ5p/8vavuR1v35qxhsVL4uhtrGh14DPYtbCXXqPE/I
 6kGjyD9mC3DHaRIca+RgQE+OsMcSJ+wMwszfx1ZlU2mn/X6Y20YwI40CnnWpinRKXHxG
 6dYLtAW+bLfsyHwoAWa9vjX1Kl/X3PtGqKwj5p09uJfSGB1si0FBB8birXEf5hKATRzo
 OHuwxNi8ScR90pvNyY2yEB0/SuQmxSrbgz8d8iigE/aFQcTZS5R4T5FBt9ycZPei6EXI
 cn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbSDlUb46Zy7F0MfwTJOq6CpMFSbzyMialZNGzKfRZA=;
 b=js0O9UbwkTbVrXqF2CFZhqRIUwzF+jg2tSVhArjnfXxDFjfc+fA2TFpADxteYPUdXQ
 7qabRR169LD+zgy7CZlk+ctpOUVpqKD+hufAIxWQSvAH/0Do7UrFGYqsh30ROxZkwt1q
 2jE6Gk+wQmeUJhIqdqUGnO18m/AtDW9wcaQrwIZZxz80PRx7GSxHfCpfOstOerfW1ByA
 KyOtig7tw4ZJWv1l2N997QHkzCovZMD+7NPT8mO3UtgRCfJLyvUxaFypWb2wlzUGqjPq
 gdOajZH79SIWpencojCqWWWe+khZUx5/t8nSJphEApY7k0Qg3RNPhDf8vcPJjZz1mzxb
 z89g==
X-Gm-Message-State: AOAM533iS0KMEGel/rR9LXVmxfX8VrsY83AQftV50XC8OYtnwDfFccbC
 9elEGzRDhW2MiJAfYB0c+6WF4OacrYuPbQph
X-Google-Smtp-Source: ABdhPJyYwzVPIK7JZxjdR5qSnpQbj+fiITk3o+YqpYOQMxHitWRzLveqpvYFuNrY7AaksVSMOn+kjQ==
X-Received: by 2002:a17:90b:3b48:: with SMTP id
 ot8mr35866405pjb.78.1638155069079; 
 Sun, 28 Nov 2021 19:04:29 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 10/77] target/riscv: rvv-1.0: add vlenb register
Date: Mon, 29 Nov 2021 11:02:30 +0800
Message-Id: <20211129030340.429689-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greentime Hu <greentime.hu@sifive.com>

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8dc6aa62c64..1e31f4d35f5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -63,6 +63,7 @@
 #define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
+#define CSR_VLENB           0xc22
 
 /* VCSR fields */
 #define VCSR_VXSAT_SHIFT    0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 832ccdcf331..5d1eec1ea05 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -285,6 +285,12 @@ static RISCVException read_vl(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env_archcpu(env)->cfg.vlen >> 3;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_vxrm(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1835,6 +1841,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
-- 
2.25.1


