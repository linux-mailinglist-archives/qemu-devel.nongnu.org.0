Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C143AF03B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:45:30 +0200 (CEST)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN3B-0005AR-4V
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn7-00077L-KX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn3-0007Yt-JT
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so434918wma.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=86CzO2LNhT3PB2cdx6WPz9ORM77sopDX9HHJsM0bDDc=;
 b=OzoqYRnRtxQlfUZgkaxqjt7zTDhYZHvN5ucJuTp3mel8llvbHKEApjzOoHfFq6dsSd
 mViPaENi8cz25OuRUFX5y6NviouVm+LAbcWZaRMMSD4bn6uamNuHxjZ8fBsLtcSy4znU
 2XURgJMXEUcQfWqE8ap5ob+JrFPdrmHVfqK5TnvWznyA1ZiXJOTOw4Axp4zzSJ+uouyh
 GPPEHVKhW+ICpPLwaJavVopQbY40ld7jVW/J0sAh44Jgobi0mOZ1HD8WYjvcx0EMCz8h
 V/yJbx18Bav1/s0TswvIC93xa1AJXp4Q+exSWngpU/uncxnUw4HPiJWu4Fl89cGAAbT/
 m9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86CzO2LNhT3PB2cdx6WPz9ORM77sopDX9HHJsM0bDDc=;
 b=QOY++CIO5btV45Ckh//FmAk2jpse+oL4S2QwDTTD5y3tRzn6w/9t4Vme8eHIf9mPas
 OdClKfk7KOo+Ky1KcWU3xzJzMPaZl9+F8bYBiys5albfKUhYGsWnIEJsWUAntxN5Snp9
 abDBbDC3r/JOIX5pC/AmdQaCntN+U+C6flQXUDJRG6Gz4me/rBlm9mYhXqZQTTs8Ht9s
 Tdum8oRnkW2W/bJsMns6Mg6CTNJGuYL1AbXFQuaE/AxMLozQmu/uzDJPOdXi7cYLbED7
 v90qa4mGhnA8pcQufd78Yibq5SuljtbcGVLFGuwVFcSSl1i9M5jOqz3/VTLKIU//0eMG
 x5Tg==
X-Gm-Message-State: AOAM5323L8WiDVUBLOyenVAm1UTb+qO1c8V5eRtwz6AMCxGMj0cbx1AN
 oGBaXL39GVn+UFS+SNsTO2k/C/lXQerkmx9E
X-Google-Smtp-Source: ABdhPJydUnShZ0jwE4y/dj1JQbjFV3dJG/DKw+njjyrDuJ047gkfgVavCE5qjGf2fVNPc1guVVdFDQ==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr27677313wmq.13.1624292927775; 
 Mon, 21 Jun 2021 09:28:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/57] target/arm: Implement MVE VREV16, VREV32, VREV64
Date: Mon, 21 Jun 2021 17:27:52 +0100
Message-Id: <20210621162833.32535-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Implement the MVE instructions VREV16, VREV32 and VREV64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-6-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  7 +++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    |  7 +++++++
 target/arm/translate-mve.c | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index bdd6675ea14..4c89387587d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -40,3 +40,10 @@ DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vrev16b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev32b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev32h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64b, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrev64w, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index adceef91597..16ee511a5cb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -70,3 +70,7 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
 VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
+
+VREV16           1111 1111 1 . 11 .. 00 ... 0 0001 01 . 0 ... 0 @1op
+VREV32           1111 1111 1 . 11 .. 00 ... 0 0000 11 . 0 ... 0 @1op
+VREV64           1111 1111 1 . 11 .. 00 ... 0 0000 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ba01ea3bcd0..8b565b50a9a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -270,3 +270,10 @@ DO_1OP(vclsw, 4, int32_t, clrsb32)
 DO_1OP(vclzb, 1, uint8_t, DO_CLZ_B)
 DO_1OP(vclzh, 2, uint16_t, DO_CLZ_H)
 DO_1OP(vclzw, 4, uint32_t, clz32)
+
+DO_1OP(vrev16b, 2, uint16_t, bswap16)
+DO_1OP(vrev32b, 4, uint32_t, bswap32)
+DO_1OP(vrev32h, 4, uint32_t, hswap32)
+DO_1OP(vrev64b, 8, uint64_t, bswap64)
+DO_1OP(vrev64h, 8, uint64_t, hswap64)
+DO_1OP(vrev64w, 8, uint64_t, wswap64)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4e5d032242b..32a8324c5e6 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -199,3 +199,36 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
+
+static bool trans_VREV16(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev16b,
+        NULL,
+        NULL,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
+
+static bool trans_VREV32(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev32b,
+        gen_helper_mve_vrev32h,
+        NULL,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
+
+static bool trans_VREV64(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        gen_helper_mve_vrev64b,
+        gen_helper_mve_vrev64h,
+        gen_helper_mve_vrev64w,
+        NULL,
+    };
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


