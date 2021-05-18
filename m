Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4DE387A1F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:39:22 +0200 (CEST)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizwP-0007Sp-3m
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1lizpk-00059V-N6; Tue, 18 May 2021 09:32:28 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1lizph-000176-Ps; Tue, 18 May 2021 09:32:28 -0400
Received: by mail-ej1-x62b.google.com with SMTP id et19so7520526ejc.4;
 Tue, 18 May 2021 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlCVKPY+Ve7GEJXcoRp8LiFCpUrJNFZgU6BEw8KGFUg=;
 b=sTz6XE6L2QyBBpWnNlFO2yhHeZwJcEQjNZdNJpqugcmf6ZWRZ4MArbhNtldqM/uGtK
 76y4FTeo6yMtDtbbLyj1d0fpf4gjrQe1GiVQXdZGkZ8p9Isc6r6kR2dZ7gMTCrFsWcNi
 +SpuDn6W2rLewu3FJApZTjWsOKNXItPHSvw9uZoc+cJkk66PtavycD7cuK5PXCulrM5C
 eFDZK8PC3ZcP2CUEDXenDSIV/Bfy8T2Q5DR7XnYBYoEjXVzINjPR+DATcp4DMuaPtlgM
 HJq/yVBfmiHTaLv5l5YX+DV3Jg47vf+CHG586Rwr6Pl6KeHP6tiXU34yXwaSQm/uEIgq
 hSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlCVKPY+Ve7GEJXcoRp8LiFCpUrJNFZgU6BEw8KGFUg=;
 b=AzrEOOvSHsd8+X7TBnxWM1oBZ1KrDfvfd61jmktmH1uNILRNSGlxTxUWSBf35ZhAaX
 2s/a5BqPojuUKzG2s/Jxau4Br4++LPX8462YnSjlj52ynLVFlOYJqc2Go/PHTJoqlZXi
 NsFMlpj/hpcKJmkVqJA4t/9poX39YM8TzJyhpxkeAumEZs6YaFoJG038JWKbzBFa+QtI
 b54mFFD/3ih4AzljB6J1n3eEzcSTdII0wlWbjBlL2V0kSQ2qsKCRHZlAgeiai5/9kvES
 xkn+5KmrVHaytKDK5QMSVxhkeYEri+nkJk0xbzFRMliazDTXJ6usFHDI5OuehsV/2WDI
 BvLw==
X-Gm-Message-State: AOAM532NdKBKsM2nigukMwxhtSO9oEmWdwQzDTBx8UhuKEwURx2fVMz+
 L9xnIUvWgJ+eXAJ/2HCAu0dWamxUrevK6A==
X-Google-Smtp-Source: ABdhPJytjXGxmebCX4torY/Tj/mJ484icisLzmIKfgjVRbUQaIN0He6ohH7ksUYGpmhtkMF6ThkU8Q==
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr6146146ejf.25.1621344743299; 
 Tue, 18 May 2021 06:32:23 -0700 (PDT)
Received: from localhost.localdomain ([151.60.43.39])
 by smtp.gmail.com with ESMTPSA id gn36sm10051562ejc.23.2021.05.18.06.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 06:32:22 -0700 (PDT)
From: Giuseppe Musacchio <thatlemon@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/ppc: Fix load endianness for lxvwsx/lxvdsx
Date: Tue, 18 May 2021 15:30:20 +0200
Message-Id: <20210518133020.58927-1-thatlemon@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=thatlemon@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-stable@nongnu.org, qemu-ppc@nongnu.org, pc@us.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
runtime-configurable parameter.

Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
Fixes: afae37d98ae991c0792c867dbd9f32f988044318
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 target/ppc/translate/vsx-impl.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b817d31260..57a7f73bba 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -139,7 +139,7 @@ static void gen_lxvwsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
+    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, DEF_MEMOP(MO_UL));
     tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
@@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
     gen_addr_reg_index(ctx, EA);
 
     data = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
+    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, DEF_MEMOP(MO_Q));
     tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
 
     tcg_temp_free(EA);
-- 
2.30.2


