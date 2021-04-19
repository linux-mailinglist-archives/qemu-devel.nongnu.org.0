Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86604364CB8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:03:14 +0200 (CEST)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYb33-0007TU-Jj
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR4-0008Dj-SD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:58 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaR2-0002qo-4a
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:58 -0400
Received: by mail-qt1-x82d.google.com with SMTP id o2so13700590qtr.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sur9/JZybq5xVkGAS9I0yc1/ThRv4l764lANHeDVf88=;
 b=XDUsdbSak/GS0x2v6QYq6AGcprdt8d0R7yZZ+Quly9i+bySRPxbZFp5A8/CZYmkjyL
 s/UEfmjYZ5VusqiFoKalcYXbBXSs2I1xzzenZCjSXk3xVm3QnPVXH1M303d7uo/qs9gZ
 RRrOHsik9zOeVskI64YaYu18eU7mjwQJP0e/H07qCu/VcdqBd/5VQ4oBfNbOYzb2gttI
 uCYrGSoeveaGekiWES0v3YnP1MiIKbKo1bRG7bhwDyuTHBa+SUtgGsyWCs4K2nDAywO4
 E2U5jneDWeWZ5M8guEhuyGYjGzti7DXsqQHPn+ZQHFCSP7CV8fPdXTlLYYn/LMkqry3Z
 1nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sur9/JZybq5xVkGAS9I0yc1/ThRv4l764lANHeDVf88=;
 b=D44RaPpIy1KEWTe+zCvITe5HhANQkHNgk52Kp/lLMkKLJK6FxoUs8cNZd4BNiAtj0Q
 aJNfyRMbuX6zIahiqOryEBHScTEoiOxEWlWd/rREAspZn40WYuhAy8pFdo6Y0PfheHVz
 Q6twtryss4kYnTEKrvbkq2JDJk0YfeQfYQs0OL2o4OUOBRfzbOWZtonDes4UtAcj6WVW
 k/gAVmCLlG/Dtbr+SlXwmmSb1L4IOePWPNUfi8+llAuNnQjeiVX2yQfJNjKs+NuJF58t
 5yhDmJRfofKZSg+5QadzHHqZf+ucrUyEB580/UiKlhRvXOeDTNANSYosffNv/fFBquyD
 rjBg==
X-Gm-Message-State: AOAM531gVJRYt8mdZDw53EcYAFvQA9h4En5WhRvZ50ya+iH5TzL2aGjR
 egsGTj29uOQkR3w8govQe0GDxt0jUCMxGk09
X-Google-Smtp-Source: ABdhPJz8d+LjA6BXJCCgJqUXG0nD90MsS3zxKvjygUJGb55zzQGzBr2R5Du1QE8kDblSCXNztbqbKQ==
X-Received: by 2002:a05:622a:100f:: with SMTP id
 d15mr13862247qte.2.1618863835257; 
 Mon, 19 Apr 2021 13:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/31] target/arm: Enforce alignment for sve LD1R
Date: Mon, 19 Apr 2021 13:22:57 -0700
Message-Id: <20210419202257.161730-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 584c4d047c..864ed669c4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5001,7 +5001,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
     tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        s->be_data | dtype_mop[a->dtype]);
+                        finalize_memop(s, dtype_mop[a->dtype]));
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.25.1


