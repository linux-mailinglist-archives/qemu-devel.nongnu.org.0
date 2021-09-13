Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4946C4088C9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:09:05 +0200 (CEST)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPitc-0001N7-1F
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifv-0007R5-4r
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifn-0001sg-OM
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:54 -0400
Received: by mail-wr1-x432.google.com with SMTP id d6so13665355wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zir4X0mMBHe1fXRJ/2xzGzZwDp6YizXAS8FXTu1+ZDc=;
 b=BRfK0I+Rujz3EMKYKGnthHaUPJYBEEMMO+rHWn+0FPQfFOVQgOZt9P1dLDnb9rMdy7
 U9hmaA08tcXshFCs1jCqOcmSshByZdzMPRFv1e1+hw3STCD9W/qJgz1m/fmYGWSjsbtj
 CD+/+tjKJnSl9fMLfgT2pWsA9vBk88YoQNvLEf3xY29JxOA9GivqVlFVkYTp3r4UVOe+
 FQ1ZGY9FLQ0du5TsfW0ZwPslnBT/ChGnhTPNVHS5mnQfiM5zX9PDdIjPF0qrNDMBSMOU
 Ci06oXTGHWLqEgPYXlAGkChfCfhLpTScUbsKjuST3JloR+MJsXYiPaV18Nl3Nt+GOsSw
 vuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zir4X0mMBHe1fXRJ/2xzGzZwDp6YizXAS8FXTu1+ZDc=;
 b=oexpYISn/qQJQBdwgfbEDgfFdf/PuanXBm09FCQFguGgsB7nbpBxzOQGHEx9KbUxd+
 TRrMC4B1JGhjU2nC6fG+IV6vfjb8N9dsweSea97hRtVgt5dJ9RNRozrvFoec6EAGdx3W
 ybTrlNKB9+vxnR26XTFmXCVn1m7omK0vVeziF+qkvbi9utXo0d/wi8mbygaGgTDyZdjl
 Cs8CIVjbCucWPD4RAANHRGGWWj5NddD49fChz+pr78YkQ3SlNP4VkqWSpfohPhJWQbvp
 oAIEg4mod0S4a/KHYR4WUbleeBdqHbgrV3U2ocfXhB76uLJcxoyAz00eIthChyfrfOXG
 jZfA==
X-Gm-Message-State: AOAM532+AfYn9vQDZlRzcw9jtW29DNi87nGBJJrvRN4XH/gqeQHiN2sK
 E2C1byOnnNxnyN/EoxKUIfVg+A==
X-Google-Smtp-Source: ABdhPJwCYBmMBrhTpCdXuUtw2uuViXVBUxCuYbKCzhzKR68HBO7tqx7r1dvsCB/qR1RjgfwhSJppgg==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr11482628wrq.3.1631526886276; 
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] target/arm: Optimize MVE arithmetic ops
Date: Mon, 13 Sep 2021 10:54:33 +0100
Message-Id: <20210913095440.13462-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize MVE arithmetic ops when we have a TCG
vector operation we can use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 77b9f0db334..255cb860fec 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -838,7 +838,7 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
     return do_2op(s, a, gen_helper_mve_vpsel);
 }
 
-#define DO_2OP(INSN, FN) \
+#define DO_2OP_VEC(INSN, FN, VECFN)                             \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
         static MVEGenTwoOpFn * const fns[] = {                  \
@@ -847,20 +847,22 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
             gen_helper_mve_##FN##w,                             \
             NULL,                                               \
         };                                                      \
-        return do_2op(s, a, fns[a->size]);                      \
+        return do_2op_vec(s, a, fns[a->size], VECFN);           \
     }
 
-DO_2OP(VADD, vadd)
-DO_2OP(VSUB, vsub)
-DO_2OP(VMUL, vmul)
+#define DO_2OP(INSN, FN) DO_2OP_VEC(INSN, FN, NULL)
+
+DO_2OP_VEC(VADD, vadd, tcg_gen_gvec_add)
+DO_2OP_VEC(VSUB, vsub, tcg_gen_gvec_sub)
+DO_2OP_VEC(VMUL, vmul, tcg_gen_gvec_mul)
 DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
 DO_2OP(VRMULH_S, vrmulhs)
 DO_2OP(VRMULH_U, vrmulhu)
-DO_2OP(VMAX_S, vmaxs)
-DO_2OP(VMAX_U, vmaxu)
-DO_2OP(VMIN_S, vmins)
-DO_2OP(VMIN_U, vminu)
+DO_2OP_VEC(VMAX_S, vmaxs, tcg_gen_gvec_smax)
+DO_2OP_VEC(VMAX_U, vmaxu, tcg_gen_gvec_umax)
+DO_2OP_VEC(VMIN_S, vmins, tcg_gen_gvec_smin)
+DO_2OP_VEC(VMIN_U, vminu, tcg_gen_gvec_umin)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
 DO_2OP(VHADD_S, vhadds)
-- 
2.20.1


