Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491E4BC367
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 01:30:52 +0100 (CET)
Received: from localhost ([::1]:42352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLDeF-0002xZ-Gi
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 19:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZw-00088d-KM
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:24 -0500
Received: from [2607:f8b0:4864:20::c36] (port=47048
 helo=mail-oo1-xc36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZC-0006yW-V5
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:24 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 p206-20020a4a2fd7000000b0031bfec11983so5532141oop.13
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 16:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+g6MFcwh5AfuHMDFDMLEe7XqAxFv6P9qRyULHIqXmxw=;
 b=Tyw1nYkPHouPZpJnE6fYnyg/Vk3WYzq/qkpEmcxcQzd9/NfMzhXmxNI8QUdyL82EvZ
 wZWT1KvfHPJfjZ+6z+vzXKYumWFhGvf+eh1Nbo1WA/gvgOoPTU1PYefXbGDTHauuKKk/
 buG3QWDake/EyJm7xxAz7JW9CySmBVWCF8Xhx1jBw+iad2kTKaqPFV5qhQ4ph+6Wil2i
 H0Iuq0oLLkkjVq8Eup8p/WcBuwUqg3sz7209kTMfUMsKk0/lzY3ZOatZRB+LQ7ENcEcx
 uFSNbz9TFltYwDPNypkuQUD+uaJLP8HDM7ur1SqK6L48pBn97frZqcOnjXSNgnG3x/DJ
 Ug4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+g6MFcwh5AfuHMDFDMLEe7XqAxFv6P9qRyULHIqXmxw=;
 b=Ro2sUOiSpejeIBA89bPgyGNfknS01Yk+K/CXnczM9bsin14yZdWyU0uSL7b425N1DM
 opB7pSU8ql3mQZGTTb90KnI0CxukEQ9nOod+3beXi+ZqJH23h3vd/aXCyild+Klmfzl1
 LVgqCqIQVEp3gs17jY1YkA7lY9C0sEam7Y84UsArLtjZ3M+/MpfPtzNTG1O3zYhu5EWk
 v15CHdbvGMFec4DutvJnEkwdJPrgBO2pnbp1F4Qid8KwTSk/l24VTt4P+uxIIboOjnUv
 SswgdlLEnM7BXKOPoCyEmd3QMoW7aGAzgLNZpdwAJIJtePe6IBn0BBNJQKQlFLgLSxDE
 /Ntg==
X-Gm-Message-State: AOAM530IK+H9jnugHMAedvm94uY7+s0cc8oWzyRBXobLlOuv0PQNt2ES
 FQO2uu8u2nHI6u3eN5p/GhuIs7Ly9A+6QhD2
X-Google-Smtp-Source: ABdhPJxKJucxTvaOBaMlhsTWHBmJhIyqZc9O4KD3G/xDIgNcTgGTTfx1OpXaxCdr/KLQf3RDmSCxDQ==
X-Received: by 2002:a05:6870:601a:b0:ce:c0c9:6e5 with SMTP id
 t26-20020a056870601a00b000cec0c906e5mr5177310oaa.311.1645230336482; 
 Fri, 18 Feb 2022 16:25:36 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:36 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/12] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Fri, 18 Feb 2022 16:25:08 -0800
Message-Id: <20220219002518.1936806-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3799ee850087..789f0c598932 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -67,12 +67,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.30.2


