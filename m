Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE212D31C0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:09:48 +0100 (CET)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhQq-0005hV-07
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIz-0007dk-3d
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:41 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIx-0006Mw-6k
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:40 -0500
Received: by mail-ot1-x342.google.com with SMTP id b18so16651451ots.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zjW4PjT9eWoc73I7yU10h5NKHpQH6qDD0fJsI6BkIQ=;
 b=tc1DJmUX2oSWl1IMBWjyQPLBSJXxAwOxVLwAZ2kJzZxHaQ7/syeEAEYNFdQrYT0VmV
 JKlJ+kD480Se3eZhlDavlXUIxI/ojcQkAdGAc4whWv5X+m1Ha733mKKNS0LPLkuBFjN9
 xFOFtrSdatP1Kz5cdJKoNgTk6/yZBlEEKcTqyKXKupdG0uSa8rZoqGlBUe43EpP1D58A
 4Yn7qEgplxLiP5ksPUDOX+H44Jo9COsOclZdhkwTNCBmDCQf1bsKuxXfyU51Qa0ajcKk
 OCtec1sgTt9dD7c1r8IkPm8esl4ZezC7EHQna76EzQ6FKv3tUJBYk57LW46oocQebOME
 Zj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zjW4PjT9eWoc73I7yU10h5NKHpQH6qDD0fJsI6BkIQ=;
 b=DFPqPjmDtbKSK8QbJvPABHJ+CvZkZFT0h0RH9uJ7mYSfKXh+GcQZbCI94qIX3RoZM0
 2IKwQQg3PGHdydMtyVwqRvHmXs7M1m4YhrQvUqGaNGRKsqXIEoL9x3ck5iqgEpIWCcue
 jc61C635ghACXkTFg+gyIRQOlchBxdXjLHcBjGNE3YyUoVktzuMiUZCfdAnP36LCBf4k
 OJQBM+mjzlGnVcnbGzsIKRMQP7rASycsIZh29BdIQGHNcTY4fZl1KrAzYWBRXzPw97J6
 fduvMkJ0pA/a8PpSR4IdLWleWxn59leriLu2c2BrNqguzbohKdDQkzR6s0Pd6z9I17Ob
 Yj9A==
X-Gm-Message-State: AOAM533OzDQ/+SA/fI1AXgAxMgiBGXdMDbg6NQdtiaJ9X/812ways1uD
 8Yqh9dw/Xp6IuB2pnWU8tkjYBMeeFYWJ8+sP
X-Google-Smtp-Source: ABdhPJzbPWO5ejriEO09/Mv/pe3+QmO1L0uGYz5QVgtGB+DlvyKnKchB3K0wBGLdD1mME4/jdJfarw==
X-Received: by 2002:a9d:4b03:: with SMTP id q3mr3978761otf.88.1607450497801;
 Tue, 08 Dec 2020 10:01:37 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/24] target/arm: Enforce alignment for RFE
Date: Tue,  8 Dec 2020 12:01:04 -0600
Message-Id: <20201208180118.157911-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6c76bc521d..a8bedbb45f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8259,10 +8259,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1


