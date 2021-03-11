Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17233688D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:24:00 +0100 (CET)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK97P-0006Nb-Bq
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95d-0004dc-4d
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:09 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95a-0001Je-SO
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:08 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 c13-20020a4ab18d0000b02901b5b67cff5eso258647ooo.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FmC8iYRkWhLwRAAr0jAUHUkiHiVReoHwdP1IZnbye6k=;
 b=ulaYSTPhoHVN8RqwVwZKpD5x5BO4+YAqM2Rme/dAT9N8sVdaIn4LPfxsfKF2uPGhmB
 UzXzOjGbGv+rR6/gGaaJmxbCwhIMBjHBCTqs1n/6P92gCdJP0HZk/dVLtT9V6dw5KAld
 7WnNE41a2Q+5a+K2hiJ9Iy3LNg6ckJVeV7YXkz3o8PZus+vl3kYTS5ot3NraFFlTI2BC
 bMP/MVjBx8KRynJOV6oSWv2OVJwTsSZvirZ84rEAEeKLQmaqJ5uo1woMyZaVd1+UKPzA
 5ehhw0v4qseXlBXjQD0By9Dv/DnsvFypubxyfaM7uaU1oKQnCSbBfu8NSA0BRGfbRGQT
 uPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmC8iYRkWhLwRAAr0jAUHUkiHiVReoHwdP1IZnbye6k=;
 b=FFpZ+32fuz1/hI+Spb/64OirUAmebw25WsYDh5kn6O084u9yWqmGoIO5pBuCxBajVs
 Kbtlkf6XvOyO5EifMTU8/f474t9LYbUnnDRJFxFi3E9iXkF+14/ufvEYJyzUv489MAGl
 RNPp1Z/hWs6jhqoQO2qWxVMEqeJBtaZ+N8D6bjAbFGF/EilFzPEz6G0Ya9+T9XJRIwtU
 ngmtzPLfe8JBKzRzdjWFFPoqeIvRBxGwqixWsKNQivrwsP2shA12XuF3eUi1OrCgWfPw
 modAyJr3da9YCQTf+J9nPo5lwGlsvbhvRDhwyVDRLXQDolQHEMnrVW4MoFfeRhVDfVHW
 CNuQ==
X-Gm-Message-State: AOAM531Gg1G7UfLa2tUTjRMUG0iYR6Tfaxznhj1gOzummTLthL4hJV+m
 CP/jCI6dCcjy65OPYR4vs9OQSnDhBxK4KjdS
X-Google-Smtp-Source: ABdhPJy7YoZexAe9c700RHdqeqbxPZyB6CK0GW/NnCvLsgQ4ZeG6P0QnsC4m8Nq50mGjjsoONe5UhA==
X-Received: by 2002:a4a:37c5:: with SMTP id r188mr4415049oor.77.1615422125868; 
 Wed, 10 Mar 2021 16:22:05 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] tcg: Remove error return from
 tcg_region_initial_alloc__locked
Date: Wed, 10 Mar 2021 18:21:35 -0600
Message-Id: <20210311002156.253711-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers immediately assert on error, so move the assert
into the function itself.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0a2e5710de..2b631fccdf 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -720,9 +720,10 @@ static bool tcg_region_alloc(TCGContext *s)
  * Perform a context's first region allocation.
  * This function does _not_ increment region.agg_size_full.
  */
-static inline bool tcg_region_initial_alloc__locked(TCGContext *s)
+static void tcg_region_initial_alloc__locked(TCGContext *s)
 {
-    return tcg_region_alloc__locked(s);
+    bool err = tcg_region_alloc__locked(s);
+    g_assert(!err);
 }
 
 /* Call from a safe-work context */
@@ -737,9 +738,7 @@ void tcg_region_reset_all(void)
 
     for (i = 0; i < n_ctxs; i++) {
         TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-        bool err = tcg_region_initial_alloc__locked(s);
-
-        g_assert(!err);
+        tcg_region_initial_alloc__locked(s);
     }
     qemu_mutex_unlock(&region.lock);
 
@@ -874,11 +873,7 @@ void tcg_region_init(void)
 
     /* In user-mode we support only one ctx, so do the initial allocation now */
 #ifdef CONFIG_USER_ONLY
-    {
-        bool err = tcg_region_initial_alloc__locked(tcg_ctx);
-
-        g_assert(!err);
-    }
+    tcg_region_initial_alloc__locked(tcg_ctx);
 #endif
 }
 
@@ -940,7 +935,6 @@ void tcg_register_thread(void)
     MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
-    bool err;
 
     *s = tcg_init_ctx;
 
@@ -964,8 +958,7 @@ void tcg_register_thread(void)
 
     tcg_ctx = s;
     qemu_mutex_lock(&region.lock);
-    err = tcg_region_initial_alloc__locked(tcg_ctx);
-    g_assert(!err);
+    tcg_region_initial_alloc__locked(s);
     qemu_mutex_unlock(&region.lock);
 }
 #endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


