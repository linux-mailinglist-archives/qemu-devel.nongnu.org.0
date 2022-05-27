Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99253678E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:39:24 +0200 (CEST)
Received: from localhost ([::1]:50918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufnr-0003ZS-Qt
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec4-0003LF-JO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004Lh-2M
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m14-20020a17090a414e00b001df77d29587so7800968pjg.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvMJbfFzK/OVwVCkNWdnLpNcVizUtQdOBWHSbpDC9Us=;
 b=LnnJidRKiOJbMUsVfKhoqFLVqoHPA2byRRsNiWU2sWskUc9QCwBVHsJhAnuyuBhejL
 DtIxZZKMD0PhPJgGwsGPkGJc3VulGAqQSVckIfXHunVBuzozWVv+cVjJhonHGLxdtVVy
 hkKtTS1xAMwo1t+rUkT71kymUhuWri+P7p+jDp21LWpikBMFUkca9llqck+hohuy3zn1
 QXcHUl3hVTyCZJvawg/VwBS8Fvvb0ryJe/4Gfg/8TvsqG3rc9kBesSW7dc20LM1BcISU
 dyH8AD34Tz4WlixhRaVOrLV0yRn5EauVWEViuvrlizOX+h8c+h2JehBL6u3daqFR28/I
 q3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dvMJbfFzK/OVwVCkNWdnLpNcVizUtQdOBWHSbpDC9Us=;
 b=f1Vbph9YeZ+qDsdvMMwe9SxP8Xe36c3ls+8rQDrrMyF4BqHFka7X7cLu5HIpnpGITS
 93vbtOK+15UGTEkV50LnbX8pOJh1W39PpsincNynqmOtY+gKIwLvlvu2kBhwzTevkZw6
 myp0BskNyj3hVy6jSJaPK5NeHIc5dHk8oJniyz+CwsxkRmao0jsIeu7b1br+M+SqIGNC
 YkGg3d9nPKB4vKCh1dU1OrpCF7S8oJ5N5OUt1ggpuKtuaA02GJvDKOt8TcFUb7gQ3HRe
 O97l0oJZaBsirb6NlH93GB1hDI3yknbhEX0w4ZVb8piGRGkqE3cyw3YYBRClnEmRrc36
 Au4A==
X-Gm-Message-State: AOAM532Dc4SWR4TBSenc5tZ4dsDe/lXjJTrssZ7fDbVbxa/oqfOMhPPE
 jsjDM3L076Dhj0hARUeioUl7tZaPPnsZzA==
X-Google-Smtp-Source: ABdhPJwLHWZ+HNdATniEdhV2OftRB0rjISEbLdQZFS2cyp8eLuXJ8eLkrw41JSP8zN/Wg8AkKDkWSg==
X-Received: by 2002:a17:90b:3ec7:b0:1dc:b008:3cd3 with SMTP id
 rm7-20020a17090b3ec700b001dcb0083cd3mr9691461pjb.226.1653675774206; 
 Fri, 27 May 2022 11:22:54 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 049/114] target/arm: Use TRANS_FEAT for do_index
Date: Fri, 27 May 2022 11:18:02 -0700
Message-Id: <20220527181907.189259-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 44c2342923..dac29749ce 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1126,33 +1126,14 @@ static bool do_index(DisasContext *s, int esz, int rd,
     return true;
 }
 
-static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
-{
-    TCGv_i64 start = tcg_constant_i64(a->imm1);
-    TCGv_i64 incr = tcg_constant_i64(a->imm2);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
-{
-    TCGv_i64 start = tcg_constant_i64(a->imm);
-    TCGv_i64 incr = cpu_reg(s, a->rm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
-{
-    TCGv_i64 start = cpu_reg(s, a->rn);
-    TCGv_i64 incr = tcg_constant_i64(a->imm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
-
-static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
-{
-    TCGv_i64 start = cpu_reg(s, a->rn);
-    TCGv_i64 incr = cpu_reg(s, a->rm);
-    return do_index(s, a->esz, a->rd, start, incr);
-}
+TRANS_FEAT(INDEX_ii, aa64_sve, do_index, a->esz, a->rd,
+           tcg_constant_i64(a->imm1), tcg_constant_i64(a->imm2))
+TRANS_FEAT(INDEX_ir, aa64_sve, do_index, a->esz, a->rd,
+           tcg_constant_i64(a->imm), cpu_reg(s, a->rm))
+TRANS_FEAT(INDEX_ri, aa64_sve, do_index, a->esz, a->rd,
+           cpu_reg(s, a->rn), tcg_constant_i64(a->imm))
+TRANS_FEAT(INDEX_rr, aa64_sve, do_index, a->esz, a->rd,
+           cpu_reg(s, a->rn), cpu_reg(s, a->rm))
 
 /*
  *** SVE Stack Allocation Group
-- 
2.34.1


