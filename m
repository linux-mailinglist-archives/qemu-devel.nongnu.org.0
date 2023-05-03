Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE446F51FF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rh-00064B-2k; Wed, 03 May 2023 03:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qM-0002yp-1Z
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qI-0001mR-Ds
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso29150045e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098640; x=1685690640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AI+IxDJLeDO5jUI5/lgC640eUH0gaL32tMe2tKV/5Uo=;
 b=mDqB8L2ocNxKwN+dpRS4d1OWXkcIGYvIualo/QRb7prYgkpi8e+VRVfVppojQdZy+C
 to4GYnlRpoXDmph48p2NdKkRX3PCnKLS+qy8/vYYvQjymiker+r6y9icppHRnDIK0Se2
 Mop1vtSihyvx0uocKv0YM41zZOOSUR9zFITv3PO7OK8X7pfmgAbI/tgKaa9NRwRaVWJr
 FUfQwd1Kdf3pEJTRC6z897/yJHFgLFXjcsHo7inQ+n8fpHt2c8MlUnGTFnuw3Mud1lbm
 d0LL3S0CSpNxuHMjc5qrISnwl/aFXiFYCousWhjbor5oIesSwcWyPEj+lBbxk+b4CYuZ
 emNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098640; x=1685690640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AI+IxDJLeDO5jUI5/lgC640eUH0gaL32tMe2tKV/5Uo=;
 b=OYBFE6w93Eii0g7ZpStLB4jnTBLbWHCEf/SCybBNvwa8/pOszo4gRV0wC3+/P3gwVW
 aYjp+9nHKhzrh3DNfIpWUDdwp4RgYiEpHzIVskEyv/+StSqGM0ILG8yQDDkv1Iwfcjs4
 qniQ98c+qCM42uege6Yk1NGCzunMMX3nSvrkIzGo8UUGzQme/3199vaH/evK9UPjJds1
 slHADCSEbzOB/g0qn1k0KydRtRdWvBwaZol6JfHkLKEzqhCTk3Syhkf6oXTndQ1VoDyG
 Bo0LkbcY0ScWzOPwvFuPsu82dveU0Y48Sj/Y8xKbhB6gN7DHWSTllCYfeZvPis9uiaRA
 VtNg==
X-Gm-Message-State: AC+VfDwQ7lry4agzXS1Te+47upMYBIHhgKP2nuDi6t2fjqdTHtoSebFU
 XQh88TaqoqvfLyip7A+ZX/+X1U391P08iQ6A7E99Nw==
X-Google-Smtp-Source: ACHHUZ5f7I+JVixy96Aqst4WxGYHHTMLK9ft3dabLGe2eZh+oFjI8X5cI5BMiXk7596kRKynJK8EYw==
X-Received: by 2002:a7b:ce8b:0:b0:3f1:7fc0:4dbc with SMTP id
 q11-20020a7bce8b000000b003f17fc04dbcmr14380810wmj.38.1683098639867; 
 Wed, 03 May 2023 00:23:59 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 35/84] tcg: Remove TCG_TARGET_TLB_DISPLACEMENT_BITS
Date: Wed,  3 May 2023 08:22:42 +0100
Message-Id: <20230503072331.1747057-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The last use was removed by e77c89fb086a.

Fixes: e77c89fb086a ("cputlb: Remove static tlb sizing")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h | 1 -
 tcg/arm/tcg-target.h     | 1 -
 tcg/i386/tcg-target.h    | 1 -
 tcg/mips/tcg-target.h    | 1 -
 tcg/ppc/tcg-target.h     | 1 -
 tcg/riscv/tcg-target.h   | 1 -
 tcg/s390x/tcg-target.h   | 1 -
 tcg/sparc64/tcg-target.h | 1 -
 tcg/tci/tcg-target.h     | 1 -
 9 files changed, 9 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index fa6af9746f..3f562be6d9 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -14,7 +14,6 @@
 #define AARCH64_TCG_TARGET_H
 
 #define TCG_TARGET_INSN_UNIT_SIZE  4
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 typedef enum {
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 65efc538f4..c649db72a6 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -31,7 +31,6 @@ extern int arm_arch;
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define MAX_CODE_GEN_BUFFER_SIZE  UINT32_MAX
 
 typedef enum {
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 7ebd6e5135..9b2ac34015 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -26,7 +26,6 @@
 #define I386_TCG_TARGET_H
 
 #define TCG_TARGET_INSN_UNIT_SIZE  1
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 31
 
 #ifdef __x86_64__
 # define TCG_TARGET_REG_BITS  64
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 7277a117ef..e52cdf0e89 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -36,7 +36,6 @@
 #endif
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define TCG_TARGET_NB_REGS 32
 
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 204b70f86a..40f20b0c1a 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -34,7 +34,6 @@
 
 #define TCG_TARGET_NB_REGS 64
 #define TCG_TARGET_INSN_UNIT_SIZE 4
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 
 typedef enum {
     TCG_REG_R0,  TCG_REG_R1,  TCG_REG_R2,  TCG_REG_R3,
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 494c986b49..ffb3d9b5b4 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -35,7 +35,6 @@
 #define TCG_TARGET_REG_BITS 64
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
 #define TCG_TARGET_NB_REGS 32
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index ec96952172..9a405003b9 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -26,7 +26,6 @@
 #define S390_TCG_TARGET_H
 
 #define TCG_TARGET_INSN_UNIT_SIZE 2
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 19
 
 /* We have a +- 4GB range on the branches; leave some slop.  */
 #define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 31c5537379..d454278811 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -26,7 +26,6 @@
 #define SPARC_TCG_TARGET_H
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
 #define TCG_TARGET_NB_REGS 32
 #define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
 
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 28dc6d5cfc..60a6ed65ce 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -42,7 +42,6 @@
 
 #define TCG_TARGET_INTERPRETER 1
 #define TCG_TARGET_INSN_UNIT_SIZE 4
-#define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
 #define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 #if UINTPTR_MAX == UINT32_MAX
-- 
2.34.1


