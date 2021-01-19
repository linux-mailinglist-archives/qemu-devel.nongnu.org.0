Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6042FC019
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:37:20 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1woZ-0002mU-0e
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpt-0002Yw-67
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:37 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpr-0001Fe-2o
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:36 -0500
Received: by mail-pl1-x630.google.com with SMTP id e9so6849823plh.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lb0UT912r2GMFw/dFnRGb/nKNqr4nsQ4gGmPTzEJSYY=;
 b=AAQqhaRBRmkAucA1zbvkxQyFlt6CE4BV4cC6Uc9nJnaPWQ+3srAyGJyEQp8ulLSzmM
 JlUg/aXBp5mwwhXzDddV+79+6jbSkyooHy4QceB/dxPC7bawU1N80pYCa+oBx+wdC24B
 1JbMLGlqb+z/UvCbJqjVFRnZcp4bk3DT4SPxjIHmt10aMY1ms/UegkjZ04E8PYCz4Rz+
 V6NcJ+8Ef/sA5jTOsF5G58Dr/u/j75f33b5qLGJsKwGqCmfzbpkeJSLcCafmAktqGOJ/
 GEu1MUA+ZNu01q1+tUPhD8+IMkoFyi6rqf0SP4tlzF4hkZvnW2cvBZ0+AGoR1JITRmDT
 t2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lb0UT912r2GMFw/dFnRGb/nKNqr4nsQ4gGmPTzEJSYY=;
 b=EnydheSkl+FX3z12oURM1WleYyn+PTS6xz0cPG6IjlSBD+4tGQ8hVU1QRlSo/gNQL3
 InK9oKvyzLKar4KAImOicbEtQiI2Lp3JAhONO/gVxXAl0Xj3b2IlZfB1e7+Fasegmyss
 RXklByME9NdjQvvO+YSVk7zdbBguRVqlkc2gEUx7NMkBfN3MoDODb41NAjTWdN1R18i1
 lYwskRWylFy2mnZbWGDVPbbW3JFUuhch8P4HOurcEw4FwJ5IuGWG1uLIeM1VLiW/Xrde
 N+agWfSXnpKBRc4sPJRNGMld07RFIgsiQDsPDeGk47sGUaMsC41x0XYjVW+zPTC753dU
 Y5Ew==
X-Gm-Message-State: AOAM533ZoHymJuRUnSXQ6P+i8z/3++LKK46SqScQLmBgSynQ7h5odllV
 RRBLbJMsl/mEl2lRPv7oOY+h1QyHkHnXsQ==
X-Google-Smtp-Source: ABdhPJym74nEAtQzlqxZV9lynZGgqc+heTYVtryceffxMxK4cvxZMxK+aNZUvMHehhNdBLsbDHV3PA==
X-Received: by 2002:a17:90b:8d7:: with SMTP id
 ds23mr1120143pjb.116.1611081273549; 
 Tue, 19 Jan 2021 10:34:33 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a136sm20651359pfd.149.2021.01.19.10.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:34:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] tcg: Add an index to TCGTemp
Date: Tue, 19 Jan 2021 08:34:24 -1000
Message-Id: <20210119183428.556706-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119183428.556706-1-richard.henderson@linaro.org>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to break the tie between the memory location
of TCGTemp and TCGContext->temps[].  Which is the first
step to allowing the array to be reallocated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  5 ++---
 tcg/tcg.c         | 10 ++++++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 504c5e9bb0..5ef644ceae 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -497,6 +497,7 @@ typedef enum TCGTempKind {
 } TCGTempKind;
 
 typedef struct TCGTemp {
+    unsigned int index:16;
     TCGReg reg:8;
     TCGTempVal val_type:8;
     TCGType base_type:8;
@@ -721,9 +722,7 @@ static inline void *tcg_splitwx_to_rw(const void *rx)
 
 static inline size_t temp_idx(TCGTemp *ts)
 {
-    ptrdiff_t n = ts - tcg_ctx->temps;
-    tcg_debug_assert(n >= 0 && n < tcg_ctx->nb_temps);
-    return n;
+    return ts->index;
 }
 
 static inline TCGArg temp_arg(TCGTemp *ts)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8f8badb61c..4a8dfb8f67 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1204,11 +1204,17 @@ void tcg_func_start(TCGContext *s)
     QSIMPLEQ_INIT(&s->labels);
 }
 
-static inline TCGTemp *tcg_temp_alloc(TCGContext *s)
+static TCGTemp *tcg_temp_alloc(TCGContext *s)
 {
     int n = s->nb_temps++;
+    TCGTemp *ret;
+
     tcg_debug_assert(n < TCG_MAX_TEMPS);
-    return memset(&s->temps[n], 0, sizeof(TCGTemp));
+    ret = &s->temps[n];
+    memset(ret, 0, sizeof(TCGTemp));
+    ret->index = n;
+
+    return ret;
 }
 
 static inline TCGTemp *tcg_global_alloc(TCGContext *s)
-- 
2.25.1


