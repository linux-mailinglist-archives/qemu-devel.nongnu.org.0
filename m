Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0667B6DA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:22:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKiXT-0002Ec-3A; Wed, 25 Jan 2023 11:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiXR-0002EM-8o
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:22:17 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiXP-00034t-CI
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:22:16 -0500
Received: by mail-wr1-x433.google.com with SMTP id b7so17612660wrt.3
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TrQUDShuSlYfHT4YnhyHx3S9WBzIjkLW6v+vF/2lyw=;
 b=j78R8EUbLB+t+ezNAfwZm897Sxg2Lpfpjcme/JuW1DO+v6n0geq0aWdZz2IVDv+/gy
 6QS4wmYrxSqXQN/kHeem6kMFx6mkNwHgD1ny8BYWGaOcjvuWjnU5VvratGRTqiL9zq9d
 wdCJxbSUZzru5Uq6RtegyChLAyeDE2otgocHdvr29uOksXBxmSMb8R6RY5+0wnjG28Rc
 AJFsFipxxDy/h9p1aVje3CUw9h3PLsUSO9G9qLPRWr5mJe+wvT9Pbad1MVwGoX3hJU2L
 5dfSkv8C/i/qpy+bYYB0FGCvzuuGYtqz3ntdLx8/9OyLxq1Og2qhP1zKn+s6emSwiVTM
 TZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TrQUDShuSlYfHT4YnhyHx3S9WBzIjkLW6v+vF/2lyw=;
 b=dszD1cDWMOZBKTgzyjfVMQWxojVd7n1cMucP0T3VX591vtOOW2H9s3A/d7CVSlwBVb
 SL6GQcoxA1qRkVKFvEwLOoFeV8Vildv8U6e3SfEnAFQlGbQchzEsxIazECfXz4uyzLeZ
 Nqm7gh9cjA8HeSaqLmR0xqgr1p7rKvBlLu7/2iSK97v0aH8T6Agemp+zE9ghm/5Mrxsq
 mCpAaewai2rP1zQgALBxwbYoXL58HG16/W6V/YFDCoB3ENIPRAodCAVUAzvQNu8cGrOV
 /OwJL/wd1vYiH4kOTM+a4mHqTvfIE3f6YkYV7efMnCQAKYNlz+c1qYBPhQAr3wLjQrz4
 39LA==
X-Gm-Message-State: AO0yUKX4PkcKKHl6bwPvfKZZ9yVN90MZBfIOfPGMpy96u5c7WgltYKzn
 rY5iF3qd14cPxGw+7wHr9BVblQ==
X-Google-Smtp-Source: AK7set+eKx//tojLN+1VBYzk+Z/r9boFi+pPxRf0DZD17+Ic9PgxWkqEm4eKT6nBvUAMiX08p0cNaA==
X-Received: by 2002:a5d:4f09:0:b0:2bf:b9b1:28d0 with SMTP id
 c9-20020a5d4f09000000b002bfb9b128d0mr2836441wru.66.1674663733944; 
 Wed, 25 Jan 2023 08:22:13 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 l10-20020a05600012ca00b002bfb02153d1sm5128696wrx.45.2023.01.25.08.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:22:13 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Wed, 25 Jan 2023 17:20:07 +0100
Message-Id: <20230125162010.1615787-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125162010.1615787-1-alexghiti@rivosinc.com>
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


