Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B04435A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:34:42 +0100 (CET)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhycL-0005jB-9z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTP-0005hx-Rv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:27 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTN-0004Dn-F7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:27 -0400
Received: by mail-qk1-x731.google.com with SMTP id br39so7352896qkb.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cdNvFSJ5wR7JnuiQcjHWFGJQar8vceYVcWEUN+hvfs=;
 b=VOSJPPZWeLBQXCjvvYW9upU7ndT9m+iNTIodh8sRpL4QF6o+AQmjkdlNCXI1nlEPob
 PkYIhZoZt2moJl/sqhjHI2xKgTNNCag0Ww3dA7Cn9QXwdDxtfs9pOSDiVpYN7qvr68OR
 ydKr4AnR3uxBrtwsSb0n7Jvi8R66Mpt0+VhK81Wede3Y0nVnLGuYvUit3j1Xf9puY6h7
 UiGEvdtHKjb4vw8G3FBqcXbbmYSkGbhGnh4FW7gr2Vj7gXHCAOO9IfQIwy9Hl+oMEQeA
 uoaKmsucdfuizywxNthb7QiPsGE8TybuT3xmeM6ozL797U9AaMnRC1DX0FaEy67/pWHq
 AnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cdNvFSJ5wR7JnuiQcjHWFGJQar8vceYVcWEUN+hvfs=;
 b=JapSezJhaSXtIIFNlQQv2erj6mdUhbj9n4cq4dFO5pkCP6v0c1iacluOCglRBr3PKF
 8TtyUgwEYWURnVh4IMg7R9etKN7g735nGvJX5OdSX2IzdT3ffo6sKbvWeVlrjDpJJTZC
 3RPOGe4wGPcnEPpATxE0CvtAtyzub16ww2XTCjHF/heKtheufaMgZMSiZklneWADbuVG
 ivEOdHignNbIyParUBibEnBHyB2DBb1bl1CAfGjc4pAMxyOoLw2QWWheKx9Gm7L6ZXqT
 625BEJvn46nFeuGlb6HaygsIX0tSw8AL3by9Y3I/nAe0xpLj/vubmePyPIjCwrB7SGLK
 Bc5g==
X-Gm-Message-State: AOAM532kYsDIjGjr1+4tjjbOWYWTSAbdF1datUEy0GZubr0xYUGeoBtZ
 SeLx/QpSLJjI3xDofdPhmcnNWfL5WKsnYg==
X-Google-Smtp-Source: ABdhPJy7VF1gfikXDynghU08baZjDmr1RGOgj1Rb58n4aC7mkxm6klejQxRUcEdd5IC6v1RU3LDpoQ==
X-Received: by 2002:a05:620a:444a:: with SMTP id
 w10mr4547830qkp.462.1635877524589; 
 Tue, 02 Nov 2021 11:25:24 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/12] target/arm: Use tcg_constant_i32() in op_smlad()
Date: Tue,  2 Nov 2021 14:25:13 -0400
Message-Id: <20211102182519.320319-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Avoid using a TCG temporary for a read-only constant.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d6af5b1b03..083a6d6ed7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7849,10 +7849,9 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
         t3 = tcg_temp_new_i32();
         tcg_gen_sari_i32(t3, t1, 31);
         qf = load_cpu_field(QF);
-        one = tcg_const_i32(1);
+        one = tcg_constant_i32(1);
         tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
         store_cpu_field(qf, QF);
-        tcg_temp_free_i32(one);
         tcg_temp_free_i32(t3);
         tcg_temp_free_i32(t2);
     }
-- 
2.25.1


