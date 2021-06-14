Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECAF3A6A86
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:34:58 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoc5-0005aQ-Bi
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0001WC-Qm
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEU-0000PL-26
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:50 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z8so14940864wrp.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b25jlqMC6GfxCzpnG2lQcXBoszD7xZki+rTZyGAw5ag=;
 b=tOgsfv2mdI0jauEL+aWWeWEouhWdoRtVOyf+0mZYdJiZuSIR1FaEzICcUfaeRFWzhg
 AANp1ZvzCmrNpsJWyGnsMd2Sb3jLJRoB4bi+MSG3nzsCbWSC2WIOnxhDZOQ3Qlz0bo80
 MBefllRzRMjZCjW0mC9Y0l6mdxSMQHK/38ALszvD402nF0pyteX9maORTNSGVzPe1XAj
 kZVSU36Zyn8TPHVVMLcn99c9vVw0NV4mwGBq5jKqZohfWDQiTXZqqsMIXsq9wmFTXz0c
 p7vP9/NpXLPiHSqr5mtbro2WK60qzpW2/1AjxiIPX13c8idmfZPOuNO+b4LjMaUKV8Bl
 tjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b25jlqMC6GfxCzpnG2lQcXBoszD7xZki+rTZyGAw5ag=;
 b=RDz0JAw5hsLiTj7zlRBC4AaTgH1KaVInetnUIdwZNoyZOy2IxV6o7mmE09QGWYe6EV
 u6sgTyBB8noFQctNjdHgncmFgZsa+3bJbAkKSer9Xb2TU/y1ePV6ewjj/i3dtxXJgYk8
 afBtRMgquarrJQ/w5H4QFVZ6LDFQXheqkejF1MTmJ5Y2zCVEKFkQklzjtr1j5QOJMkS/
 vI4emiIba3j29Unl/IbWgXnGCj+fJJ39McwjLbnBDDvuAbHplLJTvgK8aGHZpHRa2Pm0
 +4xdGY0aYxRvz7dhGrtLxkIaj77r8mO9eFMxt+SdXCIIcVjytB3k64+2WFt3gdD+dNLr
 XWmw==
X-Gm-Message-State: AOAM531MMHAlLTubDInDpRZQ3UsqFIwdnm3itBG7a9nfVHZd22jk58iL
 jxUy/VH4QEw7HR21w9964iaFIg==
X-Google-Smtp-Source: ABdhPJwbT/Zawg/+xbTnxsTytVan9VCDhwBY8pLorlbP+i0Vl/xffLlTgCd5tu2c4Ja0QBdGwLs76w==
X-Received: by 2002:a5d:6952:: with SMTP id r18mr19278600wrw.392.1623683432714; 
 Mon, 14 Jun 2021 08:10:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 27/57] target/arm: Implement MVE VMAX, VMIN
Date: Mon, 14 Jun 2021 16:09:37 +0100
Message-Id: <20210614151007.4545-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Implement the MVE VMAX and VMIN insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0e496971f02..5181d3b9413 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -95,3 +95,17 @@ DEF_HELPER_FLAGS_4(mve_vrmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmaxsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 4ab6c9dba90..42d5504500c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -88,6 +88,11 @@ VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 VRMULH_S         111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 VRMULH_U         111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VMAX_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
+VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
+VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
+VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 9ff39f0fa18..d9f40438be9 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -358,6 +358,12 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
     DO_2OP(OP##h, 2, uint16_t, FN)              \
     DO_2OP(OP##w, 4, uint32_t, FN)
 
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_S(OP, FN)                        \
+    DO_2OP(OP##b, 1, int8_t, FN)                \
+    DO_2OP(OP##h, 2, int16_t, FN)               \
+    DO_2OP(OP##w, 4, int32_t, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -425,3 +431,11 @@ DO_2OP(vrmulhsw, 4, int32_t, do_rmulh_w)
 DO_2OP(vrmulhub, 1, uint8_t, do_rmulh_b)
 DO_2OP(vrmulhuh, 2, uint16_t, do_rmulh_h)
 DO_2OP(vrmulhuw, 4, uint32_t, do_rmulh_w)
+
+#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
+#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
+
+DO_2OP_S(vmaxs, DO_MAX)
+DO_2OP_U(vmaxu, DO_MAX)
+DO_2OP_S(vmins, DO_MIN)
+DO_2OP_U(vminu, DO_MIN)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b6ca03a0f60..369eff998c9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -351,3 +351,7 @@ DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
 DO_2OP(VRMULH_S, vrmulhs)
 DO_2OP(VRMULH_U, vrmulhu)
+DO_2OP(VMAX_S, vmaxs)
+DO_2OP(VMAX_U, vmaxu)
+DO_2OP(VMIN_S, vmins)
+DO_2OP(VMIN_U, vminu)
-- 
2.20.1


