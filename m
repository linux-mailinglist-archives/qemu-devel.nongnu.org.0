Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C33C364CEC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:15:56 +0200 (CEST)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYbFL-0000Wb-Kw
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQe-0007Uz-5n
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:32 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQc-0002cc-GH
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:31 -0400
Received: by mail-qk1-x72a.google.com with SMTP id z2so187963qkb.9
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbzgUSpJ4Len8Cs7k/6eQfLYFJFY7f59LIhjThiphCw=;
 b=M0+nFpSXXGtBPz2YIxSwkJlkfycKhhUzu37P79QedqfW3tBcQGpNWlznft24zF6bXH
 W0ud3YGskYAKSoBgXhQg4szZ3rZ1Lvo6o54OY2LQ7PUfeQupDtKgM2xzgeM/1Qkgd1Kb
 +YOpIl2CpcrnW7QqXfAIm/nXXOvkFROa4uvx7M6lJX0Yy+NnsoLEvfem31+GwvOg3914
 CtAGqtonewb9OG4Ge4AwrljGd6W0HPhcPX4jI7XgvV4iLYpjX37MYg7KhsfPQ/AOCx7K
 z3TA2uI05cDBKUMlnxmRtm+IucCOiCVe/7IX37tHw2bK9KRwfMRKuurIT7oiEUgsNBsv
 lA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbzgUSpJ4Len8Cs7k/6eQfLYFJFY7f59LIhjThiphCw=;
 b=qGKskMacN0ITH6iekOT+ABf3afCuhVrczCtKaYAM4/wwAOQDANYdMx8oisUOtBTb62
 X/2Gr85AcYw3++XdAeG4vbhjoFKho6A9G4WW6BdbUqCMffTS28mggMdtc4zh35fEdZHy
 S1d1bhfMfPs7IdZwmYgFfnlu9yKxznT9l/GlbhfJdK29Edp96pjH+ZgmZcC+TckkDlkx
 WhJQZ3jvtdet88XAq92KI9vQiwt0oyZk7wQqHSLjJ+hITEmS/nEASBltbrFy9Nw2ybAn
 BPlmoxrCbQ4TCG80Qt9OveIcYZ7Ol9oOx0OQngA2z0IAJEOypSoviDMx3WPhriroRFeZ
 rJOA==
X-Gm-Message-State: AOAM530Ntu4uBrjSKXtM7qg82Yc8liCfbTLimFHhAq81mPsq9TYIqRHg
 4s9hjgsoA/Q/JP2wkY6MAU0qPYwVuuNxhAms
X-Google-Smtp-Source: ABdhPJzMjoh0ZxLXaZ4ft6msPowgOyY/rU9tno+Wpkf17RlRLRPkslEuVamv5ucrZyWsNvxxn5WKwQ==
X-Received: by 2002:a05:620a:847:: with SMTP id
 u7mr14053002qku.11.1618863809458; 
 Mon, 19 Apr 2021 13:23:29 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/31] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Mon, 19 Apr 2021 13:22:42 -0700
Message-Id: <20210419202257.161730-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1b0951c45b..29fbbb84b2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6920,7 +6920,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
     addr = load_reg(s, a->rn);
     tmp = load_reg(s, a->rt);
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
-    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel | ISSIsWrite);
 
     tcg_temp_free_i32(tmp);
@@ -7076,7 +7076,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
     addr = load_reg(s, a->rn);
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop | MO_ALIGN);
     disas_set_da_iss(s, mop, a->rt | ISSIsAcqRel);
     tcg_temp_free_i32(addr);
 
-- 
2.25.1


