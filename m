Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE376F511C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:20:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6do-0004Ny-Ih; Wed, 03 May 2023 03:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dP-0002vg-7P
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00073z-6P
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so47445575e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=YfptR6pqg1Vnv0yQUAJz8GXu0u9C5ZCRaGoqgRok2t9NXbAF3kw1MsI8r3SZYdp+py
 Y8FdFW6U81nJnORVVXzt9vtDJw2X0ujdKHvgpuFc4Ng1kP5lFFfiW4fRJi5tzv1fUR48
 RljohxYQ/KiOfi9FP/o5Jrx/SBLlxSUJBg59TAwHPuDJzikfeEQ/aG5yFWaCvHsfl8Fj
 kaDfx23Z6erdRu6WlBKZEQ00w7SMk+LjzTIR2Ljq14siaaVUqwuT6HyGHbw2UhkhUzX2
 1OuDXyBvzWf1pvM/pP8PLZFEx5TLVoLiRljiF2cGh/B+DuijPyq+D6xTnTSd72ymJADB
 bZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=HlrzqRZuLHbS+UrmMaE2+qGEJrm3/acMnQd7jfAgQ2/Hvy1Z56wdd3qlqYgHh/xT19
 NlDqm2S1e/zQ/S1S7t1LIU7AkcZRR4/+lnZhINFBN/8adpsWPi2Sz0kdauyYI6+yA2Uo
 W0g+5gH8+49B5LEFL3plP54g8CN7R7hX616H/HnozR38NhFh22IlpBFmsJhxsDmE2dst
 FQ84vnibpXmbsRMZwIQRPMBb4tCCog2Cse3JYN5ZErqHn+B2shYzZiHJIhQa8S22TK1s
 nSr1+VZvh53D+uBM3Oo3qRqIqoy/SlUcZpxP5w/DF6gS7LN9ulGssb6UIaZvgvIFHlNv
 w1eA==
X-Gm-Message-State: AC+VfDwYWHW8oFMAvDeXVyai2j/H+6ZO4v/qfuB32/JVBp/dBZXhMj3L
 wWmyafoyvA741rrUH7WM0f6cSGZsl4rBInYG6LJ6ag==
X-Google-Smtp-Source: ACHHUZ5qNJU2BSEfePKltRoqUnOM2g+JcKHFrL3UVx+lyra9ws4XAwr6tf+26SSzb6SduEnXRtEu7A==
X-Received: by 2002:a7b:c047:0:b0:3f1:979f:a734 with SMTP id
 u7-20020a7bc047000000b003f1979fa734mr13807508wmc.11.1683097832611; 
 Wed, 03 May 2023 00:10:32 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 46/57] tcg/loongarch64: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:45 +0100
Message-Id: <20230503070656.1746170-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 62bf823084..43341524f2 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -826,6 +826,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -845,7 +847,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_u;
+
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    h->align = a_bits;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1


