Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24462F1CD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:49:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzZ-0007bu-05; Fri, 18 Nov 2022 04:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz4-0007Si-3V
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:31 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz2-000219-Dh
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:29 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w3-20020a17090a460300b00218524e8877so6671401pjg.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QrYtnxLvtfKAc7aqQk4XJ12ghRRjf03hK+wLuvAHjsA=;
 b=f3Dku6bWpuZM/TYfsyjgaCr4dOFnk+ysC5sPMUnBP59nQLkoxKVHe0523I2f5MdJFn
 fQj6DaZHhWX3aq7ZoNbP83K2nCyRidbgQxc6BTph6gveNi4ZAPb7YqXYp3zlfAopxbn7
 HPKP75h81HOBp3F90Ey1zdquue7FxCxf2vi9S7deMRIEcOis8HbqCrD3pab1owtsub9T
 ZzvjQn4kPnzndGcCiiieIMHFe/PU8gXjfC/yUrH3GcHq/Y1iYSVg3tVGBbycCUFlRNbq
 utKvj3Rac9qCAOxylIWQnlwjGYI17RlYq70zyehsF2gg3mlMJ3Nxy1E1Jk6U45qX0Qq1
 rVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrYtnxLvtfKAc7aqQk4XJ12ghRRjf03hK+wLuvAHjsA=;
 b=F5MA31qyEe8mJ7ffBSLIznqYgWXgaeNvNS7w1imJFLI8VA2jZvfskbGIicL/gfrDKt
 YIiLJ2qhULrloWMfRz8XO0kpTulMFJ32Ik+YcUh88AZBJaPKM0K7/jDIQ8CfyJyxGt6L
 Tn9AqspLIC5kOm7aKS0/H6chHiApJeUQJ42uhWibQDRjSV7CYLD2EJfzmdM5rzeK2f71
 uSYo9/6+OFTRLdJxZ9wcKzSsw8yQrSSEN9cRb0X1ZhZh+viQZud8M6lYabeZF85yNNEn
 ePAgN2AhzyTxDE25V68h33Aob+uK9dT5/1V5DfGedresmdE3VjyAFgfhtDCDyrDTGPCc
 bLtg==
X-Gm-Message-State: ANoB5pm/ioupZD7S/CRGKs+CF3rEQfLnC441IIN70kSoJp06e1EjTY5L
 6qMqRYcXJRTSu6bgsEkb85FazM7Rurjl8Q==
X-Google-Smtp-Source: AA0mqf6Ew/XQLgpWrsN98gGKJyRELhU1Ig2oVr90kXlH1maersaRB5z6GlAIDl+CVnspHH8jVlpmFg==
X-Received: by 2002:a17:902:8217:b0:186:e2c3:91c6 with SMTP id
 x23-20020a170902821700b00186e2c391c6mr6764149pln.27.1668764907661; 
 Fri, 18 Nov 2022 01:48:27 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 15/29] include/qemu/int128: Add vector type to
 Int128Alias
Date: Fri, 18 Nov 2022 01:47:40 -0800
Message-Id: <20221118094754.242910-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Adding a vector type will make it easier to handle i386
have_atomic16 via AVX.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/int128.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index f62a46b48c..f29f90e6f4 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -479,16 +479,16 @@ static inline void bswap128s(Int128 *s)
 /*
  * When compiler supports a 128-bit type, define a combination of
  * a possible structure and the native types.  Ease parameter passing
- * via use of the transparent union extension.
+ * via use of the transparent union extension.  Provide a vector type
+ * for use in atomicity on some hosts.
  */
-#ifdef CONFIG_INT128
 typedef union {
     Int128 s;
+    uint64_t v __attribute__((vector_size(16)));
+#ifdef CONFIG_INT128
     __int128_t i;
     __uint128_t u;
-} Int128Alias __attribute__((transparent_union));
-#else
-typedef Int128 Int128Alias;
 #endif /* CONFIG_INT128 */
+} Int128Alias __attribute__((transparent_union));
 
 #endif /* INT128_H */
-- 
2.34.1


