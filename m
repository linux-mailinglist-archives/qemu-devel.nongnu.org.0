Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C239E53F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:24:01 +0200 (CEST)
Received: from localhost ([::1]:46812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIym-0001eQ-NG
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb9-00084L-0e
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-0007zz-TG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z8so18395631wrp.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNvU9z65691m9PWY2OvQX5jqP+5ASM9qcKv6+gK5fnE=;
 b=hIEpDHZQJTr1nN5X+qBvvlsqz5gFhQEt4wtSsZwd6OtoUwWAbu8DLyNnEtFxj8rAPK
 I4CScxlfWIc1u1zN6qIz/SOZ+C1uXsrgDlby7xAvXr0kFC1HJwtnChj//u8tX3YWgqA9
 wntQwk8VBxxjU8k4YoVM614OWyt6QqRI7La7YX95JtOn2pLflIzLxMzUt4Zk5SVPdokw
 bjzZs2Al7d08Y+hWegUbXOYGYlsp9fYr0+YTI+/AtO2nXP4/PD6uuCZccmMGSGCiv2Lz
 D9iZVefuPoP7Y8Xpw2ac9BUyY/S2YEa0mFGrooqgAaakmx+W/OUMOfVP2kwPIZkOepym
 nD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNvU9z65691m9PWY2OvQX5jqP+5ASM9qcKv6+gK5fnE=;
 b=YZhPJGmhhtNHl5UHgjfXnvWer981ENKpGY3yv46gKGk24FLzYbBWi8HotiyoxrNjK4
 Wws9oj+I04sAD72litBbRpA3g243WzcSiIZA7SLxSf+m/aiV1IqnLQ9WiGvjbyA1ZlIa
 m6s0Zwn7i16uLErscBBUYoUgQk7IZhsimKFHVffTfioxPHuDIWLqtiwcjnKjwMy0T/UG
 63KSdJLzUG5eMU6T/zpdpaYya/6XPDQdjh5NXuSWmCfbvdOY/8NFbgWgR7sYfl3whpU6
 qZZRi6P4SlNCihFgAgjODUB4Fnq7ROA81GyLlI87GZx74xoDY3unDPoVvQ3VHseo878q
 /tBg==
X-Gm-Message-State: AOAM533v/0WxH8b9y/hWKLQbHHEq0jrmv8aZdIyPajrzqzOwbtzNcgTa
 wkPd8stdfuDj7gnzprfcdYy/0A==
X-Google-Smtp-Source: ABdhPJxn1F+s2S4RgE3BHcpZWjQophKA9K7E0RSGzX7uOTmwejH22sNmXO2NuTGC5MUf0O60QTHW1Q==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr17668999wrp.182.1623085125395; 
 Mon, 07 Jun 2021 09:58:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 27/55] target/arm: Implement MVE VHADD, VHSUB
Date: Mon,  7 Jun 2021 17:57:53 +0100
Message-Id: <20210607165821.9892-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Implement MVE VHADD and VHSUB insns, which perform an addition
or subtraction and then halve the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 48 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index bfe2057592f..7b22990c3ba 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -118,3 +118,17 @@ DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 087d3db2a31..241d1c44c19 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -96,6 +96,11 @@ VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 
+VHADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f026a9969d6..5982f6bf5eb 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -415,3 +415,28 @@ DO_2OP_U(vminu, DO_MIN)
 
 DO_2OP_S(vabds, DO_ABD)
 DO_2OP_U(vabdu, DO_ABD)
+
+static inline uint32_t do_vhadd_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n + m) >> 1;
+}
+
+static inline int32_t do_vhadd_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n + m) >> 1;
+}
+
+static inline uint32_t do_vhsub_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n - m) >> 1;
+}
+
+static inline int32_t do_vhsub_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n - m) >> 1;
+}
+
+DO_2OP_S(vhadds, do_vhadd_s)
+DO_2OP_U(vhaddu, do_vhadd_u)
+DO_2OP_S(vhsubs, do_vhsub_s)
+DO_2OP_U(vhsubu, do_vhsub_u)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a732612a86f..c22b739f36e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -389,3 +389,7 @@ DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
+DO_2OP(VHADD_S, vhadds)
+DO_2OP(VHADD_U, vhaddu)
+DO_2OP(VHSUB_S, vhsubs)
+DO_2OP(VHSUB_U, vhsubu)
-- 
2.20.1


