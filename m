Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC74117B5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:00:21 +0200 (CEST)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKmK-0003Fi-N7
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9l-0002su-VW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9Q-0000wS-U7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id d6so30067175wrc.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hCL4O5PwE99lq3grjY0zCTmYzSS/m4a5i7W9A4g4KkU=;
 b=C0Nd0uOzWMH/ZPcrq5UYmECDYvwwRaUcUTCaN0TttNbnJGxnUXpMOt7wZvkZ+WEzQk
 l8WNrntjFr/z/acj2nGwc4BBoN/JmM7mvUkbMxdKLjEoeA3f4+ZNAaoJuo3GXCYx38Uc
 oPwYuRMgxDR5BP9f3L2LJyakOqI43Ic7ufIhQzxou2AGWekseLxLS8VzUCUgaeiWCcD8
 XwAzJxdbEl0+WbZoFcYM4qYowskBt3ovoc7UjFQhUW5siakNKJ93G/h33CK6QKLGfMY0
 Sdl01OoW5TkSH/IuFsIoLKhJwNkbakcqjPhDtufekFoSMLroCTO+cyZt/tgVzHlJWmn0
 MHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCL4O5PwE99lq3grjY0zCTmYzSS/m4a5i7W9A4g4KkU=;
 b=AZ+NUBZvIwc5f3R96phwV+5aT7rzHUB/x8bH3SzMamLyp90Q9P+cPBKoi6H509pkiC
 r1Rfcfg6vMGLoAupZUdpN2ppcYvwy3OgmCbumVhZkmcQyGGINSA57guzOKGy2VwiZCFE
 B2jqfJC+DB2GlEg4pRlPpCDe38O8qmdtvTgoHFo3IU3cfh9iZ+HtEG5mfPledvggRLZo
 MLhPU1gsBugwtg5LZ88hrCoIwNO5HKKDEmkr9oLsqD0sUzBYbQqTy5Gu4fqh7bGqhUQK
 dRtrHw301lvEZkAofiRHAfUVnmrOpd8NZW8dV2U+ZKsmsJC5dfqQxQ1/KxsIV43cfX+y
 gTzA==
X-Gm-Message-State: AOAM531oFaBopQkygGxotJZ1/FZOI5/LZahKzjG5i9X+vrHzGo9+B9TD
 YP0/hSxDLn0aHxTebDkNMkNs/zBCOCg3iw==
X-Google-Smtp-Source: ABdhPJwQ8fhVTyKuCOVBFj39LiDqsuB6eQeqIZzpMrR4YxNLr7nDQ/Rnrm/xKAhCD6f8sFByTpwgXQ==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr29273847wrn.261.1632147605970; 
 Mon, 20 Sep 2021 07:20:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/27] target/arm: Optimize MVE VDUP
Date: Mon, 20 Sep 2021 15:19:42 +0100
Message-Id: <20210920141947.5537-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Optimize the MVE VDUP insns by using TCG vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-8-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d30c7e57ea3..13de55242e2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -500,11 +500,15 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
     rt = load_reg(s, a->rt);
-    tcg_gen_dup_i32(a->size, rt, rt);
-    gen_helper_mve_vdup(cpu_env, qd, rt);
-    tcg_temp_free_ptr(qd);
+    if (mve_no_predication(s)) {
+        tcg_gen_gvec_dup_i32(a->size, mve_qreg_offset(a->qd), 16, 16, rt);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        tcg_gen_dup_i32(a->size, rt, rt);
+        gen_helper_mve_vdup(cpu_env, qd, rt);
+        tcg_temp_free_ptr(qd);
+    }
     tcg_temp_free_i32(rt);
     mve_update_eci(s);
     return true;
-- 
2.20.1


