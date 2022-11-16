Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CD62C6CB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovMWP-0006Q1-Fi; Wed, 16 Nov 2022 12:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1ovMWM-0006Ol-MN; Wed, 16 Nov 2022 12:48:22 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1ovMWK-00014J-PT; Wed, 16 Nov 2022 12:48:22 -0500
Received: by mail-wm1-x331.google.com with SMTP id p16so12431923wmc.3;
 Wed, 16 Nov 2022 09:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrvwPOtZNfEKsXjuC0ZbgXfL4yPk3ZZbpxNJSMb/UOA=;
 b=kv5/q0izde86fUAHLrYnS/iqNpfCZR5yIllPFKLWllH/3jTLFYKnSVqvENoNgR+rgT
 PZowt2UvPJkFgTgr8hZMVAfVBCp0QhejBqscpDb5NiROzyhFdVkw4+I/N8ddB38VaZtl
 Yl3nFT8mxdorI5rCSQIJvZ0vsSpqKNqOL0R10WyDTHsNGEoKyuevGtDvfgs3DMFqSwoD
 ck59Qxyzcg3mmEdgQMyn3WDV0dekpu/ZpRhYBe01apNx19o07xC4S1RqkC64S1HZK1Ly
 D/ecKc8ZsrpH8q7plDDj+1/EyPk6cQD98oESeUWHUpFpXJwoJzoQQR0tj7SbKFtCSXgz
 dj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KrvwPOtZNfEKsXjuC0ZbgXfL4yPk3ZZbpxNJSMb/UOA=;
 b=DIeQWv9RDrK6jF6Sg2Ul1cOCzPx1tgDs+0V2UsNGGku0ch6p6ZySfMSqOjawXUGtqf
 bB40jKDqRAyOq5aREpFTYhxCKbEsyOu9wKZ4jo6ad0+BIyNHSd7PtuZzN+PBO5lSnuCb
 LjZWPdBY/tLvCr8PxEmESVPnEBjkG2F6AAZa7UboUJcDCS0DN2d6H7ywzd/C3BlJ0h3c
 yPlbqU/+Dm2u7J2cnKTQpazhyVaEukcOeROT5l/3HmDXW5XXU86f9DXl+uDrshRuMPVr
 YtjgMEU5zGjY/kQCJXDhJrPtv18UxpWnyWg8suXuiFzXBEiRQUxR8vPn8okyNG9v/9i3
 G5AQ==
X-Gm-Message-State: ANoB5pm0hd7ZBaWRCw8IDr8ptwu+9iLMSNuRhdg4xTe6nUqlFAlluQ75
 3lUU4/t00yJZjT+eUTX1NMcN70IX29Ii7Q==
X-Google-Smtp-Source: AA0mqf6wdc3n0wBAT6sQF53c/7LvqiuSfO5xEgRE5OdT/HVAIB6I/w/aMLJ+tDVBV0+683DzVBMb6Q==
X-Received: by 2002:a05:600c:3d1b:b0:3cf:670e:63cc with SMTP id
 bh27-20020a05600c3d1b00b003cf670e63ccmr2975784wmb.150.1668620899089; 
 Wed, 16 Nov 2022 09:48:19 -0800 (PST)
Received: from localhost.localdomain (229.19.205.77.rev.sfr.net.
 [77.205.19.229]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c465100b003cf483ee8e0sm2477490wmo.24.2022.11.16.09.48.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 16 Nov 2022 09:48:18 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v2 3/3] hvf: handle writes of MDSCR_EL1 and DBG*_EL1
Date: Wed, 16 Nov 2022 18:47:49 +0100
Message-Id: <20221116174749.65175-4-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116174749.65175-1-fcagnin@quarkslab.com>
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

From: Francesco Cagnin <fcagnin@quarkslab.com>

This proved to be required when debugging the Linux kernel's initial
code, as the Hypervisor framework was triggering 'EC_SYSTEMREGISTERTRAP'
VM exits after enabling trap exceptions with
'hv_vcpu_set_trap_debug_exceptions()'.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 target/arm/hvf/hvf.c | 140 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 66fc82e9b9..c28c3dbdaa 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -95,6 +95,71 @@ static void hvf_arm_init_debug(CPUState *cpu)
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
+#define SYSREG_MDSCR_EL1      SYSREG(2, 0, 0, 2, 2)
+#define SYSREG_DBGBVR0_EL1    SYSREG(2, 0, 0, 0, 4)
+#define SYSREG_DBGBCR0_EL1    SYSREG(2, 0, 0, 0, 5)
+#define SYSREG_DBGWVR0_EL1    SYSREG(2, 0, 0, 0, 6)
+#define SYSREG_DBGWCR0_EL1    SYSREG(2, 0, 0, 0, 7)
+#define SYSREG_DBGBVR1_EL1    SYSREG(2, 0, 0, 1, 4)
+#define SYSREG_DBGBCR1_EL1    SYSREG(2, 0, 0, 1, 5)
+#define SYSREG_DBGWVR1_EL1    SYSREG(2, 0, 0, 1, 6)
+#define SYSREG_DBGWCR1_EL1    SYSREG(2, 0, 0, 1, 7)
+#define SYSREG_DBGBVR2_EL1    SYSREG(2, 0, 0, 2, 4)
+#define SYSREG_DBGBCR2_EL1    SYSREG(2, 0, 0, 2, 5)
+#define SYSREG_DBGWVR2_EL1    SYSREG(2, 0, 0, 2, 6)
+#define SYSREG_DBGWCR2_EL1    SYSREG(2, 0, 0, 2, 7)
+#define SYSREG_DBGBVR3_EL1    SYSREG(2, 0, 0, 3, 4)
+#define SYSREG_DBGBCR3_EL1    SYSREG(2, 0, 0, 3, 5)
+#define SYSREG_DBGWVR3_EL1    SYSREG(2, 0, 0, 3, 6)
+#define SYSREG_DBGWCR3_EL1    SYSREG(2, 0, 0, 3, 7)
+#define SYSREG_DBGBVR4_EL1    SYSREG(2, 0, 0, 4, 4)
+#define SYSREG_DBGBCR4_EL1    SYSREG(2, 0, 0, 4, 5)
+#define SYSREG_DBGWVR4_EL1    SYSREG(2, 0, 0, 4, 6)
+#define SYSREG_DBGWCR4_EL1    SYSREG(2, 0, 0, 4, 7)
+#define SYSREG_DBGBVR5_EL1    SYSREG(2, 0, 0, 5, 4)
+#define SYSREG_DBGBCR5_EL1    SYSREG(2, 0, 0, 5, 5)
+#define SYSREG_DBGWVR5_EL1    SYSREG(2, 0, 0, 5, 6)
+#define SYSREG_DBGWCR5_EL1    SYSREG(2, 0, 0, 5, 7)
+#define SYSREG_DBGBVR6_EL1    SYSREG(2, 0, 0, 6, 4)
+#define SYSREG_DBGBCR6_EL1    SYSREG(2, 0, 0, 6, 5)
+#define SYSREG_DBGWVR6_EL1    SYSREG(2, 0, 0, 6, 6)
+#define SYSREG_DBGWCR6_EL1    SYSREG(2, 0, 0, 6, 7)
+#define SYSREG_DBGBVR7_EL1    SYSREG(2, 0, 0, 7, 4)
+#define SYSREG_DBGBCR7_EL1    SYSREG(2, 0, 0, 7, 5)
+#define SYSREG_DBGWVR7_EL1    SYSREG(2, 0, 0, 7, 6)
+#define SYSREG_DBGWCR7_EL1    SYSREG(2, 0, 0, 7, 7)
+#define SYSREG_DBGBVR8_EL1    SYSREG(2, 0, 0, 8, 4)
+#define SYSREG_DBGBCR8_EL1    SYSREG(2, 0, 0, 8, 5)
+#define SYSREG_DBGWVR8_EL1    SYSREG(2, 0, 0, 8, 6)
+#define SYSREG_DBGWCR8_EL1    SYSREG(2, 0, 0, 8, 7)
+#define SYSREG_DBGBVR9_EL1    SYSREG(2, 0, 0, 9, 4)
+#define SYSREG_DBGBCR9_EL1    SYSREG(2, 0, 0, 9, 5)
+#define SYSREG_DBGWVR9_EL1    SYSREG(2, 0, 0, 9, 6)
+#define SYSREG_DBGWCR9_EL1    SYSREG(2, 0, 0, 9, 7)
+#define SYSREG_DBGBVR10_EL1   SYSREG(2, 0, 0, 10, 4)
+#define SYSREG_DBGBCR10_EL1   SYSREG(2, 0, 0, 10, 5)
+#define SYSREG_DBGWVR10_EL1   SYSREG(2, 0, 0, 10, 6)
+#define SYSREG_DBGWCR10_EL1   SYSREG(2, 0, 0, 10, 7)
+#define SYSREG_DBGBVR11_EL1   SYSREG(2, 0, 0, 11, 4)
+#define SYSREG_DBGBCR11_EL1   SYSREG(2, 0, 0, 11, 5)
+#define SYSREG_DBGWVR11_EL1   SYSREG(2, 0, 0, 11, 6)
+#define SYSREG_DBGWCR11_EL1   SYSREG(2, 0, 0, 11, 7)
+#define SYSREG_DBGBVR12_EL1   SYSREG(2, 0, 0, 12, 4)
+#define SYSREG_DBGBCR12_EL1   SYSREG(2, 0, 0, 12, 5)
+#define SYSREG_DBGWVR12_EL1   SYSREG(2, 0, 0, 12, 6)
+#define SYSREG_DBGWCR12_EL1   SYSREG(2, 0, 0, 12, 7)
+#define SYSREG_DBGBVR13_EL1   SYSREG(2, 0, 0, 13, 4)
+#define SYSREG_DBGBCR13_EL1   SYSREG(2, 0, 0, 13, 5)
+#define SYSREG_DBGWVR13_EL1   SYSREG(2, 0, 0, 13, 6)
+#define SYSREG_DBGWCR13_EL1   SYSREG(2, 0, 0, 13, 7)
+#define SYSREG_DBGBVR14_EL1   SYSREG(2, 0, 0, 14, 4)
+#define SYSREG_DBGBCR14_EL1   SYSREG(2, 0, 0, 14, 5)
+#define SYSREG_DBGWVR14_EL1   SYSREG(2, 0, 0, 14, 6)
+#define SYSREG_DBGWCR14_EL1   SYSREG(2, 0, 0, 14, 7)
+#define SYSREG_DBGBVR15_EL1   SYSREG(2, 0, 0, 15, 4)
+#define SYSREG_DBGBCR15_EL1   SYSREG(2, 0, 0, 15, 5)
+#define SYSREG_DBGWVR15_EL1   SYSREG(2, 0, 0, 15, 6)
+#define SYSREG_DBGWCR15_EL1   SYSREG(2, 0, 0, 15, 7)
 
 #define WFX_IS_WFE (1 << 0)
 
@@ -1039,6 +1104,81 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         break;
+    case SYSREG_MDSCR_EL1:
+        env->cp15.mdscr_el1 = val;
+        break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        env->cp15.dbgbvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        env->cp15.dbgbcr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        env->cp15.dbgwvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        env->cp15.dbgwcr[SYSREG_CRM(reg)] = val;
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
-- 
2.38.1


