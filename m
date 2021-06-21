Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B03AF968
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:31:39 +0200 (CEST)
Received: from localhost ([::1]:40220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTOE-0003A9-M6
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC9-00016a-8P
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:09 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC4-00060Q-Vy
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x22so7868067pll.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFW7/uteqhUz14as6VIJ+oMkuxFCaj8xI5hXiJ/YKgI=;
 b=QWDYQFI0LBjXyfF2Ce2krLlYi+SZY3ziVkdfg0oTOOeV3UxLRi/FJNovh4TVfRdCEP
 1MqXLXTz7G3qH5e1Duy2wvYoHaPJGrjJfNujfMwQKNBPosgAJRCJJS84RTwjctSUwW1w
 pE5rylffjwUvCZHVC3EoEkgK6GSe7Ytk9H0LKTzpMPIlhJO0yY6Wydm2A6ibXfqChNEq
 AHP+LJHqnmBegM2AgbpleuIFM5cz9g9tCNwUD/GzdXaVfF6SxEygW288EL2Nn0NhPs9Q
 4L1/DQDoTmf02aNh+12rS2/aWlzcnqfDjyEL8UFCrWEXmdYizXg1eGnwk5D4vpCtFSeE
 hd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFW7/uteqhUz14as6VIJ+oMkuxFCaj8xI5hXiJ/YKgI=;
 b=S/DNEM0pqFq6DFdOxxhDa7AUZ7hoEen+EvPowUw5oZi7DsjYjnRmNRMEm9YK0OsRvT
 cvdEDBGyA3WTpool0N/yxCPstG7s6+axrxE7z6CZ+MvaiMoRLH9KPnWxFDHDMNnCA5st
 f2kljUwmpKwQAvH1jp7hZtqqDMqiraxGkhnzj688z0dhO88XR53ZDwek0GOhmtOCn6RG
 b4HRHDEnuFYBvdelsNJ4oH5jY2Fg/QsUm9+h0qam78cbw9fpl+MjEyREbsdNxVnTjVtu
 at2GsFBiNVLCIOWHnp30fVSbKf1hQFfb408HV0Ng/f8ITBnun8QRn3ZURmHsbqg1BSeP
 AcAw==
X-Gm-Message-State: AOAM531XYMyXegu29UTDCcmudR3ELrPjiwWok9LrwIZgsEU951r0Rl2l
 MEnImG+IftAOBcufwIT/mBHMP8zqfCPtVA==
X-Google-Smtp-Source: ABdhPJxHpi9Gj58SL/YbmywgZtw5srktN5iAMEnt7rQEbQYId84Ae8Yo5MZMWKGpXiT8crLd/M2ydQ==
X-Received: by 2002:a17:90a:de07:: with SMTP id
 m7mr675142pjv.100.1624317543688; 
 Mon, 21 Jun 2021 16:19:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/29] tcg: Make use of bswap flags in tcg_gen_qemu_st_*
Date: Mon, 21 Jun 2021 16:18:40 -0700
Message-Id: <20210621231849.1871164-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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


