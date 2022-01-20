Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E549570D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 00:37:42 +0100 (CET)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAgzt-00044P-Id
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 18:37:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj9-0002u8-7r
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:11 -0500
Received: from [2607:f8b0:4864:20::82a] (port=37875
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj7-0006jd-6v
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 15:08:10 -0500
Received: by mail-qt1-x82a.google.com with SMTP id w6so7626936qtk.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 12:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gcyvwy60lDI4mRKvvhxRvuWkmlILSey6pXpoZi3U/Ok=;
 b=BI7GWHHBZHT5mTxauRM9DklNp0DI72XFoRqJ52e0+rStA8+ZVJPpBZ1bxr+/iqKMnw
 Qw0KS/kMo0WgrGTbhNCrn+MQtSv39Txbnh4/0k4Q1uczXB5KDxgDpMymsoNgSevx84QP
 40XGtafwWnYMt0SZecq2KhIMZcuGsk8vZ+a86ILI8h+ttRR78D8PMs6tJhl3ed2A4Vyv
 GJ/AHmtFNcVweNs3BidhUsGqeV0CBeN0NL1tgamOFSmByoaLiwx26DfbB4kH3yVMxmc2
 iPJxHG/6cgrWem++FY8RoHa9DXWBIVtEDHNDXhYsGJX3K7vq3qT32Gu9D7v+h63DdTXX
 RoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gcyvwy60lDI4mRKvvhxRvuWkmlILSey6pXpoZi3U/Ok=;
 b=MRGn5ekoMp6bNnNUF+boImYdirI2qc/aa7+wEbgGZ0/5XY/9aNSALnLuOSc/RRmxc8
 jSBYtY9EVoMZs/rOlxFVPca6vfTPg2040awXE3Ja/l9qsVnbmhtR6KgqXVOPK16xwkmh
 LOpHoxK/2xXITQyl2PZSkO1/AnryhD2sOeiYXoDTPhAnStBhQqlnyFQ262H/4jKP5jAD
 3j9neVcuHKRQa9BJZnHP94uA90xN3rGHsmShH7BK9KkBTzsG83LUvYRdSM4fjGiWSdkM
 IHzM4Lv1mHeTnmPCi4paouobKDba8nnaC55VlYr7mDPBbdR8+sv2IbnXJ7heM40luZ0l
 QzXw==
X-Gm-Message-State: AOAM532KYlr45EK/gxSWjadDV6WavD9d4+76jrpPTdg1Qhkq6Q/Z+F2L
 5+QEs1TmMteoEsfdDqeVWSZm/RzREO/qjQ==
X-Google-Smtp-Source: ABdhPJyliGdFSMV2Im1Kn2Aib9rWlpdIlloIh0IDS3vQTmPpXV/3yL1+xg2XUOW1bXUbeyiWDawT4g==
X-Received: by 2002:ac8:7e89:: with SMTP id w9mr639009qtj.328.1642709288126;
 Thu, 20 Jan 2022 12:08:08 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id a136sm1834160qkc.56.2022.01.20.12.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:08:07 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC 3/5] target/riscv: Add support for mconfigptr
Date: Thu, 20 Jan 2022 12:07:33 -0800
Message-Id: <20220120200735.2739543-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120200735.2739543-1-atishp@rivosinc.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=atishp@rivosinc.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RISC-V privileged specification v1.12 introduced a mconfigptr
which will hold the physical address of a configuration data
structure. As Qemu doesn't have a configuration data structure,
is read as zero which is valid as per the priv spec.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64cc..f6f90b5cbd52 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -148,6 +148,7 @@
 #define CSR_MARCHID         0xf12
 #define CSR_MIMPID          0xf13
 #define CSR_MHARTID         0xf14
+#define CSR_MCONFIGPTR      0xf15
 
 /* Machine Trap Setup */
 #define CSR_MSTATUS         0x300
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 762d3269b4a4..e66bf2201857 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2030,6 +2030,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
     [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
+    [CSR_MCONFIGPTR]   = { "mconfigptr", any, read_zero, NULL, NULL, NULL, NULL,
+                                         PRIV_VERSION_1_12_0},
 
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
-- 
2.30.2


