Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545CC22D84E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 17:05:23 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzLjm-0004Su-Cu
	for lists+qemu-devel@lfdr.de; Sat, 25 Jul 2020 11:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLi7-0002gI-P5
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 11:03:39 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLi5-00086x-8B
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 11:03:39 -0400
Received: by mail-pl1-x642.google.com with SMTP id o1so6024141plk.1
 for <qemu-devel@nongnu.org>; Sat, 25 Jul 2020 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=gy+ktgD9e3vcF029rESntF5bjyoGyGy812jfHvdC0JVIoNe772rxBrPMj7zYkmOEba
 idct+TvMnTRPSDLPqZvtqTAFco0X29NS8toXxX+vuRCUsMBTN88qg8mzyBLYHRv9cQDS
 qSzCvd8OaFnJKlgBltej7MJQRlfqGsuEl8yl61dwLn1XUe40rmBEuG36Rw6zm6nSUyYm
 TbLR0rMCmfzaNTqMcsQeBm1xlskiHa2NomWlnYi+x1TlMixVWAYXDDgF+TN7cNfxy/my
 q3QtbndFdfAHGWKgqtCsz6ywV4rGEVGXm7Re7ABw2aQLluUw/SyWobtSsV73/Xb4nHCe
 ziIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=Gwl+/IA2e+XYXeh/wl3eduDadMotFDTZII5ZkxKfn/It6A+YUlryDP3wWnlHuAEcag
 w7rTLCHEnKl42dr2Zy1NYs+jfQ33Ii3U4jqNmzcn9ymDqkq1x6Hh4ugQrYJQk+uh0BSD
 M0djS0fhK9nVUwF9ybdZT4YrxysVI3WuhL9wJjPkzdOPABQD7k32bnZNfsFFEI5ZnGfY
 1aJ/+hJvgTZgGRx6029kelXc6GegmCyuQ7COJmqRM8urUG/+dxR1V3PzuMs/rcoJdoQz
 /4uPa+wHYHL5kuKCT95Rb3x/dm0o5u8wYxC0W6OZHIaxeVSLdHwlFlI/Wyx7PELyrltl
 RQzA==
X-Gm-Message-State: AOAM530sIgW3K0zVdVAeeKCMIqt6SF7EaqEGn/6Ru5c7kWzAeqpQqzw3
 ixdUa95+75X3LUWk1zMpbgZDtA==
X-Google-Smtp-Source: ABdhPJy7Pnueq7RhCVSh8128l2Cy4wrH0owuzAatATnf3D8mb2UlQJ26+A553P+zBBz5c+vNOnlanA==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr9593369pjr.132.1595689415837; 
 Sat, 25 Jul 2020 08:03:35 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id g22sm9059783pgb.82.2020.07.25.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 08:03:35 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] target/riscv: Fix the range of pmpcfg of CSR funcion
 table
Date: Sat, 25 Jul 2020 23:03:24 +0800
Message-Id: <eae49e9252c9596e4f3bdb471772f79235141a87.1595689201.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595689201.git.zong.li@sifive.com>
References: <cover.1595689201.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=zong.li@sifive.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The range of Physical Memory Protection should be from CSR_PMPCFG0
to CSR_PMPCFG3, not to CSR_PMPADDR9.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ac01c835e1..6a96a01b1c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1353,7 +1353,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST] =              { hmode,   read_mtinst,      write_mtinst     },
 
     /* Physical Memory Protection */
-    [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
+    [CSR_PMPCFG0  ... CSR_PMPCFG3]   = { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
 
     /* Performance Counters */
-- 
2.27.0


