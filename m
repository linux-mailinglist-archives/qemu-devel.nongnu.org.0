Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E780331CDE9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:23:43 +0100 (CET)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC38Y-0006GO-Su
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32P-00076O-00
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32C-0002NU-30
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v7so13748733wrr.12
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eLIFGOg5HdwkmbKxogMzFAx4aIK6dBBp+2Y0jeJHbjc=;
 b=EiYunK7m5qgiSn57VzBQNHrDWW51lo8jgNAbLJxqiw3bhtsAgqO5uMHPJ6+/+dxWK6
 4wYW2X3A7gZDC428P7iJKNN2Sb8JpM2GVO6ArQPcm7O3mZKGNUwXilRgI5mAPStjO0MB
 /ECcXmIsJaVidMBGLTfVFPi8n09mehTDJ3CDib6PE4g8Ep1+2Cok1msGw4pLcAHhLtgZ
 aDKY22RoCiDi9M1EZhENSwcaP8iijishRAWfiha1PsibghyMj69u4ONYOijDKCBFRsmn
 KGn5rN6p6MW0SvN7KdGKLR/LesQPEeP1sKBGh6Muuve77tn8D5YTMUF3OMlX7WdpZ07l
 x63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLIFGOg5HdwkmbKxogMzFAx4aIK6dBBp+2Y0jeJHbjc=;
 b=qxx7YXeYRwMA/9LKDTCe4edM+bKRHOAj3yUmkBHZQ/60VTEdiacRJYLUEYOvGRtAoI
 vh07bLtg4PYIP8zzmdg/U4ZrhZis6lcE635A/HbgWhC5f0z9xu9jaChMOVOyhDEqhzO9
 lyCZAdfInAvVq8CwX1e2w0JEngro2VnTnKaVj77cGO/drR3XjjEBzPlV71z4K5/E7Wsv
 Q7M8flElUwZVAEHQY/tU9FJyPmmrKN1mH7NyH3cI5TsY+jNQMOHY1leHAJ5akn613MIn
 wbb8y+YQPh/jhwU3wLx1RukYyKbjm/MEdjs0ITtrFRrjyYWCENQZomwmA86hj/rzHg45
 59dQ==
X-Gm-Message-State: AOAM533h+ypS4BGaC54puwPSzdI64CmmvzJFuMfSrK/RUhMLsDtvBJCd
 dxdVJYyw8pYjjRovu1ZVbZJ2Efor5OKwXg==
X-Google-Smtp-Source: ABdhPJyZxtr9ZkroibCGoGiuK0Oo2NO9j/umbhBgjWmwyfk1iWm5EMvAoBgEYVbP+bnL64vQ1j2ftQ==
X-Received: by 2002:adf:9546:: with SMTP id 64mr25387310wrs.247.1613492226365; 
 Tue, 16 Feb 2021 08:17:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/40] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Tue, 16 Feb 2021 16:16:27 +0000
Message-Id: <20210216161658.29881-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5e8878ee9b1..4e6ef3d5429 100644
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
2.20.1


