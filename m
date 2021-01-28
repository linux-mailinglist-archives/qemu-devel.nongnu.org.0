Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F2330815F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:49:33 +0100 (CET)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G6W-0003Yw-JW
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzM-0005X9-1J
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:12 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzF-00088P-Rr
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:07 -0500
Received: by mail-pj1-x102e.google.com with SMTP id cq1so4717749pjb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4REF6cfdA8MQv8viPXefMUo/38x0z3uSDZzFVOD3Xwc=;
 b=Aw9NDjqY6PN9drRr+/r4nElPi2eAAbZVnJ+fn1Z7s0D8FWNFXW47STthtTal25DXQh
 qHZyeD3xL78B8D3btXbY1ByLAWKpBUpr04H14BerHxArgo+E3gOlh5TVD80m3vulh3Fx
 rsfKisD58WD2thmQWv5xTsBApsH7uGru0HCwDm9blDgeRKHzVfriJ1jIYwQ/bKt10SEV
 LMH/eXAAu8xEyMfGbXov7Mjiy5geDpDSr+uATldXchscO8ofjtHoB3Q9kX4i0FhqyaDL
 u6+1u9IblN9g1WIEQYmwHzLuA46QdYBQUGjfm98yo6ryPP/AFG0iYa41XIDo3d6pxoA1
 ez2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4REF6cfdA8MQv8viPXefMUo/38x0z3uSDZzFVOD3Xwc=;
 b=NNVGDtcBsky4yShLyGAwcdV5V6CxSjujL3xgHoY/dkkJj7KhT0Ysy8BLGAz7/OwvfX
 YP058mbD+d4LDE1ATsiIWuRSxT8Nf84mliERjeP+E6YFYreEG5EniKhNyV4ThywclC77
 CKqD5OkfFrazXBgOxQlDTmm11lmQk/y6Xs6oJpnz6yxwFNpFBnM/zdxVXmhFlWiSrMyh
 mnweB0Ov+FONny+t5wNNl7SgVO3GIQcaU3cuvH2YTDLwetI4IV2eeHYlFRM7GE04u6T2
 iIdqs9rcFstiVYB3DByK0kGuWiRutWEve6gabBxZUJtMJF3JYiD8hZogcXcKE83Ecszv
 ohgA==
X-Gm-Message-State: AOAM530uSaBN2y8QkwtdgzLyVgnu7d0YT1gSDThFoL4FuUGQRzlpX01f
 NnzoD40/z+1eN7SqLB5y5SxUadeynB7LdPBW
X-Google-Smtp-Source: ABdhPJyvcZ/prO2NrGDacCA0aBlyyqqHIJdB/JiGfUpoFOQNLt6RqI/lTQAfVGAtT9JVsJ1a9HSFtw==
X-Received: by 2002:a17:90b:949:: with SMTP id
 dw9mr1585322pjb.20.1611873719633; 
 Thu, 28 Jan 2021 14:41:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/23] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Thu, 28 Jan 2021 12:41:27 -1000
Message-Id: <20210128224141.638790-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


