Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05BC3B4D3A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:49:55 +0200 (CEST)
Received: from localhost ([::1]:34724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx28Y-0000ao-L8
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vs-0002GB-LF
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vq-0000Og-2y
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso9275567pjv.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFW7/uteqhUz14as6VIJ+oMkuxFCaj8xI5hXiJ/YKgI=;
 b=opJ0aLsfE5Pb7FTPTROT99mqdIBmstNhPgLMr4KLDjIIVbi7dosTml/Ha5+xoGf1Ay
 YKWSc6eM1nYEzi6mKPKdMQC/uoZvAeA3jDcwHoONI4oUYfDeZGoTcUjRztk5aluBImqI
 Er5vW/nch8VKWR0oGCScf0Uir+wOkScrCUymve5wP0D/qEXCrIZ4LA2fJRLE2nw8H/e0
 vIhs14HtehrW7PbjX4WBlnyL1v7BIH23S3bV+MtqWdiRMiZYzJkPZfKHvDum7D+cJJU/
 OD5uETUlsr2wQgSHPcx/CTQ8RDO6Xt5kF4UMzY4qPQtfQFwlK9fzFq5+xN/JZ3RaWWdI
 Xdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFW7/uteqhUz14as6VIJ+oMkuxFCaj8xI5hXiJ/YKgI=;
 b=eRPO+zOfJliK/Y3h6rBXZvSPiEMbmYGkswXJBGhsI/+6Ep9iLixVKexj1u02yK3n0o
 b55Td9J2iVLm/IjDmKBT5FTpok2PmzA/QVu/T+hs+jLcfb/8n5GsfPIEJQfjjB5ifaSf
 Fe5cQhqElbogwQzrQmfr1GF/LQEp6KG0T4Ne+nHCapiL/HERY0TLmDaBfMJCOADngsNE
 7dx8l2hFYCHoC4WX61RybCxoaqiHwUc805DWFJEOTWje8HW28TmrypBx8R+Jl+QomQot
 0FMWzwvCPJ2/LfZDvO38hr2bAtvOj+51JVvmC1LhutcJoemKkatCtDB51CUrJvOj158A
 uC0g==
X-Gm-Message-State: AOAM530EAKwGDTYB6kSg1zndFVztqSpLe+A5qYhwW9Xn3VdqekO7vPan
 cCze/3lfCDkLX9fgSYy/mMpA6Q7q3rv8JQ==
X-Google-Smtp-Source: ABdhPJxPVrqT7O0+5ngmsuSU+0T0nvYK0pmJMZm2g4ditzjn8R3x5/cSV+RMcqBXSRZ4S3W+n/6VgA==
X-Received: by 2002:a17:90a:3d47:: with SMTP id
 o7mr25364776pjf.68.1624689404700; 
 Fri, 25 Jun 2021 23:36:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/29] tcg: Make use of bswap flags in tcg_gen_qemu_st_*
Date: Fri, 25 Jun 2021 23:36:22 -0700
Message-Id: <20210626063631.2411938-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


