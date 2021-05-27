Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEFC3925FF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:18:47 +0200 (CEST)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7Tq-0001dX-8q
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PU-0001Zs-Ce
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PP-0007D5-Bb
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:15 -0400
Received: by mail-pf1-x436.google.com with SMTP id q25so2664685pfn.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEYVI8LFk6gKuKrRnF8fi7M93S+ekzhJWlI6Apgn4eU=;
 b=p8LZ1BKVgZqYKudYMjH7qzvO4nH/DHzpAfA/EgRYpkOzk4JXDkVsDBhE5RQBPJjAIy
 uL2zyDB4eHXvUTcnUY+zBJfNhDxuPThEtBTN9LnP9mA7rOoCGk7fXMd8A2Lp1mDKTy9G
 4V3vToc6rDGXnRx1s0uWgwGRMeFH0gk3xOv0UfDVNLVPBmUrgBgTSHEswXN0SF5ExBY3
 Z0oArZ/4sKcz/sadFLDTiUDu0C2ormvmeE1/7IyRH/d8QSLR+WgtqcxOEYV6ExpUvO54
 m4cw8OammlqDiQjCa3TpeJNFojZpAfvP65N3fWAY7esfGwGOVlTgzuK/3doIoyS4swF9
 DXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEYVI8LFk6gKuKrRnF8fi7M93S+ekzhJWlI6Apgn4eU=;
 b=l2BL3bNi6SC+DU42VqbrvsCYYpV6HHrX9roY3dMKWKayGUsDdKN+3t73Wr18qlFdC9
 YirhQhF/V3tfWW595GxNSILC0LPMwQjllisA3X5qWN0PcBBC9pgcdbj5Loe/tLLmn0OP
 WAzAn0oaKJNXhfIj6BCPt+MCJmvN0W753e2v111QPd56wfdgsNHMFy6hcXXQNOUU8xHv
 f6a/NHsFGmJl0Rn1l4qJ1jrRftHeCh+ftGpLNa9kBCWbrtzc7UH0KtKN+jioPFdELtaj
 lGfYGVD4smKhkpJs0+DR6DKIBrVnaDg7MhKQ166OZJLkTfUe3E3cNuuNWqwmT7mdaE24
 K2mQ==
X-Gm-Message-State: AOAM533GdAsuVq0UX75ZAuuAtduKsy/6wJrE9dOLK+7ip5qxYrT53RHe
 zYEccaFsCSnhjgA8ZZ38VZK9soY9U10Raw==
X-Google-Smtp-Source: ABdhPJzgXUUT40s0378mIvZ8f6UFJ7XtHVXuq0UBTycLcb2+vjhu1GHaF0ZroqXUTz74hGE8sEIIiA==
X-Received: by 2002:a63:4b18:: with SMTP id y24mr1871088pga.438.1622088850164; 
 Wed, 26 May 2021 21:14:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] target/rx: Handle the FPSW.DN bit in helper_set_fpsw
Date: Wed, 26 May 2021 21:14:00 -0700
Message-Id: <20210527041405.391567-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both input and output denormals flush to zero when DN is set.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/op_helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index ef904eb5f9..2139def3b2 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -127,13 +127,20 @@ void helper_set_fpsw(CPURXState *env, uint32_t val)
         float_round_down,
     };
     uint32_t fpsw = env->fpsw;
+    bool dn;
+
     fpsw |= 0x7fffff03;
     val &= ~0x80000000;
     fpsw &= val;
     FIELD_DP32(fpsw, FPSW, FS, FIELD_EX32(fpsw, FPSW, FLAGS) != 0);
     env->fpsw = fpsw;
-    set_float_rounding_mode(roundmode[FIELD_EX32(env->fpsw, FPSW, RM)],
+
+    set_float_rounding_mode(roundmode[FIELD_EX32(fpsw, FPSW, RM)],
                             &env->fp_status);
+
+    dn = FIELD_EX32(env->fpsw, FPSW, DN);
+    set_flush_to_zero(dn, &env->fp_status);
+    set_flush_inputs_to_zero(dn, &env->fp_status);
 }
 
 #define FLOATOP(op, func)                                           \
-- 
2.25.1


