Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C213AF109
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:54:22 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNBl-0005tC-Pi
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnO-0007K5-27
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:10 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnH-0007dh-SN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:09 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so396140wml.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y2QzG7+cF5G/TgmouHXzoRPEdvv/MpulqcnZ7sVXbFM=;
 b=Jg9sykG4681PmTq3jg5Pg+XtQo1DC+DD5hhOZDsXEOq6n8wC61TPteWhUB37W+PGjj
 OUGj2zW3iuJMDTkWUj4uMnY60rAe0P5YDkbcyyivxd35IPleQ24Moi8KDx6aHqB4jPUr
 DhKODliKzOCuoqU3/0HzLvqpNKDyxt1libdcKDPGykrZtAJ5SW7337QPBRN59u0JNhAK
 iaTqIezuSGbV90odonKoSTWpUewQOaPsYZKPL7XrVQgXync15b3MTzcS2KQkWswxyV3r
 aAHU5sT53XjqoGAb0PzL6zfwqm0xKUY+IWQVHEfdSmulLcyH1RzxPi/KBRUpXn7Ky6H0
 hP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2QzG7+cF5G/TgmouHXzoRPEdvv/MpulqcnZ7sVXbFM=;
 b=XuqxRMcnWqS3s3Y9MxvwvxkWR16P3U9f/+a8F+LfDYT06SqcrY2z9cALUZDWXJ8YM3
 ETf4W92otUCUYuVPdHcglspQjIBvDXGTblsPDRYXEANhu/uL/wUSnuG78PTknlWxXwJe
 ePVFQXgfKtnPWLAHgdBNDJ8oz/WvmGHGoV8W3XSLudu4KpniX7bj5QwS6exSzcYvXKgA
 Isd4+ruMDsAKz7b3B7b7GXMMg2V+C3kLvNbdrzGUBVG55e4ft9HI2sNPeDp8Fslhd4Rq
 uB5uWD60kgB0r5YeDwk9uCuptxO2vVQWrgwSW2YYd9UzdYkVydBFENj4zLW8wrGNBR58
 itVQ==
X-Gm-Message-State: AOAM531H1/0LCX9s+o8egFvNM3qpYeXwc07FcCXrs3rLIYeekDax653A
 4r4YvkoL9Hn+1rDje4TVlbRS4l4DCP7GizIz
X-Google-Smtp-Source: ABdhPJwgs8aM2zZDenzJyZXrtRVjwkM/qICiwaD6ZPcdWAoIF84UT6hhOsXSNWyVIQqBylAMmAfMlw==
X-Received: by 2002:a1c:1dd3:: with SMTP id d202mr20119646wmd.10.1624292941907; 
 Mon, 21 Jun 2021 09:29:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/57] target/arm: Implement MVE VHADD, VHSUB
Date: Mon, 21 Jun 2021 17:28:04 +0100
Message-Id: <20210621162833.32535-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Implement MVE VHADD and VHSUB insns, which perform an addition
or subtraction and then halve the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-18-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 48 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5cd4e7d736d..02bef53ed41 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -116,3 +116,17 @@ DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 63eacd7349b..835832fdf69 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -429,3 +429,28 @@ DO_2OP_U(vminu, DO_MIN)
 
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
index 041fd1ef14f..f593d3693b9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -357,3 +357,7 @@ DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
+DO_2OP(VHADD_S, vhadds)
+DO_2OP(VHADD_U, vhaddu)
+DO_2OP(VHSUB_S, vhsubs)
+DO_2OP(VHSUB_U, vhsubu)
-- 
2.20.1


