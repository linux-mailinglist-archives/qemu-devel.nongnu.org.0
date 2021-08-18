Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6638E3F0CE0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:39:02 +0200 (CEST)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSKz-00023B-GD
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2Q-0008GL-FO
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:53 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2P-0006LF-31
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k24so3485409pgh.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aRM/aV1nNd+z0X6JLDx3kBkYbHw3rVDD5maGh4N4GXM=;
 b=AheVb+eFo+YD6nig9aY/StyGg0faymC1Y43Tm1T2UlqrTz5E5O066z7qQIHUuWkZ6a
 I1A2FgFeXVsnpT3kEuD6CcwHAosJChJu2VwlcDuJxhUqDb8oGpsd17imv6yQmzNO8aan
 2JQk/B/3pZQ4aWqMC0CDv4pvkX3abQN5QxM+1driwdhaem26HgMEHjLy8xpCN58aATBQ
 QBAU3t1Xk0rU39tIVEg6uAABTdnBeutKrwjH4OwIXVVPHZTfGUh669soXfYgCyggWqSg
 yxKKjmaq2Rh2b1lidsdZMdf6h5zhzuIl1K3tQeAvMkA4Yh/7+iRbhUmAeMGW0KXdEe3X
 /zBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRM/aV1nNd+z0X6JLDx3kBkYbHw3rVDD5maGh4N4GXM=;
 b=VCzN+PBMZ11kK5DERROBtFcOP8nM7tNpWClP6zFxR4qSduTLkc7tNlWWHVCilhW4s5
 C8xNOMcXTgxUemzRGBeu1cHnqkfembUR9c8Y8ntmF9K+4EbSSE7r4jQWTQtraEC7QTMG
 PGmntiB2KcnmmoJadjXFSexTAXnSylsGj38J3Q1wuVzJ3nW2PyeBBQmvvL+hKb8ygVs5
 RQinsLfqyZ7eULHekyDbYLaLVAmAwsEy6jsRJ1IvoKfCd2yNsRn+bY7j8hqSnVZIBNNl
 CmoHLJENLOFBvPbCPGFKQPKq6/w0Kuhb/HBKxNCPGTyYzffs664VI/HzxShDd0oud4IO
 9q6g==
X-Gm-Message-State: AOAM5311jTpniqTgEGz/Q7RRO7XFMfoyZl2ngnnwgQkvg9sawYB9Cn88
 9EfjwtRNsZAY8wZ08nXoCghoDydwoO/mMw==
X-Google-Smtp-Source: ABdhPJyaKFazkAy0801fxuBOWdcQJWCmPHzWHynYHKbv9eByef7SJdZsI2uMqyx5R7PooHZUlv8EoQ==
X-Received: by 2002:a05:6a00:1ace:b0:3e2:2a73:e0a4 with SMTP id
 f14-20020a056a001ace00b003e22a73e0a4mr11357832pfv.73.1629317987782; 
 Wed, 18 Aug 2021 13:19:47 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/16] tcg/mips: Aggressively use the constant pool for n64
 calls
Date: Wed, 18 Aug 2021 10:19:29 -1000
Message-Id: <20210818201931.393394-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Repeated calls to a single helper are common -- especially
the ones for softmmu memory access.  Prefer the constant pool
to longer sequences to increase sharing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 2ab37ac7c0..f641d86561 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1057,9 +1057,19 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
 
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
-    /* Note that the ABI requires the called function's address to be
-       loaded into T9, even if a direct branch is in range.  */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T9, (uintptr_t)arg);
+    /*
+     * Note that __mips_abicalls requires the called function's address
+     * to be loaded into $25 (t9), even if a direct branch is in range.
+     *
+     * For n64, always drop the pointer into the constant pool.
+     * We can re-use helper addresses often and do not want any
+     * of the longer sequences tcg_out_movi may try.
+     */
+    if (sizeof(uintptr_t) == 8) {
+        tcg_out_movi_pool(s, TCG_REG_T9, (uintptr_t)arg, TCG_REG_TB);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T9, (uintptr_t)arg);
+    }
 
     /* But do try a direct branch, allowing the cpu better insn prefetch.  */
     if (tail) {
-- 
2.25.1


