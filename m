Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617F55965FF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 01:28:35 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO5z8-0000XE-7K
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 19:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uJ-0002qH-84
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:35 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uG-0007hr-GC
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:34 -0400
Received: by mail-pj1-x1029.google.com with SMTP id ha11so11027476pjb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 16:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=h+KCMXQELj2Dgq54iwpXYBy52M5jMc+VVEuB0fOX5mU=;
 b=GLnrUW98nGoSsRkPHzFHevR3kHX2cg2h0cLl4bgVZLPGP61vkLegVYCeZZWZLYL/iA
 nn+BNGFnzrUk122GLnS1MxeFlWQs+gqfF4+y91CeKm5k2GeUly6tEHWv1vePR6fnAEIv
 3ojE8rCZnh34MOUHeeMhdxJHwXl+46pIsaYPxCKl85iWc5tu0zDruvo/cWiSyLEmtdI1
 rEsNl7nmv5Koes1sRnko7xpdkQXi2Gbd5FmIncyKpfv2bJ8j/Buwo2VN0XeJ/2p1e9+D
 tXXGoE9Pz6wVeqs1dDnXV8cDLIAdOPK0F6zbiy4XWAOhHjeC2OVKQJ7P8g8s/PAK2Xn8
 8FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=h+KCMXQELj2Dgq54iwpXYBy52M5jMc+VVEuB0fOX5mU=;
 b=oMnzlBEnWMQDR8jQBZXSwOVmwYbQEGYWe4bDNhefzYnXQUmKHMzhdpqFU2l+PhC2Dg
 V0r4wLKyPPURSu+1I201RLHSzA7zp/PZZldvw84HgzfQMVhFM3oq/jFMBQIoJyMeTEVS
 vLqPa5gd2IXfC90gEmo/Yj1QqAuXxuOGgp2wa4Z4lYEh4de5UAXruNYtswiexI2aYeh7
 cIDWMszvrZQV/H589gOkTVQPo0ONxY3WyZDbC3Yic3LqjAnfNa5Y0vQkP0jdEE0D+EVw
 orrL49v9rHVXq4VfEaJBXivbiirAnE8Nk4RapvcJjOkOEMiw2sxYSNqn6/zIv8h3bTk3
 pZdw==
X-Gm-Message-State: ACgBeo3LVSwj37b41ZF8BOdT9eVUphf4/ksMXucK3cL3WyP8IzTulNXz
 AQRWImmR5aaz+pj6wBUnbbZyNQr+QKl/zg==
X-Google-Smtp-Source: AA6agR5sXhWLqqClt0eHRSWH+HgMeyizC8SK6gFGgbuumAfdS6JlBBAHkKZnxJ6wSxkJh46k+dgKyw==
X-Received: by 2002:a17:903:110f:b0:171:3afa:e688 with SMTP id
 n15-20020a170903110f00b001713afae688mr24081676plh.162.1660692211170; 
 Tue, 16 Aug 2022 16:23:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a17090a2c4400b001eafa265869sm78608pjm.56.2022.08.16.16.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 16:23:30 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v13 5/6] target/riscv: Update the privilege field for sscofpmf
 CSRs
Date: Tue, 16 Aug 2022 16:23:20 -0700
Message-Id: <20220816232321.558250-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816232321.558250-1-atishp@rivosinc.com>
References: <20220816232321.558250-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 397803d07727..07b8b4eb1768 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -4063,63 +4063,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmevent                           },
 
     [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
-                              write_mhpmeventh                          },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
 
     [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
@@ -4209,7 +4238,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmcounterh                         },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                              write_mhpmcounterh                         },
-    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
+                             .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


