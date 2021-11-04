Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524E544553E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:22:50 +0100 (CET)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1middh-0004v0-Fv
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNu-00074c-0w
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:30 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNp-000113-0F
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:29 -0400
Received: by mail-il1-x12f.google.com with SMTP id l8so6285219ilv.3
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=RiJ7QAl28KqQVUNVdMTWAIG8NCmD8yhONjP8KagQJSZ6oySEjXZ/IeOjj39u2aXV2X
 HVCPBLRrBkUzqX7CoPKXpgpBFlQmBtQt0bZHCy8c+fQV5gH/Cw2szgdEBtmSDvmyM+Wn
 nZV/OCqMNlaqhrQic2HYgp+wkGCgQzbef3qws7w4Hm2nJLDJ6B7K5PcaHbckq84FcFJk
 NXrtesHTUIRJuGeNx9Lt+pzSx0bZq/T6EXRTFOIBUW6PL+2v7ux7hyEBhLWU6pcf/E67
 Ar7DWWxHH1gK1Fr8DP6CmEUd2Pia/I9fIDH5byV8G1Six2V3nDZIIuWynDnpXcbZ28vR
 Zxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1XrwZ0o7hRgTEhkk9E1BQTq9616nNWJfCEFdNAWs4w=;
 b=FdpGVFZp2yx5+JxUwV0WcoWY5vh0L1rj/xfWRGiSqWxKAtThv7CunMHkvzzFi6A8hk
 m/IOjpUFgs5dvnsvmhyHocCoMQg57mgvv9VQjA3aYQvYCjsKxLZq1f+QLZpUk2xmSid8
 1Nr3cPDz2Hlfw88agQ/FHvvEwHVqbrlE0OSvSSq3WUyKb5SJB0HsIDtcChdg2X5c3aMm
 /+FMV+66l3H75tucqSRz6QYdnRzZk4cGiE3Da4lFGrc3OT0r/vO4KB4cInjtTwZIltHS
 JsF31Vf0DI31lFT0AuophLLKeU11pnn8rX5dpoMVZb+Vp7WDTaGQj3zSQFNOnG24XvA+
 pbBg==
X-Gm-Message-State: AOAM533PFju8XR4w0U+gmTjT8HZwSTLBCXcKD+YEFiz3eMRR4xocqOCm
 GY6u1LlLgwnFmPdO6gyTQtikkZCGJ+7Omg==
X-Google-Smtp-Source: ABdhPJxRDw5eKNqsReMrSnGW2pDOTiY0BpT81/WgHEpgzsgjLarCkAjwDWrzNMFcwz4W4qrJlDkPCQ==
X-Received: by 2002:a05:6e02:1846:: with SMTP id
 b6mr11299206ilv.164.1636034783704; 
 Thu, 04 Nov 2021 07:06:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/29] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Thu,  4 Nov 2021 08:05:23 -0600
Message-Id: <20211104140536.42573-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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


