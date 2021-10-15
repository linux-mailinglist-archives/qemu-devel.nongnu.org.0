Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B2242ED22
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:07:13 +0200 (CEST)
Received: from localhost ([::1]:41078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJBI-000200-QF
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzV-0004Ho-Tj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:58 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzT-0005OM-KI
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:57 -0400
Received: by mail-pf1-x430.google.com with SMTP id 187so7674838pfc.10
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6czm8TW5emhp9NFYVOYbA/8BUgKMVuG5DF4yOVp3fw=;
 b=MY7wIVL2PWjdYzUq6PgRhnip0TazerMIjAyVq7nad/unkCF9RNFdeTxwT7MvkRGtvb
 50K9FSth5oVJ29PSZkc9YBua8wosWpAfiJJuPsBMmwSGbBkUUCWuXFGMC2QAZ+Er4qD5
 oyr7TQ1JK+Zbf9HRvoVt3+EOarroETOLEsLhN9PTebqTLhPzQwwVp9tWRQ9uJJgKwbd+
 71SCeYeoim1wySGTgO637Ywgf2koQL6WAoEOUa3voZ3OPgfl+Ed0hEHfwjI4WOQ1+L6w
 nRWzmI7YpSGFbjQlkE8qO8sQXFmDwgNWOoI+96ZYb8ADKy7E+EXFwuPBowiauuyX/HHe
 Ac9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6czm8TW5emhp9NFYVOYbA/8BUgKMVuG5DF4yOVp3fw=;
 b=A+ymUidVDbSK2HaNQirslC6+epcIenNfVpxEPo6J6h3wgKgQ2l47ZoKV3qtUPasyGw
 IYvnm52BZE70BTfQuZTYL2+MbdoFCWLeh8pdPKr/0QLtort9ujhbYI8d5Qo8N0b6puPg
 CE/piQSREmgSBZ00rvfR8KwJFK2O2rmRS6XYEaxThiEBHIIQuXexfVsA6YQXiciEgsQO
 os3BsGXeiRNsGoSMEoDCBRcd0Jbz2KataYmHLlURwrdo/T+/0pt4uUsZAd6nqwyfovce
 Tfg+TPn4I+g6o75wBFed1OFa5X3H6g1iaZYHL90R4f2ELhzHFGLjtei0DR0NFkcXkyYS
 dNbw==
X-Gm-Message-State: AOAM531Ba5ZTQS3wc6pu36IGOIq5sZw76ET4TA46wl5PvLCoQl1XPoX/
 MSOXsAelRQLK77gEMbKfP1FaO/UIlGU28Q==
X-Google-Smtp-Source: ABdhPJws5vypd6flO4IsF1ybUY9cZUkd86gv03s/JAb2Tdj+iHANGWA7tM2n4G80njzrDB3gmypwNg==
X-Received: by 2002:a62:1b8e:0:b0:44c:9318:f6e1 with SMTP id
 b136-20020a621b8e000000b0044c9318f6e1mr10518720pfb.84.1634284253214; 
 Fri, 15 Oct 2021 00:50:53 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 68/78] target/riscv: rvv-1.0: set mstatus.SD bit when
 writing vector CSRs
Date: Fri, 15 Oct 2021 15:46:16 +0800
Message-Id: <20211015074627.3957162-76-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 127393eb956..9f51626a3d8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -297,10 +297,11 @@ static RISCVException write_vxrm(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | sd;
 #endif
 
     env->vxrm = val;
@@ -318,10 +319,11 @@ static RISCVException write_vxsat(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | sd;
 #endif
 
     env->vxsat = val;
@@ -339,10 +341,11 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | sd;
 #endif
 
     /*
@@ -362,10 +365,11 @@ static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | sd;
 #endif
 
     env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
-- 
2.25.1


