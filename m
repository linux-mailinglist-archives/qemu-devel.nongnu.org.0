Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD31376E20
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:51:03 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfC7S-0006le-E8
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4f-0003vE-9B
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:09 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4d-0003VU-KW
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id m190so8677876pga.2
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eUjZLMLZ+rzu+K8ZyMeakxAgdcLDgDe+zwm00dqzTMc=;
 b=nIAB2VEtfa2gXqOqdaCdTEHW4cUoGqKq980h/JSdtE2kzIoEocv5LClngB/UT9ptGm
 77+Fq/QXFPtEgOEsn9lq5VRGxLy8PG+VaN4PGmP2IVr73UN1IvKIT4WYkiwMmkbvKwYt
 KvXQdOvn3tFJ+ydALq6OO40KVAV2uAQ1t/BXm9PcSK4a8jlxw2VV/RlcgEl4FZKTTsu4
 8PfyX8GEPC/tqI30zgqaeYxCwqwTpKILSlpWoh51IvHTRDvLcobdBm7aeMh0pWdkRPLc
 MmDPDI9NY6Q9ZyZtgyK/SG+0mK7qKG0E+Nbm4kKqNkq4BQ+gJcX0xLeqqLFZIRTb2DZW
 LVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUjZLMLZ+rzu+K8ZyMeakxAgdcLDgDe+zwm00dqzTMc=;
 b=RbjAWcXiu4ipCIkLgo8OSvwDC1qO4kY3WmAz+psH7WbiCcd5h5lJ8VZg/rmlKQ4HcM
 WMiepd7wmvS6QdDcmn0az58wqAr6HHp/UCyucJhaZQPF6qsinNsSMf+30VjZrI96Yk15
 fLHJF11rjyczxpvKIDIg8pDniER1cxkxwc3VmRPkLx3jBwWb1Jt2JJQDcSVGaj707ZDI
 6XqnncOsxAfuKBQX0K8YYCh2QB2qmTVKpgWf1lBsjSL2ACq+7WMb3XoI9PksWhwc7C3u
 29UfsTCcqOZJCtbLvS/hnRKTG4C9PQVZyg0n6c39YdFUvb4slOhZ6weiJy8vMCSMHYc6
 9gww==
X-Gm-Message-State: AOAM530Gi4Uf6xHh1l8cwfeVN5Z/bLy5QF1hZyYao0cIoQKjqSHpclEc
 CsPtwSx22rsc5LrHDepviXpXJtXGyAcpfQ==
X-Google-Smtp-Source: ABdhPJxWAjLgvIqRHn2k8YEyS2ACEmif6H5E2V1WQd+HVSB8B58aFobiUvgj0YxpgfwnynKxI6YbvA==
X-Received: by 2002:a05:6a00:87:b029:28d:f62f:a749 with SMTP id
 c7-20020a056a000087b029028df62fa749mr13354023pfj.54.1620438485997; 
 Fri, 07 May 2021 18:48:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/72] qemu/host-utils: Add wrappers for carry builtins
Date: Fri,  7 May 2021 18:46:53 -0700
Message-Id: <20210508014802.892561-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These builtins came in clang 3.8, but are not present in gcc through
version 11.  Even in clang the optimization is not ideal except for
x86_64, but no worse than the hand-coding that we currently do.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index fd76f0cbd3..2ea8b3000b 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -26,6 +26,7 @@
 #ifndef HOST_UTILS_H
 #define HOST_UTILS_H
 
+#include "qemu/compiler.h"
 #include "qemu/bswap.h"
 
 #ifdef CONFIG_INT128
@@ -581,6 +582,55 @@ static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 #endif
 }
 
+/**
+ * uadd64_carry - addition with carry-in and carry-out
+ * @x, @y: addends
+ * @pcarry: in-out carry value
+ *
+ * Computes @x + @y + *@pcarry, placing the carry-out back
+ * into *@pcarry and returning the 64-bit sum.
+ */
+static inline uint64_t uadd64_carry(uint64_t x, uint64_t y, bool *pcarry)
+{
+#if __has_builtin(__builtin_addcll)
+    unsigned long long c = *pcarry;
+    x = __builtin_addcll(x, y, c, &c);
+    *pcarry = c & 1;
+    return x;
+#else
+    bool c = *pcarry;
+    /* This is clang's internal expansion of __builtin_addc. */
+    c = uadd64_overflow(x, c, &x);
+    c |= uadd64_overflow(x, y, &x);
+    *pcarry = c;
+    return x;
+#endif
+}
+
+/**
+ * usub64_borrow - subtraction with borrow-in and borrow-out
+ * @x, @y: addends
+ * @pborrow: in-out borrow value
+ *
+ * Computes @x - @y - *@pborrow, placing the borrow-out back
+ * into *@pborrow and returning the 64-bit sum.
+ */
+static inline uint64_t usub64_borrow(uint64_t x, uint64_t y, bool *pborrow)
+{
+#if __has_builtin(__builtin_subcll)
+    unsigned long long b = *pborrow;
+    x = __builtin_subcll(x, y, b, &b);
+    *pborrow = b & 1;
+    return x;
+#else
+    bool b = *pborrow;
+    b = usub64_overflow(x, b, &x);
+    b |= usub64_overflow(x, y, &x);
+    *pborrow = b;
+    return x;
+#endif
+}
+
 /* Host type specific sizes of these routines.  */
 
 #if ULONG_MAX == UINT32_MAX
-- 
2.25.1


