Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451369D700
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:27:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYV-0003uG-GB; Mon, 20 Feb 2023 18:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYT-0003nu-0f
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:45 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYR-0000LF-Gn
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:44 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so3132876pjc.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=S6sEYxzGxO3bfpesCdh8SoyA0w8Nm+dMMgqv79oqg0RDkdwJjOTil9JPT1AYe84ZfJ
 8uFmlk38dM+iwRR8uf3a/sbjebwSrt2ssGewg89oYl5uC+hcKAaXoN34UJT616QEIJi/
 Apx6uKufuN0zUtOiLGE/84w921NlCwj3BT3rXBwyAgEvAR1I1Wj5HFY4SJaWFmu10VvP
 uo1J4+J01t8e4cZTg/fUCeLq3Mbg90DMJ6Cj1dqgaI+2cKB/H9ragb9IITl3TEb6D8xK
 JtgyOiLnEtSTZ0Q+2ICVic+p0wxn1Wl307BUP39tz1zoCGb++2jOaYVUaRTQEQSl6Mba
 odFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=DAZZNPTDCq1GBiTKwWGMC3BtSedsLiVBdF/6OyEIgxzraRdeIw5ZOLEZa3w2Zi9hFC
 LUx1lsRpA5+gNmwjmoBLisqhZan5x27GYnjz5wAyDbui9wNaVgtumDfCE3dAnNLftQEq
 fMijhCoZP4GtU4IbYO0rZCtJm8EnhNb8sRd7p/yeEudJfrIsch7XjwFjjN9wOI9Y9smG
 eyIiQBSDX20o7RlNjIc4YYDZaB2JmycIRsowJwkuPODSuoWrqiQBjBKUlBgYDLEY9sgp
 DfH6FnCDR8gkPlz45jh4ItGanugiIzbfpQsvmOGZydSAa92BKCsYE0lmhjdDJLfZk23t
 CwgQ==
X-Gm-Message-State: AO0yUKWdxm3kHbG2RoPVLLfY0l33aZOiTlTxILgBByC/rCfH2mXCUWP1
 jPOnJO5ejRlA0nPYOpFeeGbhiiAaawLWi47JNjA=
X-Google-Smtp-Source: AK7set/ZFP7U6SrNTDIu7u4TiG5IwHUP/QlbENdv9lLJ+U4BYG3qaZCXyi/zypcALle5rT5ktfETJQ==
X-Received: by 2002:a17:902:d2c3:b0:19a:80c9:2cd7 with SMTP id
 n3-20020a170902d2c300b0019a80c92cd7mr3138209plc.47.1676935601902; 
 Mon, 20 Feb 2023 15:26:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Date: Mon, 20 Feb 2023 13:26:12 -1000
Message-Id: <20230220232626.429947-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will need 2 bits to represent ARMSecurityState.

Do not attempt to replace or widen secure, even though it
logically overlaps the new field -- there are uses within
e.g. hw/block/pflash_cfi01.c, which don't know anything
specific about ARM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..d04170aa27 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
      * "didn't specify" if necessary.
      */
     unsigned int unspecified:1;
-    /* ARM/AMBA: TrustZone Secure access
+    /*
+     * ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
     unsigned int secure:1;
+    /*
+     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
+     * easier to have both fields to assist code that does not understand
+     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
+     */
+    unsigned int space:2;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
     /*
-- 
2.34.1


