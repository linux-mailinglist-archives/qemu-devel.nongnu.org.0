Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED23A69E8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:18:35 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoME-0007Fl-3p
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEV-0000nO-AV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEJ-0000Ft-8R
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so209710wma.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jHyHHJQYc24NeBz/4RxGNxyYI/ZKxiP08xZButuCKU=;
 b=iRqHFsKE3UMyaUz6+zoJZoehbvf1KJpp8YVwOsBhGRPeiBKNMN+fdu9siWUnFKadLm
 a9bIVcxhTgf5t8I6fRTDHm7MCEqwxfA5gAmrvSx5asRy4Iu9GtgJYWFn+MFuJwIQUZ4B
 AUDJ6G0fVJeprpVU7OXb1wYKIzEA0y4jLysGMeWqaOLkJsRAJidM6znm/a0GJBh0+JIO
 kCbvNWBs4iSyno+SElE93OQnLX/+Z7LdXqMV5/ldkkDt6S8l7LW40qTfqCj+GdDLKIpn
 MPwmdLV3D+4+o/XRxWUenqJfYopkbCJu9VYqGZzK1wf8rqyIhfVEdN1UZ6E1ztFktOaz
 6Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jHyHHJQYc24NeBz/4RxGNxyYI/ZKxiP08xZButuCKU=;
 b=gxbErDTkLnrKaXutUbudE14pcBuU9Bu20w8S/dVX2rpQDlq2H5BfEPeFZJB/iVwkAR
 9bJM/DWI9rFn798FGRZ9imZ4S7j4E6H1315Zd9n6MOAtr9nVnZBkRQyVNRh6GwdTMbkt
 b39GBYMkj7FeOyCOJ0Bcte/44QeOMw1NJ4MGrL/6+S/iDqAGfhPpG8E8jqjVEY16ICY4
 0a/3XRgos1x5hHzRjg6V6zHqfCTvEugyB4JfQi56HyclZiTcfZKs8cEpHOSMeUp2dtiq
 JAzyQhr/Ffw3oZGicyHkDVmLuLbBshL41ALzxgYzE3UCR1HpEKfVVd01qccSL2o1jPeM
 yX5Q==
X-Gm-Message-State: AOAM530NC8KARNHxUGJ+9cfcNIpqp28HNKiq5xsT5isuCYowsLaLiC+F
 EjGy+S3SdvnkiZg25pvuy9Qzyg==
X-Google-Smtp-Source: ABdhPJzQVqk+Ui+zufCQ2Coggyg/ES4NWQrij4Gn5EIjYon16ZoQMCFqacQ4fSvwqkNJAVUsiXARvQ==
X-Received: by 2002:a05:600c:3b86:: with SMTP id
 n6mr17091570wms.50.1623683421447; 
 Mon, 14 Jun 2021 08:10:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/57] target/arm: Implement widening/narrowing MVE
 VLDR/VSTR insns
Date: Mon, 14 Jun 2021 16:09:22 +0100
Message-Id: <20210614151007.4545-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
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

Implement the variants of MVE VLDR (encodings T1, T2) which perform
"widening" loads where bytes or halfwords are loaded from memory and
zero or sign-extended into halfword or word length vector elements,
and the narrowing MVE VSTR (encodings T1, T2) where bytes or
halfwords are stored from halfword or word elements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index c07110a145b..7282f56b18d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -168,5 +168,16 @@ DO_VSTR(vstrb, stb, 1, uint8_t)
 DO_VSTR(vstrh, stw, 2, uint16_t)
 DO_VSTR(vstrw, stl, 4, uint32_t)
 
+DO_VLDR(vldrb_sh, ldsb, 2, int16_t)
+DO_VLDR(vldrb_sw, ldsb, 4, int32_t)
+DO_VLDR(vldrb_uh, ldub, 2, uint16_t)
+DO_VLDR(vldrb_uw, ldub, 4, uint32_t)
+DO_VLDR(vldrh_sw, ldsw, 4, int32_t)
+DO_VLDR(vldrh_uw, lduw, 4, uint32_t)
+
+DO_VSTR(vstrb_h, stb, 2, int16_t)
+DO_VSTR(vstrb_w, stb, 4, int32_t)
+DO_VSTR(vstrh_w, stw, 4, int32_t)
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


