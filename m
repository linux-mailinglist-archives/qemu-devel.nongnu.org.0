Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D13B78CB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:42:41 +0200 (CEST)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJd2-0004iS-2g
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItD-00085j-7I
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:19 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIt9-0000tE-VI
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:18 -0400
Received: by mail-pj1-x1031.google.com with SMTP id q91so137176pjk.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FVO3wAM4GMS2A+lnpro1PCsnjfTs6t0dHZi0wN04Hig=;
 b=TLL+4wK3udpyDWyTPeyZSXGi0i8iQLf8fe0LnLYK46dwU3u/IX01h6Tqv1UMr0V9Eg
 KyfOx9OnItPeBLLAgCRtrkyS79byqODTm17pr0r58kSJo3LvtqerERQ47l/xv1JnwvCt
 uxuR9V0AFojt2+Ye7RNU4BRGGylD4ENnu+d9IgJ//1nBfMy2IYJFoA3Xx1vhQYmbGbUn
 SCuuk91GPpC9psXHSeCJ/gt3IennLifpQbpQmS+0lEHv9kLRlvYnh7j1zUmLV8HwTHVB
 Dt0JZPy5oWboq4gWnINVhySuDEHKFkkabsbpQ8AqrpkClgSe/kgBR4PdtYkPDjAYAkOk
 hsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FVO3wAM4GMS2A+lnpro1PCsnjfTs6t0dHZi0wN04Hig=;
 b=uXw59/wcSHgCWGsTuj8wNVXuNLBAn2H0XV1kTIL9QMDokQhw0IQpzxpYrnr8b958y+
 fbgFG1Eg92El/dY+hZWtncto7//1soM/h704Vj4+IP2T4AKekCPqu8XsQyEefAK2mTuV
 JjAb8tEJc2iQ8WeUTgUT78rTIAsMNFvAzXpBtCjMS7/kTqmycYTQnDiQ4quPlThw/Q6r
 dsYoKzqlzx2v2imlWXZPnyDJzLN5p9IvU0FVlbCGuj8VTRvxY56rwvVNzH0bkVtihvA9
 q3JVixYZDP2y3nLM+uEHqyaLTTaE7DzBwz3u2sqh4CQoAS/NPwmcjwqsjLSrI39oUUxN
 JjBw==
X-Gm-Message-State: AOAM533n4QAAKcC/1jETEMyKfL3+nJwITwISqUgWRWXIaLVAQBBcBb9M
 4QikYy6QVsYaC4zTxZPaBfHhGbMnIzyqgQ==
X-Google-Smtp-Source: ABdhPJzL5wSi3wRJI2GGWtJRElimDoc3LvSW1FWRzf+rkrmWwnKL5GjRSXXn5fhILmDLeeoeV2Iy/Q==
X-Received: by 2002:a17:90a:bb13:: with SMTP id
 u19mr34543270pjr.113.1624992905721; 
 Tue, 29 Jun 2021 11:55:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/63] target/cris: Fix use_goto_tb
Date: Tue, 29 Jun 2021 11:54:09 -0700
Message-Id: <20210629185455.3131172-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not skip the page check for user-only -- mmap/mprotect can
still change page mappings.  Only check dc->base.pc_first, not
dc->ppc -- the start page is the only one that's relevant.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 24dbae6d58..9e1f2f9239 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -524,14 +524,9 @@ static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
     gen_set_label(l1);
 }
 
-static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
+static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
 }
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
-- 
2.25.1


