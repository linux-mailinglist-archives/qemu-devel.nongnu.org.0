Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F548824B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:27:07 +0100 (CET)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6746-0006gi-Ei
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iq-0005Qa-GB
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:16 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=42726
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66In-0003Tu-P5
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:16 -0500
Received: by mail-io1-xd2e.google.com with SMTP id o7so10064177ioo.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VqBdes6F8m78x5lq8GFYwJEF8M0bPufEku2jPT9OAWE=;
 b=4LG6DS8ZUcLVBqLW2geNbebFOfJ8oMdGcbt2syJaHDCvy7UwPj1CX2LIWPdj+gaGAI
 pAIMv6vQshh+ErzIyqsEaUD9yalcFvBZzGoDG+UAz9rp0UZ9RjajM3mm8MaUukvUyzMA
 VUr56qDG69uYf0FGdRdaC4VlbK4LeivF61t0yPWuSBcEeovYu1kZcA0M04l990QQuvzC
 X+AJ5nouoQNfVH28XJZ7+O1eGNFPP0tOUX44BnT45CtVTrpItqmbA0Jt3XsRXXTOapHV
 h1d5Xjc3r9jsKgtF5pYDeJTBmksA6Vt/VkxegEnYubLakV5arxvRwHoDuqrtbJCQiH2Z
 JprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VqBdes6F8m78x5lq8GFYwJEF8M0bPufEku2jPT9OAWE=;
 b=NKnE9u4U+JS+NNokVURzpFfQd94FE7pLhDuB3G/FyDPQ75dQMw5YOrdvv4hq/RpK78
 JkiJPjpLirRU7cCg672KtcHJFZBczMrX/nFG40vyU9ikKpnl8OcIIkyWsZs6u09hQecO
 p0Pl6C3dbzFsi7VwjKc20l7iCZpY1vP96JLYCfhkw96qAz1UjSmiWz2IhpTZ3hbJpp0t
 fZz9fYLoJI1aZJEYgITMhEBBNJ+aWF2mXCpEuSWP4fGlsszZ9wf+lYi2s/UJk7l+wwDp
 C5EgHELpNDMDDeRjB0XdEXUxT/armZFSNMvjyAcsnBFFyO4RbvRTgeM4M+fIMBJvFSCZ
 FVcQ==
X-Gm-Message-State: AOAM533nIWFOkcFejsZxhXg9Bk84EQeck/WNDksUl0jRGv9GsFedXM8W
 A/tO9MawafxgWgTQiz63lsRkalBTQ1zw8EmL
X-Google-Smtp-Source: ABdhPJwfTK2fOtrAZfVhGRj0Juks3PlcXfjztFJJFCyEkNFEyaQriQV4Jc+LT6/UAu0mSqWUVZRUbw==
X-Received: by 2002:a02:8813:: with SMTP id r19mr32242899jai.34.1641627492548; 
 Fri, 07 Jan 2022 23:38:12 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:12 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/37] bsd-user/arm/target_arch_signal.h: arm machine context
 and trapframe for signals
Date: Sat,  8 Jan 2022 00:37:30 -0700
Message-Id: <20220108073737.5959-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99ca..9527335cc98 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -54,4 +54,32 @@
 #define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
 #define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
 
+/*
+ * Floating point register state
+ */
+typedef struct target_mcontext_vfp {
+    abi_ullong  mcv_reg[32];
+    abi_ulong   mcv_fpscr;
+} target_mcontext_vfp_t;
+
+typedef struct target_mcontext {
+    abi_uint    __gregs[TARGET__NGREG];
+
+    /*
+     * Originally, rest of this structure was named __fpu, 35 * 4 bytes
+     * long, never accessed from kernel.
+     */
+    abi_ulong   mc_vfp_size;
+    abi_ptr     mc_vfp_ptr;
+    abi_int     mc_spare[33];
+} target_mcontext_t;
+
+#include "target_os_ucontext.h"
+
+struct target_sigframe {
+    target_siginfo_t    sf_si;  /* saved siginfo */
+    target_ucontext_t   sf_uc;  /* saved ucontext */
+    target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
+};
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.1


