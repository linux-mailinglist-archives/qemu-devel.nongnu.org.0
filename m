Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B720A445EC2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:34:22 +0100 (CET)
Received: from localhost ([::1]:57098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipzh-0001fm-Oy
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm6-0004j3-FK
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:18 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:39890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipm3-0004Cu-6P
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:18 -0400
Received: by mail-io1-xd2d.google.com with SMTP id r3so7829260iod.6
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=NEEjkj/fIC5F3QLF/bGtQy0UfetDO/cLXBrFTHJ0pouW6+w1eWh6lXd1FJGY5TYknN
 33UgkwxNasdIrKoiWQOswdqm2NMxDG64rEP9HNF1v/UEpTfEa1MCJo2knlCaXcA6GHOu
 mZduwBcl6JjhLlMquVBjHzRVxF53JqJXeXw5UkeruPJB0k6hIsrCWa1INbiDNqjYayAY
 f9zvt4JKEaT4+8myHRAc3+R1J8o2XYVhaaM+n5dF+MijkVLA8+ix6xXJlDKyb13rcDMZ
 l4EamWrFbLrhPOwP10guuWg1L2RaP8fb3W/G27EHrEzPBIfr8RMBmr5NM+A962QHLojz
 plwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=gxrQ0gFoKBYY7cc545hbXAVezVPtyL9Wi2BCcKB8Omrh9gP4uM17yNKs0KgR8VZJoT
 SGWGphnrzaVvOLVS/Iu3RBnFelO6VP5O4SSU9iaxtO3dI2K/B3KLOeO+HXiONrhVS+Jc
 3n3tpu3Jnlx5F3YrUqeaYZ9dwJc98kSksdc74FTakouDYPf4qJDrSkCaopDMuCCx9Ef3
 3l9J5nSQjWw7LxU2NSgF0yYzS/2CixMKDFCwvKXDPjyODpuxHPUL/a73aWZHPWUIxctD
 P7/t8+fY/miO4mJCJCz48Kk5oT/FovV1QD92UiFg7PW9iisDxl0DTGF3pKbJ2iUE8Doo
 Vsqw==
X-Gm-Message-State: AOAM531Oia+sgRqv680FC1+gsCdJR8AmY0ZsVSw5SJ2dwFs24MNAUru0
 l1oTGEGEoZQ9gfRhm/k5wLrtHEwOnnXcUg==
X-Google-Smtp-Source: ABdhPJyrQe2uvqbevhuznz1rFbPVTY4f39BCpJ/fWlbJkUlZ9hujfgjnxOnRgqy7X1vAyhIAiEBeyQ==
X-Received: by 2002:a05:6602:1550:: with SMTP id
 h16mr38280373iow.125.1636082414010; 
 Thu, 04 Nov 2021 20:20:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:13 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/36] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Thu,  4 Nov 2021 21:19:08 -0600
Message-Id: <20211105031917.87837-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the extended HW capabilities for HWCAP2.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 02d25b8926..4a0215d02e 100644
--- a/bsd-user/arm/target_arch_elf.h
+++ b/bsd-user/arm/target_arch_elf.h
@@ -32,6 +32,7 @@
 #define ELF_EXEC_PAGESIZE       4096
 
 #define ELF_HWCAP get_elf_hwcap()
+#define ELF_HWCAP2 get_elf_hwcap2()
 
 #define GET_FEATURE(feat, hwcap) \
     do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
@@ -64,6 +65,14 @@ enum {
     ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
 };
 
+enum {
+    ARM_HWCAP2_ARM_AES      = 1 << 0,
+    ARM_HWCAP2_ARM_PMULL    = 1 << 1,
+    ARM_HWCAP2_ARM_SHA1     = 1 << 2,
+    ARM_HWCAP2_ARM_SHA2     = 1 << 3,
+    ARM_HWCAP2_ARM_CRC32    = 1 << 4,
+};
+
 static uint32_t get_elf_hwcap(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
@@ -100,6 +109,19 @@ static uint32_t get_elf_hwcap(void)
     return hwcaps;
 }
 
+static uint32_t get_elf_hwcap2(void)
+{
+    ARMCPU *cpu = ARM_CPU(thread_cpu);
+    uint32_t hwcaps = 0;
+
+    GET_FEATURE_ID(aa32_aes, ARM_HWCAP2_ARM_AES);
+    GET_FEATURE_ID(aa32_pmull, ARM_HWCAP2_ARM_PMULL);
+    GET_FEATURE_ID(aa32_sha1, ARM_HWCAP2_ARM_SHA1);
+    GET_FEATURE_ID(aa32_sha2, ARM_HWCAP2_ARM_SHA2);
+    GET_FEATURE_ID(aa32_crc32, ARM_HWCAP2_ARM_CRC32);
+    return hwcaps;
+}
+
 #undef GET_FEATURE
 #undef GET_FEATURE_ID
 
-- 
2.33.0


