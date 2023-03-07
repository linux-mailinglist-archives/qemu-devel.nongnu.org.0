Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A3D6AF0D6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9o-0003qC-DU; Tue, 07 Mar 2023 13:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9m-0003p2-KW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:26 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9k-0007nq-UK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:26 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so17432342pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyxL9T8UjZxQ4CAYfGW8p+3sQmOt2OC3gGYPJjY7kcM=;
 b=lB4KlHsonoaXbms8du1y0UkntDeDsFHTwJYemIHSuNZKijdk6JsetMPYsDauhxghv9
 m5e4KJbRvczGt2EMXAujKDCLpJUFTimJhx8uhQaXWoKPbPPvRkYl1mKj7If/7y6D6FMD
 vf4Pa20npeAaWXiBHqH5pNAZxiJ++W/4VUEAbnlClFDySW4aKJTR7lxXeKLpwBTmZGGr
 0QwOdRG/JU+qa3oGScXylzdCZXQWwBIAqW/8l8AgUItBkiNfXJRxE51Mu99OQT9PuQsQ
 4bmEkbVeTM4J8jC3QroEZGuf8+wiw0CnpVK+flCheG0kyXIUVDu3K/yO7rc15nXgo7LD
 1mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyxL9T8UjZxQ4CAYfGW8p+3sQmOt2OC3gGYPJjY7kcM=;
 b=a8ehRb8r5FwFNqv0J52rKsTmXsFqU1IO4h3HpPLAScC7JvoVeytFAdZ7EolE2IITql
 IUSpV4TuYj1EtjcQgXLbRzIJDtakj14lCMHBMEkrWNvsLTJI3bQ/CeMoNDK5NsHT2fet
 lxpgS4Fi3vGn0OT+oR04uWPKk6WuNdIhzutW2fKnQqsy9FHQWR0fE2ctx0bGJZEBfWMA
 7HZRjwW6/kn0CP2G6vCW3yH7WHgmgS1voGhprlJKtcnVbV1DYqrHJlDx8kOMriDrhPX2
 d7fHrgAXMFfvyXAUZ+lt4RP1lrijx6hVylRIiewIM3zLoWCWD8eHArJ03xDGeRXyAC4g
 XpCw==
X-Gm-Message-State: AO0yUKVi6stOcBzClndJJZuLcSy21PupkW8ivo39gXr4wkB3i7x4e/pX
 RQoKj1ZpZQEeQlFFKix74z8aXE9qIqOLypgVJXs=
X-Google-Smtp-Source: AK7set+nwDvPB8gr6EoQjYMXGeCpKc9iQMBIrorLlTeN5lm60B4MUpzMlV0bmNqeR+buxXM4oqfiqg==
X-Received: by 2002:a17:90b:3883:b0:230:1acb:191f with SMTP id
 mu3-20020a17090b388300b002301acb191fmr17254853pjb.32.1678214124184; 
 Tue, 07 Mar 2023 10:35:24 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 25/25] tcg: Drop tcg_const_*
Date: Tue,  7 Mar 2023 10:35:03 -0800
Message-Id: <20230307183503.2512684-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


