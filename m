Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB8424162
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:31:58 +0200 (CEST)
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8th-0003kA-Iv
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8it-0002ZF-8J
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8il-0007or-4O
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w11so1840152plz.13
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96nVQLEZ53b4QwC1lGa1oK9CmjyQGeWueQtnt7IuwWU=;
 b=rQQgC9KnGIQK3SkRHLjm6SJTJ1D1nXkZ5xCFohSNHjwoJzP+LAkJbg29rV9bhy3+dU
 tn7bGhBt8YPk+gvf73IdIY8iYYgIkPQ3e2pi6xXPj5mkZpjsKl6XWuAhFLWRto+cyzAF
 pBvTugZV5rfgtTH1iNXJl/amMVwAUm+06sfumDnXWeQMTosE/qZk5TGsCD8fgxGXvnr7
 nxJUoZdF9r/3/DbFXiCETiLo/ZXv7SM8zgCNcJzSy4pB6nzdcA8/rnOBJ9gO4cYfDnUH
 eYOk7OQsmbQk7kYuNr3gzk9WzeRReFuL/4DgYY94PrIldsCWLn3gYbXqHoavuSR8gh6U
 6Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96nVQLEZ53b4QwC1lGa1oK9CmjyQGeWueQtnt7IuwWU=;
 b=0YNdTqasBZPmj4+jwzeBoHaPZubS5KcCM1BAhPAD+ENAdVXMsBd3rPlJ9K1lCzI7qY
 wQaJEnXoKr2Jshc2BDKgJdZkpB2FVLFEOPPzK1h6gzgCOxgxI6mVsVAUVGtGUHu50t2e
 WEEuMRrYeApadfEspSPMKCCvhvDtg96knvLs6OH1kem9W3chi6vZwWOwUm5qPM/BZRHJ
 2OrMHsxl9KojePPc/jhCe1L+ItK7YdW8bskJqQzoJe8yMrya4aDCI/Wmn95HsWlEiYDF
 nav+iX9dwTyZoOpPWMvcwneyZv5zfvosfvWKu14tSZ/QOGNrfHlGaCkemBZdhfKFoheh
 i0Rg==
X-Gm-Message-State: AOAM533cZA1zEOl9nqhzv/PUErJ2mhmnE3mqQHbvATdHLwzb7ybJnfWt
 CWV8R7qGs16vH5GzS1AoNPiD1UzxTTfuyQ==
X-Google-Smtp-Source: ABdhPJwCJyD+LoJUBpcCsSFHgTdoNjhHCQJpmUU/zy6E9aY5nTnDX8bhHycGgz7tFl9Pa3oW9hIMiw==
X-Received: by 2002:a17:90b:1bc3:: with SMTP id
 oa3mr11476777pjb.75.1633533630763; 
 Wed, 06 Oct 2021 08:20:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/28] tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into
 TCGReg
Date: Wed,  6 Oct 2021 08:20:02 -0700
Message-Id: <20211006152014.741026-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are rightly values in the same enumeration.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 18d0d330e6..0174357f1b 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -32,22 +32,13 @@
 #define MAX_CODE_GEN_BUFFER_SIZE  (3 * GiB)
 
 typedef enum TCGReg {
-    TCG_REG_R0 = 0,
-    TCG_REG_R1,
-    TCG_REG_R2,
-    TCG_REG_R3,
-    TCG_REG_R4,
-    TCG_REG_R5,
-    TCG_REG_R6,
-    TCG_REG_R7,
-    TCG_REG_R8,
-    TCG_REG_R9,
-    TCG_REG_R10,
-    TCG_REG_R11,
-    TCG_REG_R12,
-    TCG_REG_R13,
-    TCG_REG_R14,
-    TCG_REG_R15
+    TCG_REG_R0,  TCG_REG_R1,  TCG_REG_R2,  TCG_REG_R3,
+    TCG_REG_R4,  TCG_REG_R5,  TCG_REG_R6,  TCG_REG_R7,
+    TCG_REG_R8,  TCG_REG_R9,  TCG_REG_R10, TCG_REG_R11,
+    TCG_REG_R12, TCG_REG_R13, TCG_REG_R14, TCG_REG_R15,
+
+    TCG_AREG0 = TCG_REG_R10,
+    TCG_REG_CALL_STACK = TCG_REG_R15
 } TCGReg;
 
 #define TCG_TARGET_NB_REGS 16
@@ -138,7 +129,6 @@ extern uint64_t s390_facilities[1];
 #define TCG_TARGET_HAS_mulsh_i64      0
 
 /* used for function call generation */
-#define TCG_REG_CALL_STACK		TCG_REG_R15
 #define TCG_TARGET_STACK_ALIGN		8
 #define TCG_TARGET_CALL_STACK_OFFSET	160
 
@@ -147,10 +137,6 @@ extern uint64_t s390_facilities[1];
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
 
-enum {
-    TCG_AREG0 = TCG_REG_R10,
-};
-
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                                             uintptr_t jmp_rw, uintptr_t addr)
 {
-- 
2.25.1


