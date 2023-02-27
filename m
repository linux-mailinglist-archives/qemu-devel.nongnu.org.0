Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5D6A3C35
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWNT-0004LE-Tw; Mon, 27 Feb 2023 00:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMn-0001iC-TU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:06 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMl-000722-TO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:05 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so5090591pjz.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8mjVuFnltiR4gPcGk7IGFaBrcNbVkEA2sWMEG5RD9U=;
 b=YcnU6I+ImOLwQgIL1fAnp7CH3borVZyEibXRpPED2mkEVR5rk3vJUKFHywXb9QKey0
 QIjnlo+7n+hTsDYr54exaQ7NRpSBRL2yri/rUgYtiFxllJEaAP8hsUVuM/hdA8oGWnJq
 unTe3sm+sxEG82Qi/O9a6EnyucrvfwojVOPxVH+JsEjBqXk732rbXXrAYGR0zVz7qkCA
 k/TA0235LZbYRHpeqcjnkrp6EeWEle5v8NywVdKZx62s8tM4dRZbcHM7Oa7doWhVb8w1
 E3v6v9FDU5DNagEkQGMI4cOZMhVs5ZzGqNa9kc2IG06ztJ1VqdJkozdSVAyPhA+hQAwU
 5h8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8mjVuFnltiR4gPcGk7IGFaBrcNbVkEA2sWMEG5RD9U=;
 b=Z9yjC77juCL/xBYmABU5baH7SY4i+ssiQB8X1AadtY+uCCHOIPp2uL6BrfLXrIA+Sx
 ffG20n3Em1bo7wHaiPGnzjyzq10WqN9PFwgQX4x6UCQXRtljZBDUyQUacK74QqxLEEX+
 WowjjLUGwXLFZ8WrMQ5c7Lp6qScVLAO9bcwzAnp9CkuFNmuVebs2YxC5w4PGMM00lLOc
 OGt/gzHrJPYDV+tmq7FoC0jiKelxK/ELZX1oz73JNGzWB99M67Vuy/zySn2kF+MXRAwK
 hseibzgQR9XGVMRDTyQ7Luu8WzD3eHus5/WpnOzbltKtZ1lLy7YeH34stxGNwbp9SOMg
 5Wnw==
X-Gm-Message-State: AO0yUKU60K0QMkG+iCbVYeQ5V5WyV1Zz6TrOTJyIfndX6ubXPP8s1M4H
 uxi6ZB6BA6JFh/kRRIN1A5uhAFZrQRzFTsfbCXE=
X-Google-Smtp-Source: AK7set+ixGNm3eRV6IXMPQ8wd1CzCohGhOaWnyGWRRElhfF/j6U1oki48niv5n+cd86zEyJebQ5fiQ==
X-Received: by 2002:a17:902:7687:b0:19c:f005:92d0 with SMTP id
 m7-20020a170902768700b0019cf00592d0mr5724458pll.25.1677476882335; 
 Sun, 26 Feb 2023 21:48:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 52/70] target/sh4: Avoid tcg_const_i32 for TAS.B
Date: Sun, 26 Feb 2023 19:42:15 -1000
Message-Id: <20230227054233.390271-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since we're assigning to cpu_sr_t in the end,
use that as the intermediate temp as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index ad6de41712..70a45c26e8 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1610,12 +1610,9 @@ static void _decode_opc(DisasContext * ctx)
 	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 16);
 	return;
     case 0x401b:		/* tas.b @Rn */
-        {
-            TCGv val = tcg_const_i32(0x80);
-            tcg_gen_atomic_fetch_or_i32(val, REG(B11_8), val,
-                                        ctx->memidx, MO_UB);
-            tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-        }
+        tcg_gen_atomic_fetch_or_i32(cpu_sr_t, REG(B11_8),
+                                    tcg_constant_i32(0x80), ctx->memidx, MO_UB);
+        tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, cpu_sr_t, 0);
         return;
     case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
 	CHECK_FPU_ENABLED
-- 
2.34.1


