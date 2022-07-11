Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569756D348
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 05:16:46 +0200 (CEST)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAjue-0002aQ-Vw
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 23:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oAjsY-0000t2-3Z
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 23:14:34 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oAjsT-0001Ll-RQ
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 23:14:31 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r22so3656666pgr.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 20:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+sfQEgSsbvS9wtJSqfw3sWZdwFCpVNA33aansD5syA=;
 b=n6aLtUAnFSFNqfa8lzqMSVpVsrhOXnh4SNA5WJ0QW103A823s6F1BuUJTjVW6gNlVn
 PjO/gsLZphOEi0RbsT56mKhA3gWC2ufpOelO9OKYEgC29y6WnpXymtMZJW4zrr1x1Tu5
 4qJa6VAuV4gTt00GbTo30xkHhL/WB5eCJLRdO+97t4PwaxZEWdyWRqztD9v9DJsv+jIl
 PsX5MN+RO5JH+fHgcOmr0KfZluLh1bxcMCKYx5SOZvwVaztbKoJM4vvX6E/bw72z35pF
 Kdj6rYO8GnG6ypZAvBxEny3WSOzYfTR2sGnpcXUgwQOGn70SOOZaCa4Cj4uX0mpGtE2P
 aukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+sfQEgSsbvS9wtJSqfw3sWZdwFCpVNA33aansD5syA=;
 b=hSW4yg+mDXAxfwDnEkMWezEl4uEMgObOBUJh4LFbq7uWmSGRb71rU1BYtymMrzqyK4
 N70WuvUVvW9zqc9SMlLz65ReMY7ChmdFYkaWWnjhiS3nKs1vrun1YvqmhO5pe8JPfcr4
 LnJc2AySIbPEKkOfpTYDyR7AXbHWMc33A1jYPjdPM9NA++nMH/Js6lFz7BECmfkcC2iF
 jBenk4KuD2sEncBM+LCCCWqWPCTHtTyDho0VAwZX4RV1XQYmh/GhQtfjSu3zDXI2N2dP
 JB/bZ2VNbYEToxhBg+CU+YI8kYQftYS6WmYlATeyrwMtKISKtPc/hV7C7PNRh21AvxLq
 HpdQ==
X-Gm-Message-State: AJIora88EwOmaPY+s4hdRYBy7VHw+WJwdg46bmXQsm/7kKMRyxmZC96H
 +6hyZYOBvf9Hs35DF99jzk4yexgA9o5YpNxs
X-Google-Smtp-Source: AGRyM1tBrPkG/coSih6rBbofmmUSSaibs+1y7gPnQnTitY61TSaEzLY3GSwT2Qz4LF/VaeRFbQ/ONw==
X-Received: by 2002:a63:d1:0:b0:411:885e:1503 with SMTP id
 200-20020a6300d1000000b00411885e1503mr13832979pga.65.1657509267810; 
 Sun, 10 Jul 2022 20:14:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1709028a8a00b0016c0408932dsm3436697plo.129.2022.07.10.20.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 20:14:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, qemu-arm@nongnu.org, Vitaly Buka <vitalybuka@google.com>
Subject: [PATCH] linux-user/aarch64: Do not clear PROT_MTE on mprotect
Date: Mon, 11 Jul 2022 08:44:20 +0530
Message-Id: <20220711031420.17820-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

The documentation for PROT_MTE says that it cannot be cleared
by mprotect.  Further, the implementation of the VM_ARCH_CLEAR bit,
contains PROT_BTI confiming that bit should be cleared.

Introduce PAGE_TARGET_STICKY to allow target/arch/cpu.h to control
which bits may be reset during page_set_flags.  This is sort of the
opposite of VM_ARCH_CLEAR, but works better with qemu's PAGE_* bits
that are separate from PROT_* bits.

Reported-by: Vitaly Buka <vitalybuka@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

My initial reaction to the bug report was that we weren't treating
the other PAGE_* bits properly during the update.  But auditing the
code more thoroughly shows we are -- it's just PROT_MTE that's not
up to scratch.


r~

---
 target/arm/cpu.h          |  7 +++++--
 accel/tcg/translate-all.c | 13 +++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1f4f3e0485..35c279e1f1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3385,9 +3385,12 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
 
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
index 8fd23a9d05..ef62a199c7 100644
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
2.34.1


