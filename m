Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EBC3A69F8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:21:57 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoPU-0005uj-16
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEZ-00010X-52
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEO-0000JX-Io
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id c9so14928495wrt.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rl5qJBg3qQz3yb23IGMzCXWq2gFztrjsomKiGeGjjRc=;
 b=MdJaYzigECveU/Yx2JNTm8LbLQOvG7FLFKefNbA+7H0OVernnwJiSscR0EKN6B0wG2
 Oi0WCL+MA3I42f3ZYRuM2zski0tBC0Sr+IxCGmCb5VsuLJl5Hl0xfKAZX0+BWo4XVv/u
 nL7PjU34i4KDoGjKRCzKcAsrscutoXiH1wHMctYMyDVAFSyCtExvVMlpqnyBdW4BICcC
 N96XIoCYvHU4Rg6kMab09g/IpXpk8IDLd+X+gKLsoGDlHgkEWpqIFOKeC2gORNOSanpZ
 r7zzcU4bQ93S78cWiGaz/0KXRD/PHOYq+vo/aLLU/1MArMGpP7n9JzBZm58FbyQgmyaS
 7rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rl5qJBg3qQz3yb23IGMzCXWq2gFztrjsomKiGeGjjRc=;
 b=i8A0pnUHlZtkcaixnOU7GYsgdHlHce2EKw8nsyThs84ziIbyoCIaS+qcjQuSukif4Z
 DAlWxKR9pRwpyRv1Ho++ZxPgtOUu4o3c5UMymwStqTDEr1rNDamDe8OhakMRlCjcYuP/
 1VbpjnUOb1VtnjPfoRBJt4+QtDAHGQ6GXyIxGd/0/seOCBCqTWMpvBWthJyX96zD/IAO
 5gLH1W3g6ELqR2xNLC3JUVVr/BMJSFLKrtuonSoduny1pkG4u1/0ehzYv0rpLFOHak1m
 hCCtqcxDOeY5LuXZvW3W6WblsJloqM09DHTTDlUY/L1g7AxCt0c+TnjgTDxVoghrHOAB
 mLIQ==
X-Gm-Message-State: AOAM5331BhD6cSkR7/k6VXoxlmBaREV05BRiM3PkiUomJd++R5YyvkuY
 pwFnAFDcEmI2HPYoM03huAfSh/LwhrcV5A==
X-Google-Smtp-Source: ABdhPJzQbMx2ZCCDyIv4+VwIQKWmQCarjR75DX19L4KJPF/YNYigHQFjeKJ81z0l8WlALNgVvY7t+w==
X-Received: by 2002:a5d:6952:: with SMTP id r18mr19278033wrw.392.1623683426065; 
 Mon, 14 Jun 2021 08:10:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/57] target/arm: Implement MVE VMVN (register)
Date: Mon, 14 Jun 2021 16:09:28 +0100
Message-Id: <20210614151007.4545-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
index 50af6aadec6..564f86fc65f 100644
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


