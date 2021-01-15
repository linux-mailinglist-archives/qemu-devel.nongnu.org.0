Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC82F88FE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:58:35 +0100 (CET)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Y38-0005aw-VJ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:58:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsE-0003bB-Qz
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:18 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs2-0005FZ-RS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id y205so583899pfc.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4REF6cfdA8MQv8viPXefMUo/38x0z3uSDZzFVOD3Xwc=;
 b=yKJEbBv+SrFsgEnltc/TzCtw86pnuM6k14IqbwjELUAeVDqJ3li5/xF7UFZl6/sxkA
 yoABsgYO0PryhgXiatN2djfCWQaSm36thjzmLwcp0RGiZHjJmI1sawyRwW4QR0lwDFmk
 Fn+CgVCVbDdYNv6JTPClFC0Au3kM+t3LJvLoymZvDp4Hu2sdPMm8Xt7jp9tgAchii05j
 jsX9gyhDfZ9EMkzI6PRxvaKtjkanv8f77aw2EXXE12WascTVrohbA95VfyKejvuB4SkD
 4t4Fx1bbDFqq8WBSFc0VBBhccVYOxdqeBd+5nyJtENFj6/mnWXp+BQGPWb4ivGkBZr6b
 hHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4REF6cfdA8MQv8viPXefMUo/38x0z3uSDZzFVOD3Xwc=;
 b=BhN3gB5svPRmqtAxJ9Clk/oligGN9sb4ZTCqCtbDQ/W2Alh2qfCl1gdFV1mnEDyOeS
 jOeyC0/ddJpVH4OR98F5UscamkzwbhlxG+xBFOMremvBGZg3bPRHztkFNxXjhiQv/Gkj
 uEm3gp6HMVdn/RYWHcyO6m/3MtD7lDu82qIEjL98piA4xa6nXnKFKPzH1V6whRSwEOIk
 IFG0O5iOdlkxRRJciIDPE7K8NrZLP8y3NK+oE70IhWFHZs2ztVGVsIDMKifpHY376hlq
 Ltrc0nYMl9bXMACpU1O2fWpk3sOayi+uwtIhmJ/hSKC3Of9QOcjki1Wo/TOgXKLFuM7a
 rd7A==
X-Gm-Message-State: AOAM533qcteu6I0M78NQmypfxulBykkR0vp0rK3KMUQGio1pzYTyI0Lf
 tXoIVw5rBbsj4iQvWhAQJwzj52a7Ig5IbDJJ
X-Google-Smtp-Source: ABdhPJzwSYG1HID140ykj4hN5FW2T7+OXAR2XVNf+MOzV+xS6hSZJ+WQ0mOEIJu8DddEkVMG0Ca0Sg==
X-Received: by 2002:a63:65c5:: with SMTP id
 z188mr14580822pgb.332.1610750823237; 
 Fri, 15 Jan 2021 14:47:03 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/21] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Fri, 15 Jan 2021 12:46:33 -1000
Message-Id: <20210115224645.1196742-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Ditch type changes; retain true for HLB <= GAM (pmm).
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5e8878ee9b..4e6ef3d542 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,13 +77,16 @@ typedef uint64_t abi_ptr;
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
 
+#define h2g_valid(x) \
+    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
+     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
 #define h2g_nocheck(x) ({ \
     uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
-- 
2.25.1


