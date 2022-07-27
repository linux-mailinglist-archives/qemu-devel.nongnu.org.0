Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1735820DF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:14:01 +0200 (CEST)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbF2-0006U0-I0
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarP-0003Al-Ks
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:49:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarD-0003Dr-Ij
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:49:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so2525515pjh.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ouNC9arG+UAUj0g1J+YLO+sbl4ReGN3ZQHxuiCsi9pU=;
 b=6GeRlAz1hNywuu54OHmrcTTu1gdoE2VGqHc476uVOd5r0JuXEuYvCqTyuK00rdSR3y
 rLmb/ssNTDB4SRvJ3sPvudxmzE0AcNVgZqOVhkBkKo1ZQCfGaggmfWMXKgkbzZ+20jRR
 fgefnmwTzC0zOJmNHHJJqkWFv2ki4GjKz+45E8CHklPMMjui7jvvOeneuLoOauYJcYzY
 Af9XPekuvtHjotQM67YdUxMrLwgGI9ro3fvESlPaMbvrHwLy7eRYB+jatqo8Vg7IVgKM
 pUPPUyeXSTIk5P9yUxcvnOMs/PUSDvuW17aukvniL47qNITFsQ5YOY8/6fLRrEizTe7H
 ZVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ouNC9arG+UAUj0g1J+YLO+sbl4ReGN3ZQHxuiCsi9pU=;
 b=FQFohFf2jQA10RhefpberLj7Q17tz8GGcAtDtQQOShLTqDXVttmKPK8qklms4F1dXH
 ApLM1oKvQo9A7uDTTVpHW5ps5Sp4D7GW3R5SXkM9Fu0ZQov1LLaY/EX4GHFo28ayyhqk
 ADYB2bzZ2TWbQBywoUfXvowzEJYoKadt7QeHwdcctcDngKWlWmnJIl12gALhTawQBjmi
 yu9vPz5AEgfkNQjn+xhJu9zJJHBlERF+D4zT7br6vUttaERzAYw2Ks2kj0iRt8eM9+ki
 27AttI8O2heybmMiTuWFkh3WCM26Grt3jnNeVrypMl8xW0O6ts5MSjlUqcyE//Iho34+
 NiTQ==
X-Gm-Message-State: AJIora8BwSE3P7nJyC76PVT5slxRsdZTZjVgikxmVqXPZeyOQgEf4BtA
 6bTDbNFIL2KKnTq4JDD8q531sjGik6UdHw==
X-Google-Smtp-Source: AGRyM1upWxCk1cUKuLni/Wmx5lysfzsVsqHgnYubTRabSypcf51Lsib9EOja52pSUsq8/0dRzVbSRw==
X-Received: by 2002:a17:902:e749:b0:16c:3d6f:aba3 with SMTP id
 p9-20020a170902e74900b0016c3d6faba3mr19767349plf.135.1658904562120; 
 Tue, 26 Jul 2022 23:49:22 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm12764851plr.188.2022.07.26.23.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:49:21 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v11 5/6] target/riscv: Update the privilege field for sscofpmf
 CSRs
Date: Tue, 26 Jul 2022 23:49:12 -0700
Message-Id: <20220727064913.1041427-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727064913.1041427-1-atishp@rivosinc.com>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sscofpmf extension was ratified as a part of priv spec v1.12.
Mark the csr_ops accordingly.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 57dbbf9b09a0..ec6d7f022ad5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3859,63 +3859,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmevent },
 
     [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
@@ -4005,7 +4034,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmcounterh },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                                                        write_mhpmcounterh },
-    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


