Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA339E52A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:19:22 +0200 (CEST)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIuG-0001UW-Hv
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIab-0007Yd-T9
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:02 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaG-0007y2-7I
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:00 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so81786wmq.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H19RDZJNg8cq62khuNWsX5QbG2di80hVtTkNupGoEFg=;
 b=nvNL5c1jh19l6gL9bQO/lwmKWi+3vHwPtCgomvG93WLwrfzQ8q78GuUbV8OJYlGHgZ
 8FkyF+ppFvJx4/VWQhxzSTrDsd2CcFH7J30AAFQ41c1CcylJTBS/3lFKm9dVv+twNUBL
 p0V58ywOW6e8KE5PrdnmbCqO1XCf4AGYgBrJ0zNUb8haxDP0WSsIFPEKJBmCNzasrZBT
 3NL2xHT8CWSKSyxxRRRRFNJFIUG6cq4d1UdGIfuevFzX77EzxNZrFA9CIWUYvHpQj2Ko
 iI7XtRnR5XpnzMsQUMhIiPlh28G4mP3Sxtz9yznLxjRRBl3Hj922wdEc9otqhC+voXXE
 ppjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H19RDZJNg8cq62khuNWsX5QbG2di80hVtTkNupGoEFg=;
 b=ZTjyREJJtzbgk4PYd8nF++tx3pIQJ4jsPVvVLzWxwL75z9qPVpwMJe62X5O7FVImXA
 hTZ/oW1SoXeIcLe3WR1vJH3Lnnl9Y4YZtfuioPTCttLSeaM3iJt7gmOjTGyfriDEdR04
 73swWXi4JVGJL2itpRR40Dva/3fIVrFAaJ6v1XgA7tpImqaCDziupAJ7+nc2rmZtnRkm
 nSFkMIahYOQnSt7IqABceqXlcHghXGsKKJZEBxx99umPlzp07uMITpt0cznUgy5CC6JX
 UTa4//YUIkCcZiBNctUvYywPfyBqiV5pEmOVLHkZCMis6cl3x3hwavh06anTTDSGx67j
 GdCw==
X-Gm-Message-State: AOAM531zInJEekS8M5n8Qm0PRQZdyl5+8z4tJjrHXTHZHAcDtqptdH0e
 dv424JGwwoBD0wxqnNtOWu/uWg==
X-Google-Smtp-Source: ABdhPJxdAVGHVCf7HMkQAXUm91pkGOGHXIbmWoSectS4tJ7qqHqOJjzNJvuOOXF8yKoigsjs8JRB2Q==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr99907wmi.26.1623085117675;
 Mon, 07 Jun 2021 09:58:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/55] target/arm: Implement MVE VMVN (register)
Date: Mon,  7 Jun 2021 17:57:43 +0100
Message-Id: <20210607165821.9892-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VMVN(register) operation.  Note that for
predication this operation is byte-by-byte.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 055606b905f..2aacc733166 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -264,3 +264,7 @@ DO_1OP(vrev32h, 4, uint32_t, H4, hswap32)
 DO_1OP(vrev64b, 8, uint64_t, , bswap64)
 DO_1OP(vrev64h, 8, uint64_t, , hswap64)
 DO_1OP(vrev64w, 8, uint64_t, , wswap64)
+
+#define DO_NOT(N) (~(N))
+
+DO_1OP(vmvn, 1, uint8_t, H1, DO_NOT)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6f3d4796072..6e5c3df7179 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -244,3 +244,8 @@ static bool trans_VREV64(DisasContext *s, arg_1op *a)
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


