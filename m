Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD1D578544
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:24:24 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRfb-0000m1-Ml
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHW-00026U-A3
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:33 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHU-0003AA-Cv
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:29 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p26-20020a1c545a000000b003a2fb7c1274so5282746wmi.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oX0cz/UuX4deysfpkWLa72UX1jaFnIUFPBqr5lkXZCA=;
 b=GyY+vccb5hxLsP7HyMVCGmdSxyX/tPTRKGMEBVpPwdknpykBiXvnenkFOmOlxnQTZS
 8L5aWIDFJqMsYGxg8gNuk5equrCYbIxD7J3VWVh/b7tZs3HwSSCSzntageJsPIo1+OC+
 w5ZMSfd1o5YRfmSA88onxXOWQZbt/AENRrwlYDw9ThAMLR8geaGc/b7aR5zs1AMo6iil
 V/STIlRxwGdNnIWWqZ/RikncIvLa5NqJpwgpJa89Pzpc1z8TwSxLU+w642adsWOrvZqU
 2iktkl6koSkWf2iHHkVKp0WrkedPkm5Pcvleam3xw8Gs3hkXqU0FkB8tQm5hm6C5V17h
 W4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oX0cz/UuX4deysfpkWLa72UX1jaFnIUFPBqr5lkXZCA=;
 b=nUcLBgbiNTNgg0lD7YQdP4HF84tJTLwBxASgY0NtFMEFiDV6aJRxVFT0BLmdfEz3FY
 MKdDj3Tibr861DqDP6hVWi7T7qMb8DHrcwPTWk4J9814s+O8GTK+jCAl82GYs8Odm+K8
 BTLfrO647xEQy5F3unL1pFbn2CPpw+DhdxU/3Wb+nLCfQSXq1fsPYSj6f62T5eoceNqW
 FWECzYdBZzEEA+0sJnnKrSG5T4jfcqApaEBB2iT+NITPUq54IDL85XQqwRCdGLf6l5TJ
 Tfjo18pkH8pIezeSfbU1U+68snoDi+YoCS9IU1wwct/BLZfW04cHS4x4gen6VJy72XEC
 j+mA==
X-Gm-Message-State: AJIora9Nga0YCXVivc3sNgqUt9o/BPNQxojXqxwDy0uXJ1n/dB5mujSH
 8QIDOwUJjBjmCs30ckqFP9G98C+t6NHLCw==
X-Google-Smtp-Source: AGRyM1uHDpuq1hkU7d/TLvjrxqh1ubNEQeUNilB+l7ydZ44uFMiLmFltvHvc1Oa1G8FR5JROoXPXDw==
X-Received: by 2002:a05:600c:3b29:b0:3a3:1fa6:768 with SMTP id
 m41-20020a05600c3b2900b003a31fa60768mr2004296wms.193.1658152766918; 
 Mon, 18 Jul 2022 06:59:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] linux-user/aarch64: Do not clear PROT_MTE on mprotect
Date: Mon, 18 Jul 2022 14:59:09 +0100
Message-Id: <20220718135920.13667-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The documentation for PROT_MTE says that it cannot be cleared
by mprotect.  Further, the implementation of the VM_ARCH_CLEAR bit,
contains PROT_BTI confiming that bit should be cleared.

Introduce PAGE_TARGET_STICKY to allow target/arch/cpu.h to control
which bits may be reset during page_set_flags.  This is sort of the
opposite of VM_ARCH_CLEAR, but works better with qemu's PAGE_* bits
that are separate from PROT_* bits.

Reported-by: Vitaly Buka <vitalybuka@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220711031420.17820-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          |  7 +++++--
 accel/tcg/translate-all.c | 13 +++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1e36a839ee4..6afcc882f2c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3392,9 +3392,12 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
 
 /*
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
+ * Note that with the Linux kernel, PROT_MTE may not be cleared by mprotect
+ * mprotect but PROT_BTI may be cleared.  C.f. the kernel's VM_ARCH_CLEAR.
  */
-#define PAGE_BTI  PAGE_TARGET_1
-#define PAGE_MTE  PAGE_TARGET_2
+#define PAGE_BTI            PAGE_TARGET_1
+#define PAGE_MTE            PAGE_TARGET_2
+#define PAGE_TARGET_STICKY  PAGE_MTE
 
 #ifdef TARGET_TAGGED_ADDRESSES
 /**
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 8fd23a9d05f..ef62a199c7d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2256,6 +2256,15 @@ int page_get_flags(target_ulong address)
     return p->flags;
 }
 
+/*
+ * Allow the target to decide if PAGE_TARGET_[12] may be reset.
+ * By default, they are not kept.
+ */
+#ifndef PAGE_TARGET_STICKY
+#define PAGE_TARGET_STICKY  0
+#endif
+#define PAGE_STICKY  (PAGE_ANON | PAGE_TARGET_STICKY)
+
 /* Modify the flags of a page and invalidate the code if necessary.
    The flag PAGE_WRITE_ORG is positioned automatically depending
    on PAGE_WRITE.  The mmap_lock should already be held.  */
@@ -2299,8 +2308,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             p->target_data = NULL;
             p->flags = flags;
         } else {
-            /* Using mprotect on a page does not change MAP_ANON. */
-            p->flags = (p->flags & PAGE_ANON) | flags;
+            /* Using mprotect on a page does not change sticky bits. */
+            p->flags = (p->flags & PAGE_STICKY) | flags;
         }
     }
 }
-- 
2.25.1


