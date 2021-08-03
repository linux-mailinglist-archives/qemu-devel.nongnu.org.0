Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EB3DE574
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:37:31 +0200 (CEST)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmBG-0005sF-Qq
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt3-0005N0-70
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt0-0005Dl-Dm
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:39 -0400
Received: by mail-pj1-x102d.google.com with SMTP id l19so28143879pjz.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3ilLRn5QHjk9kEG7WpME8yjOjay9RXC1nHaTI1fwlr8=;
 b=oynQi1tdUnJweE4yfSFQnFEMgJRurEUhIyl6w3BcB4qZkTNligr+Uztopmhuu/KRcM
 Z7N1Avqa0TuV+/M02qmm1cFNMKC56v/r4Z1cX4q+9MktmzXDWbCLK3HqZ6M9X5R3YMRG
 U/pDnMusWhg8S4dr7lKWvpLly0ulYb3/I27qUvSFS0YlAiB+c98D+ksrmfMGsE6zToA6
 MYCecnFctuJXni7EmhWFQuu2Lk2pbrEUTdvVa60GNvwt3UcOI/TECXvHOD5FBktQReKt
 wQAQ74j3KhUs5LMkZrW9BqOCLr+BwKffbcT0Q5zlQcHQyBeBlOIUM5PgZ/WeGTYnYx0T
 H8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ilLRn5QHjk9kEG7WpME8yjOjay9RXC1nHaTI1fwlr8=;
 b=LR07K9VqtXVAJ6XUL6KdD6zeJEnOmVAGZSx4kdQDH2kFG3JVNx3Reoo70gI6iULz4A
 aAox8AUri+HqkVzkTB/TTRxgzL7MC2PHzcTH+nVdBVLDOjqVen0sZoj6Yx8rdUn3+Dy3
 BQQP0txvJAIOp2ZeY/8c4xMnsaY/mkNjJNHKySLoRqpKXKw9lmxOFKeM3soaJbuAQXm+
 cZ6UjLIucawKP65/oBpFQdWrnwbqPD+iviUrG8MmzKbVrggwysQjx+ndEi7+uCJLoTCO
 tXlUq7GfYE5qKQhdEsUO90q2wZi8qczHQ+0IJoTrdJR4fiWSAz8NbshJujOTyKZ0qu21
 I+qw==
X-Gm-Message-State: AOAM533aqRkN/4zSqogzYypM2VWWtTIyzRpyvGzL6s2N87N57xR4al9Q
 C9Qrr1GLuDG3oQMRZ9+WurM4BSy2+wjT4Q==
X-Google-Smtp-Source: ABdhPJxdv1FXtI8AaLqWrDQBC4JawBepk/kD43JQui9WUsyWxcHkE1bwFZegdiLvTQduE7DZqk4JMQ==
X-Received: by 2002:a17:90a:9b0b:: with SMTP id
 f11mr4016391pjp.120.1627964317311; 
 Mon, 02 Aug 2021 21:18:37 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/55] tcg: Add helper_unaligned_mmu for user-only sigbus
Date: Mon,  2 Aug 2021 18:14:30 -1000
Message-Id: <20210803041443.55452-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be called from tcg generated code on hosts that support
unaligned accesses natively, in response to an access that
is supposed to be aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 5 +++++
 accel/tcg/user-exec.c  | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 8c86365611..a934bed042 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 
+#else
+
+void QEMU_NORETURN helper_unaligned_mmu(CPUArchState *env, target_ulong addr,
+                                        uint32_t type, uintptr_t ra);
+
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 46b74b5f70..2da11aeca0 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "tcg/tcg-ldst.h"
 #include "internal.h"
 
 #undef EAX
@@ -867,6 +868,12 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
+void helper_unaligned_mmu(CPUArchState *env, target_ulong addr,
+                          uint32_t access_type, uintptr_t ra)
+{
+    cpu_unaligned_access(env_cpu(env), addr, access_type, MMU_USER_IDX, ra);
+}
+
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-- 
2.25.1


