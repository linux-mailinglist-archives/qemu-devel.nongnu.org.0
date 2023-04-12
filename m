Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DF6DF01E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 11:18:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmWbg-0007Cv-UG; Wed, 12 Apr 2023 05:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pmWbd-0007CY-So
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:17:33 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pmWbR-0004j8-6B
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:17:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso7591839wmb.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1681291038; x=1683883038; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LGpSnkBJ4zhtllDlsdgv+XdCiU1d9KOkSdJhsZZctEQ=;
 b=fOs2MMJ6Q7qjToXaPLq5eUZwBzWFpsW4rgN9Vxh224sdufPPCrP53BTbXveVZyI+SO
 Bfsl4R03y8oMqMFORO9iZerXlUARhHjjZYP/f9MbWnDRjhBQt14/KY5N4LMIUKYmL4Uq
 AxJ6dc5BCnHCvJJwRKqXtxPmTkZNjRjr7SGmAhrQ5eFFxTkB3xGZeBX10NJjsYmbnTx1
 ehSD3Neweo8HZAtzydwf8bKCNxJ+HYx9uhDTzh1nyjse/zjL1dR6m8POP82cbl/oUKzE
 fIFH2Qa7Ngp2ICdDzy4CSZ/jT42Q9S7r/HNv/mJcbfn9UqbHx1fVh+IPNRS5vnd5QF3j
 cJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681291038; x=1683883038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LGpSnkBJ4zhtllDlsdgv+XdCiU1d9KOkSdJhsZZctEQ=;
 b=EO/VK15UXY/S3Fqohuio7IxZ5ysedcR6aK6+ui9UY4XYi6L9TqmeA24DH6tDyWjRAU
 V6lpputtPtQByU7J2jLfq+4O+BmfN6OKQk5hE8XH7eVwJF4vOkKubFX60EOmLD1jMSvm
 JnlgFURsW7Rjb4vI+xVd8OmK7k09UWsyf2bQloAr4W68M30CXWIgj8W3YApdgCmFXKa3
 szNfN/QW2+9jQk0d2id5TJDv1Bc+8O2i64CYMvZr142iNQQ32ZNFB2gaA6ItvzlPcWUO
 B0QWB4D0p8sHw5Ly19WNOAspdDLWcqBa2EL6IWkQ1hkqEHkPAzOFvZ3e7d4wU3mV9sBa
 V3Ww==
X-Gm-Message-State: AAQBX9e2wvFGgtlvIoeKd6pfhCp63YVfts+C0LoGvvkkC+O38S4jTE9P
 OyGGbHOWvq4s5ZxY7v4YTNsVGQ==
X-Google-Smtp-Source: AKy350ZaSHVzlgHTmWDXxlLFU90DnFK09dj58Wf2yIKeQ42MhmQUgGlweo0od2oNn09h4VV29EjBfA==
X-Received: by 2002:a1c:f609:0:b0:3ed:3d89:1b4b with SMTP id
 w9-20020a1cf609000000b003ed3d891b4bmr12129585wmc.8.1681291038507; 
 Wed, 12 Apr 2023 02:17:18 -0700 (PDT)
Received: from alex-rivos.home
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a7bc385000000b003edcc2223c6sm1668271wmj.28.2023.04.12.02.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 02:17:18 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrea Parri <andrea@rivosinc.com>
Subject: [PATCH] riscv: Raise an exception if pte reserved bits are not cleared
Date: Wed, 12 Apr 2023 11:17:16 +0200
Message-Id: <20230412091716.126601-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x334.google.com
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

As per the specification, in 64-bit, if any of the pte reserved bits 60-54
is set, an exception should be triggered (see 4.4.1, "Addressing and Memory
Protection"), so implement this behaviour in the address translation process.

Reported-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 target/riscv/cpu_bits.h   | 1 +
 target/riscv/cpu_helper.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef..8d9ba2ce11 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -640,6 +640,7 @@ typedef enum {
 #define PTE_SOFT            0x300 /* Reserved for Software */
 #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
+#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
 #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
 
 /* Page table PPN shift amount */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..39c323a865 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -936,6 +936,11 @@ restart:
             return TRANSLATE_FAIL;
         }
 
+        /* PTE reserved bits must be cleared otherwise an exception is raised */
+        if (riscv_cpu_mxl(env) == MXL_RV64 && (pte & PTE_RESERVED)) {
+            return TRANSLATE_FAIL;
+        }
+
         bool pbmte = env->menvcfg & MENVCFG_PBMTE;
         bool hade = env->menvcfg & MENVCFG_HADE;
 
-- 
2.37.2


