Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2B5367D1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:03:00 +0200 (CEST)
Received: from localhost ([::1]:59076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugAl-0007aJ-6v
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefQ-0001fC-HO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefK-0005Hp-Ty
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:32 -0400
Received: by mail-pl1-x631.google.com with SMTP id s14so4808300plk.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewrvqu3ItgdWbFZfMwinbl01TKF1FfprQDHhclHqnAY=;
 b=ycjgGWNRQrIOcYEnAvIDRhbKe5/o4DuHh6aXAHpvanW2fNOAalKmT9uJrKyol07wqE
 F8uhF3N6vOcU6Y8CYKuJq+3qMP33mIyo3Lacti4GOEJLRvrzm8oDP4lmr72fBi8Aj9rI
 ileWfwQBRCVQTWLo7L7n207sVgJ4wV3DMilrYvZF2qTqnP0iDU12jNkdwwhyjo03ECPe
 5qVWIT0hFSEEhHO4M+mNfW2JUq7kCSkvwH4Le/bCI035RgaLeuIa6TccevGN+03qfUom
 Ka4g7XgzAGrMt1Z+0vyrhaoDHyU3iATyjD7oZExiutxtkkrpcoO6O7aXsDiUF1eTRs9V
 p4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewrvqu3ItgdWbFZfMwinbl01TKF1FfprQDHhclHqnAY=;
 b=lvFwY1K1iWx8fTPTuSC7hveFGt1xW+3kbbkgEpmN68hHJtbp0cRXgAETy3tdJNP6XU
 RnLYQpZAiOHzNEbPqIj4dBjOHCn/oDzEWufhCCWCGLQpAP2rIVxp5Pu7X3r8mocsmFrH
 62HNMnpR2ggh3JGtpMmijHFEMpweq590YY8SllB6rL7Fymq1MVjvfq9AcvpoupOzw90D
 Z27WjyBSf4KZypLO6DtfiTT8G+BuyyGANPYoHw1iuPfdTRABHRUeNAAte9ahvphWoWzI
 +U2tU3GpwgcmyqFbstLAxMmeVprVGSyzyP9uxIv8X1SVWZr9rZ+uu1slkxOn6EZBJCvM
 3r6Q==
X-Gm-Message-State: AOAM530OAqCeTJtpri0lYGisUNooTclRtH9FAjCZWTol/b5pjf01QQ+r
 eI61YfOeaftWiGRwAO4T6Teyp36eeEJltw==
X-Google-Smtp-Source: ABdhPJy6BKCmKhcFJVIdmm/QxrF0loeHkF1IHS9ZI4jTk1jV0fxRt82NYhM/GwgDr7zCb2hJ2yy9/w==
X-Received: by 2002:a17:902:da84:b0:161:d2d2:184d with SMTP id
 j4-20020a170902da8400b00161d2d2184dmr44653374plx.81.1653675984677; 
 Fri, 27 May 2022 11:26:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 082/114] target/arm: Use TRANS_FEAT for MOVPRFX
Date: Fri, 27 May 2022 11:18:35 -0700
Message-Id: <20220527181907.189259-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a040d694ea..6e8d8d54bf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6054,20 +6054,9 @@ static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a)
  * In the meantime, just emit the moves.
  */
 
-static bool trans_MOVPRFX(DisasContext *s, arg_MOVPRFX *a)
-{
-    return do_mov_z(s, a->rd, a->rn);
-}
-
-static bool trans_MOVPRFX_m(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
-}
-
-static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_movz_zpz(s, a->rd, a->rn, a->pg, a->esz, false);
-}
+TRANS_FEAT(MOVPRFX, aa64_sve, do_mov_z, a->rd, a->rn)
+TRANS_FEAT(MOVPRFX_m, aa64_sve, do_sel_z, a->rd, a->rn, a->rd, a->pg, a->esz)
+TRANS_FEAT(MOVPRFX_z, aa64_sve, do_movz_zpz, a->rd, a->rn, a->pg, a->esz, false)
 
 /*
  * SVE2 Integer Multiply - Unpredicated
-- 
2.34.1


