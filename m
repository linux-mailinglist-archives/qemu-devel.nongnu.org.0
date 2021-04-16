Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C6362861
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:11:40 +0200 (CEST)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTsR-0007Z5-5t
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThn-0003sb-4X
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:39 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThU-0004Ls-Gq
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:38 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a12so18935151pfc.7
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vnaM4h0EcMHKhRnS4BkVBJaWLGLyH535AsBhLPRK9ZE=;
 b=fyMqfRVt+kJN1zvcl0EdCtE9q5DZV92iiX5KVIKAfJ2o3GEt/L8LFygYg85Wtkhk6+
 +D5bkPsggnx9/Cep6+r0kVTNU7C4uGgkJWmVm+UPdkfUg1FKMjwpYyu6qzlD7d8uTr2B
 za927vJJyU34pTDxH07Z512/Wozh5qaSrkwgstuZ9UQUKMX71FbEe+fJ5EmSyZ+TaZ9J
 Ik1KusqLx/AplH4v4UDlu0hYlV3ju+0DxSUXrvNmyVXz13JMJCbP8ubstsUmTT/bSV0h
 /6RwRoeoiJi6bUyVhM1mK94OGXeocrl3nQpQxN5XGXOskwvI4H/neSokXb25DpZfoDlG
 9sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vnaM4h0EcMHKhRnS4BkVBJaWLGLyH535AsBhLPRK9ZE=;
 b=RmWJAwmKOMehuvS7pMoseqSjAmF3FGFtNLNsX2KS7xDb6MqKUlSdINuy57mbdRFruU
 whEgTStWSXpJqztE71K9gLeIQxm7Fj+0Re+ZjawZ5sopeZbEP9iD0HXNx3xsmtrmUkfE
 jeERJiMU1HUkaHEUC/+hvLXc/0n+OTgNIhp7oXo6nrNE1d4hMnCgGMe3zvreX9rLIj00
 iXoSqpToNK9tsZ5fR3QUWPhih9oS3th9ZwBC3or2t67nUKkvFg9SttIJWgMSnlL1mrJd
 hUQ+mji4V0dcEpVT1Jow6MlydW4VkPKfE8jWwTzMx4M3sS8zv0SJ2NiTH/esllru2qrn
 KmyQ==
X-Gm-Message-State: AOAM532eHrt7aG8EjYYspEpPoH9EPWuH3S618mMStGBK6pPwwmSjcvPA
 s6rh+hc6mJFSrItutc1Z5aFoZJ5r3lDEmQ==
X-Google-Smtp-Source: ABdhPJynfVdYgypHrbgL/KiqiKU6bC8SuOPVcK380NxkvLNy8yU/GaDASuSw9Y94nlLP217vhUVGvA==
X-Received: by 2002:a63:ed58:: with SMTP id m24mr508629pgk.248.1618599615611; 
 Fri, 16 Apr 2021 12:00:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/30] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Fri, 16 Apr 2021 11:59:44 -0700
Message-Id: <20210416185959.1520974-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
index 63c665fb4e..270b10f83a 100644
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


