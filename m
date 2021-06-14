Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A23A5E98
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:50:59 +0200 (CEST)
Received: from localhost ([::1]:46004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiJ8-0000ko-IK
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6z-0002ZI-80
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6o-0003cI-Nr
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:24 -0400
Received: by mail-pj1-x1030.google.com with SMTP id k5so9290007pjj.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g2DFsQ9t433IY1mkuvqi2WafpHFJU1Gt4g42MrkG5qo=;
 b=p4qNBABVLziCoaM19gFNyEfMX9hF9sPnK/Mh2pGjI80ZPA+zal2RKhId6J+rv0z5uR
 l3OAFyUbzQ7AyFOR5XfcCQu5BL/AHTJwjgyMiqpqUsb1IUgyGxlkDDN5fSOZ3GOASxdA
 OwROQcvqanK0q/1ikBahACu26T4IDA3tc6EdcKFIGcO4JVgNFpMSibIJpUwwOF977FT5
 OEBDIIsWX3G8oEb61hGMIRtt20XAqyVoz2S3pW65yDjs+AfIXc4fkJjn1dFlCSrWuNo0
 Fgcgo7MFQMKW6sIlda05x254o8IOIJXQgk82d4pf4dT9d3RvqO/id2JHpDs7TB+BqUa3
 Wt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2DFsQ9t433IY1mkuvqi2WafpHFJU1Gt4g42MrkG5qo=;
 b=Km92Nz6PqAYCvzlST/lLwTgY3z0E14FHpvLHpWhhAF2fF4OORxuO8hV9jP4LFDuYUB
 3pb0/sGmhw6vIS3/EtEmzOuea0iKQWExIfFIzwGGBVYVMdxJA1zZRwyMra/JVeN/4c4j
 3BvRMaAxZ1q5HKWiJf0+7QMBNUCpy3NpJrfnJOtoz8guMeXXYstKWX+dxE+qfafVmkY5
 z4e41CQf0NkPOInb6O+whO0RyTgINekt9qaiakQg9xgvdf6OOUrltWWZltyf/oSYpC3F
 4MDUcM7I54s27LcAnXl5bwsSAlaBPieZeFbz8PD/bGBHZeYJJdpskch/Y6TITTratHwS
 0lsQ==
X-Gm-Message-State: AOAM533ueXG6QQ2P8JwP/i7kfNgte8iBBaa+IEoWqPk1f8miGw4uw/Ks
 uka42/APp/VWzYUdHGWeXbJd5rM37FIllA==
X-Google-Smtp-Source: ABdhPJwvtTB/7eTM93I4lDcvSP9SmWd56ofZsi3LOwRLYsNGKqp0W81ePkAjCvs3MZC1IZ///iOk1w==
X-Received: by 2002:a17:90b:18d:: with SMTP id
 t13mr22654673pjs.191.1623659892812; 
 Mon, 14 Jun 2021 01:38:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/28] tcg: Make use of bswap flags in tcg_gen_qemu_st_*
Date: Mon, 14 Jun 2021 01:37:51 -0700
Message-Id: <20210614083800.1166166-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

By removing TCG_BSWAP_IZ we indicate that the input is
not zero-extended, and thus can remove an explicit extend.
By removing TCG_BSWAP_OZ, we allow the implementation to
leave high bits set, which will be ignored by the store.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 702da7afb7..5dbcd1b0cf 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2915,8 +2915,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
         swap = tcg_temp_new_i32();
         switch (memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_ext16u_i32(swap, val);
-            tcg_gen_bswap16_i32(swap, swap, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+            tcg_gen_bswap16_i32(swap, val, 0);
             break;
         case MO_32:
             tcg_gen_bswap32_i32(swap, val);
@@ -3013,12 +3012,10 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         swap = tcg_temp_new_i64();
         switch (memop & MO_SIZE) {
         case MO_16:
-            tcg_gen_ext16u_i64(swap, val);
-            tcg_gen_bswap16_i64(swap, swap, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+            tcg_gen_bswap16_i64(swap, val, 0);
             break;
         case MO_32:
-            tcg_gen_ext32u_i64(swap, val);
-            tcg_gen_bswap32_i64(swap, swap, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+            tcg_gen_bswap32_i64(swap, val, 0);
             break;
         case MO_64:
             tcg_gen_bswap64_i64(swap, val);
-- 
2.25.1


