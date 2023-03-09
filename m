Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C46B2E92
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMe9-0001FU-V4; Thu, 09 Mar 2023 15:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdm-0000a6-Uo
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:32 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdj-0002Ju-PY
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:30 -0500
Received: by mail-pl1-x62d.google.com with SMTP id v11so3211085plz.8
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyxL9T8UjZxQ4CAYfGW8p+3sQmOt2OC3gGYPJjY7kcM=;
 b=Vnb1ujKHwPHDy8aCYrARkJmy99yUlNxEDDJw8mLaAs6KIbxDEdZowhJhh+yA19VXqw
 +FWf1tr8LICbUt5vADIFB2csycD1EnlFwmU7mSDJZJcixI7ICP9aBsrQIN5CNbMhOWaF
 XkUOyOVh59Ss+p2XrmhIcVx+AgoKryJrL+9zs+VNLvrwol52ethnqCsv+azgJDCf7okK
 9pNlDKllABsn5lKaF2vr11FGObRIVIZUw2x+xOJigfe0j4eMIBf7KyehE/Key4GtuWEx
 +MEcz6a9QPGCzL5jnDosoGbX3DepukFSt8iPbdcaFg8T5QcJ19djZAHTVAWbtgWd1rv/
 VzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyxL9T8UjZxQ4CAYfGW8p+3sQmOt2OC3gGYPJjY7kcM=;
 b=HEHYZ76z5dMwXAv30PXTtg9VwjqEeQHjdY72cCcK81iYTWN76uu5EYQc8WPpmgg1k/
 QsMlFT4IFCRyBVsSCu9G7slcE0vHidbcD0vKXxgO4hm1sPpIp0om9cuu3qcSuepJugjv
 BfgtFkF2a1QfCAFEqPrwCIyPK0xqEuRqn1ROaJzSJeZAsGM7NAq8p5jneV5y4HUM6wQD
 3HxHy0FXxU7WvDjoXHAd5TLI9AgUSFY3drKl7z/VIMNYdX0zxF0tl0nlIYjiYEXLqXQo
 5mqjbw6MV0VSRwyWqUuz246Sq2a1WltwSV2F2wna6io3xpI0NL3+5TaGc3fuw1sz9ran
 pHGQ==
X-Gm-Message-State: AO0yUKUcEq3eXV93IQohSic0OqIZyceOw4BIUTDbsaQWBTJZZJT5MptU
 +uVGOIPO8L4UL7pKtpqytDa2chi090ZZxc0/hVQ=
X-Google-Smtp-Source: AK7set8iBxTlxp2Xo/j1V+/tvj3du6BLVLoFxYGgLUXqzTjy+pcc8eX+AGFO+Df8XjCDq8hJ7ASuWA==
X-Received: by 2002:a05:6a20:66a6:b0:cb:95fb:84d with SMTP id
 o38-20020a056a2066a600b000cb95fb084dmr20568948pzh.5.1678392801782; 
 Thu, 09 Mar 2023 12:13:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 91/91] tcg: Drop tcg_const_*
Date: Thu,  9 Mar 2023 12:05:50 -0800
Message-Id: <20230309200550.3878088-92-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These functions are no longer used.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ----
 include/tcg/tcg.h    |  6 ------
 tcg/tcg.c            | 16 ----------------
 3 files changed, 26 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 70856147c5..dff17c7072 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1089,9 +1089,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_extract_tl tcg_gen_extract_i64
 #define tcg_gen_sextract_tl tcg_gen_sextract_i64
 #define tcg_gen_extract2_tl tcg_gen_extract2_i64
-#define tcg_const_tl tcg_const_i64
 #define tcg_constant_tl tcg_constant_i64
-#define tcg_const_local_tl tcg_const_local_i64
 #define tcg_gen_movcond_tl tcg_gen_movcond_i64
 #define tcg_gen_add2_tl tcg_gen_add2_i64
 #define tcg_gen_sub2_tl tcg_gen_sub2_i64
@@ -1205,9 +1203,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_extract_tl tcg_gen_extract_i32
 #define tcg_gen_sextract_tl tcg_gen_sextract_i32
 #define tcg_gen_extract2_tl tcg_gen_extract2_i32
-#define tcg_const_tl tcg_const_i32
 #define tcg_constant_tl tcg_constant_i32
-#define tcg_const_local_tl tcg_const_local_i32
 #define tcg_gen_movcond_tl tcg_gen_movcond_i32
 #define tcg_gen_add2_tl tcg_gen_add2_i32
 #define tcg_gen_sub2_tl tcg_gen_sub2_i32
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index d620012c48..5cfaa53938 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -996,10 +996,6 @@ void tcg_remove_ops_after(TCGOp *op);
 
 void tcg_optimize(TCGContext *s);
 
-/* Allocate a new temporary and initialize it with a constant. */
-TCGv_i32 tcg_const_i32(int32_t val);
-TCGv_i64 tcg_const_i64(int64_t val);
-
 /*
  * Locate or create a read-only temporary that is a constant.
  * This kind of temporary need not be freed, but for convenience
@@ -1021,10 +1017,8 @@ TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
 TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d2993826c8..bb52bc060b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1445,22 +1445,6 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val)
     return tcg_constant_vec(t->base_type, vece, val);
 }
 
-TCGv_i32 tcg_const_i32(int32_t val)
-{
-    TCGv_i32 t0;
-    t0 = tcg_temp_new_i32();
-    tcg_gen_movi_i32(t0, val);
-    return t0;
-}
-
-TCGv_i64 tcg_const_i64(int64_t val)
-{
-    TCGv_i64 t0;
-    t0 = tcg_temp_new_i64();
-    tcg_gen_movi_i64(t0, val);
-    return t0;
-}
-
 /* Return true if OP may appear in the opcode stream.
    Test the runtime variable that controls each opcode.  */
 bool tcg_op_supported(TCGOpcode op)
-- 
2.34.1


