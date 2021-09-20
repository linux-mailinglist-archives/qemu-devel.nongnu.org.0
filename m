Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5B41174A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:41:49 +0200 (CEST)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKUO-0001if-PI
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9h-0002qw-EB
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9O-0000uX-Hx
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so30210790wrb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IYTuTy1z8od491vteL45y70A6sopdVxmGY6Lvgtyg1I=;
 b=AaXUWTnYbrprrwB7ZscpNqyYHLZXt1KaXND+1IiNuwiclXC246xm4mwEx5693RutlI
 qif5Pk5C3QRcNXQKsZm0rdw0TZEsGj9xTaLpn4f/iMfYl6iA6x885WzCaDAySrSgsM6h
 CrHtcn87WQdGR7kS3//eWzcpkM1wR757eqSsW+S0NHf+RrMv/Why1EyazA03OeEkdz7K
 FnIVUMQrtrOd9Nl6NLsQaQaXjha3kTmL5aeSrpIL5BpFqWZf9Z/RTctlNqP8RCo4jehl
 5LlCZY7E4cChDlAeeqrkUW06mivQ1RYpA/ZScwYug8i9xLxLu4ffh9RcprruxavQIg3N
 ArlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYTuTy1z8od491vteL45y70A6sopdVxmGY6Lvgtyg1I=;
 b=D8BalWDEgnYUpP/b6XBivcyNtS0VZYIZfHNZDC04B0RDiaQ5Nde6ru/wXMvYCIJ7jd
 c7znXiwc3zxRkjVdiyUuiM5w5aUKIfWNFpah5oBj+mAMlLmao0WmpTA5lp1XXVPH+lcv
 Zbf/7xcC6AWo3QTqF/bGko//pO4+mXmd9Wobwgvh/muiVNGzfYkiIt4K6mz7dnL75bDy
 C3+s1ElFCySiFOKylgoGimq3rrP5oyZdxjtMA+Tsay6tOUqFr08HHLpwSEzBy89D7xVs
 zmCDYOk/R3Y+rlDTscBLAAyajPtG+40JtX0HXerf1rJIfK2k+UVER87JQ5tlP49ZbMlL
 7BUA==
X-Gm-Message-State: AOAM531gv4YIlDNiH2B22ECw0EWoKdyvfbbtPi1+tS+bbCwA6IoKPeSX
 bMJhp49waQ5Pt4ROY/ZnRTEvg4B2RWkyHQ==
X-Google-Smtp-Source: ABdhPJz0cJJ/Ilbwiz+yue8Rq7kdsTwZiJtrmswISigClNFdeOYV6Lzb04jo5CIRHME/kOmtbWJUgg==
X-Received: by 2002:a05:6000:11d1:: with SMTP id
 i17mr29087884wrx.424.1632147604657; 
 Mon, 20 Sep 2021 07:20:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/27] target/arm: Optimize MVE arithmetic ops
Date: Mon, 20 Sep 2021 15:19:40 +0100
Message-Id: <20210920141947.5537-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Optimize MVE arithmetic ops when we have a TCG
vector operation we can use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-6-peter.maydell@linaro.org
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


