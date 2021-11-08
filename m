Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE183447933
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:13:15 +0100 (CET)
Received: from localhost ([::1]:41632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjw1z-000896-3g
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi5-0006sA-Nt
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:41 -0500
Received: from [2607:f8b0:4864:20::12c] (port=38896
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi1-0002vg-EJ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:38 -0500
Received: by mail-il1-x12c.google.com with SMTP id f10so15559021ilu.5
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=iHtHR3+L3TPKMgvw29wWTsuJmwq/CPpAaT3lOZGdLFgE648Hpw3GP/8Cni2Xsh6A62
 XfnGsxoFiLrEyxmfIwttGim2RCFqlXqiByVUPWdi7Gzd3Ydfp4vvUZq3lfXBjdvGUG8w
 CDTTAGDVf4FoGAw5bQwn8MjtlK+FW8gyypZh8zjR6AjNlNugiy7JE1O7rFzHfmzgbDHt
 Xhd+8q4m/hep/KNk7GoW5DwQQ0xRiTXOFeWEBCaPggEBmKqHl0qAny+D7k/hfFzZaaG1
 evnMgOXLpPJTW4sNM+fcKmOvJJcgnL2fB9VbarW1p/UdeCPwRVDbxjLI/gi2LiHrqjw2
 YoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=p38x5JHMbl8VY72L8X5ReN0xe09a6CDweB6TbZb5sLLGwQaPLQrliEXaLx1Wz9aAJ1
 A3F1acTbMVe4ZawcMuhLgW6QL2P55H/cMFVDs6j/wvVKnOsA4ev7REHQfNnZl1g3VNjv
 C+gOjHWthJlKoKXUdiOeKcV6/FIB8+M5MXp1BlCyR6Mf0so+3tyfhKG8It3Qxq4qxVNh
 EIb/SUDpMrKXXyjA7MejrbiiIIvLI5D2fXts67g03R4oYjkSeX79Bu3aY2CNLeTcF2Uf
 uxsWX04wlizGLeBkb2DprRPmCVDzhpl5WliwnKaR/3SMI/r/x/FIizOjuuTjhkoH2whp
 oR5A==
X-Gm-Message-State: AOAM530quo/QB66OWDZTJ9d5yj6DWRWlLHXLGfsAH9dYMYei+ku2+LzG
 qZDMAsClQfU671o0nvUKJeu6dxuMfyu56A==
X-Google-Smtp-Source: ABdhPJzngoF5WBay+ClD50mdExal44tbM6pudV5iaWjZXs7htVFEPy69H4qABd+0OTWl94gdBN0cTA==
X-Received: by 2002:a92:c261:: with SMTP id h1mr33309867ild.291.1636343556337; 
 Sun, 07 Nov 2021 19:52:36 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:36 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/37] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Sun,  7 Nov 2021 20:51:27 -0700
Message-Id: <20211108035136.43687-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
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


