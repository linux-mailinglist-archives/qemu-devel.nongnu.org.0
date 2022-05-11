Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93F523643
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:54:45 +0200 (CEST)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonjg-0007Ft-ET
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonc7-0002M2-8v
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonc5-0001E7-Gq
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:54 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so2279096pji.3
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1iSGUJg5LeK+SwRNsZyAMWnxdnzqHXlyp91PSTtCSdg=;
 b=Y/BxTS17kwZZ8UA81KmbddEexNP1tAOWEaFxhYU/JfRlf2kS+hpHUmRvPYAffBIAMu
 rHkih343wtV1hb0/sM4vyL8dEKWwZCmFQ4cJbj5SF9D3GstU7p0XToYEsHv+UJnQfxkz
 WXAQJrza7EjasBU+OApg+R5wo5RCMKBGDfmdfcWk2fW6fAj1dq5HRwdUS4la+QcKvft1
 5zNhdM+krKRVqO4v4xvxWNBMICenRmr+G5XI9kDSuXuBPMWsxx3a32wS04DMWm9zD6Zj
 ti2bMupvXevRs2WxFHHl9U3ijB8tJBTVmBp/hDjj0yAbV2FN/q0jguVLL/vJjLkvBorX
 XzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1iSGUJg5LeK+SwRNsZyAMWnxdnzqHXlyp91PSTtCSdg=;
 b=nSyKBJsdgRe4NUzni1m8P34aSmaRQBc1gyA7PJ3X82vlT6OkG3xNR5j0Y0pcOdZsz6
 gwFWa+xJMixlTfDW05MsZJWyPP+Bjyba/2A3GVmAAvbgkFZTR4pj1SwdcUtXYY7rZJs0
 Kd+mTtEXAKu6MpIpLjsQsfo8hyJPFWNjirRrX/jRZG2hw2mIRscitqpr3H5HkxfQsiBx
 //4wo9+jnTYunqdCWMapYs1C2RXujcXuRi41yvuEshR59eYEQgHiCycqGwt6z9ioybsQ
 3qCYefcf31pdyfGpk6mOaymWmVq/17Ta1Wer0HVzdRwYkiP3M9T1DZra4vC6lGh2Pzyz
 Xyyw==
X-Gm-Message-State: AOAM532PLo0ltuSnRYTkEgIoe843WdkckF8QZnOuyAMvhSruxghfMCMC
 9DjAjz5F2C2RzR8nCuUS3wfvVA==
X-Google-Smtp-Source: ABdhPJxU2d9qk9yRMUV1f1EJvXwvq0K0rPdZK85s/qi8KLPIVpJAa6Wt1BBH1JWYV7czFPVXA2H/pg==
X-Received: by 2002:a17:902:d48d:b0:15e:a480:78b2 with SMTP id
 c13-20020a170902d48d00b0015ea48078b2mr25795028plg.19.1652280412200; 
 Wed, 11 May 2022 07:46:52 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:51 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 6/8] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
Date: Wed, 11 May 2022 20:15:26 +0530
Message-Id: <20220511144528.393530-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1030.google.com
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

The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
implementation that don't want to implement can simply have a dummy
mcountinhibit which always zero.

Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
the CSR ops.")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 3 +++
 target/riscv/csr.c      | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4d04b20d06..4a55c6a709 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -159,6 +159,9 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
+/* Machine Counter Setup */
+#define CSR_MCOUNTINHIBIT   0x320
+
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2bf0a97196..e144ce7135 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
+    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
+                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-- 
2.34.1


