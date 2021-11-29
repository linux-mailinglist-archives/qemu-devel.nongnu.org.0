Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D462C460D1A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:16:28 +0100 (CET)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrX9X-000188-UK
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyB-0000pN-UI
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:44 -0500
Received: from [2607:f8b0:4864:20::433] (port=45751
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxs-0008Qk-LY
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:33 -0500
Received: by mail-pf1-x433.google.com with SMTP id x131so15263776pfc.12
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=PcrOQAeSypH1NCbP/BQ8aAzmU21+tbZDy4FLF3yGb3ATnbt/SGa6wXcERW07nRROf5
 5AyZOkijWz3dWu1vcPN4dDt6Q/jdGzzE1Pw+clWNi/cn93yeuXrF1QNpEwCOKJDcbtLM
 MA+KA/UxTbQfNtC4ag7hhL0mRpnk9JKZ5okl4usSJOCAsXcdKNLysnn1IeFFnnATldP1
 idFTDWOG3dqJHmiMGfeRJxR2UqZB45Wazh+Ke27LdIhQNwsioiL4dTIwKEuqX6++7xnP
 D33r/nxu4GnJhwm11kfRTvWWulqCd4zUfjSCD0fnqf6uskbH0DWoJkV6c5oGEM4WGMvb
 05nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ua2R+2dkAoBHDORfNb7qNaS3lWgdeuZeqFSpPuYBQcM=;
 b=jS5PsJDdDcfuWVjppNGWJ6pwRXfcFyGxSRII5uqzLTpsJZPkVjdXgIhD+OqAwv/qZU
 rjk34jpBBF/51BUspx2ardSDX7kOp8pcytZUIJ7mPC6hutMabDlrtrlGnGMlltnDeJLJ
 IFIxpHVBD2KpbOcjonmMygZZLtM5T1Mq3N3Olir+XO8K1bDn0NIkZZcJhHronMJZqYRN
 KnRF/0aJfL1r1lb9ujgUVsoImw1FXutPiIpCmclty/XLPSvn4ZzaRenJSw0GhH19Q2jY
 l7dS8WASszYezMEm8KAJ1VgacDSg+ZOKM33LisObAXJLanIj5jt8yYCXRVpqurGQhB3n
 1AyQ==
X-Gm-Message-State: AOAM531zezVleStph4bT4KQnOJIeKa1yu/1vuC9wQkvyE0rJD/O72a/U
 mLKXCBC3FqAfqcMJ8iX5IC0C7J0R1b++Kwuy
X-Google-Smtp-Source: ABdhPJxeYt2XTGPO3emnkj+EW8k22qjpMOT4wdhQ5zsUwP4GmpYdiKksTp05io9Y8SvWx856Suh3IQ==
X-Received: by 2002:a63:c142:: with SMTP id p2mr18936626pgi.576.1638155062103; 
 Sun, 28 Nov 2021 19:04:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:21 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 08/77] target/riscv: rvv-1.0: remove rvv related codes
 from fcsr registers
Date: Mon, 29 Nov 2021 11:02:28 +0800
Message-Id: <20211129030340.429689-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove VXRM and VXSAT fields from FCSR register as they are only
  presented in VCSR register.
* Remove RVV loose check in fs() predicate function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bc149add6ce..c522260986c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,10 +38,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno == CSR_FCSR) && (env->misa_ext & RVV)) {
-        return RISCV_EXCP_NONE;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -261,10 +257,6 @@ static RISCVException read_fcsr(CPURISCVState *env, int csrno,
 {
     *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >= 0) {
-        *val |= (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return RISCV_EXCP_NONE;
 }
 
@@ -273,13 +265,8 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 {
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_FS;
-    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >= 0) {
-        env->vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return RISCV_EXCP_NONE;
 }
-- 
2.25.1


