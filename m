Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E53CC5D9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:26:14 +0200 (CEST)
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pwz-0006aT-UR
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvH-0003uL-ED
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvD-0002i7-4r
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:27 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9436274pjx.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZZeaQoOeyqj4S9RrFcfpEQTT18rMaII5t0grcgsXGo=;
 b=xafS/sgRTutD+NWf95CT2Dq3bBCX27Co5WvdaEKEXUZ1Yhb0JJB5ZWVeqZLcTsLlqQ
 os9GS+f3pXylsMvq/8pxBqegVHDcBzpsOi8BpA+cydR6F/zSUcAAHJPYe8qjq9QEnqRF
 vThzu3xYbpvdNkkdccoMN5Lmmw8frgHyUoWfM1y5DlXTEammU6jOadNI4KDu9t5sPlJc
 R5pkEIrVs9XZjSrbYSNsIcd76ZHyeHQ2MYsGpstkXmfpg/IszlWGco3T4b3RjBi48FWk
 7yyswzs9GubCAN0ambPiN7I3qOPlZA5D5BJXb+4bylY+I8O9sKBPSriKH9eCi6dIyHIs
 b8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZZeaQoOeyqj4S9RrFcfpEQTT18rMaII5t0grcgsXGo=;
 b=XSnxyudKxbT04QKBJ1bw/TecvsndXj5pPLDiHkv1hMWKrBmXyoSoqxRUqm3Cz2n63p
 xA7/QcoA4hSRxmkeZSYPyNufAj8OqXnZl+AikgZ6MEqiFaZlaXkQe8/UIrEvUuOm3VQK
 6mh4bFfQFaTjoE9BKkHSW0HLCCk+atc2xgMlyW1puRI7FDBr1B7/IOAeSzOr6oX0sV6x
 thNGVKWyU6NKX3BKNogzkdywoFjRoQ50KDr2TFaPoooyV4EQbzsruhgjVII04RqkFort
 00DGVIMxX0Pzt4xPDO8TSUeWblvrBm2W/FCP5Nj9JVMeyDQyZ9vHXA9l2ScAtZAP71uA
 /aDA==
X-Gm-Message-State: AOAM530njiPKarMHbiuRYvzXFAB2QdDlJCtpE6ZK4Sse/djxDwkBIf7/
 b56JxSGab58JSPT5CD5Gld7IH0W1iqkuNw==
X-Google-Smtp-Source: ABdhPJy9tj2v1xFUDFmrCqn68mShOt3ZBzvuvBm65HoRhfTyUYDKS1q5mrtBMmHfGKKLs3JHeV2AZA==
X-Received: by 2002:a17:90a:ce18:: with SMTP id
 f24mr15914455pju.82.1626549860963; 
 Sat, 17 Jul 2021 12:24:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/10] qemu/atomic: Use macros for CONFIG_ATOMIC64
Date: Sat, 17 Jul 2021 12:24:10 -0700
Message-Id: <20210717192419.2066778-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang warnings about questionable atomic usage get localized
to the inline function in atomic.h.  By using a macro, we get
the full traceback to the original use that caused the warning.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


