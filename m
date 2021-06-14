Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D04E3A6A6B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:32:27 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoZe-0007No-H2
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEb-00019V-AA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEP-0000LW-H9
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z8so14940582wrp.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZdmOS0+SAUIu2ioqPfNiZdOBVip69Wg1K/eKjCptxlY=;
 b=NCkZI0EditlgppF1SKM1jiKnxWdS9aPT8TI13FEJfPv7O/3kmyApI/c80rqLmDTuMN
 y/QdCc1HCAY+mReXiGxNbQMY7RnjQOw8/vhPF4DbOPbPQ/RHHYtOm5hdypP04exNd090
 hwoeA0OL0wxiKL4IGR80qG8bySHuSFFmc/01eo4l7M97WHasAeXis69zuLXHozIPTodF
 9jk58k74vDwGo/cOfIM+OV86nI1Ve/IfFM/6gfKGfvGMlIBNRjK9IVqWKfMR9VnLi7bY
 fV430AfKHxTBu6ujDStmmaaTG8nCY8CSP5HWLK3RcNTMrQC+vDkoJsZalrQVladXJ8wF
 u7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZdmOS0+SAUIu2ioqPfNiZdOBVip69Wg1K/eKjCptxlY=;
 b=MCPdXfRW6X0grlcCi4oMMTWyxQKqY7or06m31ZXsKLM3fyIuZyc6Rg62llAZu4gedR
 t2zoTP+Rs5hnuGmS9slVU4QR+xRrJFmMYE9KxkMVu3BY0gKckkQpuWNocbw41z3qwX/K
 dYBryje5ZqT2Q/WLp2+Tib2sUxS3n5n/eIh1UJ6m3v0pxEBvlq2MTpN676WG0qYTWkbO
 maBmY6tv3D+v0fvztT92S1vKwKhG8rEXm5LfU/edshDgH26SNpnCIjshxrCZ1BTWSqRW
 0sTUGp6ahS/1uyJN7Q7SCYMLTaeuoDQM6IQotvsbsu/sJ6YJnhbgIMvEcQ17FGrSZ3k5
 lPag==
X-Gm-Message-State: AOAM532JmywGy3ifrd90L/xTI/OLY95SazSVRmFWpThsK9HxyKgf6Z53
 7fIUWrSj+jgnnIAstJJkJwHvxAKnjzZ+xw==
X-Google-Smtp-Source: ABdhPJxjFjiNQyXxiWiyyECzlesjQ+fu6rC9Hgy+BabJfALzXguGGx5YE+IzcylQrH7zYhw+JZlfFw==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr19420397wru.77.1623683428173; 
 Mon, 14 Jun 2021 08:10:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/57] tcg: Make gen_dup_i32() public
Date: Mon, 14 Jun 2021 16:09:31 +0100
Message-Id: <20210614151007.4545-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm MVE VDUP implementation would like to be able to emit code to
duplicate a byte or halfword value into an i32.  We have code to do
this already in tcg-op-gvec.c, so all we need to do is change the
function from static to global.

For consistency, expose both the _i32 and _i64 forms.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I picked tcg.h just because that's where dup_const (defined
next to gen_dup_i32() and gen_dup_i64()) has its prototype.
Happy to move the prototypes elsewhere.
---
 include/tcg/tcg.h | 3 +++
 tcg/tcg-op-gvec.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 064dab383bc..018f8965f81 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1331,6 +1331,9 @@ uint64_t dup_const(unsigned vece, uint64_t c);
         : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
+/* Replicate a value of size @vece from @in to all the lanes in @out */
+void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in);
+void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in);
 
 /*
  * Memory helpers that will be used by TCG generated code.
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 498a959839f..abe9e07116d 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -386,7 +386,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c)
 }
 
 /* Duplicate IN into OUT as per VECE.  */
-static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
+void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
 {
     switch (vece) {
     case MO_8:
@@ -404,7 +404,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
     }
 }
 
-static void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in)
+void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in)
 {
     switch (vece) {
     case MO_8:
-- 
2.20.1


