Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53325682F3A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqt1-0003UH-S1; Tue, 31 Jan 2023 08:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqst-0003TR-Au
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:41:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pMqsq-00068z-Ck
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:41:14 -0500
Received: by mail-wm1-x330.google.com with SMTP id o36so4335461wms.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ku5chqQZqihMdsh/PiLWwwVUxYQvo63LZ6tE21x8W2E=;
 b=AwzYVplaT0WA/lNvdWJFGBJ/s1hcEeT1p+2quzbqk5/KvUx9MvaXHt1rP8Pbe9Yzq2
 NAF4aSKEY2h69EzcpeSOWNpQo2SczlktgZq3Yx6sKC3u2nVmjl2We0pW1i72JI4HdRmz
 w42U1tOcmO/vo+Jw6mVBgCZHF/blne/bV9obo4X4J//yGzFbdFK32fuvRhGguIHib800
 qb0sIcWduPcNWWaov8udkFvK9jU4lG42iHw6yZSXUDPRlAgVnkG9nv8z/TJ664Kt5uTX
 0sQEDLnMG2RKJE8RYkjuhie/dUSXxbLy1k3pgC8VTQW89vc8+hVaqRKrrLkXlzfOJ8ZK
 Lm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ku5chqQZqihMdsh/PiLWwwVUxYQvo63LZ6tE21x8W2E=;
 b=Fa5lDKM5YS5WDkDmZOWoK/c0+W+Rtma+YcLNmPstpfgHz367auUNJAqtj9AFyOFUSU
 mHYzjUHzbwLrml+6q6ymJ/+aaFk6YksrJYOnyLQIb1UN9EulXx/yYI5603tiHcC/lkf4
 S2zbrmpF/SpFgaGLYzSJw17Pwf9w7zYr2Ow6CgIcSePN3ATthxeSnQnkdCryEjReciqQ
 P6XRey1cJWVSafIVf6+JR7DZq7H0a8mEesH9UWa7Odu1nhzYnUxh2hlGwgLENutEIfZB
 Y4VETn8g13A/zgli5Btu6hl1+duVTSCz6O8MPE8eaF0ESwEyClvVCqM30P0LdcD+b5on
 f7cg==
X-Gm-Message-State: AO0yUKV5nBBxuSrMYQiVU2G+PHOg2rtJuwd3f37xOaVQlmes03a8t/Ed
 SDwZpuYwwEpqFzW49tlhHjgDTg==
X-Google-Smtp-Source: AK7set+xnFsQeypNN5GmlkA9HSsjJNUzwVGy636BPp46R9gstn14tGJE7W/jW4k+1SChO5ZcPiB/8A==
X-Received: by 2002:a05:600c:4e89:b0:3dc:198c:dde with SMTP id
 f9-20020a05600c4e8900b003dc198c0ddemr24378639wmq.41.1675172470734; 
 Tue, 31 Jan 2023 05:41:10 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b003dc530186e1sm9930680wmo.45.2023.01.31.05.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:41:10 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v9 2/5] riscv: Change type of valid_vm_1_10_[32|64] to bool
Date: Tue, 31 Jan 2023 14:39:03 +0100
Message-Id: <20230131133906.1956228-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131133906.1956228-1-alexghiti@rivosinc.com>
References: <20230131133906.1956228-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x330.google.com
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


