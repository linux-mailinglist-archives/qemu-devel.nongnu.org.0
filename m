Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7A83C1E9F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:49:43 +0200 (CEST)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iSM-0000oQ-Pv
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5q-0006Da-HS
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:27 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5d-0001UF-R6
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:26 -0400
Received: by mail-pg1-x52a.google.com with SMTP id u14so8667184pga.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xyZhbP2MZlS3npwt40wzKePMMUn3bMJXYN7FzSUZsjk=;
 b=cZteOHr+bvPu/BxKx1Yk14ZXKUUEiXfbuvgagIwzZ9hqoav5CX5zg7dThcmBGo36tf
 V20b0E/3qVpsIb0PrhtAxJnzcrYm24F7bDiwPfIYkoh7rODqcfwp4Bs+ONUVAt3uw00W
 JB4msXKUVQbaFtbBArQq4j4NjoZOTjemXN9CccCD+qz72qbuzonqiiyFXSGaGeYXteig
 8EQOtQeyN/xtYCApsHPxngKXIGfSr/vCEkPgca+hxtB9qV0s7bnIgAcT8leosXEf9GFX
 THVMrpVT94ECvUpucLU0Y6dvoO1OW2BmkQzbpNBwjBr07ye1cmKDXK6rcpjT+RTpPbij
 oHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyZhbP2MZlS3npwt40wzKePMMUn3bMJXYN7FzSUZsjk=;
 b=Qmuu752zNnnR/FDjIhMEWrUz3h+ULf5wfi6LuI+4FnkeOxhvyf3Qj2i3qbwSZEbiBL
 KRLkP0eC8EjVZ5XnhpLF66kDBrlO4exiK4bxnEyEm2PMjWEryWW9ePjcRtsniqwclpqZ
 KJkqmmWbSG5CYA+m+ORcfEO53Z/8xwhChwGRs8CWTl+TaYRl2M1ew1vFalsCzZUjbST0
 bGHmCS9GMZqQiw4JrcR04EbeZpn+7SNEuwNYgytOY+SfeV+AepRPOw8elgt+BNVVBt3J
 G+jjw1DTDRz4ZjEHa5O52RJjbPbqMiwXYOANK4CidMfr+PjXdR2/k4LFSYxhN2v8aYFs
 H6yA==
X-Gm-Message-State: AOAM531HpuOuudBU8BzyGw3dsmtmG6b6RzU7dC3Xe1Rz2BOKHQ5meHRo
 vrMICieueZyPJxU+PKViQU2O9Q/QYW+VFg==
X-Google-Smtp-Source: ABdhPJwE+++LQq8kETIRo/S+wMDzqQngOYswS9vOYavj5G11r0CbtTYSwUD3CJodlOiF4XshlZhOIg==
X-Received: by 2002:a63:6586:: with SMTP id z128mr8861382pgb.446.1625804772713; 
 Thu, 08 Jul 2021 21:26:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] target/riscv: Use gpr_{src,
 dst} and tcg_constant_tl in gen_grevi
Date: Thu,  8 Jul 2021 21:25:56 -0700
Message-Id: <20210709042608.883256-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7dedfd548b..6ad40e43b0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -620,23 +620,16 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
 
 static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
 {
-    TCGv source1 = tcg_temp_new();
-    TCGv source2;
-
-    gen_get_gpr(source1, a->rs1);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
 
     if (a->shamt == (TARGET_LONG_BITS - 8)) {
         /* rev8, byte swaps */
-        tcg_gen_bswap_tl(source1, source1);
+        tcg_gen_bswap_tl(dest, src1);
     } else {
-        source2 = tcg_temp_new();
-        tcg_gen_movi_tl(source2, a->shamt);
-        gen_helper_grev(source1, source1, source2);
-        tcg_temp_free(source2);
+        TCGv src2 = tcg_constant_tl(a->shamt);
+        gen_helper_grev(dest, src1, src2);
     }
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
     return true;
 }
 
-- 
2.25.1


