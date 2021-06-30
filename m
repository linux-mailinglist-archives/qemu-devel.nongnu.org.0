Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B9D3B88A9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:43:55 +0200 (CEST)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfBi-0003pq-KI
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0p-0005GY-4j
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0m-00022Q-Sw
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:38 -0400
Received: by mail-pg1-x529.google.com with SMTP id t9so3196981pgn.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Jf1hfNBd506pP5UotsDrbYdrcf9l5zM5YtUqqOrZ/M=;
 b=U59gzQAHTzh+//CyTQHvff5KXBoJ9wsWtQhtp8j4riQi/H1ZfbP50QZJyRjX+h2JJD
 +fKddZU0NtYQ+WfCoasWpDXDdutZKwaYBN5PaJvO5i2Rk3F1xgvKcgBMzJkp/ieo68R8
 AuwXOeh/eKUm0ir8s271DZLIbJSIEgAvl89kgJ1NwB1PV598Ez61ZdwyKR8AZd9M3VYJ
 2O5BlPQ94tbXm1qbldZIcxF2MbpfaOeloX7DGvsMszzEURhs9c4AH7ZuBCNJngAr1HBz
 VEuYOc3ClbrEzhtuqGF1Tb08p++cRF1L0W1+aXZEvSDck/3+IIV7k7/azfD+r8DYkpJi
 lu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Jf1hfNBd506pP5UotsDrbYdrcf9l5zM5YtUqqOrZ/M=;
 b=sZZXaO551wi+cWW57gIECktDUF4yiiV+QVYGUTnTqGmN+sh9ynjXfyu34nJKEPWtZt
 2rgPYCCUMOp/Tcn0FqacAkZ46zO+cQQD7hZdHzuL2NOaJNe0ui7PdmBjRF6ZaUuVZCXe
 CPMl06FKbUcpJM21Q7LUzIvqtZr0ktfJdopEPE/el2JhHlEaTxsOhNT0a8RQ5GJ9znTg
 OsIzlmqL7bI2u5gLFNIItPuyP6Q2mzxzrjgPxF/XVLze4B2adznJ5oanXrg2Z4ot2EGC
 eVMcVyOnty/9jiY37y6kj2IVfezn8q+LHS4JIja6wN0S/+djQZpNgsMptREoEKkCfjBb
 lDDw==
X-Gm-Message-State: AOAM533YSlWTdioncG04zKuI87DmzYRbqSLNIIgNXauTtW9wIAv/Dywq
 s/6q+zGOmUPzn7XL/JoapWzwQSskCo6NXw==
X-Google-Smtp-Source: ABdhPJyX9AAsmnZ4OIM9XvaACixSKbkLQqFqKDeYO8ALlwL6LA0tjP9wMY3yOWzndddEzdy6KVcWrA==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr37269229pfe.37.1625077955432; 
 Wed, 30 Jun 2021 11:32:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/28] target/m68k: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:11 -0700
Message-Id: <20210630183226.3290849-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Acked-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f0c5bf9154..05b96fdda7 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1520,16 +1520,6 @@ static void gen_exit_tb(DisasContext *s)
         }                                                               \
     } while (0)
 
-static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)
-        || (s->base.pc_next & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 /* Generate a jump to an immediate address.  */
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
@@ -1537,7 +1527,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
         gen_singlestep_exception(s);
-    } else if (use_goto_tb(s, dest)) {
+    } else if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


