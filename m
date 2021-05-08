Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FF7376E80
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:22:32 +0200 (CEST)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCbv-0004WG-GV
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7x-0002YV-23
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:33 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7v-0005OM-Dc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:32 -0400
Received: by mail-pl1-x632.google.com with SMTP id 69so1538212plc.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XXqS6PgcSZlxXGytmQAaetCCBR4/W9tsx3dsxyfVI/Y=;
 b=FPWUY0JclDLztfx6qzMYlXc69eigfkVVOqzGCNuVWKVgTb+X9DWCiW7wnSKaVTh3Fy
 CcUttI4zPrjRtYW/mnKgQlA+T/haM+pEPEfO6cIu2VJncaxUE6by/SpEoXY9Ueuewihk
 o/mhN9hWNYpBmjqHLwqucDfryL5kLgN/0Mry9PfzJ/2fPL5KnFVn7QulInUuQt7w1GUI
 cUDF0nBTEOO21aJLm9IdbPFEF6s1z8aOriYd1kdvnBuzHtBl5Idagbk88CHbJH5lSkTG
 V6nAuIVnrTG1a3lpX13Hznh4rN++en1IF/KTb8tItQlQR+4nTq9oaQGmSa+p43FN6KFf
 Cqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXqS6PgcSZlxXGytmQAaetCCBR4/W9tsx3dsxyfVI/Y=;
 b=ET4aPWnNfkjd2/hZOQPyz8DkU3xj526nBk+doHqLN9R+xHF8bdhzcaTkIqbnVjmwVH
 E3TM8MqWjP1Wkcupwu6lc2Pkk463gnYK+MK2q2gKdwRCKonKxZ1kwCE+pUEcvSNY2nKg
 8T2LB9hs/Pr8dxCKtnMnVo3teeYnK68AJCipZCIP7Y1+d/gmdjxERXUBcEOJNW451BYt
 ceEwwYH8EBdPL+Hojt/VNbLkXa75Zy3FBVTzfD/9kiYsrYh+BdKEgFEE0MNvgKyT65Mi
 KrlhrIRqpDdfRNWLlpmgep8j63176Qxttk53vfMNDVrrZXuDzw1eTLTuWWssqpcRsXJv
 fbZw==
X-Gm-Message-State: AOAM532cT5xD9da6NPxo28HGFK643pMFZoteMORIOGmr2jgSTZT/enZ3
 jV++j1dr3tMdjC1qS8y3JgQnfxvDP0PIlA==
X-Google-Smtp-Source: ABdhPJxxBqPccl0QaMKOq1j5ublitOORTx5S0iKY6KHXGONpqWXf3K8CGGMS4HMtwynlMbhy097pbg==
X-Received: by 2002:a17:90b:19c9:: with SMTP id
 nm9mr13107190pjb.98.1620438690003; 
 Fri, 07 May 2021 18:51:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/72] softfloat: Tidy mul128By64To192
Date: Fri,  7 May 2021 18:47:30 -0700
Message-Id: <20210508014802.892561-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Clean up the formatting and variables; no functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index 76327d844d..672c1db555 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -484,24 +484,14 @@ mul64To128(uint64_t a, uint64_t b, uint64_t *z0Ptr, uint64_t *z1Ptr)
 *----------------------------------------------------------------------------*/
 
 static inline void
- mul128By64To192(
-     uint64_t a0,
-     uint64_t a1,
-     uint64_t b,
-     uint64_t *z0Ptr,
-     uint64_t *z1Ptr,
-     uint64_t *z2Ptr
- )
+mul128By64To192(uint64_t a0, uint64_t a1, uint64_t b,
+                uint64_t *z0Ptr, uint64_t *z1Ptr, uint64_t *z2Ptr)
 {
-    uint64_t z0, z1, z2, more1;
-
-    mul64To128( a1, b, &z1, &z2 );
-    mul64To128( a0, b, &z0, &more1 );
-    add128( z0, more1, 0, z1, &z0, &z1 );
-    *z2Ptr = z2;
-    *z1Ptr = z1;
-    *z0Ptr = z0;
+    uint64_t z0, z1, m1;
 
+    mul64To128(a1, b, &m1, z2Ptr);
+    mul64To128(a0, b, &z0, &z1);
+    add128(z0, z1, 0, m1, z0Ptr, z1Ptr);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


