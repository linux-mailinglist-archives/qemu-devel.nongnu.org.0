Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C45433D91
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:36:15 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mct26-0000Zk-DG
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF7-0000Lz-IL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:38 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEt-0000Rj-QP
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:34 -0400
Received: by mail-io1-xd2e.google.com with SMTP id o184so9134270iof.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6nGgWFIo7ezMIOimV7TlzBVMBOdct1aOJnGR3rJ9Fvg=;
 b=0v2Ng0BPQe1xYP1PwUgwzNZndxEYQmBB7pc7E0QtyfqcCcl9+ezKQAfx9+o2VM4weD
 d4o0AAX+lIuv0Uvu70g6PmXc95TBjCDQD5ZPb+nTU5X8QNP44qWn2Kad4l2Zxy4NJSUr
 Xqw02KLlV3nNI5qnkvKCeeKV3ZSXPdVHJP6ZyFl+Br0keesMZ3PZGIWpo+RR8gS8CFn3
 rH2gfmTWvp705wocBLiiNtoasu7arseqZv4MONfqcf8vBg+2KW9h57OCnWC+K4p61pul
 Z9tUvU9xm2wyQ+B2t6NvuKvHXTMo72CiF7WZwRkBu72oMf9GNbkDMcjEWrBaAN8bTjlU
 pRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6nGgWFIo7ezMIOimV7TlzBVMBOdct1aOJnGR3rJ9Fvg=;
 b=3Q98jQy71Xc3kO53D/03fh9HBW1AUeOTXWXUK28gZox58m0KVJq+QCloym+otSNkqq
 74egNP008MzaTP/QOacBWg3VHEduOCenxOthYgAj7uTCzvHvylSjTgESbu2i1FAjMlqv
 3XFbnLNjBaB0yUn642kl5MTzosHfrnyuLD3dcKt7ggEOuAdqHh0PBmiT0nSgd98WiKTU
 iW8HKJ+51ZKY6HH4kDkHytMHvtr1eMiG2fhFFwUMqdTKpoWv3uYuVmq8blN0ZkQYGb8b
 qs3Y35AYSnsSSwqd3agcGXECrg4wSR6K7fyo7nWJ6DD1HLxdYweK94jdwM4Gfv6xqaol
 5G7w==
X-Gm-Message-State: AOAM532V8+SMCDeoBZWYJvWkjphFl+gC3pJeHkNFE6c96Q/JaLBCpVKU
 QLxnMw0FdEscNhACJvn8yu+0+/CznxJ4eg==
X-Google-Smtp-Source: ABdhPJwDLa3EVQZjgY2Rz9rCTYOEr4+G83kb9l2234VtZ8zSJ4P4bg9kUgbbftdYdA31QIJBqikvcQ==
X-Received: by 2002:a05:6638:1390:: with SMTP id
 w16mr5112894jad.1.1634661922565; 
 Tue, 19 Oct 2021 09:45:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/24] bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
Date: Tue, 19 Oct 2021 10:44:39 -0600
Message-Id: <20211019164447.16359-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the extended HW capabilities for HWCAP2.

Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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
2.32.0


