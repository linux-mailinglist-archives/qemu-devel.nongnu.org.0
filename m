Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DC94CCA5C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 00:59:45 +0100 (CET)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPvMF-0006uu-RN
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 18:59:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHa-0003WA-VB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:54:54 -0500
Received: from [2607:f8b0:4864:20::f2b] (port=46838
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHY-0003Zd-2x
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:54:54 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id j5so5386336qvs.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 15:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1U5Ipd2Ii9PQfoALNPwJGqZUxA9j80S6VhHHlZ/Ajek=;
 b=CvIJ7PFmBiPpyWK3Rw6ZacN8Hm+wdCmFEvk6hJrSX4jLzeyHd/+N+JnuZJa562mNgW
 uTZOWo0boV+5o6/gLdWJaWTV8xDuwScvf1WK1taMj58ApjGRxDS7yreW8ocIVKodz2mn
 MXniVOJBFq19MZdJU5jKpbtmVZLqsYfH1UzszNMWkgzcYeSiJDPWW//j2ajn1gOvWYaI
 UtDy1i5PCqEq9c0l29OgR9yXDcWelI3S1+n3g/I6icGANHq9scBkfFh4zFxjW9Udh/LH
 tyOpMfbtIfq+2bQJ82pTXU05L1sJzAAVzRGW31T5aa8p51IupjY089z0E5azIKnjfmgw
 WFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1U5Ipd2Ii9PQfoALNPwJGqZUxA9j80S6VhHHlZ/Ajek=;
 b=mSMwlXumgwMV2OvO2U/YeWIdGx01yK87D0qVazxl1JK3CcjoM35SlI2TNEvn+nLewG
 ymTPzMx3MiS0I+yUDC8FaUL5V1hCUywACAMf/mFDyOdmE/Wo6r5NziiRZfw6HSWJMuMo
 NTAtuEtEg7FIcT4yzWjWhdGDeyyBl+WxSSriSH09TbQpK4u1EmAUwTaMRTzVZ3j/OTF7
 /Cvh7iH/dGfaspVRFkFG2EFvuQ5z/eCeZVhSgFUzyjavXfqNcFkrT2UAnNAmi1330VEy
 qDOB0Zy9rQOnZ1pze9xH7M5SnV0FZX9GPow/kaon78CIxJ1usvpGKgZ+yskApBfnzqQW
 YNfw==
X-Gm-Message-State: AOAM532Yy0+LCEeRpCJ0JFxFAJy8JxA3evecTSVAffw1Gqn0k8LH/B2f
 4uE9LsFctg//B1610wBX+Bg5UTnuM0bFIQ==
X-Google-Smtp-Source: ABdhPJzn1xUEoeBZ9bc0TAcVNWZeUdJEgYc/N8O5/0A4xbg9uKoFl0eYq0jhdUUYzf0iXns6c6lyyg==
X-Received: by 2002:ad4:53c3:0:b0:432:6d49:b4ad with SMTP id
 k3-20020ad453c3000000b004326d49b4admr25926999qvv.83.1646351690989; 
 Thu, 03 Mar 2022 15:54:50 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:54:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/12] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Thu,  3 Mar 2022 15:54:31 -0800
Message-Id: <20220303235440.638790-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf2b.google.com
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

The PMU counters are supported via cpu config "Counters" which doesn't
indicate the correct purpose of those counters.

Rename the config property to pmu to indicate that these counters
are performance monitoring counters. This aligns with cpu options for
ARM architecture as well.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 58c67148c235..3b781ef455ff 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -779,7 +779,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d67e0ba6f7e1..9bece5056c63 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -365,7 +365,7 @@ struct RISCVCPUConfig {
     bool ext_zbb;
     bool ext_zbc;
     bool ext_zbs;
-    bool ext_counters;
+    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cb4366b30095..88ae827ba174 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -71,8 +71,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu) {
+        /* The PMU extension is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.30.2


