Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43B3B78EE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:57:35 +0200 (CEST)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJrS-0002Kr-Td
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwa-00046j-L2
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:49 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwM-000311-PI
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:48 -0400
Received: by mail-pg1-x529.google.com with SMTP id e33so19394111pgm.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFW7/uteqhUz14as6VIJ+oMkuxFCaj8xI5hXiJ/YKgI=;
 b=virIVCiSf9HZsnkxybrt81iJ0t+cCFwLF6U4jJduMC7aX3SS3zNb0pvRKN58xs32By
 pfT9jf+Fy3rO4IA+4WeE0sqiBVITZI3BcnDbXUnA2B63Q0MpQZSD9FJ29zPKTgsFTKk5
 Zspw6SVk2FinI/Do8PFzvUZN4uznQlpSPdePqaytRz7jEAiZMPolT8Dn8G+xv4pDigdL
 Z3kh5L+LaOhCNOb2KfI8d4D+770Q0cpNCAHOUcUD/ckizrsEqLrcO+C12+UdriN3I/RM
 YJ2Gq3nVF3RYHvzhF+w5jUo+Ds/IwkeDoZoFRnUqovsBp7Ewkrqs83RDDC3C7kow1T1c
 uXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFW7/uteqhUz14as6VIJ+oMkuxFCaj8xI5hXiJ/YKgI=;
 b=sWx+nsLiIhRXqzqvovmg4n4PTZ3BOCaGIA8GjAo64Gk56VOjQCnpavpQd6HTPfzllm
 Oi8FxGL19FwNuitPLmLxWCD36ak42ekfK/NzFOiwQ8J7qhFzWKqEEmj2M6LNEn+odtkW
 l/I7Ijxd3C5YI8BzjxvKvH2z4sOOuDSxcFKEYrc2YCMK3qVGEyPxTOZpSjBJyuIw8IMY
 uEZlxiaFCelKo3uvkNS0tXQ24q3nJ/QdruqKreVlRtEEL/lLf4Kz7HSPLP8yoTr2BZRl
 6HsMXcLWpZhoErCBH+1p9+EgmHpN1om7A9RWs0T0NvoYrOhNNu1IbpcrKlUM0kihw6na
 LSVg==
X-Gm-Message-State: AOAM532B27ZEuUdfKq6D03mQ386/2c3cmVZIcoxI8dqoWOHAInSLh+3+
 usSaRJ12ke1FUAbTGDMFYKPNqNTlNct0IA==
X-Google-Smtp-Source: ABdhPJxQtQiEENc2iRx/GAZez8btiPl4HTc81PRAHdaz+86qbKS3irr5IJejZ9QbHOEOvznxa1jLeQ==
X-Received: by 2002:a62:14d4:0:b029:307:1c6a:ae7d with SMTP id
 203-20020a6214d40000b02903071c6aae7dmr31450062pfu.78.1624993113360; 
 Tue, 29 Jun 2021 11:58:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/63] tcg: Make use of bswap flags in tcg_gen_qemu_st_*
Date: Tue, 29 Jun 2021 11:54:46 -0700
Message-Id: <20210629185455.3131172-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By removing TCG_BSWAP_IZ we indicate that the input is
not zero-extended, and thus can remove an explicit extend.
By removing TCG_BSWAP_OZ, we allow the implementation to
leave high bits set, which will be ignored by the store.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 0eac2d1969..44d711c0fc 100644
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


