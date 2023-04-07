Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E568B6DB2EF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 20:38:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkqwt-0001uS-Gg; Fri, 07 Apr 2023 14:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkqwr-0001tv-Dc
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:36:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkqwp-0000cK-RQ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 14:36:33 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a5197f00e9so1139125ad.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680892590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lCbBH9TLJkbgg63E9qjRamQ6nLyVwGqt9gRUwFu0CdM=;
 b=Oi1V6qNZRNLJryreRgQ/9/HhK7Y4GqfDmzY8xPrHCtMMcwVzXYvMJOv9f/VHLmzFRB
 pIcrFXTni+0TsgP/LUj8YNkUhh4eIxTDooIoNfWB50LodiuD4voJQz59v2GD6XY7nrDL
 JvfqGHB/Hgv+G+lh4pxht0TLtUJRA36pmTuj6rI5xAJ+G2yB/IQh7WjyIbdaM+cHLdjR
 VpvEmM14b23xcJ0VSAzsNR539MVZ7qTErCeI2CazkdqP74Vg7TEnL9Y4wLcoDvpfCBDt
 aWyn166BhIy8srGh4MOcNjrOIBsM0qZ9AMG0q3tF3UEtejc9fTPDmG2sP4bm4ydqVcES
 cuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680892590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lCbBH9TLJkbgg63E9qjRamQ6nLyVwGqt9gRUwFu0CdM=;
 b=urJ15rZkqWCPe181fRQN5Y9Hb7Rtt8kMU0Nr4RxhoQtCm+m96rfoXJ2HEIeE1V0Hz2
 umfzndd0Y6oP8yiGt9nspKS7mnPorbegHAXdBqiPrQL3sE/XFsKO/DHfcM2bPOKchgmZ
 Z2Vw1ZA2e04iubG+c54sxfvH1dB5WRDfL+RPGryIUUHnqzhHicJ0JymhFSTRq69Qgo54
 s3V0wuXAsAYup4UGwLcwJKcbpkkNZcqnk1VNofsdFLGCGEe7XSfv3pIjFgL9R+nmZPVO
 yEXIEbpQwa+ohTb+ZASBwQo+uR9fKkKJ6Z63ypT/lPvWR0wJJPdwxuALPSc535EfUjV4
 G95Q==
X-Gm-Message-State: AAQBX9c2iBeg0P6orHEJU1pPjKWF5BGturmMYIOfOjKwNk1lXWkNGwCI
 FXmOKBaR/osh5GDzS18sLTuFbOhnAzgrmE4XW+s=
X-Google-Smtp-Source: AKy350Y3p988yXf86NzFoTGODBzXuOCljyo3JbZA05hr0AHjDo1geHU4Raep/mIt13wgLesTnLf6eA==
X-Received: by 2002:aa7:9809:0:b0:627:ef23:1f95 with SMTP id
 e9-20020aa79809000000b00627ef231f95mr3210654pfl.31.1680892590234; 
 Fri, 07 Apr 2023 11:36:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3344020pfr.213.2023.04.07.11.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 11:36:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, clg@kaod.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH for-8.0] target/ppc: Fix temp usage in gen_op_arith_modw
Date: Fri,  7 Apr 2023 11:36:28 -0700
Message-Id: <20230407183628.3239304-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Fix a crash writing to 't3', which is now a constant.
Instead, write the result of the remu to 'ret'.

Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9d05357d03..906fc46723 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1807,8 +1807,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
         TCGv_i32 t2 = tcg_constant_i32(1);
         TCGv_i32 t3 = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
-        tcg_gen_remu_i32(t3, t0, t1);
-        tcg_gen_extu_i32_tl(ret, t3);
+        tcg_gen_remu_i32(ret, t0, t1);
+        tcg_gen_extu_i32_tl(ret, ret);
     }
 }
 
-- 
2.34.1


