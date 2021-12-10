Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373846FC88
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:19:13 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvb7Y-0005Rd-8z
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamv-0003uR-Qu
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:53 -0500
Received: from [2607:f8b0:4864:20::52a] (port=39813
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamt-0006H2-D6
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:53 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r5so7385538pgi.6
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcsDPibscCiTXvE8KRoEbfZH5l4lfx4oH3jY78KeevU=;
 b=I3V/cTiqKtuKa+3ncgnkzkkoS5xYUKfT1fQ4xQWNhPs03YEJKNWUMOkPQHRMwJ9Er+
 y8nfw55huFK09Myp0X9ILbOFQ7d8/ClFiCVFP/7nfnW9FPyTck+zc2IbzCqlhhZ6kGll
 t5u6Is31rBfPk+5qNPD+TEwiNg28DliWX2PJT/i9nFfmGp+Sm1NuOcKwGsKy2Im2aCuB
 kUGISi2mqNojwXiFl4NNO8mvgL1wZBDUIbSrDJeeQqHGVhg0cEN+H1C3a2kZpOOQHXQA
 c1EmHX3QPW/Gd5bdo5784oYhAQcYS1wnpZhhI7IDgIWX55uEhkTzHTr4Ml1OsclwX4s3
 cVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qcsDPibscCiTXvE8KRoEbfZH5l4lfx4oH3jY78KeevU=;
 b=FqLnkVJzrg5yYzQYC2IvI/r3gew1G51xy027dpAyXp28mAyb7ftFyHzc4QMdAcfqKw
 lTvI72nBvnnnqm3WSa3ZOP+mDBg8w6LnpFUVYGpI1n/XR9FOfOxSVz0bL/OFhJ2MUxw/
 K9+FcNLZWyRrDYu1JphM8F5d9KNG180x22XJAv1Z/Bw90XEcFQ46sxNl8wl5s0GqpbhA
 Rij7pwex2aO5ZguwIPC298CeaZYM2K4xsX6h3/rVan0n6WueYsI277MkQGrFMKv6EbMl
 5NGytpLSrbCUsOG+qHVIUrzhshD1uqy5ZR8WkbR8cpUJBH/XZIsY1qNqDh+zqVZijfy8
 R2MQ==
X-Gm-Message-State: AOAM5301YlWkRCBy1Sk9ve7vNp63M6BJEDIGeLZsMSdVaIl8j2grcdQh
 b7pyhyFsj1xIOzeT3eObAKzL6vR6bEZPCk7F
X-Google-Smtp-Source: ABdhPJxtQoxYKga2XPk6iqmWHnNE5vnNzo3sNu+sBh/BBxOdCQxDm9z0xpcGU0AC+V6DI8QnwXpbig==
X-Received: by 2002:a63:874a:: with SMTP id i71mr39072806pge.93.1639123070055; 
 Thu, 09 Dec 2021 23:57:50 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:49 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 10/77] target/riscv: rvv-1.0: add vlenb register
Date: Fri, 10 Dec 2021 15:55:56 +0800
Message-Id: <20211210075704.23951-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 8dc6aa62c6..1e31f4d35f 100644
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
index 832ccdcf33..5d1eec1ea0 100644
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
2.31.1


