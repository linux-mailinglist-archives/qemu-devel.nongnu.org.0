Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A442ECB9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:47:14 +0200 (CEST)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIrx-00053F-Q2
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzj-0004zz-RE
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzh-0005bM-SS
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:11 -0400
Received: by mail-pl1-x633.google.com with SMTP id f21so5898327plb.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgYyTGMImbIPh0kOKBRjaORiNPVnIuiCGa5Q7hnXtPA=;
 b=jbsIsRa5KoYsHvLdVehcAfTpK/r+RopbodQ+Ck2cvboprg/orvVG7+eEgash9vuB7+
 A1Zxula9/kExybtjfLsEzIRhiR6NCJuumbUMnam3/eqNo5bpq8C5FkpfZT2ZjdwDBWrb
 eIlLOKW5wR+eaaMo+Wsw1bgpjxedBDYqpQ8Clifuz9D/FqqrIFP7Vu5mUBhJ2GWmwbIU
 p2yjZIfxrmHNCpoMTj4rGLM4Tu+7b5L8by4z/9dm6AcaZ8PR8Vl9tFiHqZvxqP+Ne5aL
 kpZX10qH7rKMmC9xq/PbEVfLAysP+VpoyHvEC4D/gaDJqsgRx6qufSZV9UD2nQPMjPrf
 m22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgYyTGMImbIPh0kOKBRjaORiNPVnIuiCGa5Q7hnXtPA=;
 b=ofT8hzO1grFMN5exf2s78hkLhHTGU5oKOatlm+mSfmMXM8GfbtpWl0GpHCobYhmCFG
 rX8mWb9T2oXb1EaB48aYggL1fSEb2nN6wTna/2HFaC5q9Jp/IiQmq48dbhGo0ps/s4Yt
 c+na0xMfg17p54usNUgImffogxdKY82gJpRa+MeQyVmUuh2uIR0hS37N8/aqjnhFHtuM
 uvSZc+TAWrcUUsyDQo+7DBvnUCPLDADcBfCSUOLX8QE67igZ8BRpT6XpA1aDrCcbCDAR
 0WxzBHhXuuXLwcr41ea1WUniATx9mrkjpPG+vEcEsyl0sPOqvjcevuMR/R0pzCNNQnoz
 xK+w==
X-Gm-Message-State: AOAM532oScJKCVXN+e33Sl6GXCKBJKkFv3L/WFgAfjaLpQp5n0ZVlvVH
 Srw1/wvwAEDOOPPZF4RdPzSBsOxOPHtfn8aK
X-Google-Smtp-Source: ABdhPJwlX2hkAqQr41bqnw/BamB4WMKW99SHHTLLuNPlDUibkkxz9j4rUsWztHGcVDNiLuCdinHthw==
X-Received: by 2002:a17:90b:4b07:: with SMTP id
 lx7mr11751779pjb.195.1634284268009; 
 Fri, 15 Oct 2021 00:51:08 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 72/78] target/riscv: set mstatus.SD bit when writing fp CSRs
Date: Fri, 15 Oct 2021 15:46:20 +0800
Message-Id: <20211015074627.3957162-80-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f51626a3d8..3929abb112a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -224,7 +224,8 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
+    env->mstatus |= MSTATUS_FS | sd;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return RISCV_EXCP_NONE;
@@ -241,7 +242,8 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
+    env->mstatus |= MSTATUS_FS | sd;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return RISCV_EXCP_NONE;
@@ -259,7 +261,8 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
+    env->mstatus |= MSTATUS_FS | sd;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
-- 
2.25.1


