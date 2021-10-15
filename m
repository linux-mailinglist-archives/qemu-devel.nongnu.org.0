Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3942EACF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:59:06 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbI7N-0000pZ-C9
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvy-0006Av-Fc
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:18 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvv-0002Ez-LW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so6681941pjb.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceVS2a0QtsUGpqYpmzRCrOWwX9N9ajyVypeZlgl5et4=;
 b=GQ/BzyKKd5CoK0aI0h8ieOdCXEj/Me2+hmbPvAJVM0L4xYB1Tbk52BSl5huP3L8j+U
 e7mCX4kLICT8ttcnqxwE6HEJtiqj0BCewL8WovpD/ze9AEbPAzPIThUAkPSHDRapx6W7
 6UNTdaA0en30jtcGHaS6cXpeTtGZDQTfGDyJ3rL0771ImbiNtUEhae9JiL0KgBgyv3BI
 6NUKWsS5TIEd+OmcACvjpyKrh7i9+0aIABa/+iqdUk2uyE4HAob7mYL5uzU2ddJeawHC
 NiA8yz+i+p7kyQv7k1zHuR+f6IvnmSY1u5stEjiPdm7fYDQ9OTSJb8nanto3mmlT23ll
 YR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceVS2a0QtsUGpqYpmzRCrOWwX9N9ajyVypeZlgl5et4=;
 b=bGylmJc8EccDZSmjU33USMzr8PFEELvaVEkzScopOvvM814EKn+0Y8IBF2dMl3wN2e
 xGYQH/7IJTy6KjtCvqlExAnDxEdsOiD1eVEFT7C965jaiahWGyvG4qU/JrxR0yMYBc1E
 2RpqA7NQVfnCKQsgw7m8yr5eWcrKzOyMiSdSvRM/tVnYUGzlaccwV8cg6VVIg3N1khee
 B3CDQ7KDin1KpwWb1njJOY6HVfh51EOvHlyWH2rlvVmH2szrphGwOASWsGsy7M9MCxRf
 vweYC5zOV078GBtkKWzf3a7jVkGkgETQGo2APjq4tkfIwG5tQ3+0jFh2rDdPjn5AlCTU
 Xc+w==
X-Gm-Message-State: AOAM530jORWfOx21GxzPQk0QnFm0f+qqcCA7fGqyctCAJ2W4zNX2Fv+/
 z1RyObbLo49ZBJWHi2UOsg5Qy53B670Ncu/K
X-Google-Smtp-Source: ABdhPJwDviynDjYSnYmPRCoJWpgOzgyum5HOeGYLNGtRO6JfGb6tQFUaW67H/yW8YHR2pQi8/aNCEw==
X-Received: by 2002:a17:902:b616:b0:13f:7983:21b6 with SMTP id
 b22-20020a170902b61600b0013f798321b6mr9146939pls.42.1634284034189; 
 Fri, 15 Oct 2021 00:47:14 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 10/78] target/riscv: rvv-1.0: add vlenb register
Date: Fri, 15 Oct 2021 15:45:11 +0800
Message-Id: <20211015074627.3957162-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
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
index b8816822b81..849b100b3b7 100644
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
index 57591753059..0fb71875654 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -275,6 +275,12 @@ static RISCVException read_vl(CPURISCVState *env, int csrno,
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
@@ -1555,6 +1561,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
+    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
     /* User Timers and Counters */
     [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
-- 
2.25.1


