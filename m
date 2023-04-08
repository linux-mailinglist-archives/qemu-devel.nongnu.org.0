Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFAB6DB876
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:06:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysK-000497-Ok; Fri, 07 Apr 2023 23:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys2-00045G-B7
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:06 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys0-0004VX-L1
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2406ba77100so167640a91.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=paKwch7BjeMSmw6hwR7oUnfRqPHVOt6iFq9garwBFk4=;
 b=eyhjwGRvQyLlXdxCtMgim5Yfn0doYYesVfGVNttLMbtNM/n8/3Mqm5fne8AVFqtxAk
 D8SWfr6Lo67957ZPVUsBXfQG6YeNY6r4ADydzfaGxlI00rNY3WItQVUh2aibXnSOx/tY
 vJNi5zOP5YAxBjjqBVO/29NcwdU/4MaDpifzls6q2g9mhTOt/aqDaSjo4B91x+LuzaGy
 j+EkX5YM2N9nnu9Hvaq8NL3bXwwBNfVTfkXQ4UNQNUmTfide5DqFyZ6ZPJkiHRSvfadO
 PmczQtpL9lP5LT1+8uPkDVtqaDCa/NDBzawjsXxYeV83mTTiKboKoQ7v9bqu3dzmcctd
 nk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=paKwch7BjeMSmw6hwR7oUnfRqPHVOt6iFq9garwBFk4=;
 b=tfxEIlnXKGv8gwpxfSEiTXeyKb8kg4F3HlaxtKNIYhsy1sr7I4cLd3ZMv1MuhxzxMp
 r2T1CjOQ7dZ90rMdZa8YGstTc5ezdzSogUOu7Qvi7Xa3Qqa4hsq3liPWdHYcjT2bng9G
 94sKAcXWVg1NtrCZFyTwQGBOFP2H4SsYB2UVF/PnoCSpuNTG4XsJjQSVhRphY33c2mDz
 bjC/QwTJ6xY6PhCg+4RvK9F0AdThHmN0QIN3bim58BU0Mae4H5rWSaWhsrGBy1WlySr5
 5aQSakpKnOMfWWQlw7uhsIYGdP57CDas5Lta/Bm1Lo+LavMKwDZJbEsLIeeEBOvNKZE3
 xHqA==
X-Gm-Message-State: AAQBX9f7B9aAM5IS6AftxZClObjLt3PozdPzsMtQwxThoU+EIjYd0Fvo
 glMSEGd4eRF9ZCgzFalSo/wXBAeOoA6vgM+ycGs=
X-Google-Smtp-Source: AKy350Zw/YAV40a7KJmmAHZ12opnD2fw23FekPXuUw8QwakYSy9Qu74/7IKz37J9/SaygYBiDc37Vg==
X-Received: by 2002:a62:4c1:0:b0:625:e051:e462 with SMTP id
 184-20020a6204c1000000b00625e051e462mr4138100pfe.15.1680923043260; 
 Fri, 07 Apr 2023 20:04:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 03/12] tcg/mips: Unify TCG_GUEST_BASE_REG tests
Date: Fri,  7 Apr 2023 20:03:50 -0700
Message-Id: <20230408030359.3368868-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

In tcg_out_qemu_ld/st, we already check for guest_base matching int16_t.
Mirror that when setting up TCG_GUEST_BASE_REG in the prologue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index cc4ca2ddbe..0ade890ade 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2622,7 +2622,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     }
 
 #ifndef CONFIG_SOFTMMU
-    if (guest_base) {
+    if (guest_base != (int16_t)guest_base) {
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
-- 
2.34.1


