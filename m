Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C46F7A73
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujx9-0003GO-4Y; Thu, 04 May 2023 21:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvz-0001zf-83
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:35 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvs-0008E1-Hv
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ab1ce53ca6so8573315ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248903; x=1685840903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dAJxr69P9cXB/f/vPwh/m0VROIZUDkM1KS0tTkeyl0s=;
 b=j23oE5NLGc6wUeE6UqsmX3xxxZsD6KXCndmhK+SUYodVQ333OCd+97G8zIfgTdOcRw
 kXzU85GAZce1GlgoT/ozxtr4NIQqCXR8H/BRNFVixHBiGe25EeccpUpgHg6V04hRWQNd
 HL7rfmX7SUxxy+fVvq3zgn9OeMDgn5Is6hP1XBrrMZL8Mqi8PV2reOaS/jL23Fq8ghBJ
 cUx12/wqe90ceFpBq1M33+A3eMTDg9qpUJiAOiQ0I7lT5F6mGIHWa5psGT3+Lba3voE/
 YDy7zxQj2sgI9/u6m2zmRVqw+cO3IkpZD9r7BjiTOvN4lgnkXETpL05bRTPTTLts+RLg
 726Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248903; x=1685840903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dAJxr69P9cXB/f/vPwh/m0VROIZUDkM1KS0tTkeyl0s=;
 b=KtzqgOWOl1gy2w3Mq568/YdrG6ujVeQRhO/5wGLQPI33PPi4dJXNK6VDE1N6ukFIma
 WxwELolasOPiCaiP2kLACsHoh/LuCCy6D7+VU7iInt3PfvvLNAjL8bHFiiRLbg2yvfTY
 F5Pk91wSd/ZgCBEDKhQVTN98CYQPqXj3wxdMLCBW5MpdGzMYmiEY6/oQRbOgf0p0Nqv+
 zc6/tj4mT+bFcyfSNMV+issWFHe25wHbSVoqclZKdPRsWdv8qNpP7VdW0fGuBctkLMK9
 tSzIaNKO9VbFXGUoIqZoH5hDdzUcMsi336fE82O2Z8VtaX6aU+kSIXn8pwUxHh8YT6xi
 5ptQ==
X-Gm-Message-State: AC+VfDxghLD02V7hFqaDnN1EqaUMJ3WXOawhnsWgoW5K0P/a71DbNBjp
 OVaYFhECL12qZ5XXPxQH5Xqgat5GkYQvnw==
X-Google-Smtp-Source: ACHHUZ7dJcEDIafY8xpW2eblia2nIL2Wdh83oHRKDikWUxyen3EP7rcgs8+/eEZQ5bvJ3XxeVbRNyQ==
X-Received: by 2002:a17:902:e883:b0:1ab:a30:c89d with SMTP id
 w3-20020a170902e88300b001ab0a30c89dmr7066860plg.51.1683248902925; 
 Thu, 04 May 2023 18:08:22 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:08:22 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrea Parri <andrea@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 88/89] riscv: Make sure an exception is raised if a pte is
 malformed
Date: Fri,  5 May 2023 11:02:40 +1000
Message-Id: <20230505010241.21812-89-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alexandre Ghiti <alexghiti@rivosinc.com>

As per the specification, in 64-bit, if any of the pte reserved bits
60-54 is set an exception should be triggered (see 4.4.1, "Addressing and
Memory Protection"). In addition, we must check the napot/pbmt bits are
not set if those extensions are not active.

Reported-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230420150220.60919-1-alexghiti@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fb63b8e125..59f0ffd9e1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -644,6 +644,7 @@ typedef enum {
 #define PTE_SOFT            0x300 /* Reserved for Software */
 #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
+#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
 #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
 
 /* Page table PPN shift amount */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b68dcfe7b6..57d04385f1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -927,13 +927,20 @@ restart:
 
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
-        } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
-            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         } else {
-            ppn = pte >> PTE_PPN_SHIFT;
-            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
+            if (pte & PTE_RESERVED) {
+                return TRANSLATE_FAIL;
+            }
+
+            if (!pbmte && (pte & PTE_PBMT)) {
                 return TRANSLATE_FAIL;
             }
+
+            if (!riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
+                return TRANSLATE_FAIL;
+            }
+
+            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
         }
 
         if (!(pte & PTE_V)) {
-- 
2.40.0


