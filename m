Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90EA228029
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 14:43:23 +0200 (CEST)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxrcA-0003nG-Vg
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 08:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxraB-0002C3-GH
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:41:19 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxra5-0004vw-RG
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:41:19 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so11904309pgf.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=gHhdKItlqETPHEa9IlqbXOlkddHLNotQU59wayLuMJvdSoEOuLop4AhwLuSo4RcXVx
 cDr4IhvynheMWFGRZOVNVofvEw0xy6drY72+lIpKc5N4ank8VZ0rh2iIrE2R0dTWqNcy
 7S+i9JQu3uUSpQokrzXg5IQXPMwild/IubTLK+nvyzBc5hQYZorBdBnt40d4VqH33riv
 DsrnlwwC3wI18y5i+95o7EpGh3IqxoeQcZHZ4bmLvYktpof5tjRnwL/uB4L3D8k+h7ht
 qW4xny9ydvnoyFn7n1WlsvBtRe/3vLdoCK3JvRbFtueKlXHCH9D6VH6L964Hs8NsxaEA
 t5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W9alUim2NScoKewf8vVRphcseP9RDIaK8xQN1I3tCFA=;
 b=l3M/kQrve8fA7qgZdvTXCkh8pCsHsIV1jeyWPnFzYDkh4KQNBFTXxLcxJZ5KqMvaqp
 NxuCwCZ0QuzslZrWi593HelnKVwuICf9I9YmpFXXK+PMFsGvzFENVJYDistgEcq3Xvnv
 xV7dYNrQYVunykHEGKKiuBP1bqtQR3wZ/B/UxVC29UB81nHFNmBT7mKHQStuMqQb8Erv
 U49tDe0kIGhuDhHyGktRmYnU/SHYcueLF7eL20R+6kTbPjDUuuP963a8GJZHo0HghwvP
 LQrdwsMf7jTqyk/lNGteAz071VAL2RTKEDwxvryx59UmeGgVMbxW4QgcumIsDWA9H4XS
 zSOg==
X-Gm-Message-State: AOAM531aEByn8Rip9AipDXhgbF97TjJ1DfEcVxZH4JakJ6vXg1AA7cHn
 DXHxrSzz2BSZ4gPHoa7lW39fBQ==
X-Google-Smtp-Source: ABdhPJx/Qo/bcEqDMsf0Vlwr6ThIhFcZ4ugvB6RyoJCFwn3nWdHvrPiYBL8FQXPim+6oMFAo8X8rjA==
X-Received: by 2002:a63:1059:: with SMTP id 25mr19989645pgq.302.1595335272379; 
 Tue, 21 Jul 2020 05:41:12 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y20sm19819991pfo.170.2020.07.21.05.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:41:12 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] target/riscv: Fix the range of pmpcfg of CSR funcion
 table
Date: Tue, 21 Jul 2020 20:40:50 +0800
Message-Id: <eae49e9252c9596e4f3bdb471772f79235141a87.1595335112.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1595335112.git.zong.li@sifive.com>
References: <cover.1595335112.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=zong.li@sifive.com; helo=mail-pg1-x542.google.com
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


