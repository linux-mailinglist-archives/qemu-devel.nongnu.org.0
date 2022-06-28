Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144955C023
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:22:04 +0200 (CEST)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68M7-0007Bb-00
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o68IB-0001e3-B1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:17:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o68I9-00080A-OI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:17:59 -0400
Received: by mail-pj1-x1032.google.com with SMTP id d14so12132827pjs.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6J7gL6BfZeqHNBCJK+8rR2sxXz+yKeHStI/GCp5riaI=;
 b=e1l52a3A5W9i2d+leHreiEezlpZsiQA0I4kG2W0+mv9G6jmYCnp2stOxIkCzxYnnE3
 +HHwmq3O9RrXEEZ8/KKDRmvOggnKsLxQfyhF51HOnuSAaBdypnQICq/EK4pW6aOmBqlo
 R9NGdOgEv+Zk/zgcJ1DquskeJoBQl7EocxBys/ZsTxPG5UG2UCXOOjW2Xb9rrqy5gi6q
 0PBYLdgJyuZB/OIog/nK2iwjOA2hsLwXnc9TEPmURFkIVi3g8LvuC2mV0suJ+pkSm54W
 qnUyxZH4LDBXaiFLZ5bXhUJCDU97s3/NOEdR0e9sy5tFzQCu4IordSshylK20D5/7JwG
 Cwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6J7gL6BfZeqHNBCJK+8rR2sxXz+yKeHStI/GCp5riaI=;
 b=ePswAGz42Miq9glzv/5LCmVS66aXGPJ0GyuirVFGlPUx7BL5VCNVT2EH0fNw01TQgj
 bcrr0/EgoxLjzqkgnhBvjT+lJ6cDbjZARHjn7ggK1RTfpJ5So1uPxzTYZdcrX3K0VBuB
 CzH7inL18rvzFpjBA1eDfQAIFBBWiHg9bZ1rcmf61Mx2QwfmV5ocbhxRLT+880ccoT3f
 PA6DcsQAlezOA6woR1r7z8o156c6GqbGU45EgLNDELX4pUiF6rwXcv1qiI7NkaeOX8c9
 V2EEqLae/89fmvAUsK2h9rVb14fRL2IhGXzQwQtGnhZG9bUP3M3mIZJEjNV5Wyjy1yxW
 IktQ==
X-Gm-Message-State: AJIora/RCQ0qFb9szD8rl7T4GvQRhLyhEJMcQvFuBU9q0jMq+XwxWaeH
 ZOvvXUQmkcA+Oi9dT5fEIN/Zpw==
X-Google-Smtp-Source: AGRyM1tR5+4WaYBVmOK8NVYE0QPtvkookvUq4J1DWDW/+yosrovLT9WGYB1ZsbBPaDdzgi+cNbg1oQ==
X-Received: by 2002:a17:90a:f8d6:b0:1ee:e6b1:d52 with SMTP id
 l22-20020a17090af8d600b001eee6b10d52mr9197619pjd.158.1656411476359; 
 Tue, 28 Jun 2022 03:17:56 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 bj28-20020a056a00319c00b0051bc36b7995sm8909621pfb.62.2022.06.28.03.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:17:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 1/4] Revert "target/riscv: Add dummy mcountinhibit CSR for
 priv spec v1.11 or higher"
Date: Tue, 28 Jun 2022 15:47:34 +0530
Message-Id: <20220628101737.786681-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628101737.786681-1-apatel@ventanamicro.com>
References: <20220628101737.786681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1032.google.com
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

This reverts commit 33cc1c0b69e457f5c526f64297353cba6f7bfdb4 because
commit eab4776b2badd4088a4f807c9bb3dc453c53dc23 already implements
proper mcountinhibit CSR emulation.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_bits.h | 3 ---
 target/riscv/csr.c      | 2 --
 2 files changed, 5 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8724b45c08..b3f7fa7130 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -159,9 +159,6 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
-/* Machine Counter Setup */
-#define CSR_MCOUNTINHIBIT   0x320
-
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b5734957cf..d65318dcc6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3642,8 +3642,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
-    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
-                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-- 
2.34.1


