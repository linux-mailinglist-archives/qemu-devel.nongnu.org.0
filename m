Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D94438A9A
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 18:18:38 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1megCj-0000J0-6Z
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 12:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAt-00069a-0i; Sun, 24 Oct 2021 12:16:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAq-0008Db-3a; Sun, 24 Oct 2021 12:16:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z14so6953184wrg.6;
 Sun, 24 Oct 2021 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yP7BLA1h8Q3wRULGuTTgt/69jEjbxHvrn1EyN0eEB+I=;
 b=dIA/5dim4KbVkNv/T2pO2U2DYRwyozGNUfCOlH60rUK/P1FPH1MKseAMdrGjS6BKNk
 /QTvxfdDqFaCbxhy8dfcAfpCZTlz0GLFIEHt0LMxnNFL+fQ8aQbxDcE0gyY04Q3Mx1Mf
 JzStKyVn8+v/wiymBG4Y74vVHQ23rZIowbI45IVQsSOs3pMhFv5pfHJPHljgaUzpKe1E
 +PJ8HMk/uEU7FaH6+Z8OMddKdWeMhSn02tQOksj32kYeeNPOgudAHLFMYfGrfQupokZr
 VeYI38qRESxpPkcdpXtZZjjFVEuZieuni1QO+UOzfZWo0PF2nGeIw/Ebi84avAqMjo9V
 h8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yP7BLA1h8Q3wRULGuTTgt/69jEjbxHvrn1EyN0eEB+I=;
 b=LLp1ybMR1BhEjYiVfhnd2OhzAJnG6GscagedC+krffzzwXJCiQqOIIDD9OBOibjY9q
 HJ4i23TP6iJno6Jy5As/qy7ZldzVfgVbt0jZGG+pULnJBkPiwNcnNLpdmU8Hh7ksxzSc
 0Wg1iEkPpMjUD/cPDIxp4vJGZqSAFlwDece6+xAr5cEsMFpsptERqGnSEFTC1k7lnZOU
 RPkxPD/Dbc3auWry6p9/cZHYrGuEdFWJPW5kI+zJxHeFUsoK0aM2l/sV8xFQtBkuRoP8
 XSyNPEnECbrhOMZt7pQcrsKbqeKboOLW7GI1nRublMzgPxjkjS/EfSWi+LP8B83+KmG9
 0p9w==
X-Gm-Message-State: AOAM530yK6NjzrKFXlWvBwjz+KyRjwEKTnjwZSWFANqHAX5dDVkKjH6O
 /1ZmmSBHfoBYPRmtQoEETzZ+Yku9UHY=
X-Google-Smtp-Source: ABdhPJz3TSloNAOizdj6p2h4ZptplFg+2Y5RYo/atRMwpFoQz0uBVfmXh3JhI1nJ92Tl5Csh4H/l2Q==
X-Received: by 2002:a5d:6741:: with SMTP id l1mr16441144wrw.2.1635092196962;
 Sun, 24 Oct 2021 09:16:36 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f7sm12480783wmg.14.2021.10.24.09.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 09:16:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/ppc: Use tcg_constant_tl() in gen_op_cmp()
Date: Sun, 24 Oct 2021 18:16:18 +0200
Message-Id: <20211024161619.325903-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211024161619.325903-1-f4bug@amsat.org>
References: <20211024161619.325903-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving the compared values
to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/translate.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 518337bcb7f..507f6699f47 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1430,23 +1430,20 @@ static opc_handler_t invalid_handler = {
 static inline void gen_op_cmp(TCGv arg0, TCGv arg1, int s, int crf)
 {
     TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
     TCGv_i32 t = tcg_temp_new_i32();
 
-    tcg_gen_movi_tl(t0, CRF_EQ);
-    tcg_gen_movi_tl(t1, CRF_LT);
     tcg_gen_movcond_tl((s ? TCG_COND_LT : TCG_COND_LTU),
-                       t0, arg0, arg1, t1, t0);
-    tcg_gen_movi_tl(t1, CRF_GT);
+                       t0, arg0, arg1,
+                       tcg_constant_tl(CRF_LT), tcg_constant_tl(CRF_EQ));
     tcg_gen_movcond_tl((s ? TCG_COND_GT : TCG_COND_GTU),
-                       t0, arg0, arg1, t1, t0);
+                       t0, arg0, arg1,
+                       tcg_constant_tl(CRF_GT), t0);
 
     tcg_gen_trunc_tl_i32(t, t0);
     tcg_gen_trunc_tl_i32(cpu_crf[crf], cpu_so);
     tcg_gen_or_i32(cpu_crf[crf], cpu_crf[crf], t);
 
     tcg_temp_free(t0);
-    tcg_temp_free(t1);
     tcg_temp_free_i32(t);
 }
 
-- 
2.31.1


