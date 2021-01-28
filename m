Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076543081A6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 00:03:55 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GKQ-00025P-2E
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 18:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzU-0005aY-7e
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzI-00089J-FY
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:14 -0500
Received: by mail-pj1-x1031.google.com with SMTP id s24so4718204pjp.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=FLojX3ixA2yr6qJk8jYuO88bLmrIyoPpSgF02ee9VcqomnUs/FTBOJA0xeHzhF1gSK
 GlhwJZQ5QwBbfCE4UH5m22DPj84x47SVcdZGQDfskbT8Y09V/ZIts/pGOEd/E3sTQjxk
 NHa8aFWn8obcD+G2ApgvQL8CImzytrk47EFVdtt4zvVJMK4B6z2CU60/SjhTF2ANHiOv
 0bchzib+5SCXPv1jvkOdS9HIBM5XvntEcmrWdrzQxFiS3B+yL0B6hdRmBMItm7Okk/97
 PktnWWqEe8wnn1T0kNOwG1rF5LrQgBtw3gqH2ETkCRDPUh7LE40ihOd6Glxs1D/MlDRI
 0VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=rb7/R81AVwMCw/dDG/n+qiyAnhbtrQJymliBLsHqSCtGkF3deESsS+/M77OYpD1HQi
 NPJ/laUSZMKHh1ETy879ZNvhb/pFBTijRiuV5fmULcYmM3GKFyQAXkVhMzNPFLJgNxNg
 bJNHy9MZuWDur2bidwLivMB5CxwMLZMbSwcpKKewkkwg8hI+4FcsZ3b7Rv/JihRXuTHl
 dTm/sJvWS6GXHyTTkCPtnTgJdR+fHro6AojXpXf+hToSaJZE0710teUAfGcq8bh2qDhB
 Phad2l9slM5dQwkYurpO90q4SR3RiCoQFYVNlOT9ShtTyFjgjweDZoXYl7Fhat1QK8Jk
 klHQ==
X-Gm-Message-State: AOAM532kJOFFn/Cs3oGjRmfDwXwjsbOLxfp/a5FphqYoNBVS5nZQzol7
 lMjJixABBAY4NyejdvhA5HMGPyT+1a679nUj
X-Google-Smtp-Source: ABdhPJxhALg9iAcIyXkRiiARgETy5dIjO9n6HCoywfZsqIr/DzbYqJOycLqhuGlQKvANacWgU7pu9g==
X-Received: by 2002:a17:90a:17c8:: with SMTP id
 q66mr1515883pja.167.1611873722704; 
 Thu, 28 Jan 2021 14:42:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/23] exec: Add support for TARGET_TAGGED_ADDRESSES
Date: Thu, 28 Jan 2021 12:41:29 -1000
Message-Id: <20210128224141.638790-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AArch64 Linux ABI has always enabled TBI, but has historically
required that pointer tags be removed before a syscall.  This has
changed in the lead-up to ARMv8.5-MTE, in a way that affects the
ABI generically and not specifically to MTE.

This patch allows the target to indicate that (1) there are tags
and (2) whether or not they should be taken into account at the
syscall level.

Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
in the arm64 kernel source.

The prctl syscall is not not yet updated, so this change by itself
has no visible effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba00..1df9b93e59 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+static inline abi_ptr untagged_addr(abi_ptr x)
+{
+#ifdef TARGET_TAGGED_ADDRESSES
+    if (current_cpu) {
+        return cpu_untagged_addr(current_cpu, x);
+    }
+#endif
+    return x;
+}
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
+static inline void *g2h(abi_ulong x)
+{
+    return (void *)((uintptr_t)untagged_addr(x) + guest_base);
+}
 
 static inline bool guest_addr_valid(abi_ulong x)
 {
-    return x <= GUEST_ADDR_MAX;
+    return untagged_addr(x) <= GUEST_ADDR_MAX;
 }
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
+    return len - 1 <= GUEST_ADDR_MAX &&
+           untagged_addr(start) <= GUEST_ADDR_MAX - len + 1;
 }
 
 #define h2g_valid(x) \
-- 
2.25.1


