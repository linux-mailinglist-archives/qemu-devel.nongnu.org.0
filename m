Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFBD3AB398
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:31:15 +0200 (CEST)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrAv-0001HN-AW
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwr-0001Bm-U3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:42 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwm-0006w8-MB
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:41 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so1528418wmb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5S8VKHcS2e4Odv4CstwPlDuKl+BqWB81rtQ8YHYpuU=;
 b=Y4mI8P3cyUBGJEBHftwPv1wG/OQ2UBFuUCbqT/3GelnXAgYlvYvFP4J6RGw/rBZH4P
 Y1XXfoFQ3pPQLEMIJ86VuilX0SJ5KyC7JWhDI1yxz+ZUKPNZkVwUqYJq5OFRT8qAXWBB
 zrGFBJkhxFl2XalcO9pRjhHnIUD6r5HqlxUOdpcuG14U5PRfkC3jITBukP7p9HHz1mxV
 QviQSSvji3oLLN6qI+DSlVpGkYbyF9DV2dFztA0bPS0XMoDTp0RZBfmg3j1VwphE/xt8
 5TrzCHm34dPJ7easwkfnHspXNy4AOT4Cmbt4ethRInahjjH7oZiurCACZh63aUW1iW4n
 oFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5S8VKHcS2e4Odv4CstwPlDuKl+BqWB81rtQ8YHYpuU=;
 b=ZFBeMob9bDK6jZKBLDFYKull0sRVkaSxj+3gHpgFwqK3Y8UX6ZFaNF23seC2GPlx8s
 Dmb453tCZUa5GeyEsYPTwZGPW10KBgHV63zPos/Pby2jOO/3MeI6Nwyjag72yKyJiO++
 BU7Nv6MPIkbYILq+FSvd7crDIs+sPnx1z0Cnu75bfrqTMj4SmnaQXKSrVID6bqBN3yXe
 jHS663tVwiwONu+BLs+pf0zF/+XTfIWgLzRxCjwYwldR0wc6gJ9V6LXOgXxafesM79sL
 J3uHiXnOQ9xcQ+S6wiJgLTVK2rkkl1AzPUN0GSSbwtujnq/8aRrcRucme83cHDTSzn5g
 a9Kw==
X-Gm-Message-State: AOAM5307fRNRt8NaiOz1QFVzEx1ImVdXG6zlXV0wgH2NBtvYDguBrlUt
 mUwxQB5wBufsxSLNY79Ucr3Oi4njrT4GMg==
X-Google-Smtp-Source: ABdhPJyWEqXsIbU3EmVcMzfizMkFCWc3u9EedYr3jHUfyp0DSs+hNiQc95oWUgrXueiN3wr29t/QCw==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr4578814wmf.173.1623932195252; 
 Thu, 17 Jun 2021 05:16:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 06/44] target/arm: Implement MVE VMVN (register)
Date: Thu, 17 Jun 2021 13:15:50 +0100
Message-Id: <20210617121628.20116-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VMVN(register) operation.  Note that for
predication this operation is byte-by-byte.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 2 ++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 4 ++++
 target/arm/translate-mve.c | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 4c89387587d..f1dc52f7a50 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -47,3 +47,5 @@ DEF_HELPER_FLAGS_3(mve_vrev32h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64b, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vmvn, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 16ee511a5cb..ff8afb682fb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -30,6 +30,7 @@
 @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
+@1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 
 # Vector loads and stores
 
@@ -74,3 +75,5 @@ VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
 VREV16           1111 1111 1 . 11 .. 00 ... 0 0001 01 . 0 ... 0 @1op
 VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
 VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
+
+VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e0bb4755748..97da43fa3d6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -292,3 +292,7 @@ DO_1OP(vrev32h, 4, uint32_t, hswap32)
 DO_1OP(vrev64b, 8, uint64_t, bswap64)
 DO_1OP(vrev64h, 8, uint64_t, hswap64)
 DO_1OP(vrev64w, 8, uint64_t, wswap64)
+
+#define DO_NOT(N) (~(N))
+
+DO_1OP(vmvn, 8, uint64_t, DO_NOT)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 32a8324c5e6..bd908abcff7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -232,3 +232,8 @@ static bool trans_VREV64(DisasContext *s, arg_1op *a)
     };
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool trans_VMVN(DisasContext *s, arg_1op *a)
+{
+    return do_1op(s, a, gen_helper_mve_vmvn);
+}
-- 
2.20.1


