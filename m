Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD263AEFF1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:43:46 +0200 (CEST)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN1V-0001Pd-HZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnK-0007FT-Kl
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:07 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnE-0007cA-CG
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h11so2898578wrx.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cAZVplwe6taLRXmDPd9fkYRiTPpe0hUloUGCcm6bWbQ=;
 b=BV8kfGl7Y87JyGDoHFW6HT9G6M+2jCkr1iGKa/rYPutvXg25tC8AtVtNStPWF2JXeq
 Q6SDxmhZmcuK//PWYfHqMbLTUK+RQwyoOVXfJVLrvI/RgyuXOB8Fao8QG+J/7vjHLie5
 dEx/1KJOPFAZuZ6HmJwXLzQgB77wka0hPnub09Jp2npzGClNyHpfooidT+2afupwVX3Z
 wTRID8OTzKVZwlognJE1RzxSjzcVLLgOynBscTtA3c15LLtyyK8nD7JzNextx77aGa6X
 tBLDTloadnIl/ZiU11yhBvCiH/I81qznL+GndtFMTS1AXXVShlh7h8MtjpgnLdm9iwEG
 ijvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAZVplwe6taLRXmDPd9fkYRiTPpe0hUloUGCcm6bWbQ=;
 b=pzoTO/LzArPRAAM/cAePG1OLX6TTCOr52h/1aXpeyJP7EJYMouguc98FfFsjFW+T4a
 lhDOC3S+M4FLD8lGBdfrG3fhJnrjbyPaGoXNScnMcjFs/sRM0kD7LsYQ6NKXhp/PocnD
 HiLnKg1m4u/h+ple9L8OEqQBz6MBGXa4M/BZseN1BfVhYO7qSeVwDAOcdVQqwS7tfZfQ
 lbNJ9L0vpT4MqdO5iv4w9DIWD+DMKC4zbW49oIEMexCH70WQlV1h8KTGhpgJ4+gh0z1v
 lhg9rp/YNIxRBm4hGBjUmBk3gsHlcVzeuHgGhF8ajMzD5TwJlrnZUGK87SQwXgmybX3N
 sxrw==
X-Gm-Message-State: AOAM530lO1Y0AfxLNzi6aMNlv1e8bN+iCjzl8Nk0kyrsq73J8Oyqjb/b
 kAIShZX0ew3zEyPTz/0MjA5qgEYmMbx/Qs0Q
X-Google-Smtp-Source: ABdhPJxG8KLq6je1ZV/5N4qbWGkYO17EzrJ+GvtTofSQq2JijXERsVpq185zhKBd3tGc727fytTHJg==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr30468156wru.338.1624292939155; 
 Mon, 21 Jun 2021 09:28:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/57] target/arm: Implement MVE VMAX, VMIN
Date: Mon, 21 Jun 2021 17:28:02 +0100
Message-Id: <20210621162833.32535-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Implement the MVE VMAX and VMIN insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-16-peter.maydell@linaro.org
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
index 6cd47d3458c..c040e42bda2 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -343,6 +343,12 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
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
@@ -410,3 +416,11 @@ DO_2OP(vrmulhsw, 4, int32_t, do_rmulh_w)
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
index bc66058fd38..107c393a997 100644
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


