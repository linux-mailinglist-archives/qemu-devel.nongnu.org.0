Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0823CC095
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:42:47 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZLq-0003K3-Ec
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKY-0000pF-Pv
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:26 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKX-0000wZ-At
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:26 -0400
Received: by mail-pg1-x532.google.com with SMTP id 62so11745904pgf.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hkNtyJzCYzqtjt8V71dL+rrY3uqGt0BkEX6PS4grnDc=;
 b=XGNLwTtPuQKhQjnLFPgi5T5c+4h19z61fglsJUzuHYQkXJ/v/IPsbDnsHUHrsWjsIW
 Sv69omc+ht0eowkh8ez0WAbZcmfps2zyuCI9q1YftymMnA2S5+sZpchjSGtedKCnylwh
 cnELDrOiqfnUSqYBPy8KG33smClUdjpAUoHLttU2Hp733klBhLOZDA/B2ZNdHVppH7lK
 rxPKRixdwESaNBI947O2nXqNaRrHrEqUm0ftAz34aaGBIb5tFwR80nFaNCCMECck7otH
 JCXPaOdTbpmnc5ZYQtrieVLJLkW6KvunUgP/6PqjQt1gGBiLXHVGET9TskQplWHCT27G
 c7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hkNtyJzCYzqtjt8V71dL+rrY3uqGt0BkEX6PS4grnDc=;
 b=F5TPn1XOhGGfYkvW9RlBEqIwGpdxGSZ0dYqbWNdUo9WpB1nXUGq7urPRKnCchusgme
 KG/A0zQwQKfwBKhKj+MPF8AlGqfpyEx57zhRRGCfaAB4HN1sZz7HAoe6nYx/FNqyNxU2
 d3MGlFoFQj5CBJlpxEFAuL4yE1I8cwB7QNnyN5BRDEYYVvcnOYB1Lnx808+ozfWQEO+N
 D27BlbngAJ5CZ+wpjiKqYQv6dxjt+8l7VSuri0Es/i3HK/aiAdu+v5j24aSlB9xczPl+
 lR33/Xm/liuqxmJmnt1BqKhWJpi8oym7xNrF9XnXSKen/W5NDss/yXBDAWunMcpeCe0A
 CgjA==
X-Gm-Message-State: AOAM532e4c7ObuQ+iLbi1TdKTj8NJzBEZc3O/Jifw+zuALWwu5HuxpQp
 us8cct5dmuq1+tvSFhYoErOZANbWBUIXqQ==
X-Google-Smtp-Source: ABdhPJw6pwD4m7ipH5KiBQKXWv8xULHE3t+HjfxRiLfTZSHRVI485m/LEh1DHKqStTl3iBYAJsJZZw==
X-Received: by 2002:a63:1656:: with SMTP id 22mr12760416pgw.163.1626486084041; 
 Fri, 16 Jul 2021 18:41:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/11] qemu/atomic: Use macros for CONFIG_ATOMIC64
Date: Fri, 16 Jul 2021 18:41:11 -0700
Message-Id: <20210717014121.1784956-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717014121.1784956-1-richard.henderson@linaro.org>
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang warnings about questionable atomic usage get localized
to the inline function in atomic.h.  By using a macro, we get
the full traceback to the original use that caused the warning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic.h | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 3ccf84fd46..99d6030095 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -457,26 +457,11 @@
 
 /* Abstractions to access atomically (i.e. "once") i64/u64 variables */
 #ifdef CONFIG_ATOMIC64
-static inline int64_t qatomic_read_i64(const int64_t *ptr)
-{
-    /* use __nocheck because sizeof(void *) might be < sizeof(u64) */
-    return qatomic_read__nocheck(ptr);
-}
-
-static inline uint64_t qatomic_read_u64(const uint64_t *ptr)
-{
-    return qatomic_read__nocheck(ptr);
-}
-
-static inline void qatomic_set_i64(int64_t *ptr, int64_t val)
-{
-    qatomic_set__nocheck(ptr, val);
-}
-
-static inline void qatomic_set_u64(uint64_t *ptr, uint64_t val)
-{
-    qatomic_set__nocheck(ptr, val);
-}
+/* Use __nocheck because sizeof(void *) might be < sizeof(u64) */
+#define qatomic_read_i64  qatomic_read__nocheck
+#define qatomic_read_u64  qatomic_read__nocheck
+#define qatomic_set_i64   qatomic_set__nocheck
+#define qatomic_set_u64   qatomic_set__nocheck
 
 static inline void qatomic64_init(void)
 {
-- 
2.25.1


