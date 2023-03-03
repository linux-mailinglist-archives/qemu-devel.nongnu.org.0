Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94346A92DD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:44:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zW-0008Lk-7g; Fri, 03 Mar 2023 03:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zN-0008Ac-SH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:06 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zM-0007n9-9g
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:05 -0500
Received: by mail-pj1-x1035.google.com with SMTP id l1so1811863pjt.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832923;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVge5eYF4AHTDYM9NZKBwRnMkT36zpgg9PzKCyvzH58=;
 b=Ov3EgEHhU0h+WUBa1ESpFar3LeckmZHpndVV4bHbCJTzl8OlB6TcMimsq3U61RCZTx
 FkxvvwIypblqRLTO2ewkE5Q9EafgHXjkuHL0z1WTcaX21vj4WXpsmZfqPM9EZlVhbqZA
 4fhrzXQOcMW9jgFbCzzlpItJGFODUkMF1qKqniwXwPXa5GLjTdeEa63aa1FqjizYzqzA
 HwSFKokUmBKToic5j/LoV9hKaV8dWCmb1Ppsuz92UyBS45zxm4UvcUx4aMtMyEFzdYW+
 2+zgkGrEoGuRmgVWOZjU+W2XWIv3ySzR8wFj1tGRXLRm+lxlWpr8F/x6RRU2j2JoJrFi
 sQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832923;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xVge5eYF4AHTDYM9NZKBwRnMkT36zpgg9PzKCyvzH58=;
 b=bPlPQITPf1Oeq/O6jIpbwsR/t2s09SHEAQ2V3lkqlaH2cFUGYVpo/KOOVBo+N6rskl
 WkRXomWkJJEY6xh2s9g+Pp36ASkgqpBUOocyD8uNi9r2JMk2u6PIteko04FNf8X+9Old
 wrMpcfcPP2fJNSa9eH/RwIEudZD6SA2Jf11Y52irP5WPyBU77f2I+46IDZhh3sKPODU/
 5Zal5ZGszqyR2xhsb0zIArtTiTBytMtUdaWJbza0NN65u1/r3/LXcATj/yzJ4j1CLw9Y
 uzVp0Kf4Nit0+qhzMbyVOIajASTGkwb1eqUWJ0+d3VkOssGcZt+BAHPcRFx9etZNbny6
 873Q==
X-Gm-Message-State: AO0yUKX60rtLPAex+ZlDBKFLb3+BKDX+GZ2iz3iqzgUyyj28XyKTk256
 xLl8J2YcX8zEERRIt1SXsZgHtQ==
X-Google-Smtp-Source: AK7set+Vq87ze9oHP7avO2IN8NCAvTCj1zx2H0ZBTateULcwANLS7DvdgJx+wUdARFNExFiDecTZIA==
X-Received: by 2002:a05:6a20:1e5a:b0:be:bc70:6810 with SMTP id
 cy26-20020a056a201e5a00b000bebc706810mr1198489pzb.5.1677832923444; 
 Fri, 03 Mar 2023 00:42:03 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 5-20020aa79205000000b00593ce7ebbaasm1018494pfo.184.2023.03.03.00.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:03 -0800 (PST)
Subject: [PULL 34/59] target/riscv: Avoid reporting odd-numbered pmpcfgX in
 the CSR XML for RV64
Date: Fri,  3 Mar 2023 00:37:15 -0800
Message-Id: <20230303083740.12817-35-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bmeng@tinylab.org>

At present the odd-numbered PMP configuration registers for RV64 are
reported in the CSR XML by QEMU gdbstub. However these registers do
not exist on RV64 so trying to access them from gdb results in 'E14'.

Move the pmpcfgX index check from the actual read/write routine to
the PMP CSR predicate() routine, so that non-existent pmpcfgX won't
be reported in the CSR XML for RV64.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-11-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8e827362cc..7284fd8a0d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -412,6 +412,15 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_cfg(env)->pmp) {
+        if (csrno <= CSR_PMPCFG3) {
+            uint32_t reg_index = csrno - CSR_PMPCFG0;
+
+            /* TODO: RV128 restriction check */
+            if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+        }
+
         return RISCV_EXCP_NONE;
     }
 
@@ -3331,23 +3340,11 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static bool check_pmp_reg_index(CPURISCVState *env, uint32_t reg_index)
-{
-    /* TODO: RV128 restriction check */
-    if ((reg_index & 1) && (riscv_cpu_mxl(env) == MXL_RV64)) {
-        return false;
-    }
-    return true;
-}
-
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     *val = pmpcfg_csr_read(env, reg_index);
     return RISCV_EXCP_NONE;
 }
@@ -3357,9 +3354,6 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
 {
     uint32_t reg_index = csrno - CSR_PMPCFG0;
 
-    if (!check_pmp_reg_index(env, reg_index)) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
     pmpcfg_csr_write(env, reg_index, val);
     return RISCV_EXCP_NONE;
 }
-- 
2.39.2


