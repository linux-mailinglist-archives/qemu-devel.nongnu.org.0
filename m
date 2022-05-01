Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310E516226
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:16:29 +0200 (CEST)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2se-00044F-46
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0006sD-Q0
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:51 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tf-0001Fu-I2
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:41 -0400
Received: by mail-pf1-x434.google.com with SMTP id p12so10115747pfn.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9JbA/4mJJzCg1BoSjOe8spAl/jM5dv9tZGOFooq9Lk=;
 b=GDlZxwmsilH0VCieHvbKqLSaZdinDddfExXGJxEUWq5g7Zr/2y+r80sk/zwG8pKSqS
 OyaX+S1i9GhnPI6EZgGiDQCIe24Ufy5AINb+xHSEyGYy6d7W3jRRGnQknmfYnEZScOio
 oxBGonrBLlItUZaNqJ+7a6GVvTHrsW4bKjIycYzp2LLnYSIHoWNbIvdY91Zau38fOXcH
 KWi94hGD4aebMckYUodO54+FTlK5KaJ1mke2fEAPjRepyghWxeDD+Kv0MmATkE2iVDqp
 yus36Ubs6Vmelm5WRlHRg7swomitCn0BwA+B5kL8EI2SJgoNIpOSn+u6VSfwOaj0qkVE
 a9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9JbA/4mJJzCg1BoSjOe8spAl/jM5dv9tZGOFooq9Lk=;
 b=Ti+PfGGjQcS96H50cQsPnqs/74isCkWpcEIf8w7p8l4X3gK+VH8wMo0tLmTNsAlsLU
 XuAUI1YmHW1lL1Hm42w3I3PYDWUFhaqMyfY6FhyIImVrhmPp3nKDgj0Xv2vtQtYKMDI/
 SiGJWzL7wGNwATb9vfvRLqlmtZR8Od0qTZF4MmSYtwPH2oSzv1l0D3xT4g30WhU7al6g
 dMsiBUxiVEhXaY+R9zx74brpjWeVCr3xtwIgi+CA9r3aHhtV1ogSEIXGIZu4eIDYtSR0
 8udmlKrr1N7V9ImofMSo/Kk9gSDDiiPlDN8NpGWe5KcDgFfxiB5pjWF/pTcdhGe5dRc8
 OqzQ==
X-Gm-Message-State: AOAM533hxHkwHMfntD/8n91siZ/JY5gO4pszHLzpLiA46Ws7HMRx/clm
 s+CC67/CsPULLc8aX5PNFZEI6TtiZKhcrQ==
X-Google-Smtp-Source: ABdhPJy7MaCH11IthoWLLviubSAZWgFmmvf+NeSA3psJdYNqkfnfWfYK7q0WCYspGtPsRAwnoYfohQ==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id
 t8-20020a056a0021c800b004c404bddc17mr6117099pfj.57.1651384238220; 
 Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/45] target/arm: Name CPState type
Date: Sat, 30 Apr 2022 22:49:50 -0700
Message-Id: <20220501055028.646596-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give this enum a name and use in ARMCPRegInfo,
add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 6 +++---
 target/arm/helper.c | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 858c5da57d..4179a8cdd5 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -114,11 +114,11 @@ enum {
  * Note that we rely on the values of these enums as we iterate through
  * the various states in some places.
  */
-enum {
+typedef enum {
     ARM_CP_STATE_AA32 = 0,
     ARM_CP_STATE_AA64 = 1,
     ARM_CP_STATE_BOTH = 2,
-};
+} CPState;
 
 /*
  * ARM CP register secure state flags.  These flags identify security state
@@ -260,7 +260,7 @@ struct ARMCPRegInfo {
     uint8_t opc1;
     uint8_t opc2;
     /* Execution state in which this register is visible: ARM_CP_STATE_* */
-    int state;
+    CPState state;
     /* Register type: ARM_CP_* bits/values */
     int type;
     /* Access rights: PL*_[RW] */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a19e04bb0b..d560a6a6a9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8502,7 +8502,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 }
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                   void *opaque, int state, int secstate,
+                                   void *opaque, CPState state, int secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
@@ -8662,13 +8662,15 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
      * bits; the ARM_CP_64BIT* flag applies only to the AArch32 view of
      * the register, if any.
      */
-    int crm, opc1, opc2, state;
+    int crm, opc1, opc2;
     int crmmin = (r->crm == CP_ANY) ? 0 : r->crm;
     int crmmax = (r->crm == CP_ANY) ? 15 : r->crm;
     int opc1min = (r->opc1 == CP_ANY) ? 0 : r->opc1;
     int opc1max = (r->opc1 == CP_ANY) ? 7 : r->opc1;
     int opc2min = (r->opc2 == CP_ANY) ? 0 : r->opc2;
     int opc2max = (r->opc2 == CP_ANY) ? 7 : r->opc2;
+    CPState state;
+
     /* 64 bit registers have only CRm and Opc1 fields */
     assert(!((r->type & ARM_CP_64BIT) && (r->opc2 || r->crn)));
     /* op0 only exists in the AArch64 encodings */
-- 
2.34.1


