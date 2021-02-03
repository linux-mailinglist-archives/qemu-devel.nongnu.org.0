Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C37A30E335
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:25:44 +0100 (CET)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NmZ-0000VY-Dc
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOM-0007HN-85
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:42 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:36198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO8-0001Xs-0b
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: by mail-pg1-x52b.google.com with SMTP id c132so393746pga.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=Rih5WxioQvillJyGLi9Kv1x13x4S3l6j3fwoNV/X87/NtsYTrfY6i00RoeQSOXiKXs
 En2S9KdyLbqJ8D5onwOG5VOyMSSDw8YIqbSozyC4mFFcr3yN3H4YEqBff470qPzGVTCM
 0QhlUwtTs6ietDD4P4ElcvS4TsvtfkxwyCxZS14oEM9jCMgSU+fPd0sZRhNnp2lFE9dG
 Yd8tJmUktYMOe/cYxToEsQrqSpEP47AM7KiBfXfzP2w+slXpC6PlEqigdc1Sa7aKwAyG
 IHdpbWupg2wClSJd2Z0NXgwLn2tkF/G6RtP348Qh0s8+YeahtLUhOFxhYjRYErdHA9gi
 1oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTJCLYbpyElUYj7N6H7CWtvtauF0jl3ZjvvIOqLSVtE=;
 b=IlXwOfn7+CrgvOnafkY3J1oPOn25SoU+6QguxRw9dV3IWqMslfJHy/96PhBLETMLEU
 /a6qL0kLYpZIQ4434iWx4IsLdhw152jqXnMNgjaoWXJ9n67o5uU7wg42V25Pkvr5Oh01
 wqXwQxVQqmIQQ6PSXDyCZHL6ysZU39Z35yME2oZilyiJTt2Sl9MDhDb4btZu+aJK5HmD
 /rf0wYOJGqUqMpkqO1maODh1yfKK8NCURo/PNNLvW5UuGMl3Gf3oedruw0G7MGy9JSjy
 EEcinx5BLuSaysC5gGXexMgAt5BrMjVP/JCYl4eYTUSWLU60ZdiFXTx2RjPxFjzTiFvv
 zs/Q==
X-Gm-Message-State: AOAM533KKOhFUaev5y3dT8bfpJesA1V26a0JzyfJvP5PNHWkSnm1i9Sq
 D9cq9X4SEGO4erMDhM/TirV5vlE1twg/2hUe
X-Google-Smtp-Source: ABdhPJw9hJGTmAVUswMWDRDkjmu8uKtos4YirJnVZ1xkOXExrdmeNNbsPCfwchDKPQYm6qUWm0DmEA==
X-Received: by 2002:a62:190d:0:b029:1bd:e11c:4eff with SMTP id
 13-20020a62190d0000b02901bde11c4effmr4496067pfz.22.1612378822419; 
 Wed, 03 Feb 2021 11:00:22 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/31] exec: Use uintptr_t in cpu_ldst.h
Date: Wed,  3 Feb 2021 08:59:43 -1000
Message-Id: <20210203190010.759771-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f..3f9063aade 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -70,14 +70,14 @@ typedef uint64_t abi_ptr;
 #endif
 
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((unsigned long)(abi_ptr)(x) + guest_base))
+#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
 #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
 #define guest_addr_valid(x) (1)
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
+#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline int guest_range_valid(unsigned long start, unsigned long len)
 {
@@ -85,7 +85,7 @@ static inline int guest_range_valid(unsigned long start, unsigned long len)
 }
 
 #define h2g_nocheck(x) ({ \
-    unsigned long __ret = (unsigned long)(x) - guest_base; \
+    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
 })
 
-- 
2.25.1


