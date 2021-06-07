Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE79939E4FF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:11:10 +0200 (CEST)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqImL-0008Vr-OO
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaS-0007Uc-D3
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaC-0007w8-OI
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id d184so130381wmd.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dsfWk4RgZnVdekDcntrGGEvaZTH7s3WlSeioagute4g=;
 b=cK86Jo3xRhQT6CF8lT4IxxG60z5N5laORThXccw+US46zbH/nItWq3NTCYjrI6M6eI
 2GPJDFhx3C+MtzVAXlwHLJMYATwRq0ho0u1PE9IuVj1FQfucwHV6JRX9xzCAPUvnEeNS
 CY7pDxgFtTRhepiB3LRSL5hmdXE0Or0Da1lHuIfwf6D6NWA0yf/jKV5PHQoWWjf5p3/4
 98C0/QYakgAu/AaxDF5WabV84Oq9F1QOH9WqVTHEr+Q8xTIJwB3JywLnk82JqVuizrgR
 tz2J8kDipsauNJZbkjLH05xriY9m8E+cYAj2WxF7qRRIXobOqMm+4Gc1uq7L0vaGc8Qf
 RUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dsfWk4RgZnVdekDcntrGGEvaZTH7s3WlSeioagute4g=;
 b=JqoQb2LnP/NKQofZGA/pfyGiood1GTDdY6XihuL3/6lDbC+wT4fUqY4JDzP0zIxyil
 Od5ToGQho0p7aQxjWWsbO1tJp3O5mx9ic3tP2yej2uVXZ6p4SSVHRafpg/MiCExh2ef8
 5BA96x1LC8vY1BH0jdBrQx2THo3uX1LKkDXoohOFFvZJaULVa0nkrFaBc30eoB3CbTUQ
 +dn2Zpj4tSdd8BP2t0VqDLugCVpfiUwkn8QeuESMgfTDsW2NLt9KXJe5SvolqGSPBM7b
 AveLVCukqLsdfR3SWbaoXLhV4zCYypIMncf7JFISURTq9SsnHGyp7gjNSCSwIbieoDHP
 Mf0A==
X-Gm-Message-State: AOAM532XDX7qRJcc/ssixY18SW8QjI1PucabYYMtbY+O6FGBkUB18KFv
 YwlVQ2ETPc2Az62CEzYaDIL2zQ==
X-Google-Smtp-Source: ABdhPJxH/WoqyrlA+wFfQXwMcRL5BElpHEOdpPCmgdxBZnO/HMahrNpbnV2DLxfg4Yca4pH4uTyJMg==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id g8mr93120wmq.62.1623085115455; 
 Mon, 07 Jun 2021 09:58:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/55] target/arm: Implement MVE VCLS
Date: Mon,  7 Jun 2021 17:57:40 +0100
Message-Id: <20210607165821.9892-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the MVE VCLS insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 4 ++++
 target/arm/mve.decode      | 1 +
 target/arm/mve_helper.c    | 7 +++++++
 target/arm/translate-mve.c | 1 +
 4 files changed, 13 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c5c1315b161..bdd6675ea14 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,10 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vclsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 24999bf703e..adceef91597 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -68,4 +68,5 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
 
 # Vector miscellaneous
 
+VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
 VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b7c44f57c09..071c9070593 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -238,6 +238,13 @@ static uint32_t mask_to_bytemask4(uint16_t mask)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_CLS_B(N)   (clrsb32(N) - 24)
+#define DO_CLS_H(N)   (clrsb32(N) - 16)
+
+DO_1OP(vclsb, 1, int8_t, H1, DO_CLS_B)
+DO_1OP(vclsh, 2, int16_t, H2, DO_CLS_H)
+DO_1OP(vclsw, 4, int32_t, H4, clrsb32)
+
 #define DO_CLZ_B(N)   (clz32(N) - 24)
 #define DO_CLZ_H(N)   (clz32(N) - 16)
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6bbc2df35c1..3c6897548a2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -210,3 +210,4 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
     }
 
 DO_1OP(VCLZ, vclz)
+DO_1OP(VCLS, vcls)
-- 
2.20.1


