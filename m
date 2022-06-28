Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09355BEB5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:21:38 +0200 (CEST)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64bR-0007AP-Ns
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631u-0005i6-W5
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:40:53 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631t-0006Va-FN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:40:50 -0400
Received: by mail-pf1-x434.google.com with SMTP id n12so10983929pfq.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHMyNrMsO1iP4VbXnd4aidt4qEDuWWfhMdOb3QrB/+M=;
 b=hA7r+0A+Z9XNfzSjZ80su01FDsCokBMKCmycC/+k7xE2R2T+6+POMlgji1J8Wb3zRj
 Jq+bIKeggzNkCJMhYEfLxbF6fnkWXo8fg/UTNGvrsYDZVCqVIxmBA/G9RMJOp7+mNkk+
 bm+MwcAU7KASmfZz/rC9QYNBvqHela6bJawHyq/keMJjkfKJMIr/OYxr6quJGMa1e/lS
 glaDTkWszfl/WFU8KCkQPZHBXErLSfqXDwIaNnvBMGNqmDfMviA2JeXG08Lsh8T0qf99
 F9/z2RukncgzI4ZFQX2bDtcNUe8spbi1HKCqLuyY00iKrG/IoRKNU2pM54McZLuLKkMG
 XHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHMyNrMsO1iP4VbXnd4aidt4qEDuWWfhMdOb3QrB/+M=;
 b=5WOFOtu04hHLHE4AYtxZraXvrZVYppvzga+s3nAmZBk7yhKI/aOWo1SGm3LBOdW2hS
 CLw5b3Q4SaC0ZF44LaitjN0oMAOqPDLdIvoe+7zM+Z5VJUmECzASpbXKFkdnIzQEJ5od
 eNivVq563WvMRvK0QR+scjpr2gmxFNU7ZSsQPgYZOokNsIR5dkBq8tu5wYJuZ7Nz7PcB
 qm5hICDzx7t+7CVp62cZKimlOFFq8aTLln7/MyZzYpnkdsWty4bE0uD/qKRUSB8QM/u/
 kNX82twx69to4gvHavguauZWDY87nspzT3oB7n6mp6V71sgVb02Vw4BygZL6XwO9Zi+j
 hYeQ==
X-Gm-Message-State: AJIora8+epW5U2Eqj3KoyxrSJfxbh0fSEYaTjERvCzIsuuBg8Cule40M
 ePzfiHIMKe8IODyhTh7sunhc/g==
X-Google-Smtp-Source: AGRyM1usj5o1ZhKDbCKw0FxRngtgmj/sbUyl6Bcg7/pm/j6YN1PclyOWQwF9rGVA8eJ5CMPLt/CLvA==
X-Received: by 2002:a63:44:0:b0:40c:9f98:a172 with SMTP id
 65-20020a630044000000b0040c9f98a172mr15489955pga.65.1656391248220; 
 Mon, 27 Jun 2022 21:40:48 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a17090a17c400b001ece6f492easm10284001pja.44.2022.06.27.21.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:40:47 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 2/4] target/riscv: Set minumum priv spec version for
 mcountinhibit
Date: Tue, 28 Jun 2022 10:10:26 +0530
Message-Id: <20220628044028.659704-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628044028.659704-1-apatel@ventanamicro.com>
References: <20220628044028.659704-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The minimum priv spec versino for mcountinhibit to v1.11 so that it
is not available for v1.10 (or lower).

Fixes: eab4776b2bad ("target/riscv: Add support for hpmcounters/hpmevents")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d65318dcc6..f7bfd2eab5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3944,7 +3944,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmcounter },
 
     [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any, read_mcountinhibit,
-                                                    write_mcountinhibit },
+               write_mcountinhibit, .min_priv_ver = PRIV_VERSION_1_11_0  },
 
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
                                                        write_mhpmevent },
-- 
2.34.1


