Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E5688F4C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 07:01:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNp8C-0006Xx-KK; Fri, 03 Feb 2023 01:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp7e-0006T5-D4
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 01:00:35 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pNp7Z-0003zF-Hs
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 01:00:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id m14so3646577wrg.13
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 22:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wfp/RJXts34UshaPpHU1Gii7IT/6AAcVBxH8Q6qSD2U=;
 b=AhLFXZnScfpYaez2kG5nJG3zhXbVHBhVaB6SUmuys0O6ZDjzfovMW39NWbRt6QbbgV
 Ozo8KXoL1uKz4ccRZ+Ye9UvYVSCbkjIlPKXB41oB/MenCm9z9v7iqFSvu54J2Syyc/Cn
 TrOFSsjjw/VSCyk90v3EGj/fXgcz+ZIQ2FJJVieYBtNRFdxErp9TQ5TJWM24Zan/g1V/
 KIHzfo3JrSKH8OnOvNBlojW4HzkVASSKwLj/dr3yUNGGh+FaCNjEeSOTlNJA8to6QwhO
 CZPOTcerrQ6Oq/x7qdB+Ucg0c4Pl4qyDfINQr2UwUOtn8bQD+WBoLwKGfPJ33yWay4Y+
 3IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wfp/RJXts34UshaPpHU1Gii7IT/6AAcVBxH8Q6qSD2U=;
 b=1C+DULUJfLuARTIgdn4zU0ydYkROgizTDj2wvHLGN2ZKLgqKth+orkF6mH9LB/6elN
 XTQpnSsjDB/v0yRHA7W/of/cOykNIpnNimUy2vDa9djTKJS+nEGznGM0DHI3jh65SGYC
 4LUdAjyyBLGQT4SoKxxfULANeMphr5PZJElhSF3A7eyGxJ2HDS7SJEvGSA/k/smzPxmx
 TyMFXciG9RufDxxG/bebwjzmUU0SlczrRFx+1XK1JIXLO2oyT+aE1oZl/xSwQkr0sW5r
 dtjbfWgogDIO65ecGuS9opPPypxW4myyOGgoT/DxYmVaqNPzvWHufaFBffXPgzbzAzba
 q/xQ==
X-Gm-Message-State: AO0yUKXtdiW0Pu8GgdWg+yWtD7P77QmmHUtYywkt6BcjQAEb668Dhofn
 bsHhr1LVyM7vyjNKfbRpKsK9vg==
X-Google-Smtp-Source: AK7set+GKmSGSsi0UIp4ZlcCBpRwI8f3kMwfSWWFEwkRyFD4isIozx5gqdOns8gsunktDE+QzISg9Q==
X-Received: by 2002:adf:facc:0:b0:2bf:96b7:94ac with SMTP id
 a12-20020adffacc000000b002bf96b794acmr7925081wrs.41.1675404023866; 
 Thu, 02 Feb 2023 22:00:23 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 z1-20020a5d4c81000000b002bdd8f12effsm1115081wrs.30.2023.02.02.22.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 22:00:23 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v10 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Fri,  3 Feb 2023 06:58:09 +0100
Message-Id: <20230203055812.257458-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203055812.257458-1-alexghiti@rivosinc.com>
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This array is actually used as a boolean so swap its current char type
to a boolean and at the same time, change the type of validate_vm to
bool since it returns valid_vm_1_10_[32|64].

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0db2c233e5..6b157806a5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1117,16 +1117,16 @@ static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-static const char valid_vm_1_10_32[16] = {
-    [VM_1_10_MBARE] = 1,
-    [VM_1_10_SV32] = 1
+static const bool valid_vm_1_10_32[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV32] = true
 };
 
-static const char valid_vm_1_10_64[16] = {
-    [VM_1_10_MBARE] = 1,
-    [VM_1_10_SV39] = 1,
-    [VM_1_10_SV48] = 1,
-    [VM_1_10_SV57] = 1
+static const bool valid_vm_1_10_64[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV39] = true,
+    [VM_1_10_SV48] = true,
+    [VM_1_10_SV57] = true
 };
 
 /* Machine Information Registers */
@@ -1209,7 +1209,7 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static int validate_vm(CPURISCVState *env, target_ulong vm)
+static bool validate_vm(CPURISCVState *env, target_ulong vm)
 {
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         return valid_vm_1_10_32[vm & 0xf];
@@ -2648,7 +2648,8 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
 static RISCVException write_satp(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    target_ulong vm, mask;
+    target_ulong mask;
+    bool vm;
 
     if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
         return RISCV_EXCP_NONE;
-- 
2.37.2


