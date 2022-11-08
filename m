Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3F6211A7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:59:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOBR-0006Um-69; Tue, 08 Nov 2022 07:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOB9-0006TF-16
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:11 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOB5-0005pP-Tb
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:10 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso16091334fac.13
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 04:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7R8KmvJQzLthd8ndwN21jYsULXSllZr6f02cqF8O5YI=;
 b=JD13XmS9A8mVis2fTVUYrzeVnupO7cYUs9DIJMUrZTWAttQZoz19ycr6987aR+j81d
 Tf8ksJdpAdwGtnecfwXTpHYWbHOJMs2gFHRbxmOfBzAhvPWsk3ZWhS7NbpS/bmeD8gsg
 c6yDbREwuXvZ+hEP4NFEiEXNqUchFR1fC//Y1RSl8quVDih/Z6z7dLmYjIKDLw5NCf79
 qg1pcQBBGiCLGrEuq3eYilIGWrlsKNJWa4ZBOICBhL//OKq/lYVi6b7Vs2OU0GWlC8XO
 lOZY6ce0WR72U35SmrYoiswvTA0IAil3jpseeXMk8LoqfYW6DemAakMN1Y2VE9/3aPc3
 B/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7R8KmvJQzLthd8ndwN21jYsULXSllZr6f02cqF8O5YI=;
 b=0lJulEWR55mO9JvUN6Szh66ocsz2fCoKM1XOeokcX1NzEzrpF8jesZY1c0XKAalrDy
 h2O1ng4Xzum4R0/JG5E/le8tttIlx4iGl8dHzc5bg71ulx06WSTEZHeHCvSvb8d3dsxQ
 ExjDnuEdQThdnQlGSBDGekN1uPITYb8ALGyirKGCdszWfJ1zxwjg/P/k8x5m3NurRyw/
 9c2+invnWSiVHhCDlGh1EQhAnYHu2ymENAvyV4AWJz36jITahaYiOzGVRNRolQPb/cL7
 z5tWu4EhzBcWXWSHJhpjiTkxA/DRdHBQ53ESzmZhEPw7SrplOfbh9RnIoRxhxRRkY/nY
 NgCw==
X-Gm-Message-State: ACrzQf3XreVrEYlnYYwEvD2iXe8k2rvFSkKPnjrKbEevBiKxpnJD23+X
 EqgJe7Hh5J4nxGFQTuUwqCZOQA==
X-Google-Smtp-Source: AMsMyM7BDaqmX4Gwda4zHPGCnGB+BwTb+Flrm2TD9nQNClUP9ZiDvcd0I6ihX2DcCh+tS5dHG88l9A==
X-Received: by 2002:a05:6870:5b84:b0:131:e064:747c with SMTP id
 em4-20020a0568705b8400b00131e064747cmr43913730oab.273.1667912284953; 
 Tue, 08 Nov 2022 04:58:04 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:58:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 2/5] target/riscv: Update VS timer whenever htimedelta
 changes
Date: Tue,  8 Nov 2022 18:27:00 +0530
Message-Id: <20221108125703.1463577-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=apatel@ventanamicro.com; helo=mail-oa1-x2c.google.com
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

The htimedelta[h] CSR has impact on the VS timer comparison so we
should call riscv_timer_write_timecmp() whenever htimedelta changes.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 716f9d960e..4b1a608260 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2722,6 +2722,8 @@ static RISCVException read_htimedelta(CPURISCVState *env, int csrno,
 static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
                                        target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -2731,6 +2733,12 @@ static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
     } else {
         env->htimedelta = val;
     }
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -2748,11 +2756,19 @@ static RISCVException read_htimedeltah(CPURISCVState *env, int csrno,
 static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
                                         target_ulong val)
 {
+    RISCVCPU *cpu = env_archcpu(env);
+
     if (!env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
+
+    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
     return RISCV_EXCP_NONE;
 }
 
-- 
2.34.1


