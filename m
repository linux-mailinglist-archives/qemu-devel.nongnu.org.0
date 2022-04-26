Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA195104E5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:07:30 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOeu-0002vM-A3
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-00039S-PV
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-0003vm-TZ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id fv2so3562903pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BDYfwx12Hon85ohkvO8cwx1aoDQ7rAnJ54ZLVVZwl+0=;
 b=HRx2VKmIkPk2haiJ37rUwuafLa+S2E1m3fpfnhQQbYdc9KRyj2MXf1EFq4IxNwBE+r
 sSUdQf07Y7DHLQcb9cEeXVR3qZLURfsVOvJjP8HqGl/l+3kqbf7EnYWr7xDUm3cbqDjp
 jCN8qRl112l+j+IhiAxHhqLJaNQrhhwQxDhwGxsPUjCHLbbP/iczz9oAQgOX05ve4Ayu
 V+bMo7/xsQF9Qa/UB1nDbnKZu73qJeLTmpdeT0bEEowbUaSEOTwBRWeIhyrsjEGULu+b
 43pd90wgXgQdaM08Uxso1KFB2UaRxmGQZZBmPW9wsG30g7Gd/T4plG7XV4KsEO5wEaDE
 z4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BDYfwx12Hon85ohkvO8cwx1aoDQ7rAnJ54ZLVVZwl+0=;
 b=0DzxICFPD9R5OLGDWjrHbnBXiiFruCwJuD1dVLamQyvw0FXThE9NTlfl46Q9g6sjIK
 L5op6ehiDrRdKlhe40u5olPZpNwZjK6eESouMJqwpR948zR35mHK8lEVFWEW6plIsO5l
 yEXUb3uu6h79WOQw66DRN1lEzbFWCALyjAHE6VTG1ADnLwFziGxXDr5gsA3TtftpkL9V
 Ow+/24sX4t7GfknsVdTEaLTuLokgh1/oqszJFXMQCTrZK7KRxnEnPXai4eLYZoQ7I/a+
 eo8E4YjHCSN9aEs+Qm1PdMwZ7ru+DSn9zciayj++8hdFAmiS1kO+7oU9YjS11agmt51p
 UjUQ==
X-Gm-Message-State: AOAM531Z+p9ddV02g5tYg+NFlrt8vaOlAgP7KCbpYlHOCp4EZ/Mz410W
 GVHvYYmuKJZbmv/rPOZJkNIPG8GNuTAv9g==
X-Google-Smtp-Source: ABdhPJzLXdFQiaR06jr+2J3LX2uFj5WXaUQlzz6xZy9icfZKwocKHNVq34N2lc1B+CRvTv0bXjR9yw==
X-Received: by 2002:a17:90b:2685:b0:1cb:6521:dd78 with SMTP id
 pl5-20020a17090b268500b001cb6521dd78mr27971623pjb.194.1650990676484; 
 Tue, 26 Apr 2022 09:31:16 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/47] target/arm: Use tcg_constant in trans_CPS_v7m
Date: Tue, 26 Apr 2022 09:30:30 -0700
Message-Id: <20220426163043.100432-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0e9fde2589..5ce23947a1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8835,21 +8835,18 @@ static bool trans_CPS_v7m(DisasContext *s, arg_CPS_v7m *a)
         return true;
     }
 
-    tmp = tcg_const_i32(a->im);
+    tmp = tcg_constant_i32(a->im);
     /* FAULTMASK */
     if (a->F) {
-        addr = tcg_const_i32(19);
+        addr = tcg_constant_i32(19);
         gen_helper_v7m_msr(cpu_env, addr, tmp);
-        tcg_temp_free_i32(addr);
     }
     /* PRIMASK */
     if (a->I) {
-        addr = tcg_const_i32(16);
+        addr = tcg_constant_i32(16);
         gen_helper_v7m_msr(cpu_env, addr, tmp);
-        tcg_temp_free_i32(addr);
     }
     gen_rebuild_hflags(s, false);
-    tcg_temp_free_i32(tmp);
     gen_lookup_tb(s);
     return true;
 }
-- 
2.34.1


