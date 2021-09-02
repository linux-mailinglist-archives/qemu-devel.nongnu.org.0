Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E533FEFF5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:17:06 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoSf-0001bl-JB
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL9-0000WO-2R
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL6-0003QQ-PR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:09:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i6so3485752wrv.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zzmLZYqNkL0qfTbdS2xsSiJj4fXt0+iIGVR8nAz1VxA=;
 b=OXsDlD8uEnyvc9weEuttBAmWjGT9tUr7KFFDKESQ8eEGUTNqKlhGaqAACkWg4Zgtx2
 x4kQ+TesPuE5rT/0vk/Khz+50Aatzk9Dhm8jqOOXmxICrFJIUDIjPR4K3PMhjWBKEJQi
 ivFppqa/vuDAI4JYzNaMErmaeSMfcUUpkK8Rl0G6cRhzAn/acTgEs8IRw/IqekP8wuXk
 fzJulKY11ekwuBUDoWG07/sv9HMuv46NmAUXF8d0NbsZZPjuYzHa39TSz3B2RADylB4z
 0E8F/s4QbzMwRvvf2gpWWmwKied9KekZQG+wS32/DJl3MA7r0K1VXvFrKEKAVB6opXZA
 jiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zzmLZYqNkL0qfTbdS2xsSiJj4fXt0+iIGVR8nAz1VxA=;
 b=it744Q0tt2I7MPWaXhGOjEXK97UBhdV3Oa2wNCXEwL06meJ7Xd2nbdGwgdnj8XfLSj
 RD8ZiDO94SgHZhaPjNyf6D0vxYofRofh+isLRxF0gNMJ+SWU9lonekPiZbr8awo3xl9+
 UweqQARE5Rngqj6COMxUbxggbSBzoefn47d5c4EvvyVQhglGu6Eiqo6BQXHxr3wQpQez
 d+UigmaoOBeaIhzJE41wxeQSbReaZcRVN7IFIqCyxnst9eg4oZzLE5zVfsoSpJgNc4c9
 veHCLDDYGqrQjqEFdA4+Jf4/ZQKbMeKmFPi9gHfAo4P+pQx8Mju5QJBrWXZGbmJ5VIMs
 HZHw==
X-Gm-Message-State: AOAM532e67DXXuV9+rUplw6WTRI4TxlDkblndyMoboxDs7FRgmj5fAUL
 9xrCAp80MQSkAHB8f6WfbcpioA==
X-Google-Smtp-Source: ABdhPJxekN3GJEzFeAygb1vYAGYrCcIMIxQAwMCwMg0EJGLd5qMiKi+oUvpNZ/iF4K1r395i74Sekw==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr4269020wre.39.1630595355226;
 Thu, 02 Sep 2021 08:09:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/arm: Optimize MVE arithmetic ops
Date: Thu,  2 Sep 2021 16:09:09 +0100
Message-Id: <20210902150910.15748-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize MVE arithmetic ops when we have a TCG
vector operation we can use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 087d60f0d81..5bc5a3a2063 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -827,7 +827,7 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
     return do_2op(s, a, gen_helper_mve_vpsel);
 }
 
-#define DO_2OP(INSN, FN) \
+#define DO_2OP_VEC(INSN, FN, VECFN)                             \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
         static MVEGenTwoOpFn * const fns[] = {                  \
@@ -836,20 +836,22 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
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


