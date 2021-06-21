Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A43AEF1E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:33:52 +0200 (CEST)
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMrv-0003vV-Sn
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnC-0007Af-5u
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:59 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn1-0007YM-12
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so14316106wms.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=goiSwei0C8VO8Y6KdCdws78dsW5nHmsxc2WhPP0v7oA=;
 b=T0iRFbfFQcLNpUm0Zm15XqSCLIQfl4AnrnBk/tObkEVGUeDprh4rNCBkGXlLfBLeQD
 y0PkzDAH3n0HlwJRJ0DDnKidI8Ay77RYZvvTprZHfLjCjyB7LFrJHHqJ+UpJYoctrgAz
 1RL5Cgm128TY5KUE57QiTQZJAi3lI3W/81hE9DZDsJ9jkl/9nZeJCyquNxRSO5Jt8k2W
 uGNHNS/fnDzUiUJ2hjIIaM2suL5AkpAfUbNDatl9nEx59FI1hHmwoR0w3uW7KokcacSs
 E0UQM/mrmsPDTjbWSpF+YUjfxwRZCJ72Z3eJO8QW0tVOFE5z7ATjPDeWh8DemaAm/c9e
 jWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=goiSwei0C8VO8Y6KdCdws78dsW5nHmsxc2WhPP0v7oA=;
 b=mys9eaLCg887SwvVbBNzytA3evh+gLEC8kbKHLDgT8MddijuJZi6ylgz6adQTkmwZT
 Ph4nV9XRUd8+NXbwblyasCRDrL94jUnPxveD0pPZFOZ6l1skrkAqUZjn7HWttOYiASYo
 l0Xm/oRNI4ZxWbo4hcX1zn97Odo1wMj8hqGUQgdY/DzGAhalAYINgxvU5IMRC/EAVGkL
 K2TM+XDsS+/6v4oC3SLUt6sfQ9ubTNNfiY2AJEnTRJ0SyBXefa74N6tLdvfLdGOMUTwn
 H2FzYOfmByRWkNZMchgZ5avmBDrGW8eDCAi1NOUjZI1MvfxXMjJu0r6wgQQgQVCc0ext
 LwCw==
X-Gm-Message-State: AOAM532jc9orgZiLzyQ3AVlE2lmzhM23JGlbWMb1t+UzmXW72k6V/X8K
 NrN4rFfnJxTd2ExKE+W6eZBU0oHUeFuiq9sg
X-Google-Smtp-Source: ABdhPJy5XB1plktryEmWvTiHUFNPdrU5RQmWmC4kkucNmaUdQ7n3zssjTpqDi6Ohm+nUvSt1JHU/9w==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr28464759wmb.130.1624292925798; 
 Mon, 21 Jun 2021 09:28:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/57] target/arm: Implement widening/narrowing MVE VLDR/VSTR
 insns
Date: Mon, 21 Jun 2021 17:27:49 +0100
Message-Id: <20210621162833.32535-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the variants of MVE VLDR (encodings T1, T2) which perform
"widening" loads where bytes or halfwords are loaded from memory and
zero or sign-extended into halfword or word length vector elements,
and the narrowing MVE VSTR (encodings T1, T2) where bytes or
halfwords are stored from halfword or word elements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-3-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 10 ++++++++++
 target/arm/mve.decode      | 25 +++++++++++++++++++++++--
 target/arm/mve_helper.c    | 11 +++++++++++
 target/arm/translate-mve.c | 14 ++++++++++++++
 4 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 9e3b0b09afd..e47d4164ae7 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -22,3 +22,13 @@ DEF_HELPER_FLAGS_3(mve_vldrw, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vldrb_sh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vldrb_sw, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vldrb_uh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vldrb_uw, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vldrh_sw, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vldrh_uw, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 858a161fd7e..3bc5f034531 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -21,12 +21,33 @@
 
 %qd 22:1 13:3
 
-&vldr_vstr rn qd imm p a w size l
+&vldr_vstr rn qd imm p a w size l u
 
-@vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd
+@vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
+# Note that both Rn and Qd are 3 bits only (no D bit)
+@vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
 # Vector loads and stores
 
+# Widening loads and narrowing stores:
+# for these P=0 W=0 is 'related encoding'; sz=11 is 'related encoding'
+# This means we need to expand out to multiple patterns for P, W, SZ.
+# For stores the U bit must be 0 but we catch that in the trans_ function.
+# The naming scheme here is "VLDSTB_H == in-memory byte load/store to/from
+# signed halfword element in register", etc.
+VLDSTB_H         111 . 110 0 a:1 0 1   . 0 ... ... 0 111 01 ....... @vldst_wn \
+                 p=0 w=1 size=1
+VLDSTB_H         111 . 110 1 a:1 0 w:1 . 0 ... ... 0 111 01 ....... @vldst_wn \
+                 p=1 size=1
+VLDSTB_W         111 . 110 0 a:1 0 1   . 0 ... ... 0 111 10 ....... @vldst_wn \
+                 p=0 w=1 size=2
+VLDSTB_W         111 . 110 1 a:1 0 w:1 . 0 ... ... 0 111 10 ....... @vldst_wn \
+                 p=1 size=2
+VLDSTH_W         111 . 110 0 a:1 0 1   . 1 ... ... 0 111 10 ....... @vldst_wn \
+                 p=0 w=1 size=2
+VLDSTH_W         111 . 110 1 a:1 0 w:1 . 1 ... ... 0 111 10 ....... @vldst_wn \
+                 p=1 size=2
+
 # Non-widening loads/stores (P=0 W=0 is 'related encoding')
 VLDR_VSTR        1110110 0 a:1 . 1   . .... ... 111100 .......   @vldr_vstr \
                  size=0 p=0 w=1
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 60c61268c7c..3c2b036c9ca 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -168,5 +168,16 @@ DO_VSTR(vstrb, 1, stb, 1, uint8_t)
 DO_VSTR(vstrh, 2, stw, 2, uint16_t)
 DO_VSTR(vstrw, 4, stl, 4, uint32_t)
 
+DO_VLDR(vldrb_sh, 1, ldsb, 2, int16_t)
+DO_VLDR(vldrb_sw, 1, ldsb, 4, int32_t)
+DO_VLDR(vldrb_uh, 1, ldub, 2, uint16_t)
+DO_VLDR(vldrb_uw, 1, ldub, 4, uint32_t)
+DO_VLDR(vldrh_sw, 2, ldsw, 4, int32_t)
+DO_VLDR(vldrh_uw, 2, lduw, 4, uint32_t)
+
+DO_VSTR(vstrb_h, 1, stb, 2, int16_t)
+DO_VSTR(vstrb_w, 1, stb, 4, int32_t)
+DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
+
 #undef DO_VLDR
 #undef DO_VSTR
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f98bd6d038d..4cabdf7a69b 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -146,3 +146,17 @@ static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
     };
     return do_ldst(s, a, ldstfns[a->size][a->l]);
 }
+
+#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST)                  \
+    static bool trans_##OP(DisasContext *s, arg_VLDR_VSTR *a)   \
+    {                                                           \
+        static MVEGenLdStFn * const ldstfns[2][2] = {           \
+            { gen_helper_mve_##ST, gen_helper_mve_##SLD },      \
+            { NULL, gen_helper_mve_##ULD },                     \
+        };                                                      \
+        return do_ldst(s, a, ldstfns[a->u][a->l]);              \
+    }
+
+DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
+DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
+DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
-- 
2.20.1


