Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C23ADCC5
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:26:54 +0200 (CEST)
Received: from localhost ([::1]:42306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup2r-0000g1-4f
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoy1-0005Jp-L6
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:54 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxx-0007zy-OA
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so10493960pjn.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mmktZg4SZs/Mbi17grMf/E2VN5NS9/M2R6nJtdGiSV4=;
 b=ym7QMcKC+GV5NZXg0I2JSlbF3SmV7V/VbtTKR/Rd/PfyBV8W40dBM9qJaoYixATZzZ
 eile7f4ZGVC6L9HA0rq2BKW+teV1+RQeqKpI5/kHMcL59wIA8q5Ae+vRjSS8a9v+FRsm
 w/Vx99UUwzPddja5gBsQgbWaDMg8NsCb3jKPHG85cjH2bCOPurWicVj22ilWhLXM14HQ
 beSKTXIlP5C+3JNpidrQZTfqItgC+/DWFbZiEpf1vyYdiHNUsEDE/ORL31wrjcSqhwGB
 5ajf3IBPNx6PJo0O/EU32k/eDNfTr3yjbsBx7N9emQfGRY8BOWnNNIgnKDCQtZeKzlKU
 YSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mmktZg4SZs/Mbi17grMf/E2VN5NS9/M2R6nJtdGiSV4=;
 b=bYhgsjUwdq72+UPLlYRzeWztBhvRnKwGBxSIBsGbR0KM7YDYujFAV/c52I6Aq1oRye
 aCVPkrgzXbqRXjaXQ2xYHzPFI74sQqQMc5xpbw+QnDi0ldYeB8AGwQyvpeAaOLnM6Ca3
 OlTItwRxgiGl6PAKnkw6FlqFZErOXB7ZYLTJ3HSEDd3vRdZiRZlnON6KOdC9mqFsRNPY
 pkEHZExwi2uzomOFSczyMJW4xqHD0+Yd1K/6GjAcMtIIcHodLDC2Rn0gngRKUqD3T6Z6
 KoCOVuevMmyw4X/2gonMyD0Er70bQ0sm67L9ybjRtrsRVnH8OeDxXqGixhpOiH0IMSwR
 lk5g==
X-Gm-Message-State: AOAM530f8MUmzpDZOrxiJVCVIoILUthFb2t9lKvPzIKn+Xa40PuI5IlX
 tsjLtGh4ABStphM5YhyaoKqtqOwfpaeftA==
X-Google-Smtp-Source: ABdhPJz1nptRnDqh6tvJqOnQrFo65NdXex1JaUmsj64nSLJFSDpCqtA+Wbs7ZCsY5XnzwShv5UcUig==
X-Received: by 2002:a17:90a:d598:: with SMTP id
 v24mr18803360pju.185.1624162908257; 
 Sat, 19 Jun 2021 21:21:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] target/cris: Use movcond for t_gen_cc_jmp
Date: Sat, 19 Jun 2021 21:21:40 -0700
Message-Id: <20210620042141.1235541-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is better than branch around assignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 3515c21b7b..e4cbc35ebd 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -516,13 +516,9 @@ static void t_gen_swapr(TCGv d, TCGv s)
 
 static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
 {
-    TCGLabel *l1 = gen_new_label();
-
     /* Conditional jmp.  */
-    tcg_gen_mov_tl(env_pc, pc_false);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
-    tcg_gen_mov_tl(env_pc, pc_true);
-    gen_set_label(l1);
+    tcg_gen_movcond_tl(TCG_COND_NE, env_pc, env_btaken, tcg_constant_tl(0),
+                       pc_true, pc_false);
 }
 
 static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
-- 
2.25.1


