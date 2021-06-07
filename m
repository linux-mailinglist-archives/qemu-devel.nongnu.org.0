Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C63A39E4E9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:07:29 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIim-0002dB-FN
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaN-0007TN-UP
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaB-0007va-B4
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so81672wmq.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=utjJqfqjsvt6vOT/iEMzhSJNuKimAFESDmEerqjSl9E=;
 b=fNWJgCUkrNlayNYAA57g84uWCEV3NZ25Lfez5fxk0Aykh3L9+XPIYB+xt/+hkxef7d
 41cA3xM4sbbK/TMMwn1ItmTzSr6blaugtVPYdAj7oCm+QPS7B2JsrD28gPmGmabzic83
 ARp2AMGmcQB9mkbSuxv7HX1d6EcCWOU3psE88CFS3zBH+7SoVUB9w4b/xM7vPxV3rhNm
 8r1vpFutJ0opwclT7ENYoAz5aM5nTkFCgzCVfHh2pidNDukR/6QGB0GNCb+7xGtPx5es
 HtoCsXRX1k66fXEGDwbMdwqnL1vPVkD9Vp7a3lL9BF8mOyBZXjVo6uxd49prqDHwXzjA
 1xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=utjJqfqjsvt6vOT/iEMzhSJNuKimAFESDmEerqjSl9E=;
 b=ftXMZdAg9B+r7mQviDsBBGsVlu1bLNnHd/jMzfZap5r04YSefFjVtLJDxTAMHbyVU2
 pAKFRtKfxpDgLDVVeq77hmWNQlgLnJc2Z4M4SA2edeuDBtsjGkR6xr6+JBasexXu8Z7V
 Z1rNARkvyXQ8ZpedDlQ6j7MPB9VwTLhBLo+XwZqgJsh1DjCYu6dWwskimPLublUTElTS
 Tkvop7QZlfRkEE5UvgdYyxzR573du7OrzAWGYgJ/DWhDul50vhWrRzFpRNdjQCxLu5uZ
 W/pzgOZ5GqGE3JqBRLlzk6iRv6/SsTqL5ufbfs0Sk4Du1a9JkkVe+od/7hVVJazO6Vy/
 jk4A==
X-Gm-Message-State: AOAM5318NmwyPrvVI6/60UpaFhJWyl9Sfkg+Rc6iuJ1IYyLAP01cRqw0
 f3aLmrlHwxfx7mUZeFdsDvzttQ==
X-Google-Smtp-Source: ABdhPJwH6XOseUEZGt5Zt1uRAAwM5Vv5e2MbW8NbI165Rk1Jm+uh0ibr5lDNEvvlP0n+ND1u6W5GJw==
X-Received: by 2002:a1c:9a84:: with SMTP id
 c126mr17828337wme.160.1623085113984; 
 Mon, 07 Jun 2021 09:58:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/55] target/arm: Implement widening/narrowing MVE VLDR/VSTR
 insns
Date: Mon,  7 Jun 2021 17:57:38 +0100
Message-Id: <20210607165821.9892-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Implement the variants of MVE VLDR (encodings T1, T2) which perform
"widening" loads where bytes or halfwords are loaded from memory and
zero or sign-extended into halfword or word length vector elements,
and the narrowing MVE VSTR (encodings T1, T2) where bytes or
halfwords are stored from halfword or word elements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 10 ++++++++++
 target/arm/mve.decode      | 25 +++++++++++++++++++++++--
 target/arm/mve_helper.c    | 10 ++++++++++
 target/arm/translate-mve.c | 18 ++++++++++++++++++
 4 files changed, 61 insertions(+), 2 deletions(-)

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
index 575afce8fee..6a2fc1c37cd 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -180,9 +180,19 @@ DO_VLDR(vldrb, 1, ldub, uint8_t, H1)
 DO_VLDR(vldrh, 2, lduw, uint16_t, H2)
 DO_VLDR(vldrw, 4, ldl, uint32_t, H4)
 
+DO_VLDR(vldrb_sh, 2, ldsb, int16_t, H2)
+DO_VLDR(vldrb_sw, 4, ldsb, int32_t, H4)
+DO_VLDR(vldrb_uh, 2, ldub, uint16_t, H2)
+DO_VLDR(vldrb_uw, 4, ldub, uint32_t, H4)
+DO_VLDR(vldrh_sw, 4, ldsw, int32_t, H4)
+DO_VLDR(vldrh_uw, 4, lduw, uint32_t, H4)
+
 DO_VSTR(vstrb, 1, stb, uint8_t, H1)
 DO_VSTR(vstrh, 2, stw, uint16_t, H2)
 DO_VSTR(vstrw, 4, stl, uint32_t, H4)
+DO_VSTR(vstrb_h, 2, stb, int16_t, H2)
+DO_VSTR(vstrb_w, 4, stb, int32_t, H4)
+DO_VSTR(vstrh_w, 4, stw, int32_t, H4)
 
 #undef DO_VLDR
 #undef DO_VSTR
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index e8bb2372ad9..14206893d5f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -149,3 +149,21 @@ static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
     };
     return do_ldst(s, a, a->l ? ldfns[a->size] : stfns[a->size]);
 }
+
+#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST)                          \
+    static bool trans_##OP(DisasContext *s, arg_VLDR_VSTR *a)           \
+    {                                                                   \
+        MVEGenLdStFn *ldfns[] = {                                       \
+            gen_helper_mve_##SLD,                                       \
+            gen_helper_mve_##ULD,                                       \
+        };                                                              \
+        MVEGenLdStFn *stfns[] = {                                       \
+            gen_helper_mve_##ST,                                        \
+            NULL,                                                       \
+        };                                                              \
+        return do_ldst(s, a, a->l ? ldfns[a->u] : stfns[a->u]);         \
+    }
+
+DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
+DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
+DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
-- 
2.20.1


